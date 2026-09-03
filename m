Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB49390CAA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427180; cv=none; b=oASMb2IDFlDlBlxQrhildzbbCw6feS/c5+NIkwzNsqQkufu+AV3WGHWC4X7LIbWMvhG28ikFIDXiBz5Bg8uFCES3uDQXiSLNWL6B8//BuMkKt4x7sCfvB7mvTl5sjnjexpzHdPvMNEVgil2YkEOUNXct9907dhrZRPqZnEDRHMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427180; c=relaxed/simple;
	bh=lH2wi6k7T/+rNA0+jRTNF7xHF/VOducs9ROAeMFyAjo=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=jJQug/L6jCYeyi/zOC/cvV/cLNsPSZXRLDpgwyTg5dm1SC7rCPd/+S/ikCaWrk3SqwA7nfnxRD/iaZlpga6etJKiUJFyBN3nxi2B/x1mBTsKQT755L3btyQonf16uMlFWBweWreUuHQxFBYJ4MhyFjlTMxUmm+0P2rIAkvO/oaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kzl36y2b; arc=none smtp.client-ip=95.215.58.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kzl36y2b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lH2wi6k7T/+rNA0+jRTNF7xHF/VOducs9ROAeMFyAjo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788427175; v=1; x=1789031975;
 b=Kzl36y2bji3uZ81RjzHqGt9IuQ5aAjv5PtC0bllSsozXOXj+wbAQl21JD0cDRrpAXXIkrdDR
 ehupjLc3kKeTUobA3Z5/wpj5CGraRyMBagyCsKCeRExAT5m50IEO9c0eNGwsJlz8tHlxe3qVcvW
 zjrufsD8MdXrVo2GQJyg2koc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f00fad77782ebcbc;
	Thu, 03 Sep 2026 09:19:35 +0000
X-Mizu-Trace-ID: f00fad77782ebcbc
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 09:19:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <7848fcb635963ddb8474924ed71fdd687b5d6ec7@linux.dev>
TLS-Required: No
Subject: [PATCH v2] staging: rtl8723bs: fix protected RX frame validation in
 decrypt path
To: gregkh@linuxfoundation.org, hansg@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org

From ee6c5863754274f8dc40461adb5e5a98566aed58 Mon Sep 17 00:00:00 2001
From: Tianchu Chen <flynnnchen@tencent.com>
Date: Wed, 19 Aug 2026 21:55:30 +0800
Subject: [PATCH v2] staging: rtl8723bs: fix protected RX frame validation=
 in decrypt path

Resending this because a real device has been purchased from the
second-hand market and confirms the bug is triggerable; details see below=
.

The RX software decrypt path mishandles crafted protected frames from a
malicious AP in two ways:

1) decryptor() never checks that a protected frame is long enough to
hold the 802.11 header plus the per-cipher trailer.  All of
rtw_wep_decrypt(), rtw_tkip_decrypt() and rtw_aes_decrypt() compute

	length =3D hdr.len - hdrlen - iv_len;

and act on the result, and recvframe_chkmic() similarly computes

	datalen =3D hdr.len - hdrlen - iv_len - icv_len - 8;

for TKIP (the 8-byte Michael MIC is not accounted for in icv_len).
A frame shorter than hdrlen + iv_len + icv_len (+ 8 for TKIP) underflows
these unsigned subtractions, turning into a ~4 GiB iteration count in
aes_decipher()/arc4_crypt()/rtw_seccalctkipmic() or a ~4 GiB crc32_le()
length, causing out-of-bounds reads/writes of up to ~4 GiB starting from
the rx skb.  Reject such frames in decryptor() before touching the IV;
this covers all three ciphers and the TKIP MIC check, and also keeps the
unconditional iv[3] access within the frame.

2) validate_80211w_mgmt() keeps using the frame - two memcpys through
the stale rx_data pointer and a pkt_len update - before checking
whether decryptor() returned NULL.  On decrypt failure (e.g. a unicast
protected deauth/disassoc/action frame with a bad MIC, which this path
always software-decrypts) the skb has already been freed, so this is a
use-after-free read/write, and the caller's error path frees the frame
a second time, drifting free_recvframe_cnt.  Bail out immediately when
decryptor() fails, freeing the temporary mgmt_DATA buffer first.

Discovered by Atuin - Automated Vulnerability Discovery Engine.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
---
v2: no code change; adds the real-hardware test report requested for
LLM-assisted staging patches.

Test report
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Victim:   Wintel CX-W8 mini PC (Atom Z3735F, on-board RTL8723BS chip, sta=
ging r8723bs,
          Debian 13.6.0/Kernel 6.12.94), bought from the second-hand mark=
et for this
          test.
Attacker: ESP32-S3 dev board running custom firmware as a rogue AP. Patch=
ing a proprietary
          library is needed. Details available to reviewers upon request.

The decryptor bug is reachable at the association stage: the vulnerable d=
ecrypt
path is taken before any key is installed, so the attacker never needs
to pass key verification - the rogue AP's PSK does not need to match
the victim's. Knowing an SSID the victim will auto-join is enough.

Once the victim associates, the rogue AP send 802.11 data frames
with FromDS + Protected bit set and a total length of 24..31 bytes,
i.e. shorter than their own CCMP IV (hdrlen 24 + iv_len 8).  With no
key in the HW CAM the frames reach decryptor() with bdecrypted =3D=3D 0,
and rtw_aes_decrypt() computes length =3D (24..31) - 24 - 8, a ~4 GiB
underflow fed straight into aes_decipher().

Result: the victim kernel panics within seconds of association.
Captured via netconsole:

[  939.937797] Oops: general protection fault, probably for non-canonical=
 address 0x6de15a87d1c57856: 0000 [#1] PREEMPT SMP PTI
[  939.938075] CPU: 3 UID: 0 PID: 1637 Comm: Xorg Tainted: G         C   =
      6.12.94+deb13-amd64 #1  Debian 6.12.94-1
[  939.938288] Tainted: [C]=3DCRAP
[  939.938368] Hardware name: Insyde Intel CX-W8/Intel CX-W8, BIOS M.W8RA=
AA01 04/17/2015
[  939.938515] RIP: 0010:i915_gem_do_execbuffer+0xbd1/0x2950 [i915]
[  939.939945] Code: e2 fe 48 89 50 20 48 8d 74 24 58 4c 89 e9 48 8d 7c 2=
4 60 44 89 f2 e8 ce c2 ff ff 85 c0 0f 85 9d 03 00 00 49 8b bd b8 00 00 00=
 <48> 83 bf 50 04 00 00 00 74 31 e8 10 1b 01 00 85 c0 0f 85 91 18 00
[  939.940255] RSP: 0018:ffffccdfc0b17788 EFLAGS: 00010246
[  939.940382] RAX: 0000000000000000 RBX: 0000000000000009 RCX: 00000000f=
ffffff5
[  939.940524] RDX: 0000000000000001 RSI: ffff8c5aa8d4d800 RDI: 6de15a87d=
1c57406
[  939.940664] RBP: 00000000000001f8 R08: ffff8c5aa92e4a90 R09: ffff8c5aa=
a953518
[  939.940805] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
00003a9
[  939.940942] R13: ffff8c5af99f1680 R14: 0000000000000009 R15: 000000000=
0000000
[  939.941081] FS:  00007f3856594b00(0000) GS:ffff8c5afb980000(0000) knlG=
S:0000000000000000
[  939.941238] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  939.941358] CR2: 00007f3856155770 CR3: 000000002b7e6000 CR4: 000000000=
01026f0
[  939.941500] Call Trace:
[  939.941579]  <TASK>
[  939.941702]  i915_gem_execbuffer2_ioctl+0x13b/0x260 [i915]
[  939.943134]  ? __pfx_i915_gem_execbuffer2_ioctl+0x10/0x10 [i915]
[  939.944543]  drm_ioctl_kernel+0xb0/0x100 [drm]
[  939.945069]  drm_ioctl+0x277/0x4d0 [drm]
[  939.945571]  ? __pfx_i915_gem_execbuffer2_ioctl+0x10/0x10 [i915]
[  939.946997]  __x64_sys_ioctl+0x97/0xc0
[  939.947119]  do_syscall_64+0x87/0x1b0
[  939.947235]  ? timerqueue_del+0x2e/0x50
[  939.947343]  ? tomoyo_init_request_info+0x99/0xc0
[  939.947470]  ? tomoyo_path_number_perm+0x8c/0x1f0
[  939.947589]  ? ww_mutex_lock_interruptible+0x18/0x80
[  939.947725]  ? i915_gem_madvise_ioctl+0x239/0x340 [i915]
[  939.949150]  ? __pfx_i915_gem_madvise_ioctl+0x10/0x10 [i915]
[  939.950571]  ? drm_ioctl_kernel+0xb0/0x100 [drm]
[  939.951086]  ? __check_object_size+0x50/0x210
[  939.955215]  ? _copy_to_user+0x36/0x50
[  939.959506]  ? drm_ioctl+0x2a1/0x4d0 [drm]
[  939.964159]  ? __pfx_i915_gem_madvise_ioctl+0x10/0x10 [i915]
[  939.969804]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
[  939.974146]  ? syscall_exit_to_user_mode+0x37/0x1b0
[  939.978488]  ? do_syscall_64+0x93/0x1b0
[  939.982872]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
[  939.987300]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  939.991768] RIP: 0033:0x7f385691491b
[  939.996285] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05=
 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[  940.001138] RSP: 002b:00007ffdb0cf6710 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
[  940.006061] RAX: ffffffffffffffda RBX: 0000564e32defb08 RCX: 00007f385=
691491b
[  940.011048] RDX: 00007ffdb0cf6790 RSI: 0000000040406469 RDI: 000000000=
0000013
[  940.016090] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000004
[  940.021150] R10: 0000000000000020 R11: 0000000000000246 R12: 00007ffdb=
0cf6790
[  940.026256] R13: 0000564e32dc3a50 R14: 00000000000000dc R15: 000000000=
0000013
[  940.031431]  </TASK>

The oops surfacing in i915 rather than in the driver is expected:
A non-canonical garbage pointer in an unrelated subsystem is the expected
signature of the multi-GB linear decipher starting from the rx skb.

 drivers/staging/rtl8723bs/core/rtw_recv.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
index 7568fc514d7ce..4756e0fedd46f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -426,8 +426,21 @@ static union recv_frame *decryptor(struct adapter *p=
adapter, union recv_frame *p
 	u32  res =3D _SUCCESS;
=20
=20	if (prxattrib->encrypt > 0) {
-		u8 *iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
+		u8 *iv;
+		u32 min_len =3D prxattrib->hdrlen + prxattrib->iv_len + prxattrib->icv=
_len;
=20
+=09	/* TKIP appends an 8-byte Michael MIC that icv_len doesn't account f=
or */
+		if (prxattrib->encrypt =3D=3D _TKIP_)
+			min_len +=3D 8;
+
+		/* a protected frame must be long enough to hold the IV and ICV/MIC */
+		if (precv_frame->u.hdr.len < min_len) {
+			rtw_free_recvframe(precv_frame,
+					   &padapter->recvpriv.free_recv_queue);
+			return NULL;
+		}
+
+		iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
 		prxattrib->key_index =3D (((iv[3]) >> 6) & 0x3);
=20
=20		if (prxattrib->key_index > WEP_KEYS) {
@@ -1395,6 +1408,10 @@ static signed int validate_80211w_mgmt(struct adap=
ter *adapter, union recv_frame
 			if (!mgmt_DATA)
 				goto validate_80211w_fail;
 			precv_frame =3D decryptor(adapter, precv_frame);
+			if (!precv_frame) {
+				kfree(mgmt_DATA);
+				goto validate_80211w_fail;
+			}
 			/* save actual management data frame body */
 			memcpy(mgmt_DATA, ptr + pattrib->hdrlen + pattrib->iv_len, data_len);
 			/* overwrite the iv field */
@@ -1402,8 +1419,6 @@ static signed int validate_80211w_mgmt(struct adapt=
er *adapter, union recv_frame
 			/* remove the iv and icv length */
 			pattrib->pkt_len =3D pattrib->pkt_len - pattrib->iv_len - pattrib->ic=
v_len;
 			kfree(mgmt_DATA);
-			if (!precv_frame)
-				goto validate_80211w_fail;
 		} else if (is_multicast_ether_addr(GetAddr1Ptr(ptr)) &&
 			(subtype =3D=3D WIFI_DEAUTH || subtype =3D=3D WIFI_DISASSOC)) {
 			signed int BIP_ret =3D _SUCCESS;
--=20
2.51.0

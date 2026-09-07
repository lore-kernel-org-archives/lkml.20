Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BA0514754;
	Mon,  7 Sep 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797721; cv=none; b=kCED8+eC0TsVpMbYAlQvdpJ4OrcmC2STlSkOlJU0OzLwdIxjTLOPb/mz6Kq3ToG8hahiw6njzYMuInBzYk5Gng7xUn5CS80LNOWlB8pbFuFXT4U4HgyWlHKrXUvXhDhHlw1t7+sIpw1mtSaWgf//cDPc/jwwp89N0SNnFt9/hGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797721; c=relaxed/simple;
	bh=0l9vtCpqTiQfwXUm5fl8kAfYVS4ZWUA2uAeCimHOSSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HI6zVT6QO9G8Q9SQK90UUIQrsLoCl68hCjDyVxXMmnH5R6QbaSvLv3GRq6PiCvkv2XEs99J9201Gjok5xbUGf0yu7aiQpYwMYZqn7LUbGw+MKJKKv9cbrb2GMnQasOeNN0cSJ+EDH2tlzvylTwaraGYJEEi6/zkQ9XlxV3NAIMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tiJJ7xHf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tiJJ7xHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912FC1F00A3A;
	Mon,  7 Sep 2026 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788797719;
	bh=jGqM8uKTVM4OMgp5yQA5rba96aarKqsHIF0ObN4+ZBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tiJJ7xHflZYZLhz0VJHAH1NxKkmePXSz5vYVTaZnf+mGA+YYNGRbQicjBw9OmqSds
	 KqzAeny4i6wA43Or6raCRrJrTdZWm7UdxO8fEvTovtTU3+pZ/PT5ncFbSo07B/N8Hm
	 qyvgPykbXbDs4Q2mpuZBhxFojYB5s3HerHNEELGk=
Date: Mon, 7 Sep 2026 18:13:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tianchu Chen <tianchu.chen@linux.dev>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix protected RX frame validation
 in decrypt path
Message-ID: <2026090714-sneezing-unrated-b0ef@gregkh>
References: <7848fcb635963ddb8474924ed71fdd687b5d6ec7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7848fcb635963ddb8474924ed71fdd687b5d6ec7@linux.dev>

On Thu, Sep 03, 2026 at 09:19:34AM +0000, Tianchu Chen wrote:
> >From ee6c5863754274f8dc40461adb5e5a98566aed58 Mon Sep 17 00:00:00 2001
> From: Tianchu Chen <flynnnchen@tencent.com>
> Date: Wed, 19 Aug 2026 21:55:30 +0800
> Subject: [PATCH v2] staging: rtl8723bs: fix protected RX frame validation in decrypt path

This shouldn't be in the body of the email.

> Resending this because a real device has been purchased from the
> second-hand market and confirms the bug is triggerable; details see below.

This shouldn't be here either, it goes below the --- line.


> 
> The RX software decrypt path mishandles crafted protected frames from a
> malicious AP in two ways:
> 
> 1) decryptor() never checks that a protected frame is long enough to
> hold the 802.11 header plus the per-cipher trailer.  All of
> rtw_wep_decrypt(), rtw_tkip_decrypt() and rtw_aes_decrypt() compute
> 
> 	length = hdr.len - hdrlen - iv_len;
> 
> and act on the result, and recvframe_chkmic() similarly computes
> 
> 	datalen = hdr.len - hdrlen - iv_len - icv_len - 8;
> 
> for TKIP (the 8-byte Michael MIC is not accounted for in icv_len).
> A frame shorter than hdrlen + iv_len + icv_len (+ 8 for TKIP) underflows
> these unsigned subtractions, turning into a ~4 GiB iteration count in
> aes_decipher()/arc4_crypt()/rtw_seccalctkipmic() or a ~4 GiB crc32_le()
> length, causing out-of-bounds reads/writes of up to ~4 GiB starting from
> the rx skb.  Reject such frames in decryptor() before touching the IV;
> this covers all three ciphers and the TKIP MIC check, and also keeps the
> unconditional iv[3] access within the frame.
> 
> 2) validate_80211w_mgmt() keeps using the frame - two memcpys through
> the stale rx_data pointer and a pkt_len update - before checking
> whether decryptor() returned NULL.  On decrypt failure (e.g. a unicast
> protected deauth/disassoc/action frame with a bad MIC, which this path
> always software-decrypts) the skb has already been freed, so this is a
> use-after-free read/write, and the caller's error path frees the frame
> a second time, drifting free_recvframe_cnt.  Bail out immediately when
> decryptor() fails, freeing the temporary mgmt_DATA buffer first.
> 
> Discovered by Atuin - Automated Vulnerability Discovery Engine.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Assisted-by: LLM
> Cc: stable@vger.kernel.org
> Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> ---
> v2: no code change; adds the real-hardware test report requested for
> LLM-assisted staging patches.
> 
> Test report
> =========================
> 
> Victim:   Wintel CX-W8 mini PC (Atom Z3735F, on-board RTL8723BS chip, staging r8723bs,
>           Debian 13.6.0/Kernel 6.12.94), bought from the second-hand market for this
>           test.
> Attacker: ESP32-S3 dev board running custom firmware as a rogue AP. Patching a proprietary
>           library is needed. Details available to reviewers upon request.
> 
> The decryptor bug is reachable at the association stage: the vulnerable decrypt
> path is taken before any key is installed, so the attacker never needs
> to pass key verification - the rogue AP's PSK does not need to match
> the victim's. Knowing an SSID the victim will auto-join is enough.
> 
> Once the victim associates, the rogue AP send 802.11 data frames
> with FromDS + Protected bit set and a total length of 24..31 bytes,
> i.e. shorter than their own CCMP IV (hdrlen 24 + iv_len 8).  With no
> key in the HW CAM the frames reach decryptor() with bdecrypted == 0,
> and rtw_aes_decrypt() computes length = (24..31) - 24 - 8, a ~4 GiB
> underflow fed straight into aes_decipher().
> 
> Result: the victim kernel panics within seconds of association.
> Captured via netconsole:
> 
> [  939.937797] Oops: general protection fault, probably for non-canonical address 0x6de15a87d1c57856: 0000 [#1] PREEMPT SMP PTI
> [  939.938075] CPU: 3 UID: 0 PID: 1637 Comm: Xorg Tainted: G         C         6.12.94+deb13-amd64 #1  Debian 6.12.94-1
> [  939.938288] Tainted: [C]=CRAP
> [  939.938368] Hardware name: Insyde Intel CX-W8/Intel CX-W8, BIOS M.W8RAAA01 04/17/2015
> [  939.938515] RIP: 0010:i915_gem_do_execbuffer+0xbd1/0x2950 [i915]
> [  939.939945] Code: e2 fe 48 89 50 20 48 8d 74 24 58 4c 89 e9 48 8d 7c 24 60 44 89 f2 e8 ce c2 ff ff 85 c0 0f 85 9d 03 00 00 49 8b bd b8 00 00 00 <48> 83 bf 50 04 00 00 00 74 31 e8 10 1b 01 00 85 c0 0f 85 91 18 00
> [  939.940255] RSP: 0018:ffffccdfc0b17788 EFLAGS: 00010246
> [  939.940382] RAX: 0000000000000000 RBX: 0000000000000009 RCX: 00000000fffffff5
> [  939.940524] RDX: 0000000000000001 RSI: ffff8c5aa8d4d800 RDI: 6de15a87d1c57406
> [  939.940664] RBP: 00000000000001f8 R08: ffff8c5aa92e4a90 R09: ffff8c5aaa953518
> [  939.940805] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000003a9
> [  939.940942] R13: ffff8c5af99f1680 R14: 0000000000000009 R15: 0000000000000000
> [  939.941081] FS:  00007f3856594b00(0000) GS:ffff8c5afb980000(0000) knlGS:0000000000000000
> [  939.941238] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  939.941358] CR2: 00007f3856155770 CR3: 000000002b7e6000 CR4: 00000000001026f0
> [  939.941500] Call Trace:
> [  939.941579]  <TASK>
> [  939.941702]  i915_gem_execbuffer2_ioctl+0x13b/0x260 [i915]
> [  939.943134]  ? __pfx_i915_gem_execbuffer2_ioctl+0x10/0x10 [i915]
> [  939.944543]  drm_ioctl_kernel+0xb0/0x100 [drm]
> [  939.945069]  drm_ioctl+0x277/0x4d0 [drm]
> [  939.945571]  ? __pfx_i915_gem_execbuffer2_ioctl+0x10/0x10 [i915]
> [  939.946997]  __x64_sys_ioctl+0x97/0xc0
> [  939.947119]  do_syscall_64+0x87/0x1b0
> [  939.947235]  ? timerqueue_del+0x2e/0x50
> [  939.947343]  ? tomoyo_init_request_info+0x99/0xc0
> [  939.947470]  ? tomoyo_path_number_perm+0x8c/0x1f0
> [  939.947589]  ? ww_mutex_lock_interruptible+0x18/0x80
> [  939.947725]  ? i915_gem_madvise_ioctl+0x239/0x340 [i915]
> [  939.949150]  ? __pfx_i915_gem_madvise_ioctl+0x10/0x10 [i915]
> [  939.950571]  ? drm_ioctl_kernel+0xb0/0x100 [drm]
> [  939.951086]  ? __check_object_size+0x50/0x210
> [  939.955215]  ? _copy_to_user+0x36/0x50
> [  939.959506]  ? drm_ioctl+0x2a1/0x4d0 [drm]
> [  939.964159]  ? __pfx_i915_gem_madvise_ioctl+0x10/0x10 [i915]
> [  939.969804]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
> [  939.974146]  ? syscall_exit_to_user_mode+0x37/0x1b0
> [  939.978488]  ? do_syscall_64+0x93/0x1b0
> [  939.982872]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
> [  939.987300]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  939.991768] RIP: 0033:0x7f385691491b
> [  939.996285] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [  940.001138] RSP: 002b:00007ffdb0cf6710 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  940.006061] RAX: ffffffffffffffda RBX: 0000564e32defb08 RCX: 00007f385691491b
> [  940.011048] RDX: 00007ffdb0cf6790 RSI: 0000000040406469 RDI: 0000000000000013
> [  940.016090] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000004
> [  940.021150] R10: 0000000000000020 R11: 0000000000000246 R12: 00007ffdb0cf6790
> [  940.026256] R13: 0000564e32dc3a50 R14: 00000000000000dc R15: 0000000000000013
> [  940.031431]  </TASK>
> 
> The oops surfacing in i915 rather than in the driver is expected:
> A non-canonical garbage pointer in an unrelated subsystem is the expected
> signature of the multi-GB linear decipher starting from the rx skb.
> 
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 7568fc514d7ce..4756e0fedd46f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -426,8 +426,21 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
>  	u32  res = _SUCCESS;
>  
>  	if (prxattrib->encrypt > 0) {
> -		u8 *iv = precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
> +		u8 *iv;
> +		u32 min_len = prxattrib->hdrlen + prxattrib->iv_len + prxattrib->icv_len;

Why will this not overflow?

>  
> +		/* TKIP appends an 8-byte Michael MIC that icv_len doesn't account for */
> +		if (prxattrib->encrypt == _TKIP_)
> +			min_len += 8;
> +
> +		/* a protected frame must be long enough to hold the IV and ICV/MIC */
> +		if (precv_frame->u.hdr.len < min_len) {
> +			rtw_free_recvframe(precv_frame,
> +					   &padapter->recvpriv.free_recv_queue);
> +			return NULL;
> +		}
> +
> +		iv = precv_frame->u.hdr.rx_data + prxattrib->hdrlen;

What prevents this from overflowing?

thanks,

greg k-h

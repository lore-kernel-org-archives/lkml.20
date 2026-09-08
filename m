Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD45C579829
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883342; cv=none; b=dKp0okvuq2ycAGfcWuXPjRjWDzss1vCqMguo0b/M6q+O2/icxHLVdQRj9hTNdT7g7MW430uDKwT453/dMhK3p3PuyYeuNDHhvhPkZyloGz3EEjKUHWvUAn4sKE/5GM+UMqqZuiebbEW548JuDL9L6VRVXGWdbEj4WG1Csq+fzyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883342; c=relaxed/simple;
	bh=KYOUd2P6kAd8a+UBCiIUa1mr5xWgXanrBxIfJjm/KtE=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=EvnK8qNNAL5CdDq/T8CUxjn2rFBYWct0+D9ptg5lrhWxscsfgKtXt65tyF6Ssal3bwRBYL6R+mAWC2BSezKEWILEPUNw2fatazIRP/PNXZrgzFTuP3+N/kZ9nREefAUP/EbdKw9/krNPUdDLnoZaDWBtgh7cLlJWHw9koTFr2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BseIsBf1; arc=none smtp.client-ip=95.215.58.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BseIsBf1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KYOUd2P6kAd8a+UBCiIUa1mr5xWgXanrBxIfJjm/KtE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788883337; v=1; x=1789488137;
 b=BseIsBf1mZc5LE0Qhdg7lDC08rjQinZD8wc1ByZBkezgrFOkadvKleNMILzb3DcbELI9+59q
 2v2zRWccBMoW2edzdkg07hxRPWb5u0adJvvVOBibR2hke/UE4alJVRHONflMaDRpfp/FTpjYxPF
 GDpA8YfQ6wRAfBbX9qcrT53g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2cc85f100057596d;
	Tue, 08 Sep 2026 16:02:17 +0000
X-Mizu-Trace-ID: 2cc85f100057596d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 16:02:15 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <aa1496d71e0867c1e04f6442ab97520f531531ca@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] staging: rtl8723bs: fix protected RX frame validation
  in decrypt path
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <2026090714-sneezing-unrated-b0ef@gregkh>
References: <7848fcb635963ddb8474924ed71fdd687b5d6ec7@linux.dev>
 <2026090714-sneezing-unrated-b0ef@gregkh>

September 8, 2026 at 12:13 AM, "Greg KH" <gregkh@linuxfoundation.org mail=
to:gregkh@linuxfoundation.org?to=3D%22Greg%20KH%22%20%3Cgregkh%40linuxfou=
ndation.org%3E > wrote:


-snip-

> >=20=20
>=20>  drivers/staging/rtl8723bs/core/rtw_recv.c | 21 ++++++++++++++++++-=
--
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >=20=20
>=20>  diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/s=
taging/rtl8723bs/core/rtw_recv.c
> >  index 7568fc514d7ce..4756e0fedd46f 100644
> >  --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> >  +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> >  @@ -426,8 +426,21 @@ static union recv_frame *decryptor(struct adapt=
er *padapter, union recv_frame *p
> >  u32 res =3D _SUCCESS;
> >=20=20
>=20>  if (prxattrib->encrypt > 0) {
> >  - u8 *iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
> >  + u8 *iv;
> >  + u32 min_len =3D prxattrib->hdrlen + prxattrib->iv_len + prxattrib-=
>icv_len;
> >=20
>=20Why will this not overflow?

The overflow(without this fix) happens inside the per-suite decrypt routi=
nes
when a received frame is shorter than this minimum. For example:

rtw_aes_decrypt() computes length =3D len - hdrlen - iv_len, so a
30-byte frame with hdrlen =3D 26 and iv_len =3D 8 wraps length to ~4GiB,
and aes_decipher() then iterates num_blocks =3D (plen - 8) / 16 16-byte
blocks, reading and writing gigabytes past the skb.

The WEP and TKIP decryptors start from the same subtraction and
underflow the same way.=20

min_len=20is the minimum size of a legitimate protected frame: header +
IV + ICV, plus the 8-byte Michael MIC for TKIP.

The min_len computation itself cannot wrap either: all three
addends are u8 fields, hdrlen is at most 36 and iv_len/icv_len are
per-suite constants (max 18/16), so the sum stays below 80 even with
the TKIP +8. A frame shorter than min_len cannot even hold its IV
and ICV, so only malformed frames are dropped.


> >=20
>=20> + /* TKIP appends an 8-byte Michael MIC that icv_len doesn't accoun=
t for */
> >  + if (prxattrib->encrypt =3D=3D _TKIP_)
> >  + min_len +=3D 8;
> >  +
> >  + /* a protected frame must be long enough to hold the IV and ICV/MI=
C */
> >  + if (precv_frame->u.hdr.len < min_len) {
> >  + rtw_free_recvframe(precv_frame,
> >  + &padapter->recvpriv.free_recv_queue);
> >  + return NULL;
> >  + }
> >  +
> >  + iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
> >=20
>=20What prevents this from overflowing?

The check above keeps the offset within the frame: it guarantees
len >=3D hdrlen + iv_len + icv_len, and iv_len >=3D 4 for every suite, so
len >=3D hdrlen + 4 and both iv and the iv[3] dereference stay within the
first len bytes ([rx_data, rx_data + len)).


Those len bytes are in turn inside the allocation: hdr.len is set by
recvframe_put() only after pkt_exceeds_tail() verified that pkt_len
bytes were actually copied from the RX FIFO into an skb sized for
them (rtl8723bs_recv.c), so any offset below len is inside the
buffer.

This is also why the iv assignment moved: the iv[3] read that follows
it would otherwise be an out-of-bounds read when the frame is shorter
than hdrlen + 4. The IV may only be examined once the frame is known
to actually contain it.


>=20
>=20thanks,
>=20
>=20greg k-h
>

Regarding the format issue being mentioned earlier, I can send a v3
patch. Also, I believe decryptor() is also where this check should belong=
s.=20

It=20is the head of the whole post-handle pipeline
(decryptor -> chk_defrag -> portctrl -> indicate, rtw_recv.c:2082+),
so one check covers not just the three decrypt routines but every
later consumer of hdrlen + iv_len offsets. For TKIP the invariant
has to hold before both stages of the WPA model - decryption and
the Michael MIC verification in recvframe_chkmic(), which subtracts
8 more; the +8 in min_len exists for that second stage, and
decryptor() is the only point preceding both.

This matches the WPA model in mac80211: both
ieee80211_crypto_tkip_decrypt() and ieee80211_crypto_ccmp_decrypt()
reject frames too short for header + IV + ICV/MIC at their entry
(net/mac80211/wpa.c).

Since I have the real hardware, I can also verify the execution flow
at runtime with a build that adds a temporary printk in this path if
that would help.

Please let me know if a v3 is needed, or if there is any further
verification you would like me to do on my side.

Best regards,

Tianchu

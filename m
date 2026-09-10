Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9134C3C3459
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029683; cv=none; b=osLO7KMiy2rAb5eyPpkBqnjsSsafyW9heo0ZTBggXYacrOyREXuwBUKDUyRDKfLwkAHD7nS7fqt+af+/IkntNfCRo0Te8hq2WyIRDiXTxHQHkNA55ypBVBn0xjT5LOjNtZPDyIjzAx3i1srzzro0mosgH5neRpxg5usYxp4oOBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029683; c=relaxed/simple;
	bh=qylLZ1SIaMrhXfONKdy81GiXEDGBxa/m+KiPwamBoKg=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=kaXCo7URCMIlHLM7iVNzndNsKxkQp1IEbwW8Q+2DIxGpj0ju73U+irqjEVmXC+OACaj3rLdQUs5yzyMVIyxHeERs7Ho7TkTxIRo4lqq9azgjbFnuHW9zsGdGNGLNaDxXqRp+lxV22NEkn/jZKxCSLwr+pwbDfIxub50dcXae724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qobnmHrx; arc=none smtp.client-ip=91.218.175.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qobnmHrx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qylLZ1SIaMrhXfONKdy81GiXEDGBxa/m+KiPwamBoKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789029677; v=1; x=1789634477;
 b=qobnmHrxMG+4H012iOBuF07zQsO4/TOO6UL9EFBAjwypFoxRq1A3MaGrCfB3YEKXOkmRbKlS
 z+wifzOWw3pNk6/R2C9bqC+fHLKitgVKYuR63G+2+UoKUdljTnOKlshI1UQ8YRJbPs29EPVv8ft
 Y7mtZoHxoGitX6Yx/dKKh5jI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 502bbddc9c24ce59;
	Thu, 10 Sep 2026 08:41:17 +0000
X-Mizu-Trace-ID: 502bbddc9c24ce59
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 08:41:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <7d58756ac12f7b324c2d8693b03287b786020fd6@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] staging: rtl8723bs: fix protected RX frame validation
 in decrypt path
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <2026090919-stammer-outclass-5c6f@gregkh>
References: <7848fcb635963ddb8474924ed71fdd687b5d6ec7@linux.dev>
 <2026090714-sneezing-unrated-b0ef@gregkh>
 <aa1496d71e0867c1e04f6442ab97520f531531ca@linux.dev>
 <2026090919-stammer-outclass-5c6f@gregkh>

September 9, 2026 at 3:44 PM, "Greg KH" <gregkh@linuxfoundation.org mailt=
o:gregkh@linuxfoundation.org?to=3D%22Greg%20KH%22%20%3Cgregkh%40linuxfoun=
dation.org%3E > wrote:


>=20
>=20On Tue, Sep 08, 2026 at 04:02:15PM +0000, Tianchu Chen wrote:
>=20
>=20>=20
>=20> September 8, 2026 at 12:13 AM, "Greg KH" <gregkh@linuxfoundation.or=
g mailto:gregkh@linuxfoundation.org?to=3D%22Greg%20KH%22%20%3Cgregkh%40li=
nuxfoundation.org%3E > wrote:
> >=20=20
>=20>=20=20
>=20>  -snip-
> >=20=20
>=20>  >=20
>=20>  > drivers/staging/rtl8723bs/core/rtw_recv.c | 21 +++++++++++++++++=
+---
> >  > 1 file changed, 18 insertions(+), 3 deletions(-)
> >  >=20
>=20>  > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers=
/staging/rtl8723bs/core/rtw_recv.c
> >  > index 7568fc514d7ce..4756e0fedd46f 100644
> >  > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> >  > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> >  > @@ -426,8 +426,21 @@ static union recv_frame *decryptor(struct ada=
pter *padapter, union recv_frame *p
> >  > u32 res =3D _SUCCESS;
> >  >=20
>=20>  > if (prxattrib->encrypt > 0) {
> >  > - u8 *iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
> >  > + u8 *iv;
> >  > + u32 min_len =3D prxattrib->hdrlen + prxattrib->iv_len + prxattri=
b->icv_len;
> >  >=20
>=20>  Why will this not overflow?
> >=20=20
>=20>  The overflow(without this fix) happens inside the per-suite decryp=
t routines
> >  when a received frame is shorter than this minimum. For example:
> >=20=20
>=20>  rtw_aes_decrypt() computes length =3D len - hdrlen - iv_len, so a
> >  30-byte frame with hdrlen =3D 26 and iv_len =3D 8 wraps length to ~4=
GiB,
> >  and aes_decipher() then iterates num_blocks =3D (plen - 8) / 16 16-b=
yte
> >  blocks, reading and writing gigabytes past the skb.
> >=20=20
>=20>  The WEP and TKIP decryptors start from the same subtraction and
> >  underflow the same way.=20
>=20>=20=20
>=20>  min_len is the minimum size of a legitimate protected frame: heade=
r +
> >  IV + ICV, plus the 8-byte Michael MIC for TKIP.
> >=20=20
>=20>  The min_len computation itself cannot wrap either: all three
> >  addends are u8 fields, hdrlen is at most 36 and iv_len/icv_len are
> >  per-suite constants (max 18/16), so the sum stays below 80 even with
> >  the TKIP +8. A frame shorter than min_len cannot even hold its IV
> >  and ICV, so only malformed frames are dropped.
> >=20=20
>=20>=20=20
>=20>  >=20
>=20>  > + /* TKIP appends an 8-byte Michael MIC that icv_len doesn't acc=
ount for */
> >  > + if (prxattrib->encrypt =3D=3D _TKIP_)
> >  > + min_len +=3D 8;
> >  > +
> >  > + /* a protected frame must be long enough to hold the IV and ICV/=
MIC */
> >  > + if (precv_frame->u.hdr.len < min_len) {
> >  > + rtw_free_recvframe(precv_frame,
> >  > + &padapter->recvpriv.free_recv_queue);
> >  > + return NULL;
> >  > + }
> >  > +
> >  > + iv =3D precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
> >  >=20
>=20>  What prevents this from overflowing?
> >=20=20
>=20>  The check above keeps the offset within the frame: it guarantees
> >  len >=3D hdrlen + iv_len + icv_len, and iv_len >=3D 4 for every suit=
e, so
> >  len >=3D hdrlen + 4 and both iv and the iv[3] dereference stay withi=
n the
> >  first len bytes ([rx_data, rx_data + len)).
> >=20=20
>=20>=20=20
>=20>  Those len bytes are in turn inside the allocation: hdr.len is set =
by
> >  recvframe_put() only after pkt_exceeds_tail() verified that pkt_len
> >  bytes were actually copied from the RX FIFO into an skb sized for
> >  them (rtl8723bs_recv.c), so any offset below len is inside the
> >  buffer.
> >=20=20
>=20>  This is also why the iv assignment moved: the iv[3] read that foll=
ows
> >  it would otherwise be an out-of-bounds read when the frame is shorte=
r
> >  than hdrlen + 4. The IV may only be examined once the frame is known
> >  to actually contain it.
> >=20=20
>=20>=20=20
>=20>=20=20
>=20>  thanks,
> >=20=20
>=20>  greg k-h
> >=20
>=20>=20=20
>=20>  Regarding the format issue being mentioned earlier, I can send a v=
3
> >  patch. Also, I believe decryptor() is also where this check should b=
elongs.
> >=20
>=20Please send a v3.
>=20
>=20thanks,
>=20
>=20greg k-h
>


Hi Greg,

V3 has been sent: https://lore.kernel.org/all/8ee3bdd1c45034200cb1aa9a7e9=
b575b9584643a@linux.dev/

Best regards,

Tianchu

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793154227;
	b=i3p5y3SwlyK4UWXoOoyE3KyL8dEBXKQIXCnQnrxoqeGr/dr/odYR/sfJ8DCiPygRm2Z9
	 77ZyiBv5/F5+sNS2H74Z1HLti7yhPJ9QlmnQsFRYTWix3X433Txx3eVKwkwfWBjlkZMMf
	 y+BX+7f0ohhAyuzsHlhHtbXkfQs+uz0YTsUfvYhkYzJDjdb501MgvDORPMPhD0sH4NwFl
	 7JTfGN14lvrtip+5RgcwISV2XiIzG2IJXPifTA//QKIzpVQo6AJeh6AIDFzEr4ccYW/I8
	 FKbf038Uz2IFEBbMLaDFIFsxheDBeU9aBiakbMiofwBc8q0vonGp4u+36xgSCWsvvSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f8qJrQHtshIgxX3OGUAaV2ID69tgVW0h7OtHT26+hAs=;
	b=pQadJHC3OqE2bRKLA+jENO26Yz/kbZTEgdmcA6EG/63RGDelr9h8oTMA0t9g6nVqsUte
	 iXBW0jGCr+niEw62Do9H5OyJFDUmReQEi+7CEXc6KyYLRHa4r7ynYXCiOA4iSmj4Vggyf
	 H2BNMbRVs/W5RwGERwZQnTO0NLEahGmrrX1uoIT0NaNYBrAZEeCOBEGExT6g6AXpqJJij
	 +nhQ3gvpuzBs20i8qQRC5biqXvey5HNPwvfOYU0F7n3q7IfUQn1bm8C8IdL0N+rVzEzhg
	 6ZR0GWw1/8dKdh6YS8W/tbyUpsOV0FULBL/sceW/N5pc+CEmVkms9XHxuruefeg6lzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1VvilEl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45029606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45029606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1VvilEl
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so1022122a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793154226; cv=none;
        d=google.com; s=arc-20260327;
        b=R/acAxmhwgSL9cqdiUBm73QgQoj/RkHm9OQiMQNy0YqQIi5yinMeNlvKUdcOzNh5+s
         ytnq0buWHMgwyw7ri2J3QmTgOXIvi4w8OpuYS0DBfWACvHPn4WzPQhXn4CeUuXzSXrLV
         0Jypfi0nIcGpOdFYPGAIwW/wo5Mo6fwnLl8ykGIh56emNCHXTLHLRoWe4bRHu3R5ilHv
         FANSIE5NA22yKSADufeUZwpXQTqicRAXnyUvOwKigM0mX1VDPahAuNuivZamYjJSN33/
         KxqWbzo/IgS0fpfYS3PIusO1gn3QA/SZhCNRmMW+C+v1rxMatqDlpeezRIiqJIPHYLeH
         nAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f8qJrQHtshIgxX3OGUAaV2ID69tgVW0h7OtHT26+hAs=;
        fh=b8kcaOuPlK+iLRQZuFrr6cqZjIGFg9rjZ6Fr36z7I5I=;
        b=BxGrm2uMU8L3szbVpYQ7xqbNcR2tx+osip78iclCQXGvlnJLmrjy0aMBH/OWu6zkE4
         boi+4R0Ml6ChAIUI1404Z8ks5DKsXMhUoNcpeXjD5pGd28wFBjz+4Cr6BYE1Eki0FlEg
         W7CHow12KE7xiKHnrlzAkSGu5aFRAG049ZttDsDy1vULpiTsjOluLZXfGqf/GVoFNF3X
         dvQC2LAHYmIysnSMedVAgbRJouwEKQMzh0Z/Ocy3WMqwj/bSN4sYVgyxiymnajCAViuy
         dkEZ6CuTmw65UHDMmWPTwqzOU+uZJUr2NcBq9x4ABnEK4/2BE6QyTMtDc8wZK95I/6x/
         rnUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154226; x=1793759026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f8qJrQHtshIgxX3OGUAaV2ID69tgVW0h7OtHT26+hAs=;
        b=H1VvilElQADmJrCePHxT0S8IzePFoPHfVOqSxv8PIZGYRAmWiwWxg/Dgl0cR/BfyeK
         aHTEHtZPBeo+1+zwqgetnr6dlwRi3IFT3Cq6LrxlW2YSSBh+c2vRSoGEiMJKkcNuEg1J
         rfyJWuI2fhdRndTPjcscL2Zf1P7EWCaIm1cnrtEALhKyHn6PHDhYWJx4FR5AvpwLvZy7
         fhzfXcOR7n/0AAUbEi/GON9m70TkVD4/m7LshuLBt6AnWjwAtQU4JyBs0P4BybXfogD3
         mSoO84Rpkhmo6TubHWmU5NVUSEPgS+NSblAtw2IG0LVr63y+PIbYroByIO0/c06d4TFa
         zSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154226; x=1793759026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8qJrQHtshIgxX3OGUAaV2ID69tgVW0h7OtHT26+hAs=;
        b=J8mjjHd0OnB+CIyDpmexAshmKLrskCAIcp+tK78J9RWUUn/ZVbIyxZDC3OA+ZNc2dJ
         bLYuPgnjMKMet+tn2MfHIv7BLTSVA3QAT8BJgGmEizRH0HtjqAOYUA0Jmjn/wGnWfSfZ
         5FyhQqgoKbvtHi+1AiIgNywddMx60eGBuFrj5TqnfEhjikxhB++gH6K1SwPF3BJNetXX
         IxlHBJG89tEivTHYbQi0ikSkEyYXLoqQ9PJ8E6iL4t3EOgimPduCylrG5pXudDp9FCBh
         DC3WgEq+l7MCZGIrrQqY3VwvHYsbDKU86khw8O52vAxHlR6N2/0QNJO9iahkN545b+/5
         8i4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdiAzINRgJPz2p/GZs2Ue0DWlAy78kNFHUAmLGXIANVg6nWHcA15TjEq+7R1Lt5/rOEQckIBNWv++HvBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhQzI6S/+hTRvxs0FM6d6sBO4zLR6rNRn6Je1hX2twUWJjVCj1
	6p0AWR9hQTLc67/G39Ordg7lk0cTHncwyJSJ8wp6wEP1edf0KAWps4vISXtzv7qr+2kgoc0V+K8
	wAVnJHofrcqIZzRMsjnzB6GDBLbFglTs=
X-Gm-Gg: AYBFou23f3lx6MG95RHej+XFwkA4Ti/lZkRB7MR/cupPkckjqKZYZilYFbLXsEsQETj
	E6X4jPg0xWJ1v5dglLDTc+Z135hLGPMbZLc8FtD7GwWR3TWPffN2N+SZAKvGokQ7//9m6Cc/sPm
	aAn/I6+ysphga2a9xNj3xlNu9WZeq46q/u6VWptXWHIcQuzTtDQMDvh+UzvWnhAXfxZegm8QGZg
	zZyy1NJowlXdXB9cmC4vlKBxQ44aiIE3ALtDE4XS7xuNKjyzjNHcmYSPbY+4KnlR3ZE+qxqh8ak
	o8JArxjgfqv8Bl6Oc3SCh5JDN4fs/vEz+HBQWKBAkRyAWgMINXohvVEDOA8lQZl1GrLQanbuiUI
	I0moznHhHzh8U0z3hj7bOZWhgPmpbleuEYkDOZzOF96us7IU7p31awNkXVHgwUdwyL9BLzS2/17
	bE3YWHoDv/wK05zSzWz8aSSk31/bSwOx0M1eHDuEazzrdtqCPMENuaoTBFntsdWMalZXszI/yuT
	pFcEQly3dDoVihti/pHmPJ7l3D0D/I2EfyzLbk15YtgmOIykw==
X-Received: by 2002:a05:6402:2b91:b0:6b4:16fb:b9be with SMTP id
 4fb4d7f45d1cf-6b49cb8e213mr407621a12.37.1793154225577; Tue, 27 Oct 2026
 19:23:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028011035.49201-1-rosenp@gmail.com> <20261028022128.GA201431@pc>
In-Reply-To: <20261028022128.GA201431@pc>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 27 Oct 2026 19:23:34 -0700
X-Gm-Features: AclHuK8E0CJD84w3EWQeIORDl1rABxmtpXg02aZ07bx5Y8fsTOc1Rm5pajA-gwo
Message-ID: <CAKxU2N9q52vrg9USU=N5_e_Yx34KsULY3j0nV1zExFbNa5-PLQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: bgmac: fix oversized RX frame check
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:21=E2=80=AFPM Chenguang Zhao <chenguang.zhao@linu=
x.dev> wrote:
>
> On Tue, Oct 27, 2026 at 06:10:35PM -0700, Rosen Penev wrote:
> > While reviewing commit 77dac783f11
> > ("net: bgmac: rate limit RX error messages") , Florian spotted that the=
 RX
> > length sanity check compares the length reported in the RX header again=
st
> > BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including =
the
> > space reserved for struct skb_shared_info. The data area handed to the
> > hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
> > BGMAC_RX_FRAME_OFFSET bytes into it, so a valid frame is at most
> > BGMAC_RX_MAX_FRAME_SIZE bytes long.
> >
> > A corrupted length between those two limits passes the check, and the
> > following skb_put() runs past the skb tailroom and calls
> > skb_over_panic() instead of dropping the frame.
> >
> > Compare against BGMAC_RX_MAX_FRAME_SIZE instead.
> >
> > Only compile tested. Not tested on hardware.
> >
> > Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: replace Suggested-by with description.
> >  drivers/net/ethernet/broadcom/bgmac.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethern=
et/broadcom/bgmac.c
> > index b3a92ae95de3..6873c7bb7a14 100644
> > --- a/drivers/net/ethernet/broadcom/bgmac.c
> > +++ b/drivers/net/ethernet/broadcom/bgmac.c
> > @@ -455,7 +455,7 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, s=
truct bgmac_dma_ring *ring,
> >                               break;
> >                       }
> >
> > -                     if (len > BGMAC_RX_ALLOC_SIZE) {
> > +                     if (len > BGMAC_RX_MAX_FRAME_SIZE) {
> >                               if (net_ratelimit())
> >                                       netdev_err(bgmac->net_dev, "Found=
 oversized packet at slot %d, DMA issue!\n",
> >                                                  ring->start);
> > --
> > 2.56.0
> >
>
> Hi Rosen
>
> FWIW, it=E2=80=99s helpful for reviewers to have a link to the
> prior patch with the new revision for easy reference. :)
https://lore.kernel.org/netdev/20261023005313.3946390-1-rosenp@gmail.com/
>
> Thanks
> Chenguang

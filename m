Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711374DD3B5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353522; cv=pass; b=noslaG3m5l83Re3+xtiTzuWLrBB/00MrRNiZehPQVeg2MJOBrWkq1YvcvzFvUdd9mj6sJS5Aq749svy7fsExIjnK7N25A3GtRsPGYNHzXYYtp50iVxvnBc3k1Y8h9rYnd9f3+M1/X5OrflMxui88s6u7PvhgBHTx/H8Gx/G0pLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353522; c=relaxed/simple;
	bh=8zm7M4OxoFSvQ+TgH5PpjZhe1RxAkkquoTyQXaliDfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx4Us41s5ONFxDzNysc5mY81muTw0g4xclxTOmOxrvLOkONjr2tlfSX7TCEVIWOdnMATPJSmvc7+wIcMktDTxe5nyO+NQuyxeY15B+ep0OC5gEf4LBpdbaPqlOhY+is4gR3WRF6IQJQNab1tbS1r497j+p8kNbU6O3QZPe6VNe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeWQ8mVY; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeWQ8mVY"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49c068e85so7765511fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790353518; cv=none;
        d=google.com; s=arc-20260327;
        b=sibB29Wlknvra8KrgNg2RDXk1c5ukj5709c7c4cBmkr5SHrxZxPt90Z4no1lAzVrHs
         fuD8Foi4EGm2CgQaHwdHXLazMxT9BN7EZ1dN0N/cMbsXhfT7m2Eok5uSE6nsDXdBT1aW
         ZUOR3f83h2mpwXa8E+fxtCitubIZmLoLYtvyLP4oynNCQXxdy2JRsWYhe1KmpVMEZFen
         kdWrMTHIP1luAhnxyW5H9YDVPRCtVZXzENl30xYXbojjV2TmJ9aul8VRE/MRk5E5Ply/
         P+Vzxd9PLDOuiZSHFI/9fb1gQ9sBCSsjEZq5F5bwizZdVFKdQYOOVsgHqhpQ8zXLU1HB
         KRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLeLfpbYpsHoDt+ljmKBY+6pn+0K/uh1JAal5HfsYCY=;
        fh=ddafWakDZX3zg85JmGPe2qkmzlkw9II+Ew5I1JoB+Zc=;
        b=YTQRZamRRtofxyVjUUajyKjudaRErGjUrhrLAxtJE0Ke65R4TiV8cCDTA+CcDKRWjv
         8KTV4qplgtzWDQyqRawX+TtUhGR4H5V962/Tx7YeAbLGjRsvN3pOsJMqt6dCYAH7KZIM
         n6hfNcr2pt9JqhmT+HRWJKLo93qQJPauEgUt8QE9I9E1sF9K3V0YZ+YxFjO8zXP2U+qp
         lHjs2eDgvriGl+dwDfF51+fdK2S2EOIe23kovqIb+MWCaXgdklnF6decJGsZQCKDQxUq
         se4xWLE4+Z/Ef1QzzpimOdowQXEPPn0ckumeizIhpge/6++/vhsmxmm6Y0PbgHg3upwT
         QmSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353518; x=1790958318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLeLfpbYpsHoDt+ljmKBY+6pn+0K/uh1JAal5HfsYCY=;
        b=HeWQ8mVY1pQirJU9xHFq4lCkQi1F7yZ6JBXYKyWRvFkCn1eylZNitxk2Mo/CNLt3hX
         ziSRkNV6ffihFnkYD2Xcgr9O2EpMTL2d99kJyq5hSGxiapuS2ewnqiOI+qXdXIYc7tFF
         6Fo+zMm08FXTqXEvxbqNxPnvQjiFT1PJjsOGmipZwHLPwbi8h+CEMCNhcfxtDvWSKuTr
         Bq1DGVh8xRW29FaR43WVmKyTBX05UHCUwru4CpxLPRqBGNOFlci8XfjjRJIFEpeRXNZU
         J8ZxjS6+sCO4EA7zZvHbZDQACugAh81WPByRmGWQIXc7DrAPbUD/WtCVHI7YCOVppxP1
         VZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353518; x=1790958318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLeLfpbYpsHoDt+ljmKBY+6pn+0K/uh1JAal5HfsYCY=;
        b=SNznjT8v6DYBVRHNlpjBH4KllF/VfwNzzSWAnwKIBmL6xIxeVIaarL1f2RSmbZytkS
         W1wTlWJZww4Mwy8j5LNwpNMYmkkqIg0pMqYXGoTFvtKQg460shJcsy25/tgYTwhJbzm1
         EOGbB/8bANu3Oo4BQ54mAEAqSCX/bpiHwSOMgTt3JWmlORCm5Hp+Sb4qtevoArxCn/Vw
         RWrorTjnvlMN1KXdTX2Lq4b525SUJ73Djz17tCf4+DGFmoQi9LOtzSjfQldDJ63ukX6G
         9jmcGcNrvppeqVX2Hb+/yuhpoZ/kpPsN1WT1p78MIGRnMLxKsI2ofYBUWxZCBSHo0pth
         l3Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwClIqrAjRhh9fX9d4JS5RotiTVcRfA3O9lvfyEj9CDsIaiH1HcgxsVU8wGFtsHhBSEF/zFEf21tZ4sOys=@vger.kernel.org
X-Gm-Message-State: AFuF++keSJ0qzPOXz0kV/b4QgNYD3vVE+uLzKQw2cC72Ybs17h/RJhoj
	pkBjzgNWfmYxAlZyNFFrcxxue6lfLg3Mnqo33QWfGZc0X0kHOh0/t1rBq8axH+WWs1o5gBbiXBz
	wtt+7+oUx36/tS1OQxADNTPgK2AGy6Ss=
X-Gm-Gg: AYBFou0nQb2E05QkAJsfora5RUYV2BfYIxBcjvdLNjRI3q5NFfgggJiZAgIMG7fAG0B
	8K0b713DL3I676CiA9+SBrVEx4aySAZBA8zOZ9a9dN+6qPEkSWvmqaOeJxbLI1Xb+s7Tq9YW6zb
	ZnpZWYD05KBGydj3/dRmWxKBHfz+eiWVmEXWRSQ7F1vAD+aBktvMKFoLwJjp+0gdKg3Hyy9zM6+
	lufrmsB5mVWG/rffX7l0EyrDds8lWJrk9UIzwKTZXe5sza4Jo2cgBtRlBfJ/BUID8gs4NQ3g4qY
	vDOQkW+vGhgOeeBp/urfA0zF4Mhbk+OzngKSe6qECUrw3QfQwz3RyBgavfdiKmp5sai3HExu5ns
	ITO9sWVM+B+la3yOW39e9moIQLkFqSmb6ExO1d2Vt+Kg=
X-Received: by 2002:a2e:bc1e:0:b0:3a5:b187:c7a1 with SMTP id
 38308e7fff4ca-3a63bf4fb7cmr16159921fa.9.1790353518313; Fri, 25 Sep 2026
 09:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com> <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
 <CALHNRZ-ofi9J6SZpKih5pogtH4aL_HDy3WmUQJ=w_nVd=YskTw@mail.gmail.com> <d11d2b20-74ec-408c-bd06-765ccdea1504@sirena.org.uk>
In-Reply-To: <d11d2b20-74ec-408c-bd06-765ccdea1504@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 11:25:06 -0500
X-Gm-Features: AclHuK8p1YRovjIsB1rIwKZPdfnnCz8fE1woFYGlsyQTwiHN-svfCGDW5y0jElY
Message-ID: <CALHNRZ_GTEsbAr6Byo_DtHG2VMqS+daJMM4=a+icbnu=h1Bj-w@mail.gmail.com>
Subject: Re: [PATCH 6/6] ASoC: codecs: aw88166: make volume control usable
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 25, 2026 at 11:05:42AM -0500, Aaron Kling wrote:
> > On Fri, Sep 25, 2026 at 9:18=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Fri, Sep 25, 2026 at 02:47:34AM -0500, Aaron Kling via B4 Relay wr=
ote:
>
> > > > - Invert the value to match userspace expectations (in the hardware=
,
> > > >   positive numbers represent negative dB attenuation)
>
> > > That's a very bad compatibility break, if anyone has a profile saved
> > > they might get excessively loud volume from their existing configurat=
ion
> > > which could be distressing.  It might be better to rename the control=
.
>
> > Mmm. At the risk of sounding like a broken record, is this any
> > different from the accepted aw88261 change? I wouldn't be specifically
> > opposed to a new control as my use case, Android, is very tightly
> > controlled and I can just update the audio config I ship. But more
> > standard Linux use cases that rely on a standardize control name would
> > be stuck with a non-standard inverted control forever.
>
> Why would renaming the control do that?

I might be misunderstanding something, but I thought there were
standardized names, like this "PCM Playback Volume" that tools and os
handling expect and will use if found. Which would cause a second
control with a different name to not get used. Is there something I'm
missing to where a new control would get used without manual
intervention?

Aaron

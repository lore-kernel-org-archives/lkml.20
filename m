Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365160;
	b=ZgiEm1Kp0uQHYV8jMmXLzjdRfvTqr2LPHNHY2SSmX08mFpUtgvYmD++PSB7pRydEDhxG
	 q4aBfKiiF7JNE10mfys87y+UMu9SeCsBjNx/9tii5P5eFTdmWLa2eDEaxbkIMUNHrtUHK
	 oFz+h1Edcgyy4/P7+sh49fcbRHC1L/k2rpn6b3sOaB2SdgXKF96FKJsCnI328IYm02Dwo
	 Eg6zT2XpebHPO5KGYP0Ti9gNW0Mwx2k2PUCAT3XQAsazXylh5HgicfNmFOJS2lOWHpls1
	 BeGz7pyzfzgp3H+q1V5czLN3RKjm5xjgc8K4kmgEWOBD/yzxsg/4upl70sCdiLopZEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
	b=mRvAZ850GNoQZ2HWe8KwTs4i0vQ7DGWA+CFG7Shyzb4jt1bkiAHPYeRT9b2yXKNP9qYd
	 /YvtTSlRFTzH5hR3QZUHDW8I1smEae+Lr2H8Hy0N8SyJXYJ3ZH2uzecsTCgabYM1dtc7y
	 KO1HcsI+56kHstk6SgUdvxtKAXzjl2JLHE+lXW79n7Xvsg0UsItqqn4ypo8gAUFjYp+uV
	 0ISIOrnzIyaHqo/fy9R+u1W+GLLbf0OYTa7bEgTxq6FPKiNByXevRAI7rPQnSUpHlrubJ
	 UKdGjwyjbTlvPCcycacjyOseSJi17orVRsEcXDCSHGem9wkdKp7czoeSmbRTShrv43Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/eopmN0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C06606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C06606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/eopmN0
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9908c849564so127916241.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365159; cv=none;
        d=google.com; s=arc-20260327;
        b=mUblceqAnMYj2N3ttFy0BHi2/sCncNd8JqYEs1WXcRMwi15TwAs8iS9ZAI0hD0cb5P
         1VeqtCB5opDSUG22pzTUGWePjfjp2PviyrBA3QaArZt/MQyL4+ySzRqGNQCNfl11kIQL
         ElEJp265P5gwgVKv1j5bOj+EOHNkpyXydp0CwVefMYUASsxIIRv6JZ1R/WJVvOtXew8F
         vAOBsivgBXwlKDy6gHbZklbAkBFKO3Mv7YsZDHytT5keCNfZA0j++5akrkqZg4va1fbV
         pxTsWl3dBPfZhbOeMmr+2PygIfc3Tm2/nScl0JpsdXMxRflNHCxZcKZYag/Srm/7teAW
         iv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        fh=c/m1hE47/OzelrZLC9QuJspLb9dQCvJ/I6Qf1TtA6u4=;
        b=I83OdrPPtbdcq7FmIksM5IgZKmHyL4dGpn78zzeh5iSxGqfMO4U3oNUdQEfUc9ouWw
         ceGdexLcLMhqu7094fQSTO1KZmG9qxY1atJtIG5r5DAg2LpjE1rU6cwH5eWj4xp1u1To
         NkLvS2Jrw4HClQDZzB3y0UQ1qLiLNUSiu3Ijv2dhUcyaSh++cmfzZM8I0YTLndKW3pQF
         AJK/Vv1Vs3Srg42HWykqT9hdobBhdS/tCwpZkt6vi/JUExdEICJAIhF0mjUGmyrfGLMH
         +StIumqXquMc+jJHbmMBkH7xwmVokbGMUrVIGYm22me7QLP5hx3qhP75jirYVBRGr2xf
         jPqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793365159; x=1793969959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        b=W/eopmN0/8eu/a5EWlMaByItXK4CEaOetZkMU4Hx87N+4Rtw4Dtklh+qG1Ex1Tq4+c
         XSbZeBReBjacNSLX7eGaaBMis0jSZC0P7jw1wNjHlVDU0gsfJ+eboUFRd6/Iwz5RGCu7
         tdxAeX+Ayvbl7288FOanSmEJmMiIo8zMcfi1SFg76XzrSqz3ULj4odIeIj/AJjzTUpFH
         g1iNs6l5/GDc1q/H6Lp5vdCAFwYB8aRVCEOAYpQeenIB/d7cHmNlOXbGaSyzvIFe+b+T
         K+lEv6cQrJbBMM+4f1ibAKpi34b4CddEsE0W+N8lQwyAnVKv7HofLrpY/AtAmdIKXd1i
         LzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365159; x=1793969959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        b=ctQ58xUBOaMNyZbEyQvIXuOdYdDoLixZFGM0cOJCpA3bQSrsgdqlpDJK41DYnDyGLK
         /zqIvZ6kQA50+/B1nviDaN/X3daXGHbCxL8yLJo/odjKcLrSBZBelcWxg2qCIQtUKduF
         cBel0dlL6bX/e6E3mXDbGcZScvVFD3j8FTt9ou3akNeDdP++I0+KJlpY2j7pT4DgLupY
         txlZjuAOA2o6wsnGuzw5vFj3oFCXa3O2Bo8+PmD637mIwwQTKl/Zv3qdOGA33pAUr1X9
         1ddbtvtGFj832oCnPMHtkqlhBUqgEXGsFFWrd+y3n9TQ0N9SXzLgCpJAdo+IHB3EMG9E
         60SQ==
X-Forwarded-Encrypted: i=1; AKwUvBx43jcE+wr+au8mm4KndCNoVlVB8wjBA2iVO/7bnHeZ20jqlrPU6EkEo1i8x8+uVPHL6qQW/zaXMVGSaRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz+GyrhYkA272zpzSzgNOC7TZdD1ECr15GwrPRIaVyHutzQZAW
	FG3Efjlbbsh+oJaangdJFyDBiQemA+OFqX77nLiwETI4cNU3ZDa1ncmYA7jhiTYX7gbYXxnXGS/
	YcegUBaAJqe7IqOm5gtPt2N9waK/q8Fc=
X-Gm-Gg: AYBFou1rS8u3K3JABnSJJkwAX01XqhAghuFV2q1IozqMWvLlBOJZP6zb66OsXzyyQch
	ibvuquSHHBjyknDEvW1PgT96ePaY6zL/vlLIofMFZEQ0XQFUsXuXjB8Ug/UphsGX2YaspHa4tjA
	LkRGpMwdHIVYvd6+gp/NH5L49nu/phsCu8tgpSE41pqd/Xb1qx+JnfZGKvCcPPPLon+i8NL5Ds9
	b41HZN01t1PdUHVklM6yl5zBk/KGAQb7nYFvirZ8pRRwyOGIhkasnIwPU4nR8dK3qSAInDtJAd/
	aQRlZJBwJETnw+5DH02nvx0REjWgxHxDJS5MZIABsabh7lZYv1RBivvM4oVpER01VNUz6MV4BUN
	+fD2foFkAfSON+mIVhAdk5Nh9ydwQ9xP2jpbKCUvtawS4J4cn0ql75muuK8YLxXSg87r3Mlg=
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr982684137.13.1793365158793; Fri, 30 Oct 2026
 05:59:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com>
 <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org> <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
 <79b1da71-7a17-4d75-aa79-ac1a18303b2d@kernel.org>
In-Reply-To: <79b1da71-7a17-4d75-aa79-ac1a18303b2d@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 30 Oct 2026 20:59:06 +0800
X-Gm-Features: AclHuK936QikowfoO5i5BgELLDpuDAgVgr57QkGt26vDuZG48EvAF5wkFnKQPU0
Message-ID: <CAPBH0A8YCzNBKETf=mm08EggTDiimd0vDXK9V+vfvGNzENfcdA@mail.gmail.com>
Subject: Re: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 30/10/2026 09:41, Colin Huang wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=
=8829=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:43=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >>
> >> On 29/10/2026 14:38, Colin Huang wrote:
> >>> From: Carl Lee <carl.lee@amd.com>
> >>>
> >>> Add eeprom device node for NFC adaptor board FRU.
> >>>
> >>> Signed-off-by: Carl Lee <carl.lee@amd.com>
> >>
> >> DCO mismatch / missing SoB. Please read submitting patches document fo=
r
> >> further explanation.
> >>
> >
> > https://github.com/torvalds/linux/blob/master/Documentation/process/sub=
mitting-patches.rst#sign-your-work---the-developers-certificate-of-origin
> >
> > Thanks. Krzysztof
> > This means I need to add my Signed-off-by to each patch, right ?
> >
>
> I am sorry, which part of submitting patches, which tells you what is
> necessary before you submit patch, is unclear? Please go through all the
> steps of submitting patches and analyze if it applies or not.
>
Hi Krzysztof,

Sorry for the noise, and thanks for the pointer.

I re-read submitting-patches.rst. You are right: several patches in
this series were authored by other colleagues and I am the submitter,
so my Signed-off-by must be appended last in the chain of custody.
I missed that in v10.

For v11 I have:
- Added my Signed-off-by to all patches authored by others
  (Carl Lee, Rex Fu, Peter Shen, Andy Chung).
- Fixed typos in two commit messages.
- Re-checked the series with checkpatch.pl --strict.

I'll double-check the series for anything else I may have missed
before sending v11.

Best regards,
Colin Huang

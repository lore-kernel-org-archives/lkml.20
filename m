Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4031240F75B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405376; cv=pass; b=YCJhLe2vxbIoje6brJuTiJe9/abARC0iFLVz0GJvJ0E3/laJWt47oGvWvcVRjHalfdHtiGuNgd99fP4Rf8AIvMLrPLsXzI4sRZHXU5mfqdBv6GYiwwt/kO+r6YFVuPwSzt0+Thr81WoOsL9lgGCm71TRR63Wd0AcdjTZn8Khy/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405376; c=relaxed/simple;
	bh=/xP+WEUlsYY3n5QsfJm9tA0Wc63T+n/0bY6kVv+mVPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjduFcLboVghME1Xk827EdtZlL0jb9JYUeXjTgI4LCX7DOXJ6kSW+zRHAxemtmlUgCj9crgdNjYW7u9whcUkMbdRBurhxrjFKhmpc1VoRINX+l59LUaxciGlDKIAdFYr0T5QCvd2yyyYf3WmO/kG3nzTu/s7X0tctiZpqi5OX5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3Ji5e3g; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3Ji5e3g"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso3789440eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792405374; cv=none;
        d=google.com; s=arc-20260327;
        b=I5FtQbpf6eD5kUgTUEvK0ryGkDM9BsqxoHFVzWkFAsUsunNAFjcR/5rZ2xkkYz+aQ8
         V15QSkvxg305wha5B7uL2abJImyKM9MHWElckFNQwOpz6ZPBcQSqLQnBx6WCAK30ANrA
         KcyAqR8oEAYvWAfaRHgSATFi7z0nclneIYPsmwUgX17XyiiPF5hZgdEdvmX2ZIXuuobt
         qPN6ijFeI5hHu73HmF2Y7o5ZSum9Pb0FlKd/9zxkgJiAzvj9M9uS9L01aQA6D93w4n3y
         qwotrqbrOKxLaib2Z74ppsO7gn/TjmWiqEhKL9VlmqdgKSj8H3G/NkFWxC7xs62xlU2o
         qIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDP0zNJyoncem5NQ2EXxAHCK2jutUuZuqNkhZsxaBA4=;
        fh=N6P86I+XzSoMiwZm8Lyzi3Hwko0fX8lMNatCC0qcBfk=;
        b=s6wKmMDWGuOpvKUJ+NJ7yAON2zjvr6pnqNynsIRDzxLDmiz8Ba8CET/0oIjFAn7Td/
         esyO14mhYpIw7zx70Li1JxAVno1NOWFh2pS00biZd2LWGQiC/ESjDVCa5qnvI/wA/wko
         gECs+KCsNKUkDIp+HISCEAd3+JEtULJsUVad4crqnOZkL+ERIIWd0SRspnoeLriKwEqc
         Uz8nz/DI0sR+0nlPJI/cxEDB9sNhvf+KkorljR+aMeAs/1F3oexVgY6PZ/3df0ROzv75
         N0oBAUCBnxc9PSiRUXVZ/wdtotWAKZo/YY6YzQZVPgN1VPqd7YyD9+h2mzpLY7EVeGfU
         fobQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405374; x=1793010174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDP0zNJyoncem5NQ2EXxAHCK2jutUuZuqNkhZsxaBA4=;
        b=N3Ji5e3gmZDDnzFiQmRT+HJE1BdhDGLroCNyih1WQnJAzMZWtr+Idhx+XsIGz/w2BO
         ARWT6s+/9z8LxfapB5T8a6C+ymhSM0rANB/WGToAIQbIby/koguqLm8blR5xwVeHUSJK
         n6jjqBt61a5tMMOXya1FGAHuLz1gbFwvOVZSFn86iU1IuPMR0Jv4bsIJ7d00Ms0oMVQ/
         dGUZ1agQRHkTGoDP6ABigwhbk7ybpjgafNC9tV/Zo6kcBg2LRN9/nVj9ElXiZSGlJC9W
         tgpYtJhvNHsyeFRLeIMcZKozqHrVOu2W9jThjMfOlUSGu258Q175TIsRFlCK2IYKrbbH
         tuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405374; x=1793010174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDP0zNJyoncem5NQ2EXxAHCK2jutUuZuqNkhZsxaBA4=;
        b=1/TSfwo67hDykprqRofM4m0srEvbiY2533qBXVVlXHsDDWxT07tsCRQlVX7LesCKEG
         29uA3UTsSIhFtv4NpYV1sapvOsQhaBv+DSpTd6NGMrGbEipQyNsyPGuqHczWUR8jfGPf
         szmTYF0lUf+x59Kmdjn7/mCMJJ3psg/S5HUXAdv3tDCjCjrFGIx2KF5AepZzrq9n+pVk
         8a6fyNzWYxSw7qa4tBf9aan3HH9lg+0UsqH5ZoAmH8Wd+37D3zEn81nU3k9VcPhwiP2U
         aKpiCesAmuEVQX3K8wDk6Fz2kkX5UuOslIDNSs6B2B33Zp7GU+2rkIyUHX3qHayBU0B8
         2QPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcTU9rjF74acc3NnoXdeEbZj6NrYnAt/E3+fLW7uyi4wijChCpMEohze6t1+dF5Sovn+7Ndjrd5y7KCs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkzAcj918PLxoPXNMjIFk8u++H2zyeYhTIxK8QmNaD6gUSKaif
	1vAkPNYVLBWwk134Q+ORxzHWyETjB3pQhAfgts/9fo4rGY7RCo99kwZRfieqXLEXTSbQ/bUkrkT
	jATGsBzt/PhfpHV3tsrYO2p4oJlmuT8Y=
X-Gm-Gg: AYBFou3yDcEi9CFk35RmhTOVh00wQsKxmEkC9LjsD/EeV3aqXd8KslXUh1r3+PuMRTL
	CU13z6uRZlgLjRlMsSezZskUudY5lkxYQhiW/fIwHe0g6FWSZClOCCd+4Qpt+stAVERY4jRM4t+
	ebSNvIp1rp5mZtDYoET09YyKCPK2X/ji4hxpOsVMhb2OZBeCNflf4gkKJ9AFHNdmrSG252cTMxI
	MaTOm/7eeYKx1hDXcqK39GudcoNbv0APytwu13Qjj5gBhgfPlqMvTAQow9bBo7ZZqewZ5Qs6Pdz
	zGMtoL5bjolm6Y/gS4eRf7tts7IgDVnX760wrLfWKYcWJGzvWV6R/uwd0QfeobrBrj6jsz00SjM
	QJdnaJZk2deNk
X-Received: by 2002:a05:693c:864e:20b0:35f:2bc:82d3 with SMTP id
 5a478bee46e88-361a195c9aemr10946833eec.15.1792405374294; Mon, 19 Oct 2026
 03:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006153619.304520-1-clamor95@gmail.com>
In-Reply-To: <20261006153619.304520-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 13:22:42 +0300
X-Gm-Features: AclHuK-T9LmpQ5NLkZ_7w9XsYRY3h0E4nk24ilBhela7D2I8HSWGbQdQ0PMxFAg
Message-ID: <CAPVz0n01zFZUy0vM8aQW5fEbKbO=vp+MeGtCQHc0Hh5AQdCNuQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] media: i2c: mt9m114: Add get_fwnode_pad operation
 for IFP
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:36=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Currently, the driver's binding exposes only one endpoint, which maps to
> the IFP subdevice's SOURCE pad. This configuration causes failures for
> many devices using this camera because both the DT binding and the
> one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
> by implementing the get_fwnode_pad operation for the IFP, which correctly
> matches the endpoint to the corresponding IFP pad.
>
> ---
> Changes in v2:
> - adjusted coding style as asked by Laurent Pinchart
> ---
>
> Svyatoslav Ryhel (1):
>   media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
>
>  drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
>
> --
> 2.53.0
>

Hello there!

If everyone is fine with thins change, may it be applied?

Thank you!

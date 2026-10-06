Received: from mail-ej2-f8.google.com (mail-ej2-f8.google.com [74.125.228.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A833812DB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272925; cv=pass; b=V0USACuFpFlQIQQhlg3g2BAYRW2sWn/JlTazw5YG2o2s4BYcoUlae404WriqI0nxzw5+jGoQAKOtVvM5bV2407LqetmKpRVVzhVRso4kCtwjVMqnvPkOg/7ZCujjHhD0YsYZ1HLTR2CKK1jnWyUi3UnYVibyEsyh0tqTkHK9OmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272925; c=relaxed/simple;
	bh=ZrF6e9Xl85C0uPBnJ0UyoaM1ga2dKcFe32QjUJGwcAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LozE0KkPTqWdmWbFVOIkkp2CeKuG2LoKbYK+Bdigb2GYRLBU948a5pK0f2C5XlN+q25zw84PsO6k6EsYQuom9cyhcM263pPRfD4q07TjHQyU/q49OkaBYjNbVL8DognqWdKUK01J6qtOSEuY5zxZAd+pMWjQvrGUooNYSVWr6DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWrpOpsP; arc=pass smtp.client-ip=74.125.228.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWrpOpsP"
Received: by mail-ej2-f8.google.com with SMTP id a640c23a62f3a-c2e61353ec3so72751666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791272922; cv=none;
        d=google.com; s=arc-20260327;
        b=YxU24uWs2d1hnsaXG0giDt+TiC+ovSjJ8rSlSnobDoAGsLJ6wb5ZPYnSq/vU4IsjtV
         VQ5U3AuhuL5RSrKXuh2xEmn6B2zLJgrHqwtUaxfV7pYSv5GlzRTAd7qs0R7nG7tjMKDQ
         odclMfbtVkE2NFlrV+sha9jlIWTT6jIC8dxAoXDDIW17dQGlvztixQV8ng0RUCCoTgLW
         Z/w9y/EIfV/WdyBTnvhKHaq4aOBEmk3ZChaagHy97/fXXURQcneIZBV4mdz3BLHKVuY5
         i+czwHE/jGFVFCyPEyCL87u2nfeBPPnRYYIkU89JfJg2IINFEHjCYDZZtM87iPKwCmU0
         vb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        fh=3frBz4MX+BwCi7P/zgobNYos+wieR+Xh21OCA6To3s0=;
        b=Wg4FzP2jfIJUpA6cCUA1Dj1da6ewnRT1LFa0XqRyot3O5C/B2tX5u0gCSBzNXfgmE2
         zfLw5FXVtR/gwvlnYGDan/srXgTcWZ6mxxCe5Q4+BuI+MTbi/LGGAzGg5LBoPhvrgc79
         EGOJBo7yGrS9bukQKPUIFIgYydjUy585LKHT3u33er+IWV3Ea+JmLrsado1b/cYd3PAT
         ASgMbLkLQIIxNLp2wpvJLUSLWiUvTrqES88gcY0+LEbxnrV49Lo28/5wxEUXZgp73Avr
         oJfrU4EFFPe2ssvt5p9kCSmIB/KzMmxWx2V1ONcpX//06/8PtqaUiCbRWPvTwWwLs2yQ
         z/dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272922; x=1791877722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        b=rWrpOpsPEDFP7vvWlfOKx1M3EJJGUTHlDGxZJbg5FxKaIn0ldScJaBMNHv6NXC26Ls
         rlrx4UYaI5zPK9Hq3zPoTvbQStnOVjjsMFGfAbbOYJxdDeDlLGmad+SQHGBRcKhWvpJA
         WdUnEAfDEdY+LnCbtYg1HMsXt77Lz7YX2Si444YtVyQNAzlbsCoUx1wps5REbYqPwvmX
         lptiqL/heWUpuPbImvkQxNLqzZf/3+/2d7C3oykyeXQ2qbLWkk7Qtc7//yS6a8FPrDMq
         VUMzOlmNLGWeUPPY7f/j+QH/oUOERVkDx3JzM7ZBkOm4+Fp5lCiJwzvA4Q/wcMcXkTTk
         pZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272922; x=1791877722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        b=TQRlzMJ8JW6rY3u9lnb4eKIHbfP9xb9TnX0gQzNOBDRwdsLOHgRbNH34hbP36/923T
         1M/tnCEsOlCIH4Q3ZbikKpGNlBtNdDv4N1xWPqT6IY5oo35ZKy1eheMYrdFBuHlM+ATk
         3pRwCsctPLnSYBGrXyMYO64vRAdrVnPAU4Epk1ObQRt6wmiYcNCG95WooNfH+WIHiwb5
         xL9Rr6h4rY9DciC3Al3m70IR3zl5Q92ZA9SiAD/6BuihILpzMXQr1sklQO27/+YH/6QH
         srDfJRfOoKhUmrZX8oCgIyNr+WksDrwR5S77dUNb1XO20f/qa9bwqASBVqOIiW6CRep6
         JOMg==
X-Forwarded-Encrypted: i=1; AKwUvByhwmYLuN+BTagJEFTd7OBdHBVMKEB32HBK0dgRuuFJcVwux99eV06yMYW1Mru2XKjXlVbzxqziH0hVzPc=@vger.kernel.org
X-Gm-Message-State: AFuF++kd0tazSdVw8CxLtRijuw3z8PXWCCI94Son6tMf5urf0g9QaJ1O
	AJb4vv96BMGpHuStuTcOnSF3vvF+5e2jDercozaoRBbpv5pF0mPSZKMR/Uta71JG/2LGYbnJoYN
	xYOTJbJY0LD2G3rPFwdNSRZdOz0Dbo7c=
X-Gm-Gg: AYBFou1JIsNZ/XL6pe8KbyPDen83y+1ZgB8RxlpZ5v3nzxqsHw0Q50IcEPcTL+Zi1oo
	zdVRKB5yxJbfIPAo4VGZHvTQ+m/6Wslt6t8JjM3B9kza38Rvyma+bkpkMX6ZyYx+szE+QNrJHTZ
	Bp1GBzfneb7JBA9jAt8D2NPV9QzcKiACGEn1QuYG51etjworHCVDzcYdcNVHtlYQ/r1+zoMsq3S
	aeQAhw1yBC2m82orbZ5he8Hfq/OPbUHKo1u+bCmxTQIsatIE7t/y6AZ/2/uCzyXg3RbV9ldU3tE
	8KeQLlkjvQbb9jHS44bCMhdqednypv9eBotydhiKQw/10hm4t/uVRnZFVw==
X-Received: by 2002:a17:907:9405:b0:c2a:f360:1c67 with SMTP id
 a640c23a62f3a-c316a07eb4cmr65136466b.35.1791272920911; Tue, 06 Oct 2026
 00:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005225944.1171574-1-coiaprant@gmail.com> <20261006032710.GA3539706-robh@kernel.org>
In-Reply-To: <20261006032710.GA3539706-robh@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 15:48:27 +0800
X-Gm-Features: AclHuK-_H5DMjjR501xY25PLqDQ4wPnk0DiXBT1PdwIvhQ2wQ01nPR-CgEl7PoQ
Message-ID: <CALj3r0hwkXBowh=vUbC9yPimkraMH1NJ3OmgBb0zp-z22ZFXvg@mail.gmail.com>
Subject: Re: [PATCH v11 0/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=8C 11:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 06, 2026 at 06:59:42AM +0800, Coia Prant wrote:
> > Changes since v10:
> >
> > - Drop the top-level "default: 1" for "rockchip,sgmii-mac-sel".
> >   dtschema injects top-level defaults into every matching node, and the
> >   injected value conflicts with the "else" branch that forbids the
> >   property on non-RK3568 variants, breaking dtbs_check on those
> >   platforms. The driver already treats an absent property as 1 (GMAC1),
> >   so behavior is unchanged.
>
> What? That's not right. 'default' has no effect on the validation.
> Please add it back. If the property doesn't apply to some variant, then
> default doesn't matter.
>
> Rob

Hi Rob,

Thanks for the correction. You're right, 'default' has no effect on
validation. I'll add it back and send a v12 right away.

Sorry for the noise.

Coia

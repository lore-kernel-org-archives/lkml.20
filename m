Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939F3D904C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285919; cv=pass; b=dg04GSPj8uQwXa+bl8sVnOM8GgzfPkyWQ2/UE+cv1hgZQiBHPcAv6aFnEhGKqTXIVywnt3p5bH4Sp1OX1y+DqARVpyRprOkiYmpcM+WvnFIyV+Om5Pd4hr4pPLkCc0QNWTuFmJjM9/ZOD2UAqCnpHyNKoeNNeywMarLgrLvPB8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285919; c=relaxed/simple;
	bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQdhRYtRNADPV6hQI0dzhKGy1wvReZe1cQKgEBmduGxXR9f3qqrK9YcUgO2FcnWs3hWWl4HUiADGUPI8qOCzSSFtxiRnlnzt+EyL2wzMCM3m1BLqUId0GjrSRxIgkXUiags1d4/H579DYkSXqpJtaWRXz2I4IitGtdjLutT9W2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VC78Vj3M; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC78Vj3M"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-534e6545939so22047721cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285917; cv=none;
        d=google.com; s=arc-20260327;
        b=K/XeNkvutpZolfEl/+f7InEuzRm7fO4c/7tocEnQ/7h++C/agFHQwu5axT3kzl4z01
         jHC7eZpq4dV5r3jA0IIw5Yx7SNiRzUJK8GxSk3TPyb0mBFTPUUQcs8PlO4DOd8n+/7Jl
         wiOGLV5u60J913hxLviyRziiQwQ3p7whtwSAup4MPa4IAtso4Ywg7PjhWAS8vk6mberB
         7SntztWHAjYPm08qQpAbFSnA8dLm/3vffLbpT9eitmm1ZnUFPtASEcAxK9/dNPY+3XrA
         bluTABvymiBFxj2ThXyk9qriYC5ITzwS60Z4iwGSHOtf+lQ6H58sctueLDzPnSq4oCxl
         OvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        fh=LaskyOKozaTjyWHeak0XMnVMDhaimym+K7yePnzj7ic=;
        b=E78fEmaaKD5ouVVRHye7Ww4Vm6Byc8vTXsXyB1ChtLu2C1kT3l2KTVRiecdH9E1ev6
         OLOLWLjCaenKUaWvUDDBfHa9RLcQbORuMFuUOU55cHQbAeutVhnHSYaArFkdrM3jDHSF
         sOkXfO5LpRiQJTAAgB+70vrUeOPlDipgYXielVO3kK2RI8HVNmfPPKX9uYssdchoWiNU
         +ePNmaJxoOjK9MAoBvjslx2t2lP39oq2V6avL+ICeDpkjjSCSsxvzML72+cu6eEL3GIG
         By3iP0304OV8SJCEUzWJUYzhlvtY557HpF8u1e68edO0IOhRQlHrKSBD2VVHQwqfYf40
         tGbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285917; x=1791890717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        b=VC78Vj3MX9ERdTnELiHYWiqvhP70XI4U6bVYq3vINkgmiLypT+YWovpFXue83gkXMj
         bWed7Zw2iqjzYpovaOBHBNrIxbGSpZSPjw4YWupK1woXiZYGiuetukUTs9nJO7mlchjw
         TLgs1Sbyty7+5yuu25ViR7yrKZXuL7movKsSkuJW8bVdUVzGZsbsE/0PXoB20K0tWF+S
         b7FhxFt7wlUGFfRN9hYtxB1OwyiMP7j0BOZ1Mni2fpgefMVBKJ4pG/m1W8Zr2S5+c25T
         SW1WwTr9azJxyJFgcnBvwNf4AFOzihKdDp6iB30H/qO8Jn/pGHrH9GAlHy3IUx2onZlG
         my7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285917; x=1791890717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        b=EOFmRjkhPm8tDZc5hxHngWZNr8TOgcufVzHdo+7bVq7ROAjWMjISwoBHTHaMMdzpBF
         Mpd9hCMjj/Ne2tmRcSs8/4Ci/h2Jbp4zZMIYM5CsmceyV7eoQRG8bku+FdXYlaFfGT3p
         nFGJUvP4fIP0DcCJ2SXuR68zFkdcCDbqIeOJ+qaz3y1y9uHBcn4a0Ztq7w9LDPeF3Vi4
         crOi+9SDjAG8od0elV5VAxQG5CYmUBBv8P+qCGS+CYE0/LepAUAXqnguxSimm78j5Est
         w8B92BVxiMClBjX8Voh2UIYs37n2/qfsB30RAWiGlIGjGTtdP4cHL4Kaf6cpTuG5/qri
         be3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBJE9+tAIrNHzTiEO+qUl6lhO8F8mG6VAGtzga3OhBV1FGNvQEOLFXslN//eV6AQpCzm/qlJY2QWrPGBM=@vger.kernel.org
X-Gm-Message-State: AFuF++kbpa79iM0jUScHxNARPwAuqZNFDZSeYd+IMpagYem74syHv3cj
	E159Ox7fR7RXO+gjtFxkFhlgGU6Ch2yflKfCkwuT8Hw1bmSB3Y4/KObkpMfitpV3iX4oaaXoDWy
	BYVOOmLkExJ3ZBj8bIcma6zNKSMIvCQQ=
X-Gm-Gg: AYBFou2YskQCZ+Y6sQhSD29xY6PhvAAitcPpIBmAfIykSpTFKgMFn704Y2RJer6xRvn
	DwsX8jUZgqdDDmwZHFunk1tt1R2lVrExJQaEgWUVnNg6dG1UIKr+SHW1DWLZDMvF+EiePOa3cJ8
	PbQfEJiGPSmoRHr/k9PRs6lHE9t5ZwcrQRzjFoNccF7T+mNex63rRTYTFARA3h1KoVZppcZYH0d
	PhaIVvxMOmswNlix+HANxtS1f5UqDbP/u7DKwc9n/qys28KpVsSEPhk7wJg2xuQ07pImHFglRVi
	QlAeQ5QyfIa7qd94tcwggVb0weRmC0kiFxzbXxtWmB9vgHzDG64JM8Tuam877S22PV2qP8W2peH
	kWbD2UveV
X-Received: by 2002:ac8:5707:0:b0:532:f0a2:ef4 with SMTP id
 d75a77b69052e-53511e431b0mr182844541cf.26.1791285917373; Tue, 06 Oct 2026
 04:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
 <asTVqsqOLb29LY08@parshuram> <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
 <asTYlWdkrlci37FB@parshuram>
In-Reply-To: <asTYlWdkrlci37FB@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:25:04 +0200
X-Gm-Features: AclHuK-2iwD9Pk70twNlp_Yt_RVNdVYY6IjBqwJqtLPrbBVE4V3UaEW-eP-1_m0
Message-ID: <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 13:16 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 13:07, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
>
> > > Okay so we have a cross tree dependency. I would like my tree to be
> > > buildable and not depend on next.
> > >
> > > I can
> > > a) get a signed tag for this from clk tree with the required patch,
> > > merge and then apply this series
> > > b) postpone to rc1
> > >
> > > Either works for me
> > >
> >
> > Maybe "a" is better for other phy driver? The pcie move patch is blocking
> > other airoha drivers currently.
> >
> > What is the procedure? In theory just the dt patch is needed, nothing else.
>
> Please send me Pull Request with a signed tag from clk tree. This is
> typical workflow. Is it soc clock on common clk tree? Stephan or someone
> can generate this and I can pull into phy/next and then apply this
> series
>

Just asked Brian since he merged the 2 patch series for the clk.
I added you to the relevant mail.

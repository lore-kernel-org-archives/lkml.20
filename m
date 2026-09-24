Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC01A6814
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252722; cv=none; b=ek0/19shNZbHdVLzh5aveap5tUFUponrGstWwgEW6OIUlGEmUrC68ouIegYu1zJbUROupXU7mIysNQKD7pa6LI7wfrqH9Ns5lREPMgYviVtnxe/GHpeBfsbTOfaEnoJXrYPzCrN/RUho84GmUweS7LTBl9T8g8fZyHIMCmJ+YPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252722; c=relaxed/simple;
	bh=hufhkWEppg21lSvR71FpDUp4y3tdpeTY9IN5XuG+mBk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5m7XVgix6LFK97939+/JTA2JPHBnybL9B2lSEB4BcEEmmGaS8+sRkGOxrIBCXCH+oXphxpBSYERGSm9iJKg9IUVzE7E57Y2VOsjuyM1GUmeiNBpJOuxHltXovJZv3ePPRQn9RpYrqX9au+nTrDPpA8a7ny89IKrBY9cqTOOVqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olCQVasl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olCQVasl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258811F0089C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252721;
	bh=hufhkWEppg21lSvR71FpDUp4y3tdpeTY9IN5XuG+mBk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=olCQVaslxgAiBSQ9jOP1F7r97R1FUQSm2ZqUtcIBT+qpfDaKY70mqbZ7nAhpzDRVY
	 bOM/Knx7V63pe+kPiecaLwOqrcrmgGnIS34q1xYD8AKW5EQAnVLQim5VvNXg6TgKaM
	 r/2GmReq3/sbkpnCTcVpJEOywtFBpwk17Nvs9hx1fi7aTDVboZ2s+6KlXNlx6bsyX0
	 QpqwxUl2a9fMbOgMIejcmWgkb946dHTed4PbPLBSKKFgKwdnMvasQRRs7qzti2rkWp
	 4M6twPJYiVB6zHK112WaHZhGoK2FGoViuqZATBN7AkrbbgBFHemjnT3ZT3XXdgN95i
	 iHk5WtVygkguw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c5231570so2020971e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:25:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/UiD3xjbN51FLicPSdnOMYHCk3IZ0nrpZ3AHNSkViU4tWk1u16q7haFFtPFIOsut3aUKpXJ+QJL8lrJc=@vger.kernel.org
X-Gm-Message-State: AFuF++nnI19AtR4oO3yRFxyyZA3Pj5yDuE9NGMYckOUBSjepWZ8bsbuQ
	wb2KQhAT/ClC83z+2fAu/YVZ4hQEIm5/ywbYTs3aeBEAUCdI0WFoElm2u0mHQ7HaIzxaFyubMsf
	eKc/rShnepKLsTECT3LKYP6YEq9IEkb0lywEgXjc9yw==
X-Received: by 2002:ac2:51ce:0:b0:5b8:d47b:551c with SMTP id
 2adb3069b0e04-5b8e11e5d07mr721642e87.63.1790252719801; Thu, 24 Sep 2026
 05:25:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:25:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:25:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260924073222.1000666-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com> <20260924073222.1000666-2-shengchao.guo@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 05:25:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md+PAU5uNQWWp2xJJ3nQoWKP2d3oucOitNVEuFE=Dz=3Q@mail.gmail.com>
X-Gm-Features: AclHuK_iCa3nokOE49HBPp4DGampBHqAYBs4EahL7FpISxOJPU8BYfqyB_QeiRM
Message-ID: <CAMRc=Md+PAU5uNQWWp2xJJ3nQoWKP2d3oucOitNVEuFE=Dz=3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: qcom-bwmon: add nord
 cpu-bwmon compatible
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, Pushpendra Singh <pussin@qti.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sep 2026 09:32:21 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>
> Document the qcom,nord-cpu-bwmon fallback compatible used by the
> CPU bandwidth monitors on Nord.
>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Acked-by: Georgi Djakov <djakov@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

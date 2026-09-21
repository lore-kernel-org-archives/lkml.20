Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA1310779
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001076; cv=none; b=EsYvX+n0DClWZywKHSNycpWbtZy9V/D7VO9SuH3FEyHf+lW+rTzN4HMv8POEW2QzIbvVbPOuibV2RWUnGrJaY8OL7ZsNWgNdu7OgbDUSkj6+iQ+rZLcIYvNaUu2YA/JVApyWANxI5zmAfbRLaCEEM4DKBMav827n2MRohjq3Xq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001076; c=relaxed/simple;
	bh=HzbM+cjpHWxwkFxYgy37DMfvadjQEHDB8sudwkbRX8k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCyBa7B82um5cl0lI9sae4FxllLSEZuqlLyV2kdcrOZludP22NuGoBhP2b9R9X9c7EbuqlRTSbJGWD7z9qA0weXvy5+6mkm4sRc3R2ozZXtc8YkCDJx0wnHrBASN+7kAXqOdY1sBiq2T/gaREeDzi3LR8iCVmoYWU8Ct+JChwWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlOWWIRZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlOWWIRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1FF1F0089F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790001074;
	bh=MiUoZ6rOtvZwrZdJCjWpXoARrZEHEbXFgv84ZYLG/wY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JlOWWIRZAqgh1BrzoJrwirYiHVG+WHrhe+rtNrQ+BuGiyfqqPGWBU8qqNb/pL6I6Z
	 EiGJWVusJnlNnKkkfmqiHtKvgdRliEZlm+JhleahRt78bIdLFNfg6v1t7fsr1k3c+U
	 6YHVEojJ1vhgOkTe3qS4mVF8Z0cu8O5iZ4XkTvuqTZSDCtXr922HlkVs9dpF1rMgKG
	 YkX3NuQzLEuvEW1j0RC0jtUofxjBr/j32cmji7p4xlpab178C8qzTwlkrnZ3xbWKTS
	 PkCHHHo+bR8xwWrk+seV79ZJPQJl7JTTu2FMAxm8sFBfMjKHPPIl4Hm+d+l+O3nxXs
	 3tJzl457lC6ZA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so4683365e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBTZiW4fRlL3sO716bnH37e530qm4bG0ZFbYcE7dX2mVnHppt/XXsigrA9uW0HqMmTHZZQScn9LkE3huA=@vger.kernel.org
X-Gm-Message-State: AFuF++kxVDfGj00xpzQzpvaKMcT3VRUVulPDemqBy030tq+Gus9LlRup
	uoEEVW7ud50bOxpDkakOvNZpI86RLqBujwc1zIhDDM1tghvDMZsMz/4ciFfoXNdzES8aZ+DIneH
	uqcDXM8oKu2fyN38ldjbZEI6MaOViTczGe+elxhU/fA==
X-Received: by 2002:a05:6512:2355:b0:5b6:183b:d21c with SMTP id
 2adb3069b0e04-5b8c1967d6bmr3400125e87.67.1790001073440; Mon, 21 Sep 2026
 07:31:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 10:31:12 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 10:31:11 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <arCSUfdtKPB4eedm@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
 <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y> <arCSUfdtKPB4eedm@QCOM-aGQu4IUr3Y>
Date: Mon, 21 Sep 2026 10:31:11 -0400
X-Gmail-Original-Message-ID: <CAMRc=McxssteCfOypzxcgQtYR23-AAPzMtc7Wa_UhcYHrsUhhw@mail.gmail.com>
X-Gm-Features: AcwNN1VsjFQcZiEZ7JtGlVC6AoaK4QHKTobOccbbeLVPVPx67vg2rWGhr45MZGw
Message-ID: <CAMRc=McxssteCfOypzxcgQtYR23-AAPzMtc7Wa_UhcYHrsUhhw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	brgl@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 04:11:29 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Thu, Sep 17, 2026 at 11:00:36AM +0800, Shawn Guo wrote:
>> On Wed, Sep 16, 2026 at 05:55:37PM +0200, Bartosz Golaszewski wrote:
>> > Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
>> > nodes.
>>
>> As the nord base dts series hasn't been applied, we need to call out the
>> dependency in the cover letter.
>
> This comment is not valid any more, as Bjorn just applied the Nord base
> DTS series.
>
> But I just found that CHECK_DTBS of qcom/nord-rrd.dtb is not clean.
>
> arch/arm64/boot/dts/qcom/nord-rrd.dtb: dma-controller@800000 (qcom,nord-gpi-dma): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,nord-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
>
> Shawn
>

The binding adding the compatible was sent separately[1] but there's still
another issue that needs fixing. I'm not sure if it's a bad rebase because I'd
swear I did remove the dmas from uart nodes but they are still there.

I'll send a v2.

Bart

[1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/

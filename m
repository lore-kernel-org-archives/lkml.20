Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E24645C6EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984399; cv=none; b=qVv/XA1xpYarqdHqEuRhcuWkgWn4dXGoqNiQnU8/m3rAwa3g85/5HcoajS3WD2SC5k6E0eLzYJ6/ZNub3hq6i+bKG0S579P41JzirU/lb8JxKWw5Jgkq+cnLMiK++1DltLuQvm6ZYeO8BEL8QEi9SSxz9R+AtAJZ7vAc0dzJkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984399; c=relaxed/simple;
	bh=OVgqVZgoprcbZrW96Hezl0k28LDZcEsrouuSrG74wsI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEFfFCkXVqB5l50cNO5tqqHbYuoZSOhOZNbDt4O7tZHEoKszTj8u4nFiUopv5WeL9Xmzh0hdenVF0O0WtPSHnag/T4ljo/gxWiUg2QP69qg2d599tiKKbNgoeJ6s1prs27h3KJNTH8UeiuQwx3wBXMzu32r0jEGrFyuNg7kdBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfXMvPkx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfXMvPkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374531F00893
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984398;
	bh=G9a36hdfeS2yy2xljT7Aetd8jYgH5sWTBd4H4D4TqcQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nfXMvPkxZPHR3DFK46OAeDnGSpj5LQqV2SW1VlIgWaesnB/RPifXgvHTU0ACfjGua
	 lurNVu1Id/Kb+N84uerZZkyEEkbxIM+Qhw0SqPyOpyVIyCC0JuJhrarSDQbCcfXhXw
	 CUduJkrgJEH6Gf6qqxxI/QL7YiOYxz8A7OxYQznsYiT+RlbTIxtkV/Eiqq6fd4dvS1
	 QsE6maqg1AYhJ4Gg7YroU+5wvBt6KMPuB8BifQ36EPk/Cq/u8AdV7xmtudDIft8tRO
	 w0dtsGLllO6I6NbNsIMJEKodK+BmSt4fyQRcShp/3l44ap0mUfYAMswMFY1rxHMksn
	 8Tlsmzbhh3riQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso2161367e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzs6kwayC5lSEMK+knw/rWTtaOsnbQY/GGICgpBceN0n5S1eh9drvnZVDyMivibln8ZT/CXUzX+JPdU+R0=@vger.kernel.org
X-Gm-Message-State: AFuF++nBGvo9xaVsFyByjN3dXaMaHmtBXdHKvcz53QHNzWxHuQd00YXx
	8fj7NdCeASeaM1tILY/uKLtZIeuWWY6y1yzxuBP3uk4vSJL+/WtQtdDYlc60c3kgMm42vRSRjfe
	Tii89PiKOq7b2Is8zTZPYt1tz7wBD8LGSXa205a3OiQ==
X-Received: by 2002:a05:6512:3e0b:b0:5b3:420:884d with SMTP id
 2adb3069b0e04-5b8c1801167mr2805186e87.18.1789984396912; Mon, 21 Sep 2026
 02:53:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:53:14 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:53:14 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 05:53:14 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me4kwC8dF3i9YFATrc_hC3Lma0o6tFvkOO8q3YRftBEgQ@mail.gmail.com>
X-Gm-Features: AcwNN1WLnk4I-_5z8t6kt6k2F9zCMzwMH5UKy08nI4fmo6AqZN0kC2OF3Z3PCLo
Message-ID: <CAMRc=Me4kwC8dF3i9YFATrc_hC3Lma0o6tFvkOO8q3YRftBEgQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: nord: Add display support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sep 2026 11:19:27 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> This series adds the display and remaining clock controller nodes for
> the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
> and RRD (eDP0/1) boards.
>
> Dependencies:
> - Display and PHY: https://lore.kernel.org/all/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com/
> - Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
> - Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/
>
> Changes for v2:
> - Rename label mdss to mdss0
> - Drop clock controller DTS change from the series
>
> Ritesh Kumar (3):
>   arm64: dts: qcom: nord: Add display subsystem nodes
>   arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
>   arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
>
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 523 +++++++++++++++++-
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 128 +++++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 +++
>  arch/arm64/boot/dts/qcom/nord.dtsi            | 266 +++++++++
>  4 files changed, 971 insertions(+), 8 deletions(-)
>
> --
> 2.43.0
>
>

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF2499F22;
	Wed, 16 Sep 2026 23:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602441; cv=none; b=WzbegBwL6bIUS/BgVHAgtHttfF+/ioeXe5kjtLQyiV7EaeXWBWnoLxVkGniGgKcxPJ61Nm+NBDVQetSzbwQlIpdaIFEWBzDPbS+/f6OZy4LLTEmauoXsI60vKsDqIOmg0yZW33Xe3fyptSSdCvjPGZE/B/j/6iO/G7Y4Xfjv+LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602441; c=relaxed/simple;
	bh=5mi9AsS8XTq6Qc96gqsOCkGhbqfkuW7vm0yBaE9sarE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFZiWZRTV+F345tgGQR3bJzY17YebA+PQVr7JSlg+hjh28EtvcV0OJSPuXjNAK0f54gAbs/xZHPkqxyujYPza6HM52kJxIjlYcKN3hx3PpyUjn0nZ2YqU5E9y6Tro/8dvlrcTzlrkhnRu0npoyMIt2hv58tqyECwtzocMa+jeh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO97aiZG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO97aiZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111571F000FF;
	Wed, 16 Sep 2026 23:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789602439;
	bh=boaRVA6wusk+JUd+D9DwOVxRLPb4WP6F9ht3Qff6ugg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iO97aiZGUz6qva8RVunqXqWM2y9im4rU1Y3Gj5paZUXJ7goglhThIaJpZrRASAyqr
	 WCBPXsCFIuFM+5Jlug7VduNpVee/r3rLi9cTebrPRaY05WnBB9p07RVaS1ZbsOPvQr
	 Y+bHyaeSiibzLN0yDB07DNduQqs1LYvjipXErK9Jx+hULH2kJeT0AuGsdyV4tfLx8+
	 8wjYEPaN0rzrIORGfDzh3ybHzjgwmfag33SoVae0R8cxVGu+AdoeEeRysMbyBzBZvD
	 s38ph5ejmRF0/jV0v9SvC/gPLU4eBPG3s/AJaEQUurCmCelIEidkbpQgJmDcRONcYA
	 ejwEYtiKWxRdQ==
Date: Wed, 16 Sep 2026 18:47:16 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add LVDS display overlays for
 lemans, monaco and rb3gen2
Message-ID: <aqsqE2-ocdV_W34q@baldur>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>

On Sat, Sep 05, 2026 at 07:00:14AM +0530, Vishnu Saini wrote:
> This series adds LVDS display support via device tree overlays for three
> Qualcomm platforms: Lemans EVK, Monaco EVK, and QCS6490 RB3 Gen2
> industrial mezzanine.
> 
> All three platforms use the Lontium LT9211C DSI-to-LVDS bridge chip, which
> converts DSI output to dual-channel LVDS for driving 1920x1080 panels.
> The overlays are structured to be applied on top of the existing IFP
> mezzanine overlay.
> 
> This series depends on:
>   [PATCH v8 0/2] This series adds LT9211C bridge driver by extending LT9211
>   https://lore.kernel.org/all/20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com/
> 
> which adds lontium,lt9211c compatible support to the lontium-lt9211 driver
> and extends the binding YAML accordingly,
> 
>   [PATCH v4 0/2] This series adds BOE DV215FHM-R01 LVDS panel support
>   https://lore.kernel.org/all/20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com/
> 
> which documents the boe,dv215fhm-r01 panel and adds the timings used by these
> overlays,

Then get those merge first, so that I don't have to spend time figuring
that out for you.

> and:
> 
>   arm64: defconfig: Enable Lontium LT9211 driver
>   https://lore.kernel.org/all/20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com/
> 
> which enables the driver in defconfig.

This is not a dependency for your changes to be merged.

Regards,
Bjorn

> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
> Changes in v3:
> - Removed redundant status = "okay" on nodes that are enabled by
>   default [Konrad]
> - Added a blank line between the last property and the following
>   subnode throughout the port@N blocks [Konrad]
> - Link to v2: https://lore.kernel.org/r/20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com
> 
> Changes in v2:
> - Updated overlays to make them compatable with panel-simple-lvds-dual-ports.yaml [Rob (in panel series)]
> - Added Empty lines before the status property  [Dmitry]
> - Link to v0: https://lore.kernel.org/r/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com
> 
> ---
> Vishnu Saini (3):
>       arm64: dts: qcom: lemans-evk: Add LVDS display overlay
>       arm64: dts: qcom: monaco-evk: Add LVDS display overlay
>       arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile                  |  14 +++
>  .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 113 ++++++++++++++++++++
>  .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 114 +++++++++++++++++++++
>  ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 106 +++++++++++++++++++
>  4 files changed, 347 insertions(+)
> ---
> base-commit: ba20122d4c311bd9384f38e7ba1d0c122e21745d
> change-id: 20260708-lvds-support-2d40d60654f1
> prerequisite-message-id: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
> prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
> prerequisite-patch-id: fac2b93f3e250589dffd7c076d2ef1aa7a2519a1
> prerequisite-message-id: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
> prerequisite-patch-id: 1d3e40bbefcb2550afd81c5cced812a1d3b943a2
> prerequisite-patch-id: bd3612ce053552e2ae7401a1217c4884413563f4
> prerequisite-message-id: <20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com>
> prerequisite-patch-id: 9e3233401819ca53c119e6cfab95b0c471ef254e
> 
> Best regards,
> -- 
> Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 

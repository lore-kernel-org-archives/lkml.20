Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7538D400;
	Mon, 31 Aug 2026 20:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207714; cv=none; b=hq2RqiLcuQoBf9jza4haGCQpvlJVI5W6pFjOnkltD2RNUbePNp5L6XSkT+6BZ5qRx58v/csxLb/3rYlif9MLVYAFwNY8Y7OKb1d9+Fd4x8BSFFo3Vv9katJwQww+RmByuDza0Ba5LG48diEHvzZYiW5MAV9rpyMEVP/J88j4f28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207714; c=relaxed/simple;
	bh=niubZhaSaQOSAglHhxWxrGIcwRg6d5RMq0/11sKxdiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbtNt39tvuryP7/Vkm0E/QWryG9iC8Gcw7XRxUFxpi7Ks8uPS6jU96yXGZ11dUxVVxP4cxqLJhGM0bRv80rBvttIXPfxLMvVyQpDcyhiO6fQpPf9QvsOHMmudAd60htKUBznZHcmMzzPOp1lQGGY5vESsUMxohlUorVpF6p5yUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnfiaSlA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnfiaSlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A3C1F00A3E;
	Mon, 31 Aug 2026 20:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207713;
	bh=fJWCfrj1h9YwemEQOCT40RimxSdoxsax3NIOZvlYVr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cnfiaSlAieTZeya4jPpSnTXb23aUv6N/qDYgxKOMgr/xNTECy7GIgIoVxy8vvNJAe
	 t63DZiqSJfmmaol3hS6izaepxPLAsBKoBX0XH478RcfCLaOTll/Nlp9tZygNb02/NF
	 mUoWnTUQicXBecgrnIewiiqGBwORWym8cSCjGDdnAd3fsQuHl5DcS6epILkZmUTvon
	 GxvvmPkf63jcLd09Tl9lswZRR5U12UJWDsidTNBRUY2Scd2GRGPzhFWjjIUIZA/2kE
	 NR3GF+vd/g4CJ37cGoZL11NLIaob6PFpAnicCTek7HSUwcNz9zcJGJUJhhOP9Dx7UO
	 qmDrcE8gxie+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels according to DSDT
Date: Mon, 31 Aug 2026 15:21:28 -0500
Message-ID: <178820768636.1699313.15912570106526449407.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Jun 2026 16:14:45 +0800, Icenowy Zheng wrote:
> Some bugs of the GPI driver exhibits a fact that some GPI interfaces
> aren't available to HLOS, and accessing them leads to system stucks /
> resets [1] [2].
> 
> This patchset sets the DMA channel mask of sc8280xp device trees to the
> values indicated by the DSDTs of the corresponding devices.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: sc8280xp-crd: set GPI DMA channels
      commit: 63f13ee5a595a160433b3f1a6c8f0b5c1716cc1e
[2/6] arm64: dts: qcom: sc8280xp-huawei-gaokun3: set GPI DMA channels
      commit: 19c311c8fe5e439a9c89ee842839e5f1cfa2a48d
[3/6] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: set GPI DMA channels
      commit: efc4bb04c5aaf3ef65033f8b8b9e1d50b76cd62f
[4/6] arm64: dts: qcom: sc8280xp-microsoft-arcata: set GPI DMA channels
      commit: 6407f4c98700f4315c9dc97fb42a2261b71618cf
[5/6] arm64: dts: qcom: sc8280xp-microsoft-blackrock: set GPI DMA channels
      commit: d7ecaf9eea5e3e12388a25a94d10ed8260e3a68a
[6/6] arm64: dts: qcom: sc8280xp: remove GPI DMA channel masks
      commit: db4ac552889f6a952de872ea6128e1caca07fffb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

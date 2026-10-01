Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1996380FF4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865858; cv=none; b=YpjqFEp1YkA7DuN7k9bZZw9QEee81H6UhVoQe2trvZUjK5JweY7p2Ym/bLy8apFzSD4qIFXJTXDaPq8naR/lkvCiXDqxZwl3K2GsuTPVIsjIbxNZ1JpVYeu0ZXxnL77sufAW0dY5gVjvsVK0oNLgRlOBDhRQPsaj2jXHU3Y8pUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865858; c=relaxed/simple;
	bh=L4+87DhkuAsfas+Nm9WmqWa1zZNrqbTS4ilMmlqODcY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzaKwcD8+koCbzWO3/0MJu6RZxsetIusGc1fnjRCFlMFPKEr6OmvwTDykS3ReJVrQ303Csikr247TrpBxAdfiWjEbswQo9qQjKULM0KMDYrgmztp68tFrnEWNv5YGfmJAWk2rkgZeloBQDabRiRLKnvLRVBQRKG6amDkI9s7WJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE7sBfo0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE7sBfo0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A3B1F008A4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865857;
	bh=ZiwmhYPVSJPzlGOUdCC5Z3P/0SSMNKcswBfAypILvkY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JE7sBfo0jDAr+ro7/1ZWVufFzJ9dv0+x6uoVcRrC1wJuuQyNSv3/k+P5d/zsksYLi
	 AYIgu0Qa1lynidXv9uE9mGN1w8neeCHIgnKLahKAQxBy+n/rWQyt57dBciIcWclSK2
	 wnUwz+AVwhWrRRBjl049MR4xSieJcKEE57+kO0MrGCEgPpym8U1LPm+P841gE/BV4N
	 QzPBHxZXhwPjLmhciNfzobjZMs9dAdEPiCm3ut9AFlUnBwXs2HbTL0XBwkI1HIbmfx
	 l615nBvSS6HMCkt+3hqDpUdE6DW/7mcPoMNcc573SnA9sdG1LiJQIGSEGT25+90TTN
	 DbCZzoFX1ij3w==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3e27d525so1663396e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:44:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjPcMhLWK9x7ofiem5Yy1S2dTdGugMsjpqUjUJfYToV5IJzSg1YkXVkZjPtfnNzjWrvHZKZbOeRHKTun0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbFkQHzbQthP2729RxMsNQspkeWA74Utp+h08MOfIH2XHl2fG3
	BTRjyjrLlYVo2sUFUoSphtb7s1rOd9tEnOyoUrQ+uf4vhgrbBxdVp3xjSCtGJtaOHe6E2RmDXtv
	kvmiASXl+d9ZMGykiq7cyUAQ/Gkl9nipcu0BlvhgxjQ==
X-Received: by 2002:a05:6512:3b26:b0:5b8:f4ad:6e49 with SMTP id
 2adb3069b0e04-5bb7965dafemr481889e87.8.1790865856268; Thu, 01 Oct 2026
 07:44:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:44:14 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:44:14 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com> <20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 17:44:14 +0300
X-Gmail-Original-Message-ID: <CAMRc=MeXfbPaGFYbeLdTeD51DQG3uXsH+Z_GE2WFhjQf+TJ5zg@mail.gmail.com>
X-Gm-Features: AclHuK84Ij5N3m9ftHZwtPHFGlACbpXIqxng1gcmEksaSr7PXqutdwHiGTapDII
Message-ID: <CAMRc=MeXfbPaGFYbeLdTeD51DQG3uXsH+Z_GE2WFhjQf+TJ5zg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] arm64: dts: qcom: nord: Add support for ADSP and CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, 
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sep 2026 17:51:47 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
>
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
>
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

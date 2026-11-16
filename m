Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820037;
	b=CWL2LeoI0Jt9ZR0uGa+0zvAjf46OI9Zj1/flzeMkPzS/AmR0ym+5xAOjtn10oeGcEERy
	 z6IIBICUsqfpPyoHUlIkXmjlbI/Skkzzj2b03/b7eMiO6hiFdMn6q6q5S3tgt66yVtjMx
	 sd64gynYvaKKRiOI1T98IKK995Fru7Pi9ZwqrTbei70BQ+O3tFVC0zoPVJkzrt0Oqu+Cq
	 HO9IF5R8vr95CP92kgzuSHaUF1f0wJIM6ZshrXi0wqhMzvv7mu0yc3PRDjXr9Ye0fswWa
	 0yGqQIT6g3SWke/mwHLRDdTotjlJ1HMTUVyyGqBwiPoL++r3OiDAd1P6i26bcn6uztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820037;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rm/t3UchaKdtiqPwazLlyh/gGsrLPRISrvENAfCooH8=;
	b=C4y/nHIl52Q6fIWWLDLMSQ4E067SzFVghy+xpywsLe4kSZ6QFeKyw96q1ZUsvuVfArYY
	 Mo75oI88bXgEJEXlujM3H+REUiDAKQPUvBkBS4yw3Z94ifaHeiSlvqWKeVZYf8Mg2ias7
	 BDb91nRjEc2AVrAij0HPywSIJhKLb7rJcNuG8m9FsoZqMIV9xRicygQ4eBXt7yERWXvBk
	 DaSsRvdYy0cTH3G9fZEQ/TzA4+KQuzLPtkY3F75xWmqRamMetJTom5csX7ZmT7wGyVJLa
	 /Z9V3N4LC/o9T1SRaEOebLNW/h5lQLSicOyTxEyrTew5uGkIe14UEYk5t/Ny34Nhelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="lkuxm/BZ";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA23606A31C;
	Mon, 16 Nov 2026 09:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lkuxm/BZ
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD4F5B5;
	Mon, 16 Nov 2026 10:04:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794819888;
	bh=WXZM0v7Iccc0YJN6sQ4Tx8wDPorwn1ToYD+9hhAWpd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lkuxm/BZ2UePK8LCRX7rGlh4744zQS0tXj0rgBall8N+8QEP2QrN0oNWfpoASriW8
	 TfyiFjuzPxwnBV6GivBn9SDspSN5s825ywkKBW8mdnezD4wuRW1HpyO/xWWrLBCRgu
	 uy25bWlz4+tg5C0csXIVZ4Id9cvebTsTuczb8v54=
Message-ID: <692d174e-eea4-4b5d-97f8-384de96e4eb4@ideasonboard.com>
Date: Mon, 16 Nov 2026 11:07:09 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add no-hpd property to the cadence bridge
To: Yashas D <y-d@ti.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, luca.ceresoli@bootlin.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, h-shenoy@ti.com, panchuang@vivo.com, kees@kernel.org,
 r-ravikumar@ti.com, sjakhade@cadence.com, yamonkar@cadence.com
References: <20261009064024.985688-1-y-d@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261009064024.985688-1-y-d@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/10/2026 09:40, Yashas D wrote:
> This series adds 'no-hpd' device tree property support to the Cadence
> MHDP8546 bridge driver for boards where the HPD line cannot be used for
> hotplug detection.
> 
> On TI J721S2 EVMs, the DP0 HPD resistor is DNI from factory, so the HPD
> signal is not physically connected to SoC pin AA24 by default. AA24 must
> still be in DP0_HPD mux mode for the MHDP firmware to operate.
> 
> When 'no-hpd' is set, DRM_BRIDGE_OP_HPD is omitted and the framework
> falls back to polling .detect() every ~10 seconds. Presence is detected
> by reading DP_DPCD_REV (0x000) over AUX, with an early exit when the
> monitor is stably connected to avoid re-programming the stream each poll.

How did you test this? I can't get a picture on J721E EVM if I apply this.

  Tomi

> Changes since v6:
>    - Reverted back to dev_dbg instead of dev_err for the normal hpd case.
>    - Picked up Acked-by from Krzysztof Kozlowski from v6 on the bindings patch.
> 
> Link to v6: https://lore.kernel.org/all/20260802153825.1570435-1-y-d@ti.com/
> 
> Rahul T R (2):
>    dt-bindings: display: bridge: cdns,mhdp8546: Add no-hpd property to
>      the cadence bridge
>    drm: bridge: cdns-mhdp8546: Add no-hpd property
> 
>   .../display/bridge/cdns,mhdp8546.yaml         | 11 +++
>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 69 +++++++++++++++++--
>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
>   3 files changed, 75 insertions(+), 6 deletions(-)
> 


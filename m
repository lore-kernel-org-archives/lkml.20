Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919854;
	b=dpNwGFVtGnosIdN1sP771iDK8Jar2fqGx2D2P2Ybq7uMjL02gfobDVnrwhyarq6kUtI1
	 oxjPY2iv5YKgPnIvA2//ClTj/XGvmHzKIo8TmBDOhpb+vaWL6KvJ3wz/oaxcC/31U8NN6
	 EGSonmMpEY84uVI5/fI6M9qgSQseDGxBLHPF5YkSrp9xRLt5odwu3DtBXViDA6f+pcgQ2
	 3y9FpQGLgz/NiRnX16WZM1Kkl+HCCkUuDaTssH5w5J9m1StedB96pZdLBz5byD2YehgaN
	 unFXGYMMkI7pEsFxVCxDV3pQW8lQHMghd1p/Wfb00UPKemxVSBtEFXFPcGScLXSFiyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919854;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=m//akQsPn9JtkIDkyJkoy5a2KvGmB9mNZhCGPYriT9M=;
	b=lfylLLnUw6o2bFkKWrEByx9vWEs2tHtpNNUazH/Vi+PAZs8kndPD3g/jcVggoQZW9y7t
	 ES/MCK1TnImemwCLqqIy8SmKHL7xUOY8FCDSAVxtqzKjAl8i1GU+VRmAsjRR9KCBr4EU0
	 uteM7bzGGQQfYDIQpvGKnTZqhCVy5xMgXaDQrhlYupXUcskzJaGxgUub1KuqTEVWslsuf
	 NbqhWplHXe5SMZcPvZIWQfDzSJ9Ykop1RCIfs5FTI7PK7TEajM3KDPFrEhPfacX4k0hl/
	 XnyXH+dHSylv1jEQuHlbo6hKUavcOMLXW5bFwZM9CNuRYlQMibyeBXHmastvwOZjULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QAQUUQk2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824F606A89D;
	Tue, 17 Nov 2026 12:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B824F606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QAQUUQk2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794919852;
	bh=/NNQdnvNk7fbdVxY6HWPt8tiESYBlaF64MyDZxk6kR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QAQUUQk2XnKGQnU7PdVPFu1sH89zSlyTMWLLxn0vnY9qL2Y88IyD3G4pQgZI/aeVn
	 B4OvT0d49SQKGJlc5ZCZ6Y1PW1zXSR3nMlcc82y/xht5aWLwUNTTipNpCAMs8bn3On
	 hrNLLc78iMilcMrfo7ofuWulPedX3ONL5tr/OB/3c9HmTMBlUvXD3KcnSIPuC5eBMQ
	 dSSNmah1e6qkDxReXzxsaAeVgzTSdgBcegcMVSGu/zjUbJuU4aKt2tu4Mtr9axVRO7
	 TTyS9yHCjitgjo8iQWiT06HOiCtpSxdpP0Q9611dXatIKLX51j6WpQGJczDF+Z51eD
	 r5XHm26IhcGnA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E61417E0311;
	Tue, 17 Nov 2026 13:50:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Subject: Re: (subset) [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply
 for Startek KD070FHFID078
Message-Id: <179491985132.188092.5906284430538056975.b4-ty@b4>
Date: Tue, 17 Nov 2026 13:50:51 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 06 Oct 2026 15:25:00 -0500, David Lechner wrote:
> The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
> DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
> and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
> 1200 EVK it comes from its own PMIC LDO, so it needs to be described and
> enabled. The existing Genio 1200 EVK device tree also turned out to
> describe the panel supplies incorrectly, so this series fixes that too.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[3/4] arm64: dts: mediatek: mt8390-genio-common: add the panel vddp-supply
      commit: 949fe0bd3a3a6ff0e4451ef38ef780f596d0089d
[4/4] arm64: dts: mediatek: mt8395-genio-common: fix the panel supplies
      commit: 036ce7562bef9a85d46ed6ba5b83ef4f5e60ad8b

Cheers,
Angelo



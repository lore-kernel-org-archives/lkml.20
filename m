Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577556;
	b=i7Q+Ufw1koCdh9iIgsRTghC1NcGxrCKYi0Zlh9O+XyNrlfaPKccDKOLowaStOyl6OOf7
	 1aUGaOwjChnMK2JdZQxSujLXJMomu6mnetYiUiMoA+idRwAdln8aeQqrAu3Im10XfVtSR
	 IriafvAoHs65j4A+PbXA4MQQgbQCIaEDBBKuu3yQ2K0Pis01jfZAaA+sVw2kVgFu3pYWc
	 u91I/SD/6Sae/9byKKNB8GOVCdEDfbjPuv96ZIz7ddeT1C+Obe0E3w5XIvYeSKd3QBdks
	 Kc0ZQoylkXJqjTSGij8UblaCuay82BdlE+RzSz9zirumHQgxo15hs52CQsUnhI8fbsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577556;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=OvqHYn6eA8PtE24P7V+m3zkPkqDeUlBhbG2I0ibGcWA=;
	b=leu/gzggHNsmgHgLEOo4b8VIJ+7U4c69RjqJljN5NWawgWAy8TC5TaZe+8XAPN9AJOEI
	 Qn1fEIX+kK4mzedWbiC5h4Ufi2Tswg+IpucU5krC3HkPCKj19nxreCOcBs4JSQ96kf/7F
	 JVUxilEUwnovwWAyQpmx5usi3J40DQt8p7WMHD4rO9ZwQwh4geai59FfJImGUVAQIJUoA
	 7MmAHWwAOwHhkKqykNQXIlVRPriWySY8DU8z8KVAVB5owdcZfrqpFHduzNmoaVIOqvB4l
	 R7Fi/hlAvSY9MxQ6ETg6B4MpBdRaxBHmpUJEAIgufcx9qst9uvermqAeImXWOYMg0ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAVE2pBZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457E606A327;
	Fri, 13 Nov 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAVE2pBZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF1B1F000C4;
	Fri, 13 Nov 2026 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577555;
	bh=OvqHYn6eA8PtE24P7V+m3zkPkqDeUlBhbG2I0ibGcWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RAVE2pBZRhxZT+r0zmPwbt0hUj2UbsD2d2pFMJVpezo9arETI2uh8ItFsqfgJJdX+
	 y/yK0oDsIryzfvNUevGwvAaLHhd75u7Dj4lTMi/tIT7Sn/jaTwUnpRRyC/k5plbaRj
	 +hyvQNaaN7h6XYqdRI+IEWdXTFvwlKM4y4Sdc9VAhPzl7+I0aTqIjvkUDPxub2zpZk
	 +kz+Iib3q9eTMwrA+In/HPAsFI7K7HapmorR3hR/ynOmGovwEmJDzieYyQh2Ioq16l
	 pdklyvOZnip8A6wwTm0AkdwxMezVwBUsCjimnD7P7joYqL2g5/v6c1fv+BrExcCjsb
	 dMGEoboU13aLQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com, 
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, Vladimir Zapolskiy <vz@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Atiya Kailany <atiya.kailany@oss.qualcomm.com>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v25 00/15] media: qcom: camss: Add Kaanapali
 support
Message-Id: <179457754639.652128.11064545317839632813.b4-ty@kernel.org>
Date: Fri, 13 Nov 2026 19:15:46 +0530
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
X-Mailer: b4 0.14.3


On Thu, 12 Nov 2026 21:33:32 -0800, Hangxiang Ma wrote:
> Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
> modules, with each TFE having multiple RDI ports. This hardware
> architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.
> 
> Kaanapali camera subsystem provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> [...]

Applied, thanks!

[01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
        commit: 846aacbf8322a2e395dcadbfb866ba500bb4358c
[02/15] phy: qcom-mipi-csi2: Parametrise the common status register offset
        commit: 478577f3db4a929c5a68a79828cb607feb6acfd6
[03/15] phy: qcom-mipi-csi2: Add Kaanapali support
        commit: 00926bc50707312038be9a2c8035198f6a868260

Best regards,
-- 
~Vinod



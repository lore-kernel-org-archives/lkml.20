Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169372;
	b=xWMjqdGK3IKLz8TEmUabh15hjBiFMBtgJAT8C1Zwy9itFOfdEQza9T191HKXwHklr/Eo
	 cVBVtc/UaEWLC4hfz7FYu+RjrDfBEA+Eon1F5hVe3cVGf1o0O/dxdSe+vTxcdDsxiJjwZ
	 0D2REm3ZTKq6ILDKMULX3qt5qWJO+a90xUiw64ms8Ik1m5pnoP+lNdQE2smr/GcTMlzjB
	 OOE1WbcqGsr3pS895GhPiWNBFoVhoaa/sPfWMG4VQ/k+bmJ6BdDlTX20AkEVTxOv/ozJV
	 mecHVwYenfLUUaLVktPUlhW87PLHsA3SwZ0ODTapIeCGANf0gMOT3TkO+Ez+2kEajZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169372;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EbzYZKw4Z4Se0P5JJESGy35Jk+CQhKCQTQ2rrP07VGM=;
	b=0paHMS+hufaj5jo8WGR2cjEcAHubW6d5gcv71OluX1GoYIcQJFI5sGClPqkwwIkAMpQU
	 lQpEQ/6ufqXuUCl0Kufkog1Py91mRxDxDQcvy2eOcCXOV+rszb0+ndlc5S4+0/mGmSE2k
	 nusc5pJAnx8lVk3UL/ysyDE3ZwrX7wQhlq7LS/1M6UTgFmmnvjDmkGT2aj9UtHxg6DGGI
	 zF+ngEw0lXyGnnOOJfrLaiW5O4nT0AsiowjDL2GnSMoJGN1O7HEho3BEtkOhXxapRZ1jR
	 F0mphFLPNvySQoaTmgG3VccPEYh7FMmzHMNo+VVpSX8OVsqbWSQeVWMl5XawmZYJ5tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Of2ZblCq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F087E606BA56;
	Sun,  8 Nov 2026 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Of2ZblCq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08F51F0089F;
	Sun,  8 Nov 2026 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169371;
	bh=EbzYZKw4Z4Se0P5JJESGy35Jk+CQhKCQTQ2rrP07VGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Of2ZblCqksLyI3601ikVvMQVdDnmrdQgSjCNRnJlLx4ajHed5Pfy0p3YMUxrvSc4y
	 x0d19HLapmrTJwUusGHJEPuTSe1XGddpG9Wms6iF+MS4XhUgKc6Nw38r8OEr1Vl5+X
	 +kGEUd6kKkGvLDd9pxCiq1kZCLdzf1H3mJ2Nmd6hOfRdghmYBWaT6ojxDKmW79Ciff
	 ApVqGo3fNy2oPqQSSVGHfh9bDb8nghYcQZIvMLNpvFGkoN0bAnAP5/AqVcb21zoDGv
	 lzh3SmMaAgHe32GREVHCieNFiGtqQO6sn90B6WLH5I034sDeAiFk61E1UYhu3J3CkK
	 w5Ve1QzveaI7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
Date: Sun,  8 Nov 2026 14:19:48 -0600
Message-ID: <179416929485.628393.4784056878909364367.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Tue, 27 Oct 2026 00:33:32 -0700, Gopikrishna Garmidi wrote:
> This series adds initial support for the Microsoft Surface Laptop 13.8"
> 8th Edition. It's built on Mahua, the 12-core variant of Glymur with
> cluster2 fused off.
> 
> As on the Surface Laptop 7, the keyboard, fan and platform profile are
> handled by the Surface Aggregator Module over UART. The rest of the
> board is close to the Qualcomm reference design.
> 
> [...]

Applied, thanks!

[2/3] firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
      commit: d3daf22e99cdec6e684d6d062adde7b081402902

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DB51DAE2;
	Thu,  1 Oct 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865573; cv=none; b=Kk499EcJLjPhcEHCKHHstObpCUBMFLwKH2gsIzk8qCrBOOIdW/UHztDbLXaAz8U7A1OWdcRFpQ0L5C+YJXSWBjwAPdanJutnMtidESx5q1dWLuUzc2I25V/O8awxVU9e8ScKJegMBgXSAKeBsPerJBLO/TRBe68YsRAFTcrjmWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865573; c=relaxed/simple;
	bh=UQodrojRWdunw259g/KepC5w4R3Sy7Iw+DAm9KoHMMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUsxydx5P20LlGvD4QlspQ/OCLNCuYm48EgZ70B/nrCxoTlgEHBRX4qxyGdGxE6Kg+xms82hXuzzScU/J7J1Nfh3AFJNSbyQjOGwffcpufpBg6zdQC8PD3dP4MA7rz+GmEP8QjSRBz5kXQ0Vwa7P5T/yZtynTG8aisYt4zlilw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIoOxdHr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIoOxdHr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184941F0089B;
	Thu,  1 Oct 2026 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865563;
	bh=5gBxnSBUo1FVdHLx+OD4FbBiYdJMzb9IMTBK0C1pcQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OIoOxdHrXQ2O104u4K/5GmmgA1ElkYVpkD5THN2O7XwhL+jaHOYP4hBLuT2jtuG4G
	 n1tofxLb2OPKirjQThFclFaDtdv4MmFnsSXhtO2mJzhmnUKJS+9PW6Bu2u2BodVqU3
	 pxCJL1GAm4yt8ZDofMajcn+5HmgOAQW16pTVRBSsuqCuK9auuOTjmF/DkVk9YuUOJC
	 2uWzDduGQ9zln8tZJOOv2JSreN/zi3UPYnaAIThXXVZhpSwr+n5m2j/gVHGZdO4hEO
	 9dMgg5g0ESY2lVzwE98NTGqckeOPnt0rACL5SYzv5wAynDqf8YD1Ork3KaiJNcvLbM
	 CHsRbuLt9UAgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: Add Glymur QCB
Date: Thu,  1 Oct 2026 09:39:07 -0500
Message-ID: <179086553010.3495936.8842384766206850857.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
References: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Sep 2026 23:40:51 -0700, Gopikrishna Garmidi wrote:
> Add initial support for the Glymur QCB (Qualcomm Compute Board), a board
> built on Qualcomm's Glymur SoC.
> 
> Unlike the CRD's closed enclosure, the QCB is an open form factor, suited
> for bring-up and power, signal measurement.
> 
> The base support boots to shell with rootfs on NVMe.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: Add Glymur QCB
      commit: fab66eeb06b3ca0ee1bcc0a04905b5de87749659

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

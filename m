Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285316;
	b=RhVUki9s6JQDgRDn5C6u2khQpKKMgdlNg/CvM25dGA8YlP/Mnx0bzZKhPlCFo4Qcfo98
	 JmI0x5kpAD+zYJcszJ2duFio7sAcwa39Ev8FGIKL6QPYo4O/c/vW9PCq5lrVhls+bjAld
	 GLhI0qegUpvwF3XQlZ34oLj2j5CQmYd/K9d2/DSe9+NEkL5pFieUeNwN96wociagff2qQ
	 /NN4FAcWoeCopU68MXtM9VzvVkweXKF/hoxtnmV4w7rNIn5TVxeoA43xBMsdMfzCO9kZq
	 isHD3OQl6moTKKxicHvg2lN3ZeQ2PYiuSFvq9A05hJROe7legrcm5f2eEGCOMPQY1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285316;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0c+Mrs7fdFlkOypjAPyFlv9lw5EYdXVmD/sbtaJk5eg=;
	b=uX4Crr/E2sYudWOM/DImRbMWwWfCzjFkhELTHbNzyaBKcax15Qlf+fT4xjtCLy2ed40f
	 Qy0TE1esBeHmqfhiooEKog0Emde6tb5bFdGqR0JhsVQifckxSlH/wQUNfMOL5eYX5n0GL
	 Yto0CKAeqCgNfoa/Vc1i/NN94Y6dj/FNB4hbfZzeLQmT1st8TMtqi20TNQkaTVf1ECsr2
	 De/4Q34uqnXIOKVTRNgNBfPvpszE2aGDtqxrs9Gu9ChvEpgHwXl6wpe21Xpx0aHJ/BDdG
	 lQqLk39Hc820NErG09PhNsablmKuVIYUmswh3BpzccR64GVsuApKI473JmXYgPTCnoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IVFnWFHQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E2D60A262B;
	Tue, 10 Nov 2026 04:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IVFnWFHQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B011F00931;
	Tue, 10 Nov 2026 04:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285316;
	bh=0c+Mrs7fdFlkOypjAPyFlv9lw5EYdXVmD/sbtaJk5eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IVFnWFHQg6eUwUxmf7MAtO1Br6ZEgzyutlzdEkEiOmDKwy3Qm2ZOvWxTfXyMb1gvA
	 KSXCRf9Pp+pFDKSYew3uYl3+lQHjBaFLu8xrz8EpnR9eg1KUc3q+6xpaTE2EscfVHN
	 LRW12ydntAeB2stxwoNo/kLevXrbz8dkPe5D2GAZozvXfFKgtECMG+1lN6wy5o5Kvh
	 7dviXtb0f8YbvUIHVKNqE/BXc8wCiaA27Itjkk/+vYHA+GBTCuwb5qg9b11pU/30Oz
	 107OfhuB3x7qAzUeIAUnl+geXAZ2NAyF3aZSMU1MV4yAZsNjsyze3Eu4fHrdda/EO4
	 WVoqFXriSR2Dw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shujath Mohd <shujath@outlook.in>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@somainline.org,
	martin.botka@somainline.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and PHY
Date: Mon,  9 Nov 2026 22:34:57 -0600
Message-ID: <179428529350.1061455.5732686238752911382.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <PUZPR01MB5141BA498FEEA594E61CCFB1C3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB5141BA498FEEA594E61CCFB1C3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
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


On Mon, 14 Sep 2026 15:31:15 +0530, Shujath Mohd wrote:
> This patch enables the UFS host controller and PHY on Sony Xperia Tama
> devices.
> 
> UFS is currently disabled in the Tama device tree with the following
> warning:
> 
>     /* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and PHY
      commit: e7bf7f1c2385d6f28bfa79b59fd2d555cb056da5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

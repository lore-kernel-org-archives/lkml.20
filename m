Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4523BF9F;
	Thu, 24 Sep 2026 01:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211978; cv=none; b=pKFgLRkvzsJnJ0gMw8l70h9vkCTRdjGXSPQo0Ky++mINBqQtBnUpKAUuRfNQnBaRcipqrj1wa4jfaIomFx681SPdEQ8QXvlok9OsDSD5YLWW/5P5pTBs54WaihRIxzOqvXv5s4d9Cu05jwAqJrBDLaLjzJzayLnRGw3clWxj6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211978; c=relaxed/simple;
	bh=/k3tVlQnGE+geNISdha5vBg+1/hv4SzXyw2/g3XVYd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5nZqG7PGpvXHtAC5FIbQc7DxT/5R6QmdVrtE+pJ7Ra4MAzDBCZlBdXr9xVs26pWAY3GWu9YtmR8Hqh65VrDyAG/H7LvcARmitn7pyWr8hygbOiE+t+fwUxDumTH12G47EfjFXV+nrP5N7o/HzOKoGjER312QDld85VQbovaQwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQGjoWVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQGjoWVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1411F000FF;
	Thu, 24 Sep 2026 01:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790211977;
	bh=6QFsvoCrCSU5MkigZo67dmwg191bAYwJmXW+iL+Q+Uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hQGjoWVahH3ZOXgCZzunfvL7XLenMeYHPMSS45wafKuyAh94C//Euekhu/uhX17T/
	 xklD0E91tEJLgOSyCm/bCXXect47giarmRUOoX73er4GxjiShQvD6iw7ZxOcmVWrDB
	 D1g4+Xa11a7yYtz91HIFg3ePCfyG1WJ7+k6Tk83qvrPROd39ADXbHjKCPkNgsTmFX8
	 CUwk8wKWGd/unVj5E6Kbc2uwmBPItcgbNbBBMub/fQaAk5bkwyUkh5w/3N5gkieCCG
	 2Ujjdfebw7oSOf3wg0I4x389r/Q5ZOVV3V7VR59YOC54ui9pzMePrloMbi86UVV3BH
	 RxASPVTFkhkzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: dts: qcom: Introduce Qualcomm Hawi platform device tree
Date: Wed, 23 Sep 2026 20:06:12 -0500
Message-ID: <179021133106.298587.429702810423504010.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Sep 2026 01:48:34 +0530, Mukesh Ojha wrote:
> Introduce the Device Tree for the recently announced[1] Snapdragon SoC
> from Qualcomm: Hawi
> 
> [1]
> https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-extreme-gen-6-mobile-platform
> 
> Series contains patches covering Oryon new CPU variants binding, IPCC header
> and base Device Tree for the Hawi SoC, MTP (Mobile Test Platform).
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU compatibles
      commit: 9b963b8288f7e10b696e887a35f1bea6eefc847b
[2/4] arm64: dts: qcom: hawi: Add header file for IPCC physical client IDs
      commit: 0dd1df954a04b5cbd3aa7029f2dfdafe15a176cf
[3/4] arm64: dts: qcom: Introduce Hawi SoC
      commit: 704e191149d37d721e9d062f3d2a710ca7b4b1ce
[4/4] arm64: dts: qcom: hawi: Add base MTP board
      commit: a22f9a319f29e222571b9b968e059b8eba06fd60

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

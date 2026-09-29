Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C53E763B;
	Tue, 29 Sep 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651743; cv=none; b=O+N/5VsZfDszllAFUQGxQ3MZQIMQJElhd8dErUT0Rv1zCDjPjHpAVQI1B/CYGwAeJyvPfOlNJROkHxedS2lmVGqyx4NvzVT7LVMFK1B2JuHSp1ao1noN80pfCh/1ZoF8Q5UIOJAVyhJbs5MtARbRBUXQ09gk9S/UGXjfkiP5kF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651743; c=relaxed/simple;
	bh=6fmDu9oKeTnBvZvki0sAEhPDS1T2DLdNqrjSKt7qIAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQbhkJ6+6tZx9KDVuJb+yi/jkIMxbJqRQvBRufHT6v5KHcE0IzmZIba5PoYrViIHcRHAn1Kwh87hiqWzrha/V26mtCi0H4IcgqnMZKL9cVqZbvS7e6N0eg4SgGqFrPvC4wgtifXYCtcbtfxqkhIXfY1l5YOMcCb0yyUY/GAJPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDmAaiFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDmAaiFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D951F00899;
	Tue, 29 Sep 2026 03:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651737;
	bh=IiCEdA5srLVTgqB2joGjGt/bh6Ndj2LteM5IB+cNsL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eDmAaiFnEG6CBQV8R/9sEvQhFKSFeJTA/I9+jfSQCjkoPYYSeSbA8pH4g97DL5Z8W
	 CgSb9cOs2hjCv3e/0NlH8T7I2LzZj3/k9HNXGlfxSDLqUi0/yjzaeM3k823WPyX0bf
	 B/kudHclizixuaAvlXPw1tWJfM38JcK3+xBC6pKLojdCIk69mNhJs2/wvoW4KdzMbG
	 Tz/OHnDT7IO0JhUvLA1ZzOx10lEl6DJ1770eDrxVQJEiGvbbdQQK19gmVcCOXZH1zN
	 F2T3MZWwAMLick/5+ZYUuHihJxOW3Of1SquSDCJ1bRxUMTCQR7vvzvBYMxtoZQhg67
	 phkW+g+5S+3uw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: (subset) [PATCH v6 0/4] arm64: qcom: add Ayaneo Pocket DS gaming console
Date: Mon, 28 Sep 2026 22:14:38 -0500
Message-ID: <179065170956.2673486.2412553778088893976.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Aug 2026 22:58:18 +0700, Alexandre Hamamdjian wrote:
> This series adds initial support for the Ayaneo Pocket DS, a handheld
> gaming console built around the Qualcomm QCS8550 SoC. It has UFS
> storage, WiFi/Bluetooth, gaming buttons, microSD, and USB-C with
> DisplayPort. Game controls are exposed through a Renesas uPD720201
> PCIe USB 3.0 host controller hung off PCIe1, while a dedicated gamepad
> MCU is reached over UART11.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: document the Ayaneo Pocket DS
      commit: d48e40f83e5e19183bef2ff7b2b2b8455619bef0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

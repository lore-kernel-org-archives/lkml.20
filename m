Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA444AB7E;
	Mon, 31 Aug 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187178; cv=none; b=F6DMFeAiCDexbnIGg+IrLyg1gx1G2bT2w7YX0hL7JEegp3STF2SLlszlK46gfBpitdiZelJKhBUfoDWoAgtMiNET20CSBRErrzNKuxJUfuGfATVuX/DTWaCFzUyWeGurp168XxjoElwCHzg2ZEEUW54PAqjMTN2XTmhK99LurX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187178; c=relaxed/simple;
	bh=jXYbbaEzPpVfzH2uC80/Gi9AWZqqg9dJMzMRSHYT7J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZONyKzrfZz04ahyPlS3oR0itRN7VrTund+RNyP28CuE6BAxlDdE6esRve+hqqTxyHuDJamqVWV2JBqqSsZu/V30kuiV4N8VNCTUGoV34gXXkwMrEuSG+R/v+gJ0kSKT/aJdEhJEmQLunTW7i5omvJsJK5Up3I/iQRgeFPNUdY6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXIBTTz/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXIBTTz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6082C1F000E9;
	Mon, 31 Aug 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788187176;
	bh=VOZdkojqjI7bPPPACXNLxFq62DGmOK9QW8kCLaGyRfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NXIBTTz/qrXk74eAMRgTXsxAO5/skQr3coJy+dQLqzNUTCpPDBlbFWgtnRm364dL8
	 8oKKSCw0/fs8Cvj++EYltGCuXO3/Y24DxlZaarfYZrnCB5HZuMcia5X4cPM98jlwHZ
	 wniHK07f9qN297+f2BfbE9Oj74XeZwY/yorI/EkMxBfRpNwJgEasa7tS5qHRUm+4Wo
	 JdOtlfj5M7zQvlEKITEc9s3nGxG6lS61ojobcou7Rk5l8WcY7qStSaUdmFUcEMGscY
	 HVS4U4RvXhsekHUPJtSeCvg00+9mB7sZCUTWWnzouwEK9sJh/6YPlOIkqtkl3NUIVD
	 SlBI4ToH/wg5g==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: apple: Fix cpus node indentation
Date: Mon, 31 Aug 2026 16:39:22 +0200
Message-ID: <178818713419.102394.18003296593525183600.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 30 Aug 2026 16:22:06 +0200, Sven Peter wrote:
> Just a small series to drop a spurious space in our dts file. No
> functional changes.
> 
> Best,
> 
> Sven
> 
> [...]

Applied to local tree (apple-soc/dt-7.4), thanks!

[1/3] arm64: dts: apple: t602x: Fix cpus node indentation
      https://github.com/AsahiLinux/linux/commit/011d96a065f6
[2/3] arm64: dts: apple: t6030: Fix cpus node indentation
      https://github.com/AsahiLinux/linux/commit/1c7e2a0cfc90
[3/3] arm64: dts: apple: t6032: Fix cpus node indentation
      https://github.com/AsahiLinux/linux/commit/db6fccb5a422

Best regards,
-- 
Sven Peter <sven@kernel.org>


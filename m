Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E523C1F4F;
	Tue, 22 Sep 2026 06:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059316; cv=none; b=a3qgndrLPEZ8t8f8nJ89ldDMaj1xpNi9SlBNGV9lQVgPKh3LRK4Knu9up6OCmD8w5rZsb8+6bDC/2eq7Exya49Fffgv1twLL5Itijif7ISRjHr3EqJ83h+2ou/VsmfirRk1MC+JxHix+CnvOdzD3D/RrchAxvXJEhgxd4jA5ukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059316; c=relaxed/simple;
	bh=MhjZa3wgllmRAO0BQy9DXxkLnS0K4iYUdfSooRsMZLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AdSLAbO3VopTeRp/yPEcor8k5Z9yUXUl/ky4IlEiZkSwxylKO/L++HA3u/f5SpPkA6fHndtw7oPld5NeogfHlehYxlaK5IXgMC2jjxLkJc3GGiU1/9FTQonAptyljHIq/EQPHYcXTWPW3Hu3/p6Mn+EQTCkfQefqULX42bL6+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elvscenE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elvscenE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528831F000FF;
	Tue, 22 Sep 2026 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790059315;
	bh=fKq8Pd+IrYIhmTfjiXM0xc9evQeYupJSgiTwqknNByo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=elvscenEAu6o081RV3og1212GNvhKmyX/daXtm1XcRH2EPQp4bfKtFwkpeVA0Kz0j
	 HwsTmqS67zyLJFRUF0S34sUltwPk6TpgYMbixF6+dVIDt/7hpvU0q/GtoIof3kH9yf
	 WUn03LXrmE+WTs9TOF50ohjP0VqCaj9rifYv11G3EfxyYfJJOq8k8a4cc4VYiyVNRc
	 p8Wu+YxG3CT4IkAXfm258ay+t4ODvk2GRbgs6VVVUDIewzt31s0hMPkbMGC6iqXoHz
	 NPmerFfeVmzcOhHr4bR8UPBWF9kMAE/5hjOTC5smPk7Wbcw3wCxXm6JvHIK7aDQvBZ
	 FgXWp/sW/aXhQ==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] dt-check-style strict fixes for Apple M3, M3 Pro/Max/Ultra
Date: Tue, 22 Sep 2026 08:41:35 +0200
Message-ID: <179005928268.4871.7584482094844751159.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 10:40:30 +0200, Janne Grunau wrote:
> Hej,
> 
> this series fixes most dt-check-style issues in strict strict mode for
> Apple M3 and M3 Pro, Max and Ultra device trees. These device trees are
> small so fixing most of the issues helps to check that new additions do
> not introduce new dt-check-style issues.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.4), thanks!

[01/13] arm64: dts: apple: t603x: Fix all blank line dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/eaec5e1207c1
[02/13] arm64: dts: apple: t8122: Fix blank line related dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/aca5ce9bfb0a
[03/13] arm64: dts: apple: t603x: Fix child-name-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/c7513cd44e08
[04/13] arm64: dts: apple: t8122: Fix child-name-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/29cf25245028
[05/13] arm64: dts: apple: t8122: Fix child-address-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/2448980d56e5
[06/13] arm64: dts: apple: t6031: Fix continuation alignment
        https://github.com/AsahiLinux/linux/commit/030d45664eb6
[07/13] arm64: dts: apple: t8122: Fix continuation alignment
        https://github.com/AsahiLinux/linux/commit/14ed3757881a
[08/13] arm64: dts: apple: t6030: Fix most property-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/bd48cf6ef754
[09/13] arm64: dts: apple: t603[12]: Fix most property-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/d9ac2af8714b
[10/13] arm64: dts: apple: t8122: Fix most property-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/8578146c48d9
[11/13] arm64: dts: apple: t6032-j575d: Remove unused "framebuffer0" label
        https://github.com/AsahiLinux/linux/commit/be0bd5b0d880
[12/13] arm64: dts: apple: t603x: Break overly long lines
        https://github.com/AsahiLinux/linux/commit/d8f5ecdd7712
[13/13] arm64: dts: apple: t8122: Break overly long lines
        https://github.com/AsahiLinux/linux/commit/6b49aa53f416

Best regards,
-- 
Sven Peter <sven@kernel.org>


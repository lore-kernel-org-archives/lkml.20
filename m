Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E436949CF45;
	Fri,  4 Sep 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534526; cv=none; b=UgBY9VBQkn4KdBl9R4a852TwWVVJamTCL5OyKS3HkQD1yeseXI9/8CFL/vIGFRteNRxMcx4njY5Sn4O83KlUY+jIRdFH8w2dMM+NT7bKnQMBpf9akI2MLqqC7R+rHZTaFWx69VAYL6/n72r0Poh54cfzAdE+TwZst+6pvBe+vMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534526; c=relaxed/simple;
	bh=/Sz84cjM/WkNc7OjvlzlSI/jTOJRmAiB0LFZjsvW2v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXxQ2OK6rx1fXtigIZoeMrBNg9KZJ/D9+WbfvF8Xljn7zyOObSq15KUcLhZoOW/5KQ71AZkO2VDZJHLMw5sVYa1C901JZDFyKgPd81HY+INdnQNJbCvptzRt+Px2jlkoct/RnemSywssigWXV3UGlCIOfGu0PV1ByMGQhuiCR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2lE3+q1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2lE3+q1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126D21F00A3D;
	Fri,  4 Sep 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534524;
	bh=ARvk+jeiMUzyhbYcfXcJvSnOgQhd/AjgGwr4YyE7wU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B2lE3+q1t75Z/keg6U27hOdQWvP8u0eogpLupMhpMzoGVnjHx1j+FvSgBJBLHMxvU
	 1yAWM9S66TtsB9Uo0fNgdOqQXfvtHEuf2Q61vVBofpp2AJSPa5A8DfOyS0tLBy+9tL
	 6gxfdxgbJ22F7GDTjyyMaErDk4ku3DpvY6Of8pRR5cmk0H4HVRX5FMZJBWJSTsW7tr
	 WL0p5Kn7roZ7Bq0MCy2dRY/S0SvDbBEjSjnapnCf7uDp9FumgaD5yuOwPOM+tSoyYR
	 cUkIBHFYt9cCCr4OflYzcY8E5vRikyHsvswoI3Sern0GLuRfpKIERUN6Bw7cKQRYPf
	 EfhuG+vuvVpOg==
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/3] Fix dt-style-check issues in Apple silicon multi die .dtsi
Date: Fri,  4 Sep 2026 17:08:27 +0200
Message-ID: <178853445265.30635.15460192495790532545.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
References: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Sep 2026 15:59:31 +0200, Janne Grunau wrote:
> The MMIO nodes in t60{0x,2x,31}-{die0,dieX,nvme}.dtsi are indented by
> one level to signify that included at this level. This looks weird by
> itself and dt-style-check comaplains about it. This can be fixed by
> moving the referenced soc nodes into these .dtsi files. Since the parent
> soc node varies add a preprocessor define for them. The multi die .dtsi
> files already depend on the preprocessor. Suggested by Krzysztof
> Kozlowski in [1].
> 
> [...]

Applied to local tree (apple-soc/dt-7.4), thanks!

[1/3] arm64: dts: apple: Fix style issues for t600x multi die .dtsi
      https://github.com/AsahiLinux/linux/commit/7973168301e4
[2/3] arm64: dts: apple: Fix style issues for t602x multi die .dtsi
      https://github.com/AsahiLinux/linux/commit/dc0336fd26c4
[3/3] arm64: dts: apple: Fix style issues for t6031 multi die .dtsi
      https://github.com/AsahiLinux/linux/commit/f3f2d38a606e

Best regards,
-- 
Sven Peter <sven@kernel.org>


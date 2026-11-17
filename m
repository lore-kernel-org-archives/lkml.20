Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936731;
	b=Q1L/1j8Nuhz1rLlyX6pN/cxdsRnUR7P6+PgeOpmJkqR/siUHz/gzXShy1ZdiVChhigLR
	 CnHVrX505sdkflREFBJghE5S6CFxrkIc/VS6z3WxLXAFvsoX1sJg4uZfBoIqxTAhjmzOK
	 4VkWLVdPcmCy7m97tu6SPlBRF0HzT3BZKbUnpaadhPD5kHLexg1fQQ428eJZAKwh6dV4z
	 8Tjq9+W7mIjWHzbB/jwWZH/1LMEYMCUoQOHKUrM7W6Pnx0LX71Etdj9IVTww1pbRwNBu3
	 noqHxakXV12ioS/rot1NGr3UoaAzZ8JsQivkJzZxJQkH3KBzwvwclqo94hlOY5BjGTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936731;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SX9Zi7NY4J8KuGZWjjWNN3iulz2Qoe+4jXdOY+ezcbE=;
	b=N2+oVwX0Nv7con5yyxvu3RqhD2cVq6cAltmKQojWtYY+JGX94ufuFfbI0SL5DHZCYc+x
	 /zBKLcZmGO6RTa/ACGBpb7Eqnd7rsAAKACCLvaPMGKPS6oODZUzA3byb7lIf86Z3CMsnE
	 PKjh8W9xB6IsSj/CEBiAO0obyyOH9Tcqm+TPF1XqC9uUSlf+21bgxeP0GMKC2CIdKNfDn
	 7KkXJtxYT5+99WtrufLX3VJNGjUIoH1SkpaYUiMMv8rxurRYkme/KiIDbewuRUBoNLXV/
	 vk8Df2xL/PQgmenvcjSmFdFQ4laQdQ+igGeew8C5W5w6Dcn0q+b7YAGbkU755pbnk1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnL4jEBq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCC606A31C;
	Tue, 17 Nov 2026 17:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnL4jEBq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6271F000C6;
	Tue, 17 Nov 2026 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936730;
	bh=SX9Zi7NY4J8KuGZWjjWNN3iulz2Qoe+4jXdOY+ezcbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FnL4jEBqMmo1Tm13i3F3Tctwn2yptPxG+RHBaq/ZLxtY4tJFHdHDPnQYpH4buLVd7
	 MyjaKO8/+SRdkrgAko/D2lUJSLbQdhSalUwfAdDLE5wdna3vvAAZurz2Uu3X76hwkr
	 vKckrsv5X0dMCf10Yp/6LwI8gtzE3b5IT9rQOsHaJMezBMiBrH4Ih1N23ESQ/8DBtg
	 IGoLXLHikvJW7p5k1x6bLt02W2Q0iuI91LlbnMLcDTt8hA202E6nLyM6noRw4SGCIp
	 KhitF5A52/weplifIqUOURu+mGBTASoy3BzV8rGfaNVmPpk9021wAXYURzJ5G9wYe4
	 GTgh1+mnRpnbw==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] arm64: dts: apple: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 18:31:45 +0100
Message-ID: <179493661268.33444.17877290451078457632.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On Tue, 17 Nov 2026 14:06:17 +0100, Krzysztof Kozlowski wrote:
> The atcphy and touchbar aliases were never approved by Devicetree
> maintainers, because they were never documented as actual ABI.  Drop
> them, because no new custom aliases are allowed for years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/1] arm64: dts: apple: Remove undocumented, unapproved aliases
      https://github.com/AsahiLinux/linux/commit/477f3d0f46b0

Best regards,
-- 
Sven Peter <sven@kernel.org>


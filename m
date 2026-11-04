Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790091;
	b=lMGe4DQsOxjx7nozIsHG58Rx0fbMEHcNowo6dinoTUm1WGjUNESNX+gZK7n1FCp/rtPs
	 UGS/67+fy+2DUEWGOEKeAQMRakf3FHY2RSWbhCDhGktBv4duw1uEZZsXGfUltfomiwN0e
	 LJ1+VNuygP5xcmZMC1aWUYwAlln9KtmQYVYJpDnaOqYBwjhPeKg7uCl0CPanQXcixNyip
	 n6G9woyD1h05oVUmyENNj8POsv70/7tL0Mdr35k6OYMCMmrro79rV0D+EKa/R6LZZFT4o
	 tYAVXvAe/bBxAiXVubZo4Mwx1wsUNWd1gbEqBDO3U/VWvHYu9X7RWCRwjU9tjfwEt3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790091;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=685pY4H9qeBM1wsywJSdzE2w1qA5QP83iyiCyy8GEUM=;
	b=0kUXvANnxGxEG4sqaVVjWjtHIE6Rj1FD4LqDQpKLQaMCY5MA/tM5o4Rg1haXfvYk+ur4
	 St7eSGR94tBvaMBWv5Scw21t5fc9yi+siahqrvLcLdpkeo8jUKz6z4Rl54w/8OuS4yHxU
	 SjPjsE43WpBeK/dJf4G8bhZvwK1efeKQ630G6nFI5vRhgIbgVolteYNqmQUHaZPhpzRMO
	 oqxANU0BJFDYeFjtfX90SWx9+ZyBLmR5nvHKI92FyrMW8OcPCwU4b0G7R2erwoVfMVnhi
	 TwVQQb25pQkNdsRNVsMC8TKLVqiiE3Cb4dWD+1wsaaNxiYwJ9QJQcDvo61FMj1iNFYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIEE0s4d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E21606A31B;
	Wed,  4 Nov 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIEE0s4d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BF21F000C1;
	Wed,  4 Nov 2026 11:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790091;
	bh=685pY4H9qeBM1wsywJSdzE2w1qA5QP83iyiCyy8GEUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QIEE0s4dQNvXBJ0e0z9j6+5yUE6LsVEmsJUBcZ3/GNkTDRP4OTjN55dyfC+E8lOIB
	 fDyAYLPlCRUVqozkfsh56w5mJV3zWWeDs8GpqvN7pIaOXyGqS+e/hPHBp32ZnVC7Yj
	 VPqFRZNZh2dXU4MVflvk2B8Cshw9PCt3b8LroYmMZ80ZJrzyspPnoUMvZEFVraJYEW
	 SQi2K5rwsGMzTyKLB77Fg2R3nE+zCYmYid0KdH1RHF59sguLWU7e1yto7qhA4FnNDP
	 kAkfW5QC0kzcetTxZdWpEIFPmGJorS0xWULu+dpHDFjxdCV6tqD+6+PH2LFahkoxxA
	 dqEA+4W8fZ9/A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261104113206.3243865-1-dawid.glazik@linux.intel.com>
References: <20261104113206.3243865-1-dawid.glazik@linux.intel.com>
Subject: Re: (subset) [RESEND] dt-bindings: mfd: syscon: add
 aspeed,ast2600-i3c-global compatible
Message-Id: <179379008960.1643299.8613980903865635886.b4-ty@b4>
Date: Wed, 04 Nov 2026 11:01:29 +0000
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
X-Mailer: b4 0.16-dev-ad80c

On Wed, 04 Nov 2026 12:32:06 +0100, Dawid Glazik wrote:
> Add aspeed,ast2600-i3c-global to the syscon binding compatible list to
> document the AST2600 I3C global register syscon node, which is already
> used in aspeed-g6.dtsi.
> 
> Without it, dtbs_check reports this node as failing to match any schema
> on every AST2600-based board.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
      commit: f0508479c70d9b6f2c3b859e90f710ec5f2f4d9f

--
Lee Jones [李琼斯]


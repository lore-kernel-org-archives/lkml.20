Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994723;
	b=NPpT0ymcK7qp5srj4aK17Avcr+OmQW6rmsSDOWfbMLBFxkokovO59rsGzgWSPHEEXcZJ
	 RwCHWLn9h52d1hf8hi0g1g7AXq6MWH9zHLo4/eZhw8EAWjRZNj2+ljzrutuGMJidqS//I
	 8ivZAg2zfQDkON0YErR+SZGUgi/r6usex12KjeAQfOfhX9XI6um58a3+I9vkSyD1ln8Jm
	 qqEsKAyaOvQFLs+QJoD7WEZNdlMissZZOw2wYvyb2imbX3/RNW/NxgjyohIcMd6Hmr8Qx
	 4GnzoghvEtj0NxsjXNmGzOIaQuE93IVtv6JYJeZk6T06rGat/6wNAISVgFidKcmaQrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994723;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FWoIj6liytooXdy4J5X8/rhyOjRa8fsYIflXbsEmQ60=;
	b=gfQnVOr5GkaX5/F6bOBnq4Lmb9KSicy3T3gYUKhOVamE0aFrvcZjVeOcew2jNl0VvhEZ
	 DF4+HTDiil2nB1091ZEgb0jfC6MJf0Z/i2rlyXBVzDTYGQ1n8Q0qWZQoI7IYoDDqbRPL+
	 1WJ/0Xg87CLZr6ToogVjQJDZzV+6GDV6b4Hbc5LF/AhCLil0eQ/Q4TnfUIt/OL9aOKAhG
	 igRoNCnla2BzLLT/bsFCXE5fvlydthncUq6//4PbVl3ZzH0xYfjCsrwT4FsoHGgmqhqaz
	 wFdJQ8fiLoADzKTCKjLtFimIAaNzrL2ULW+zU8zC0vVaYt2UyDm9uWjBdbTk44XnL9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRM195IP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D41606A32C;
	Fri,  6 Nov 2026 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRM195IP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1261F0089F;
	Fri,  6 Nov 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793994722;
	bh=FWoIj6liytooXdy4J5X8/rhyOjRa8fsYIflXbsEmQ60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gRM195IPeXcFlP41Ze6+edyjNYkY+yjIMs7gFzitL8c+DZYskErazrJIGklyDM1PN
	 V46Cn5f1olE3VaoYNtvXMCsXZD4gDyFEa9+S+FFxoxl52RroALl0nXm5QnpeOFVgyN
	 am/pZdcrPdQssfZOyjgJlauXBzOmRSiWTVrXX/GCOQKjjwFoh9HDvxwPZ1wSF0W+7M
	 bQBASqaeN3ddSOeUEK2PIKX4EP4QuQnDeYqEezuRCGYKfS7IuQGfxjli9LG72m5nQr
	 k0M4zvh1uJRcR8wKJjfUL/MW+0FlwEcMzA/MG6frL5Vpta764zjO3i7PuA6JjmfNLp
	 +xFbE0/gNy0dw==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for Apple M4
Date: Fri,  6 Nov 2026 20:51:46 +0100
Message-ID: <179399468585.85920.11928833306229144804.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
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

On Fri, 06 Nov 2026 17:56:12 +0100, Yureka Lilian wrote:
> mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
> this makes the M4 device trees broadly compliant with
> `dt-check-style --mode=strict`, leaving the same exceptions:
> 
> - the property-order and line-length issues in the generated pmgr nodes
>   are left as-is
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/4] arm64: dts: apple: t8132: Fix indentation-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/c1d0c2e46812
[2/4] arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/e63df4a6b4af
[3/4] arm64: dts: apple: t8132: Fix line-length-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/0199d5131009
[4/4] arm64: dts: apple: t8132: Fix ordering-related dt-check-style issues
      https://github.com/AsahiLinux/linux/commit/84a1163b0a3e

Best regards,
-- 
Sven Peter <sven@kernel.org>


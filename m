Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596852;
	b=h40CB1Hdb/Svh7dpboIVFvp6RWMZjbgKHW/OxNTHQHPmWaG+pemmk48mX4jVYbUE3DVC
	 8DvAKvrdK7r6oK7xgdhOdK1QWD+QvryyyyXZKCQVqjwYnDSrfBNRpsswhxPjah7QL71p2
	 c7l+BtWEUIdIoJKGUZ75ZQqAePwV9algWw98VjRoqeZa6nbT/oU5+i9RAzR+trULUC8NN
	 SgMxMj/IIZuKrEJXiXHej9beRQp03sB/LhQA01oUyz1R8eKR7QQDIjsHt4WmerxjXoN5n
	 JHkQzixIHN0gcK5QpNFdnwa3U1QJWqkZ4al4vElQoQH1qVrzPyGl6lsK1AP6hYOt3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596852;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SLrfXA00+hH91pGEIcQKSgRYTU7yqxAgPUEz82JzvDg=;
	b=xNjXXToGkzcXfihTrXZbkcUv91N15ep5iEBF/Iafgg9Xs10SBnNcvxODB82Q1LXGES32
	 XvDS4S9RwT9NqcjLvDSGDRoKZRIdBBbHZj29KC2TZrJiWkZ+rDTyVtSQAeFZuUsNzFnFZ
	 r9aY+ykzX1p8aeIeTnoTzfJAfzSVDNMvMvjIMRiIyB6dDtrdAG90HCSjHWg6T/rmEfcmq
	 rUONn9xtxTU21g1RuUJx9ECJvcJuezoIRHjSL6zBAxYCxXWs/VC3ShDhT2VfOM08HmGXS
	 MCzKTij5g7JMUtoIyKLtY/6ay/l/tKCuhcexRYdS+Xk71rkzu/ufzNG+lwhmLskLnOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+4sTtT0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107BF606A323;
	Fri, 13 Nov 2026 19:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+4sTtT0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCDF1F000C4;
	Fri, 13 Nov 2026 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596851;
	bh=SLrfXA00+hH91pGEIcQKSgRYTU7yqxAgPUEz82JzvDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P+4sTtT0Id5ZgijBjq9xYcStIPDQ/YM3sl9szzlfiVjvbWAiwLKz5hL04NpNY1/6R
	 YtANNLpg3qatWMuYqzhMYOdXiokNeck4pRZQbXP7sdYG7HziVvNP3kl+BXuTgF2jJ3
	 uHuBtIZJJZOYOhcZ6K7KzzWjaaGsmtTiMkt0y0XR6kT5SVcHhkWJvnNrylR9QFTCsZ
	 P3gJi71VVj1WqpBQQvLgS5FNSzCrGVzlm7S+R+oxhB0nOZoR7hfyjzfypghVHZPUF1
	 /66/iPsbo8q0JPc6M8RsrmgbtUqmD6rZRjF0G8LNHJJpqNNsSo2cdfNEQXp1y8h+P5
	 SDkfIH5QNrjyQ==
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
Subject: Re: [PATCH] arm64: dts: apple: Correct white-space style
Date: Fri, 13 Nov 2026 20:07:18 +0100
Message-ID: <179459682365.12029.5906784319850612479.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185414.183418-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185414.183418-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On Fri, 13 Nov 2026 19:54:15 +0100, Krzysztof Kozlowski wrote:
> Correct minor style issues around white-spaces (e.g. double space before
> '=', missing space before bracket, spaces used for indentation) to fix
> dt-style-check warnings like:
> 
>   t604x-j575-j773.dtsi:27: [mixed-indent-chars] too many space characters in indent (more than 7)
> 
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/1] arm64: dts: apple: Correct white-space style
      https://github.com/AsahiLinux/linux/commit/c769d37ba473

Best regards,
-- 
Sven Peter <sven@kernel.org>


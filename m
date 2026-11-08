Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161857;
	b=AqpkZxGcnfgLNVC2kEdOSgvFqwEK5fI4KhBeq4gGwpXxhYPzV5UODQhZwdKqhruvkLFa
	 iIe2HHv21Yd58kqPfTgiqmrMgpd4+zSslau5UfMF8C2PxxmlGdLYKxNzOd4JRqxSjvP0J
	 QmaKu3aNoA3V4inlSV1wSH7sFDw7LzNkpIsg8g0tStkrf+YwXRzwqbGhHi2pMmaq1kcI0
	 J5zDUADDb2uuF9oFwzymXvGV57aZc9RWZs9GLEkvIaQfEbACvYRerlYTJ5BLt9EpvqqgC
	 ptAOqAzwA+MZ55Gn1kjqxMlr2rvOudou0Z9P2/6WU74ZSni5OUdJyrYDav1D9VxtINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161857;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=g4hSmDe/hNxM+mVYy6mm3ToAC8B9Vj/cAi+kvaP3/tw=;
	b=aYj7et84qdQFFE9Vxq0O361dD0ydfV2bJg6dv74yRvB9x3Phv+DxuFBOZsh2giyoNPOA
	 1hMC6/p4LucJs6AEIxMkZVpdh0tUHYQiX13F/7a6awW6WX+VlEzDy26n9V+lhbenDtniv
	 NVYpQDIJZqnXRlaELiKhbyCto1U4Gv2dO2jtWbyif/3B21aiqlPkMkL4I5ZO5pBIqgmAt
	 Y4UerW/SCKX57OHO7p9ax6yodneczwcYZ7zDdutKntSzN2YF5cIOCvgKYsc0Olyb62Mx5
	 H/IF/V1zxbwSPYlGiknCs6yPCr7CgXO/MMV+igCAY3AFy1AD97b9KtydOz6fiPWWC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAkHLf5B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FF8606A31C;
	Sun,  8 Nov 2026 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAkHLf5B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6208F1F0089F;
	Sun,  8 Nov 2026 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794161856;
	bh=g4hSmDe/hNxM+mVYy6mm3ToAC8B9Vj/cAi+kvaP3/tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hAkHLf5B2tv9F1+dzjDqdVR6k60D/15cmhkxtgW897siA9SGc0XscJqjW4V/ech4K
	 yw4+9h2O/FbgBD1BN1G6gPOX5mRPlKi0hUZ5cvwoWE1bIZwdq+QUcCsQFvYBMnHbyN
	 WGgBu3JWpqhRt+n23qKZZJbXARtzGL9jgaQX/1h+DOLJzl858I8c4rws/umvBP0qW+
	 s7phRIXI/RdWSD3keJZ5xTw47MTDzittQDNDjWQx6IO7JsyRV6VgSLFp6vC3MpHyBj
	 JwMrf8s/nt18oV4+im+WnzWjrdwAsHo13pxY26pXPdUaOLfrRG7cZeVivDVJ3wVmky
	 dEFab83yXXfJw==
Message-ID: <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
Date: Sun, 8 Nov 2026 19:17:31 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/8/26 16:43, Sasha Finkelstein wrote:
> Adds initial support for the new t8122 phy. USB/TB only for now, DP
> will fail to negotiate
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>   
[...]
>   /**
>    * struct apple_atcphy - Apple Type-C PHY device struct
>    * @np: Device node pointer
> @@ -599,9 +647,10 @@ struct apple_atcphy {
>   		struct apple_tunable *lane_usb4[2];
>   	} tunables;
>   
> +	const struct atcphy_hw *hw;
>   	enum atcphy_mode mode;
> -	bool swap_lanes;
>   	int dp_link_rate;
> +	bool swap_lanes;

ugh.. somehow dropped this comment from the email i just sent..
is there any reason you move swap_lanes around here?


Sven




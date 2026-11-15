Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755247;
	b=e6AevhyJ7s4YcE+aef+IQKXetSCOTrixH0Oh2Td3clFCRVJwz4VaP7BqEKSfpiYnaFW+
	 hDACLB4keiIpSlLYjOz9gzOksqdEFghBfUAH/MLv5roTgvhe1a4tb9hWjLd/A1/PjsOUE
	 Fr0hZBvDx40EhCL7OY+XA0yJgfDU0ZGrWEhTHGZa4d6/+gOTMEzEuLTC+UmTmXNFgaw3Z
	 G1/6gZSii5ep28lOt4lbwGz+OFjO/6YrJFCuNnDJOIMFw8cLPTGwhvusFLre6NXsb8m2w
	 6WrO7Ahu+TMWHxQ6mbWQA3AQQ4z8RQbjtM25H3XSNxR1ro1fgOkNkC2L1BeR1DlmpJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755247;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=6raE7EuXz9WU17PRTjvAl0L5ym8soOrbRFnYzh4Vla0=;
	b=WEYNGCSbboAsAKvN1x8225VZPpmKlQp5+56B1mcmcG8DRcxF1JGXY1vEIGRAH7Rkiutb
	 FvASjlZtOb9Sx8PgDXeDOBxKm8pZLGQ0+tXp3xpLtHC7T+bSQpMn7FvUfbgLHRrWmmNmx
	 ltjpLlR6wfZ26eQ06K4GsWe4CyBv3TgmOjZt7aadvPTN2ZxRkqNJNW5CdsSEDZDSgRHWD
	 BDDvMyu0YMB0nQeHeqrHs0ZjA38qN1xuFxVmX00I5LhMTkat9/TCIy44UtupeQufNUBrJ
	 inpYMY4NomW1i5eQC4+uN2ePpEBrLXbSs/rsuCSk0fjaOi0CZ1IF2r1oxAasvEOqwAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIr7lunI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F4606A88E;
	Sun, 15 Nov 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIr7lunI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1509E1F000C4;
	Sun, 15 Nov 2026 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755246;
	bh=6raE7EuXz9WU17PRTjvAl0L5ym8soOrbRFnYzh4Vla0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TIr7lunIUvxEuCpZW8GNFmjj/klx/pfRMyEkyycvEAFbDhl1vbJljndXwKiQz6mRV
	 Pp42IOwuA840fJh3rsfjwepb7aaGWr++YaJPYuFvVDlmktlHB9XnD1NKCFUJ7pFqeo
	 ELplCPSgxR312azDwrggLn7PmonMdmhTNthe4eFDMiSTml20u0zBmiAa2hkdOmPwUp
	 inz2x8rLVB5SvtyWPPB6Z2waZ4SU5DL/VWVlys4uUXO09haOV2LFKB1hweGZdIgRKH
	 4narH6KqYr1WHGUhe/4CUrhwINJlAVEIRRYeGeMVYY6I0CYqM/DuxVznDDZ9V03nwo
	 gbZO6n3HmJw1w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261115150536.16212-1-jernej.skrabec@gmail.com>
References: <20261115150536.16212-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: yuzukihd-chameleon: Enable the
 GPU
Message-Id: <179475524484.3273316.16506023091021816874.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 23:07:24 +0800
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 15 Nov 2026 16:05:36 +0100, Jernej Skrabec wrote:
> The Mali GPU is supplied by DCDC1, like on other AXP313A based H618
> boards. Enable it.
> 
> 

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: yuzukihd-chameleon: Enable the GPU
      https://git.kernel.org/sunxi/linux/c/c3b0d2bd3ba6

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


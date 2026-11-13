Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584255;
	b=ymE932qXcFjSFDXFn6qYu6UEpJA51eJq6TApo2vitzYDyAlScCStw+dOG9c/FxK9/jyy
	 K4kClfS6IM0njXSMGbiuDkcxKpvrmTJaVu4K4y7BVafrYblzKPbd70KKDaHvSNMBpAo3M
	 5Yq5NedlcmgiVCb9GYG1bVnyrKhXvI7pPuLUZXsBub3sa2HjEWPKzhzql8giOtOr0p7r/
	 9OvqNL3nLeIuHspocOEdUF4CaN3AQ+85OP/7lKYiRpc8zh1C8p8F064Gx6UJpn6VELQ+o
	 QGWJ3wx9JrwtkxdSqjQEcMNyQOQ8HbZnVVOssPrVzvwqA51BRHiBacrjPPufs6wA3vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584255;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=dQwYTNSWCKAOB/J0Y9PjYpfnxUeCALrjoZcmSIcdFqw=;
	b=w7Vlck+zXbLYPjcPpbpPwgZNvnGIONyMmUTI+aXnwSGVXqsWgjKVTqnO5b/GjaBh0V0H
	 vZEfXAtbEDvAzcxgIBpGTQUwu4KyQhvcxZVxkfm8BvCWWbD1NRV31yZvmkzUv714pcgfW
	 9x+t/FB/kAAAzLecYxzb2ybgqQ7NErPHrcdeL9v96ojSoZKxpfVLAXZ65qEbDzM41HcZn
	 4AwpGPEYt3rT7Ctt6mSwSuU3p4+TjWT6ZApRpDRFnxyG8lDkecGCiFmgT27kQh4aO+pPy
	 TxPOLHt9OWUr8VFut9olDK5l9VzkJxGVbfIVeuLL0yLFJLZ/oq2JlbE1L/kR70JKtgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuklyEEa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AA1606A323;
	Fri, 13 Nov 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuklyEEa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B3A1F000C4;
	Fri, 13 Nov 2026 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794584254;
	bh=dQwYTNSWCKAOB/J0Y9PjYpfnxUeCALrjoZcmSIcdFqw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cuklyEEaXXEOof4kF/RaWAhvaGCxKaUdReSuAk4q2DLD8h4/cq6ODqiwbuSIdcVOT
	 1hV4R9kXubMQh3vN2PAo8HPvFfuqo7lIclEO2xFgBQfTD+zBJ3RnWeyBie1RhbFUly
	 a9WIFfUIhU0s88Hbl0U1mGsRWbhbVTUbK3dI1SGr/bHzsdxsL53OdaTkY7fXZ8h+d0
	 0iB14rp7H7ZVe0iWSjgzTFfHFk3CbMONHEHx7INa9I37TMsIa9TJ8V54WzrZnjDAqr
	 pqjlX/P5YJ3BFhxeTlnAYlv1Hq43AHGb9sXMo1qusAbp6gcsirQYsLiWM23ovyYKtZ
	 CZM0Uv1wQ87TA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261101085754.277830-1-jerrysteve1101@gmail.com>
References: <20261101085754.277830-1-jerrysteve1101@gmail.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: bq25703a: fix input current
 limit default
Message-Id: <179458425262.78277.16044953304646222724.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:37:32 +0000
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

On Sun, 01 Nov 2026 16:57:52 +0800, Jun Yan wrote:
> Section 8.6.6.1 "Input Current Registers" of the BQ25703A datasheet
> states that "The default current limit is 3.3 A", while the binding
> documents 3.25 A.
> 
> Use the documented value.  It also matches BQ25703_IINDPM_DEFAULT_UA,
> which the driver falls back to when input-current-limit-microamp is
> absent, so the binding and the driver now agree.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: bq25703a: fix input current limit default
      commit: e7bddc71fd17d786c3cd46fb5db1bad56ed8c66a

--
Lee Jones [李琼斯]


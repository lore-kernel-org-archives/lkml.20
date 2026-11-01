Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529971;
	b=rrIJifkbY3GxKF8HboZgdX/N43/6uRAWVl5ZwalAoBKV1CLTo5/t0nrMdlZ7W1i0WcSN
	 PJWC13DR9tNziC2L6XxNo1p3ShAI/oWllAjlC3WjFxA9dowWrhvIcsw6nBYdnpMI6aDBQ
	 agZO9lQ4oMudd+Dd+WsnzQssINuHVkZHSWG/8NsIPHqc62Uk2+ZRIBHUsjmNj6iANe9Ex
	 pcyxvYhFS758lGfe4TpXJoFlR9Y9TDCXRLI6gDGjZFAtpsl/PQtFVaqJEx4VKxEPr1Oxa
	 UNPtgFlv/YY/oE+n44PuUb8uaR0vXNJoiErglKYwSEAvW3kdjC8FseYcUDuC3bHjQIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529971;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dGR9kl6uTtgDJSJ4dH0fCa7ftWGcF8J5cSIZIw5rbBA=;
	b=e4oVHFjtS4rIfnfRfxdofx1erNUGs9XnbYzzmqr4L6ygcbUbZN4ATmE0wrTA7SQtFg5A
	 mMHwKSYGmE9XfXeaZd2DZAwZ3bv2NOFBQWjXf9aWKaHpI6t4ouaPq46HZfvMgiHlQnC1p
	 ncuQ4DOUvRtYUk15HlG1yS9LnDbnlqULd7SmWtU0Z0k8oZYcQF48dN3pt+kUxyMkQwbaH
	 zR/ngf0Ln5/gd+ee+/3EPMXimMjtu7H63AeJ2SVKwdzXrL2lgTByp6I6eG1YFrdiq5Ry9
	 SawsFdUGuCVsP7dd/2zrsuyYLMtGZBsxPvoacyjoTHdOeV7wCEL+P6qdOYFFT7QATng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bc5NfN5/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E72606A324;
	Sun,  1 Nov 2026 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bc5NfN5/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5C51F000C1;
	Sun,  1 Nov 2026 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793529970;
	bh=dGR9kl6uTtgDJSJ4dH0fCa7ftWGcF8J5cSIZIw5rbBA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bc5NfN5/LMPfNnPeH99MX6m4M2u5CrxRnQOG/BPkrvht/YNmLJwSIrTBGmoQxjeLW
	 T2Bg2buuYUycr0aVCtO/G/R2MJllHhAPat8oW/r1LdDyglvl2+Z2qDd0CKsWsPqXnn
	 j/sGVuY4gR0i2OuWmFHB/qu8qO1BzBXWkcvsCgfinMF8BR5+CsTYkRkwP/RUP8iK7L
	 B1OhEfAUIW7V5JaujC5Ylnb1W4JzBYfeqG8HPISXqmUneNsDDsmr740/E3atYdERwo
	 txryab4YqUcz5YKcElm9LGuN6ub5NCQMenoBLyOta7rhnYmLuPSSowmvHdOUSP8jhB
	 wN4e+sEzuMavg==
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
Subject: Re: [PATCH v10 0/3] Add ASPEED PCIe PHY support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
Date: Sun, 01 Nov 2026 16:16:04 +0530
Message-Id: <179352996432.2955.15360734272963479589.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=699; i=mani@kernel.org;
 h=from:subject:message-id; bh=0ZANUh9mwDKQrUQv7MpH+M4ZYnBxlA+EOdANf6PQOj0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xhuBnwVQvqgNHtWmOkbL0QfJ00VCESNLH3kq
 AAEIBKEXgOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucYbgAKCRBVnxHm/pHO
 9bdlCACpAfx1ovYivAViX6ocpuk9V3nGVQQRN4wHXNNOOh/d38VrknBLYT62wsga7ryzjp2/Zv0
 1ycwqaSEHLEKjDlrOEv7qk4yQfA138LlOE+oIXYKFEc7vhZTfBgBRoZ7oQ4rws3YlD1jy+N1+J4
 WdxTxkfAyTF2wo9OgzdidKUyKTKOy8hCieWaxPdlyvCpxsjN+ZEPFs67UREsDvNGOiChBMJBe4p
 YWyNIWolqgwTP39FsjxNJyzsK0t+TlG/rGpqUZ2azF3phE3VQtXFO+TNnIuT2Mn2RB9jSDNzf4p
 KEzf1u1uq/DLyo7kv91RfgR5b23/clTvn/sQIvfvnGJzFplV
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-20 19:59 +0800, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe PHY, including the
> device tree bindings and the PCIe PHY driver.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY
> - Implement ASPEED PCIe PHY driver, including reference clock handling
>   and an AST2700 host bridge reset sequence
> - Update MAINTAINERS for the new bindings and driver
> 
> This series has been tested on AST2600/AST2700 platforms and enables PCIe
> device enumeration and operation.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



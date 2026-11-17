Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877526;
	b=1Z/QHoClN3SiaqE84GYPiP8aO6fTWSIjw8Clh1NTNu1d70ROe9y1Zb1ReSxM1Qp879yB
	 22F+pQnp45BXGBjQY8PjbzTwxgAJH+JF6skpSy0Ir67L9W2y0rFVHsE0+jYgC5wIgBzuh
	 Xkm7A9UXUdfBkk6IYv5d7cG6AOJEtA6q6BCdYvCSQnQZTdpOCJbZsr8rIcelTQvnaiQUx
	 9ubFBMLvFh2lzDYx+9H6CVuY8LsspnwVG97sPuuAydJOf7ZEC60n+gzKArcn2Rw8+0XnH
	 NknyV1GrT3cbjypvWtRnq8iVn23Jec+LvJJB6nSlcT0vujXqWLU0ZRpvHUEWZwAuM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877526;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=24ueQjwBTzf7OiIceOO7FiNQ0adiKCF8ozorRQaBtaA=;
	b=IU6d/YUIIVps4ROlIXZEZKc/tmXLdiJ+/TKDTbCUkRVdJOw+xGOTQU6LNOjF/PphYBRD
	 Va8k8bJ+HdAWozq34ZSzDAMVjZDRknEPIE8Qb7TV/k+CjCVVocwAwUEm6BqAPpCgYOC/U
	 fVj94mxTEJzblyireNLpVVKWtuNSQn647YDgnRN1aklxcuuAahHnCRZ5X/tEjQM60Sms4
	 CkfCkr1VjxAwKi4VG9mjDiuQnDPMSwgY5lo8Qf+0SLZUYBrKmxPkuxmYZGQG0hX0Zw4ng
	 FC4fmOIhE4yoaKWJjOnxwuE9yameBLtnX3RFGd6Z1JDibhdCkeRf7d/Gl+q7U7mIIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkjRltlE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA77606A334;
	Tue, 17 Nov 2026 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkjRltlE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1792B1F000CC;
	Tue, 17 Nov 2026 01:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877526;
	bh=24ueQjwBTzf7OiIceOO7FiNQ0adiKCF8ozorRQaBtaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZkjRltlE5a7E8YxQvHEW7tXuHEcf01+aQKAnsOsFDNHupHyhtxDNQWleIAE1+nhQY
	 nQ/YOFnDw1l5lIMFkc44qRHLLwWxltjLKGSNABsCBR5bjiL3gDkuTl7YyC4bZJHoo6
	 ptTCSKWaZ5fw7P8LwFpCtlXU0MkfPzJiRYZNzPtjfDjxsyfLpq4jKSjRhFYll5L/NG
	 lPLWYCU7BeJFGU0SWQz2qsMOor9CqIJjgIYqwwB8GPywg6McVqJBnoAswcVjsktAo5
	 ODSGFXSX9N6vZx9p8O+6ti5rfwxsXoaa2X2wGwYpjLHvp5WI06Dv6fFwRu0OX+issN
	 bcY1wcS8US3Kw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: Add Nothing Phone (4a) Pro support
Date: Mon, 16 Nov 2026 19:04:53 -0600
Message-ID: <179487749301.432567.124951122288341145.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011095221.24767-1-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
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


On Sun, 11 Oct 2026 11:52:19 +0200, Oleksii Onchul wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> The DTS describes the UART, GPIO keys and reserved memory,
> including ramoops.
> 
> Boot-tested on the phone with Linux 7.3-rc3 using a minimal initramfs.
> GPIO key events and ramoops persistence were verified. DTB and binding
> checks pass.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: Add initial Nothing Phone (4a) Pro support
      commit: 10f9ebeff01f527b06b31e849e0dc49ae0cd1294

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

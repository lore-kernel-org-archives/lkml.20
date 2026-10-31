Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445936;
	b=qfslSsYaUVo8sjlFPWJqU43dnsNnGN4E7vmlQeQrn1WSAoczV3OHuvfRs3NYMsak+7xv
	 BVKCD06hWULRXLepopiU6WDIebJmo2REYExMtyhyUYggivCLGSSNccknReL78AqcE3RVz
	 sclvPkGER3sQ0VjNtEl86eXj1f1+BoayrMSgD9OIdP5TjlyxESfhQ0qp6ofhahzAglwP+
	 nqtHB9BLhp9DupP3hjwIPQAi65wHh1LJ4twN/D2pr+e/nB1S+4HlL6z7ZT8dbqqnVwaTl
	 mKYOWZgmZgm0xuvu8SFw+K2+1oqFxHfBfHNVMUKj5Y8fFgzNHkRgGE6S0TYldRcCA1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445936;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=InhSuQzX2Qo4hzloq59erNG6ntibb9DPk76qmN7oaRE=;
	b=GiVlqbj7vqZBEUD6LJNWhKw/dBRV+M+VQNfjDX1XnBZcmD5VZGg95/4w9bw2NgxcSeqN
	 DzPdDVj5aXyoUdmOuGlyBfiL2OdRNU/pIzui3r2XDv7JvaknIbbx8zbcuKKQz7ftTDf7V
	 Q58iI0yQqX3CVFqsAx2WQJJJLHgGP4pT0riXKTPn37Nj4J56UQCUwF4fOi8OiYE+FxyF3
	 NmguzZ7FlrXgjtRpA2XXrmCv9dsrELbwjlIesiQySpFGrSyb+DHto7S/H17xdM69afS43
	 q3hTuDEoy8BrPIFE4MrQkVZR2Do33a4RgHmatTwNVu5U3fA/CsC8D4tnpFArp1cLnPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i6B/eEnT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F4606A31A;
	Sat, 31 Oct 2026 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6B/eEnT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0B91F000C1;
	Sat, 31 Oct 2026 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793445935;
	bh=InhSuQzX2Qo4hzloq59erNG6ntibb9DPk76qmN7oaRE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=i6B/eEnTkVci7ph6JquDygoTschto3B+lsxrCoZFx3JQhbEr90uPF/4L8GaiPaQ53
	 SDH/nIjrSQ34mudAi38FUwcqsOSDHdPg8cKCF4JXpXFprxO3K5250D04sCnWQmDC/v
	 cMlnpZ6b7L4dSuPdam2aw/A1bALtfq3wceZSV7+ykfrcmK4liH+ioeSt/XZuz/iOu+
	 3Xy7HECf/R1xsSLc1GweUyDk38Jyk8YPuoTEGTZbM0usePOIIrWE3V3cOaWOQehzcx
	 N7G/o3ll8CSHr8ZupBPxbJrmm4ZEqOyTBoe3pIvp2LRc821lYkiWCdsNMr1twA0IFD
	 twmwXOz0W0rmw==
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
Subject: Re: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on
 Nord
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
 <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 16:55:12 +0530
Message-Id: <179344591278.3206.14914499205414660912.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; i=mani@kernel.org;
 h=from:subject:message-id; bh=Bp1eeyBcx+/7p6XDs+S3rrhEbdITENP1L4LWuigshjo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5dAmP5TdPemkNJ04zPS+Yo66I6VmLu2tFaRCS
 LWaWlfg7vCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXQJgAKCRBVnxHm/pHO
 9bYdCACmxdJuvqCRV6gRbLPk1KZkb800xMyYIZeKXr2Xy1e4Z2N3HR4sFSOek4M0mSQZtupw2eT
 QCery+34debBBQcbJN+9d19jjlz/x92YdGBuKkfp6EU+ARVD3XuK+FMtt1QK7lok7DSs8Grtdep
 wUzgDi6E9XDUU8WcV+EVT//B9rjR03gP0XKUyMiB3bByweCXBKKeuvhUGd+dxLXPRCxODNd93p6
 eft6ApNaKw8oqvYmci+2bC6PRCDIhCi8A+18kvlEH53TBKeOnjW4nKRDXqoh3NnXq2lGBz65zhc
 xklKiDrDSz9GRmNzQHD/MUtDNGKZ0ppmTo0h7u8P5ntfQbAo
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-08 09:50 +0800, Shawn Guo wrote:
> On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
> by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
> fallback, which only requests the "ref" clock, so the bridge clock is
> never enabled by the PHY. When nothing else holds it, e.g. on boards
> where only the USB20-only controller is in use, clk_disable_unused()
> gates the bridge and PHY init accesses go nowhere:
> 
>   xhci-hcd xhci-hcd.2.auto: can't setup: -110
> 
> Add Nord-specific match data that requests both "ref" and "bus" clocks,
> reusing the existing Qualcomm init sequence. The bus clock is enabled
> and disabled together with the ref clock in phy init/exit.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



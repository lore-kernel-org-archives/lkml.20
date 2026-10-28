Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190403;
	b=xqNFHRBgNTUg/ZAOC+fDeer+HUrYe2upIMj1JVRQhOLh3Kik9EBb239Md5LU6zn6/fTL
	 6rpUUCuL2uTulR43tEkHCKhtI/VFYPh8T0ZqYlkcTm1V+D9qMecbfCJytuDSdXaN6cve3
	 jTxsiYwk9NM6qI/ZapFRe17x4xEpYYa5QQ89KimuvGier/tMOhvp2Bln7X7W1MoQSCWmV
	 LBPG0kSYOrdRdwsOhca3NKc+UmexURd57A2AfIneaK4gyjzcCMIdAaTpdfA/c/tbUtxSe
	 ONbFsIUi+5KsQSDmCh0Btmwl8P8oCJUs4t9R3ow3rva01/QsaW0uiOI1tbFKdh23bZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190403;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Nl+iYw0LPM2qJU28izRxAhKGykaUojGg+hrj05SQt9U=;
	b=dgEWJla22Bq0FSrHucd0QogxCqT+Kefm0PXL0Ow9cCgQGRiynTJYU+qK4J5lLpwLW9Ik
	 iLgFbF23Qr/yBrU1oE8AlbmpDeCFlDdLBxsMvJJzEAD5/3cBi5CVjVJTElGGPEylWNArZ
	 2MSp4AKgGIzLN0frPQXjVzWJ3P9Fj+0cAqUCP2fcWVcVqb3XOA5keQEj9FgZWq9VuzmUJ
	 3X6VUbGgdqfrD9Dk07Yq5VjCZnaOkM8vP6260B1hDlQOH+j3OMT4/hVeQPnlFAL3yYQYT
	 vQiJhYZGWVLTzCKkcLhYaCFv9k+LHU/dX73SXzVhr6hm6Ii4j62Ea3b73GNkMYVvSIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLeQxq3E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70695606A31A;
	Wed, 28 Oct 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLeQxq3E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600051F01825;
	Wed, 28 Oct 2026 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190403;
	bh=Nl+iYw0LPM2qJU28izRxAhKGykaUojGg+hrj05SQt9U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jLeQxq3EqmL+ZNsfmLuHMmsN1JuAX12s1hPnPIUtQPcCE/fgCvuenF1ixwFcE+Z4+
	 ho986GAYvR5HYnui7EsPuaop4EYy7FXD9fbuGUhFnmgwXb79WhF8M5MoPPwGAfjEab
	 JJZLw65nAx+t1cvn5ehxXwua9GuxwV+/IZkv+D4wgY30mrflPkVr6vwxruMH2RRynl
	 8ZjlNVCy98eeVGXU6CrTwnMH6XqTNWEnyAmYVQgMhF/h9H44Y7HTQukupl/tqpnqa8
	 83zYBr4+HShtJvHctnPg4G2eF+usYH2Fi1eHl/UwTep5IFDLtIJ14q+6hL2O6MZPq2
	 STMM6eWnOjTTQ==
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
Subject: Re: [PATCH v14 3/3] phy: airoha: Add support for Airoha AN7581 USB
 PHY
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261006102937.10972-4-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
 <20261006102937.10972-4-ansuelsmth@gmail.com>
Date: Wed, 28 Oct 2026 17:56:33 +0530
Message-Id: <179319039371.10280.14715290131373013201.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=780; i=mani@kernel.org;
 h=from:subject:message-id; bh=RUJq/WI6WEMNCXi6b5aa8T8284lY0i6iVNFgZaShnUQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4en9+TkdSNjyln2O384bRQmrJFULwYzDcjb20
 syO+Oz4QhWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHp/QAKCRBVnxHm/pHO
 9ee0B/9ssp1IgWidAezyFy5oARkD3AhbfTvj4WeKvbmmWjFl2883kCyz7dufYdcl9YSsF1/xrPZ
 i6t5SXL9Ziyg6jkBUQr3LcaQJe82BYH+yBd6LjVnW8BG9O0NOp0uPMOoQJpBK97+N33ogZ/QP32
 PAaV1jtopZ4bdgfHFAM98LeB4D3fWYOTUVpjdWPBjyyWgMMAnx+0VTYi/jimn2iknJb4XaWgwFx
 huUEBKS2JhVloYMWRoVOi8XM5I+kAMsq5goQpHhjky5K4h4CL9XWP2/PLkyRMFtUk2Ep9zolHdv
 qLeYqhC2vtCrZkV7pY5khjwILt2ZnWLKp/sucJO7enlzidj3
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-06 12:29 +0200, Christian Marangi wrote:
> Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
> USB port with USB 2.0 mode always supported and USB 3.0 mode available
> only if the Serdes port is correctly configured for USB 3.0.
> 
> If the USB 3.0 mode is not configured, the modes needs to be also
> disabled in the xHCI node or the driver will report unsable clock and
> fail probe.
> 
> For USB 2.0 Slew Rate calibration, airoha,usb2-monitor-clk-sel is
> mandatory and is used to select the monitor clock for calibration.
> 
> Normally it's 1 for USB port 1 and 2 for USB port 2.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



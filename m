Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530638;
	b=wrZ9ycEfjs3HvTGv/3LpP3ocwoJXLtfa/+Pbky8GpoxQcsWyEIV5p45OpUL43mSjguXc
	 6s6iQEogiJteYXfX0ppkUSsq5MtaoaqmLcBYrOGg+j7vX6EQCVmrJx/m39UfWrBYduyH6
	 C2BuXvL2bfTBxDmDQ2SVUP91yhaNuXZPvJn1ZgisS63DGAsF5uBus/UGB7nleZd/b/e9C
	 kHWvhRPDUwlrFDBn4MsKTeJXgIH2sG3wj6SyuEjELa3j28cHU/B1ct/R4D8pyGaiy4br3
	 WXduSe3VQ+z5SKHRaLTehz6xwIwtgQdzsHthHEPA1ZUSQz+MqA4e4Zdu55kI7Or3dMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530638;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FPyMFEUcKXcYLPj3SZ4RXokmH+ZqUMsZhVs5fGpLBAg=;
	b=TVXFA40yjdZAftjDFDhD08qN34eL0ohZcuAEbS2ikqyultWSUYWCSQkjMLE9K853HlvE
	 qAORhgKbTSPZiNdRTXOSL1j5allN9dGPYbqDSyPqJgZo8vvuN0EGF6QmM4TQa4uMFEZZ6
	 dBsUHHIm7KuPjRe91XgYLv16ndrkFwgUMuhOu8utJRxOFZJ/sbcfJQKuUZyo00S2VVexO
	 ZOBr1s1RuLEL8qlvPu2ys3Ds3ToeFdd451WRAGoaues2VSl5jNP7sg0W6psbPOCJUiE97
	 AIgxRVFk439ITG4jvXPZVXibvcodRSAo5lzHhYsLsbD1WmNMils/Hf5Ljzeh6TgwDrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhJKIToR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AA8606A324;
	Sun,  1 Nov 2026 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhJKIToR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806CB1F000C1;
	Sun,  1 Nov 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530637;
	bh=FPyMFEUcKXcYLPj3SZ4RXokmH+ZqUMsZhVs5fGpLBAg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KhJKIToRNnVOu/L9DG3QM1hLc9WLvW8m9stIsBLvuOc7epIhoEQeP0k9CodQ8fUWh
	 5fbfa6lQAUOOyhuUaEGPo/uhTyCOIw5cwBm8gUeZNiLLUZP/QdHrA9ncB1HUK56Pc1
	 cqRoALNJxCAeVv9BCGcaiTHsv5Qe3OzRAw6vWsvuqhJOBFO9I/tntMSzv5E9+Uwktm
	 g5A59HsbLd5CQYOtuDDgIWWY/3bBd46FPTLBwutOEDn3uwVg/Im2ZXCdATDMY20kiC
	 2ZXnYv/XQT+0lbBlzBYsgYE6pR85m2a8+4PnQIWBgfVxDreDgnid1Xcduty2/q/n0L
	 FZ4XAP5hjYs2A==
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
Subject: Re: [PATCH 3/9] phy: broadcom: ns-usb3: Coordinate NSP USB2 and
 USB3 initialization
From: Manivannan Sadhasivam <mani@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20261021172819.668120-4-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-4-florian.fainelli@broadcom.com>
Date: Sun, 01 Nov 2026 16:27:10 +0530
Message-Id: <179353063083.2955.13880869162770253902.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=mani@kernel.org;
 h=from:subject:message-id; bh=+w89rIM6bdKq6eInREjM4c5sW5jCJpKaaFEeIw3A4uo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xsI/woMZF2KfXqELf41eLLQMq/1ndO4/13gR
 +SaOxyujKKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucbCAAKCRBVnxHm/pHO
 9bVWB/0VV5UADU7HY2QWHmjXlE+zvoi6miokaEvcjgJxr25wBwkn+tJbiDZCVy1hg7yCz07RtRZ
 SRa7IpQNbZ75i3yJRqToR96W4+M5oMLUFEeRT54PVqFQ5UhnBE5/cvWfDgdplWVOAuHZ3ixp3Ol
 I83JY//S1OOpleOLiv6BNg8ZFFPE958hhmkZy6urVhYzAfmqj4tLVbXl6ZlzNWcCFKq3VvPFOtC
 XhmOyWhyNnhNPyG3imyGd7g1REaB4vnFlvZtecmye61hYu/7J+cXHE96v3/G4SqBfyskcii8a2c
 xZRBU3iegVUH76oZA+1rc2MON9DGgn5Is8iwl+8Pr3vyOXMz
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-21 10:28 -0700, Florian Fainelli wrote:
> The iProc SDK holds both USB2 and USB3 cores in reset while programming
> the USB3 PLL, then releases USB2 before USB3. It also enables the USB2
> IDM interface clock. The Northstar Bx initialization used by NSP does
> not perform the USB2 setup or retain the SDK settling intervals.
> 
> Implement an NSP variant with the coordinated reset sequence and
> interface clock enable. Sharing one PHY between the HCDs lets the PHY
> core serialize and reference-count initialization, preventing a later
> host probe from resetting an already active USB2 controller.
> 
> Retain the downstream delays around reset and MDIO operations, and
> leave both NSP cores reset if programming fails. Keep existing
> Northstar Ax and Bx reset behavior unchanged.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



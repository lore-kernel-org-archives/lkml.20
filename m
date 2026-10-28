Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190239;
	b=OlY+iBssdQrxuUk5WtRinbyhlJ6QwuUCLgUrJoW0aDNhQ4/UVc2gd8KA0KrObvb5QKRX
	 Oa/lw0sYZpLuakwkl2vVZUZNlwzho5gTEpfDt0OgBaQW/Z6AmzdhwR1NwuVGXN3DjZpR3
	 c5WWowZiBnPsBGQ0iSz2gXHmPwGB1j4gcp8luK1j3w15i2RNOZT+yPERUuatkS5WJb1VF
	 1gH4KTBjVX8mV2rh3doJzrQ9OYXT1+frWIWDxjOcAkEY/49JRytzHCD56jPOwyiXw2QT7
	 xjoTbDF8R3XPbMKKozJGt/Eifj1pFo8pqhwBZoTOeJP5IIaVwipNHJBkHR0B4AyecwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190239;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cVPfinBcqbOTfVLlNcyfK95ZPjIWvy4g7kt54rOT7UQ=;
	b=Jngoy6qTaXk2uHlE92Z1r7w4oNzAUP0C5UhVCx5EpvTte3nEtlYp+aHUgsIzqyavLNx0
	 MS602fgKzvRfSNg/kiMZtkbvqI4994NovAklaRgEvyaxfOtW74/RssT40GmHxvszSTge7
	 3wfyJXEVgAVMPOA8PY5M0kDMfk+3iXWZFn7jc/PIvuc8MhZlHez5GOzXWw6d0HuQCdjjW
	 iIRNlAHtAf+lS7dDudh5Q1QvLK2iFaRf6UV5CAWbs4H047NuQtaDMmOfk2kp9Gyio4o/8
	 AQBwpX5hvNj1aSxwrB7d1t9712powHtYhL3KhcciAhfm8KcGObnqyC83DBcgCO5ZZ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7QsyzZX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E949606A31A;
	Wed, 28 Oct 2026 12:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7QsyzZX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C2F1F01825;
	Wed, 28 Oct 2026 12:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190239;
	bh=cVPfinBcqbOTfVLlNcyfK95ZPjIWvy4g7kt54rOT7UQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=R7QsyzZXVOBspXAzif+Uty1yaR7OocO1eksw27ZhIaRbw/zacVji13CDlOTud6Swz
	 U2Pr9SoeMIodt6hlwTKc23qnEot+1Xf+3Fpmqs2sc0x+gAy06cQPwl6HX50O//Vwg0
	 JfeUTjqUb6rRdtqKeiyFtt6jrxr2rPqr+7BpvOubiYfbBNjj4q1AQgL3IVswavsSPa
	 uVG9pyHRrxOYa6AUoIOQF7N8VrJo7GhhRsf5VfthPgerxVv7Az9UBhLHjeT4p7vif6
	 G1sW7qs05H+nVGh2G8fnJ5PUmtl5GjcNwmlcRVNtpupitI1FhE4sJq0eEI4OVZNEUH
	 QK71F8+3qDytA==
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
Subject: Re: [PATCH v14 2/3] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261006102937.10972-3-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
 <20261006102937.10972-3-ansuelsmth@gmail.com>
Date: Wed, 28 Oct 2026 17:53:46 +0530
Message-Id: <179319022610.10280.5883386163307156406.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=mani@kernel.org;
 h=from:subject:message-id; bh=Mff5QIqkdgNj/liBi+gaY4m1v9rfasm070afTA3Ry+Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4elVXqDJm3di9PWM5V1+d6+9zjcjgs05/y0rW
 f5QcVFPU3mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHpVQAKCRBVnxHm/pHO
 9dN9B/wNOCkrjfY+pJYF9ctJ4uUInfPKV3MX7T2VRidZvY7axyDCyG/TuaH5jj+U+zn17S+ed2D
 xMfyNmPCL/+qG0lSSQgF3Tlh5p9D+nbMjFxaLX1UEFfLs9gJ+pib/zWf3vi+J6utQoiP3+91duI
 d0PPqg+eSkmmiwT/JT4QJgTyHNmK1+LqZkqMEna3M2eQMBp3iP2k2EAZpI8z6hFtxZIlfuQNxit
 YOSAkV1FLgYyo1L11INZq6/x1Fef/8SCrnZwSNxIJoVHB8Be2Lo525o2WkWPWbBxh5rnQZ57/cZ
 99+0vgb7oSfJaqckRYvXnJzNDZmg4c9sBY169YOmxSzpiONy
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-06 12:29 +0200, Christian Marangi wrote:
> To keep the generic PHY directory tidy, move the PCIe PHY driver for
> Airoha AN7581 SoC to a dedicated directory.
> 
> Also rename the driver and add the relevant SoC name to the .c and .h
> file in preparation for support of PCIe and USB PHY driver for Airoha
> AN7583 SoC that use a completely different implementation and
> calibration for PHYs and will have their own dedicated drivers.
> 
> The rename permits to better identify the specific usage of the driver
> in the future once the airoha PHY directory will have multiple driver
> for multiple SoC.
> 
> The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


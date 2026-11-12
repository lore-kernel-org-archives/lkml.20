Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482425;
	b=DpqIDdN2brlFYPRYKYjWBwlodNwQkKlV42/g/OwAmyyrkIcebaDXqI9/n1uX+CT9kyLs
	 mX9bt23BjkaA0x5IYb6X/2XFMzDfDCbqYjauCHaGp1Cu95dqFH1SmyrXSgiB893AAD4JP
	 JQhO08IChrigyixvyVfCgRg54QU9oset+PnEfPV8lNj8RmlAfTiheKsEys7IT0nUXfm3H
	 Znzb8b8v8YQ9/XlLUg5yVf1bIpBLd8Ffsdpdw6XU6KBMu6uCVgwSevfYPJjfTfsM8tcWW
	 MUkVz/wATNwz3Vq8Z8e9oPFdmVu+nIL0W8IYkTFG2gssVMYs4N9oJCCKh/hrvnp0rFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482425;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=FE4RJwnrzj/juNXS/pesyp3PaSMEL7UzGYHpGBwwCZg=;
	b=HgnKhlQwWOu/QLVCu71QNrzA5+Ct+b6ZApcpd4Bz9RoFQej1jG2rqNNtmpI0Jbm9t2YM
	 Gpk1h3zonmEcMCWLRcu49RL4a3H2MxX8OceIxAHT07IZ3gY6/KoQUwIGDDR46Q+APY7Qo
	 j75Iy6reYes6yWRaDNh3l1a8M+4PUgDfTjhsb4sTIFQJKzdQf7wpD2fjecA/WgkpaKN8G
	 BA8uN2/mKh0BM2aTb3mFWY61IUp/P7xBped14xmpx2adQdEHDsTAaZ98ufH4Vq4hP41xa
	 lMgrXNTL2yd6Vji9/VOeNbYgGqz12WM7ZKC2CbIT9AHHBayGwC5bIddgkMHFn4tcH6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFmfv9Aj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCEF606CCE1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFmfv9Aj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0A31F00A05;
	Thu, 12 Nov 2026 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482425;
	bh=FE4RJwnrzj/juNXS/pesyp3PaSMEL7UzGYHpGBwwCZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SFmfv9AjkY55CXOtjrtFSwkJwjsJ7hkt0Py4imkOR3MKAIbz/XmktVMUndaIhdrPd
	 rH238z1DeQMNsIQExdku2cmVaKF6gnfGw9BYJUvhLKSGBqMIQgMn4fMMKE8s1qObZb
	 zHtl5kTAMzVUNQ4eZ+RRACXKToT0G6GaaMFY5ALNwbx1wdEmAGhTY7wxs3SesHeq/V
	 NOZLmO6LfU6om0CIIUjstFUl7w6g17cjqi3FaYLX7dxxRmrzUCMEAAn/Eccwatf1Zn
	 t2P03i2YLED0oHYs7Rs4cqGPq/pwD+TSEnxuomx8qzD2L0gm1O/C9VWqK3+3D8kI8F
	 TCQJd+9hezKsw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261021102155.609575-1-diederik@cknow-tech.com>
References: <20261021102155.609575-1-diederik@cknow-tech.com>
Subject: Re: [PATCH] phy: rockchip: inno-usb2: Remove redundant dev_err()
Message-Id: <179448242246.492462.10363037701797404099.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:50:22 +0530
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
X-Mailer: b4 0.14.3


On Wed, 21 Oct 2026 12:21:20 +0200, Diederik de Haas wrote:
> The devm_request_threaded_irq() function already automatically logs
> detailed error messages on failure since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
> So remove the now-redundant driver-specific dev_err() calls.
> 
> 

Applied, thanks!

[1/1] phy: rockchip: inno-usb2: Remove redundant dev_err()
      commit: 4ed7bb658700a8d47d7256330390c04fb5cf2d2b

Best regards,
-- 
~Vinod



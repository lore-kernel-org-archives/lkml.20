Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474246;
	b=2AKVoZtI3PNQq6EyOqjV6p+779Y+bpsNzcL21zIJQfIX6rkKIIvIPY40fFqQ6tc9UPTh
	 e+iS5znzr8gX1xSzrPLUQKDQvfVYgmLuniZiWjLgtQ6V2cJOqxVLC/vNn61CxQ1JVtjKz
	 SET51rcutIJXNW3kmrpJrDoJLVV74orH/y8EjI+jzWe7/WGNlUts0TuBqgwYyDfbF71Kl
	 5hHfPY4gCWc9ghTwtV+uL26h6mhkBMaog0LPNwehPFDV0plOScFsPvS5aL7j+ZQawDMTF
	 ipYDYwBaFGAo0kKl5J3x+cRUYKn0070VUP4xGY0L1gDkGkM98KLLqXYn6BFh2THHR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474246;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=5fCCCXEOfM/ae3w8SM+2GzfEV3C2pd0/CFQFdIizuLk=;
	b=ZTCKrUcTlZjt8SvkG23EYkRwXbspybvACxX86CL4pLAlh5h7GEpo8Uzn1RWIAHXaQ9Gz
	 wRE8kbnJyhjm/cmcEDP3pxND/vdruArKpP2t/KZ/MnQjcwpbzwuMQAcBn1PBmc1VDDloW
	 yfQas+L3TGvXC5P6Ash+GlhtlSPv8nFtrN1UCzxqmFb+WUw6rM7TJYHpq5Z/gjpShoiDZ
	 O2zjItjVnEUcjwwZdQAz84E5sbivAvJXPr93SApLr5AXc0nnuFzKf9PT2xf7f8e19eshP
	 U8riABajG65SlGQgqH9+xknhZXQ6KGpAjhvclWesAJ6ls5vKmKw4ttAMRLQMe4c0LZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZ0GgMow;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452F7606A887;
	Thu, 12 Nov 2026 09:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZ0GgMow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A931F00A05;
	Thu, 12 Nov 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474245;
	bh=5fCCCXEOfM/ae3w8SM+2GzfEV3C2pd0/CFQFdIizuLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JZ0GgMowVVv7gOw9QlHwThCBEBbt3JKeRmM2MgNzEBiiSTB5cL7g2TYhJm+ks+UGu
	 b/juZDJBmThfJUGHjty10H9GkhqRnDeFx8MARIlIYbZG7YpEqUvbKN4ZMmm9KHl4ye
	 s0ZwehVI3m7Gdp3+C6qOrTrNO7ileHDk91EQt7bH8UGEt/5291lWMnBMSmTUK84eyK
	 aBJ6m5ZE3jcNRXZsvijkZaN8Xqn3zO4oLHf9uXm3tMWEBcJ7qya8wtJXlKP5Ht7IR8
	 BU7rqOFrhbiY7BMVzb2X1GEwNL+1J4UHIEoViThRgPu31DTuf9+7TbmwYuwSoxmhcc
	 K/q60NXSCUKZw==
From: Vinod Koul <vkoul@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
References: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Subject: Re: (subset) [PATCH] phy: qcom: m31: propagate reset errors
Message-Id: <179447424330.428303.14422230960411700772.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:03 +0530
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


On Sun, 30 Aug 2026 21:14:42 +0800, Pengpeng Hou wrote:
> m31usb_phy_init() enables the regulator and clock, then performs an
> unchecked
> reset pulse before reporting that the PHY powered on.
> 
> Return reset-controller errors and release the clock and regulator that
> were
> enabled for the failed power-on attempt.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: m31: propagate reset errors
      commit: ad2bf54fe7267f9e7cba90afdc8d91dfd17957f3

Best regards,
-- 
~Vinod



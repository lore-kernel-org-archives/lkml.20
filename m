Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924A4A0937;
	Tue, 15 Sep 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480208; cv=none; b=uGYDd3MdKeu+4/w47O0n5xltrax/IqPCCCZM/G0feXq2hf1MiNIzIbAzUyg/WOdQz5DU++nJKAmSzMBa2I4uu8wYvW0eBdEgvM69695iCsfQNak4/nLaZK3fFibE4USYQ7mAI7xnxg1+fvSCpkX2mO88WDnpNgJLOCZn+vz3/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480208; c=relaxed/simple;
	bh=d5GB825LNqN+zbMxFICV103mC5FpJzqsVDt16HZ9mE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VWqkq7ulAPkogum0D3WOUOaB1xRz/VATKHkHDBEks5j1mI8lCxCX5y8c+3T/uLavWi+fEziGwZx3ODQSj8GeDAFx5FjS5f0sT+nblLCYSzRlPLqiLZsU7xdVrzNS9KBdWRRvwvTZr0YPjQNOJy5IkavJ6XDI7e7CLhRuhT0xrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N6yEisZl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N6yEisZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=d5GB825LNqN+zbMxFICV103mC5FpJzqsVDt16HZ9mE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N6yEisZlWu/cXFKAVU+xyJj64s9r1VTATo45cH/WDBPvmigMRqxB2NPKkVYUgticm
	 g8zxQRDEaOyvjL5Dh19kyCR5E+nVW8BP9HtD9yI91W/oqR6V/O4fLUG/VsK//TZGjf
	 3jR5bOBGHBxwc5fD10snhiG7gvqnFZgf9ti1RcRuArMOT3ye+fPEdNpbehA53pONgK
	 KMzEadNhrw5+RQb4h3Xunj+rYNV0nMBkNs8wh8Hu5yLDNf6yDzakP6rN70Ss4AFMd3
	 dlk6daToGjZTwhZJU9Ed9HWl1SufdjGakZKIdoV0nI03bgrArtI1dGv1sgCt6LJBEQ
	 4Tr6ydE5+/UvA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D49F417E0D69;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 33B9B48003A; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:54 +0200
Subject: [PATCH v15 07/16] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-7-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=d5GB825LNqN+zbMxFICV103mC5FpJzqsVDt16HZ9mE0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQX0uKnUDw/lq9s8Z3VY3pqb/JPVrL72+
 kMbQTa+x8YCJokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qak3kP/iQphZ7bvCsVMYnQ6rFYgqlnmOtG19oVQpKsrDUSvkhmFT+vin0YJjyQQ0VFsCE72km
 NfrGcMifQYnGlkPw+SpYm2qzZSF3tZdNCaS8a07XTcLj7pS170dpiYUuXrfG2/FjMAYA0SP2T5D
 YhDFWBXoq48j5f07xF5X6Nn53Bd1ltqyFFdDQhLTzP07UR2+plDcK2FRzsaHk1kywi+8xbx0JsS
 mz0nY/uggZf8irAqbvDHRwq9OGmljcgbJpapUTLUnbhlij0d8MRjH2lNighYdZ0ZwlSteQcD0zs
 tGJequVGmQnlSW0DTktcbZCsJ2jNC9D6AHeoqSedMBdJ4NeDCAACTcDuab5StWvskqqR1eY3QIM
 QJpdKJ1bzfXVeZeP45vRGaOAt1DAHYBtN0GnfgebT67ueceXOA6iHjXIqfqImx5EH5eeNjGu9au
 +oZKsNkwwAJ444bvwF828H5TTbDTcD43ZQ3cd8GsSOOY9b/1U44/J5kBdwzKqi5h08RpuqkLPfk
 89TPYJnututwy2HvmbUVGi7XyLqM1khX2WCD8ZMBRGOyWV7HyXLmHVTxOW/4mgzsB3rJ5m27E+J
 OtWhZZFqpoh0gfzDwYFcZxmGA2/r6EpcFUqNtI6pCyqHlZ2eXEViGcuJjaQxd9qRHjpd45yQk1d
 f/W4n/ZMIQrHbiSvVQA0uWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index ce2b74a28801..925f2d162212 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -986,8 +986,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0


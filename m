Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632463;
	b=zmNf+zdGPdPOKMC3Q3h/oDT17dlfSeRDlrsnIvyQcYKLSXaNqRB5GiE+K+TKuTBJEzdn
	 T0fLBkOvUwI66Tj7RiSLi2Za+K7M7wx7GH48tjWr6so64yZ6IeSP9Rriqr4ZYNPk+R8kX
	 XMlkJJIrLZg8quaeOJu+vit1g0c8gU7ZIVJ+nxX31TROXv3hsElLOYLv7lFDaoxxpGCMS
	 apuVMAHluAWBwNsno7Q3JJiVuS6Kw3+fEvUZ9lFgzVrmzqS6vrB37bS6Q/1FtTT1g9D7i
	 WS1qVOE82giCU+EWP15F4qmiLl41iVcQlhhTP//C30naJD1iq2Ccb0ebqb+cdKNtInw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632463;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Hep7RWQNpmLDtzTa8u9SOSCEbv6fAMG/njo1vSX4wa4=;
	b=FysJsse4HmfsVzTXzNQmC85772Yqqp+i6q0jwSxxeSci2CnPSidoHXcIJL87/bl07phT
	 r5wAdk2NP/8fFGsZBMFNZ+K5wMRFMk3aUa9X7nMC5JJakvUZwSU7cc4c7NHKtq7Pdnweo
	 2izgJdvJb+Twqiat6d/Dni7RxDjJVtIuXSfa9TTUqs+XTlEUPNVtQzpbZsmPknvNnUWiJ
	 y2gM7KJ10CPvvFYDgK5XWgMTZgEVWfoKub17uXEc3U7kbM3qgwJtBeYXzgcADUz+lGfTR
	 kOamiS8GcwzmmK4J73mdWron72mqiQMoN/13279TdkaRDg7qV9qZWCtlgo+Gw+Yibxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="Ar/jc+Up";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C960A381F;
	Sat, 14 Nov 2026 05:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48C960A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Ar/jc+Up
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632457;
	bh=45boCezNlmhhziUm1FzEEYt43rJYJ/1/7ikuYa1yghs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ar/jc+UpSFh0F7Z/zALXxHoNTyNx8NdTni49RhLmIZr6IJrWnFjKzgjbZdQZSnsXg
	 yHEMITid2W09sa29SIdOTPTzaQ2aTsmbHJ7V+7y0K8pVVBASzF8NiY7/2nxzBgV9O0
	 IlgsSDuROa5PWq4hTqqC7y39OX7fhvnztf8/eZOXZaPadqkEpuW3OXzThj38FTsS5F
	 ytlQkrmWxRk0xArdnkC2VgCS8AtUyO8vbQVlauV4wSOJ5d7x2aSGTvHouDHN0GXGGp
	 cV+cbE/2Fqe9Sui3KwfiNawhEbjrj6EPIRl2cRlGiq4lutjrIu7y+qoLvXfs0zRFxK
	 +4fnpw7lwjlAQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 058D817E3BF6;
	Sat, 14 Nov 2026 06:00:57 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 23AB1480062; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:49 +0100
Subject: [PATCH v12 16/23] drm/rockchip: dw_dp: Add system PM support
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
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-16-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=45boCezNlmhhziUm1FzEEYt43rJYJ/1/7ikuYa1yghs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36weEWcInHZA679Yj1StCqOFPYLhDNHZLM
 vbi3xG9n43o14kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaHF4P/jVBIVmlo/DZ5M7ZQqryNZoQ03JqP8zliw6mRVyQBiGyuwo+6lQRA7vd1nKW97Eretf
 n/CWVYj8b79IxBUwYe9gjAX66suftDI90MsHUNFwUCO7dYqh64a9RqwwczocasmQ+aK2kFh6bEf
 lw9SmBaMuF/0Y69SUKY5cW2ClZlAscf4YbAL9jGN+4iC6GL8FfZMYHNe664Rp3EYUBBQen0UntD
 3SkQwWHvpTreN0B/ahxMQN9HFmtTJ1j2vgLQAi2Tg2pB11/qPT8leRBenFbMRmO7szL7o5nNYjT
 w2Mf7LqteW4KHfihXAfA4/SeU8mQPalm+BGQ0IM+B+2YtSb60wOUgsUI1D4YSQ1qAexQ9RGoQzx
 umlqz+RJEkm9cLDfaR7YaHDoyi1hWTa0/t69L7eF/58wP/ceqrslxPLoiWb3ONZEAmY5re89SGy
 l4Uvi4IDcY6/mGP2DUKuHP+iesKqDw2zGYgGtvnfSz1mp9yx9TTGRsmuVNxCXQVbS/oEK5C8GBj
 zo+Fl6HdUBxytK1WnO10nvSRSWpZAf0vx/6bg940/LIsrBZTDYcg0HIc5uYBr75ufQjGHh39IGj
 feQntBTSgYCci+GVGIebCCG9N78y9SefKt+93ZQ3xl230Qt+xV5u/I/iuBBYMvTZHP4FVTpRy87
 i3GUbhbZAQt1BB3TpuE4tpQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Explicitly suspend the DP controller when the system goes to sleep and
more importantly resume it properly after system sleep exit to recover
USB-C HPD register state, which is lost when the system goes to sleep.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 99d948a7c51f..4cfb40494379 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -269,6 +269,7 @@ static int dw_dp_rockchip_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops dw_dp_pm_ops = {
 	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+	LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {

-- 
2.53.0


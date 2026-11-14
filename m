Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621653;
	b=i+/1v06ZBYoCqrallKU+Oo+hTeaIzn377L7dWiqRVYXGCNjtZhW/t3Aq5Fadc8U3ZhhL
	 0Dw4MwTEyOIdt/6+mBayBPiiCbDEIM6FjA9TnJjk0fGi9fvVbsONh1frHJkWT6tB11mFX
	 G57MrmKgoxO2Gm9Ep525igFFgveux7eduL4o1NEl6cszxmpES/JAzv/vYN4d/6VOQpjpY
	 nYIRHbeMFbFntaxOpwMu/aQPyJjAITcc+4znMubGE+pccfRKg5mjOX01mulLnfQ3jX7Iu
	 vfkeBSrSi9OH8VMGU9S80ofhVBH9yBVvhInVyQjOlkEtZRnt92sB6GxbsqgEuUNhXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621653;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Sb9604ZqOKnL5jLlbCzKt/eW9EFcFKIgFhhBj61S3cc=;
	b=STK3MAJlVnDB7s/yL3v9z5p1iVwvvOkJclm0rT59Xt5XygyDvQm7dfbF21bjp5iHwsVQ
	 A9/ukUPz6cThRDLRFDfQ4IoWkxXI6cTAO/HbsuXXQxsXagBX+whb7B5N/a+BcK62QU5Fz
	 HR7iMS2OxT3NWGBbnJTXglIDk75NYgpTjLASgdJ/JjOIB6IkjaIrtPaRY00EHod36Oh8e
	 O5gydEyYm7KHAzKPmc2/SwXI4a36GY64DCpCog/+x3syrZgbZQ9hrbRLIk4h/9o62Panj
	 gWgLtm8KI6QO5XEGS8cL/AE0uMtvHsYZ79Mg7MMoVHBQBOQSyXfKxPjBASBFHcBy7Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VOGrEs3S;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE5606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BE5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VOGrEs3S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VOGrEs3SEfb2O1JGXqkFER85j3kylyK21P54tEJaVOSd2uSE0nDFLkYvi2dE1sCtL
	 N0AP4n8CRQUvrvoUFbxKJ3lKf7r17CpCCA2zUXdlIGNmF5lHapaYep3aik3kbjlt3v
	 9R5y9xmwt5OadS2QWkgBM5xAQ8audxrKxnyS3WMGBHofSqyrMHnETDDbTwBlW08h2q
	 LkQ1JdFJg4UKhHBOfKbByCFD5F9itbfZQn7GJmL1ARSI+x/jIwA11oNyhIoVGrhcy9
	 xKoBLKNbp6DjPPpt3u2IJTsChYtZ0pEqcSdol5InFhdWLh/dTLglXS7OTf/ElZTZe7
	 0qsbGaAG133zg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4CE517E00DF;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 72E0448002B; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:28 +0100
Subject: [PATCH v17 1/7] phy: rockchip: usbdp: Disable USB3 port during
 normal power-on
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
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-1-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNI3Q09lVEh9vK68qQFwxbdNs2fLs3A0w
 252NN7JTJIR24kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qabkMP/jfNR8fFVxMyy6j1Sc5gr/RZy1L8eFE0h5llu5SBKbVDIhGMTnbHmc+9YmZ3JekPgnN
 aC6blax/fsVgs/GCYz/5Ed9GRv9gY50i+Q4UT+PCugBFWBRayeK+bMqKg3FJbfBlXVtwLAIilTU
 RTssrOrDkZPILYzf27ASe22Eq9bxY77/igdRT6GcT05QQjWVtMjLIffwjPUkk8mYxVFQDNK1cnd
 ty916iY42LMwxEtCHXQfng6cS1NBK8V9BQSMWMqXFulrcxsDEOdCv8l2Q4062eiYUWbBgAXPHXY
 3sP4HiasC4llN3pT4zahF3HTlym7U1m5a5ruyLzRQC7HjV0voZ5K1A9qZ5rt2/QTuMMEHq8NgzM
 f2+M3lLoUNaaO/g0SDSQGn5M1LfD7RQkCCeu0BKPgm1bP0eI88QAPhVMdofJKrfcCalbhAOO5MA
 KN80f7zsRUO0tL6l1/mL4dZo9iyU0J3YRvxAi/Kl0jUwHq08g5HgSZqXf+stFtnAGg6Vc5eTQMN
 hUMcGRlowgb8vHIj8lFb3F7KnJRu5d/MlRjrgXjrW5V/OFKrwriOjkelp6cUrqnbu7agaSINzPU
 qLoLoT38Wbwk68/UYJm2eEAwXVdEz3peEJIRa53DfTLnHfnGw7UWT2fGOCm4sZLbMv1CY07RccE
 77VzGLRCHlE6DNu3UpsUm0A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In the reset path, the USB3 port is disabled. This re-routes the clock
going from the PHY to the USB3 controller. This adds the same to the
normal power-on path, so that it behaves exactly the same (except that
the clocks routed to the PHY stay enabled in the reset path).

This hasn't been done so far, as it requires the recently introduced
PHY reset infrastructure to avoid the PHY PLL not locking during
startup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9c6d921b9191..d01a819bf794 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1051,6 +1051,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	if (udphy->status == UDPHY_MODE_NONE) {
 		rk_udphy_run_reset_handler(udphy, true);
 
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472556;
	b=mbJy1IWnKY0/QpHnWQj54N6J185UfKhUILMk8y8SpV0dr/TAEDjuvgXE3nnRDnfkUk5h
	 zu7ddYvS+bcD/u5KAPCfIHyxIREo43hQnhdNamDBtDFJhgYUDkw67M0vVWiHTNWnIUB1Q
	 7FrUdgo48A/iAL0hZq1VK7/lxZLUNRfk3ZushNJe94Ju1bWGYxYR59GtEwOKnpT4/0Cvb
	 kE5Vi5Po4g/be4TXJD2UBjicnHTbPlKmZep0I/+bNDf7O1KL2k0Wrvnj4awEmRNQgkN7E
	 tC3xd8qgNHyPqO8+pkkh4e7fovShvWvAp/fJxuxoKaO/b3XyGztNgOFYb/kWHx9Vxjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472556;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t/PywoMm6l1Gfhj2HKLXgo1apHGTq2Bh+BPaoER8O/o=;
	b=fZzGHr3HXXgdTeemrejlhxcWX7OnNR4MiKrMKUg3Q91ac/7ebKDk4xSF2Nsm+udFvMTd
	 xKeRqo+cRbs3qOivBqkfWF0SD07116TH6tC/WtBNksNNjUQ6QmtvllANLLUabh+2HJAJc
	 zedSgR01VEyqU5Y/MaQ2fCRZwn1aieXTDh+uThM+S9JdKENyDOEFY6W02nOpOYtwZda9e
	 3ObHeKWKTPTnjOqP0uk6nOF3sG9yVVMD3k562vG5gQg4kKjP5ZnKXGGHgfze6rxw7uGrX
	 okegwDxmSA75xgHjOog4zG+t8lUbHBgBihIYXsz0r0wW77ddSXDSXN8lXPMoSXYIihQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7Gm4b6M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB7606B380;
	Thu, 12 Nov 2026 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7Gm4b6M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472556;
	b=to9ZEQpDr5uprJ/Cu6WH/VQBnGi5MJ8t53/MD2SOkJvpgx7GkzMriOoQDLDYEmfkpqCb
	 zeBjV/X1GLkd2EtYmSLhMovq9wre3yoX+zBVcxw814qY5/2a/HZr+1BYB8WxvUoiGhMhz
	 7bUv6Vo2ScDlIcRgJcrBogjsNNrbjkBjMXLn3+04oU5HJPpadv1b6K+Lklh/iyCqTdfU+
	 cRV/BCotq8yHqB8IaEJGQJIZcPMQR7g+4rdJGgFkwpNTPXNTdJGJsxbEAFt/goGmJjUR5
	 1it0laOBiRJBaOUYvkhyE4btRYYzSTIdLqyiDPfu9ytjdsSYwRdTzW07YSxIQ+bb4AA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472556;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t/PywoMm6l1Gfhj2HKLXgo1apHGTq2Bh+BPaoER8O/o=;
	b=EPlHUtBtznnpNKEwLNKiuvQniEYa4aXTb1+tae/Fr8C2iXSNaJcgRA+2Gv9PWnhFuHJV
	 8GVdQPszuCLHRB0RE0PfvJLfTy2hDsebDbyhaIsUA1qHJ8srXBg1qNjD3IhdpPplE64ct
	 QwjR4hop6twONuDgi7JG00lmSSZj/JC8Ri38C9CWj8cLKB9C+RP9V7ASqMG/30Hi6nAoN
	 V+ostrmWuq/l/jgJXPfW9W7RrJ0nZSQdVIlipDA4I0jGw1Kw+zFM15Dinang5mAtERmab
	 OJiZqyvmvI4X+EB3JLB6q3izJuIt1sijPZ4v1ZNZIiPmCz01uYfpuwWd4qov0YpTKQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C89221F00A07;
	Thu, 12 Nov 2026 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472556;
	bh=t/PywoMm6l1Gfhj2HKLXgo1apHGTq2Bh+BPaoER8O/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y7Gm4b6MqR4fcFGaKW6n+R0y+gdxKrY9KDfvUHGWB4JS5QLvBNchTPtCcghNjhjMm
	 cE6LdsXhFu8zUgbknv8ZI/p9mfMDdaYHAsR3wjfSxno1vQRGaCqoKlwScUzQMzhRa7
	 o24hxVU/1uefYbaWiHCB+4i5uJJMgTpwS+B0wav/CDW2Q2zLmFPEizciaDdzosdYc5
	 iyx6f4dYjeiA775ndE5q6SSORYg/k47APj6aggvVkKrRHUauLhT7TmrmfllpenwG1N
	 KnUl9OHyithIclDI0njtQ0WXj8dEq1bzuYwUtJjdkt04tCaWleORARYVdDXONxU8h1
	 XfQpLYn+CEuvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 53423493BA;
	Thu, 12 Nov 2026 08:35:55 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:35:56 +0000
Subject: [PATCH RFC 2/2] usb: dwc3: rockchip: Keep the host bus across
 suspend-to-idle on RK3588
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
Message-Id: <20261112-dwc3-s2idle-optin-v1-2-842e3f8413d0@gmail.com>
References: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
In-Reply-To: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Joonhoe Kim <26rote@gmail.com>, Vladyslav Tymoshchuk <tvlad744@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472554; l=1952;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=4m0AQqWpGKPZoBJEUVc5orPxlJLCumo8flIRD0Jhzsg=;
 b=1Rei5oJ+08YlofUig3fWgdtvOgiGxs4NW+SWHbbWBF2YWA5RUY2o/c/uuwbP54D2cn4Agdcu9
 3QSGOtXzFlTAWSd5UjP6SG8QkQzPfFOfk5MYpaFOdFQP6HgWvwdCMYE
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On RK3588 nothing powers the USB3 controllers down in suspend-to-idle:
this glue has no system sleep work of its own, the controllers are
either in PD_USB, which has GENPD_FLAG_ACTIVE_WAKEUP and so stays on for
a device on the awake path, or (USB3OTG2) in no power domain at all.
Tearing the core down there only ends the power sessions of the
suspended devices: on an Orange Pi 5 a SanDisk Extreme drive and a card
reader behind a USB3 hub are disconnected and enumerated again after
every resume, which kills a filesystem mounted on them.

Set keep_host_bus_in_s2idle for RK3588, so the core keeps the suspended
bus in suspend-to-idle. RK3576 is left as it is: its second controller
is in PD_PHP, which is switched off in suspend-to-idle.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 65d17536af14..c96b2ac1a62d 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -4,6 +4,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy/rockchip-usbdp.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include "glue.h"
 #include "io.h"
 
@@ -153,6 +154,15 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
 	probe_data.res = res;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
 
+	/*
+	 * On RK3588 nothing powers the controllers down in suspend-to-idle:
+	 * this glue does not touch them, and they are either in PD_USB, which
+	 * stays on for a device on the awake path, or in no power domain.
+	 * (On RK3576 the second controller is in PD_PHP, which does not.)
+	 */
+	if (device_is_compatible(&pdev->dev, "rockchip,rk3588-dwc3"))
+		probe_data.properties.keep_host_bus_in_s2idle = true;
+
 	return dwc3_core_probe(&probe_data);
 }
 

-- 
2.55.0



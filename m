Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105F3E022D;
	Tue, 15 Sep 2026 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485491; cv=none; b=U26AnMzMk+w2TMtAwnoQ2HibhpbB6WKsPNcIJWdPpe5yB4d5ncKCUQzQFgvfzg2EJwXczeo5outlv9AGSALFmpNlNtYT3JfmFe4hApdIkTYhDcCmZdhp7kaSm47SCoKrZEiK1TvTCYOkK2v9ZmE2q8T4cYIj/hsyXmLHZ65wJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485491; c=relaxed/simple;
	bh=MYz6XguZYRFZ4/3nNJ/XuJ1PYCEYaFIUdFf95sJVHvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iX80VSgnHyrdbEvnnaN4NTqPKz+9XYZK6yEwYSZJvi0Ncii0j6nAuMBgS44TxW9OYJ8Wk/k3bxHVFaoDtZ8TS4+dAcipEftCA9YwPzZk8xUGcfR+ltt/o6F8H1I89l9E21veO31jPpxKE8MxcdYzBMLuXYdRYgxAkvnhb9rsOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HlffO9R0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HlffO9R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=MYz6XguZYRFZ4/3nNJ/XuJ1PYCEYaFIUdFf95sJVHvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HlffO9R0nkIt8kdPbWs85LU4bd1vKP40e/JICj4qRcGgdF5Rx4ROVk4mGXX+8HsZk
	 JjyH3cue1+TtjQIWP8I2RgeVevfIPEDO/uuhXcd5hebdml/DogsWCXDyUCL8FFbYhf
	 S+jWDsElqQW9llGqLYhP62MQmQoeVIHs2u7i6l17RvbONcIsNZCE0d0L2ZzcNHCewj
	 zDGqK0iLoJPChW7QkZaVftU4P0aMLzGxidpm4Tn+tNk6Ccd70UQ3T5Ui6C/9Wp1hPE
	 hC3nXfTvRpyt3HGAtpV+zz7H79M3udazCq7CaRNmbS8bhQZVYU00/a7Lz+PMW7Sd++
	 hKvS3zamxAEUw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FE1B17E0B0F;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C0339480030; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:17:43 +0200
Subject: [PATCH 3/5] usb: dwc3: core: add post PHY registration hook for
 platform glue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MYz6XguZYRFZ4/3nNJ/XuJ1PYCEYaFIUdFf95sJVHvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa/BGNBrdPkstSJPufa+Kj1IefMXRoHk0
 fWH1gVhwkYvxokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qanX0P/iCmrS/h4fj6sLF5rrWdGs5mYFbqm81Q8fMVgHaz5p5xKnTP2PQl8oxyLOayEp53VDm
 Qf1Z4bE1xVKGhhkW5nh/CtPtnF/ZYXuF5SARN8JKafFS1T5pSKlPB5VrOXga8pyoC2JoZJIw6hi
 VYN5w9a5SbWl8gUCdZR3MoOERkwf9LAouV7xv0p2PuEldQRKUSxUzwZw9sjfJTEhv6iYVI7N+Ai
 sfy64yc8KIu5x7dLXrwu558iGQnObiVgWxXopRtf9zKFVWI7GpMux6VlCSG5x2lGaLs6nDlRRHY
 /KWCigOROGHVDRgy4XTiH7LnkdVqOzr1JAYVIA5xIcJmelr/cEOuX7hx0Fe55DMhp7Z42yYdBB4
 Mga6h0iA6PTifQg4fPL9X2JDgHeRlKzSQNxNZMdD+U3mv4H86AdD/Q1aaJz7czxRmEP1/mrcOnj
 oFoOMp45FEttkvlfVZ5LtjtFNJ7ZrRzVpIQP7KPOE1fXk8E7twef2t/EIFPVkGVqQjnB3eWuhSr
 o/QzG9kByhcaXiTxIh3bUjGuQGKno5AdZLJzmRERBW4M9Xqyc9Z52WTCNsM15XO6LmDRO8d2tov
 FUOubk21rcQnYwtrqCLSJ2pagO8Nn4ankvzs/qerljBsMMvjiGC97EFZIUETW67zwBk6x5cD7xP
 uwbJlXkp49MZra9HC8Qkwiw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 drivers/usb/dwc3/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 4b7132887a03..daf5aec07fbf 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		}
 	}
 
-	return 0;
+	return dwc3_post_phy_registration(dwc);
 }
 
 static int dwc3_core_init_mode(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..e9d8df0a298e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -995,10 +995,12 @@ struct dwc3_scratchpad_array {
  *				need to be passed on to glue layer
  * @pre_set_role: Notify glue of role switch notifications
  * @pre_run_stop: Notify run stop enable/disable information to glue
+ * @post_phy_registration: Called directly after PHY got registered
  */
 struct dwc3_glue_ops {
 	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+	int	(*post_phy_registration)(struct dwc3 *dwc);
 };
 
 /**
@@ -1655,6 +1657,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 		dwc->glue_ops->pre_run_stop(dwc, is_on);
 }
 
+static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
+{
+	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
+		return dwc->glue_ops->post_phy_registration(dwc);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);

-- 
2.53.0


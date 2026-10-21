Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605952;
	b=cCc1WeVEhbDEeerIuWx1WMwROobA2rGmOL0GJtPIe6mqn1Nt+hAJTssXxrsQeMVbERG9
	 bc/9ggqlQ/dTuC6Gy6JJeRiditiGnoI2GU3XGO52ZcnWoPvtIC/qkg86ulXRAvgNdu16O
	 xRFaUuCjlY5WZfQ+mzMgPM+cluG++B0xxpINMuBtJa8f9vxlbVzagmAn88s0jJlonKCRm
	 rsp09RydakJtrlfSyglZOcWs/Vk7XnF5slaWVKSsi0fl36CHMsPqBYqx/CKRt+RqgKeZg
	 uwMKNBhOTVT8xtZLC8UN4T6S5hTDKOS0mFz14x3I854TwuNrB5/pfNtCEHoiQO+CUfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605952;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=poRJPGt/tQVP3cq5GkCmpkVOZhsjuIUoSdSevhNUZGA=;
	b=z3SBJVvRVjmtS2TsvzIacf1aSseE0XYIvMUoYDviJW0RT0kh/S8lD8xMAjRVjIOl0MDN
	 XopnsJ2pGPgtzAylyPInCRuJ/vPsRb6auEdciqvv+1h+9N1lh2wYxNzTQw4Eq0EbbpAXo
	 3kq+9tkv0VL6MsLwNFUnnSsOjfyx/VcWNzppH9t36iGneAkl2U6a+RY7A5Y/eCVSksav2
	 2Ved0CP3dtk3Kc7PmC5UkAjQt+7y3/5ObJBdPWV9cVl8+dRF/FGkynOinhELK+qBP3gI4
	 T6SxiZr5T13JigX53PHJCEnnqQ1fE7v84FZMrWVPxgdBokGS1SCkxQ2+lzEDptPIoyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="jUzWPHj/";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643C606A323;
	Wed, 21 Oct 2026 18:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7643C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jUzWPHj/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jUzWPHj/puEpbnunz3zzRwWZh1q40d7fEYPIsxDw8bIkkoidCGw6w/OY7ohmNSZT3
	 esYWOwmaZULu13KNMbdThmwu0JvPlBrc7N2UTHV80NOncgkDvejqGvtCNW5dFb//5v
	 99x8eHe35MTV2L4Y4hlo9NZXBSEanBAbVK8pLkmPaHQQnk33MGP9IGMaEDqYe9ua9y
	 npsnUKq32mTESwFMZh9CDTxI/aiHslRLs37L0CQUcgG6Xx5WpEP4ZxYbIDvrUNUCNP
	 jh4ju5oaNCPsbz8quOp8K6GaGWz9wubbS6nNGCUhbMlMkG/WoHFBD1VUiZIb8vmCtX
	 03lGT5Sr9ERzA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A45AF17E0928;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 66D8A480031; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:29 +0200
Subject: [PATCH v18 4/7] usb: dwc3: core: add post PHY registration hook
 for platform glue
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
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-4-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vedIG+V8B/ZmgJaGZ8GI+lWufmYtxAe9
 +lCbg0mG1JNNIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qa9pcQAKDlfDbyLeOyeNn8M8VfKsd5z2isXeI2HZwm+L7XH4k1t9TzAf3ZlQ3oFlx+uAM+We6
 XK+9Bu8aAyUCGHLeTvBPY0I9x0LY+pPUM5re2P0JNTi9UBwMtJ7xwywf1kYG6MYSuegTiLl/1pm
 NqY5OVDOZ8CcDKDGbzYFHwim4+k4xbWc1eX4fqWArgiZExNHSnDjRd4qnFBKxYyIwan61gfrFa7
 oxRlaZO1AFiz00Xxt7sz92eu49iPmvTLlj+RKN2POJtshGG9cuq+L1tqJ1sX1zannLcsvOMv9AS
 bFgb7r8C+1XXmsmuTAZ/Qc/J9YlPAyzk8tY7E15OUsMoDkGiNNAM9k+IqhmYNRyflzICj4jW7D/
 eolqOZotoK3CYKpgR8GepiQysA9JC4QJdzXZ/4Pf6S8MYaPb1kTYjGNBkblTrqU5O4oKyAWhWds
 aF9rQ2r1rL6viGAsXKl2RIz3Ddj2H2myeNBNLllqYJzpsU7htUPZ8ZBdxx8qLKsdEQlZjGuicD8
 5NOx9CyhRgaUhHWJn+WDXAU9sUG/byh0MsQhpe1F9qv6JRSG2JQUurarTa0hR06+wZN+vh/mhYD
 uhtT7u8lUnMmCA31zD2JUHHYEIERWY1NMNvwueZ/cYJHtbUVD3tHb6n/4/kOTHOIksz0Jp2J6wI
 0jYCECLXihtRRdrBIf0A1UQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
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


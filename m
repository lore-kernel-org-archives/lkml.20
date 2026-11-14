Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618168;
	b=bEsAyXzC1tUrgNK+9UiRAw8pXnQ9uslZNRMY6kXGMRxqhsB6gRkoP+I/QMaiuqmnRZzw
	 hwPA4Vt0A/mBTs/EO/Op1wwPr1ivwfxpL8KlsomCQMjvsjKxvBLnCUFgXL3FwIZQYGOeQ
	 3h7RSZfWTVMtr5AYm61vEduHzFpwRTC0TLkJdYwninsO1q5vT7Nn1qkB0s2B5v3XjfrUM
	 n6Q7WFMC3OM/QLVNVfaX1XZ3a/nPsfCDCk6ms9F4E+ETm08RzWCqfa63LdzlzibocxzNC
	 81guJdMY0nNaYZX5IMohoH0Hgil8Pl4hmaxWF09PZh1ew9rHP0xWJDimo3F5eYsszAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618168;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+B9aebVwfiAumfBffTjefgnIhBZHkMO9u3GJcorpwBs=;
	b=iW+2ajWLLHrEEvr2M6ZrJ/JxLMLNUhsZIYF8fSh0JzN+0q5uZGlQ4J1ROybgnMi3giva
	 C2tSKZrwK2Gw1agir4lybhAD8D9k0h/l8yUxM7BROnHjSZkINZMEGtB2ziZ6nJoVyAeg1
	 SZ3vWE6sjEOcKXkKZzku1WME6FojE92PqaoicBSusdIyOI0O20rxeRc2kbfmVxmJ8CryB
	 hNig+vsOOAzhh0gSG71g3O17R6OafQ+ULrdPVAJo7/vSLLi6y4LaDKJma+8yQMrupRY+U
	 hniR/wHjMifLuRsSl+v8jAelXz6VnVZkAMUTvGjrrQJi4TAK8Ee7ye1vLNHIE4dMs0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GXlLRdUt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC82606A33F;
	Sat, 14 Nov 2026 01:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC82606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GXlLRdUt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=SYxcdDtyKbqLMgK+NpoqNuUD79S7Z8A1s3uyXcWzLZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GXlLRdUtTG1TJUvu9wZ6f1hZfQdHAMNUkjVaMfWTOcAfzZHUn9y5xGR8qJ2iHep/d
	 gVJL+8INdgMbwfvK2XZmPvnMpJjSEG5DRDmGxoRJsZ06r3n0NfaQYVo6DZpml422cQ
	 vLh8b9d0qdXTans+eJMniHL4JietSYeRXknFidmNLhvi2NDqZbM/oSZ9P8CEqFbCkJ
	 ANLReUYKLMNlJqLT65KxuCruNzCmKNe6AxoNtYyItJI7Qj8UffslLX9iljAkMYG2ez
	 oE22NXttDlBdnOaMAFEzgugEqiqe/ofc/uwGujDuU3jvgoTDEXkSLEB00+chUhsjBS
	 fvvV8zHmfN9Rg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E43517E0F7F;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C62AB480035; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:03 +0100
Subject: [PATCH v19 4/6] usb: dwc3: core: add post PHY registration hook
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
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-4-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SYxcdDtyKbqLMgK+NpoqNuUD79S7Z8A1s3uyXcWzLZ4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szXLxyZak1kTZPsvLz4maLq8PemiO7Yql
 76kHj3SupmkCokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qabE0P/iD4GdiX/tOlYqOvtQS88CZ843fg0SfwiPpg9AokapVRQ2qMdAZXaKMUVjT9ZB8LJ3T
 14RQc/slbiq/1M5Zd1LrGvmMnikn8E42j3DNWkY58S6GrpTLyu9qV/CzLSVYqvFKyxHtV6XtRdN
 f2ATTSRGrEZkuOkqiqPjeTTWCXoRiphUSupewknRJ46txys0/Rnr44D1cqyjapHdWPmYFysyFiw
 2InDwiveoa6gDVmwFSv0ziba0yWci313/nGgGdYMJhIeuFgsjddDIJiaCoeeGDfgo18byM8Dq1E
 jVSmJj9cCAAR3PBxGiUNUTv1BudhdNJ9omr8RoL9ppKpm+6INztjZvetAsO0agR7AP+/2lQCy+n
 RvMqRmYuD99oROPUfqpXTv2mWG7Ok9jNGW4plkyLMRqk5k/345k+8FNBfMBENEix1PAI9EWcmZZ
 l9fUjutRaFVax2y7ajobW9yZqXBb+3wS5qBEYxYTMwsUhLB+CVHhG6wXDElq8Du6QWrbyWmQPp/
 7iX8Z+neJFn2FGzpZ8N1V+KMsJMzJ12vt0qhZcOHs47zi3DuzXs7MGuATStUFbNBQcsydo1/4lD
 98qKboGY37qNK8wj6z3Vv0SRw0TgVP/kf6s6lljYATq/ClIu2R4qYgcILkirYCHtdofoPN/75Z/
 Gaho/E3QoBBqrOYRgPugsrg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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
index f3dabb37f806..5f745838b30c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1002,10 +1002,12 @@ struct dwc3_scratchpad_array {
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
@@ -1674,6 +1676,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
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


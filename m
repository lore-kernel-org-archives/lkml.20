Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC66392822;
	Thu, 24 Sep 2026 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270765; cv=none; b=KcgRKqGlLDtL4CToZhEgqrU/q9azdwMCi35zDfJ6ENqqD4IteIZaB+0CUazrrYdU8PILeFnu971C5+9mNw8mreVcSXZsrRehZlpTlqm6PS9i05cKlb7/hZGw5sq/rGq7FFyufxuNNqor3iJ/Q9s5Dh2LS18tKt/nyeYG2l6HGDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270765; c=relaxed/simple;
	bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKKBXzVzjEd1ixrCBVl7+kctQOZ9jtkoECUY3IUSK/nJVHFRswKFAk/o3WIAMcbQReAoQPnxYjJmIx6unco6B0HNDXoEEnm2zpa+zoJg7T0+B39JrnDrkOKu6cePt8wjR/dMbHs7ynsJw1TkcJp+xRyi8RSqV8EhE2Z4BsfomVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lHbVv4zv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lHbVv4zv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lHbVv4zv9hQNuIRolAcDt91A1GCx2qvhwkFqutQXOx5pJq+QYe5OZ5oP9wm0kIAbn
	 33iWLGLQ/m+M2vzft3CtzD00TCcpYCB6VU4ejyEXQm8tGfqNOrJsuiv41Mvj/V2Cdw
	 Pn07p6gd9y30eZIaZIUXOdXpmk4qIj1F/XRIYCNtAuzE+5+xZ03zpLZcLUs9prplK6
	 JF+MOXysx6BzryhQtaU75jwSv0EdwgdTI7YtVaAuls1agbqM1fm8voK9BUIGDe11n/
	 4CLouBX3lT25HNNu3dhqJU6GVcbUyKL7rubPWWgSjD5vmqutggb6oNWw/Ew/IJbGOO
	 fpDe/mkEoyMuA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA9C417E01C5;
	Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9C546480030; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:39 +0200
Subject: [PATCH v16 3/6] usb: dwc3: core: add post PHY registration hook
 for platform glue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-3-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSkON1+jmuTK8OfIgRNDAlr6KqJaBZGik
 m2R1yxjthjG1IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qa/HQP/As0Dsr4N2pVwEZniLcMcFD+RyyXakRIoCRSTqYU6wsXPX2v2PbWBikGmSK8B2iyXqF
 hLwH+i6G+fwwhiDUWyU2woeffRAPerWm2MlGukNr2JwD94BGTc4IGuqibmda75fX9Q1Ss33t9Eg
 U/tIBijn+c52wSEpqYi+PF1Zijhw4htYOZETdJw/i+bJ79Y7ppKXS/xkjE9558C66macodD5d/+
 nzb19n5cItJSbcHb6BGQCShpgn3dj3McOagSe+HVXVDbdNVr/kFlbaV1pVkYg92QrZlUAhb2O9C
 MK0E/QBE3z8Di/+LHFmWc2R0qjpK/v9FQVlhhepR/nbjP0DLlTlWW68M7zcNZOIcFOKhB2IAeUg
 /NqVfKsKXZryAPTdLI1ZKpXD1xScOROMXSufbGmXRA/ObvZJi4H0zmVtAUuI3UJY8AZRtiSi3ED
 CpJnWwj9nxI03Y+QX6vgtG+9lyMQ+UQd9kruPyip5EbwZKMtD26kSLot1isnXuoZm87JBNtV/rA
 wBNCdRRPc0TcQwMWOZKkUJY7aMt3jo05pP9kp9HT2iS402VmM3xOvE0vOTTg07kAT9iXDJ+EDOO
 a1Mb3l45PWmqA7iZP6o5/nK29ZrHkRPsL+RGTp2EmyGMgaNIAxAjgCKEGt766MJQENEDFdVj+L0
 xsUyBT74fbynZG5b2HHcoNQ==
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


Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871C14A64CC;
	Thu, 24 Sep 2026 17:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270769; cv=none; b=hXPQcyqPXb7CgiFm5nDmO6UMu6qMzLVP9jILGgl1Flkj3E7N2zUqMeHuODPAzfzNfipTK5+FMYEwKKbQHPH5LxtlzQ9WPJ7Lwsa20hEWjsODdFyaBmcmAdSbXWXzn0SDx/5QsiGyhlFzNAQbxSfP9fiNsnuxRLGU/Vnf8snFSBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270769; c=relaxed/simple;
	bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGUXBUCf1NsbhOevccnyO673RpotumN2ptLZXXX3GRp1dMddAaHJ+kt0AWyKy6Q4xX4Qxzz3K+wZgOCtL+kV3Oqlb5Ny9OCEoJt4urRDgo1NBXDI61fz3rTMJkUmiHjKqHwrEZL6kQKRLgqUsleMYgapgalvcHecPsq3qvyI4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qAV6eOLx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qAV6eOLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qAV6eOLxEUaBq6CiJutIXoXc2oVL9IrPyyEZg3yWvwbxg8qdYBuPxJDin+H1/c0/U
	 79YGopvtnSa+dGVMhmBOYSZ9rQj40+7O17oBonKytuDJk+A4YTu6oIroU9XK2joFYS
	 uk9DMmUHL8LL8zE82AjKOMGTdxrfae3ScJRdPwvdyNjlUaTf9CmY6clTsIo6z5r0oo
	 LLAH3vd9n2JDtrh2Q1ImzJhMZY6HIId84RMP0NMq/JmtmL8wdWI0g39htB3TMGiVM6
	 lKl5Ish6F23LqeCeXVDrvoJsK/Fik/9T4QonIwqlaciLksi8nKzQN4Onc9sylYRn4x
	 tQRMvtRXYhQYQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 468AA17E0B0F;
	Thu, 24 Sep 2026 19:26:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9FE32480035; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:41 +0200
Subject: [PATCH v16 5/6] usb: gadget: define stub for usb_udc_vbus_handler
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-5-126a2e9133c3@collabora.com>
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
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSmKlA5LLG57RVM/MY6Ci9ly5K6FGL/+y
 e/DbpLc1sfYYokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qaP3YP/AtLmumYTtWbmQo+t02Q98/jVk1ryijYgmJ74W1rwBARsjE3TnEkatvTXC3MDW3VcUL
 V90SIils6L7I86J9CgzYuOhAG4/8pUBkVysPEO9YCJz1svchRXM9yYNMDj+6Uk3a5skwq/1qNXn
 zeut4v95G1RIwuqV2Z7Rflnxl6F5e5JeFdOGefmJy0kUEjhsuT7mrgRxlSGXmDubWri+224xSzZ
 4QQRFFntjJt8WztShYieSFaJkrr47FHTeOOO0U85xvNiomvfHwP9SYvtTB+oLC+6VtQw9BL2P8n
 J81+HrsvYyqmyr4upZje2u4cvNRdNKj0/xuLQCH62KHyTf9Z2gGcMGw8Cg6zZtU5N8aE5Cq02jf
 iwAC5OGBgBa2409e7cm8FGcVlb63zluutn7SrkTP9KaKgG0jfRL2KDXQDPswQ0HJa2+umn8Q8mW
 aBmkRCLDWaXC+y00dewd4rLZA7SyoWQ075W/OzNm/gm6b2z82PFDxu2lSqY3uIsK8/qwLdCSb2X
 iZctBGMYW8UcQtp9lhP0Ujr3et4kpWqsXUZSb6Tsn3oxaZyIxoFswiEgqDsQgqsv7rixyyHgP2e
 r60YFnvbSYa/rDi6QAG9D16jZixjXa58vuve3z+mmxkKtWqFn2JgPKHzQVjoh0dZq/ZZ1Bb+nUn
 a0Y4+0G6Yh3+Qqe24CNMyKQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Platform drivers with optional gadget mode support may want to
call usb_udc_vbus_handler to properly handle a cable being
re-plugged.

Ensure these drivers can call the function without a hard dependency on
CONFIG_USB_GADGET or having the ifdef logic in the driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/linux/usb/gadget.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 8285b19a25e0..551e71b6eda0 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -979,7 +979,12 @@ extern int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
 /*-------------------------------------------------------------------------*/
 
 /* utility to update vbus status for udc core, it may be scheduled */
+#if IS_ENABLED(CONFIG_USB_GADGET)
 extern void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status);
+#else
+static inline void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status)
+{}
+#endif
 
 /*-------------------------------------------------------------------------*/
 

-- 
2.53.0


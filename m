Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE3B599A51;
	Fri, 16 Oct 2026 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176222; cv=none; b=mOdpfDInsk9AjO4Z5ebsdsrkc16Aq8DVz/MeT9GjibEe5ivRhZxrIqvQ2GKruveDqbhP2Xam/mbvR7CX+uV6V35+KCVgoYnN8LD5T+lbbn63dheik6s9EjktaK7mB6nvAdvBXxmsjXzZ4wfAievJj/IFdQzhhjPzxTu5OlcNj5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176222; c=relaxed/simple;
	bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fptcg+0lNDvTprD2Y0sxSiwyPlnl1MIdrrqYLQyEI523ZbzoeuuCH2BWXEuIlJsKqS7xtndYhil2MzNfeykIToPvT2vdZtZ2gxDiNrR/isBAyJ6Nr7YsMJ/LZ1+QEJh6vrQEV9qESLjNPSAlguRvm1v7+rFycencgIjx5gWxWfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LR/iTvUB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LR/iTvUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176215;
	bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LR/iTvUB2PiesU2ocSTLMe7rcti0zwPA5rzdkX8MqPYw5QqW5WVeI2agCM+XOuy0U
	 7p7HzJK2y6GE2SOFlzsDWVDL5Eo3MxZaQ+LFt2/EQih5MScB41KEXY/drj/lXBzB+X
	 qhKx8KyAFvELoNKbAlwwm3ZG61Nt/t8/kSuercjAYGPsFy0/ePoiusnFG55uM8cDMs
	 vd/Fdc1XU7LmyUXlmga/CBDgiKbwaWZfALOQaV/jLvS5311GvlTW8w7UyIoVlldqCF
	 DJ9DdmeVFN+vQZeLmBKsEdPLiy+tsOBtSMdrcBoAm6QgoTzhbxfctSuI9PZ7c+10n7
	 EkNCckaLqfhEQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0900817E150A;
	Fri, 16 Oct 2026 20:43:35 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 693FF480038; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:22 +0200
Subject: [PATCH v17 6/7] usb: gadget: define stub for usb_udc_vbus_handler
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-6-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFYby+uJAZWIY7sw6GUsT0sIvZNldNy8k
 L5xwycZoZ23w4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaiO8P/RchQsDCIz5c6MSTQzxEfbvDysNdjQo5ZonsfvVa9IkkyDY/Mw6ctvp8G/nkPiKue3M
 8fP6us/dQXc/wCs7QpwwkejrlRU7zTlbmaSxEl1sHUs1+vkR3eM6o6GOnb5OHHQjJPwRjhujPig
 RYVbz+peaHx9m76zx3wN+D80vKsDoknXZRgIKLhRoxEHNzNrxnxrY5k983cTWKP8h0R3aJveL6x
 dTTwLDMC5OETxEKkvZMgLY2/c9Q+NUfZp7Pb2valgWqVrdKZHeBpsa2fk3yaf8DkGS75JL4ZLDZ
 HNh8sTl6a/fdTKB1pHqOw7rIriz8+ggosrA8MCU+urTsY2ajZ+rujO35a4Zi1jCGY285qUVlxKx
 UQkcJRmvKn8yIliM9gFD6Gl5sX5NJQeGp1PIgD3ppoNhMNEXi7gVkqg1uQbdbblYPBNUm06LMjS
 PurFZp0z34JzlmuRabHHycDZJhPvhfThPvhO2vmhFs4CjfHYmmrsa0If+k9LfF5XH1MbX+hr7lj
 cGoeLlAl/YFJWS3ITMNpObhWwjRxCCjBaW9tp/qGE24oMDv9LnczTeyJTm53qzZkM3doJarxjIP
 Q/0qqIqODUyEEj+zTqBFxNKxEtlp3fykxbP+h38JGYBY/SFvS3GYjMA12RwvyRUfuo0GQcKO/yO
 vKffKxujQujuvJB5hyus8RA==
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


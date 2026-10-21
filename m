Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605954;
	b=DgjC0T0l4GqrPspgXi51A+Btr821nov5Rvdl7D4JtWVF4yr/Wr/zATnUjcg7kBqdl0aN
	 SppKMlRqSRe9iVlqgwr5a5ZJuC7JrAPQQYbyRjqPwl83h7a3U8et1FFWebCe16TqunHyI
	 9OtEPSS2GHEEfI/IxrIZM4VH5VfPoJ06pbVdE+BJt/Ja6SGE1CDWp+gNpuNN/oCCgVBRA
	 YrnwRMG3ykW+XXlpMyL33flcEPzllRB73qSzUbioECOVwoYBI5O4b49NCoNSxNHRvGLrv
	 TDpDyj9+A45sZMa0UKjBGmOKkQI+J11+dDxjYQ7PNtkvNPbT6FSJBzvIKhoGg9qrkmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605954;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+2G5VZLK8HCZ0p1x2CyF5yDVbIltgfNGz0f2AYltyWA=;
	b=enZWiawHxI205YcWYqaGXcJemvH+Nn2dhkH/MF/Urv0tWlRlh5t50BFzkrRJPF6q6x8e
	 LEMj6EZEqv9jAu+jmRHIEI1GfKIUVIvd8iQsQxoSXE++T1Hz1b+zKjpBayl1JNFPeNk/j
	 kyuZG3C8X9C4pvC02ynW3qCvQB/bURvwex1LUVCTJ5GrPLbPwPxi5Kh9UgghYZM6jhc93
	 v42EHu6pHA31sas0DcTj8/PSHYM1Sluet2u+Krjz0ovIYXlL9DX7k2HOQk4SCifqMF9yo
	 SxA42JiQhsJN0Kj8gh849QTVXe3ICZ4o9di/Kj9fQPzmtBnbPyN6WpGEPAzGdoSVmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KzgoVOZX;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D860A260D;
	Wed, 21 Oct 2026 18:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8D860A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KzgoVOZX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605944;
	bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KzgoVOZXPHtQixXe6jJdotH3nuMS/B7iwJG1GVOM3JYl42TuXqv4dIPhjshUt0/Ky
	 wVnj4CMLmoG9eqDhp9PF4J4VBcj0U/6EG567ZI0C34hAMjlEZd7mKWIzji/hHwHYML
	 6QWRvwnWCS61+nfTtR3ZwNJB80ICF0uJGHSrrWfC0ztqp/3FDSzP39f/Q6CTIgF5Ro
	 QCyEVZcXtFrRVr9GsB+uuwjuXRQ0yP717XZ9BNzO3kLuAai0EnhVvhwYisWfxYLa1A
	 Ke7wd6ISPSry7gqagSCOQnVwzVVBsJPOTr79PsbQ0dVz9l7Ic/x63XI91xtGeIndsg
	 4ZylOEfBEBVEA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF2DD17E0B2D;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6A4AB480038; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:31 +0200
Subject: [PATCH v18 6/7] usb: gadget: define stub for usb_udc_vbus_handler
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
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-6-60000d03fca2@collabora.com>
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
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rcNmKpWmTn7+TJeXvWtVirw/uYcmmOwXMSqcMxV5Cbs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vc9xa1w5K+P+9KH0j1yKeiILyDf75yoa
 2JbS3ggb50XFokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaS6AP/1s3/oWKm6obCCUW7Bs/i3yKaLLUdMMz3Jgk5isaXEX2wW7yxCuZ3e1CM86OqizO0y3
 iuTmRRSrXVqKTqm2YE5Moc+V586H/KLbmS5NldiRMoEOx2ptnMAUOa7rFhhow2XxCmENMSxFq7M
 9kRHbIDeLlNvN+ovsNOoJrBRlaqux+7AkSBchCmiTbat+UbWWI9gkAbvYucyO8rIpu61M6EyCrr
 ERuf3EQBl6PEVeEEuLwf5+9ip4BFZwJTVUk/Ptb9FU6XsvBhaM645stPzjX6OL+HWk1NdDSzpcL
 ZemqaEHkOJGUgYN416iPGEuJ4hiNTu+PXBMrR7ilvvLjwo3VZ3QqqJ8NylqAUUly6AIPU+iWreS
 HoUjvfFmFGrE8a7OtsS925PLkAX2zUIiZ6KN/6yQvRxhXJVuD3sS297UqxfvDmBWZuUQQu+/lBf
 m7i53Na8WV1QbvxbkQruyCjclq4KMXqWM9lWeAAtTH1915ElDcQRl5znkowx3UPnaPyWEG/FbiB
 kvMl6c8zca1Njca0xlWUY3jZHoDssidZ8zMIgZ1A+s3JlWi58oyG5fkXKWdPI7UWh87WqBgcNwV
 ALVkSjv/HCJZ2DrDSx9taULC0TxhaNN5DcWkveIFSPFETrnuZBUiFqhqCOVwABWF/+TXwL516uz
 AsHtt3gkUzYS5Mc5LszUx8g==
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


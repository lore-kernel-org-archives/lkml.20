Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0303F3296;
	Thu,  3 Sep 2026 21:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470278; cv=none; b=B/0u7dSS0zmxI+DEW0U4H2TWWRnA21ifO0x7hxwFAR7BATZomV/jNVB6WTqXcD4Eq8lYRGm8mx3GuGKZ6gmdqhZUtWe3jzFI28A0EsjSOQPeR6ibzjqZ2vepwiZD8vt73kgfi2gREQ+uSa18OAcnmhwq/AX+dVoYX2jwZ+hSliw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470278; c=relaxed/simple;
	bh=+QztZO9Cu+mMvlJGRZFa4wxlsJ6tDTfLUuLg8fKKU3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfvFbHRctGDxkcEnra4yLA71VqGKokY8UsRIX5TcrVolyRiSoHDDe95L1e1A5CaKCVJdR0tqyjU489fgarjPjOg+XCWjH6oTaCRK4jOYs5atiL1BXpL3fwQYJxXKzHt53XwXaz8VmJRbx7RpKsduWQaVUyHY9T9a0bx/IISQQGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSHotzKO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSHotzKO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B4C1F00A3E;
	Thu,  3 Sep 2026 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788470269;
	bh=rjWLwpqgf5o9vNZPdQx9grR49wiTZWb9IAFN1n2zj38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RSHotzKOQlVWA4VDIR6A6trxsQwrda0GPVFo2YjveNW2gQGEH9Hac96GOUm8ccqJI
	 KViv9m2tN7y0pDF5++xT5c5fHejyh1jiQASyDaSBGRkqvigObn41xpuKLReqJNZuWZ
	 JEw8ftS/lD3VkdRtU5DR2pog2R04olhJ5PoMAQWQlJAmn/YeKFEKcYavtN/mHZb+/N
	 e5itxUpMoYXBSL56DwLpK1+7+IdQmDYjliJCg2sL+5tgHiGOjSEsg2xqmn1NKupdA2
	 cEfffBvbk6HlWsJH3iXPAGb8foK8xbr3+DVgo5JJwOFxW/Ll8GBoc0BbpOea6BIAs1
	 uLI22yjnz6DZw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 03 Sep 2026 23:17:39 +0200
Subject: [PATCH v3 2/6] usb: ehci: add port reset hooks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-gemini-usb-fotg2-v3-2-dd92ecf5675b@kernel.org>
References: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
In-Reply-To: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Some EHCI implementations need controller-specific sequencing around
port reset.

Add optional hooks for reset preparation and completion. Controllers
without the hooks retain the existing behavior.

Gate the callbacks behind the hidden USB_EHCI_PORT_RESET_HOOKS option
so controllers using standard reset sequencing incur no extra state or
runtime checks.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Daniel Palmer <daniel@thingy.jp>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/usb/host/Kconfig    |  4 ++++
 drivers/usb/host/ehci-hub.c | 16 ++++++++++++++++
 drivers/usb/host/ehci.h     |  6 ++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index af4fc14b8783..a0c66191d03c 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -215,6 +215,10 @@ config USB_EHCI_DEVIANT_PORT_STATUS_REG
 	bool
 	# Used for hosts with a deviant port status register location
 
+config USB_EHCI_PORT_RESET_HOOKS
+	bool
+	# Used for hosts with controller-specific port reset sequencing
+
 config XPS_USB_HCD_XILINX
 	bool "Use Xilinx usb host EHCI controller core"
 	depends on (PPC32 || MICROBLAZE)
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 77d0df41f45f..5aa629a92542 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -963,6 +963,13 @@ int ehci_hub_control(
 			/* see what we found out */
 			temp = check_reset_complete (ehci, wIndex, status_reg,
 					ehci_readl(ehci, status_reg));
+#ifdef CONFIG_USB_EHCI_PORT_RESET_HOOKS
+			if (ehci->post_port_reset) {
+				retval = ehci->post_port_reset(ehci, wIndex);
+				if (retval)
+					goto error_exit;
+			}
+#endif
 		}
 
 		/* transfer dedicated ports to the companion hc */
@@ -1121,7 +1128,16 @@ int ehci_hub_control(
 				 */
 				if (ehci_has_fsl_hs_errata(ehci))
 					temp |= (1 << PORTSC_FSL_PFSC);
+
+#ifdef CONFIG_USB_EHCI_PORT_RESET_HOOKS
+				if (ehci->pre_port_reset) {
+					retval = ehci->pre_port_reset(ehci, wIndex);
+					if (retval)
+						goto error_exit;
+				}
+#endif
 			}
+
 			ehci_writel(ehci, temp, status_reg);
 			break;
 
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index a65fba092e76..d7e4cd6dc0a3 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -126,6 +126,12 @@ struct ehci_hcd {			/* one per controller */
 #ifdef CONFIG_USB_EHCI_DEVIANT_PORT_STATUS_REG
 	u32 __iomem		*port_status;
 #endif
+#ifdef CONFIG_USB_EHCI_PORT_RESET_HOOKS
+	int			(*pre_port_reset)(struct ehci_hcd *ehci,
+						  unsigned int port);
+	int			(*post_port_reset)(struct ehci_hcd *ehci,
+						   unsigned int port);
+#endif
 
 	__u32			hcs_params;	/* cached register copy */
 	spinlock_t		lock;

-- 
2.55.0


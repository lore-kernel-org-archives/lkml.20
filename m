Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531349EC4D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680001; cv=none; b=fITuT/38dGeo3Kpgzg+Oh6sNdZwBgRDNO8LoiqeG2PaTDCdczl7Ssr7rEOlUoivv6E8eKcyVni97UzwcNBwCCMsIYYBw7scsvwqdWipHFWWAn6Io/IPP6sZm0b0jrgmSg2ZLEdzxM63vvicpxv0ekimjWa024tGq2ivrpKeN0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680001; c=relaxed/simple;
	bh=0yG5Mzjj5RRPDhIbFihrV0EOzpaeq5JgcYZ/sNLs0LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJHnYNUoyiQaC/h2pr4O72Mhfe9kOBf03ejFLLm+NHPZrVutEvTZyJoH/slUezdCQK85POqShqKO1HT2PGhDlQx0VEdjgJV5DoF0qJKs/ZEOCTAbJQ0njCVj1SdOZhy1W6qLxZz3LnI8ZBL5IxJy5jDxM0a6XoauSm1XCF4BaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=QANsuZGs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="QANsuZGs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so7208f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789679996; x=1790284796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91ImVwNngQnn0ksChHIZQSGgHwJR1v4uR7PjsKwQ3bY=;
        b=QANsuZGsVAr/g35glxaH3WidlAiIflSYiJQWA4JDfXAu89gXaEXWQABlxDfPuaZjjG
         Ax+9lC68i/1CPaeBnMhSmUuMJ7EewLNnoD3lAIDUKHVBYcNdyThKUo1f8g8uUbybDA5A
         217wO4FIjVDdGJQd5LhjnTC6EJ2WGOsozBrOL+fEPslMsBOOc2KwtFJ595x1ghF9Yjnq
         Ou+d4+FIvaifiXwd57a2Sw22SvDf0xRiS6i0/71P/wmdvhlGO2kXSfvT1bOW2Up8PUy3
         f1ocDJ7aY7xQFy1rhL11b70ZBUXZTZPmm46fITkxZX5QsYucGIvZaEbUxvl3AmPrm++I
         mUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679996; x=1790284796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91ImVwNngQnn0ksChHIZQSGgHwJR1v4uR7PjsKwQ3bY=;
        b=IUzK273h1cbAAqMg6yVUdMVzUAu/6dem8dAjZlBbpATl8TxossaukeA+zTOUrJOhDY
         oAwj5aYdIN1IWvOa9jcH21czYBVQ2qC3ShHOQIs58DAkTgkYNtR/3uWqxkdIZi8Cv5pb
         bJ1C3PGXFKDXlKpKGtbcJH3uR36qM1IhIIgKK+I21uxvOlr4cQo5ASGBqVwL+Ink7/u+
         5lQAEWLnL2dF911St2oMJ2IvkrDG9OMbvBdv7CtILX8A5/pD2WKL6JxpJRh5QLR4UzjI
         y1IIvxFLgObO0HiM9Ljs0zKVtkmnUn9Lpa5M28F7kPARMjKutLpjQlnxyyZkGeLKabuN
         HLnA==
X-Forwarded-Encrypted: i=1; AKwUvByAg25EgZtMFbWmDC/SrNQ9gU5Mo1XYsO8NA4FqxvSkK6/yQNFu7VygHa2THK5EmIT8leZlSh7ZdPASCFU=@vger.kernel.org
X-Gm-Message-State: AFuF++kYFn+upB5xzpPMxtDudxkWGZtTEA3WWqEFuqyrRlq8OXTV+fNy
	NXzHvBv0B9jS7lPDWyw9glPnmCp4sCpg1yMnGPaG/zgSoUGe8MmHWyFUM/gjZ1R9Bw==
X-Gm-Gg: AYBFou1GX30epoEaC/2uGQHvLw8Vdr5MSPCtILOxP6mQNV9BEn1UitWIeJQv48gxlZi
	hPaM1iVum7Ot4yhMZLD94DVlFFLEkmBVuGT2HTKIgCYqrfsg2qfB04D0mxq9Oa6P7WUwdIgFs6K
	iUWoT2n6MT65QI1CNvKSnVO1WGxv6f6TNy7arZhG2IraliCYNMFVQvR6dXnGJXsvGX0txNNBZpF
	WXW6Jb67uAYE/U8DPAttchTYgLGcFTapSzJ7iB5U8tJ+Ruv/JcQrqdLf2HW20B9Z8OR/LuSn+86
	2/R61KB58UU59Zlr4D7NZwMJuMQPwBijKkxW4v1xWj2X0KrN1JA1xD/y7fRL6u7nngER5tSgpjM
	ikvlZ/ZQm1ZaImJftV/Gl0McEE+TM+ULI9NZUF8Uz/X97+u5mtvtqvRSUZwnv6ufFXqlowmF8Gy
	ASOZOQJ+IPdrRVk2ZzEZKdDGXtAPutXjH/saWNg++JJej5H3FfZ0wGv9qHOcQuM1psZcuaQRikQ
	XxVUwgMimOEQ1DSbjL3GF31Nw==
X-Received: by 2002:adf:e19a:0:b0:486:fba3:b95d with SMTP id ffacd0b85a97d-4871e2161fbmr249670f8f.7.1789679995473;
        Thu, 17 Sep 2026 14:19:55 -0700 (PDT)
Received: from fighter ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f6cfsm19086828f8f.13.2026.09.17.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:19:54 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-bluetooth@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH v2 1/2] usb: core: check ACPI port power during registration
Date: Thu, 17 Sep 2026 22:19:51 +0100
Message-ID: <332acbc859506a0c313a21c14d177a5cde07fb74.1789679981.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789679980.git.sean@starlabs.systems>
References: <cover.1789679980.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_create_port_device() checks whether a port is power manageable
before hdev->maxchild is set. usb_acpi_power_manageable() looks up the
hub through usb_hub_to_struct_hub(), which rejects hubs while maxchild is
zero.

The port device has already been registered and its ACPI companion bound
at this point. Check that companion directly.

Fixes: 8020c41b39f5 ("usb: core: allow ACPI-managed hard-wired ports to power off")

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/usb/core/port.c     | 7 +++----
 drivers/usb/core/usb-acpi.c | 7 +++++++
 drivers/usb/core/usb.h      | 6 ++++++
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..59c3ab31f030 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -21,8 +21,7 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
-static bool usb_port_allow_power_off(struct usb_device *hdev,
-				     struct usb_hub *hub,
+static bool usb_port_allow_power_off(struct usb_hub *hub,
 				     struct usb_port *port_dev)
 {
 	if (hub_is_port_power_switchable(hub))
@@ -32,7 +31,7 @@ static bool usb_port_allow_power_off(struct usb_device *hdev,
 		return false;
 
 	return port_dev->connect_type == USB_PORT_CONNECT_TYPE_HARD_WIRED &&
-	       usb_acpi_power_manageable(hdev, port_dev->portnum - 1);
+	       usb_acpi_port_power_manageable(port_dev);
 }
 
 static ssize_t early_stop_show(struct device *dev,
@@ -825,7 +824,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	 * Keep hidden the ability to enable port-poweroff if neither the
 	 * USB hub nor platform firmware can manage downstream port power.
 	 */
-	if (!usb_port_allow_power_off(hdev, hub, port_dev))
+	if (!usb_port_allow_power_off(hub, port_dev))
 		return 0;
 
 	/* Attempt to let userspace take over the policy. */
diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96f94..5163ef363eef 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -37,6 +37,13 @@ bool usb_acpi_power_manageable(struct usb_device *hdev, int index)
 }
 EXPORT_SYMBOL_GPL(usb_acpi_power_manageable);
 
+bool usb_acpi_port_power_manageable(struct usb_port *port_dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&port_dev->dev);
+
+	return adev && acpi_device_power_manageable(adev);
+}
+
 #define UUID_USB_CONTROLLER_DSM "ce2ee385-00e6-48cb-9f05-2edb927c4899"
 #define USB_DSM_DISABLE_U1_U2_FOR_PORT	5
 
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..356d36ccbdd3 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -8,6 +8,7 @@
 
 struct usb_hub_descriptor;
 struct usb_dev_state;
+struct usb_port;
 
 /* Functions local to drivers/usb/core/ */
 
@@ -211,7 +212,12 @@ extern int usb_acpi_register(void);
 extern void usb_acpi_unregister(void);
 extern acpi_handle usb_get_hub_port_acpi_handle(struct usb_device *hdev,
 	int port1);
+bool usb_acpi_port_power_manageable(struct usb_port *port_dev);
 #else
 static inline int usb_acpi_register(void) { return 0; };
 static inline void usb_acpi_unregister(void) { };
+static inline bool usb_acpi_port_power_manageable(struct usb_port *port_dev)
+{
+	return false;
+}
 #endif

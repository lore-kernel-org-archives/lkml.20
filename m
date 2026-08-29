Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B873B6363;
	Sat, 29 Aug 2026 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033856; cv=none; b=Kgz3b1BSsLwbwLlcWpOsCAj2mJa5NjBBOPe5S7t1W1c2vb9LfxcJElua2LXGcvYc8YQVm7Se8sRFXvR1D1yeFO9XHourPbQpfRx8QO2RFKDrou1ShuP3eIcAu2iqlvdL373gSusSZbHJxLkZJfc7DCbhFKl66jLO1irqqVPD02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033856; c=relaxed/simple;
	bh=GJR0Kyqh3iDrrchfwebBHJmpzUqyb/ADg0s5jUpQl6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yx1m+uMuuBdWyfuiimeTfbt/ieweELS6w6XiWIx+PCelvTmWAmi4pMk6pYipENLg1EbRcGhJwwzciVd5ZYtzzhcHB6mSEJqH6hZEHZl7BOw+bQVx3riEIiMWsIQADJjyBT6ax4JpEJjp49jBOZvnIfGnc5yrpwQ0HAv60DPA3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OchsXqDp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OchsXqDp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9783C2BCF5;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788033855;
	bh=GJR0Kyqh3iDrrchfwebBHJmpzUqyb/ADg0s5jUpQl6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OchsXqDp1HAePzeHbmvOF0IBJzA5ikDWmn4adJ6AWk65hBl6uL+SOe1RJnheCztjp
	 xMpTaD/E4U50JjqfJ64Qt90gmJkqrSpXbDmzAtqu8V2CxzTISA9VZf8Bq57fxvyo4A
	 oJ6L6+iiaVM+CaqvNwLvXEASbiQ2X3esjlCupWGs8k75yL06mo2BQSSWRJqVsC+5Vz
	 Yiph9lCY2gJBHTawDS1YaAuYzz8oXOmaslR90GAFHzAXB3KgWw5xElgLFTjm60i9il
	 7TzTLj4TQh+Evv0Ukkx3wtGkdzRoeFvoEa9ZGD4UbcvWBxf/Vg8WtCiKVrwEgRdZGB
	 HR7a0uRAj5Gog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B958CC61DE2;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Date: Sat, 29 Aug 2026 22:04:11 +0200
Subject: [PATCH v2 2/3] usb: dwc3: add xhci_no_soft_retry software property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-xhci-no-soft-retry-v2-2-0efe22f1c2f8@divinehawk.com>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
In-Reply-To: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788033855; l=3697;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=8I5kFxZQTwOwXEoL87NTYKHACEZsZUaVcRMYWJSXOYw=;
 b=O5lEqcGo/HbB5TD3tPVFvLyPYoBq0ArNwyh9Jh7lgzWQFjiNZw0tKAkHWMPneOxzTAJCclEf0
 gyF7fV4TD9GA7m4iXdsEhvMEH6aE4aqocDyzTJJf0v32bSS5hjfj4wC
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

From: Matt Eaton <linux@divinehawk.com>

Some DWC3 instances cannot carry out xHCI 1.0 Soft Retry correctly. Add a
software property so a glue driver can say so on behalf of hardware it
recognises from its compatible, carry it into struct dwc3, and pass it on
to xhci-plat as an xhci-no-soft-retry-quirk swnode property alongside the
other xHCI properties dwc3_host_init() already sets.

Nothing sets it yet, so no platform changes behaviour.

Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
 drivers/usb/dwc3/core.c | 3 +++
 drivers/usb/dwc3/core.h | 3 +++
 drivers/usb/dwc3/glue.h | 3 +++
 drivers/usb/dwc3/host.c | 5 ++++-
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..1acfad333271 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1694,6 +1694,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	if (properties->needs_full_reinit)
 		dwc->needs_full_reinit = true;
 
+	if (properties->xhci_no_soft_retry)
+		dwc->xhci_no_soft_retry = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..c8beca1b10b3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1123,6 +1123,8 @@ struct dwc3_glue_ops {
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
  * @needs_full_reinit: set to indicate the core may lose power and need full
  *			initialization during system pm
+ * @xhci_no_soft_retry: set to indicate the xHCI cannot carry out Soft Retry
+ *			correctly
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1384,6 +1386,7 @@ struct dwc3 {
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
 	unsigned		needs_full_reinit:1;
+	unsigned		xhci_no_soft_retry:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..595880332d19 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -14,10 +14,13 @@
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
+ * @xhci_no_soft_retry: indicate the controller cannot carry out xHCI Soft
+ *			Retry correctly
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
 	unsigned needs_full_reinit:1;
+	unsigned xhci_no_soft_retry:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..e22a8dc5d090 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -186,6 +186,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
+	if (dwc->xhci_no_soft_retry)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-no-soft-retry-quirk");
+
 	props[prop_idx++] = PROPERTY_ENTRY_U16("num-hc-interrupters",
 					       dwc->num_hc_interrupters);
 

-- 
2.43.0



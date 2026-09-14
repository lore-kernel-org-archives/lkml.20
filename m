Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641503E8695;
	Mon, 14 Sep 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371025; cv=none; b=fJXGmGQ/QQvMORIhEKPGegYB4vlDXUL9UDKzoIxgJHBEVw9rss9J6Y+w1qWvXl1j6vkOnyylj6bCDoYAOHRf8GsuS8NcXQ3cDE4337LEzAd9rCzHZ2mxOBwr0yAQB3YS0NDJc9jxvMBGqFQ71hjfAWeklwKsSlZcNcW87UtXjiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371025; c=relaxed/simple;
	bh=c14ChKL6PRGqOZLNMJpanHGJdHSuxKfNrsyQIOBcZG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=te9xHiF7YGV1ejZUn0U3s69VuE+5bRSmKwGvKpiEIGZBHFP3xEtNkuHshUuV2U9NBk5/f54SayPg16JFAbGpEa86ZTAWOp3PYMsxwxkQ29PpObrMcuwRcJdsaXJIhonhmZ9txKgxFpCchn7IrPE8RC7KULPEd7+SeuOXDQgnE6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGEgBgwh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGEgBgwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA391F000FF;
	Mon, 14 Sep 2026 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371024;
	bh=h/bCH6JayuhRRPjziWt8ur5m+OvaGjyIb6tFSlY3JbI=;
	h=From:Date:Subject:To:Cc;
	b=ZGEgBgwhlPc2UrSLhIjFRNthvUb+67/aXrLJ/h2kuDCDTzn/vhyB/orm8UIROzRRR
	 wMNFTkECVSyahxsCK8fceYvqlN2DI9Fbh+K/AE2CKv+CvgEvrZT/gHbviqwuCS7Nh5
	 9aqRfuGx4qsOA1ykyVEp7PefAImW6YZ5eTY8615+K3lTo6NQKkI6qKU/wQYGkKUj6j
	 hE4S9Gzmevs03wr1vmACJhtWumnzoygI+qrgqM2T1P9EaPxb8cpOaO8G8BLpZJ9D6S
	 OAu9ugH5Cljhz3yIz2abDFR7jY1AYTJf8iGtfCmU0/OaqwObxzvJ+YTVYimviYDt+E
	 4DI+CZp6Tz4jw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:30:20 +0200
Subject: [PATCH v2] usb: fotg210: guard host shutdown in gadget-only builds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-fotg210-ehci-fixes-v2-1-f98f7d3550d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQrCMBBFr1Jm7cgk1sa68h7SRUinzaAkkpSgl
 N7d2AO4fP/z/l8hcxLOcG1WSFwkSwwV9KEB522YGWWsDJp0R71qcYrLrBUheyc4yZszqstIprV
 86omhiq/Ee1G9+1DZS15i+uwfRf3Sv3NFoUJrzs52ZrKO2tuDU+DnMaYZhm3bvoH8i2e1AAAA
X-Change-ID: 20260914-fotg210-ehci-fixes-18d074ae390e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Daniel Palmer <daniel@thingy.jp>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

FOTG210 can be built with CONFIG_USB=n, but its shutdown callback
references usb_hcd_platform_shutdown() from the USB host core,
causing a link failure.

Guard the call with CONFIG_USB_FOTG210_HCD so gadget-only builds do
not reference the host shutdown helper.

Fixes: 7dbc2e1ba8fd ("usb: fotg210: use the common EHCI core")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609141128.DQicnuRW-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Fix the gadget-only build failure introduced by the FOTG210 common
EHCI conversion by guarding the host shutdown call.

Based on the complete FOTG210 modernization series. Verified with
PowerPC64 gadget-only and Gemini host object builds using LLVM.
---
Changes in v2:
- Add Fixes: tag for the commit on Gregs usb-next branch.
- Link to v1: https://patch.msgid.link/20260914-fotg210-ehci-fixes-v1-1-a75ca67fac04@kernel.org
---
 drivers/usb/fotg210/fotg210-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 7976bdae5f07..7de49b7eb3aa 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -258,7 +258,8 @@ static void fotg210_remove(struct platform_device *pdev)
 
 static void fotg210_shutdown(struct platform_device *pdev)
 {
-	if (usb_get_dr_mode(&pdev->dev) != USB_DR_MODE_PERIPHERAL)
+	if (IS_ENABLED(CONFIG_USB_FOTG210_HCD) &&
+	    usb_get_dr_mode(&pdev->dev) != USB_DR_MODE_PERIPHERAL)
 		usb_hcd_platform_shutdown(pdev);
 }
 

---
base-commit: da11df946e2c5288ba1124b20af7faada58b85eb
change-id: 20260914-fotg210-ehci-fixes-18d074ae390e

Best regards,
--  
Linus Walleij <linusw@kernel.org>


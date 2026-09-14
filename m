Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929CC3254B8;
	Mon, 14 Sep 2026 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368088; cv=none; b=hs6jakvgyugkUxN6PeUApP8+IvlDbd6d8SLmjDPE/qaFIaff+LR7qWQINPPvBdqZSCaOg5dK4w8GOx70WJPCfwLBFR2N2zMk1tfSjnCzek2ThC8UxjgyJyVDQbePZqWpGcNMnPLTyD8FAYDxpx64vVazl+l5JrX533Ozc0FxYqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368088; c=relaxed/simple;
	bh=5jTrYA6Zr84aXSJFgu+ff1cVyGO/1oBt4OyEQJMxErU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FAj/jMUG0W2mvIgoUEnvj/XB9GNyqKLHQ12quilfXoAW5l557d+ZMyeYZLNFahb8leZ+TKkDDvR3u2ftsuw8oRwC0Cdi+TizuHXr9zOdhiNuexJcm6JOTAVq+7qQZjNhCAHc+sJIkmdeFSoU2LvoUwnrncX5ayHovnFbQ69qUHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U97m//Rg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U97m//Rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0E21F000FF;
	Mon, 14 Sep 2026 06:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789368087;
	bh=Yku2AC1DiRK8ZyVSgDsbrBS1Zs5eKB0SXuUewpy+4e8=;
	h=From:Date:Subject:To:Cc;
	b=U97m//RgirwBsqp1r1RrBo10FHssoez8otNgsm5YTvCybkqVKdHXhFg3EN877capj
	 /LFiZ/T8+MDjRmaUyWEetacOUQSOSYC7YO9iICDo3GPPIb+U3w507Io6MBdXlYwkoQ
	 XJlnnjX+6obBwsMGEl/t5pEZp9/yB1kRuvjL5BtF3wV0yhJT/BmJjoQkWsWt6Zw6bG
	 yxUyDbj+C/Nbu/9S0AyW//3be19EKvRrOz6KkNpwBe3qe95OrLQB0QjACyHKlQMbrs
	 RueKmyfpljybFuya9XssB+Xbuvm68KOz71/3qeOOxv1G9lxpne0zlD3fBc9D+/oijc
	 ObyF/z6xrZOmg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 08:41:18 +0200
Subject: [PATCH] usb: fotg210: guard host shutdown in gadget-only builds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-fotg210-ehci-fixes-v1-1-a75ca67fac04@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LSwqAMAxF0a1IxgbSWvxtRRyIfWomKq2IUNy7x
 eHhchNFBEWkvkgUcGvUY88wZUHzNu0rWH02WbG1dMbxclyrNcLYZuVFH0Q2rZfGTag6AeXxDPh
 D/obxfT/hnyo2ZAAAAA==
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


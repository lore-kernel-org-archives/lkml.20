Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2837F8A1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439924; cv=none; b=HshS4DUZDJLyaf/8s2e0es1D60WTwfPJ5PvgivWHctApuI1igsgGdzb1YYqScltzyzzgaknIj0fmg1H1NQUvF+fEUHFkEh0E/KShlOoMSsYF2TkWS1OQPRicjW9ooidM4Qi9YDIgBJdKL5MdA8zPA8S96GUxPD9Ld8wCZfvMo6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439924; c=relaxed/simple;
	bh=guq+rkDi2+E+Dj+mrhLgj+C5Kv+YlrMk5QkUERPxIs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPYNXW46QvTRYRAYI+uZF55X2A+iOWbdFFGFYQ8A9xJbi1+cxGvI2Ub+vrbl/m3VwpishpgreqHl4SA35GYhQD1ThKw3xvNmzaDxCRAwZ1tEqVdA6tdOSEf0G+G8dQCUXx6+/kCXt6bR7fpNP2BelyhxRbapEJe4lzhamYEmUeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4z01Go9; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4z01Go9"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2dea320fso190702385a.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439916; x=1791044716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G9Q4b0eLORsQAHfEyrgPHMbEPou/wIlLxhzXAIh54I8=;
        b=s4z01Go92wDlC8k/R5ZcTEbmUrPZUk/QLo8zzrprfei1hJLkU0BPPm8GGeI0zxtvJ6
         cU0Lu0ulGltkFmVBQeWMrUt0oCholT8052ZuudFaHSgawBYDLHsobimck15kGtZUCMA5
         nWpjTiJdl42wx/TjZC31hD0rkendmgb72dzA4Np/7nFik0qIqTrDOs9fIdrmSktS6crc
         cDyhP7fGC42UQ3FqUqN3zFP824U/Zx3+c1zUsnhBEjE6ektbLWIyp95OvMt6OE5k2zfS
         POQ+5Zf4c81UD9ZS+VtvrZmZTdCwYVBe4Xg5WC+PuDV7Z/RuJalAMCVLK4Tcl39oVi65
         ideg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439916; x=1791044716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9Q4b0eLORsQAHfEyrgPHMbEPou/wIlLxhzXAIh54I8=;
        b=DQQ29DgTbzyqbShF1ANsNkFX3GgfAtHFCkqf6HRR0fm/Lrks6Awxa/iq/kM1IC3E6t
         JlDVCFtta8Rv1ICBsb2HFBhrAbGWJKKD8FXL6qOCb66pRuPM5l9yqq+zHz81OSPk2Hml
         FMZCtX7TSJdaIAKglf/qBJfS1TegzMM9m/n2Uyo9pO12b7mMMPbPaatekq8MzaVuzuPK
         NX0TQhEDIzeFMmgr3mNRzF7rVoimJc8wYLc28wEqsy6QKRDyEXLhTO+GxUuBF9GttcY2
         MD/Srx1jasRVPEmf1O6mGIjnhz4Uyv+RqNZ4YLsNpQJOhIs3yt/zRObkk0M4dl6k8X6O
         Ow0w==
X-Forwarded-Encrypted: i=1; AKwUvBxExzhgGfBzIS58QPKkNoV5+9YVApLsdS4/w0WtisjVx1Y3IEqi21YfJIdJIcrBfwnpj28VQj9GAP9yjVE=@vger.kernel.org
X-Gm-Message-State: AFuF++lZKBQl3YvWFC0RAnBlB9b2vlrQYDdYTmsLIpBPhUSFUhfXCB6f
	uFBoZZHcXzvbwuyQTVxuR0gEN/emRTKJ2tfeD9o8GIyOGSddqkHXqvUqGa662EE6
X-Gm-Gg: AYBFou2uTsjMDhOTrvgfC/vUTR7EkGRb3oJn9IDRaFy8Ufx6qwIlViLMc1vDAPrV6Mo
	H9S7BWJrOIqb5mVB3tKSPX/8G5KOsf1kRP4dnP7KtX1rwCPfat4gPdLtoj475YA86sWAhy3xU/O
	Am7Jg1h00Fm9DoiF2PuwHB+EJgZnsG1Kf/YFoeFx65ioKzWebQqp0zRTdmxmTHVvZYmO5qhWXEz
	nIaRBIkyKST2Of0NViW9r9kJ9uXQKAMyR9rL/jSllAtutLfwTNuehQdCxorXiw8l1wePefG1DfS
	1rd81373FIRocDeFBh2Olt666Tugif4I2ADsPqWJ5RvDN0/C2nAQfsrTGE4Xn4pJokUbhqRa1sI
	obt3xq+jqkrdAmPRq/VkXHjjzBuXcWYv+1iQrbWjEsVsuxhIpXY4ZtK5663nowpPDN9n9w2PKvX
	LtXE/NyNHcvdq9IiwedS+romXo+WXitBgJlEFN3/kr8dHf24mFF41aGmiRCUxtq1MOViRLktFjI
	0iDmPeW4spFYa33/HNF4dO79CIXvRNa0/1d6AAn2dgoIWrE
X-Received: by 2002:a05:620a:1a1b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93c43b6120emr1113869385a.12.1790439916403;
        Sat, 26 Sep 2026 09:25:16 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448ae879sm444974685a.13.2026.09.26.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:16 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ohci-sa1111: remove unused dump_hci_status() debug helper
Date: Sat, 26 Sep 2026 12:25:13 -0400
Message-ID: <20260926162513.25268-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dump_hci_status() is compiled out with #if 0 and has no callers.
Remove the dead code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/usb/host/ohci-sa1111.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/usb/host/ohci-sa1111.c b/drivers/usb/host/ohci-sa1111.c
index aca0338a2983..7e500c772616 100644
--- a/drivers/usb/host/ohci-sa1111.c
+++ b/drivers/usb/host/ohci-sa1111.c
@@ -40,20 +40,6 @@
 #define USB_STATUS_NHCIMFCLR      (1 << 10)
 #define USB_STATUS_USBPWRSENSE    (1 << 11)
 
-#if 0
-static void dump_hci_status(struct usb_hcd *hcd, const char *label)
-{
-	unsigned long status = readl_relaxed(hcd->regs + USB_STATUS);
-
-	printk(KERN_DEBUG "%s USB_STATUS = { %s%s%s%s%s}\n", label,
-	     ((status & USB_STATUS_IRQHCIRMTWKUP) ? "IRQHCIRMTWKUP " : ""),
-	     ((status & USB_STATUS_IRQHCIBUFFACC) ? "IRQHCIBUFFACC " : ""),
-	     ((status & USB_STATUS_NIRQHCIM) ? "" : "IRQHCIM "),
-	     ((status & USB_STATUS_NHCIMFCLR) ? "" : "HCIMFCLR "),
-	     ((status & USB_STATUS_USBPWRSENSE) ? "USBPWRSENSE " : ""));
-}
-#endif
-
 static int ohci_sa1111_reset(struct usb_hcd *hcd)
 {
 	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
-- 
2.53.0


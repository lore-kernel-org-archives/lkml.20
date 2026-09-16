Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C14C45FFC8;
	Wed, 16 Sep 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547195; cv=none; b=Z44lmdWyapXmVbXgcvgQYlTk3CBvK2k3GZGLm8dGFNyaOoN4QXeZZJmv3W1VGVuyx+DNlHpOgwUSmaAMyhLisr8MziRjcMIpKZZ8eL/fZ6t8z6cAWKmAdh6Y82hbKVObOuUWllyCYiyQAmOLMydzCBC/UpzL5vUqVGHYh5/EwMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547195; c=relaxed/simple;
	bh=m0d2WTIkjQxTbXdqiU508PHYyhCo5TmTFEYRErZEBj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NuWgSushbKY28OdiBvKQMKv0EPrBD18f4vYjS+SUmwy15OUOrfz9c29pE1D8gL3dHX1eB1tGx9D65nXaWJyFTJn+R8LfYYbYqH7ojjl/PPBPa9tLeBWIwkq2ilghHJqRP9tGiTaGsWmSZAvyt9TSjNpF+9U4OL9fM6ABlDNgu74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwf23AuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwf23AuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0E11F000FF;
	Wed, 16 Sep 2026 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547188;
	bh=NuE4sMVYdM+eUx2iV5diW9Nt1p3GTQkPRMECpQTVcec=;
	h=From:To:Cc:Subject:Date;
	b=kwf23AuLHh+xa+7XbgF+ka5tyTgfq6a+3y8Wk9Rs50lxbeki14BXDxgbD8n8SWQE2
	 4VMEhKZTp+NuAaiAl5Q4wH6uxsXbDxWjWrV+L60Fr0FFwjS3gbIB21Pb28DHaVifSE
	 HyG/96ME4F+l9WbFVjO6UGmaksuJj4/QkrA2SndqxEmR3Po8GQcmjV7ZlW3+BJL56M
	 h0NfW/rejlzc5sm4UBjmKcZHB6KRZ83lURZDoeiz0JleaAa7r22BItc9dZySx3bLWX
	 9swhYm618Ops4I0XvD0c91AtWefemfVzkoa02tkVfd3+gG7XHS7wZ1HMS909fNYHy0
	 puybaQSCZ4FTA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: fotg210: fix link error for CONFIG_USB=n
Date: Wed, 16 Sep 2026 10:26:05 +0200
Message-ID: <20260916082623.3972767-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Calling usb_hcd_platform_shutdown() is not possible if CONFIG_USB
is disabled:

arm-linux-gnueabi-ld: drivers/usb/fotg210/fotg210-core.o: in function `fotg210_shutdown':
fotg210-core.c:(.text+0x40): undefined reference to `usb_hcd_platform_shutdown'

Move this call into the hcd file to ensure this is only used
when USB host mode is actually available.

Fixes: 7dbc2e1ba8fd ("usb: fotg210: use the common EHCI core")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/fotg210/fotg210-core.c | 2 +-
 drivers/usb/fotg210/fotg210-hcd.c  | 5 +++++
 drivers/usb/fotg210/fotg210.h      | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 7976bdae5f07..86e9ecd2c8ed 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -259,7 +259,7 @@ static void fotg210_remove(struct platform_device *pdev)
 static void fotg210_shutdown(struct platform_device *pdev)
 {
 	if (usb_get_dr_mode(&pdev->dev) != USB_DR_MODE_PERIPHERAL)
-		usb_hcd_platform_shutdown(pdev);
+		fotg210_hcd_shutdown(pdev);
 }
 
 static int fotg210_suspend(struct device *dev)
diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
index 0a36820f189b..8e2346a3e23f 100644
--- a/drivers/usb/fotg210/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -186,6 +186,11 @@ int fotg210_hcd_remove(struct platform_device *pdev)
 	return 0;
 }
 
+void fotg210_hcd_shutdown(struct platform_device *pdev)
+{
+	usb_hcd_platform_shutdown(pdev);
+}
+
 int fotg210_hcd_suspend(struct device *dev)
 {
 #ifdef CONFIG_PM
diff --git a/drivers/usb/fotg210/fotg210.h b/drivers/usb/fotg210/fotg210.h
index aab0f0300dc8..96a8cf76deeb 100644
--- a/drivers/usb/fotg210/fotg210.h
+++ b/drivers/usb/fotg210/fotg210.h
@@ -26,6 +26,7 @@ void fotg210_vbus(struct fotg210 *fotg, bool enable);
 #ifdef CONFIG_USB_FOTG210_HCD
 int fotg210_hcd_probe(struct platform_device *pdev, struct fotg210 *fotg);
 int fotg210_hcd_remove(struct platform_device *pdev);
+void fotg210_hcd_shutdown(struct platform_device *pdev);
 int fotg210_hcd_suspend(struct device *dev);
 int fotg210_hcd_resume(struct device *dev);
 int fotg210_hcd_init(void);
@@ -42,6 +43,10 @@ static inline int fotg210_hcd_remove(struct platform_device *pdev)
 	return -ENODEV;
 }
 
+static inline void fotg210_hcd_shutdown(struct platform_device *pdev)
+{
+}
+
 static inline int fotg210_hcd_suspend(struct device *dev)
 {
 	return -ENODEV;
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E222147604E;
	Wed, 16 Sep 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559057; cv=none; b=G6EEPtAYbHBA1g1em7U0eWJgqwZEZRIqN+wXJZ6BNN5e8sfuuKK6e2YX94DGs+V1s4AS4CU6qT2jABqyEl4oZD9EsvzR2KXe+ErEZ/+FDcRkgr6WU37tkhTh6l9zrUptpoYS9qB3s194Rm/xm/9olflAAQTPBaI56Ex+8rIg098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559057; c=relaxed/simple;
	bh=IB03mxCDB6lW2j9LVJqpoaLlQHxhJmL+HP0ZWNT/Qag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDGeWhqZQ0pAN8q33wq6T4i87s0UXcVhMq47Zl+nzegYmI3e6u5rPMM/+PtPzV9knJv6zu0jfhv9CLlUDKpusuuEJdF7hm6+A+EDQPx9Dn45CRYLlA0Tbelvy9QHPA3DS48Zm1G+tKHwu3aSdq8K8MrYhaPltbFUmc9ikvCTF7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7mNG4l6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7mNG4l6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E721F00893;
	Wed, 16 Sep 2026 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789559043;
	bh=lNVJeupifbLNTwLHClukj2aNZi9p15SUUR0dlpqzAIM=;
	h=From:To:Cc:Subject:Date;
	b=c7mNG4l66TqYMwtDtNI2Lq2ibs/GVACSo1y0jY2gqUEGcgN41B66PkEd9NTJAmB8s
	 q3M0WzD0K5iyeaMnzUbSVIL8Ga6bo3HYN4Pfk+9A567Hru3hjo6/Cu4pxDnurvp/7Z
	 MPCoBh5NmZ9/lW1BrIy6DRfVM3nvT2erKml5dzOr+bjvLygJlpCVuWpmgDkswPLojx
	 ErhShicTJUcLBR95ZHyIcLISzZGvqyHsAkMCiFpgUNOq+qY3afPbW/KAu3+TZT8LT/
	 CiV2MKr28V8TdEWQAdS33UW02EfcPmu9/1kgDc+AGY/5tZhMyb7D3woCiQjYbnKJDU
	 nBCUmkPn1oPUw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: fotg210: fix USB_EHCI_HCD dependency
Date: Wed, 16 Sep 2026 13:43:45 +0200
Message-ID: <20260916114358.195465-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When EHCI is a loadable module, the fotg210 HCD code cannot
be built-in:

s390-linux-ld: drivers/usb/fotg210/fotg210-hcd.o: in function `fotg210_hcd_reset':
fotg210-hcd.c:(.text+0x102): undefined reference to `ehci_setup'

Fix this using the same type of dependency that is already
used for the USB host support.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/fotg210/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/fotg210/Kconfig b/drivers/usb/fotg210/Kconfig
index 2c6e76faac64..b7f0b78be7a3 100644
--- a/drivers/usb/fotg210/Kconfig
+++ b/drivers/usb/fotg210/Kconfig
@@ -16,7 +16,7 @@ if USB_FOTG210
 config USB_FOTG210_HCD
 	bool "Faraday FOTG210 USB Host Controller support"
 	depends on USB=y || USB=USB_FOTG210
-	depends on USB_EHCI_HCD
+	depends on USB_EHCI_HCD=y || USB_EHCI_HCD=USB_FOTG210
 	select USB_EHCI_DEVIANT_PORT_STATUS_REG
 	select USB_EHCI_PORT_RESET_HOOKS
 	select USB_EHCI_PORT_SPEED_HOOK
-- 
2.53.0


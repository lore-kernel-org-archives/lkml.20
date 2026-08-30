Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF8C332EC5;
	Sun, 30 Aug 2026 20:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121185; cv=none; b=lVr3so1EJK5G427gsKUlQlngxw1x51vAiZUQhxOy+xjrPaq39YzFKDvwuItKZ9GuZfgKhbOWO+kUeRvGCOc9IAAOrViaIwrbaT+aoemOVMbsZ9JNol5+k/DgXimYYtFGQvi3UUyxPO6cdDg9eGfmR4508O0xZ9RzJLhKfkSVtf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121185; c=relaxed/simple;
	bh=yLZzvweLjoBBYhWj4yAiYhV53Thr+IzutEkoNWzH/mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iI/Yut4gJE1KtbY7RDsng07BkXmfvrwe4ZIAzVX8egqSF1Kr8I2cGzPuZv2Ss345xPg8binN6u4LF6bkEsvfQ9+1LrIvkHApYwg2dwEbLlWDqZGbaYd70RjvRdLiZc9iGCNScsYQ5FXXzqn5brxzPL/7iU5IAzAYcsPBEnSyqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5IQo6/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5IQo6/2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB111C4AF4D;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=yLZzvweLjoBBYhWj4yAiYhV53Thr+IzutEkoNWzH/mU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K5IQo6/2KjiuDg4JiKaO9StPJ7B7aoYzgwk/rfs+zrHztkVJv44jUt0USKxcf63ze
	 cWEsQ4V/hzoVag43lvJb0mAml0DBTeZzRuND+joF38FoYz8HtG5/z0Cp0cqEQ6YSzO
	 5WFgmHk5U591YYIo2J/W3I8JL3XX4eZnXuoorsWghsgyyWPhbLeIin47i/ZZR4zUlr
	 AWud6SQj4rWMT82M9NxEW8Uy8IhiDoEWE4BsHLrVyAxkZkLnaTKzkm1bjNPnu01kkt
	 oXuvDVxiMuY7UXMHOil9+5fRJZSpDx6LXxZ+EPDyyL1gjfwtXCs3t1zqenwSmW3eZQ
	 SSXtkwv30TP0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3940C61DF0;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:33 +0200
Subject: [PATCH 15/19] thunderbolt: Export symbols required by the Apple
 Silicon driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-15-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3480; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=yLZzvweLjoBBYhWj4yAiYhV53Thr+IzutEkoNWzH/mU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCVGxa+/vjl/00ytg7Ty7ZUkmM0LkbPpUQ41LnwrW9
 38NX7C7o5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjARtxqG/6X8P3eYqC1OmNtf
 eCrcdPU+yfiVH33cd1a6Lp7p9Jztvysjw67stwyKu+ID5Z/zzDBL2H3v9amI6cwLNledCeHdH/p
 EjA8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The driver for the ACIO host router complex on Apple Silicon SoCs can
be built as a module and needs tb_probe() and the domain functions to
register its NHI with the software connection manager as well as
tb_switch_find_vse_cap(), tb_cfg_write() and tb_port_unlock() to
configure the cable details for its co-processor and to unlock the
lane ports. Restrict these exports to the thunderbolt_apple module to
keep them internal to the Thunderbolt subsystem.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/cap.c    | 2 ++
 drivers/thunderbolt/ctl.c    | 2 ++
 drivers/thunderbolt/domain.c | 2 ++
 drivers/thunderbolt/switch.c | 1 +
 drivers/thunderbolt/tb.c     | 2 ++
 5 files changed, 9 insertions(+)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index 4ab22d5291ac..e000a53e5e75 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2018, Intel Corporation
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 
@@ -254,3 +255,4 @@ int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec)
 
 	return -ENOENT;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_switch_find_vse_cap, "thunderbolt_apple");
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index cd47b627f97b..b2a6b300e934 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -8,6 +8,7 @@
 
 #include <linux/crc32.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/dmapool.h>
@@ -1159,6 +1160,7 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 	}
 	return res.err;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_cfg_write, "thunderbolt_apple");
 
 /**
  * tb_cfg_get_upstream_port() - get upstream port number of switch at route
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 12c88509a54f..477a64258b87 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -490,6 +490,7 @@ int tb_domain_add(struct tb *tb, bool reset)
 
 	return ret;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_domain_add, "thunderbolt_apple");
 
 /**
  * tb_domain_remove() - Removes and releases a domain
@@ -514,6 +515,7 @@ void tb_domain_remove(struct tb *tb)
 
 	device_unregister(&tb->dev);
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_domain_remove, "thunderbolt_apple");
 
 /**
  * tb_domain_suspend_noirq() - Suspend a domain
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ef267f40c103..db675e4f0bc2 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -627,6 +627,7 @@ int tb_port_unlock(struct tb_port *port)
 		return usb4_port_unlock(port);
 	return 0;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_port_unlock, "thunderbolt_apple");
 
 static int __tb_port_enable(struct tb_port *port, bool enable)
 {
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 7ab53a30fe30..6a1f49c473eb 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2019, Intel Corporation
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
@@ -3442,3 +3443,4 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 
 	return tb;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_probe, "thunderbolt_apple");

-- 
2.55.0



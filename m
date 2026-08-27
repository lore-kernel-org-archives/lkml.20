Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA864485518
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853461; cv=none; b=k8LV/eBT/0ieRU6ldEsxjirvakfme5sE188iMwI7f2Tm1soszxIcua6XNfrta2fbL3JL23j8QXjrOCU8ISoa+VUGpuG+8NYYdlx1e3g5QE1CGMObusH0TzUY+1TO/C+EGRUPtPKoe+I9nEzgmG17FEkd30sf14rLzH9iZJTW9v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853461; c=relaxed/simple;
	bh=BFndmlciGHzeOgBCzrhNA/MP72XWG8rgm3n/q4+pMtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FyyFvaXlnhuI6LESN0fVMWlJ+y2J+27ANul9EgNtPzgWpGplzLiu9BDAxWDTc3xHj1M6tzNmmzbsLWLVxjNkYLxUZMal6Iz52tOPJndj6szE5M6UYJGOc64L4jaHCfkNjanz1WOH2qDXjlpKbjv8f3OKHvH9mTZIB9w/dCrD2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfsPd0TD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfsPd0TD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso355515e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853458; x=1788458258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAxoG/7M6yngkwtA+SjYZNvGegIxYBuYl/S78jn2qhw=;
        b=EfsPd0TD3SsBtax8Q7jr/7wZimnsAm5y4S+hMBlzpQxlbyO/iauuAxUWeC9P0goi4J
         EjBrwUBn9VATZeM5KN4GNYnLm5GxWQQ11bPRXckeQWvQt76N5XhQc8JO8yJq0aB1fO/8
         Z7rKv+Mtq8a3DPQfaxpwzQcsJRYK0bYVj4e4+Br1eR0dNCjSJKkz03nxUJWeOq9vapEW
         JYiBcs/axDXVOZh5tvuFcYO7whfE7rW6VNmqQYU3woJk1RAPn5CgTl7JSby4zsrMNy89
         VN7zTBkgQ2llHyRYRXBTkrCsR5JVGCJzFzrkOOLFsSp8lt2GSEKbTNPgS0HScbKUA1cV
         7q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853458; x=1788458258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAxoG/7M6yngkwtA+SjYZNvGegIxYBuYl/S78jn2qhw=;
        b=grUCrx60tX+J6MIazlX6sM1qjdFyrkHzBX+4vjD2PhcWQAhj75trpsCcggjRbg6xAm
         iCeLKMMdOmd7Ndkn5DViMIewJWcF3pmjV1q2vfMzZYip3L7m7MNVfGzMsoXKRKYv8TLZ
         6RVlK7eDFKj21YbdpsBNXv3lZ4A51GTfE1zZcn16mT6avUP6nG2Wejn8vLrSK07nA2cq
         UA8I4FWUdlshpqSijWIO6lW8PVeeE/7gN9yp1wvkzqtJKTexnfDjoDycAg8kYxjLLLj5
         YxMh8K/CTIwYS0I5xUaitIwE/sIfEAHLJyVIGPv2LlqhLRgx5Tvsd8524qwwowqsWRcH
         OYzA==
X-Forwarded-Encrypted: i=1; AHgh+RpKtOYCXuvuf4Nd+Wi+M23MH392is2W+BZJiYHEzOYh92NMEO3CqcUTXRMc6XA8j6vpiXdaR3GG6SDOLpI=@vger.kernel.org
X-Gm-Message-State: AFuF++kvVkmOuHDAA8nJ6ZGpSYWfAenqEDaW39il1xXB+wAvcNZbQXui
	1kyR7vnq/dyzBIGXGnqKMLb5f3qp1WDN+Lr31/wf3mHDSDg7uREBl/Lr
X-Gm-Gg: AR+sD12obXJj7gLLZvFGaxqAp+K5W/QPXgbXATYn65iZUdb7+wt74AY5o0QF3ChIdbJ
	QEtM5N6T00A7KT1JWn6M9KS3TKa0ZPz+n3qNyf5ZZiIn+/3QQ9UFBmMXhrFyw5We2XlpCql57qw
	UD7nFsvPsbEbeg+hA2JJZ/amNa9kh2ER6kTkMQFrbf9rd6hzaMeVbxtCezWjxsGk6gaWguqFosr
	WC12kGwB2fPuVealk+3yEj4rmfMovtfUXF+r/uVLLO+ylstZUmHMpyDDOmbVdRlQ0BAzEwwH60D
	em8wXyTKkVil10g8l/FlAcWj8ouv2oCa2EudGUx7S6KdkvEd22K5o+Eb0hgqVh9wizSfr0VrZjK
	x+mbENoApabB/VasvHLrCv654DT7ouFet+SL16luBsRiCmuGeq9v4+AaXVedBSNVoh+RJRiGleO
	ZsMgkCaLhknhBcPdl+X6X0BIUT9LvCxC/baAxLg9N0rhpo2KAEXKhg8NkWJ7tI91K1w2lHJCkux
	wzOsGKhqoKMM+EP+3hWbdY4g2rHOkgbdNNGLsEvY/2BVlMqWZTxZs8=
X-Received: by 2002:a05:600c:3513:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49b91c4faebmr9674645e9.13.1787853457735;
        Thu, 27 Aug 2026 10:57:37 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49eb3b21sm71905795e9.8.2026.08.27.10.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:57:37 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH] MIPS: Octeon: apply USB FDT fixups also when USB is modular
Date: Thu, 27 Aug 2026 20:57:28 +0300
Message-ID: <20260827175728.1574-1-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uctl/usbn device-tree fixups in octeon_prune_device_tree() - which
set the board's USB reference-clock frequency and type from
__cvmx_helper_board_usb_get_clock_type() - are guarded by
"#ifdef CONFIG_USB", which is false when USB is built as a module. The
fixups then silently disappear and octeon-hcd sees whatever default the
DTS carries (12MHz crystal in octeon_3xxx.dts), leaving the PHY dead or
the bus erroring on boards with a different reference clock.

Use IS_ENABLED() so USB=m gets the same fixups as USB=y.

Fixes: 7fd57ab9d9cf ("MIPS: Octeon: Fix compile error when USB is not enabled.")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -18,7 +18,7 @@
 #include <asm/octeon/octeon.h>
 #include <asm/octeon/cvmx-helper-board.h>
 
-#ifdef CONFIG_USB
+#if IS_ENABLED(CONFIG_USB)
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
@@ -1080,7 +1080,7 @@
 		;
 	}
 
-#ifdef CONFIG_USB
+#if IS_ENABLED(CONFIG_USB)
 	/* OHCI/UHCI USB */
 	alias_prop = fdt_getprop(initial_boot_params, aliases,
 				 "uctl", NULL);
-- 
2.47.0

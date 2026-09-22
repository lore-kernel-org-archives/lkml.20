Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07274D2ECF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061002; cv=none; b=IqvP8t7P092sEmljVfwa3zTBoN/3OQss6pC2pReCfXBQoYIdy3tthQO/TDLbI3GnPL0du9TUjrpNNWV6ZCIaVibSSIFRCvW3wE4u7/J1C1lvO+3QTOpe4Chq0WLtcO7sLzo9wRvM3Om3FS4lUDGwCx9Az/6AflQopxYiPT5qIZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061002; c=relaxed/simple;
	bh=a4cyxVYCBVmcPNndbCsJoEaef2oO8iP3vRoY8gmzuEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfrQyWSbQItIyIpLbR+ph3Od6BbY2E4BHnnUR+ByNRnHJZyfd33akoM+PUK+BhNlMFSPm67EiZWbNbwFtdtJift9yDq7KuCEQJIHdDCmcBctN/TpHpDqEzl8AVx8UecnEey0hoKyBQTI0s+iVmrLRDIZToTSsrF9Ag41xH8n/Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SYRiU0Hu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SYRiU0Hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790060999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lh8RRN115hHENZhRVI/HJKnLn1gmr4TNfVUEedSzXSE=;
	b=SYRiU0HuoOY8j/OyRXrT6nfAwUVgXOLTWjg9G60kJEw2jmaefYnuJ70P7TN5D5DYwRzLqw
	s84TZ8UmmNRkCYFSJ29c7bVbGi6K0M3XSB15ctiaUDMHdOl10yk15pcsBfXYbMqfxaeHj2
	62VXnbVsRd9oQFCJ+FxQ4lepg2BEKds=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-h3zLrZ1PPYetoFlWi0zq1A-1; Tue,
 22 Sep 2026 03:09:56 -0400
X-MC-Unique: h3zLrZ1PPYetoFlWi0zq1A-1
X-Mimecast-MFC-AGG-ID: h3zLrZ1PPYetoFlWi0zq1A_1790060995
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96E351843AD4;
	Tue, 22 Sep 2026 07:09:54 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 843B91956041;
	Tue, 22 Sep 2026 07:09:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Tue, 22 Sep 2026 09:09:50 +0200
Message-ID: <20260922070950.76946-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added Florian's Reviewed-by and fixup up the CC: list

 arch/arm/include/asm/hardware/cache-b15-rac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/hardware/cache-b15-rac.h b/arch/arm/include/asm/hardware/cache-b15-rac.h
index 3d43ec06fd359..b96365bfb2a87 100644
--- a/arch/arm/include/asm/hardware/cache-b15-rac.h
+++ b/arch/arm/include/asm/hardware/cache-b15-rac.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 #define __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 void b15_flush_kern_cache_all(void);
 
-- 
2.55.0


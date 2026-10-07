Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D92BE051
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385418; cv=none; b=oAexuwEbx+WsAF1UOcya9iEdZCuPmiFAu01bJ2LFxbDEGiES+39yF30al14O1TwNoEC9mg33zjI9CKISpdiFDt5vRN+xhKbmaXNKqHCDMdMIo72URf6oyNhgp1LSpztId8sfnxCXW5siXMkjlEkbtNBWu5Oyddk04KN4Yz/Ow6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385418; c=relaxed/simple;
	bh=S/dhns/neboA3NSsJjJgms1H1/jA40JE6lN9fKgaI/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pl9hwIoWbo0RttBrPt+lKrNeb+nqnW/aS1+/llri+Q6S4cCBVUpnS6EfK8+VE+HOdHVrpGSyYxE/ryjoTU0MLkRv4nMNvQsBlb0Hel5tepM6UUe4o8Qk+vuDON2dcA931xfBGX62o1Fbvk5xMG0nagsgf2x4gewiyjlJ5iiaP3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fZY87zt2; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fZY87zt2"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2e385c2586so492015766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385409; x=1791990209; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=um9DIN1VQq6Fe9AECVFWfBhzFZQMTDd/ZaQ8TuPlfn4=;
        b=fZY87zt2kAFfwlkBaOa/JVp/d829MzQDqLav3jBLBeJAb0sn/F9Cduisrk5vPRQJFz
         LlgOCXkEAp1OfnkXyrLFg7x0CnP2YxRCxrFXM5ucAWkV+VRV4scdmPuk2W8GxZ728ij5
         TSA9WRPViNtLmxBymRbdFM9rWza2d+NvxBXDHZOfPB3NvpYg+pcvAzKO6yY/QalxbMFY
         yvHidzE3fqgBI24DM+P27vr/jC8nYO7vD87/iApbdkhp6r3MebTlJSUJrBXlY/jUGBwm
         yD0kTy0PtBafoq2rgw8Rg7tRppMIl+IDvq6cjSP2C30qYIdYegb0wNaN8Q4MKaZRbDtB
         q2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385409; x=1791990209;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=um9DIN1VQq6Fe9AECVFWfBhzFZQMTDd/ZaQ8TuPlfn4=;
        b=cwG12sahyOmiAP+lOTQgPtoyg4eM5g/GcCInF5juz4MEEyIrGvP38nYlzGzc6qf4Qt
         Ya1cSHneS51u1TIO2Grqb4Bs4Zrfil8OMzRM/kU/PZC6BhGuhFi2HrCrkPCDVHMxWnlc
         C1FPiheE6pjApLVV+k6SRLUWL+CfwC5/AIAbmTyEJgBIQA4y3aO/9K//UGsBXXl9Zcqm
         gTOZy/UDbHjSY02uct6b77OWZ6U6oRxdnnNeX7NThQUYVpyhMGJW51COHjkZrjVoI+GE
         ZrCvxJHuj7ScEVd6xo/rCgeXXvMByF4E5LwPxyXjQVzVCMX5zr2o/Uj3JRmBkEm6Asyc
         13kQ==
X-Forwarded-Encrypted: i=1; AKwUvByjM6iDjYq6YznoWwC5dTTMqdoMxZGL5ZrSDT8TNhkex61WZ7pN4fhMGIZknsEpNICELBCgoWyd2I/lWGo=@vger.kernel.org
X-Gm-Message-State: AFuF++lXLOrLwXD79QWbr7QK2yxhffNRmr77sFXu8lGIKN/5WxIWY5xr
	VWy4P3gOXgKvGPRY8wtjjli0XntN7AECuYvAjvA+jYZbV0B9jROHr4sZC6mgUW/1M7C8bEBpF6h
	rHhO0z73ehlYsJLC+5uc4Gw==
X-Received: from ejcfz7.prod.google.com ([2002:a17:907:9587:b0:c2f:15d2:2eb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e90:b0:c31:5d7a:eb97 with SMTP id a640c23a62f3a-c317c12e94amr256988966b.40.1791385409106;
 Wed, 07 Oct 2026 08:03:29 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:51 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-2-vdonnefort@google.com>
Subject: [PATCH 1/5] drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

pkvm_init_hyp_services() is only called from kvm_init_hyp_services(),
which is already marked __init. Mark pkvm_init_hyp_services() as __init
too.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 26fe9c3f22e3..e7d7cedf7f6f 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -9,6 +9,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
 #include <linux/mm.h>
@@ -96,7 +97,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	return 0;
 }
 
-void pkvm_init_hyp_services(void)
+void __init pkvm_init_hyp_services(void)
 {
 	int i;
 	struct arm_smccc_res res;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


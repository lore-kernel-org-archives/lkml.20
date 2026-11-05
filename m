Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893099;
	b=JSnHxiCzAW7FJMyIEDRfWLB+Pp+btN2wjIrooLX+jJkzH4cIDFujHrSc0wAQ9y4v2EcY
	 qGDaQPq0Bw/Il8vz4XLlXlVMUJteYwHHYJvRYnLkZ8l1FQeNpcV59sIIrTFENXtXQHFJo
	 4CkwSKE+5jHkzz9G4QEz+td+VB4DsS3kzSj5LTjpuwPEQKrVSmPjuOvb/AHJW93FA9MY6
	 8u9q40YMuotjtAklx6GQaKcPE1mKRCBdGwsGXl5jdugADjK5FBlBWcRDRCZ1nZTCxhT7a
	 rpVway/XmOzCad4/pD5gYNOoXzNifarZ0GPdq5k4zJqmDaCXWbkXTQ4RdEEnSOQc+5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kMmLw1uV3pi5LHCM/RrGDzfVn6ZouZUFYmo7ssjRepg=;
	b=KNZ3WX9ckiXApEDo4avx21rsfp5cpWaNHH/Tkas9CUU2aBdcNJYLSn4dfvsX5tPYLKu7
	 AxK85Zsf7g3KtKR55aIVnaymCfLa7UltDCLxyhJULA8Ruf39jNuxbn8tz0bYvChTYkCAq
	 tOJa7t3Hmj+do0Hwe+YwZmPSHww+5E/H05+dcExETg2LaAX+imNJJ6Zxgc6DGXOOdsCfC
	 8q8YOYjmhPUeGmqqc3/XQxYPATXV7mzh6sU1VGa2SLhhlD+To6kMObUQcISvqOaHGccyU
	 Zi6hLiWX0MG3SwlF/SvduriYVfZNkXSqpnR+K33bitkvNv7d9XqpXxKnnujpIhPrm5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="rc/4YD7e";
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE50606D834
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE50606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=rc/4YD7e
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53ec92375d2so902639b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793893098; x=1794497898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMmLw1uV3pi5LHCM/RrGDzfVn6ZouZUFYmo7ssjRepg=;
        b=rc/4YD7elRf8QKX5iwQ8IUuHIZusLwUV2o4sNNdW4s0HNwQ01lqT3h893zn6tXKjhJ
         XA81KkfHJrmP95yV4izBztGVksflY8dSf7yJEMtBMq/ttMjvjd6zf96Wl8sVKOgVRRpY
         egWLtYKOlZJu++EXC/GtNXkNuZ7+ehkxxQ2ARBbOq1uuzL1HUh0KhCwDUqPsBdshrVZp
         VKGnhissG60qptdbeaqye2M1qu4Rv1eSnxi4bnCT9CIp/pFddtXFU67TU/x212qU9D4e
         ysYeiI9ox61gymqgFnAml4lciugGvfXpHbQOlQWm2tcTvWiXmIRONvIe0C8+UMtekU7P
         WJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893098; x=1794497898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMmLw1uV3pi5LHCM/RrGDzfVn6ZouZUFYmo7ssjRepg=;
        b=GnJv06Eo3p+KIet+/Ru+SAUnYW5op4aZ1QKb/ZEH1bDXhh5oRkVi8wRDq9YBA2c5n/
         cneaM8+z8FniNfF/miZ47cEiPJS/mWywzy9wh+69dMZ5I7PBiV/HVp51Fy0I6BnaRpeS
         clAnBdUjALbC3iTtnqldcGD4vVlZkywB6Epk/e5l359a5AaAs1DWvsiRhy6P5VDZZFYm
         MbSXPkitZg0Zm9NUULYo1nrbpMigMe7Ktw5TcffPNY4kTDZhi+03cglp6wX8rNCUSPHP
         p5vbwsmINr6EL6K7WQpmwEQDhClQLY5VgNf3WHmws+w4N14le7vBCdf7YSqRNIjyIzU8
         Sf0Q==
X-Forwarded-Encrypted: i=1; AKwUvBztxIGiJ+X4Exv3RSXR4fJJ5q1atysNwHee7ffBFBGsFuNlQl01/iDCKl8Ae/1G1LLZJHB+DrO/7Kq7iMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z1nK+XQjuA+ybhYMQMDjgOB7llZsJy9ipqAQbYUooXtdOIoI2
	lxg0Al/yI69MdhVl4Y3yJ60mXiKUbdWUOq8Flmq7AfOeeqsh0kWI8HAN9L6hUgMb3qs=
X-Gm-Gg: AYBFou1iz75kdgMUvc1Gg3d7AFHgOziLm6mbz2y6wxFAXbJohNeWcJjd2CalLPJ3iLg
	ZZQBBHK5B1HAwHKGxn7AF15CnYO7eWGUnYTqm5y/8kTR4Td9wZQ3drS8v0pdgfa3t6CPnIoy1Yg
	jvK54KkiyqxqMy9tTnuJ+jXSHS5HcXReR9kfvMS3pdR+ONyWO9ZW3dWSdKFAZZIlhqNBBk9Ppd6
	hXi+DWvlA+Ss9xFpgC8Gq2HtXMljRe2jiYnLQ5jzIcxzEg0Z8xl5ao4KlZ1grPGFZhS8BdNzUtV
	UXjEmmOqT3e8b853xFk4lH2iqExx/GpbGneLFXczMAap9nG2F37dwy4tr4ik71GpPFl33odFvsP
	YblMUs3OVXveNwATbTpcrB8P1OKUMwIqm2ttzK9AJC+oJZ7CPoF6G009ehhr0GkuAc7TT7XH9r6
	3hAgK4PTkgbpRigmzqXIF4h7B8TiJKWfPQ8JQRYvEh8B98w4P67R9sMWWxCU2oCbxhEO9vXor8g
	tVSvgql4wWah/wPulOBMmWrqe/egIX+Z9YqzLZIUWZKt6+4Dsvtw5HA4O61ymdHAV+ph5QDxXRP
	td+CkFbXf8yellq+wiQXgi5tCOqbrRRiQg==
X-Received: by 2002:a05:6808:1b2a:b0:4f5:20:d847 with SMTP id 5614622812f47-567ad7310femr3867051b6e.36.1793893097926;
        Thu, 05 Nov 2026 07:38:17 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm4435329b6e.5.2026.11.05.07.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:38:17 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Thu,  5 Nov 2026 09:38:00 -0600
Message-ID: <20261105153801.435566-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105153801.435566-1-elder@riscstar.com>
References: <20261105153801.435566-1-elder@riscstar.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flags variable whose address is passed to of_pci_get_addr_flags()
is zeroed before assigning a value to it.  Skip the zeroing and just
assign it instead.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 6236dfaaae628..702675672fbc5 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,12 +82,10 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = 0;
+	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
 	if (res->flags & IORESOURCE_PREFETCH)
 		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
 
-	*flags |= FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-
 	return 0;
 }
 
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453945;
	b=fnfMEb3qBtPyPhbtBt1MR0OQ+ygtOmzjzqleXKyhgzkGQyKm89uizYyXpBZQF6Duz0gJ
	 iNR288nUNbrwFmOpKHfc062VIlFqf96MrEGWG1uzILwve1gPRRy7wRCAg0eeG6bhk7z5L
	 pI0bmX+BU0WTGLSmGNqvWnsEzTTlwQD2ZVYrXARSy/Lp2zwPON6Io2+t9uLG3M/IIsCHc
	 OeuYx5mls2RFavC7ngm9rmJ8w82i7e6966hj2iJDwC+SGEOOJpqkH31LYdEbpFpNwDX3c
	 YfI3MfWpa1zAvhn6ZkrLamegGbiUvyCMaWrTBPpYke5hej9e/8f+NtZ7L+Ic+0LwNEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FHerr6cB5gUus38Xd8C9iM/DEQZah8r0WMgKbalu4ck=;
	b=Wf9FrJg9BUhAeFcFMhQsjJAZsIiJZ2TNlCTpgC0Uv2mHb8mFAKxFCQGB4CA5pOe/DvaZ
	 lKqSQJDhjnKuiCkhYVtRxxp1PhlAaq7XGzISiH7kquBaGB5sUkiaPF7JGIQTPbAI2Y57Z
	 q8Z17FGW0vRTMbohNNeVZYD9LOObxcAYl6V3GAEVfV8DYMJrHoQryhjLP3IbCf8a3D7Xy
	 OOQ+VMN558hkJrrSOQNtnAGIrpes1n5OUvreSm6xsn/el4Fhq66aMWmcpYWHCl0fN0XHS
	 p0MGyQ/y5xzgz65H/wW0o+E6poX4qjPxqNzHQDE+ZtyP7xMue44Gejns82f07dF5Egg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFbA4Llw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA79606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFbA4Llw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so12675505e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793453944; x=1794058744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHerr6cB5gUus38Xd8C9iM/DEQZah8r0WMgKbalu4ck=;
        b=bFbA4LlwX+948wqjEdV1nUOS2bZdNvTTMk8dT4kaMyndUbpXq634xMeZRsqJvFJLHp
         LJlQHOoNsubaG/fDaoUR8Iy8TyfFe25lM3YAEYmnGRvkS4aULXdg5Pg1STiP0Xt1WDoX
         Qh9xfmBUatjDNBH/fc8WccTu4mErF8+4t2eccX1hlhQ2oxyMdUe3/wCHsWsuRUWM5HMp
         4TvuIUY5gtJvck9fqZbUENniEXE/5mW/lNWhn1K+ndh5gKiN5R6Eftzxz1ENnSI5vMlh
         dwWuD+Iz2m0OIedyfaxihVsHcepCtAJhC2uyQF7rMmsoVenaq5W0suP4j3ttQu1+XVRN
         H+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453944; x=1794058744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHerr6cB5gUus38Xd8C9iM/DEQZah8r0WMgKbalu4ck=;
        b=DkyvXc8R8bkwBNYCaS73zga41XPVenLc5iUSRPQ3HHHCCjVtG2q7qiNJHGmflStuDH
         CKbmYgu64hswl3Sc3IrmQHtENwzDDyqZcHtbXwmzz9P05C3+KATg6V9vq3szVwNeA2n1
         xQRwZGKvi66q9Q7/eM425/ac1PMKDA4FIX2/gyM2oEHvuWUsWzTxGWzhQMPdrbHARifZ
         PDRdP73hiyzqeRVO2n7K+ioqZ9c+b7PWsIHEIi8eaSo29lD0M/JbZ/jG14uDTdAguZ2+
         0PiwLa79caG+wKAGdictax8GFRLXb1XUGDacLJg34I86jlG3f8AoHUEHxovD5KPLBOKI
         Tedg==
X-Forwarded-Encrypted: i=1; AKwUvBySUB7aMyevkckMAU5nG1M53Uqa9vSG8VHAMJzpIEp+aHgT22q43PH8Kri1rDclCTe9kyXcBcutidOv9yM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKWkooovBflinJ+OEn5SNCsGvEFL3rCU9jtwoIPCZynMvkes8X
	ioHu9ssBZWWeBFyHSah97P4XXYXGT3UYhUEwSXpBUPAQrQgkCWtw6bVm
X-Gm-Gg: AYBFou0b5VSAExD25JTHJdq6O8NjFY/VT+Rbo+BUyfjMWbej1NMKpXR+KGXsLHkDmqS
	Ma5WAzZoFNrUnYKbyDPWFz5YKvT75Vwd8uDq1/U3kfYmKfKEsjbdUfDNCpXXlwuCOjPvvcLbkCv
	BP8FxLpsIwecOjS1pRD1wUAUlHJT9WMel8ZfmCoekLUE8oBg/he7HhdVlz47r1JO3BH0z6/BHuV
	qjqHR1liHFMXmM7RizweeboQwQXBixwolm8e7gzfYC7Ewc1TaLSL7svBFuUbuPD0SlZ06xafX/K
	ueXDQOtOxjWBqx899/BthcKCsPrxdPn/4ZEwBSwMo7lieM2xOhYdvsRB8CoTYa4nPhRPX2llY2l
	8jKjhQVNK69xkiCnItIB2YGgqhx2q/j7pk8r9leqjDuMbs+xE/lMBDEK16BL/5eLns3JG9bCYNJ
	PGwaSCtEAtKBG9vQxoSOX0e/5m81KC1CPq5rvHhub1UK0STioXbgNUF5O/fxu5ZXUl8v1FEwC8T
	n8SurOsVBqdOgdXBEBM9UWll7Xg6tiOzOq4HHounOtJ1lz6jSihXldTNiIfdWSlzVJsXUbpJ4dS
	P5IwtQfgXSf6QWgOww7kPBqJReNSjlzrfQ==
X-Received: by 2002:a05:600c:e543:b0:4ac:ab43:b50b with SMTP id 5b1f17b1804b1-4acab43b5f3mr78733995e9.26.1793453943421;
        Sat, 31 Oct 2026 06:39:03 -0700 (PDT)
Received: from thinkpad.lan ([2a06:c701:4773:6f00:2267:274c:34cf:9af0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c7852esm122817505e9.11.2026.10.31.06.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:39:02 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq/core: Fall back to a static default affinity mask
Date: Sat, 31 Oct 2026 15:38:51 +0200
Message-ID: <20261031133851.181601-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

With CONFIG_CPUMASK_OFFSTACK=y, init_irq_default_affinity() does not
check whether zalloc_cpumask_var() succeeds. If the GFP_NOWAIT allocation
fails, cpumask_empty() dereferences a NULL mask during early boot.

Use a private static cpumask when allocation fails, keeping the default
IRQ affinity mask available and writable.

In a QEMU guest, a test-only allocation failure triggered the boot fault
without this change. The patched kernel booted with the same injected
failure and allowed the default affinity mask to be read and written.
Normal and irqaffinity=0 boots also passed.

Fixes: d036e67b40f5 ("cpumask: convert kernel/irq")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/irq/irqdesc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 3a818f07a101..1ea020425381 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -25,6 +25,9 @@
 static struct lock_class_key irq_desc_lock_class;
 
 #if defined(CONFIG_SMP)
+#ifdef CONFIG_CPUMASK_OFFSTACK
+static cpumask_t irq_default_affinity_fallback;
+#endif
 static int __init irq_affinity_setup(char *str)
 {
 	alloc_bootmem_cpumask_var(&irq_default_affinity);
@@ -40,8 +43,12 @@ __setup("irqaffinity=", irq_affinity_setup);
 
 static void __init init_irq_default_affinity(void)
 {
-	if (!cpumask_available(irq_default_affinity))
-		zalloc_cpumask_var(&irq_default_affinity, GFP_NOWAIT);
+	if (!cpumask_available(irq_default_affinity) &&
+	    !zalloc_cpumask_var(&irq_default_affinity, GFP_NOWAIT)) {
+#ifdef CONFIG_CPUMASK_OFFSTACK
+		irq_default_affinity = &irq_default_affinity_fallback;
+#endif
+	}
 	if (cpumask_empty(irq_default_affinity))
 		cpumask_setall(irq_default_affinity);
 }

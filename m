Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942403;
	b=vbfI+bESgpgPGLTWI8kXZvZNUqzo7t2/Cx6gDyKmfngC8ZZM+OQs+E2RbVr2oWCb4MD+
	 HzSZMBvOuUQqzbOssYnU5lxDtkVd5YiElMVp5RZfcU9kin5/xQ39mKlXsKZAiaWgHmbmh
	 Gcsr4+k3AvjnlAr8f4kQOXICpTqAmje9CNOoflmcuf5J2wSQl7vc8327/WP/EvNRha1Wd
	 l5Nrig9pirb9x6Las9gkQtZ5z+/ZRtIhPJVmPIoei7u9Mcr4VabRBSl+gCa0QXcAAnkQN
	 Vq+BTO82ia8AjK3Po8mnD9n7rMU5B/O1v/FL7Q0KKqjRqQXBp1OPx7vJAbNHcJaGiiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=z2+CtnAKw9zVaO7DKjcalzaa1zs+ZwWIT2e9xPRBAnI=;
	b=ucjUziWy4LqxI3xVzB2vH6uyzM6IJi1LewlNy8bKOw9LvBUGPGBRkwcvVcr5yVc9Mhe0
	 kvh1qNNvgdPTXCBNoED0Z+B3bi2eqnasyFu3XVq62u43XkUeVayhmtcTA6i8Xfl0dB/jN
	 WZ/lM4lqkIiv+02oaNOCx5CZGOnmmc2T/SIqbcd3NICXZShRrB+ws07dDlaN+SGR2RSVI
	 bXUHSPQ4kIegQxiiI/x45t5wg0m4dxF8tFDcs1JDEQ43rGMeGsMTDQEiGk+gP+PHfgGgN
	 YDf/z1d8O6mmfV1KtTltWzICUzt1L8hWcdv2knM9ye95CW+YBdzMoaKmvgyHi4FeKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XljgWKs0;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E123606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E123606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XljgWKs0
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso1268285ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942403; x=1794547203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2+CtnAKw9zVaO7DKjcalzaa1zs+ZwWIT2e9xPRBAnI=;
        b=XljgWKs03gzpkU7vULk7eIlUVEQQvSx56YZb5oHdKV6z9f+SElIdml7CFDFIOSto/R
         FiUDmtZLIC4piN0AxzzKHsDs78Urk/KDcP6smfZgKY4whjeQTus6DogecdKualoeX94Z
         h1F6fkCTEGazzlBBKRGRLgD5CpAYr2VL4XOSd6mP6F7MKP7AOOg63wkkm/DG13VKuCNZ
         tkee2YiKjssuaZ0lD/jghKSy7mO9RwIEZnS2POWgpUma7DIrjXg7BCpeehpTrpBYxUzE
         HdBWf5sqoNVu6KUA26azvW0U7vW1jA0vzme3iaY4eq9SJ8pDMY0mtSPUip7/p/fXNIaw
         25sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942403; x=1794547203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2+CtnAKw9zVaO7DKjcalzaa1zs+ZwWIT2e9xPRBAnI=;
        b=H1gl0m42IbnptJTOm7JGsv8kDmTU4nUlgE98EB0stDG0rVW3+mIDfiicbpzKeRx+VO
         EYZEOTYtIyXnG1yKQSYA8wRgYKk+89+WJ9bu7btwf3n2tP9rTl/GrnOCUDRpha0s3nS5
         9AhhlBNQns1pY8WzvYE4eWeBkQ/rH1SmQAh2yRfcrEeltplMqi94uc0OWYpFEESZ2uEi
         5Re5hF/PW04D3RqFHf0aihaT6Vmhlw9LrpeNcAicAXJi5qXQeCDumUku21rAKOkUjv1G
         loRdripscUX+QA8rFudjYNhdY7AHt8KvlYJcATBYruVNQR/ObGca++D1sDBHnY+jSmlQ
         JI8Q==
X-Gm-Message-State: APuU4Z8xcfT+s18kzxwjnIKMXWiGA394EyMo1jZrmiwdTMgdG5I0z1Xm
	A7Obw+Zt/bF0KujleOUpBl+hZkNWWZvePZvgdbd7BdbbwYKtK56YV6akx0zA6Q==
X-Gm-Gg: AYBFou3cc/p7Dczrmp/nkYEanOHckE64Et3kqDMWc7Zk5lEPbU20/E1TRz+IwL7jl1y
	Lv2dkpcInsAk/WQJJrn1GliEXKZE7cmgxbQlaroBcRgkxuub8EPwYF4Rj+Arj818Au+tpU8jkEB
	Y8g7oF97xUpcqEH3nyT/jx6RsM1+psNbYSDLaMkrIY6cdk3MCQyvMoGkiGWJNNlgQhTn3qE4BI+
	97v26xroJCvHJtpV5tO7nkYBwuC1gsh5QnbczYcH+QBuI9n2VEyAv7rLvvnAamzDe83EHMsgXD7
	CVG+IJozvyWt+8OPXkHFQhhmuNA+zrDjoNNmx7HbiRRCWt+jwlCpy4cj/ydcsZwK1jQMbYyRBtU
	aRd877tYkEGDOFFdm+KtS4geUwSY35lNnhD1RfazITQDK7Y6+ZfRs4VeICk+WpHrTPGlnC1VBop
	Axic85NwbY6KVFOXr5R0hH1BX2M9TwA4UvN0/zmpBBFrHt6WKXRiERsL+JNWHE1YIJTUpYTSaUB
	iR0TN5Ej+fOsXthfsgN8mWLuT30NM7vS7LZ7NXtRdcbxcRon7q3jzuueRJWrHVhyT9w6q7Sy4Ao
	LG5/qCdIXVyNYE3v3YokRVFs7Cs36PbcF2EZjpdk6KIeuwDpiL0Vfmu8JSj+LkBopycaG51NwcU
	ric35JFFErXzBWkgnzHzddwqyDOT/4QMJ1S1iqGRNqBDTiakDlSTLghy3QFoF25dkxjEew5aFG4
	+vGw==
X-Received: by 2002:a17:902:ce04:b0:2ed:1ca2:ea68 with SMTP id d9443c01a7336-2ed40e1af4fmr18894065ad.49.1793942402438;
        Thu, 05 Nov 2026 21:20:02 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d837e6sm1653895ad.58.2026.11.05.21.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:20:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dbueso@suse.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH] genirq: Ignore tot_count for handle_percpu_irq() interrupts
Date: Thu,  5 Nov 2026 21:19:59 -0800
Message-ID: <20261106051959.901861-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

handle_percpu_irq() only increments the per CPU statistics and leaves
desc::tot_count untouched, but nothing marks the descriptors that use it
as per CPU. Both /proc/interrupts and kstat_irqs_desc() treat such an
interrupt as a device interrupt and trust desc::tot_count, which stays
zero.

Since /proc/interrupts started to emit zeros for device interrupts with
a zero desc::tot_count, every MIPS CPU interrupt reads as zero there,
including the timer and every device behind it. /proc/interrupts also
missed NMIs handled by handle_fasteoi_nmi(), which kstat_irqs_desc()
already excluded. The /proc/stat counts of handle_percpu_irq() users
have been zero since kstat_irqs_desc() started to use desc::tot_count.

Add irq_desc_has_tot_count(), which covers per CPU interrupts, NMIs and
handle_percpu_irq() users, and use it in both places.

Seen on ASUS RT-N16 and TP-LINK Archer C7 v2 (both MIPS 74K) router, where
the "gpio, ttyS0" lines stayed at zero while the GPIO interrupts chained
behind it counted.

Fixes: 0179464391af ("genirq/proc: Utilize irq_desc::tot_count to avoid evaluation")
Fixes: 1136b0728969 ("genirq: Avoid summation loops for /proc/stat")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 kernel/irq/internals.h | 12 ++++++++++++
 kernel/irq/irqdesc.c   |  4 +---
 kernel/irq/proc.c      |  7 +++----
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 703a062be878..70dd3a010ce8 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -302,6 +302,18 @@ static inline bool irq_is_nmi(struct irq_desc *desc)
 	return desc->istate & IRQS_NMI;
 }
 
+/*
+ * Per CPU interrupts, NMIs and interrupts handled by handle_percpu_irq()
+ * only update the per CPU statistics and leave desc::tot_count alone.
+ */
+static inline bool irq_desc_has_tot_count(struct irq_desc *desc)
+{
+	return !irq_settings_is_per_cpu_devid(desc) &&
+	       !irq_settings_is_per_cpu(desc) &&
+	       !irq_is_nmi(desc) &&
+	       desc->handle_irq != handle_percpu_irq;
+}
+
 #ifdef CONFIG_PM_SLEEP
 void irq_pm_handle_wakeup(struct irq_desc *desc);
 void irq_pm_install_action(struct irq_desc *desc, struct irqaction *action);
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 7cbcc3fb9e6d..3f7bfe0adfd7 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -1020,9 +1020,7 @@ static unsigned int kstat_irqs_desc(struct irq_desc *desc, const struct cpumask
 	unsigned int sum = 0;
 	int cpu;
 
-	if (!irq_settings_is_per_cpu_devid(desc) &&
-	    !irq_settings_is_per_cpu(desc) &&
-	    !irq_is_nmi(desc))
+	if (irq_desc_has_tot_count(desc))
 		return data_race(desc->tot_count);
 
 	for_each_cpu(cpu, cpumask)
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 0c0df16de581..c985515f5030 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -559,11 +559,10 @@ static int irq_seq_show(struct seq_file *p, void *v)
 	seq_putc(p, ':');
 
 	/*
-	 * Always output per CPU interrupts. Output device interrupts only when
-	 * desc::tot_count is not zero.
+	 * Always output interrupts which do not maintain desc::tot_count.
+	 * Output the others only when desc::tot_count is not zero.
 	 */
-	if (irq_settings_is_per_cpu(desc) || irq_settings_is_per_cpu_devid(desc) ||
-	    data_race(desc->tot_count))
+	if (!irq_desc_has_tot_count(desc) || data_race(desc->tot_count))
 		irq_proc_emit_counts(p, &desc->kstat_irqs->cnt);
 	else
 		irq_proc_emit_zero_counts(p, num_online_cpus());
-- 
2.56.0


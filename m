Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453400;
	b=RDD/2C0jViW4EK+KpXNZ05S2T9kjzFMPwz0lsVNe0u7WVo0PIhc1zhMXpJHq/IaUakUE
	 HtODMVb1rwVjaMxq5ygTAnua5aemv3A1gQY7K4vM28soKN5OPTo0utqv7RRkGNhHEOSWe
	 XRVYBzCoYcJ42wYvoZgw7ovKfWPTEfYVj8X1uluvQUr2sSlAcPEKOfVug3ci9+NDnGPvW
	 0p5oSwzZkWUpxXzGOcwtL6zZnhaO/vbSjkjo2IBVii9bI5Jyspv2NYWBKS3LuXHwSuxJu
	 VCUS9TYT//M/uBkubwA6KW4NBihk6062b3py1IpesxR+qwEqH76xQBOlTfzCvcvyvIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tE/X1+1LRXogvMObjlwO8yeEBLS2Ilxt7hicZM4/X7Q=;
	b=pl3N2tkSycV2HfOIA1uoeMiDeH+WD8xP/x58UeK8LBcBEtamrtRPuuB7yOm4iXOrAZJZ
	 SkC0MATAEY+s5mMzEiZjoGb2VSMK0O61mSBW8cbuww6tTqk4n0v7XGQnphpLdTto9h9dt
	 EzEzPAzfaQi/KR4yxQQj69yOoPoEJXNCpO4dJVraT+z3m4Ry9SfB/jlKW1Ard0aTZYPfY
	 0hxl3NlQX1nSsGLEwaeOPhcWwvNALyaxI/awy5/AaT6ysEuWY1WeyqScX3L6+GrgIYWlG
	 0J/lRXSBfAQNzVWxQ9g64AOsaDIeUyF2zE7lUJ06kMh88nEqCcAw/ZWaL5nXR5jvquA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pH1DLdbw;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53707606A894
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53707606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pH1DLdbw
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so7458643eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453399; x=1795058199; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE/X1+1LRXogvMObjlwO8yeEBLS2Ilxt7hicZM4/X7Q=;
        b=pH1DLdbw+gETk/H0CifzwIx04O/4oB3PetQ24AEjlG4FYHxlGshk2MEvYDjBx7l15u
         b/oVUFvWtaXGvgd/MqsVgY6yM1V1OytJSfNcl10gkqdRVi3Qrh7PoNXV889BKE9gCr0F
         Lr5k/qQ8fjGe5P1cke51Rg5Cno2fmg9LyBaAO+Wq8gqryL1kztFPgnFSaG+yzIH/fci8
         35HkYoNESbIyeMQwFm9qDySS3heavK8/a+5t0Bn/Bp379k9c6pbzC9ISiaFwDnx0Tp4z
         cPLI0L2iWKUo3Y7BKzB6Y6l3GsQAlkQ2CLO+UZkajnjNvpba4Sa9+9YsMRVAqKblTkDn
         ibOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453399; x=1795058199;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE/X1+1LRXogvMObjlwO8yeEBLS2Ilxt7hicZM4/X7Q=;
        b=KxXYHVMBuywSb4+9REic5ylQoGVS/KjxBC/+MeBOuOMG9qzmk4xR0iD+9I0tQD0CV8
         hFOWg/5PwzXfHY8tvb4WgkchfF/eSe9LCByHnXmn9mGPa7RgU6m2qh1l0avofPD9LeXw
         i4X7anXjD2DK9+HSg01/i0a6quBcIBAIW67IHzZh1i77j9fc59vs2UBYRJUydTRjaOLw
         AbECOaXch9mbvTsEMBwqcV8oiFwe9sibNWuo/v8JbkuXL1n3OWwCEhYWisejA3kXJKqH
         4Rvgkll2tN85c45MfYs5C+TzKtFpYN5Tsdm3QmG4zta4JvowKhJoZ1EZfOXnEAICN2jr
         Cppg==
X-Forwarded-Encrypted: i=1; AL+hErEEJLvt8rLBLzS9jnlAxoGho5QSt4wTxZ2Gb2ZicHISztZPnfvzBsJoDiXRt8kfuTaH4umcbyQdc4lxxRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tbPbHDiUw66w0xxCQOdDul0kbVfCYjMnHitEL0BxuSndbDoOb
	IFzMXhDG6VrOOjGqZqeUXlEShVIT34uJD/FcOOETHCEKYNL0QsqVhQLvA0+Vqeohwyx/VtjIsqc
	XLqKExJ2uFg==
X-Received: from dyay16.prod.google.com ([2002:a05:693c:62d0:b0:36a:117:523b])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8219:b0:36a:1008:5815
 with SMTP id 5a478bee46e88-3768385dee6mr5336168eec.5.1794453399190; Wed, 11
 Nov 2026 19:16:39 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:25 -0800
In-Reply-To: <20261112031629.396819-1-mrungta@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112031629.396819-4-mrungta@google.com>
Subject: [PATCH v4 3/7] genirq: Implement synchronous disable_nmi()
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, disable_nmi_nosync() is the only interface to disable an NMI
line. Drivers stopping their devices need a synchronous variant that
guarantees any running instance of the NMI handler has completed on other
CPUs before returning.

Implement disable_nmi() by validating the descriptor, disabling the line
via __disable_irq_nosync(), and synchronizing in-flight NMI handlers via
__synchronize_nmi().

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 include/linux/interrupt.h |  1 +
 kernel/irq/manage.c       | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index ee2dd5349697..4a220142e16c 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -245,6 +245,7 @@ DEFINE_LOCK_GUARD_1(disable_irq, int,
 		    disable_irq(*_T->lock), enable_irq(*_T->lock))
 
 extern void disable_nmi_nosync(unsigned int irq);
+void disable_nmi(unsigned int irq);
 extern void disable_percpu_nmi(unsigned int irq);
 extern void enable_nmi(unsigned int irq);
 extern void enable_percpu_nmi(unsigned int irq, unsigned int type);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index bd7cf91719d7..073fd3595d2c 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -829,6 +829,30 @@ void disable_nmi_nosync(unsigned int irq)
 	disable_irq_nosync(irq);
 }
 
+/**
+ * disable_nmi - Disable an NMI and wait for any pending handlers
+ * @irq:	Interrupt to disable
+ *
+ * Disable the selected interrupt line. Disables and enables are nested.
+ *
+ * The interrupt to disable must have been requested through request_nmi().
+ * This function ensures existing instances of the NMI handler have
+ * completed before returning.
+ *
+ * Cannot be called from NMI context.
+ */
+void disable_nmi(unsigned int irq)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+
+	if (!desc || WARN_ON(in_nmi()) || WARN_ON(!irq_is_nmi(desc)) ||
+	    WARN_ON(irq_settings_is_per_cpu_devid(desc)))
+		return;
+
+	if (!__disable_irq_nosync(irq))
+		__synchronize_nmi(desc, true);
+}
+
 void __enable_irq(struct irq_desc *desc)
 {
 	switch (desc->depth) {
-- 
2.56.0.611.g1030f0b940-goog


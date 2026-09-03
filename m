Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF1305680
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400482; cv=none; b=L0BMyWAzPFdZmMQnNVotS2J7SkLdoK62Jj1YEEtoQDkmo1Bv0J538t+S3C5a4buIFCFV1nPFjHyh/sDl3BHHAtCArRT5u3AxAdqLKPDVKRjuzXe5F5QBJCP8k/M80Yn3sMGVP5enrAXyj0jyFJxvhlTOd/+znOi5RQr2XqwbFnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400482; c=relaxed/simple;
	bh=sHtLbAnHiqVgz+a1ynLID9Y8mgVQLArjzx4ytcT8sdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q06CW+mtSIeJImn6PLI10jbJ20PzUp7kj7sOAzV6wDs9CpVlOy9KTFNQBuQ0WQjdFaGVmKAWjFS0qTIeXJMi0zJDfi9Kvk9CU9jYgdc1fmw7Kp12Fo2jDigoRBWYGKisrP87w6sZakdHGTiSSbXhXiRe2nrK/JtDkV6zMum+9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tq51EJwx; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tq51EJwx"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2870997a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788400479; x=1789005279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoKqqWg8bqAtanb9M/zmb/yr36CAI+4ITz7oBEmrMEw=;
        b=tq51EJwxyx0iH5xpgKhd9z1TUabksBDUl8Nufr5mkd0FZ7ngNwlqcvGaLE12uLS88B
         hl0+fkJbXMfIFJ6CPWPT4nIYUN0oTy62hU3vFQjDhmZznytRkYtScPQYG+ieWtvjbxOG
         Smi+o1StZ3V8d73cwPU2/FNjS8hpetyqvr5/OzwujiXQVAmWpfROAoH7ypUPERrFV1C3
         aqVT6RWF4e6epB0xASQl9k2yfyMLkuCwRZ7m1jh8mj2dphlQGvZX8KwvMjIP5N3zAXYa
         z6jbyjDY4ChXvzbKs00je/OoHKrYpcFz15HcYGNIim23JrczePz3nt/1C73zf48tnirY
         My9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788400479; x=1789005279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoKqqWg8bqAtanb9M/zmb/yr36CAI+4ITz7oBEmrMEw=;
        b=D9KkcWeZAgiYPmJbQ5/SUe4BCoo5je4H4XR+JurKt5UB+yw/tvUgXcc3tMUK7ZRlo6
         vTvhOiTZUXODPeKSJBYVy89k6eS0nBsiNYB4j892pxZYmR1UA1oLk+0k1x8kr3PGctUn
         eiLFGdnu2/83NTslP/SzZftbrEbmZkTObVntdJkHVIUksENqFNkwFkH2zsFP6hMmcnEj
         lphxSCHFgk7PyepdEXbTemZXHWc+E0LGEj7+kXIlo0K2CeIUskUD4aw9XSv4wjKfU7Ol
         n6iYbsJ/x7m2L4NQB9wtnVWoorjBUdLIr2zNom0bI3y61XDb51JgH5lL/Q7NcL+naYdL
         T4Tw==
X-Forwarded-Encrypted: i=1; AKwUvBz6GJACLc7JqzT/w13aXhFVKpWN5Q/uk3QApH9dU/IGLvVlHJsgQ5bNnv2xMDMeBVg+631neo417geif+0=@vger.kernel.org
X-Gm-Message-State: AFuF++kTaqBOyEbDQIzdWezv3lbm0m/kyGMzc+DJwyIS1JEM22zhF+vd
	N/iF1zwyl3zQu+26z8znfjIUiK2l+6iNTO5T81Dtru+FiiaSWXbz2Oq1ZPd9miqDdoWT2GtEE/m
	ml8NAvofByA==
X-Received: from dlbvs14.prod.google.com ([2002:a05:7022:3f0e:b0:141:3e0f:b739])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a4d:b0:380:540:d499
 with SMTP id 98e67ed59e1d1-39aedf75c71mr11880424a91.6.1788400479123; Wed, 02
 Sep 2026 18:54:39 -0700 (PDT)
Date: Wed, 02 Sep 2026 18:54:20 -0700
In-Reply-To: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
X-Developer-Key: i=mrungta@google.com; a=ed25519; pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788400471; l=1668;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=sHtLbAnHiqVgz+a1ynLID9Y8mgVQLArjzx4ytcT8sdU=; b=5B9upHEjp+OR5r5ijj+Hm7lQqSLhadCiohWfcaV4teu5+dSM/h3juA66MBbKacWwRoq3SjX1C
 Ss7CaWz2p6pDe1+bIYsFa9Kf9rdL8ah/mzgurbDYVn0DitodwNWBTiB
X-Mailer: b4 0.14.3
Message-ID: <20260902-qcom-wdt-nmi-series-v3-3-f3999362a9ea@google.com>
Subject: [PATCH v3 3/5] genirq: Export NMI APIs
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A. Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, request_nmi(), free_nmi(), enable_nmi(), disable_nmi_nosync(),
and disable_nmi() are restricted to built-in kernel code because they are
not exported.

Export these symbols with EXPORT_SYMBOL_GPL so loadable kernel modules can
register and manage NMIs.

Assisted-by: Antigravity:gemini
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/irq/manage.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 009633b5b654..cb6bad666779 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -766,6 +766,7 @@ void disable_nmi_nosync(unsigned int irq)
 {
 	disable_irq_nosync(irq);
 }
+EXPORT_SYMBOL_GPL(disable_nmi_nosync);
 
 /**
  * disable_nmi - disable an nmi and wait for any pending handlers
@@ -781,6 +782,7 @@ void disable_nmi(unsigned int irq)
 {
 	disable_irq(irq);
 }
+EXPORT_SYMBOL_GPL(disable_nmi);
 
 void __enable_irq(struct irq_desc *desc)
 {
@@ -848,6 +850,7 @@ void enable_nmi(unsigned int irq)
 {
 	enable_irq(irq);
 }
+EXPORT_SYMBOL_GPL(enable_nmi);
 
 static int set_irq_wake_real(unsigned int irq, unsigned int on)
 {
@@ -2114,6 +2117,7 @@ const void *free_nmi(unsigned int irq, void *dev_id)
 
 	return __cleanup_nmi(irq, desc);
 }
+EXPORT_SYMBOL_GPL(free_nmi);
 
 /**
  * request_threaded_irq - allocate an interrupt line
@@ -2376,6 +2380,7 @@ int request_nmi(unsigned int irq, irq_handler_t handler,
 
 	return retval;
 }
+EXPORT_SYMBOL_GPL(request_nmi);
 
 void enable_percpu_irq(unsigned int irq, unsigned int type)
 {

-- 
2.55.0.970.g62bdec98f9-goog


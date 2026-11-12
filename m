Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453405;
	b=EfqdRY+B5V6MsSJ3bd0i9wKGWgiCseLmExgxBW/aTPHuIfi/lP/Sfbf1Uu67lGuX0oGF
	 DrPUsv/sbRhUTkaFQtgqx6gvAbTImQQO2z7iuKFDsQykjVy9KSY80LiHiCHdJR6VJ3kas
	 QAFkRIimI/TxKnAdg3G0suTTVgPXgAf4gMWKrtk0JLbNPbpVlf2OhSl07SJDC9biRTf+E
	 fgo07jj3njFqeZG0gTvG66OldG+OGzE+e/8oWaRk7PAVDlikQtvDQI/64GPi6dirfE8xG
	 yVLsR9AWR4UNg9NC+EL2EjaHyXbmgN3YzIZTpKGZ251d2F8i46AY786DM+MeAo12aPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tUfAtcTNV5mTTLgOCBi4Us8jn7x96xOcbf5rkwDlN7U=;
	b=Fz8X3WixIk0ccCNiyOBxQVsUp931cFAVcMHIqYfU2mWiNpUIy09d0ce/DZGlRhqa5JwG
	 fruKVXk5kveiVYrezngOunnNobHybmB3PPji4+U6TVXx8N+n25xC+oT/gNKAzsk1+LVdI
	 ZLUafvoZs6WP/faVAQvnWTQygEABZ9/sq0KD5XHQoZc8FVRAPT4VGBFwoO1glYu1EIJsM
	 Dd8CNTcXUQsuaVse0A4lVsPA6p6X8XXrmqjWanVvjNn6Feu91ZH0i4brZcwhzssW/FN0u
	 bcoJSI0I6FDKovYSjeLFp1u3Xmy9F4OjElFgjhqIsVNqT+NEYVxN2DIXDgr0akPsdew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WLivNET8;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF660A260F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DF660A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WLivNET8
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so5744561eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794453404; x=1795058204; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUfAtcTNV5mTTLgOCBi4Us8jn7x96xOcbf5rkwDlN7U=;
        b=WLivNET8a6yV+zEdLpewvcjBONJR08rT+t/FC7VepSpuVXybMSVXpZ5CinsUO8TPpu
         W7YY4RctlAMSyhLv34a7J9gtcDcXI0k4DNXEGiyLaksj8Xag84BEWXFDkwNQM8AgkPty
         6sh8XQvK1Zn0RxoFanP+JMGN6WEXEAsrEM7GW/8grZ2+TsspWOVLwrc6+uGCx9JoJIt7
         7mLeht2AgTv6Vg1tEtV2IAtYww6MD/HXzIcABk+PkOzR8W0eU9ocza0+9dM+DSMsDIg9
         Wn49G0jgFyHaEVYj/v1WTnb0qzLHrs+hVB/mTlCnqX2LYX9TNZP+nA5e1VYr04JGHPAR
         Xsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453404; x=1795058204;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tUfAtcTNV5mTTLgOCBi4Us8jn7x96xOcbf5rkwDlN7U=;
        b=khijCQ1l+HEICj/xRqV58WcvVgV9XGqYntZOfXfN9zoLnANSKpIcRkMJAa+JkDCYRe
         vccQh4dfeEn31actB34vk1EtFS3vbBQoOkhcuE3T+XuMrkSWTQ0smIDuKboV+Ai/dCFg
         Y95tZUK90n71iZcGRMGYsyLDaFtRzaZQjPg4PmSGgM8dG5YU05QFIeSXhCNBfbCs/a0+
         SgAKobtGmXKzyAbBZ9hZuAefG2hed4CI+nOMgm+JeiQ3J2xCGuwW2JRNAsARhVnZZMOP
         sAInw2GQz6N9R+W2wbvXvSSTIFZGP6ZRsPrwlOgramybSm9NZHZ1OmFBMomuf3SFkA8z
         juoA==
X-Forwarded-Encrypted: i=1; AL+hErF+ltcqi7VvPJ+S9YnLDyRfs1sJojeM5x/fcRMj5XUXLmO9r2+5ACPwyls7iN2Ee+5VQmA+hn5HbGFA2aE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QhIIo+GQ5I7/oibfZov1HzXZm+twfBaAF2LlxfRsj0Q5d+TtK
	MRvNksbhKK3cvCGP1qiSYH0SygWSaJbQDoRxBPx1yvJccz3tf7TMjK40zCCmVhS8/UpxBTOVnMx
	z7nu1FKgk7g==
X-Received: from dycqz10.prod.google.com ([2002:a05:7301:df4a:b0:359:72f9:2aab])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:88d4:10b0:36f:4354:608
 with SMTP id 5a478bee46e88-37686c3b625mr4312512eec.37.1794453403404; Wed, 11
 Nov 2026 19:16:43 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:27 -0800
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
Message-ID: <20261112031629.396819-6-mrungta@google.com>
Subject: [PATCH v4 5/7] watchdog: pretimeout: Protect governor access with RCU
 for NMI safety
From: Mayank Rungta <mrungta@google.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Marc Zyngier <maz@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

When watchdog pretimeout interrupts are configured as NMIs (or
pseudo-NMIs), pretimeout handlers execute in NMI context. Accessing
the watchdog governor via spinlocks in watchdog_notify_pretimeout() is
unsafe in NMI context and can cause deadlocks if an NMI arrives while a
spinlock is held.

Protect governor assignment and dereference with RCU instead of
spinlocks, allowing lockless, NMI-safe governor notifications while
preserving safe runtime governor switching.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 drivers/watchdog/watchdog_pretimeout.c | 45 ++++++++++++++------------
 include/linux/watchdog.h               |  2 +-
 2 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 02e09b9e396d..7fb586c77403 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/list.h>
+#include <linux/rcupdate.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -67,12 +68,14 @@ int watchdog_pretimeout_available_governors_get(char *buf)
 
 int watchdog_pretimeout_governor_get(struct watchdog_device *wdd, char *buf)
 {
+	const struct watchdog_governor *gov;
 	int count = 0;
 
-	spin_lock_irq(&pretimeout_lock);
-	if (wdd->gov)
-		count = sysfs_emit(buf, "%s\n", wdd->gov->name);
-	spin_unlock_irq(&pretimeout_lock);
+	rcu_read_lock();
+	gov = rcu_dereference(wdd->gov);
+	if (gov)
+		count = sysfs_emit(buf, "%s\n", gov->name);
+	rcu_read_unlock();
 
 	return count;
 }
@@ -91,7 +94,7 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
 	}
 
 	spin_lock_irq(&pretimeout_lock);
-	wdd->gov = priv->gov;
+	rcu_assign_pointer(wdd->gov, priv->gov);
 	spin_unlock_irq(&pretimeout_lock);
 
 	mutex_unlock(&governor_lock);
@@ -101,16 +104,13 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
 
 void watchdog_notify_pretimeout(struct watchdog_device *wdd)
 {
-	unsigned long flags;
+	const struct watchdog_governor *gov;
 
-	spin_lock_irqsave(&pretimeout_lock, flags);
-	if (!wdd->gov) {
-		spin_unlock_irqrestore(&pretimeout_lock, flags);
-		return;
-	}
-
-	wdd->gov->pretimeout(wdd);
-	spin_unlock_irqrestore(&pretimeout_lock, flags);
+	rcu_read_lock();
+	gov = rcu_dereference(wdd->gov);
+	if (gov)
+		gov->pretimeout(wdd);
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(watchdog_notify_pretimeout);
 
@@ -140,8 +140,8 @@ int watchdog_register_governor(struct watchdog_governor *gov)
 		default_gov = gov;
 
 		list_for_each_entry(p, &pretimeout_list, entry)
-			if (!p->wdd->gov)
-				p->wdd->gov = default_gov;
+			if (!rcu_access_pointer(p->wdd->gov))
+				rcu_assign_pointer(p->wdd->gov, default_gov);
 		spin_unlock_irq(&pretimeout_lock);
 	}
 
@@ -170,11 +170,14 @@ void watchdog_unregister_governor(struct watchdog_governor *gov)
 	if (default_gov == gov)
 		default_gov = NULL;
 	list_for_each_entry(p, &pretimeout_list, entry)
-		if (p->wdd->gov == gov)
-			p->wdd->gov = default_gov;
+		if (rcu_dereference_protected(p->wdd->gov,
+					      lockdep_is_held(&pretimeout_lock)) == gov)
+			rcu_assign_pointer(p->wdd->gov, default_gov);
 	spin_unlock_irq(&pretimeout_lock);
 
 	mutex_unlock(&governor_lock);
+
+	synchronize_rcu();
 }
 EXPORT_SYMBOL(watchdog_unregister_governor);
 
@@ -192,7 +195,7 @@ int watchdog_register_pretimeout(struct watchdog_device *wdd)
 	spin_lock_irq(&pretimeout_lock);
 	list_add(&p->entry, &pretimeout_list);
 	p->wdd = wdd;
-	wdd->gov = default_gov;
+	rcu_assign_pointer(wdd->gov, default_gov);
 	spin_unlock_irq(&pretimeout_lock);
 
 	return 0;
@@ -206,7 +209,7 @@ void watchdog_unregister_pretimeout(struct watchdog_device *wdd)
 		return;
 
 	spin_lock_irq(&pretimeout_lock);
-	wdd->gov = NULL;
+	rcu_assign_pointer(wdd->gov, NULL);
 
 	list_for_each_entry_safe(p, t, &pretimeout_list, entry) {
 		if (p->wdd == wdd) {
@@ -216,4 +219,6 @@ void watchdog_unregister_pretimeout(struct watchdog_device *wdd)
 		}
 	}
 	spin_unlock_irq(&pretimeout_lock);
+
+	synchronize_rcu();
 }
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 29cd03686154..5a3c35968cc8 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -105,7 +105,7 @@ struct watchdog_device {
 	const struct attribute_group **groups;
 	const struct watchdog_info *info;
 	const struct watchdog_ops *ops;
-	const struct watchdog_governor *gov;
+	const struct watchdog_governor __rcu *gov;
 	unsigned int bootstatus;
 	unsigned int timeout;
 	unsigned int pretimeout;
-- 
2.56.0.611.g1030f0b940-goog


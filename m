Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029553;
	b=DD+XIBe+oDLfUlh/Nq7K4pCsu3h4UeUN2PPxvrkkeEdcQorAcE2Vh6YOzvHKp6mV7f7I
	 5CXhsRbhLBcGEp4/RvRj6y6djwqHz6Hb9v8ndpcmS6HPFnm4nbslT89FEd6XDbv5n21pD
	 J5WTkSKp7I5RV13dFztU4PXLpH7AG9dKn8+GfmzHaFKblq7olAEEghX2sJlnTQVcIhj6n
	 rz2rQXCF9Q4aOknxdEFKoGgsPREytyp0G59Ws9h+UVbAbxhodajZlX1PP8Zozhweyx9Jd
	 D4C9d0VV0SkmPHial0C3IdBaJjwIpi/Abz82B2nrWBCVC1LNFW0Kl2wTpQgZK5AxBuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6sW0z1d5SKi+Jg6QexltnX75AHvo1gx3Slpp03kBvI0=;
	b=bR4nMg7SmfhpZMmoMaF/6ybe4pg3KbCYU7ZLnK6roogJmTMN7ZK33gv6OxSMfAtE3tlv
	 4ss12XhK0YPNmhcwMZsbE6AkxsnJErqWN88w08TM+JmSrhWQDU9OlT2doagI9V0cxc1D/
	 +ODuWO7kldOTILKprniTD4ikuok0IqDhbsv6Nfv+FnRiLJ76htV4oLIdzc9TAIdfHETq4
	 MJe9zBoZasF4Od+QU/WcLpzA0feXv7AfQeI3DKBveqNWxall/mVPq3hDElUxRv/tKolZe
	 wFgv/Ubn3VArLgsIZNUZ1Umwl/3s8uOsqB9XGscPbXUixDgJMHIcFlFn8lKstyc5pbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N2RzNSmy;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E665606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E665606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N2RzNSmy
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso1049211a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794029552; x=1794634352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6sW0z1d5SKi+Jg6QexltnX75AHvo1gx3Slpp03kBvI0=;
        b=N2RzNSmyusmLoY8g/mYzOOXpMkwMV+nt4Au5OExq1lWzAth0BoRtgb5KnabOAdMS7l
         Jbmj3h0AnlJT6JMhcEs/L8BfW0tS+1bkTprYeMusbzhRuO+g9fUQCGT0QZSbV1UMhADX
         q+d01OEw21eD+8kOVmqeXwCAhHPZ1RGKL1T0RoAh+QUE5jHGD378S6AHzxVSZss4QnLt
         09ouoXBH6jK98P4lIbQO+UCedHeyY4LhZFmc2CtMRL81/kpXO0iSCXnt1KxssqRSoJng
         tn06ClnIDO8C7dON4lk8Dw/n2RV6jj+jO2MVTrI5/1a1ckG+Kvml4/rT1x+VKfsBi9jr
         G+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794029552; x=1794634352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sW0z1d5SKi+Jg6QexltnX75AHvo1gx3Slpp03kBvI0=;
        b=jYYXZ1K8xsFASxiuM5CMI4H4CTkWc4pm4AdqNC7k9RVEMzF3wwNCDZeJY7JRUdbVo+
         jcYX01vA700iDRkUBurXgzko/UaxS6T5UNfxZa5PiOaKcXbR2ZBkO1JBQq4k549Q677z
         b1fwzxBgvYMQlS4fqfDJv6N9aWdqjA40i9X4Xe5C5ToX4blsP+rza9fNSkgtW01vsJIe
         0+vg1Z5klrso0RmvD0bYs9Pd2gg9rRfLZO8HqCXuy5a/fPTxPKRaLaqab2boHouWF9Zg
         jFgye544kCcGN3FldfJ1W++r3jqDHXKtSz/zU0TYY/Tx/So4j67uEhEOIDJZrB04/0sd
         I+cg==
X-Forwarded-Encrypted: i=1; AL+hErFvP4c4JYsVHBhX7UDjc2DHXi8WD+VcxzoSijLggykzW/PSDdHySNrkGqqPe88/llHS76nvQ+U8aF6Tk34=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CW08SzPfSLXGzaAC8+V9oLmA5zYmC1L9fIIsDeQWlTC+ku/xn
	gW8UiaCzsIWsPoBoVWJlbEFc6Ma5p4IQR25aS+lqiI/jICNwotWBTNbt
X-Gm-Gg: AYBFou29NICHa+TlzF+Cm3Mf2CoC6FCiWQ5D+TRXtsbPEN78tSAoDluHWvBxTMN9GtE
	oIKAGoHqovCZAG/qIgGU+xTARwLj2shE+99Mj9zVdznr2JJyYZQwWvXgcsZmf7VmKwBAyG0J42F
	8IWX7aPJGPgFcCSTUksubteTaF7+Sl+d9y2HXYwGegfzNaYP1UQIAd7YmNagaJfbm1TvCmZixrQ
	4fMeoI2tlg/A/TzQBB85pkNMP1bGxlj11hb5Lpxa4tXSfkxQlmtlB5G8YmdFbJW7t3IA/GoPqqB
	bHKWge5YFvJGKiSmysNWBpssGEL8Fn9/1r5dCdS4ZknqnftugJiRd9bgwK3PIpLleb+vU2399Ry
	GioPpJA3dMm5Q38VOcgTPICcbIORmmmA1aLl9wKkRi/oRtPO976qyA6zvcOm3aCyYMfOirJC8q/
	98irv9mfKgPuJR9JwQZlE5SsK+NKlGYgFWN2tEWxbjFh88dWpIEecyyKnp75zkyH3Ws5t9UC/Pg
	0DvCeLRjNET/kjlDaj9VLOjPkFV94wo5R9H4Fn/cbevp5klfvoA5hn++VQ5ccs2EcK4MCsDrYpP
	Kbih8u527/WnQlxridlEYqX5t+J18/O5nh4xH6a6TpF8Emd0
X-Received: by 2002:a17:90a:d24d:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b0db754c65mr3213278a91.42.1794029552419;
        Fri, 06 Nov 2026 21:32:32 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101bc4586sm1246851a91.2.2026.11.06.21.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:32:32 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: ls2kbmc: cancel the reset work before the driver data is freed
Date: Sat,  7 Nov 2026 14:32:18 +0900
Message-ID: <20261107053218.3326443-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

ls2k_bmc_init() INIT_WORK()s ddata->bmc_reset_work (ls2k_bmc_events_fn)
and requests two device-managed interrupts (ls2k_bmc_interrupt) that
schedule_work(&ddata->bmc_reset_work).  The work handler dereferences
ddata via container_of().

ddata is devm_kzalloc()'d, so devres frees it when the device is
unbound.  Nothing cancels bmc_reset_work: free_irq() (run by devres)
only waits for the interrupt handler to finish, not for a work item it
has already queued.  If a BMC reset interrupt fires shortly before
unbind, the queued ls2k_bmc_events_fn() can run after ddata has been
freed -> use-after-free.

Register the work for device-managed cancellation with
devm_work_autocancel(), before the devm_request_irq() calls that arm
it, so devres (LIFO) frees the interrupts first, then cancels the work,
and only then frees ddata.

Found by code review; not reproduced (needs Loongson-2K BMC hardware and
a reset interrupt racing driver unbind).

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056b..c44291e 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -12,6 +12,7 @@
 #include <linux/aperture.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
@@ -371,7 +372,10 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 
 	ls2k_bmc_save_pci_data(pdev, ddata);
 
-	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
+	ret = devm_work_autocancel(ddata->dev, &ddata->bmc_reset_work,
+				   ls2k_bmc_events_fn);
+	if (ret)
+		return ret;
 
 	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
 			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
-- 
2.43.0


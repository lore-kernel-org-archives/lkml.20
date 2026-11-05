Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896070;
	b=xJJP77vkyN9XTH5sxChb9QVSCe7Zfq6+U/QjpxazyKRuHEgmVrRstGXnpXx6/M8eZXCG
	 lWpSZO2V7ZuqtN2/vOxWPq/IH+wuYzud9Tq/3BWRaIlm0BBxofckPXjhuVQWXX0TzSunG
	 EwDlHIPRN5lU+VzGDf+cHr5rAokSDtpQmxjyxG9fOeF/fLt3yfXMgNatULWxpj9h/Shmp
	 gVqrZC4YfXCr91MYuKx9gIzMfXHH+6k6pz2U2Yja0oD5zI8pELd+aWYw7uq01U3DDSDVX
	 Ca/gIOstYw0uDxc8zl+QU1PDTgx6bDWR8Nji+TmcfdZPS6BJn1LJVtAkwU0hr+VwwUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LU+RiqQFh2f5Ka89JSx/cG6xgtNv7ffTWhetPZC5TwM=;
	b=c6vrqW4IDgtqx5NOnqjIadslNUharOScqLotc1ilOmF5Fk4YLjvmH4sDwaKDtTy7cSOd
	 gnWfrIHeVgClXjVq92XyaKZhph64NjGrDW5N/83b1zHPi77expT0h4FXTSLJ1z2cNv0GB
	 YO3Z36U1IFtFVf4Fos9wAXVLem5xE3tG4mTHHVJxpGxpS6LRNkd7twNUM0+jQUCoD/qTK
	 1QIqXtekDrTIjMegjeF0I6aHR3bdiIEf8n326KraqKvQZKUMi2vsFG/nOf8C+vFTY9y/U
	 8uv8t14paGLCNRHEWwQZHAFKWr5KgYRnJ5rl0lMN6n8KqiB2tsvqgKLx1N9bq8ul19g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTYsHsGT;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9B0606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9B0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTYsHsGT
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9eb579c0eso13620705ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896069; x=1794500869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LU+RiqQFh2f5Ka89JSx/cG6xgtNv7ffTWhetPZC5TwM=;
        b=ZTYsHsGTPW4DPCLSpW79VxjAhqZXRs4NmWzPSwjV40XhNMq0LKDsK7976W9orTHyQt
         vTKzklK29XpfZYtFkSFicNya+BibZJQ733L71VWWhxtoj4XQZDR0GYXaz5bBhxSDay/6
         vPfiNI7KhzPaBLMxpAIqZEZtf5miwORx+rknNWBIWMvr5r80JTVmI7Vm3TMxf05hOvaJ
         hrXQmXSAc9i66GtinSgizi19nADkhf9qBGPConbzWz++qp4Kbnxwqcz9Y2QZkVDCdzZR
         uh/E/lficxjvrXUZIZwRzQriLWtQrJAHMf/mLBqTr3wKi7Lho3X/E4t+U31h+fxGAyqC
         qMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896069; x=1794500869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LU+RiqQFh2f5Ka89JSx/cG6xgtNv7ffTWhetPZC5TwM=;
        b=Es0+GJL4XIuc/pY/TB59sDyWMAC9h3G7C+yhK9sIXyD8kLScUtosI5caG3TrUQ0hxb
         iNEmjP6H7Fl8LvVoSPhCJNKzBZjebBZ19LVneTXO9zCxOBhLUsNrlt5LhZ760riGoAKL
         OdDAPXYyNdy+vWbamHmIVBuVDgv+PL2ApwgfyheoLwcFIFJkx5ZusA4TBsh7XcvKDX51
         7aqFwgTQaE61l05PggL8I4MOPTxfK5/9jQFkCUkVjfjhvO8hVgrbM7f56IvDlJgGY8Ek
         kgh4S9GHXHQUo1hOlzUv5NDS+NVasPJ0NWRvz88u+cSHQ4tg6al4n5ey0EXZSRynmRMM
         IlvA==
X-Forwarded-Encrypted: i=1; AKwUvBwuiWQICwIlzZ1datF8pQXwWS7M2a22LwXlAZpfzGcmHv+eXQqG0+b0ySHRf7PWKWxnQYl66CUeK1h3oYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TF7D/mRM155Zsut3DwM9eSspjNVB2gS3pzjV4vgLP3DbSmdJ9
	vWeRhx0g9xvxypNLZRFka9C1D/xii/lRXgCN3mDDSsqfw89FJGJA9h5AE+FlsEQ2
X-Gm-Gg: AYBFou1I7xw8JkoSEnYhlEvxI4rle88Hwa3v44+sxgSNBqy5J9s6IksfPBF5LZpSrIu
	jCRFpWpsrG6/gpd6JX/Pjw791Tzj9rOZ93sulCYNsQXtq2oa3FSy8kWJOm7tk1LbJeaffFw7bfW
	kdAlHXv52ikh8OxBQT7YF3p3BOMKdaT7Y9gDH6Tyn2PFFNygwzA8wyan8qogiCz8pSWMFtbPRFw
	8igZVvtLJus0UAE+jZPML7uLXIMHTKwbBQM/FjdkzP34/6t8mhK4RjMsdzdD/vHdQT5AkvX//NW
	hnILPhitrOUmGXNqlBMHMXMiIJNk8iI+xhbRciBIk9C9Gli+SJ2EYa35/SfsAbgvyx4WX8flPxm
	5yE7cXh89hs+c55Oqc5VX4zlqWkfbZSF1EHaJxgg+7Lgy9DmeW7/Efr4AwAg1dwvJjalhnzxtzl
	UkERTHdr+oqNmf6uelKhdpENZxjp1egePXpODcEHUYjXuKHE7vSMCku2SwebIwBbd5NyXY0lnTF
	zxLhPAUYk5NYXAIO5QbmgJ6uM05dUV63YFZV+X21Ve9UzRu6x+tH4iCnYPKh/XXZO4axlfXlF0T
	cQtPkthUxMBUVOltY21c0s7aZeaEjGSS096sIBXN+6tucCFX+Q==
X-Received: by 2002:a17:903:1af0:b0:2e9:52dc:4c10 with SMTP id d9443c01a7336-2ed40989b5cmr1416925ad.18.1793896069261;
        Thu, 05 Nov 2026 08:27:49 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe463fsm19859075ad.24.2026.11.05.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:27:48 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] mfd: si476x-i2c: cancel RDS drainer work before freeing RDS FIFO
Date: Fri,  6 Nov 2026 01:27:22 +0900
Message-ID: <20261105162722.1688960-1-hj351016@gmail.com>
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

The RDS FIFO drainer work (core->rds_fifo_drainer) is scheduled from the
interrupt dispatcher si476x_core_get_and_signal_status() whenever an
SI476X_FM_RDS_INT interrupt is seen:

	if (status & SI476X_FM_RDS_INT)
		si476x_core_start_rds_drainer_once(core);

si476x_core_start_rds_drainer_once() runs the work on the shared system
workqueue via schedule_work(&core->rds_fifo_drainer). The work handler
si476x_core_drain_rds_fifo() dereferences @core and reads from
core->rds_fifo.

si476x_core_remove() does not cancel this work. It disables the interrupt
(or, in polling mode, cancels only the sibling core->status_monitor
delayed work) and then frees the RDS FIFO:

	if (client->irq)
		disable_irq(client->irq);
	else
		cancel_delayed_work_sync(&core->status_monitor);

	kfifo_free(&core->rds_fifo);

disable_irq() waits for the interrupt handler to finish but does not flush
or cancel work that the handler has already queued. A drainer work item
that was scheduled just before (or is still running at) remove time can
therefore run after kfifo_free() and after the devm-allocated @core itself
is freed, dereferencing freed memory and operating on a freed kfifo
(use-after-free). The sibling status_monitor work is drained on teardown
but this one is not.

Drain the RDS drainer work before freeing the FIFO (and before the
devm-managed @core is released) to close the window.

Found by code review; not runtime-reproduced (requires si476x AM/FM radio
hardware and an RDS interrupt racing device removal).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/mfd/si476x-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 0000000..1111111 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -831,6 +831,8 @@ static void si476x_core_remove(struct i2c_client *client)
 	if (client->irq)
 		disable_irq(client->irq);
 	else
 		cancel_delayed_work_sync(&core->status_monitor);

+	cancel_work_sync(&core->rds_fifo_drainer);
+
 	kfifo_free(&core->rds_fifo);
 }


Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9A3D813C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444457; cv=none; b=RxezNOA/I9F6VAWpKUdZyOdq5jJPc/C1GLK2aH5vkyWNKRrRjgHNHkukby7Etub75cDKrJMmwBdeDUiPODP7JUEyimh9ilceNFP+iZ1CJ+2UpiZ3w9DEPXaGQI/IAVbGWbUwUwIIENRxSVJBJIdHR8XsXLfNMtKwp9RzluUeMr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444457; c=relaxed/simple;
	bh=Qp2CZuefhEqMmqIPy5aHwwa86xY0cNo7SeqLUI8QWHY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h3SZrk+MyAM6dadScd8MyPMDmF8+IPFQ7qhk3aBalLvJHGf61MAfy6kaLiWJBuOP7awtZPk9bLrhAN+Zu40/6OyZLnd/K47WFPXU1L46v8p2ybh/T7cQshZ6Ou4GXwSQtvcGnoTnghHM2XE3LhDxvN4erw82jSOZ+C0VTUBykwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbmgDw/Q; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbmgDw/Q"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso180138a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789444456; x=1790049256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sE3y70yRK8X+NYBCOKde14KdFBviiIKq+RCDo2yX8oU=;
        b=fbmgDw/QUraHWQ36HAjm7sJ3yB4bjzV4BH/hDwBPg84PS15VPRtd+Ps72caDDK04V8
         ciZHAPanB/jm0LOo9LOIjESlTpwNpGxF1z2s0mG4qtZRejEVQ7L+ZXULksby4/8zNWjA
         ZfRYa51KmbSJ6zsulCMbLveqHHUmFFEDgoqyOkqlYxyxXZa2sUkLynVbMx/0krOtgRlc
         Xu2ELH8PUoJzgNu2l49d0GL+zcsxo37aHLSvoSibP0XkCR1Diz71+4ak8PMtMe8ZucQA
         +6D/wBh8uP8+iaybfIArmN+QS+pxYAERvt58bjrzKb5uNOBn16ZULEaW7jNNeE5dP9uN
         uw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789444456; x=1790049256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sE3y70yRK8X+NYBCOKde14KdFBviiIKq+RCDo2yX8oU=;
        b=MgN/cSdJhOn3JcGB7m4VVebndGtdmQ1TARGyoQVOeSPlGnn4EcffsosLrPZxBC8cKS
         LitOalRI0yLLub4/hcbCASrv1NPA8TpiCIPQQ9JDaDh2Ru0JKSHvRZJKzoq5KPRT5SJ9
         80shB2M83KeS2CKS5arrUl+YbPPn0rP3zc/skTifFnXs9u+rIwKolF7efFvQhG1v/TcO
         evP6EAUk2bjp/p50noaR5DfkQDCk0ns3bJiXRvwvLBFmVnCeooaLkgAjISJKU3qKhhYQ
         8L1j8dWw6qzHkk5HGjyRi5/etGkYQfaO1QMTa2rDT2qk8csadtM8icY0ZE4iUzd5mnRD
         HbpA==
X-Forwarded-Encrypted: i=1; AKwUvByDQ8Wk4drY/+Bsjjpk35ReKQ4+MxPIpGNlRDa8gvJC42jjUJ6v8Df8lunbRzrdzSw4DuEzoc+FfJs5TRI=@vger.kernel.org
X-Gm-Message-State: AFuF++lJj+h2pf1ZBnz2IMDkFD6nzaO2WhTVdxbTQWdQFHBcN6dWJyAF
	LqcfsTCjdrEOknxiEEoIiJ8rv4gO++hd+5ufKtAb5Ve3ak10i0spVHxb32g/beCl
X-Gm-Gg: AYBFou10xJn2061lTz2aPznnLCAxpt7L/Fom7oKC3gSQYuSD8Ef7H3wccsn2VqAypmI
	hSTbRwDnmEyIQuQ36XLPOKAEJAvzFF/U/SGxgg5xriSWjn3ghDhQxNrFvSPWRRLgIMIs+4wLkox
	nmc+MwcWlroV7tcBpabTYLlnbBD+ChIWqTlNOuPlYStyGaYX3/nz/fZFaqRTE4HELRFEcTczfUZ
	PjSknQNgT11/O3CL/nPbgAps+GWS98MqNZOrGGGxEYwOi83ZyFkIfgtGoE+nIzEzz1UdU3pRtxu
	yxs7QOdANCjonr7G3asq2ngtpjiyixNQA8ppyVA7CN+F6WUF5fWGITIFkdn/0pbaU1xocbVB/xb
	DhrgpecaJvPzHkjygXX0C/rYmJFFm4lu2cjMHMTOuxI+R/Qhe+bTECpYkx1Ungx3/Gayt3+tU7R
	OEkcbv1lZfdV6tjSt4c2VsNBzPDFh4VDu9DaDSHUxQUoSn1JZy2P9auI6mapy47Lshl9BwV6dMV
	PQaq2ofMrU/Kn78
X-Received: by 2002:a17:90b:384f:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39df77007e9mr7101818a91.20.1789444455695;
        Mon, 14 Sep 2026 20:54:15 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd0baaasm2385768a91.9.2026.09.14.20.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:54:15 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (gpio-fan) fix use-after-free of alarm_work on unbind
Date: Tue, 15 Sep 2026 10:54:09 +0700
Message-Id: <20260915035409.4177780-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
it. free_irq() (via devm) only waits for an in-progress IRQ handler,
not queued work -- a pending alarm_work can run after fan_data is
devm-freed, dereferencing it in fan_alarm_notify().

Cancel it via a devm action registered before devm_request_irq(), so
teardown frees the IRQ first, then cancels whatever's already queued.
Guenter pointed out cancel_work_sync() still leaves a window if
something schedules the work again after it's canceled; use
disable_work_sync() instead, which permanently disables it too.

Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Use disable_work_sync() instead of cancel_work_sync(), per Guenter:
  cancel_work_sync() only drains the current instance, so anything
  that calls schedule_work() again afterward would still requeue it.
  disable_work_sync() permanently disables the work item too.

 drivers/hwmon/gpio-fan.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..28cfd50aa859 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -81,9 +81,16 @@ static ssize_t fan1_alarm_show(struct device *dev,
 
 static DEVICE_ATTR_RO(fan1_alarm);
 
+static void gpio_fan_cancel_alarm_work(void *data)
+{
+	struct gpio_fan_data *fan_data = data;
+
+	disable_work_sync(&fan_data->alarm_work);
+}
+
 static int fan_alarm_init(struct gpio_fan_data *fan_data)
 {
-	int alarm_irq;
+	int alarm_irq, err;
 	struct device *dev = fan_data->dev;
 
 	/*
@@ -95,6 +102,17 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
 		return 0;
 
 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
+
+	/*
+	 * Register before devm_request_irq() below: LIFO teardown must free
+	 * the IRQ (stopping new schedule_work() calls) before this cancels
+	 * whatever alarm_work is already queued or running.
+	 */
+	err = devm_add_action_or_reset(dev, gpio_fan_cancel_alarm_work,
+					fan_data);
+	if (err)
+		return err;
+
 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
 	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
 				IRQF_SHARED, "GPIO fan alarm", fan_data);
-- 
2.25.1


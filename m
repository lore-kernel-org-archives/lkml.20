Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213875;
	b=Pvh3w0gnQxG8KCE7AOekjMqa/kI46E6OVU+ov5vkrIHKsQFXqmCFJWTt23Lw4woFivUH
	 5JXsd61+cf23T7UTBowG29AiXzLaLZAKBVE923NI//C6IogZgaRn4mpqQgRdOaTJDYR/C
	 3d5kVwLES2R+bN2YhIc2+qC6sx4S8xbgXWHgs5FvPWC2ZCI/ekQPiFXzrxb6e+jKI65sM
	 2s4ngA2C6F+enjkCu4uJmMp9eH76w3OSTHZaPCRDU7tCyKp3qg5DK803z1Y9em3ufgbBC
	 knsLw2/QI1soWKuIlADm0j0lk/z0zWbZt4Xc7C+E48yIPaJ8KVZxPCzqryACw4pTuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2t//9uJx4ZB6YPMhb8XACeHYVkuv35YUrcSuSX+JzC8=;
	b=dEZqmkomtvxPgzj+lxZemHPPLhiWyTqOqo/fiNQROgLraEb4h4APxqK0XzM5Vx/JdcsU
	 p3gCtrraVQXddTOcERIX6XLp61wMbCJSyXn4+StJ0ZbLzF9bkdWj3i2m+tixIqkkMSzAA
	 Kj+pYADaRJ4bXtpN6wzcvXk8hipLOJi39yOZSxwa3Ac1v6tOYyHO5VbtIIh7wGS1msqqd
	 niP2HcQdicGQMk+rRmkyjQXysp73cYaqLtrloW/PLnBF883Is61KdnJsNqKWDx2uM40BC
	 R9FmHrCD16AXsoop7Z8JSkGNwn4YIJGS3hLoWI417PE5ipb4p5EmAqeKxBVJMoEXvAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bm0G1mlB;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4342606EE8B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4342606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bm0G1mlB
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso183294a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213874; x=1794818674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2t//9uJx4ZB6YPMhb8XACeHYVkuv35YUrcSuSX+JzC8=;
        b=Bm0G1mlBg36VOlOKbaYtfvd7iz02XxXqEqyu3Yu3B0ZwafhpkmREZyzSIhQzXTMAyj
         H0bvBX+5pXaS350DSa5D9S/ESPF34LYyUWYSPPOWK2foyW/e8ckSvao9odPEB3S/BiJz
         gWxL4Bc+vP8DmSNBuDj5ckTDkLsCX5/4xYbzNY/IRybLyYMCVon/8fQVRRZ6vWrlODtP
         x1bdQVfsSuo7A6leT8sQsGOEOYp+DWByFkqgRNB6XkznZwClvjFWoym6/2IAODONtI7U
         W8nMCgzaW8AERLPQAAAx5h9KPPeXfaR2Hp67Bs9S22684hEKAIIuynvvYb8fdcfbNNtn
         TA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213874; x=1794818674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2t//9uJx4ZB6YPMhb8XACeHYVkuv35YUrcSuSX+JzC8=;
        b=ODa2rah2UycKZSXIJJXM9ws7Y1EJVL8sDgYFOdKNZXgEGnMFLrwsG+ICpezf6yFCmT
         sNGc4zm8O5QgaFqVOMqF9VeP+n7TQ4xVnOD+rk31HndBUsAKs72O8zi9tuzIT32FOxcJ
         ygcFe0Jbc6r3plpqznniwWH/h7iXBeXOuo7JeJpwrwiCqfc9b4sqNGmJDIlxqmNb0Z6p
         qTye+Zs/oGW+E/gr91o9oilKHyYImnwceXB2b7lnY37sHg26q5lweJKDwfH9OE9/xLs4
         aVLVvd4488JvtUe5+Ik52U4exRBEU5JC9gQCdkZbpIma3btkmMGuKKjh32JYDqiZEQbS
         2CQg==
X-Forwarded-Encrypted: i=1; AL+hErE8y/ofw0swB2xxnorR+QAFAeHiid80WYS8QZX3t5MGcF7xyWCJ1Y0bwL4RN0F/kOADz8VJTNqSwrb0JXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gGsbwAzKEdugoPqo0f3YNkn2A5ZJ4ZW2nM+s/CrlhMgiBIMpG
	l+fkEo3rc6NB0umA/4fgzjo/MFoyPWgvipLMOF8ErGtZqBYDFhHHGHgh
X-Gm-Gg: AYBFou3UAHoT9hN7fOP9Ik9We/krmSpwOUe2l4GU+qdSzteg+eYbeBiC8AOYy1/eQqD
	fE9vi1dGk1PuBqFbXpal03AhTXzptgwYZkZ3AzhiPHWw/Xsk24qtbIHGJmRZXYiVZHcWiqy7YIq
	vmggD25G+NAmApaaASkYhzziRRmLsOW0nyIzZ5xQsZywx8biRIefY3lAqOcJb3gDzD8Sukal75w
	6QI80qBfm7e+xBPNBoJ6gPrdFxhLqISttqWjwk/c4jghJBGI0KnI7O1PlKZybDEXHprDN65eZnx
	rUDETdeQSGX4fVXNlfihjqFxQtyX2id2ALgW+mN0155zRTFxjweHrsGdQrsCw4OXgvFAZGQfJpQ
	mNq8AK0pS1N+RlhrALKCgVAwJuQt1CpePtrMCFvRjFIcUrSVvnLaoFFom/+bQ/RsthHuCjZ9Vwt
	MSmOkzXNdfWqLPx6BEMErsX1mooVQTZkWj4RUHb7QjN39X9mJ64nNbiITf8qHyw8Gsv8epNXyb6
	9r7rYdv6Hi5Mv1oZW0PTOtgrjGWi2aNq9RWpUvwKCRTkBvq2bToT4vLDRAiz+rW4j7bdN4nvpY2
	nQTfpGWTiqUEGkHzv6aDPDxWXnL1V2HMXoMU5oWhS8a2LXht5Qi99ICmwaFrbxdRpjQ1Jz4YvMH
	4ft6fl0AEJC079mJtIytCiRHvTEgfKBy8laYbLWjGIBcj
X-Received: by 2002:a05:6a20:e212:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3eed408b25bmr3360834637.42.1794213874193;
        Mon, 09 Nov 2026 00:44:34 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb96816fc6sm1413751a12.5.2026.11.09.00.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:44:33 -0800 (PST)
From: phucduc.bui@gmail.com
To: wbg@kernel.org,
	andriy.shevchenko@intel.com,
	David Lechner <david@lechnology.com>
Cc: andy@kernel.org,
	dlechner@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m32285159@gmail.com,
	nuno.sa@analog.com,
	phucduc.bui@gmail.com,
	sozdayvek@gmail.com
Subject: [PATCH v4 1/2] counter: ti-eqep: Fix runtime PM leak on probe failure
Date: Mon,  9 Nov 2026 15:43:41 +0700
Message-ID: <20261109084342.51865-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109084342.51865-1-phucduc.bui@gmail.com>
References: <20261109084342.51865-1-phucduc.bui@gmail.com>
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

From: Stepan Ionichev <sozdayvek@gmail.com>

ti_eqep_probe() enables runtime PM and takes a usage reference manually,
then returns directly via dev_err_probe() if devm_clk_get_enabled()
fails, leaking both.

Manual cleanup via goto would mix managed and unmanaged resources,
which leads to the wrong release order. Instead, use
devm_pm_runtime_enable() and pm_runtime_resume_and_get() with a devm
action for the put, so every probe error path unwinds in the correct
reverse order. As a side effect, a runtime resume failure now aborts
the probe instead of being ignored.

ti_eqep_remove() no longer needs to touch runtime PM. While at it,
report counter_add() failures with dev_err_probe().

Fixes: f213729f6796 ("counter: new TI eQEP driver")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
[phuc: reworded commit message]
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

v4:
 - Reword commit message of patch as suggested by Andy

 drivers/counter/ti-eqep.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
index 0dda3f2b14c7..2326515d5585 100644
--- a/drivers/counter/ti-eqep.c
+++ b/drivers/counter/ti-eqep.c
@@ -491,6 +491,11 @@ static const struct regmap_config ti_eqep_regmap16_config = {
 	.max_register = QCPRDLAT,
 };
 
+static void ti_eqep_pm_put(void *dev)
+{
+	pm_runtime_put_sync(dev);
+}
+
 static int ti_eqep_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -543,19 +548,25 @@ static int ti_eqep_probe(struct platform_device *pdev)
 	 * parent PWMSS bus driver. On AM17xx, this comes from the PSC power
 	 * domain.
 	 */
-	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
+	err = devm_pm_runtime_enable(dev);
+	if (err)
+		return err;
+
+	err = pm_runtime_resume_and_get(dev);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(dev, ti_eqep_pm_put, dev);
+	if (err)
+		return err;
 
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable clock\n");
 
 	err = counter_add(counter);
-	if (err < 0) {
-		pm_runtime_put_sync(dev);
-		pm_runtime_disable(dev);
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to add counter\n");
 
 	return 0;
 }
@@ -563,11 +574,8 @@ static int ti_eqep_probe(struct platform_device *pdev)
 static void ti_eqep_remove(struct platform_device *pdev)
 {
 	struct counter_device *counter = platform_get_drvdata(pdev);
-	struct device *dev = &pdev->dev;
 
 	counter_unregister(counter);
-	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
 }
 
 static const struct of_device_id ti_eqep_of_match[] = {
-- 
2.43.0


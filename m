Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C2F42049E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185659; cv=none; b=YfqB5UZ1h/Hahs6O4tGFFuC09/5FrI8mfjRnwKki9Hze/+e5CmmTB1HNpsQoxoSTrz8Fc1au0VnMQnjh4T044ekim9NgJswGRUVwJEo8RShLI9e3BPcMbJvphul0Bp3WdvcGx5WiliEqA+5JiH2Lk1R4rMukk/qFCw76PJCz8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185659; c=relaxed/simple;
	bh=0YvB+gKeMCEr52FU8yTn+OnBKkONI3/GywzbBevpz1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSXlo+8oBR4A2rDHacKptrg27+GAfiXJo3UJaWOfMg93l75Va8Pc00pJTSQcDmyMVkiLcWyuCR8zApD0oCaJ0eG8PfYggv4syXW3dVpdooJhYN5Xzfm9rbW14cSKHoF9mtZRigflco7NS019FQ7HI1pYhKJwbkEF5/VwosCUb7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PfSyPLXS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PfSyPLXS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso777293a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185655; x=1790790455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EyUYM067KGG+izocu2dLZC94FMAj+PnJ7z88RiTQs0=;
        b=PfSyPLXS0Z+lI2CM4fLhhiYK2nTqq1nLGWAipuVBh8oDa78h4+qkf4i2SfYnTxiIwK
         yFjyf6eETab1wVYQm5QtpUZRzK9DHG90NVjmct45J82t4alePvssUZ4JleXYtcTMyHsp
         qC09HR1Fz9oVVhXnUmFU5KIZ5ooom08IPRcZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185655; x=1790790455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6EyUYM067KGG+izocu2dLZC94FMAj+PnJ7z88RiTQs0=;
        b=Uwr/qp4w/Z6+7ytwbCCH3a+ghplthO1a1e3j7TRSYv5elZRp4CyQ8Y16KzpYjTiJPH
         oV9Z8tJkeT/uQ2iHlYjvjcZaiJef5Kf9pKkG7TrAPp0QvoYazl3Ysm/LaNx/qcx1rCvu
         6jjrBcP1+NAe+IpYEqToX8P6Em2T7DosWd11+r3NSBTlZVTZAUiaQgbtZRwC4Y+mIy2V
         0e/a8B+K/Bqd6sJrZ8zdIY0HbqVener+5aDyoThhg0josp00lZgJFPU0XuWtX8fZpHy4
         kP8LBEfMpX+lOT87vY4S2avQ67LQNarUjw1PolrddIfDs26PrOdLrio+/EtRMLEXsha9
         N/og==
X-Forwarded-Encrypted: i=1; AKwUvBwtfAzs3M1orHV+LnO+6zt5KrnWiwX2UiT1WK4ukV25qz/L/WB6A2eVeOiKTxe1txtpwPuz+ZEI3SqS+E4=@vger.kernel.org
X-Gm-Message-State: AFuF++nh2WNy3C9hMu4MY9OQzWxofxmGNfl86s3SnDwv+vritRnQ0vRN
	2GRskFqOHN8O/4wfZKUZhwM8Cnd7fXQ7xIRdHvjIlVEsxat6sqVYThuMnk2J5rOGjA==
X-Gm-Gg: AYBFou2g4v2jspfFYyOZvmW8Y75fiwcBMrnO9Kh2EY+fnCXxtK89NeZnYBPmtlCidAF
	CMaZgvuXUOKHrcEnby2/FhOsKq6wzV/vwLEfLuVPTQCnUj3ND0hcRrr6YCL8PvPGVZMwVrQGeFH
	5UI0oob1tw0/IsCeIth+Vhfr50NS+dODu4f/j026e1Yd4nggCAmU/EJWng6HIDpdBth+yUlG6kH
	zNaDzW/Wjcheq9F5Tg9g5di2hiO6vjuSp4rO0rWf12cR1+CVmlED2j7YZbvrMSQuC3ooaIZgW89
	F20kSdgu1j/6mYn6Gy7ptDdGdnbxjF5sYT6hFVzP1TECvurwf1brPEAD4MB22iqPSe/v88QcDYb
	uue4ateIZ+6xXFtzaxeNOoM+j4x8GHJYklbdLKVml6wuPdIMhAREgwiRXyb854IPW4x6i4tNfS/
	gRsRkB1UuDbBS+F9xBmQRyXKfIrxTqQVifkXAeJCclMOxhnzY36yJQKcdQekkmDXvzz4o7RK01l
	Of3k9ZIt0gxL8ff30h5q8QxIFRrueP8jun6Vg==
X-Received: by 2002:a17:90b:258b:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-3a07e54e52fmr3089413a91.13.1790185655638;
        Wed, 23 Sep 2026 10:47:35 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a09773d402sm137703a91.16.2026.09.23.10.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:35 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/8] PM: runtime: More kerneldoc formatting
Date: Wed, 23 Sep 2026 10:40:26 -0700
Message-ID: <20260923104031.v2.2.Ia1cae8a40a24662df11553c225f4438eab65b7db@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In taking another pass at these docs, I found some more inconsistencies.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * New in v2

 drivers/base/power/runtime.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 7e75f6d5df07..dce7b6ff7e9d 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1255,7 +1255,7 @@ static int pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
 
 /**
  * pm_runtime_get_if_active - Bump up runtime PM usage counter if the device is
- *			      in active state
+ * in active state.
  * @dev: Target device.
  *
  * Increment the runtime PM usage counter of @dev if its runtime PM status is
@@ -1635,10 +1635,10 @@ static void pm_runtime_disable_action(void *data)
 /**
  * devm_pm_runtime_enable - devres-enabled version of pm_runtime_enable.
  *
+ * @dev: Device to handle.
+ *
  * NOTE: this will also handle calling pm_runtime_dont_use_autosuspend() for
  * you at driver exit time if needed.
- *
- * @dev: Device to handle.
  */
 int devm_pm_runtime_enable(struct device *dev)
 {
-- 
2.56.0.rc1.310.g51773c2048-goog


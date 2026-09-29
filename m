Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131A15581F9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707665; cv=none; b=VTndgHR8svuNLBRKP30zRM/1EvcN6or1u930ktiRaCtZWToBKnT7bWs6kP/tz0sCNMvfvJojkoB8z3dvzeCmL4T7gnrQa9URtdwx3ihzj7+uEtS1GS9PL0fE57jHECmTRYIeOIBqD4ykF8XSgY+ab34+u0gNJCB0FTViK05pufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707665; c=relaxed/simple;
	bh=z0Pi4B22PzS1+uUdLqH1RmbsVdNDUkFA8bOOdspYgEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/NLcF/67TDVfALh8VQeBPCPF4vL4R+1hP1yrcQg+dOX/NJcHx2I2p3PTs/lP+z94rbhrOLZTF0dvJFWljEd6ZzjlaRPhcoDnjKJbK3s/TalxBJsmx0FvT+epnA86mT/58igSmCDnH+mBQfS7E0ZmYkUTOEOHHBW7I1kVxRyQwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UBxzsfp8; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UBxzsfp8"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144ecebb6cbso1609771c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790707663; x=1791312463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ts6qeE54OHwqDLqAUGkkPdOGcZpkcyC3qTl3pMkR4w0=;
        b=UBxzsfp8ps2a0aXQA8mWsMO5cIsDUluKTn2UkTLs18jaGQndy3+aAd5TIxaK0GAeQ7
         /1FlqfDo/6Ev8kYxpQ+FepqrS/LAN6u3U+KzkTq196cjn1yZb/O5FtlyVCHt7ZGkRmEr
         3Km38AdRgt18mAk1JyTQ/RF/p3IYjlgtBK004=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707663; x=1791312463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ts6qeE54OHwqDLqAUGkkPdOGcZpkcyC3qTl3pMkR4w0=;
        b=wSQ0yHBJ7XG19HJOLmrEnDNAJaEruognttpHp3qJok00BBai8uNS8BhzGqTV/PIgAO
         nHg2gfdBrEcmFr0omeMXvZieM+OBEZkaIQS9hQ7s+lZ7GGySxV9uuCGbu4bd30PyvpHD
         4GL1oIWaVL23cbkCcTeVf3lNQZyO+Iqch7o6U2XH6OPtChBTkLOed7b3ypcsiyvYl8Rm
         p4WmQCzGxhgkN1WSyN1ws1dT30nB6Kgf1LKjSim1oRb7EwvZxGmej/wzuspPJ2t30dsa
         9NelPMgfPdFIaAehBc54ZBgPcs6lVrfbfY/ST9D3SgZkKNqNwm7v3OBnz5wzZGNbwrUS
         Alxg==
X-Forwarded-Encrypted: i=1; AKwUvBxSkaF9+ml2zw7jLcrh0LV9YJOu0GQvjQhzR7J814KZN3p7GQjQAoTsJg2qQap+b9We33jQZuL8k+pWEbk=@vger.kernel.org
X-Gm-Message-State: AFuF++mspe6LAHaUdTDRC+H0ukxnTB+PmZP+1Q7sBrp6TmpUN+6ZRuaL
	1U2uA5PRL9wCYGwQImvSQSnEeIJZOOCPZEXDOgD+oALeGpvTCoa/vpa6TKyR46qeyQ==
X-Gm-Gg: AYBFou1EaE7/zEzuk2T4Zj96nCvTy3QtdBX2ePpEYb+MIIeECsiRlF76VNZa+wgPSj7
	yhm3fH3kHMVfzcevCrlB7tt/QbjROb5nP9oOr0lhvfXMF3SmJYiK6QAwxml17vNuuZU3YlIoK2L
	f5cmUrNwcB1neR8NmF33IrAIrVSdZF/lQUbKaMinvxD+tZouu9LGG9a4aeaJFFUz1DXKRwxwtTX
	D1tQFMDwq29ThsA5DtHXRsJJZ1TjZf/2ZLzx4cyYWH7HfQ5T2ZxWnZyq1yyG8Nsdp2myYUf40GU
	AQq/Ki66/xqTrZ0HPlaMha9rbx6CiMtRt1m1jKChsUHDl8HBZ5STDQPnCt6wrbidbnWmNe7CLm/
	rdAqDkJzU45cppwDWqtLhknmkucj/gkDzuASHOooqKTvoFpoC17ecONJvl5w+ZZPfbmtxSXvw3D
	djvglK0mtHnt5jj/ZWSOUMU9cvUJJd83veX/VjOVfLqNk3NncuG5JKJrzISLQ1PO0YcInERF6Hq
	97EVJx5XgdjyrYTsTBCDtOR39D3EE86/SJD
X-Received: by 2002:a05:7022:2588:b0:143:2974:bb05 with SMTP id a92af1059eb24-14c9e0ad25fmr123939c88.31.1790707662973;
        Tue, 29 Sep 2026 11:47:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14c640bcb24sm833020c88.12.2026.09.29.11.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 11:47:42 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-pm@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/5] PM: runtime: Cancel pending only during non-transient suspend failure
Date: Tue, 29 Sep 2026 11:47:11 -0700
Message-ID: <20260929114714.1.Ibec91ccb2c418f97b240cbbab606b0451e3febc9@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260929184729.2346769-1-briannorris@chromium.org>
References: <20260929184729.2346769-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If runtime_suspend() fails for transient reasons (EBUSY, EAGAIN), we
intend to allow retrying suspend in many cases. However, on the failure
path we unconditionally cancel any pending timers, which means a suspend
timer scheduled while the callback was running (e.g., via
pm_schedule_suspend()) may be prematurely aborted.

This seems to have inadvertently changed with commit 72263869656d ("PM:
runtime: Unify error handling during suspend and resume"), where the
error-handling logic in rpm_suspend() was subtly changed.

Fixes: 72263869656d ("PM: runtime: Unify error handling during suspend and resume")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index bb008dfe85a1..bc5905ffc45f 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -749,8 +749,10 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	dev->power.deferred_resume = false;
 	wake_up_all(&dev->power.wait_queue);
 
-	if (retval != -EAGAIN && retval != -EBUSY)
+	if (retval != -EAGAIN && retval != -EBUSY) {
 		dev->power.runtime_error = retval;
+		pm_runtime_cancel_pending(dev);
+	}
 
 	/*
 	 * On transient errors, if the callback routine failed an autosuspend,
@@ -762,8 +764,6 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	    pm_runtime_autosuspend_expiration(dev) != 0)
 		goto repeat;
 
-	pm_runtime_cancel_pending(dev);
-
 	goto out;
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


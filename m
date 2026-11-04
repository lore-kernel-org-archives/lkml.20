Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801266;
	b=xseK/vFk8XFnNMrJXQq/N67+2laGSiW2ZE00rydC6obROv14OINbvTeQ7QvOeRw2vkVJ
	 cxS/en4JvkGuMnEvVQJhhGEGwLg8kJ4MpZ/Kfofyg5a2/zBA1aQTlA53R2+XIyBCO6vh0
	 decRECHuf1uX7MO+5jM372XdyE9n/OkHvkqcqVLLdTbnbjXEi9ZR0ODEAMZcjIa8XJHA7
	 ml5jwEY4sknOABx0bwt+LO5kCpYbAoB2aA4qqMLrJ8t2fZJ1kPrLgrBGvE+WcsCge6W/S
	 fL3inVPYjyCpXXNJaauZvPN701aAakYuhiE94F9SiQyxWqI98oAYfbgtQXNr09Adcxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cq1h4+ONwtAezyaksz2FMWNnWoV6ehnNK390tiSgqPg=;
	b=tsaCSktwO97qPKi9poivPr/bW89+9B8PiYptgPvf/gmhHaBa12afjACHuxVmLgzA4hgO
	 3kUFWv+gy5irxgafNgnieORxlPEhEp6LHqoUMTmjdxuskfyBvNiAJsOTiRWWEmzchvrza
	 yNgic1/TDROSYFH5L/xMNjLz5m6BYMbKNIbxW1QwzUqe+8S+H1cqJ6OAquTylxWgVqAur
	 OwFWJQ0dW2dP71mLVKMlHc1b8Bp40ln61UiHkxa63/ItkOLHL8y7ajUvD95DEvXgTIVic
	 5eXl2r5O8M9ngs7HKbDNr8W4OFMwKXR37Iuw6FTGL5sXBWuXRmsUQGF2skYcZFR22Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQVHLjUU;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8C8606D81B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8C8606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQVHLjUU
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so71573a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801265; x=1794406065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cq1h4+ONwtAezyaksz2FMWNnWoV6ehnNK390tiSgqPg=;
        b=aQVHLjUUvc+RTbCC5A3JUXiBiwuj89jDNl7XoUtPmDn0jR3QO+CGYfAWxmx33xC6lT
         SkHRx5GXN/ZiWqr/kOLtlLKWp/STozQ7taoj2mLpipxq8M76pGQgaF8Piq7S7+hl/wfB
         g0aq3MbYxKSXLb0t0Uh1QfVXEgOVMipz9FYfkfc2V6bgPQC3qZgbX7lUk/8IC/5M9Gma
         lW3ILBx9Aju2wfopx5UYuTXERTto9gc7pRptfiMccEGHrj3AxBEZrq7GTe1d3spvpk/m
         vkr9web93IX+gdgc4gxXbEzV7zfmYVYeuDiCjOk0FqIr1V51EVDohrdYbBUsaH6EbCkF
         VShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801265; x=1794406065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cq1h4+ONwtAezyaksz2FMWNnWoV6ehnNK390tiSgqPg=;
        b=ZqUDX1WecPPlm1YEjn7gCCnYlyBIkx86cynGLvg4WRiKuIuUFV9U27wocgr7p6GS34
         3n/lwOnDjI2ZHl3UmQ5LXVIwTqdAPkLBBjA/k4D9laK8EAoNK1NVweqA4AmoAd776E74
         ZdWs+AjRGxCU8o5cfR+D1ERWDAxqvTLvirWh6+O/LsvArHRZIYAJrzc0A/E8PKl8jh7f
         Mn8uwxSk9FpGoMVtAcdC+ZGjW01CXVPxtwieSCG2mSbbMfL2LxAkPLlenTPnKwyf1foK
         E0SY80vV1WFLcNIFWJ41jHQdv0khQ1hLNWjwPEaW4aX4ZqFvYoNQCzmAxbSndmvFF55k
         EQIA==
X-Forwarded-Encrypted: i=1; AKwUvBz4dbC3BpiWQkpYEU1gNpCM7rk1ou+SKCtXg/crU55FUbCHDBLiM7kwqyem7ordv+Zh20y7GCfc7iErDHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ODzK7AvFnHPYzwdDO5PUDelfpi1HS5Gv/zS0iR87/BUdqZ2ER
	ayXMekGfpLD+uhKN2EbvF7uLk4uEzprDuJ/k/Yhf055+2m8N144XksLU
X-Gm-Gg: AYBFou0AQryhiiqth4TsFq5bAMYe1VrapV8dNvoXS/hmRFf/Yf7k9RsUT7qfTzw2bwi
	PU9BvRKk2vkwpTM/sz3Uxbo35csPio3pPjBHPLR/B/1rThKhwWtafs+FJKRYLyIEZlt0NhpaBH5
	Whucqv/yoHZNKniAg1jJ40f4i76d3UYwRHPPnvH+s9IV1WBRf7jWd8PNEXPEiS0lsCWPw9B5PiE
	QTLXMCcd3XGe9dUzHY5CAw6GMdGTQoDOx+yUOMy8Bc8SSeJsJWyE9ecax8+v59exh1i1CoEp9om
	0HQxlRuvKxDgTGnkJ46Mj4XqVYuaeT09xEeMdBIVMrygQGl6zQQfFP85loA2Ya+KET8oD9E8dXc
	qlUloMyqQfRs0Ux9IPWONHpNfxPz2jg49FqrvliIRj3z/kaKNtcEXluaR1rVXi0+4kt25i0tu15
	Ay0fIrZ/U78xWgVWoc8lWUKpZah2j7bcoa5N5241S+nlqs70B1KZ7J3YTJHIkSlf+unjWQamunA
	J0CvCBR4qpk7NLeulvahFQLk9Et6ub6gixriFqA8IxVxVyalSA4qPMGIK0FTW4YznrBLo79Na9N
	gSVkRiHahP/uubSnX9fHs6vc7BCjhGwc72U0UA8cGQ==
X-Received: by 2002:a17:90b:3693:b0:3b0:accf:5c65 with SMTP id 98e67ed59e1d1-3b0accf61d8mr241791a91.6.1793801265362;
        Wed, 04 Nov 2026 06:07:45 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm7379556eec.28.2026.11.04.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:07:44 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH v2] regulator: disable disable_work for good in regulator_unregister()
Date: Wed,  4 Nov 2026 22:07:22 +0800
Message-Id: <20261104140722.389859-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
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

regulator_unregister() stops rdev->disable_work with
flush_work(&dw->work), which is a no-op for a delayed_work pending on
the timer wheel: flush_work() only waits for a queued or running work
item.  A disable deferred by a consumer's regulator_disable_deferred()
therefore survives the provider's unbind, and regulator_disable_work()
fires after device_unregister() has freed the rdev, dereferencing it
via container_of().  Use-after-free.

The in-tree users are ASoC DAPM regulator widgets with a 20 ms
power-down delay (sound/soc/soc-dapm.c): the window is the entire
deferral period, not a race between adjacent instructions.

Use disable_delayed_work_sync(): it dequeues a timer-pending instance
and waits for a running callback, and keeps the work disabled so a
concurrent regulator_disable_deferred() cannot re-arm it while the
teardown proceeds.

Found by static analysis.

Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
v2: switch to disable_delayed_work_sync() (Mark Brown): also keeps the
    work disabled so nothing can re-arm it past the teardown.

v1: https://lore.kernel.org/r/20261103174911.1600930-1-lui2012qwq@gmail.com

 drivers/regulator/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..4ba0457c4747 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6300,7 +6300,7 @@ void regulator_unregister(struct regulator_dev *rdev)
 		regulator_put(rdev->supply);
 	}
 
-	flush_work(&rdev->disable_work.work);
+	disable_delayed_work_sync(&rdev->disable_work);
 
 	mutex_lock(&regulator_list_mutex);
 
-- 
2.25.1


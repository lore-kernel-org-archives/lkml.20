Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4EA47607A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987268; cv=none; b=YhvEQmSPwn6UbwcghX78w9RxwFhOfYzjrbJlGTgXyvRNToA3dnrt7dRIrp7alMr+Ht//WdxK4+UxCy/8xTdrHGjg4D2Nsk7/cC/OYaLfVFIPlDTO6utxxYJPhsYyL3ajJzliVYpjcEJ04A/ajux1cDGcmkeKxTV4q5blfDEw/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987268; c=relaxed/simple;
	bh=jV3rXd+gLIZ1kbXj0TODJowVFnqZ1XVvvGYuSJ4XS/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGwloGCco9f6RZjntVoO6WNvNlGj9WB7cRK+bdQMZl8NjTnfEmPOeRt4Nf17UwAGY2imEDATw5v4aKwJUmC3CUwwOEJbS4ixG7vijBJrS821dJ7MfSqn7bgORfBOohJdeCpj9zXqsfcsQz6D+c5vRlwh0sQM9EGfvHi+aHUrPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcTzRJ/s; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcTzRJ/s"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so2673392a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789987266; x=1790592066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71o9YI6lTkfQsxMzDOfAZ9YQ4Htmj8t9P5fvi3r60mo=;
        b=qcTzRJ/sG/fjZg3emICi7ZJQzBBdW7himeajs3KzKrcLVaX3jWO4JroIqxpcT18nEm
         xWgHjKn0zK6DFL2quh6RCtlyOq1TwvykSO5av3z91A58AZiLNvif3XRijZtluoVsPz+O
         8lMpuc0awKA7PzjU5IZSfGOwmCr+h3As30klyTOAnMyF3mlExWyIGkgaV1trrvkbrcu/
         Z2p2ZgDt3FOhjiYJE1RmIj2vaA+kJnG5Cloi//RbkHMvhUBmigjmRaoVL0FUD0Q5NIib
         +FzpN5PwAKBIwmXShjG7Dj3ahIumVMu692fJll7LQLh4fUnmnmd+mGXfxfJSa/7vqcRO
         CYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987266; x=1790592066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71o9YI6lTkfQsxMzDOfAZ9YQ4Htmj8t9P5fvi3r60mo=;
        b=0ul5s5QoynEW/Rspz9wekU5mhQ+7sHEKdLCxoE1QoFjQ9R5HMD0iT7eMsytZVb6MJ5
         F/boAJ474ZYOHfAC91QphFUV3eSkig8+7gZgbl19MqM6gTrRGy+tJNP7HH7GPiyJszqQ
         mYyDEmSUGgGJLCxpzevL7nOjzuVULN32SPoElmQjHZ/UdRapy21zBI9qujhNkORgYYDi
         7+ZVzpqdalPEYa/tRxOxMYZE+lB9W1K/BUhBvAr2aM2SOahA6YuKkLCEMK730Ee9Hxbb
         C+1DRNbn+J7SVrz7XYrcvraiBS/bBnYW3u9rVPA4UqGdMukWZteijVqE7hwU5/0RPOTp
         a3eA==
X-Forwarded-Encrypted: i=1; AKwUvBxjbfYJgpbO2y9URPgZF3sCAPpRlVHE+zkfBJOjpCgOStlOZCMjnWxx24at0aj92qFtZj6eM88KlQEJifs=@vger.kernel.org
X-Gm-Message-State: AFuF++lIuTuzogOzYy3dRpKvaJQ10A/SOXDGC7HNBbjjmV72IxK4tN69
	AfNz8XTV0CZdNO3dT24BBssac8p/FG5GGuRgrSnIJl+FtJPcjddJxFgo
X-Gm-Gg: AYBFou2kqh5B9z5jSjkGJn3s2YshIfOFuM72dFAECj4iGB/hR7So5Re4cGq/+C+b0Q9
	rpOwMEiIy5hGwyMRIGP2m8vy6WXOKJRi4fDgzYxKNE/U77KAk2wk8mTtxS2YLohEGUj7PhMhhlK
	u9i5YFvJ32d8jTjxOwAGXspLZ+h8HxXOAQdyr2L1/9G6/yBeXgu7DBWCVzyka34olGV6SoDkKoR
	2WIRjCvfASHxNhltDsI1rzqI5Wj8K5ymaLPVgP/BZ3QqYTEGllkLRGtTLRdShGuOmijS3P36bpz
	IKCrNhuZCQCwt7lTTQKFGZ1CgK7tqXM495WG6moUfARE7Mx/y3Qhvv5kk70O7AGLQgi9czXpseK
	X48u7JWiNjk0k6cJvIEwdwjvkqcGPY9QGVvJtstmOKDj/5kiWy+p5iKps9zVm5uBpLS2XH0WSGF
	AXveyJAq4x+Hmy0S2O6PYYzArumeuFqUL047+228h3sy2qDBsDpdoks8pv2c0K7Byu
X-Received: by 2002:a17:90b:57d0:b0:39e:6c69:f479 with SMTP id 98e67ed59e1d1-39e6c69f5acmr10028531a91.56.1789987266133;
        Mon, 21 Sep 2026 03:41:06 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03ab822b6sm7600102a91.5.2026.09.21.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:41:05 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
Date: Mon, 21 Sep 2026 18:40:58 +0800
Message-ID: <20260921104058.353748-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel_lpss_probe() may register an iDMA MFD child before registering
the main controller cell. If the iDMA child is registered successfully
but the subsequent mfd_add_devices() call for the main cell fails, the
probe error path returns without removing the already registered iDMA
device.

Since the normal remove callback is not called after a failed probe,
the iDMA platform device remains registered and is never released.

Call mfd_remove_devices() on the probe error path to remove any MFD
children that were successfully registered before the main cell
registration failed.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS devices")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/intel-lpss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f7145..657b1e3fb896 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -455,6 +455,7 @@ int intel_lpss_probe(struct device *dev,
 	return 0;
 
 err_remove_ltr:
+	mfd_remove_devices(dev);
 	intel_lpss_debugfs_remove(lpss);
 	intel_lpss_ltr_hide(lpss);
 	intel_lpss_unregister_clock(lpss);
-- 
2.43.0


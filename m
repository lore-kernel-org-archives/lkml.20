Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5541228D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376140; cv=none; b=Usp+2vEIQqd1XYTNcyJ42zkRlNvQnqq+DaWLhOVmnT7BBULKb2Su2Y+V4MH264jjXEHGWgTzD4iof7V7M6AUq5yU+gLEVf17l8LJamriP9Nc9Ynhaom49j6irjQJmc6Xj3TmoHkGSOEejdt0G4r3IuaINewSaRpJVvxvYQ5Y2VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376140; c=relaxed/simple;
	bh=RvwfwsibcIKVeXocpg4YyIcnyvBRCDfLjxr1o0x/eoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNUW4JeyCT6Qi71YN9uu03wCSwUL3qUQB49cAC4bIEGhFeuZUlEG6n2+zJzIfaARlcBWIMhgT60D4MCuHRReR0fG78lu4HmMlgsjYms+MurGN7THXsRS5reUVdWEUx7pjOarWFiiB0KHUBSWCzvFm93OmD+aiair3ETM9SfpzWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awJgfLgY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awJgfLgY"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1887459a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376133; x=1789980933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHO8MqohSxSNmUhoqWgAJs04LZZgNjwjhI5rapZreFA=;
        b=awJgfLgYusmxP2DeGei/AKFb0VQklQzErtugbI8dZpAJgWOewxdNsSh4xYrK6OZxCi
         NA7RyH8IjkFQjW8rM8W1zEmFN/h8n5zjex/sPsSgp7OF6cVKhfSMgqACSuUQBRNaHJcg
         Y+Cq53rvvD0Hi84Sety6F+HiCJlzTxu/nqtkt6vXMQ673V6XzSKKK8pyAjYywuRZ0mwz
         gY/GwDZGcPGWeERfIYkU7SPIGICWZbwV4+S3dzaftpU89LfA/g7fZvxxUoggZb0ys59n
         EguyZkV7OuPJILWGCoX/OYuntOitzdwh23EaJvMPrgfKY1d61n8YbrgkusgBJ2Agnm1t
         4F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376133; x=1789980933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHO8MqohSxSNmUhoqWgAJs04LZZgNjwjhI5rapZreFA=;
        b=ooq5cxA4I+0uWE2xvdkNT7jGFdeVOxxWaQSL4nnw6zC1mcC47nMt1DzEZINZAfNS/m
         j0avcF+8iLJSFDyHLyD8O31Y1nKD8Hv+k3YZwTx22fSuImeI3K5gf2TOFnqkOHWzsyAd
         tEEFrD69JWgREK4gyLkzCopra3l61HN05Zevsymb3wxdcjze3A1yWlvCW5xIg9cFdOP7
         PEGVF4BUhcSux/VEPi8+sVfD9bCN1oUCojXJS1LRR35PnPWaIcQBF2/I/E7vKUTfXZCV
         NAPNozwHo1L60FPa39vDLLZyJUprA9dk7YlTKyrYfZx38LKgsBW7M4CUubSCna5J6LUd
         mqmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv4r6TMc5uTZBsgWNDsQC4/vlMKuyNN0tDhLzThdJAcNs2/MXnV8E+KWVCGNUS2IWCSztpgJAABcfGxvA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+iRL2auOPaNMNenYnl7BStJYdNCLg52ti1/IcGu6jXfnBW1Uw
	D9K7SYm53+lHL3XA9w14Rq3mWkVl+GsXnIhi6It4pTCIXIU00EhmC3GB/sZtEcWS7fI=
X-Gm-Gg: AYBFou3cgb5jvV7ma0/EkUnqxPfUnROVwQFn6OrcoD4QVLdKilfLtwgbAOErUMF36mZ
	Fbu4XLPmIbSmHH7SP9BP2njkhRTXKpp3XC3oUtYnAKGoqaNWGgJac4OYU4FnWmCmIzZkrDb6Wpb
	T3FUN68lY/iZ2VMFkztCsug43KE7pybCdomsQQDjVvO/4ksOWcObinC1VYsSgjzErCRKIy7wcBM
	5li3NrApqDbqvgG31eRIkzYFzjnQ3L49rcBVGLbCyG3mgnikg3M2CA9sAV/+ijQs2f2zNVxxS1X
	FBr6u9tnpDVCuivzVTK7PbYfWPMfr1mk8aY95gvLtI1THgGVufYYlHXFwQemAohQqEIwwK59vVu
	WUHVnQ1VcUGGFTgj7YfBGCVvzzm+bQFU+xyKVYKKLCMYUgeI3yjQT/Ec221A0HPH8idhKEjdT3M
	9Lu7JtBUKjQgCP2gW7solf/LIXXl/yauUUuqMmjiJL+s3AXjimsNdPTA==
X-Received: by 2002:a17:90b:1dc6:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-39dec09cf6dmr3712915a91.18.1789376133103;
        Mon, 14 Sep 2026 01:55:33 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d7ff2c5sm4885197a91.2.2026.09.14.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:55:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Ed Blake <ed.blake@sondrel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: img-scb: disable autosuspend on remove
Date: Mon, 14 Sep 2026 16:55:19 +0800
Message-ID: <20260914085519.1665498-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

img_i2c_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe error path correctly undoes
this setting with pm_runtime_dont_use_autosuspend(), but the normal
remove path only disables runtime PM and leaves autosuspend enabled.

The runtime PM API requires pm_runtime_use_autosuspend() to be undone
with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
was enabled with devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call to the remove
path so that the runtime PM state is fully restored when the driver is
unbound.

This issue was found by manual code inspection.

Fixes: 93222bd9b966 ("i2c: img-scb: Add runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 88192c25c44c..9cfa403cda8e 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1415,6 +1415,7 @@ static void img_i2c_remove(struct platform_device *dev)
 	pm_runtime_disable(&dev->dev);
 	if (!pm_runtime_status_suspended(&dev->dev))
 		img_i2c_runtime_suspend(&dev->dev);
+	pm_runtime_dont_use_autosuspend(&dev->dev);
 }
 
 static int img_i2c_runtime_suspend(struct device *dev)
-- 
2.43.0


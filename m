Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6B6457E5F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153491; cv=none; b=Zps9J0hDS9HIBSXG0EZFFrt37DMP4Pxr6snBx8v2YxTDgVm1ert+8P2IoZGcS8DSPthnF9+yUcallaaoz307cN/oopyaX1goD5r3zFYE8vs2J8BZRBw3Z+VTolTH0bt5CzmuyD5zk6JBtEUQgK8a3+XDsv5v2Y4/MUgZ6XITeFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153491; c=relaxed/simple;
	bh=VC4sNe1X6iAb2yPaUjz03oMmGXuxnQ8+8LNaYTSTyIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/ymyCG0itPlaVh00uR93ON7wGENW4D0BDGp8hVcoj828cGuumFcQrHF/l/6Sixtyao1mkZiPAOG3VB+jIfK6xak13uW68KGyxM97F1zkK56irM4fBRzgmn2Qb8p0WEXQx6G0KUPYhpYdnlTqkHctaK3KtgYO6u1cAcF1HnAkBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPoJBApA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPoJBApA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e49fbf92aaso38028235ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792153489; x=1792758289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oh5sgg/8Wcm7Sy7xw+sd6a/6SFhAR+Yy8Mm3m/0UHV8=;
        b=fPoJBApAkwhxp+AoIKDo2kyrc2zH5XmPK+7BXfEvMUlmDKpMKZigpehwnr6EDhC1sG
         WqEE2T0A6D1Jks2m/UoeRDTIKtvVVmvLw0aUqj/SRtKrD7oO2dcj5rzsWp0TqC1luQ5V
         1OyYzFkXqKlIrTgffNg4q9lBlxnR/UHKjtD58IyXq6Rzr+BNejYe87C/3WCkhcf69M4/
         /9gwS8UjxmJoLlZK2yNokOb2ijLLpMGQ0msV+qmwx7opKy2+u8nSCDio88ZILRBM/WjC
         hPeDc7R9PaTbLvnSMzQPDIZtTajvjtwZ+vyeE2+6SYwZVYjTEzFKi5hCUk9XqZEYPhrN
         fJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153489; x=1792758289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh5sgg/8Wcm7Sy7xw+sd6a/6SFhAR+Yy8Mm3m/0UHV8=;
        b=Xcvev4tlcvyMUeAo7iGxfeGSGSjPZL6xIYEbfRLUb3qDoCj/7mUs9oOpd9X9/BsCGh
         jkoNLz3wHZ9nlZ15/mF2d7m2fSAXBvw7mAZQPQRPu84ghAUM/7AqZdLuK82Nnp1dKFfv
         0puIMeZoZQNs3XIK3Tp3NUWHFACJOrxxmBiFHj4TuI9+UT+2jUIzVrVcucwcXSsUTVYE
         SudhdPUCYEJpgvn5z3Ojv8rC7tLeA1EdORPsjGI4a3bMF5AE/eRoSgVAXqkocaMI7VKA
         Lc6wf+4K1yF5cw5OrngbaWotY6iXARUSZWzaKwSw+YQVsds64FfRFy+gzGCwQSj8UI9B
         Szpg==
X-Forwarded-Encrypted: i=1; AKwUvByL9BjG0MChLRXC+SYSN8I0/AmYS3HD+nR6qIgn3UyTuInzb25eA7bno+UuV8T7P1wE4z1KOncbCO1Jg5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmY5M0Qh0+hpLUW/MNO74FnwDyrLZNgTzcarCjcYXWQu7qIzjo
	L0nZ6SRRLAoKFG3PBo/AUVQKggF2Rz+djFWxmDs/W8MYYXnfkZIT3OF4
X-Gm-Gg: AYBFou2KtiJoU3/EPx8QG+JeySalbiXooPTQefGAtlpf82+N43Y+6S1JZbMCpZdJVNk
	rcegiqtjWja914jzRtvhffrUJn1BNoESUAjQFUoTCBBH93BGHC+dygNwRvO7tLcSGuGNXZAUYQP
	wreWObt50Cb36wirdZ4xRYgQVm8ohiJ310DEi6o4PLocSMokimLcms+xZg/fA0KqpyL3yaSjtsr
	kmDcuYf+o9V97Y0zl9LhekXjliBQ5rCq8KhFYkcbEnwLzDftP6wUmvQ0yAAXe/1L7BYrUrBGJwc
	ZWvbrA/MRA20x8b9/bZjp/bHa+3uP3txThQA/eYyvszZ6S9sPSRscf2CdqVKBK5gXLZ5ZGnmbuK
	z7KFJCNoouBnL97dA0oHVNR3bQQR/3L/+bAjDOKM2TJD0hsKFYmFc2LrJZVmG5Wm5i88NpB3z6B
	VpqnENFIP4MjscngWZWU0iu8jXXoftpu/DaFhnslNrTU0X0eHaIdFxo8K1y88karKtkzX167b94
	vliuMcfKA2A/Q2Tj/QK4JUd8WCgICC3gbRbHtJqDSabUFWGF6O100ij
X-Received: by 2002:a17:902:dacd:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2e8429ade93mr185433745ad.31.1792153489196;
        Fri, 16 Oct 2026 05:24:49 -0700 (PDT)
Received: from yafangs-Air ([240e:46c:5700:24f:b9fd:c639:2cdd:8b37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm9455815ad.74.2026.10.16.05.24.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 05:24:48 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH objtool/urgent] klp-build: Fix memory leak when enabling the generated livepatch fails
Date: Fri, 16 Oct 2026 20:23:14 +0800
Message-ID: <20261016122314.81476-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The klp-build generated livepatch module allocates the patch structure,
the array of objects, and the per-object arrays of functions with
kzalloc() in livepatch_mod_init().

The result of klp_enable_patch() is returned directly. It bypasses
the err_free_objs cleanup path when the call fails. As a result, all the
allocated structures leak.

Save the return value and go into the error path on failure.

The per-object arrays of functions must be freed in the shared
err_free_objs path as well. The cleanup loop in the funcs allocation
failure path is removed instead. Otherwise, it would cause a double
free when the new error path jumps into the shared cleanup.

Fixes: 59adee07b568 ("livepatch/klp-build: Add stub init code for livepatch modules")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-173837@kernel.org/
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 scripts/livepatch/init.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

---

It is based on tip's objtool/urgent branch.

diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
index 16aff8f..a1f6993 100644
--- a/scripts/livepatch/init.c
+++ b/scripts/livepatch/init.c
@@ -50,8 +50,6 @@ static int __init livepatch_mod_init(void)
 		funcs = kzalloc(sizeof(struct klp_func) * (nr_funcs + 1), GFP_KERNEL);
 		if (!funcs) {
 			ret = -ENOMEM;
-			for (int j = 0; j < i; j++)
-				kfree(objs[j].funcs);
 			goto err_free_objs;
 		}
 
@@ -78,9 +76,14 @@ static int __init livepatch_mod_init(void)
 	patch->replace = true;
 #endif
 
-	return klp_enable_patch(patch);
+	ret = klp_enable_patch(patch);
+	if (ret)
+		goto err_free_objs;
+	return 0;
 
 err_free_objs:
+	for (int i = 0; i < nr_objs; i++)
+		kfree(objs[i].funcs);
 	kfree(objs);
 err_free_patch:
 	kfree(patch);
-- 
1.8.3.1


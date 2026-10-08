Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8D7486E5A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453547; cv=none; b=ZGkUCxGdsMj98i2T/QUaifjDw8jDgRIJq7kcX9vdHBHxMFkHHYW9+7af6796qeXbRJK9w3l8JkAlSUibtWRiH9gMYlbzPfarWmR6N9fEgc5OkdFbSlTVunfXB9UcRm9DaHPvUVjTkiyffmt/nFQQLyxxxKmX7zr/AMGxXB/fiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453547; c=relaxed/simple;
	bh=GFuLkfK4lxs3mDOS7RtEdGThemMaY0j+LMNlf9wngn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4k6N5CDDfs9ODErqhKphST6psk7Vmq55LJhJjRlCXu8Z12SQEm/c30WbOHcgQdPmH3Zo2fR/PvkOsEqJ5FxFnjxmxzgvBZJKr2RtCAqMiNWJpOxmKTQec3ZO8B8LJkVglL1qNSm+1I/Y48MBn0XzXssBq/tZzvA5Rl3rdoB3nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2V9EjZu; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2V9EjZu"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a886d6ad51so2058244a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453542; x=1792058342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mt0CRA7LFCfvbN90avDkf2CrVHUWq3hqZcA+p6fqK4=;
        b=J2V9EjZuD0ujgcsZKwydM6UNtS7OgVID+uNMv9yGweab0EMIsZ4u28LzoboMOz0aoB
         oeU3ukPIiOgQ1PgDAG8Qu2EQSzicmFmcXCFlsxJUhBo/9jccR+bu8U/PfLJ6cgTlZWWM
         9huopyFuS9/Iq0jGt5J8OYhJ1+z6v8S3xKv/uy/mA99929ztxDn0HIjlaplOEGm04zXg
         eoL6BdVyE4gZjeFlrvaZrZroYl+RKlGbwFf4tX8MJjzit1mRs3Iq4QsBG5W3E9A9JxHH
         vkB/Bj+ML8BmMUBB0U1g4hOIwYri4DKcDZLTnnByqMe2nWKtFFkGBlnWIDSwfmDBlHFR
         xYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453542; x=1792058342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mt0CRA7LFCfvbN90avDkf2CrVHUWq3hqZcA+p6fqK4=;
        b=iqas1DBTLF/48Ptyp41k3jTcZzNCEWdBNIXEAhIa8sbu34n7545GRGR11HFjmoat6L
         llKoW9Lho8eyDmfqL7ROfg3JIyXhTImCZctYqWgnBs4SmORUahTqDrjGeDBz39Evi/E1
         wqQZZbZYXZZwGNkPDP243/XiHfWp5skpsm0A6Hd0BOfXN+HgeQKTyHtKH1ntbVyHFnxM
         kVyIQ/nMkwsfH3v8eOKtc3CHbo6dhIQc4qNwI55Hc/0qDYx5KQrnAaIJchYKKoXUb9GJ
         jfsVkNEt5bFH0+Rctfg8RPCYQmcVjhJWd4/5NR0x+M4d1bP+GievzlCKRd+bFTJZ0drY
         QHUA==
X-Forwarded-Encrypted: i=1; AKwUvBxRckEdEkE+Jd5J3FzKuBa8rOIRoRBgb2qcdyJpoJexIAEdJEKwG619Lsd1kONIXbjwYSLaxnwyZoFz1Eo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiKj7MP+jigDmUtxbfGpMxL0nSOYqb5j3Lb1CYic0nhslOle6A
	Vj7GpjfS531FrnkWBaFZxU63J2oNVrymV+QnIZwiHp2e6KgdrMh8vIRQ
X-Gm-Gg: AYBFou0Iw54ILusb/upykLsM6f/vl8dKRtRD4tCu4rmVVMDHq6m9MCjAMCBETTaBsq8
	s29Qp649bq3pTR9T2rfUc+dku9nX/he56doezFamSoesoyMpKrmhHD6y6DaTbGJfpPcm2VN/2aJ
	SOdyHhkOgoEplnVtYGNYnc+90hJfDSsVWijVW14cVFv6EXRLAY91cjGhE1Re6+DcZLp39BeMfoH
	fypPBUTShG2UQsVIoMvDaW7kxbFndZPbUbg6/q3e0eONoq6OuEN3gAI9hlRbmqlaKF3Sx44FTsc
	ShbSWDUj7+71pCvash+CzC3/zH8v4tiS7zaaQF95Kq8XO/Ct2dbfQ/gOWmpQR+r0uw8urP4UkaO
	S/tHMq3wdCK5Oi4h9aRQIJPQgkkKjvsXGY9cMoL3lRHd1iaDdjSeY2yFQ7G3JPICpfpClm1iars
	cFO1z7x3vPFmvXbdmDf5ShkRor2v4QP3d6+HYuzheNwxv5TsBFKkOCipteEIDDACBasKM3z0EB9
	q4G2wjTQLv15kHvIA6fqD+9+L+tt0pruNqSF3cowAwIWAgAOn2SqWsJ
X-Received: by 2002:a17:90a:d00b:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ab04f15107mr885794a91.28.1791453542004;
        Thu, 08 Oct 2026 02:59:02 -0700 (PDT)
Received: from yafangs-Air ([240e:46c:2100:3ace:b801:9432:769f:ff9d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ff13esm3422790a91.7.2026.10.08.02.58.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 02:59:01 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v11 4/9] livepatch: Call klp_init_patch_early() earlier
Date: Thu,  8 Oct 2026 17:58:25 +0800
Message-ID: <20261008095830.26308-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261008095830.26308-1-laoar.shao@gmail.com>
References: <20261008095830.26308-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Invoke klp_init_patch_early() during early initialization to avoid
mixing for_each_() and for_each_*_static() variants later in the code.

No functional change. This prepares the code for an upcoming patch.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Song Liu <song@kernel.org>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/livepatch/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 89251fafe86e..c0879b5d9dc0 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -1155,13 +1155,6 @@ int klp_enable_patch(struct klp_patch *patch)
 
 	mutex_lock(&klp_mutex);
 
-	if (!klp_is_patch_compatible(patch)) {
-		pr_err("Livepatch patch (%s) is not compatible with the already installed livepatches.\n",
-			patch->mod->name);
-		mutex_unlock(&klp_mutex);
-		return -EINVAL;
-	}
-
 	if (!try_module_get(patch->mod)) {
 		mutex_unlock(&klp_mutex);
 		return -ENODEV;
@@ -1169,6 +1162,13 @@ int klp_enable_patch(struct klp_patch *patch)
 
 	klp_init_patch_early(patch);
 
+	if (!klp_is_patch_compatible(patch)) {
+		pr_err("Livepatch patch (%s) is not compatible with the already installed livepatches.\n",
+			patch->mod->name);
+		ret = -EINVAL;
+		goto err;
+	}
+
 	ret = klp_init_patch(patch);
 	if (ret)
 		goto err;
-- 
2.52.0


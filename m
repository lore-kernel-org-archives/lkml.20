Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AD44052C6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790527489; cv=none; b=UvDrhdhNnut4L6jGSJLUUHyBfVWMKV1wuHBQXrB53B8JrjRUUpG/ZXDsnT3f8+qW7zP6PJSe0Ju3WDR9YRnhmi9pPc0sjALnwpeDzuAHTuWCJZO7JJOFzNIqjub3fAzQWt+myAlquz7crtOxvtIKQLOA5+x6XSFuJoyj4wqo57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790527489; c=relaxed/simple;
	bh=JKjwYz0G9qqAJM2eOD47jkLQ9PbSRe8LswFXgBKmJuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jv3QHXGJumIlTxo1jovyewGAFgFNORamyVQyy+YFpryVXFyggi/2m7dP8qwL1cB5IGCdmU25koAjU2Wz5ODqxEv+3RGV3xFq6EJD8xJhpUoq7A9uUO+N3uXIQTiDmlE4DQUJ+VvnyWkTRng79LJde9JSC7/upAenEAqpoWxcdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+BOGcSJ; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+BOGcSJ"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so22800361fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790527484; x=1791132284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NxJpu186+SP46KgosTgr8E7d2y7iRUk9Jv2CU5ub00=;
        b=e+BOGcSJZAwtIhjjN8SEAfPeFV2hVF5rO8ZBcWC3D5MYOKcuBoavxROq63+GjrPvd/
         ODC/Aa2iSWmZ5f+v1fqawe+i3aBNOyTcW3XvMeCBZd2X63zpm7WNtiF/EE7JJ/NNvDse
         eyDxUMDw5Ii67gKYhyoSjhNPeibiKs4nPrRYon0G/jr5YGO0cGC++6WMl63YaxUsEQUz
         qRFpT7oeC9pTLfammcyAGZ9DhaPw7Uo8F3c19jWjRGYLfCPrFCbNr4RoSuZOUKZhY3em
         45Koi+Bv4z2x3qAHyQ2vPjHri+7Mej4ZqlAUnrAOX0mqeP0Eb6yq21InYKX54r5sF6lk
         lAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527484; x=1791132284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NxJpu186+SP46KgosTgr8E7d2y7iRUk9Jv2CU5ub00=;
        b=i1RYgoH4dd8GIu+0DB00MDqM1kKDR+EL2NsILm5jJvmiq7L0drQ+ymnzcH1Bg0PF09
         bzBCNGc1cc8gbQu9XuGkXbCNafWPeuxxhpSLd3OsDCdwfQQSu6bkEtWdbQl+dMsBLMo+
         TfC+D4iwaDgRIVCgvigwZJBTiCQzfAkBW0Z3n8ynLEq+GtSMAnK15XvYpPPbtmnsGqSx
         ltiFlOy8RP7mK9WehqwTzL1/PDXqOe2ipx1NWF3pyehcX2UotMWnKXQhksEqvIYm9acA
         dNAKpkXM0BuU7kywjS82ygEujOOEjC3rHVKUd3O1JlhCNRyxGkpLe/1qJBPqv2Vq1rLX
         aXAw==
X-Gm-Message-State: AFq9FYInl5Wwmht1f/XmINoMs/jg4rZFMpFMZVjMLpx4f3zz4qk7pK1Z
	nis2PDPaHiQXXXBxtzVhTKYipGS9HJlEapUbakXFkpFkbMh96U6RInEI5gv0yysm
X-Gm-Gg: AYBFou39ivhB0fjYpbLPclciYqAbB3MWpEnEu9iyKEi5e/OBHdwLp+hn/EZWeCj8d5e
	flRjjucd0vAlEA6blB0OBMJuYkCoSZa5741Jy6Hm+C7eu+ydrWu0+Kb6bqi21zbr1jR503F3Cxv
	L0F9yS3ptxl5HSeuKMfCeCRkCzBVzclsSfMic64FWT7IDxW8VaXoOIsukAnLTk11VzrxTuhEykz
	dlsiMxQsuEcOFwS7ymPyDcO1EEcr8/ROOhaC6hu6w8W1GM/cqVGqDy2mwVnAsoS1tKzXVYIZE/6
	jhjYPf4NFpk05fCh0hqTUz1m5PCMEWeo9RSNlSfUP24F8yj2ValZv+EAmXI5fsSxroq0rXfDRLT
	LS8vBE5thv72D3F6Ygqjs0HasXrUfqNTQ2uxJ3vkbT6GLlZB4k3xXwL5a+btjXtMYIcKoX796KW
	CoVMXS6SdNW9ct5IutW/ye5NAxwZ5HKDjSBvxRAfYRN935iyuptqZZBw5eL2ADBNUqYGHd7av+I
	ojqLVMpCWHZ1fjL/QP9I5d44FpTXlDBte3PEkDhQ3I=
X-Received: by 2002:a05:651c:a164:b0:3a5:f041:d7c2 with SMTP id 38308e7fff4ca-3a63c0f4a16mr25583771fa.15.1790527483544;
        Sun, 27 Sep 2026 09:44:43 -0700 (PDT)
Received: from artemiipatov-ThinkPad-T14-Gen-2i.. ([185.119.0.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580b28sm22425781fa.11.2026.09.27.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:44:43 -0700 (PDT)
From: artemiispatov@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: tglx@kernel.org,
	peterz@infradead.org,
	anup@brainfault.org,
	atishp@rivosinc.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	hui.wang@canonical.com,
	artemiispatov@gmail.com
Subject: [PATCH 2/2] riscv: sbi: Accept SBI_ERR_ALREADY_AVAILABLE in sbi_hsm_hart_start
Date: Sun, 27 Sep 2026 19:44:18 +0300
Message-ID: <20260927164418.3090433-3-artemiispatov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927164418.3090433-1-artemiispatov@gmail.com>
References: <20260927164418.3090433-1-artemiispatov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artemii Patov <artemiispatov@gmail.com>

Commit 8ac00cddc1a6 ("cpu/hotplug: Skip kick stage if the AP is stuck in
SYNC_STATE_ALIVE") changes the sync-state switching in kernel/cpu.c so
that a second AP bringup is no longer aborted. For that to work on
RISC-V, sbi_hsm_hart_start() must treat SBI_ERR_ALREADY_AVAILABLE as
a successful start: HSM returns this error when the hart is already
running.

Add the SBI_ERR_ALREADY_AVAILABLE -> -EALREADY mapping to
sbi_err_map_linux_errno() and treat -EALREADY as success in
sbi_hsm_hart_start(). Otherwise the error propagates through
arch_cpuhp_kick_ap_alive() to cpuhp_kick_ap_alive(), which fails the
retry and aborts the bringup.

Signed-off-by: Artemii Patov <artemiispatov@gmail.com>
---
 arch/riscv/include/asm/sbi.h    | 2 ++
 arch/riscv/kernel/cpu_ops_sbi.c | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..25016f1a9ad0 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -664,6 +664,8 @@ static inline int sbi_err_map_linux_errno(int err)
 		return -EINVAL;
 	case SBI_ERR_BAD_RANGE:
 		return -ERANGE;
+	case SBI_ERR_ALREADY_AVAILABLE:
+		return -EALREADY;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
 	case SBI_ERR_NO_SHMEM:
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index ee6e4b5cc39e..5acca3f4f8c0 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -26,12 +26,17 @@ static struct sbi_hart_boot_data boot_data[NR_CPUS];
 static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 			      unsigned long priv)
 {
+	int err;
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START,
 			hartid, saddr, priv, 0, 0, 0);
 
-	return sbi_err_map_linux_errno(ret.error);
+	err = sbi_err_map_linux_errno(ret.error);
+	if (err == -EALREADY)
+		return 0;
+
+	return err;
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.43.0


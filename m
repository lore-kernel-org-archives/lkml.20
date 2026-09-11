Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4306B4BEE3A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163961; cv=none; b=AYLlu4Yu/vFtH5N1fQEC16G3eqqCv46ArN24QDaECjkDw1SZ/YgI0CQKE+Lr6WhhNMMS4knXoutpo1g9fXbk5Afde+vmqR+WCq2k/MdXzxy7HGsHdIxEi5Pei9N8JnRzjUQ/4xrYnWZZccIub2lH3tnLgQ3FBqaHL5Cq9204zEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163961; c=relaxed/simple;
	bh=JMYRjmReUqjs0kaCd/zTtWskNw+74fFjHbV7Fsa8nRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FkWZmEh0ZV+hu84aUWwvq/rPHwWmr5ZjP1zcnYAxZdZQ+pgZdeMSFn1Jg/SofuFPMJiZ0QbxIeW7CJbJ6Bm+AxYFrIwZ+RY6FcUxH9HZzEvrz3DgwJanNRoUssJuVF6fS3knt3RpkgnLbM1cUVjj1hjRvPw8G7YCzFO00sqC0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+C3C9nN; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+C3C9nN"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so491211cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789163959; x=1789768759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LPrONMbj0bwp/GdYN4yOukwx8bvXQe9ntAGUumY47s=;
        b=l+C3C9nNxR3sxptQTNyYKzkQu4I6BNivJpM4JuA0aIIeo5FKmwvMmRXsOXOpSWd//I
         sP6kIB97WPQ/nBqR0VXKLwTQEhVlfzv8kXKydLy9q5EI4j2AHKrheItAJpk6NIRI6Rje
         KEf8p8fSsRo6BSqtsvnTtCcTuSM/4/uJGxAGv4PtiRWwP6j0NYED1sksZXzlYp6zGhHU
         wMiA0o6p0559dTQcIksPjxNvodldNi7rUhfhmcReOkytxNvLCDDLMXyTH+CRpZc77bj1
         5NH9GMZs6I+y1HOm+PZMvWD+F+wf+t9OUtmgP+5H2zLWuntMvUSUeEF0gFmr6MvMFC23
         CZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163959; x=1789768759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LPrONMbj0bwp/GdYN4yOukwx8bvXQe9ntAGUumY47s=;
        b=KnJrGvLzsZsSy4JAos8rwu0XuYi/uBeW/2N1ZVTDeevL2Z1Peapgy0PM/r1FKstSnl
         MG1v7ipNglZd5pBHgTAH4/d2mxbgy8NIAcs18F1532MB7f0cDA2w0x96AcypLKogi1Lk
         p+2Asei9zvqbX4GZdGklWEkDNIUmq03zHDtO1zMB2XnemJJFqoRCwrYWJgpL4kGR1Aqn
         otbZkvibwhpTLgxh3g7Wk9nSOimEkeZaN0v60s2miKqj/oXN8878nAiPKbzJp3MBitPy
         84r8DXvWDnAHEtPAQ5RthZU5ibeHik9haviGfGrpf2rHG3UNxG4DpX8Ag4vPbPHgtIWf
         OkfA==
X-Forwarded-Encrypted: i=1; AKwUvBwsIz7YHt8usP2epj24rnybN964+wJdYvUPAaWAvxWp3PA5g3aqzXtH1pBkCvAgChktcXR1+srdYY5Rj9E=@vger.kernel.org
X-Gm-Message-State: AFuF++lV7hCb7gP1OBMHrTNcfCT1c4VyyZKOEnHrmc8bUHxfOqvsuiNy
	s2vA8F9u4p/g+dD0y7CAcM98oxWKsnknPIiJ1NnD4kUfWNvH7VPXaohm
X-Gm-Gg: AYBFou06tUVTwgkrOMhnpSxMInkegRFwnskWou6rv11f/iSy5udzoSzsodqMH/ZZ4RJ
	NFwWJGNoC1PWHsgeR4qi8Y/Hm8oXzxM7xastbk3r1utNQPo9MMNnOv4cil0LuHeSZ6LRAsVfwhv
	/A+KdG3refLv9vaYUTBEMvttq46XHiGBC3iw1CU11IX28efXMVh5kMszJp1n/gMlLjdV1DBRQYF
	Y5gmcmTK1uNywiLUcQnztpfcSvFIsTyJRRPgwxO6JEa4RF3pBIVUoSKM9KyWBBFr4p7Xls+SBPe
	Wm51i71Yvb6g2+jRMd4ked0F60fVGPHpm4K5zHaJhUrVkk/rdR6vz6yMs+kj/a61O4LU6z0G54w
	m5WPOd6ANOcnLzrOAW6Eqkq4oZ9ns8MK4ogPGAQTUm8wXqk8LryiakorB5qnGoYOcDOwstDb39W
	URbl2rIuBN7nzoWuyf3ZyOZsI+WmlU3y2XD3Hxoc3BJpVF38clfBoao/xSY8JBxXr5fAjUC504R
	It9zvqRQQ94gmFmnPrdlRFbjBfQoeDAvsgXtBT8DQWJ5+UWWdYG1/AcUaY76aqGH2V6XbwH9fH5
	47yav6z6A5kMBWIlAiPqIqaJ8fHMePjnXuxA+BtvjWJ/j5wz+ltv7KFFPYE=
X-Received: by 2002:a05:622a:4814:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-530e7edb01emr1223561cf.21.1789163959026;
        Fri, 11 Sep 2026 14:59:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530e64da059sm2568531cf.24.2026.09.11.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:59:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH] dmaengine: bestcomm: make gen_bd init helpers static
Date: Fri, 11 Sep 2026 14:59:14 -0700
Message-ID: <20260911215914.175851-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
the PSC wrapper functions in gen_bd.c, so make them static, drop
their now-unneeded exports, and remove the corresponding header
declarations.  The reset and release variants stay exported because
sound/soc/fsl/mpc5200_dma.c calls them from a separate module.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/gen_bd.c       | 6 ++----
 include/linux/fsl/bestcomm/gen_bd.h | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..b5093f7445cb 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -81,7 +81,7 @@ struct bcom_gen_bd_priv {
 /* Task support code                                                        */
 /* ======================================================================== */
 
-struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr, int maxbufsize)
 {
@@ -108,7 +108,6 @@ bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_init);
 
 int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk)
@@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
 EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
 
 
-extern struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr)
 {
@@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);
 
 int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk)
diff --git a/include/linux/fsl/bestcomm/gen_bd.h b/include/linux/fsl/bestcomm/gen_bd.h
index aeb312a1cd00..7253d308d77a 100644
--- a/include/linux/fsl/bestcomm/gen_bd.h
+++ b/include/linux/fsl/bestcomm/gen_bd.h
@@ -16,10 +16,6 @@ struct bcom_gen_bd {
 };
 
 
-extern struct bcom_task *
-bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr, int maxbufsize);
-
 extern int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk);
 
@@ -27,10 +23,6 @@ extern void
 bcom_gen_bd_rx_release(struct bcom_task *tsk);
 
 
-extern struct bcom_task *
-bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr);
-
 extern int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk);
 
-- 
2.55.0


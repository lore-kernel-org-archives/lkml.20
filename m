Received: from mail-dy2-f26.google.com (mail-dy2-f26.google.com [74.125.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3B3E7621
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206973; cv=none; b=eFTLI4S9666EGgFkpdpBZ7sRxoir6UiR2XRrvLq4hF4CDEFL2iIGaP5d7ww0UV0bS9Lg9SQOyhhInGUiV2cgU+eBLlXkqEujHt55flKzZpImy3MX1gYULmVucJIU8tQR5B1qshW4s3FAc6ENg/oN0qKxHEYzzjGKM6tPMUheh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206973; c=relaxed/simple;
	bh=scApZ48JKByYXRUZuoAY4Adnb7ZBllREjmuuQPO8t9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stpRPjdt1JKwoxuAh7F96JKpewzA1tHsyeUEZNEDxppBpQ6q23j5HgJgGMpeCH+Br6kqvPExTvfi5l3TQ85VfZDLH1Yki+Rl738mUZKlUTfZo2q2MLOA8y/E2t+33+mV0qFrJtFF8fqmhNgUyqAMxDByVTpBYDQFavco1CPYWJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKPc4Dzk; arc=none smtp.client-ip=74.125.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKPc4Dzk"
Received: by mail-dy2-f26.google.com with SMTP id 5a478bee46e88-33175556ebbso883001eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206971; x=1790811771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slUIx4ec0Cimq2PSOCuDVhE9ZpRT6hWAlORZbx5Y+H0=;
        b=NKPc4DzkaKK5W5YSGERvMczCWxYJTcu7/b1Yvy9assFL9J4XysT7WqfXnuVUhBr5FC
         6Ij/i4QxDqRzqG8GjnaTmZQqZm9L0h0hRlJifr2ANXcNto4Apvh4ucp7aSkCZVfuUc4a
         ch5laCCNqHWCiRUt93jErBDCJ1NIalHRG55PnBqRtoUAqa+obcCMcf/yJlvLddL/HfWJ
         9kcLAcPlk3tnq2C+UtemLYI1dcfPIM/NShkEMxmKonQLcLmStMaiw/c16AiRatP22bLG
         sY5fnTE+MNkRYv7prKHSb5t0mfNoFrC4L54TLg7b4Cnh1mlpvYgZetQH0wppiUZLtHlc
         SPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206971; x=1790811771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slUIx4ec0Cimq2PSOCuDVhE9ZpRT6hWAlORZbx5Y+H0=;
        b=Ei3Y/6HB87E67zjF/Ie0PdQsgM5ogyR5AqDisRd76CGbrIGceVXE2kobgfUKH/ZBNQ
         P37/obuH/V30yCJ8ZKWtpYSlV9sQVS6G8lSZvqdSDzjCWzkt3fQwCau2uMGMUZE0lHAH
         OgNsHpAv/VqC7HkFsqEP+S+UYTIGTcWsinb2HSCTFm9TRPtsDV5xHWqizcRZOqHMOjyz
         z4ARt/obXwKZy0XZYCleILBmsf0U+e67JZBhGy3jYqDaMXf14txRsByx52Z7QfPq3Ngt
         mG/g3lCOuuUGRgBf+XMBo3XU0fcSYzHpRHFI4BzT5UxPryMjbKfm3/rj1l2mnXlz7TPB
         YD6w==
X-Forwarded-Encrypted: i=1; AKwUvBxPbBVsvPfba6atVqrusRWDXK2uBUgAgJSECH6SBk+uP+Fo2SfzrFUZ8EVNnF9Vef11+ANrp2ycA1pAh/M=@vger.kernel.org
X-Gm-Message-State: AFuF++kkRB4ZL3oV0m+4Ivfca7p/zyKKSsBi5sajHth0kn/KbcX3UL+7
	J8QAtC3Q9rNa1cZ38t1QK/Rgv0B5kfXzxAmdNjm7uE2xKlJV7DB/5rOu5IyF6N4w
X-Gm-Gg: AYBFou3CbjDGmLv3JXwEd9m3IzJ6A6ffvr5YTxXYR2IH6mvZ3+pAdXMwmvYIFkF6rLg
	vKuL5usYfvke00v2EHrbK2m4gtIWnuMWPdZhYtPcfKKp4+8Rn5pTn5W6X8pUcyjK0VyHqRO7zrc
	DadlTzCRo0tv3sou7M6xwA9m8+MtaibBDTtfcXxm4x1/oJiCunAJWvds63dm0y3k5hrP4/qtUbi
	YDg6lbyvO7fNQOKI9D/jVeGca32H2VkWg5UzA1O8sQtTuhuWCaIMXV63GiX5Dj5G/ponMsbJdNH
	gf8b82ECkkLJnYSJOT1fLuaxVD+WBcX/DSdbv8ipLnG+StSMugtmRUaZmhiBFk2wrpCGzA725oh
	iFgf3+CJxXtabbrvDXbQz19LlGU3kA7hsLgRhhQoqzCPzyiZZ7yKSo1oqAvdZaCEMAAdec45dNX
	3YbhY3/Za7veD24Z5A7xSe6whMxXulie7EWX2FCjaHTx7mhHk6bMeo/+9aU1AtlUK5ixMcEuO/7
	QvKDPOvmFChktzXoksKtqGJJBpU/UT+u+wz
X-Received: by 2002:a05:693c:621a:b0:33b:c69b:7074 with SMTP id 5a478bee46e88-34002be16ccmr527382eec.4.1790206970986;
        Wed, 23 Sep 2026 16:42:50 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm9088502eec.0.2026.09.23.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:49 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: ipu6: Only call the isys and psys ISRs for their own interrupts
Date: Wed, 23 Sep 2026 20:42:24 -0300
Message-ID: <20260923234224.325504-3-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234224.325504-1-calliarifelipe@gmail.com>
References: <20260923234224.325504-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu6_buttress_isr() calls the isys and psys ISRs on every buttress
interrupt, and only afterwards checks whether the interrupt was theirs.
So each isys interrupt also runs the psys ISR, and each psys interrupt
runs the isys ISR, only to have the result discarded.

Beyond the wasted work, this makes an interrupt for one device
dereference the other device's hooks. After intel_ipu6_psys is unloaded,
its adev->auxdrv_data still points into the unloaded module, and every
isys interrupt, e.g. on the next stream, calls through it. This matches
a hard lockup without a trace reported on the first stream after
unloading the psys driver. On a Samsung Galaxy Book3 Ultra,
instrumenting the ISR showed that a 60-frame capture after
"rmmod intel_ipu6_psys" would have made at least ten calls through the
stale psys hooks. The same capture made none with this change, and
captured all 60 frames.

Check the interrupt status bit before calling the ISR.

Reported-by: Mars-Wave <tmorolias@gmail.com>
Closes: https://lore.kernel.org/linux-media/20260922063507.690-1-tmorolias@gmail.com/
Fixes: ab29a2478e70 ("media: intel/ipu6: add IPU6 buttress interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 63197f746..74c191d72 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -369,11 +369,13 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 		writel(irq_status, isp->base + regs->irq_clear);
 
 		for (i = 0; i < ARRAY_SIZE(adev_irq_mask); i++) {
-			irqreturn_t r = ipu6_buttress_call_isr(adev[i]);
+			irqreturn_t r;
 
 			if (!(irq_status & adev_irq_mask[i]))
 				continue;
 
+			r = ipu6_buttress_call_isr(adev[i]);
+
 			if (r == IRQ_WAKE_THREAD) {
 				ret = IRQ_WAKE_THREAD;
 				disable_irqs |= adev_irq_mask[i];
-- 
2.55.0


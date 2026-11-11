Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364418;
	b=bqZifKMgigQqWCb+10PGiXpphKhc16iYNF7SBO8m86x0srm/Y0cdtZ3ed7F3HJetFr/t
	 7sXalQBw3cLkVpBq5mIUBHxG8iWqJ2uyBrQwkBW18FUGT9UHFmHMtmQP6SG/Oze+lW1V0
	 54eztEY70iKTzmlCgtZhPeUJawykBaarzNZvKiaAcpIwzkMDp0blWTUC/IGMmTJv7t0Vo
	 JWANk+HeGugrBtFuBmvYpzjeHGPMDR/yqVzMJQEXNmi8wU+HgEAUSJiWQcgdB79dXmGjS
	 oU6ubOoKJnn+SIGu63517PyBderj3w5YlPjVeOt8KsROheq4rZEuOixaTJqBHxuBKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
	b=PCkmX+ge+EXsrEpAPoLU4+09090AzkSDVcAVbLtmFn8gUgiOL/rQaDMD8AF9yKo2XPbq
	 hlEtFiiuzfEKIF4fB1cN9XBfItJ3yKzeiL/ris9JhABMLrI5uDG/win4hEftG2OtvbSYc
	 o1Hfw4ykhW8TEN+mueJXzwDPSAOkadhlOXaWvn24/JdpSkL5WkOeTFiR/pkuMMtWHUpwE
	 JJ8QbSWKWgg/ByOlHxW3vRONZoXene7HutavKnzXV+6oa1H7E4s4OP5wJ2qRQj1jCa70H
	 ckgyLYNvwer0gcz6cT0GDnCdNv7cZwEiQogqtqV3n0SfWid3S2Gmgd786mNJi3+h+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPU37TsB;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2094C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2094C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPU37TsB
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4d198f1a591so1559736b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364417; x=1794969217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
        b=TPU37TsBWhjAn+woivD6kvRf5j9T/wDRenHNZo/USasoDaW8ijLoHHy9339EKRiXUG
         2LxJI1zOZRwNBvFCnQFHLLc9WCbRwHW7+R/UXyodAbuThzicWhO4KqkaYKk0eke95xon
         y9/KTlLYGMu9sTFvZP/TlNmKn+X4hN3L48yMVvwKoiMDs5deNEBSGAlNjwwOvse2yGrh
         Ay/Iz47eTbEf71OdHCJCwDK70/F+oChWrqf0AVLYYjnf7j3LH9H+q9rf03xVih8BYbS0
         9uZ47C8g7DWX3YGF/fcdCHwe4Ej9IT+QWHvurwv6ebDrypk4PtDuIMtPKWeS1+gCunui
         MQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364417; x=1794969217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
        b=xfXb/k/UI9fgp7yV8QGfJGm9bJsN/dfz0CDUKzpHAsfbX/MJIftfgCmj/XQh3cZ1rp
         xSoGoyXxCN9j/FMUltBA8uPAiQb4dhVLBGm3ptj9qhNS90S4kzwlCF+BRV3Hk/Cys/VF
         sZIuxtzVX2SbuWWcX+vsAw0hjfZwnTt1y+/g41/Ci0vouqJqTDcQMH9ok9toGpNGw29F
         BsXwe4W//qMO9fvQpXEsyyzORMCvTvNBeUQIeAgyvFemdshq8DpUpy2Cum7FWzZXeH/H
         PiKihTDDHdzGaWAbz8G7yVMxJ4v1w9naLrwfJiyCTrYCsBK+UMi+HqWvg0mtSiBN4U/8
         JAPg==
X-Forwarded-Encrypted: i=1; AL+hErErKIt5u0LUwXssXxJMKCr54zH8VYqrXgOjlJw5/oRMsNBZS62cbgIpfV9sDkcZbfyNSqI5MOUwBfqfmIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AtbD3t1THtu+M4p+52fG/hfx4hEdrDLOfR4WQPPzzRtCqgXks
	oXJhBKtt2RFURdsCzSjJXpkSgLEK++BLOIEVEcc+H3JvVyhvy98ABPo3
X-Gm-Gg: AYBFou2ala2Ah7FVwaUMZE+D6TAgEUgXc7f0lQKMU+bwjITSpTeul33KG+sHQuMifkQ
	u3YWfs9bMzQR8NummC+ZS9lDxETOZP50rFy10PuyvJkHjtllPaKOTGokv08/JzjlBluQedsP/LR
	j2haJMtluXOtv+DjJn7+xg5h6NQUdTkVGBYBvzhC7hNBoCXF+qM6x+9cQ1DknqYqg0cyjqQ9Fk2
	FybIJzuXdVdvS19sB9b7XoXE6w9KabxZ5uj+cXjNAPIIeLY7vkTG0NFI7fZRwBn5l3QXSzh1Hci
	bQcr03dFy8oDUT49gjdADVqH3BFwFQI9hW5YYJze9I96cDvpQ2+mgbWLY21pOYOabnJ0Dg4DVrt
	7DKU8UlEuxAxVGDsI0sywHNaIWQJ+1hsY2syInF3POGhIgh7MH1tFSJaO3OgKVUZTxpnuLi9TRK
	tOUPaY9LJQvxrxoFPY/ANZDvytmfNUpt56x/DXoshQmpcaqWyexaW8SQtRtMXytVf9OchefEZeM
	JaaQieOTzL8f5E3TB7p0GuRfgXgwWcIKNz8WVvqgH90yCNSoOJ3P+5TEmvud8CRPaJncCO6Sn7Z
	FHJvZzqgpfaMT2zYFaROXyUoykyD98JOymIPKztBsi5mGoYZtJc49NjZCYR9c1PpVBrMeWDS8sO
	jryyjeTthW18WMoMNAhU0edGtiA4NWZPT+1B9KEaNU5Znn+M/acdxgc13u2RwJZhf30TlGmJu5V
	LPDw==
X-Received: by 2002:a05:6808:138a:b0:567:e9b5:37b6 with SMTP id 5614622812f47-56b97c1742dmr835978b6e.41.1794364416881;
        Tue, 10 Nov 2026 18:33:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm4103177b6e.11.2026.11.10.18.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:33:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] perf: arm_v7_pmu: suppress -Winitializer-overrides for perf maps
Date: Tue, 10 Nov 2026 18:33:26 -0800
Message-ID: <20261111023326.70922-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The perf_map and cache_map arrays intentionally use a range initializer
to fill all entries with HW_OP_UNSUPPORTED / CACHE_OP_UNSUPPORTED, then
override specific entries with supported event codes. This is valid C99
designated initializer behavior (last initializer wins), but Clang's
-Winitializer-overrides warns about each overridden entry.

Suppress the warning around these array definitions using the kernel's
__diag infrastructure, since the pattern is intentional and widespread
across all CPU-specific perf map variants in this file.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/perf/arm_v7_pmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index a1e438101114..9ac28c8adf80 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -146,6 +146,15 @@
 
 #define SCORPION_ITLB_MISS				0x12021
 
+/*
+ * The perf_map and cache_map arrays use range initializers to fill all
+ * entries with HW_OP_UNSUPPORTED / CACHE_OP_UNSUPPORTED, then override
+ * specific entries with supported event codes. This is valid C99 but
+ * triggers Clang's -Winitializer-overrides.
+ */
+__diag_push();
+__diag_ignore_all("-Winitializer-overrides", "");
+
 /*
  * Cortex-A8 HW events mapping
  *
@@ -530,6 +539,8 @@ static const unsigned scorpion_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
 	[C(BPU)][C(OP_WRITE)][C(RESULT_MISS)] = ARMV7_PERFCTR_PC_BRANCH_MIS_PRED,
 };
 
+__diag_pop();
+
 PMU_FORMAT_ATTR(event, "config:0-7");
 
 static struct attribute *armv7_pmu_format_attrs[] = {
-- 
2.56.0


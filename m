Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667E35A385
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970430; cv=none; b=UhdNwz2PnqsjdZTKDLSa7V1bARXXtRPqDEWWN1u8cz3lcxOIx/5GIidYp5qVrbC6hBCmA6MlZk1dDzR5Mj46AKShTgtlzNTKjk2hAXPSO7JRkjsvDbxa7Wv730bWfwNxkemA55sca6RopmI+bs9lgN5kvneIbGfS9IDTFpEovM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970430; c=relaxed/simple;
	bh=02+JiU6Y5fZuqUtj+5rjMFYK+DHyYaQSZA1fayM6koA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uzk4t2+F1tDOnBfAwwiEhHK8F4lcbm7SdPUacrpvcsDga0OqjIAqgkcK2Y/V8zgJfuV0nRLSHjha+KAK5HQa08sNZc46XC/InD7B5hNKyGUWyj9ZE1UZceU7YiNGy4uJXN5wxHPvIa/izQ450VoE6nZS4c/n41ZtY4B3/SW1G/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pi0jCTjW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pi0jCTjW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so12599445e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970426; x=1790575226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbepAso+XoZVkbrUUQwUCzv4bigxo9mSvnxXnLcpRMk=;
        b=pi0jCTjWPtiyNY3TEaUbs7q1XUHZBR+de48r96QLwr3EgjyBn5fiiQuEDbjRfAdnXz
         j2KSkszXBDrEocegPUatBgfWSvrMrJ9LtJx1o+W+ZbuTacQFccMzABxuD5PXSpJaumtB
         qjY17lj+oE92EnfIhKpHyEnx/zrelfoqWzEEHd41Yjj/xDGO1MH+4nqbRXFbWEn9jBuY
         6snL9JhAHDV7of9JJaeQVM2mcz4CUftA0G0aFQCXTBBHr33+JU/8fajzLV5fi5p4N5Um
         QxIFAmf5hY/2zlXHwFmm2i8NJkvkhV7e9aZZEtgRLOMjyp3kR89r0cO2IjOpMtqpQI9I
         x6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970426; x=1790575226;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbepAso+XoZVkbrUUQwUCzv4bigxo9mSvnxXnLcpRMk=;
        b=RlcWGVoUvYaIcOQJkX5WOtzGOIaXPwxFRRWg4ZTnLkDnreXtVYsvB+Vk9DEUTmSbQb
         hSi5UCuf8rELnTHts47it9FkXudslHwGiqjbzGudxDMOyfE/wG6B0ZISzK5E4XGUniiw
         j/t2fnvq9lyIw+thEa5vTTi6RYM2Kr/KDKcuQ5pYs5wCqNSSbXteMkQscuGu/GmC/D+i
         l08frEnOvx+2VIJsKgBh42lyMi8L1cfc+Uh9Q8gq0FYfz8NMw+RbTAsL+C4aH+QeD4Lc
         Eq76zCkoEEdSoeBLtqefsnPq5aK+J5CNBimipxocoxn9mPXNK2qrZiYWsAA+F5cnC6X7
         FUoA==
X-Forwarded-Encrypted: i=1; AKwUvBz55barqqZ94SdhGqZ3Sff8YTWF89reGUrgRwm8M9Ne/ksU1hiJpZAej3WfAugOWlzIMhvpCO2JA3vKEK0=@vger.kernel.org
X-Gm-Message-State: AFuF++ld1GkdMV7cnTIwMSFnSqurFv0QJitzMz9iBQhespkNXLAfPmZx
	K6GOUYThebj8Ki4I7BBgIG1kaAx4iAEqffGBLovKRCDg1Upav+a05bnV
X-Gm-Gg: AYBFou3OmjdXQchQ+LvE2gY/efjcuxSj7fabxmAsTFevSbY4WFtjoSSuqwPyIqRv93U
	I+n75gl82kUvCcER3mC9woq0AizfrSs1ihVzzRyG6/291SKEi/WBvKVj22sQyU2apnepVWjiKW8
	NzxfF+g80WeKfRaxT9IeQgu082OD6x0ilhlbu928a1KWazKefJ8ScRpa2fzaen7+E1I0/rel00d
	bwhDM6fKdFApf//DaGblRR6ZsNoKf2KFdvFzOj+8eq2PPPdo1idY4doCe9GDuTaAXv4/LZbONZh
	8d/BRfw3mmaK/BmP3BSihu1BuPKAIAY8UPtf+vJ28b81dI/urCcpcUMCYR/v6fI7LH83MCkkYji
	EMVYviMDnAWtne/cdiQzEDaWp+ZTIOfx/83lqsX4XTlfUMSF0w/ro1JSkCA/73InLDmu3tXWvnm
	FpEloTt45Jyx3BqzcSYufPVtMIODE32kbpO1OXzwMALHbbOnuUKeCeVW31AHAHya3H5G3Yyvd3V
	+MUMwcYyK9rqGR7tjEFhw8ll/Q8wlFpjyT3WhAC+nvSatNCoHht265gBgz2lCK8C4alDT5nHstM
	2246KGFO6EyvEce2+RlnRtGqt3zItCra327dEkeMCTVcH0aNeDCZacsGBmT0Lw+N71/68jZ8Gg=
	=
X-Received: by 2002:a05:600c:1382:b0:49d:174e:2a1e with SMTP id 5b1f17b1804b1-49fc574f42bmr125925475e9.19.1789970424498;
        Sun, 20 Sep 2026 23:00:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
Date: Mon, 21 Sep 2026 08:00:10 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-1@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

populate_cache_leaves() advances its bounds-checking index once per
cache level, but split instruction/data caches consume two entries.
CLIDR-based allocation supplies enough entries. Early allocation from
the device tree can supply fewer and expose an out-of-bounds write.

Count each written leaf and stop before a split level that does not
fit. This prepares ARM for DT-based early allocation and matches
commit 875d742cf532 ("arm64: cacheinfo: Avoid out-of-bounds write to
cacheinfo array").

Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
Cc: stable@vger.kernel.org
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-2-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

The overrun was reproduced with KASAN on QEMU virt, cortex-a15, using
a device tree whose cpu nodes carry only d-cache-size, so one leaf.
With patch 4 alone the boot reports a slab-out-of-bounds write in
populate_cache_leaves(). With this patch the boot is clean.

 arch/arm/kernel/cacheinfo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index e1469b641780..860eeb03cfe5 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -151,7 +151,7 @@ int populate_cache_leaves(unsigned int cpu)
 	unsigned int level, idx;
 	enum cache_type type;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
+	struct cacheinfo *infos = this_cpu_ci->info_list;
 	unsigned int arch = cpu_architecture();
 
 	/* CLIDR is not present before ARMv7/v7m */
@@ -159,13 +159,15 @@ int populate_cache_leaves(unsigned int cpu)
 		return -EOPNOTSUPP;
 
 	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
-	     idx < this_cpu_ci->num_leaves; idx++, level++) {
+	     idx < this_cpu_ci->num_leaves; level++) {
 		type = get_cache_type(level);
 		if (type == CACHE_TYPE_SEPARATE) {
-			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
-			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+			if (idx + 1 >= this_cpu_ci->num_leaves)
+				break;
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_DATA, level);
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_INST, level);
 		} else {
-			ci_leaf_init(this_leaf++, type, level);
+			ci_leaf_init(&infos[idx++], type, level);
 		}
 	}
 

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705174;
	b=cyFhRLjzNSGFi58zD/YpISIDkYtOKVwKdKDdlI6IDB/lQ8TGTvz+IevLUQqgPFY/cCBF
	 87yi7IheLZ3Mjy1+GXpVwf0//QFNHKji5qIqa/W2rufQb5GtZHgqxSGHVGTdTnFo+3Xne
	 hfjsoRnix3IGSNW5xrLI8IUOiWUlOvl36ufjvG5E+GNYEOwD3UQUvJe5o+v93zjie2r5W
	 BRordJ2lfShtnOTWuWGJtPb5Avv9Y5lT4wrEv2VG+vEtZ+aMZxxnnpsMWnb0SQM4L812O
	 V2zUnCpzSDvWA97lkesrR4VZL3+GCv0JnxE+JGl/yJ86UExeBaMm8pug2Te0MEfDCKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lp4wdmDdDgGfM571C6SbLFLVEe7WjqNHUjb+fXlBiiU=;
	b=w2HSgbxzVtTsN5PJWT8mIIDeJd4mRASqT8hYjycVdbZDLcRVB25dcBmSLnqGnvaq9Qbh
	 fvL+XDZEieoIA0t5hSLuL/ZvEUzAGZApPmgLGSlPTQ/RWREQaSDMCiLvfIZYZTWn1b5Ev
	 XZ6evFNB26qInXtYW03aPHwJjLK6zKyg2J6xFuEMPCi8/9aSDTHDUPJN/Utd38eiFM8Ce
	 BLEuTkpB54/K8Szf7PZSylRQlbYb5EaztmlLDzdLNNHnz+J57LuhP8GruS8NPZWKbKqAA
	 +mHd8LX7P8G6jvYNMUSu59yhYvDd0Zvbc7v1LWHgOcopAt/U5W/6AlMKLTU3RZcrjHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+KFpBAM;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD91606B12D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD91606B12D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+KFpBAM
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1667332a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793705173; x=1794309973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lp4wdmDdDgGfM571C6SbLFLVEe7WjqNHUjb+fXlBiiU=;
        b=C+KFpBAMKOCqw2e53JLxzp3NQkme956G4cYsQYDeAETGMETBjy0BcCeHa9PR24pfN3
         h1ZX1Yjkv50D18WdQgK3YiiDj1pFfDQ1j/+GVLnQ19HZ1qJwR9tTn11mMxQj5D2Kg3C5
         TuvTjrmJ3VRbZ/ZYiWREp0/ePH7x0tJAfeszospGjhTeL/bkeakchkjyaKsXZIKE/fAB
         /mApug4sbBP0PN0L2yjWg0C4OuOWGWqFCWZvcjBodgNUTDZDvpVTqz40oab4viCfog7Z
         x9MgP+oRLQAiccmXjmnin1guZYkPXBiIqsBnpr963oMhbvkw2MP0gq/o5ArVpn40jQFT
         xHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705173; x=1794309973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lp4wdmDdDgGfM571C6SbLFLVEe7WjqNHUjb+fXlBiiU=;
        b=Ggz56X6zv+hbAXaEVsDNjMDMK5ffjuyeTsAOUr27+IcPnebhjA2iGWChcWb9x6U15b
         WEvGg2YGj0G+JLHu0grTSnUZLzgnGW3fMK7EyMpJlg9lhlGX1X5phDLo2SlKS6g6H5MT
         ojoVgDo2ss2+mvO7IylHWXLMC/h+Wfa7o6Hu9k4hBYcs+s/oh4iKQPRdcYyV5rdhKxix
         gH1Fj+bd4kDOYxYG1m4vqEJVV67FTsi6V0LzPpCwIwZ6JwNbTB03v4209GZuPinnBUgT
         Q1agECOuBXrt8+n/6nHMcRE4/gVdWWtTpuj+CMCsp53R2v2b+1kHCQ2I0A8kF+hG2k90
         rt5g==
X-Forwarded-Encrypted: i=1; AKwUvBzUvfhvj39lxHp5MO0eaMizb1p8ij+UY5Ml3GTygV5fVJCqfeu1LePWnySHZPFnRbgMqA8+d8y/Ddl4zcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z//8tT36GgESjjIcs6TWnAdn3l7lnu3dnTvw5Dmzd9mAXcj30Bt
	h1KboeNvk4O4C+8IILFdEROBKt6gVIw4XKylh76/T1nOfzy+BGr0aYKo
X-Gm-Gg: AYBFou292ye3iJV0WuVWudrEA/7IcvBrdJpGVAG9r7jRZcG74wuYFVcbXyAO3mt5ief
	xCZLMz+SoE/mLy1kupLItx+Ib/2+FL/MNuHcVbj5cF/65RAbgfry52tUEVmqJ3qT8CtP/G9OcSe
	kAN07SWW3KDii2h98KsBKv9g826xra4pfz4EZtrM3qrEEWXwX7JEiI00/f1kjW0L5XJ8rzpn7Ai
	MN7Hs7pU0dtoHCn63qJqPrpe/9zcNn9tcgajMOl5llLjAqcJemKl0/wI2N60y7QALsekn6g3APe
	BBNm0PGw13T0S0dSlKeeiBmOoB4gsbT+IzbE0QQxYr14zZ+99KTg+vnwsJugQQCDw/y15t9rPJb
	auhX9g5Eo8A85T3GSmglpI3+nc9ZzBWmoOPLWgL2MWbGMzCXQkfDfeDVNYienBchxne2fiIfRa5
	gEIyqMFgzxpBx7+n9Gx7WqCyaSGAZxn1+KKXa9EMo6wNahWfrmEcfDVEDeuqovLIgJzhmnDUMF3
	V7isjBeR4G4AgsQo/AYe3hkSgpY7cL9ZZXUZ4l3drldtcHALeUiZDiJ2uwjYyiG9Y+k847fv79+
	g405dkdCyvekLFuiJjiX
X-Received: by 2002:a17:90b:2e4f:b0:3ac:8897:7ba4 with SMTP id 98e67ed59e1d1-3ae8957454cmr10055518a91.5.1793705173332;
        Tue, 03 Nov 2026 03:26:13 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm4008443a91.10.2026.11.03.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:26:12 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	John Garry <john.garry@linux.dev>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [PATCH v2] perf vendor events arm64 AmpereOneX: Deprecate BPU_FLUSH_MEM_FAULT
Date: Tue,  3 Nov 2026 11:26:09 +0000
Message-ID: <20261103112609.3772250-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com>
References: <42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com>
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

AmpereOne named event 0x121 BPU_FLUSH_MEM_FAULT until
commit 10a149e4b4a9 ("perf vendor events arm64 AmpereOne: Rename
BPU_FLUSH_MEM_FAULT to GPC_FLUSH_MEM_FAULT") renamed it.  The next patch
in that series, 16438b652b46, added the AmpereOneX tables with the old
name in memory.json, so 0x121 carries two names: GPC_FLUSH_MEM_FAULT in
core-imp-def.json and BPU_FLUSH_MEM_FAULT in memory.json, and the
default perf list output shows both.  The old name has been in every
release since v6.8, so deleting it would break scripts that use it.

Mark the entry deprecated instead of deleting it, as Ian Rogers asked:
perf list then shows 0x121 once while those scripts keep working.  The
x86 tables use the same wording, and
commit eda39f98bbc5 ("perf vendor events amd: Reintroduce deprecated
Zen 5 core events") brought back deprecated AMD events for the same
reason.  The flag is only read when listing; the entry still registers
event=0x121, so perf stat -e bpu_flush_mem_fault resolves as before, and
regenerating the tables changes nothing but that flag.
perf list --deprecated still prints the name in the text output; the
JSON path does not consult the flag, so perf list -j cannot show it.
No metric expression and no other file refers to either name.

The duplicate came in because jevents checks repeated names, not event
codes, and one encoding carrying several names is legitimate, so nothing
is added for that here.  No AmpereOneX machine was available, so the
listing was not run on hardware; Ilkka Koskinen, who added both tables,
tried v1 and v2 and reports that they behave as expected, and his
Acked-by is for this variant.  The JSON edit and this changelog were
written with an LLM assistant, Hermes Agent, working from the code and
the thread; the checks above were run here.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Suggested-by: Ian Rogers <irogers@google.com>
Link: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com
Link: https://lore.kernel.org/CAP-5=fX+2eRGCHcU43sqU=gi9iKvxqyS6ipwRSnvFcap3D+QzQ@mail.gmail.com
Link: https://lore.kernel.org/42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: keep the entry and mark it deprecated instead of deleting it,
    as Ian Rogers suggested, and word both descriptions the way
    the x86 tables do.  Ilkka Koskinen Acked-by v1 and asked for it
    to be carried over to v2; the description wording was added on
    top of that, as said in this thread.
v1: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com

 .../perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
index 6c06bc928415..114f95e41e0d 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
@@ -35,9 +35,10 @@
         "ArchStdEvent": "MEM_ACCESS_CHECKED_WR"
     },
     {
-        "PublicDescription": "Flushes due to memory hazards",
+        "PublicDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT Flushes due to memory hazards",
         "EventCode": "0x121",
         "EventName": "BPU_FLUSH_MEM_FAULT",
-        "BriefDescription": "Flushes due to memory hazards"
+        "BriefDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT",
+        "Deprecated": "1"
     }
 ]

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


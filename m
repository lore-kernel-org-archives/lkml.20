Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794163131;
	b=SdFPjgApPvkJ7Vrr+OjwTvb3yXgpi5ioDpUrumXe3Os6T6n6hjsmqgXBWvwO49ayf0Ly
	 lx92VyDt2ll65L5USl1pZsffTyh6ErYCYn8h1TdTnBBpR7JDBbwITjK4X7cYRvPvSVV1S
	 8DBGQBLySP+9EfPAHHCA8CgicrbF0wI4/pVj/D/gpc+TTgqsSuVPO6jMnjwWPIN0XopYt
	 wdowez6t7jP1cBOjSyaZlg44pEeFm+RNLrlwsEM3MSEbv2AJld7+6VZBv6go8kJ8baY/e
	 afWMhljqzhTpPGctyrGmGiNWfw45L7iNuQPQVJkiwkErcupLYCE6xawG3NUq7UF9a0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794163131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/B4X/7yk4kEItQksOCxb/0SjSH6EesHie45gtXRCpSs=;
	b=J9hyU2kxuPQEri51i/NwTmFr5Tz2GvlXsuSFSi/MHcYyJFzlc72rwTb8iaEvv2yH0V4F
	 2+E4UpEe4EtOLVgNIeagS/rIYkezgVCp5Po+BpYQxBFTOAsEfYXF8Rg9Dat1vcTop3cWz
	 4JVAhbLRnaByVDKP+cV+VAlaeaK7ouSrU6GfrZLxwSuTFih6kXcr18I8ud8EGof0Kynr8
	 4wQVdPc1cJ6FzcdKkN5dOgCWchd6o1xEYqwZFvlBpbzWBcMfcSzRqctzb+hzKQFR+7op8
	 35Y5hymX3NsxtlirY/rINm0QQIyFJBqlMwkezdBufpx0G1x7wRyDGRJZUt7WzY8NysQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAEQjiHm;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB969606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB969606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAEQjiHm
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so426296c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794163130; x=1794767930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/B4X/7yk4kEItQksOCxb/0SjSH6EesHie45gtXRCpSs=;
        b=BAEQjiHmB0a914QPpoh2bd0TOlBdK1HpC/KZDK8VMMByjuDA1YtcvBKNqLxLAfqgrE
         JLhI0cfVWdX1qTkHryhVy0Uncr8y0RH9eIjMFeN6q2k1W5Get/4H2dUrZfgnaUYRancd
         o/0wgxynpCBnsJd7x4fqbLDSPBFDWCmJt+9acyRw8YJah32vaTlYS7N9ozTM6+AOUZ+v
         LYZXS2cRvIq0S/+ny8I3I+RePxwDFOiVd78oNeZp5+SwHdRQo+ULruZXE1/xRBYzIOnN
         rLduUE2g7n51P82fvMsKFeQVlYPuSugd7E4NufHB/iGREy7R6zc4W/tXy3frtEdbKAwF
         I7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794163130; x=1794767930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/B4X/7yk4kEItQksOCxb/0SjSH6EesHie45gtXRCpSs=;
        b=fAFwekpvb/Afa6n237z/oJ8O6TtSV8XjDdV1Y+Hc3wQojdpPCE2IpDOzry7RW47fNB
         mmb0TiMG/DCAXFA0cLcCbP+QSD8+YfxEkfgrQxFlnOCPhHkQNt1c2E90L12n9snIQDb/
         +/YZU3Y+xTKq7mB6/zrXlNFxE5HQa9aHgQprIJ5fkb6e397tvSz7jnHkeowNjyKBnKNg
         Cg2rbM5CBB3gQaecKQfNEMhl2Z+w9DrswLLSiKeZIB2X3SkPNdeBnjV6X9uLph6FiO2+
         le3yuGc7H0Ulwi/s1hvxW7XDbZv9eOHE0IlG0FiZ9a2Z19K88i5eIx7G0+WJaarvVKpT
         Vtvw==
X-Forwarded-Encrypted: i=1; AL+hErEJ6WHkSGUQDwpKnfLY+xKcVZdQVqT5sm9pUgZId2FcLvs2j0PsRzS6whEFo/rka4JhOzCPwy+q35/rd8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JRgav+16wSmg8LRXHUi1Vv7aDRZdfJqbqzcdnq+nyVhBGk1I6
	tdOKZgbGzCmFLNpIIdmtewf/paBdyFL9n7Rd+/k8Zv3Gi0YFbJByGK/KPywmvg==
X-Gm-Gg: AYBFou0uT29esiv1ebgBpb8B+KXwWCXgdYS3wxARrKjjw+mzJmNexst662zgQ9lJeyc
	xx9Bp+QKiFFqNPpR/X3Fp7MvM4snNO1knyuhxp1Zaa0gJu0d97N5X9/9O/5CSvYtsqPYhLgMIB2
	dLZHVW/Cc8YsV53rtMkJ1w3IHEVSCjoTIdjR4I4tFKgSutIvmkwIQiBdOZWm9VFPBU/lCitYRtL
	Z7LxIPkpKgbBaPGSV7KA71652g3MNQm6w9tH/RYexZf/qGGTfiKNpwqcsyCDpaeg4Lu/v7pF1aX
	1KwbzK4mcA7UrhVGmSoZ+ZhPOiEKNqOy648fO1aGlllYN1wJ3skaA2EX8tOYBVvYoAUrogyloaP
	PxtqPpGM+w77rB0oUVU2/AHPVdrTzLoKCDImlYBBPsQIH0PcNXYMh45UX10HO5REAKBhR5n7dGx
	1KzKS9DckjcUCWonoV0aVt0wbH2/qzEbktL/Vc4iJeSf+0gp3ozd6SynluX4A5YUec+Oc/5t2x+
	gBmoIN7h7YWZrX0Np4lL29VRzZC4UX6JsMoy8QPQ7xhjomAlM0sWsPUwi6e7SOEiZXqBFtiA40E
	zQIwujJo13Q4sr5J6roCy9zCKY7oC2cmDiJts1t0bw==
X-Received: by 2002:a05:7300:ea17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-37254d99c2dmr3974841eec.7.1794163129784;
        Sun, 08 Nov 2026 10:38:49 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372632d7d62sm10527237eec.3.2026.11.08.10.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:38:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Sun,  8 Nov 2026 18:38:46 +0000
Message-ID: <20261108183846.3804875-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Sixteen of the 28 entries in mmu.json spell PublicDescription as
"PublicDescrition"; the other 12 spell it correctly.  jevents.py reads
only the keys it asks for by name, so those 16 fields are dead.

Fixing them does not change the perf list output: every one of the 16
entries has a BriefDescription with the same text, and jevents.py drops
the long description when it equals the brief one (jevents.py:405).
Running jevents.py for arm64 before and after this change gives a
byte-identical generated string table.  This is a cleanup, not a fix for
anything a user can see.

The file becomes self-consistent again, and the field works if the brief
text is ever changed on its own.  No text, name, code or expression
changes.

Written with Hermes Agent, an LLM assistant; the tables were regenerated
with jevents.py on top of this change, perf was not rebuilt.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
index 66d83b680651..9457f9be4ecc 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
@@ -30,37 +30,37 @@
         "BriefDescription": "Data TLB translation cache hit on S2L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Data TLB translation cache hit on S2L1 walk cache entry",
+        "PublicDescription": "Data TLB translation cache hit on S2L1 walk cache entry",
         "EventCode": "0xd805",
         "EventName": "MMU_D_TRANS_CACHE_HIT_S2L1_WALK",
         "BriefDescription": "Data TLB translation cache hit on S2L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Data TLB translation cache hit on S2L0 walk cache entry",
+        "PublicDescription": "Data TLB translation cache hit on S2L0 walk cache entry",
         "EventCode": "0xd806",
         "EventName": "MMU_D_TRANS_CACHE_HIT_S2L0_WALK",
         "BriefDescription": "Data TLB translation cache hit on S2L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Data-side S1 page walk cache lookup",
+        "PublicDescription": "Data-side S1 page walk cache lookup",
         "EventCode": "0xd807",
         "EventName": "MMU_D_S1_WALK_CACHE_LOOKUP",
         "BriefDescription": "Data-side S1 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Data-side S1 page walk cache refill",
+        "PublicDescription": "Data-side S1 page walk cache refill",
         "EventCode": "0xd808",
         "EventName": "MMU_D_S1_WALK_CACHE_REFILL",
         "BriefDescription": "Data-side S1 page walk cache refill"
     },
     {
-        "PublicDescrition": "Data-side S2 page walk cache lookup",
+        "PublicDescription": "Data-side S2 page walk cache lookup",
         "EventCode": "0xd809",
         "EventName": "MMU_D_S2_WALK_CACHE_LOOKUP",
         "BriefDescription": "Data-side S2 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Data-side S2 page walk cache refill",
+        "PublicDescription": "Data-side S2 page walk cache refill",
         "EventCode": "0xd80a",
         "EventName": "MMU_D_S2_WALK_CACHE_REFILL",
         "BriefDescription": "Data-side S2 page walk cache refill"
@@ -90,61 +90,61 @@
         "BriefDescription": "Level 2 instruction translation buffer allocation"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L2 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry",
         "EventCode": "0xd901",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L2_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L1 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry",
         "EventCode": "0xd902",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L1_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L0 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry",
         "EventCode": "0xd903",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L0_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L2 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry",
         "EventCode": "0xd904",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L2_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L1 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry",
         "EventCode": "0xd905",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L1_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L0 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry",
         "EventCode": "0xd906",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L0_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction-side S1 page walk cache lookup",
+        "PublicDescription": "Instruction-side S1 page walk cache lookup",
         "EventCode": "0xd907",
         "EventName": "MMU_I_S1_WALK_CACHE_LOOKUP",
         "BriefDescription": "Instruction-side S1 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Instruction-side S1 page walk cache refill",
+        "PublicDescription": "Instruction-side S1 page walk cache refill",
         "EventCode": "0xd908",
         "EventName": "MMU_I_S1_WALK_CACHE_REFILL",
         "BriefDescription": "Instruction-side S1 page walk cache refill"
     },
     {
-        "PublicDescrition": "Instruction-side S2 page walk cache lookup",
+        "PublicDescription": "Instruction-side S2 page walk cache lookup",
         "EventCode": "0xd909",
         "EventName": "MMU_I_S2_WALK_CACHE_LOOKUP",
         "BriefDescription": "Instruction-side S2 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Instruction-side S2 page walk cache refill",
+        "PublicDescription": "Instruction-side S2 page walk cache refill",
         "EventCode": "0xd90a",
         "EventName": "MMU_I_S2_WALK_CACHE_REFILL",
         "BriefDescription": "Instruction-side S2 page walk cache refill"

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.53.0


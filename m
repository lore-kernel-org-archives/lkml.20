Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323092;
	b=K+25zDSWXkkiZhyHGmpcID17yK4Wh5q+ZxdlCXus9SBv3FVeFyV3ISmUWb9mAu8akeWR
	 cFd1JpJ9y1Be2yNo40o1BCthZy8n84O8PWixb2OGWoJOx+RfOjxJb3vfZ7C4ZY11EuXB7
	 mAiieI0WxOcPq/PoSaMul2BnYOgbyRlHF8c6v5rtV7V2PXBo4H5vlufniMfd57Fxvi7VM
	 P/DxXaf++rG5AFJhGhxoFQQQ9fFZw6s87sobM+3bBUM2+LyiS3q7ANj84pTUc9exDG5zQ
	 9K1/XR8lLW10AfIGvJxFpBMaXSBrMIqfCrQW9jOeod7mi/3reAaXnSHbeeyQ9pfNvOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9E7t2sZ9QvxPpSwYYvXGubn6m2BnFXDvGY+T7ZYguXY=;
	b=JjceAa2hjYZM4NSlZKJNJxq2rUBO0V4T6Y90kxNeNRqHnURfdlI42ksy3ZCdVxOfD3sr
	 l/qXFS7WmwP6Rasp/tkOFXEHScKgduoXuqV6FNjDD3iZQ6dPseQeKvZ6DqndRXoh0Cj2C
	 TaRCoh8zHoffO5JL2KCFetjXIreBVBC18MXG+R06WuhP+VLZLuefMx3lDkTuYtKY5jiNb
	 tVgQasTSbHWzhmSe4v3dS5JO7uGMWEJBmKa690ZzXKmxmq8yaGVXH48ySUxTx/8jWR9bv
	 KZjA27iWQFjSgISVC5nWZE1197u+b7ma9Nk+eUqoRG9HD471eimoPwFFAs/W3arFR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Kr020Ij0;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE2606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AE2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Kr020Ij0
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c1f548f87so27992336d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794323091; x=1794927891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9E7t2sZ9QvxPpSwYYvXGubn6m2BnFXDvGY+T7ZYguXY=;
        b=Kr020Ij0shQ+QjAXVtLJat02ywhVvFQ10u6HskXJrmr0I8UIpsYiX9Ud+AESp6k4PA
         152TSlcIQ2k9jLTlXYpvaG/a20MoKbFNxFifEwck2sLneEaoeAQ9q2w3zqy5XkBVwvzJ
         J2c0ia0HpWGj8kyM43NpzFmKmi1L+tkwySZGf2EpiifDyrp0yvHukguAv+bDTyEvrR/c
         jREyekZbg3WJwlkU3ugLZnG7BP1zgk+k1kuLocCy0kHwQ3cBvA049jQDUvIa6PAVy4uV
         7bCYghDzz0nYwna+8fnNDJpQ1y4/QnHh3RPN10fxzP+VyntJ58Qd1M0S8DtvScUpfGG6
         Zr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323091; x=1794927891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9E7t2sZ9QvxPpSwYYvXGubn6m2BnFXDvGY+T7ZYguXY=;
        b=JASECPTc9INGWzAD49ffz3Ujaz1nnsTtUQ309N/203nZX+8z68IdFIhN2Ksuih1yw/
         qUS/JL0wHP6BiKnDTHWaGoXF1HX26KKJslFbYCZYOK0qm5XdpeVV7UFdiAusJ0MDqe6F
         zpBMLJpIoBOGIfPPRV48aJGeoGEavmdrsp896oXx9hXfX9h7P/Oyefk//DngufW7Hn9z
         yI9ZQ+wXHREGAnWZT7cu4A+ZlsRhhWWy2hweDyL3vBapWn1weqhkG/a/xFwkG/Bi1p/4
         YCSZJa22uaK6oUduppKAJONfPQGJeX9w0QSTrXNJoXyq+4qzzTd0n7Ff4w6LSSlyT76V
         UW0g==
X-Gm-Message-State: APuU4Z9Myz9wKQi8b+9qFDrU5iTNJT/GhD5zVd3sQaHJVNCYUiiy0kph
	iYu5hoGU+o7cBy33j+ggj3JHRmMYc8OV+Tbshknfvo/96fzo9iSoV9b/jiazN4AVMfE=
X-Gm-Gg: AYBFou1DYcMU125VRBoh6BMH5o8Kcn30Zuy4NoxGyesxde4m45tOvFxKYDMiBYtWK7y
	C+eBeRzXgsebn09mTOP9bEr8NjiEq48ltoTKK7ujim3MNka3H9QJc+Xa/v9nHORtAV7BAuZBJBE
	BK+cu/b1vqOboLA1STjuEMoZm0/irq1UfwQu36AdrUp90oaXui2MBSW4y4Z1ljgQuwerSfCUPdU
	jWU+7R1MES/O3kZ8dDiBW9FzmQsR052aDHuVCWLt6k0zz8chc5+k4TDP/tv7ntOsUKXw56LaWSb
	SB2pofWzieZX0YwC36ZQ5yWwQytTUBfhTOxyloEPArrmVGrF4Lc6QuZC3mXGdesoT+a1N5uHEFb
	lXB3is1LixVNgeibKQQiJkOF7T302idXy/uc5uxtzI8JY7Zutm00e/LPdZWNVbRXYR7xYx/4V7p
	S/rG+ekGhb8WNr+UkXr+wPVtqrTa3Zfb44XbWwMPp98jVnqQS8ZJNp9s7cabVhztkq17ZI/CQTr
	VQa5eKqA56S4gvCE+5/fveAbiaeSbhONUbU9HcDEXh0XnHo1lsIhQ0CNDel/Z8cnEhR+A+UOQXU
	R+QgL42bjCDceWIaDWci5LsviIsEAwMUG2Zms2PEbW8/+KvSz9KkYyc+eF5W4SWUDfIz7hxCZ9r
	yB9c9PvIY7FfKgew=
X-Received: by 2002:a05:6214:4015:b0:91e:f4ab:4aed with SMTP id 6a1803df08f44-91ef4ab4dadmr24082126d6.48.1794323090635;
        Tue, 10 Nov 2026 07:04:50 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef031c7dasm22902406d6.1.2026.11.10.07.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:04:49 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@techsingularity.net,
	mingo@kernel.org,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	hannes@cmpxchg.org,
	osalvador@suse.de,
	raghavendra.kt@amd.com
Subject: [PATCH v5 0/7] sched/numa: stop VMA scan filters from gating promotion
Date: Tue, 10 Nov 2026 10:04:39 -0500
Message-ID: <20261110150446.2452975-1-gourry@gourry.net>
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

NUMA balancing uses hinting faults for both task placement and
memory-tier promotion. Several filters designed to avoid unproductive
socket-placement faults also prevent promotion.

When testing testing fairness controls [1] we observed unexpected
bandwidth utilization between tiers. We found that numa balancing
was completely broken - starting with a recent shmem fix [2].

No other numa controls are used on these workloads.
  - no numactl / mbind / mempolicy
  - no cpuset.mems

These fixes impact the fault-injecting side (spraying PROT_NONE),
not the fault-handling side. So mempolicy and cpuset doesn't really
come into the picture.

The core issue is that the global balancing mode says which mechanisms
are enabled, but it does not describe the intent of an individual
VMA/PTE walk (placement vs promotion).

This series plumbs the scan reasoning into the prot_none injection
while retaining the placement-scan filtering.

Testing
===
We tested on an AMD Zen5 platform with 768GB of DRAM and 256GB of CXL.

We use kernel.numa_balancing=2 in production, but there are subtle
interactions with numa_balancing=3 that are also handled by this set.

Workload: two ~430 GB databases with large (separate) shmem VMAs.

Before patch series:
  - 150-200 GB/s DRAM bandwidth
  - 40-45 GB/s CXL bandwidth, saturating the device
  - request latency above 5 ms with longer tails
  - Large portions of hot memory permanently stuck on CXL tier.

After patch series:
  - 250+ GB/s sustained DRAM bandwidth
  - approximately 5-10 GB/s sustained CXL bandwidth
  - request latency between 800 us and 2 ms
  - Hot memory now gets correctly migrated to the local node.

Stable Backporting
===
Patches 1-5 form the backportable fix set:

  1. Add promotion-only NUMA protection walks and derive private VMA
     state in the folio eligibility check.
  2. Permit eligible shared folios to be promoted to a fast tier and
     rename the promotion predicate to folio_numab_promotable().
  3. Scan mappings covered by the legacy file placement filter using
     promotion-only scans.
  4. Separate VMA placement eligibility from partial-scan continuation.
  5. Scan PID-inactive VMAs for promotion and account for placement scans
     separately.

Patches 4 and 5 are technically part of the same fix, but are separated
to make it easier to review - they must be backported together.

Patches 6-7 are independently requested cleanups.

  6. Use BIT() for the change_protection() flags.
  7. Use the VMA flag API in the touched NUMA-balancing code.

Changes in v5:
 - Patch 4: small formatting change (David)
 - Patch 4: changelog comment for sashiko east-west false positive issue

[1] https://lore.kernel.org/all/20260807202059.2620949-1-joshua.hahnjy@gmail.com/
[2] https://lore.kernel.org/all/20260629163337.1264881-1-hannes@cmpxchg.org/

Gregory Price (Meta) (7):
  mm: support promotion-only NUMA hinting scans
  mm: allow shared folios to be promoted to a fast tier
  sched/numa: scan read-only file mappings in tiering mode
  sched/numa: separate VMA placement from scan continuation
  sched/numa: scan PID-inactive VMAs for promotion
  mm: use BIT() for change_protection() flags
  mm: use VMA flag helpers in NUMA balancing

 include/linux/mm.h       |  23 +++++----
 include/linux/mm_types.h |  13 +++++
 kernel/sched/fair.c      | 100 ++++++++++++++++++++++++++++-----------
 mm/huge_memory.c         |   3 +-
 mm/internal.h            |   6 +--
 mm/memory-tiers.c        |   9 ++--
 mm/memory.c              |   2 +-
 mm/mempolicy.c           |  37 ++++++++-------
 mm/migrate.c             |  13 +++--
 mm/mprotect.c            |   7 +--
 10 files changed, 140 insertions(+), 73 deletions(-)

-- 
2.53.0-Meta


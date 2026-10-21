Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571556;
	b=38IOL22930v8gJiyesUZGAdyBXbIaLbs+hocrDIt/24v5ORANi/HgieOriq0/mxhvQ0X
	 wt/qqYBsf1RbvEtVtRR7/o+0A4ihXxyK2L9SJcbv0kUL43Va5TSTbxMYBSbV0feDaA3r5
	 6I577T30l/O5DJnpqbb599hppJRuigkSMsIiBYDyIqMDxPemsEtDZS0xwhKuN4EptzwPZ
	 iFJgAypWT5XkKj8T9A4X6IVN/pSop4G5xGhWBXfexV8uADlm+ozVv5JB4BIGlm3VSh7ww
	 laM9E47d1fwY1V5MsiJ3mISYzmNdvJlBgHBMWAwy6mTPUnjQmv0m32WtI8Y6rH67uEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
	b=pFolTtJhhT312eTr9y+dL0gP+6UPNX+nCQ0V75sO5sZLhT7/tG6S2ojfdIb8n4xFrZ/m
	 waZE2UYhkliqq6yaV37d37DI4gK2uKWMyNk/vAgE2PS9qR6vEtD1tVPhv5suEu/pQWlTg
	 0g2pV0u4mE8ivbibtG1ym3dieZlDczaorlABYRiizPT/BXbHG9JnSHxKQKyHiCP985eCa
	 shTjRoUPyEJ+IMghYqOSYyTIF2mLBXdauLTIPOcSopx7RrAU8Lidjyx5aXyEjOXspag63
	 gLz9QJfeqnILfEGp29PvqOR5nZVeJ1gQswBYYXpGCWRkdrhzJ/BaEBnFyAg96OBWXtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMLCbD70;
	arc=none smtp.remote-ip=74.125.228.1
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1001606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1001606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMLCbD70
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so54629a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571555; x=1793176355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=aMLCbD70lG2ra3PGM1SfOYbsuDFFUA58jMOpAvv25NRBiRMGxCaO9ab6VhoFgaIWBH
         n3dls44ov13VzzSkVpYwfSCmJqh18lm8IQsFBeezJ4nk98NOb1k0ZXToS0rKw19wZmIJ
         iG3eoosAGPuqmaD9NVmRPnnlmtHFFL5qz33edz2NzT+OR7BcQCkKMUbQjIzhu5SI9X1P
         Osy2vdTLQXhNQX8536/ZN5mv3zxilwkru2olvDceDOfIKqushzeVRNmq0/qDzMGj9gby
         DNO4wUJdN3HjKg/0UG07fFW42eBLVD480NA8XXjqPRSoubDv2TAoP8/fVyDLiPOjVA81
         0NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571555; x=1793176355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=TXlWZwnmzpmbA5TqSTDlHEZkNfNsS0M6bhwathYi3aNVs2bfuTxDt7+dCUJ5tbR2Zn
         DKdj1JtV7ZZH3N8gROKqh2ySqK3MBthjGmfGxPgKgUrwbURoXZlQG/EkCckOYub/zYHR
         c06P7wLLjdUskIquY33Y7rTDUbhiNBM8rE5PPdR/+iw1F+tgnJ9yOl9dM1uC/1tOIlWd
         leCZvynIdB3D0GICOwJMZkpCe4Q9LYUJxhGDkOHSLODpbohLuoXP4VQ13Ju8iMis4VWH
         RSmRC2jPvefBXLIzpMY+lNBTYBLnSRUCdwSnpErocCFTo2I83eAliorPU8u+rJZZvL7L
         BTbQ==
X-Forwarded-Encrypted: i=1; AKwUvByJKuEjC8eJn/RF8T6T4kDTYuPAP7XozIGmA0TWZVDrs5XgI42TULBN+Ut+x2KqJALkXwq+ASjmpwGF2R0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeLt8xHTxL42wLSA2NNtUNR0dtV156nVj/pYlJPFjXbyyrWdMO
	XKb3btDY/DlKbLqGqwlUISuEk727e1vVIHmnoVjmtPQiY5BHXK0k/Vzw
X-Gm-Gg: AYBFou2IEtmjY4sJzzk1+0ziBKO1sLLxYf66B/SQBt4bxajZqvT+Doel2Zf4svD/Lus
	VRCOpWMCpxWrq/WnWecN1apvtX+kGt+ewUA8UrzYHieZ4jxNownusRIa0NLezhCBaBw5ZlrU+X8
	Tyz52XOIP6i3NRFa40kXLQwRnOQc8UyH99TR4MWM+0lX/BzGcKk2g9TgYpARNyt9eDPRPvJZWin
	oj4z91SlUkpPpSMC0am6s2sBaPl8KupGCUpx/bTT+WFCnJSuvMcjBVgQFdXpHRa/NauL56b7aDP
	NfJFFHdj+JlM+LcALpdi3mxolzBBjwj4JpjbGY/bQptnOrabmyjQwOSx3Oy8SNozekJdY97F5hw
	bsoqW/s2OlcTYJ3DAGJKEnoThHDEdw0Il1CIPJ+gwiLMy4/YnKMk7yqhoI2/5OxfjZrzpwo0aky
	lmIWuyPQI+gNgdtu3C+U0LhbNwF/16XRoAi+j5ehwMMdHKmYPfj0aKL30dV85zsGyg9ySnQE6XA
	J39ZhuZlAT8Z+NIot/BNR26Ga9d7Yhq098x41kh/Y7aHCtmAgHafoulT9s5ZWQi+ZNG
X-Received: by 2002:a05:6a00:1786:b0:89f:3f60:cd81 with SMTP id d2e1a72fcca58-8a089d539cdmr1130152b3a.51.1792571555108;
        Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:33 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed, 21 Oct 2026 16:30:11 +0800
Message-ID: <20261021083011.2170525-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0


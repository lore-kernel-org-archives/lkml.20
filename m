Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F58569F29
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710924; cv=none; b=QjpGR3b1TqnZ8u9ggz41SvjJta3yd2pZXwQ3i35u7onmw/BBBPxz+MfwCoKMm4ql6gVSqdWMNaSFsPDew2gJ6DdIgf6OlE9+p1IoKWiTO3zIkW4nMzMYti41H08pcokpdBjED9gBBQE0viQdF/vwS46GNWxXFtIHpORF27b6Boc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710924; c=relaxed/simple;
	bh=Oy9auHfJzqotrUIAm63gKWiD6Ll4oo+kYUMTprPhG0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WHlx6JVWU6FuozaG45UQJp+o8dlCf+hP1ctU+GwQJe6a83UsoIF13tuPJowbUeJguHmHyDYAOVuIPi3Ar6raO6uTR5C4NQQOlShoPfoM4cKNE0F2mVSM3Pw9qe8PDsQiHnRU91BpXp0O6uLQIJHuPHm+TLHEJOBDB5a+aC3UlDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net; spf=pass smtp.mailfrom=opnsrc.net; dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b=VobnRmIP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b="VobnRmIP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso34240505e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790710921; x=1791315721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEjCSLOm4aV8z8xpfdbNSkg2yURNT+nzhPX8Qum/V88=;
        b=VobnRmIPfD78FI9795jEQhaARTymK3RZA0dfNhD3OEFlcTFqRyQpJ2YlA3ovgEffYS
         yh6LxPmVs1SJzDt/8lADc1bi1bGz1sOZa5756OE4o/3Cq7jSbBz4PkzQLnMscLugdmyX
         +iWPKCYkow80R0HiSIONfXSZ884OipTg3A6DFHMziW/HzOxTsreawJ+X9gDOhURrC4Je
         jUDCbVmDHe1Stk5UR+wUpiu9j9Q3414/vUY7zSM9SC21LPYCCs8I4tbCwEG1AdrVz608
         V37T1LwPZKUAxBbhCgyrNTcA49OfaSO00oqwFdtSV6KvW3MrMonkNkaSuzkRMjvZS3MY
         xftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710921; x=1791315721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEjCSLOm4aV8z8xpfdbNSkg2yURNT+nzhPX8Qum/V88=;
        b=IWoTmhTOmJvxFYipyTCivVT98COosJkA1bO/jxYY7MBZ0TfGQqlZGN53SdviUvXy3k
         WuSf5cZr+vQLVREnGDVigKO3MdqUxNR4TMFaB7Ey4yurQzi/Zy+87J5RWN1mJ0iDcO1o
         HhyKMdsyvaJlSjTmclNFRib8D8/UCwq1zo9l1JxpJxdqQsSIbU8wsqOM9U5uMQLYaxIF
         85vtUzUCwD2plw3kE5dXjCnDDsNCFIcZCnYPKFOdK4dgRoCWmkpoN6fAcSRyEtmCGjce
         1VuWcLvMw2mpne9MlJy6qlsRi2WVPnA6XSALie3G2ta/VdF6ljhNGdbVrUlFGrzOMkTu
         /ihQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvAKFl2DmQRVCQYRebtij1hYYfD/S3wVZlkuIyjNDVemmmtDe5Ts+CBZDT6O7ZCzPdaRITS498sPsUAh8=@vger.kernel.org
X-Gm-Message-State: AFuF++mVfx3deJXrOuVEfU6Es/PV3zqIXVopRrId/RfUTV3PaRVAWXI/
	itNmzU7+n10V3x2vOxyO0+DT3jpqzzGOHmZ4iJZDwSTnFQ/kshJ5Y0sgaBNsoJ9PfHQ=
X-Gm-Gg: AYBFou3QQpOPrHnjU8oEVOGd5U8VD7u2L99Vz/aNBC1guQWP3hJdfCy2iwle+u4OzXA
	YxgQE4ozBGCXkd0K5lH6+aA5M42na8754my7Bd1piolBB/0xX0OCiWQ7oEw96VsdeM6cm4ODcUE
	nSiUlcpftMVAY1Jzz0yAGZTwKQqqC/ICq3VIEcRBo9WWXfa/7uaJePaYhDo/+iQBei0vYxEvANp
	7I1DK3QbgrUIvV93UxE4vtaH9vc8N8lgX2yTp4aMNrvrDgsuq+ypWoCGN0ts/PWN9dXp/j9Ktx/
	Stq3+S2yg7uvhHGE4n8XqnaR+qSWjgKUa12KqYzp9T3imHHxib+XBClZbKSRLJC1PNmCsgltSJf
	PaFxEUJHNyCxtDR6IDLhdbPvgLBwXe02+4aHfrHFK8c1Ux523SNuW/resIziReOy0bWwjsYrhA4
	+oMdPk4lZQ+GO7cj5KWpA+/4PEPyT53lrgxuRueIr6Szj1iA3FC8T5xQk5TAeN/AKaz5yySyVjL
	zmxwrKBwVdH3WAPsmhfhYYunpNTA8XyMqU2P+vuLJfqFLTkqZnWx+5WB0nqldXs4tdv0gM=
X-Received: by 2002:a05:600c:468f:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-4a01503dad9mr1948065e9.25.1790710921130;
        Tue, 29 Sep 2026 12:42:01 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b62sm5238355e9.6.2026.09.29.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:42:00 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	James Morse <james.morse@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gavin Shan <gshan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Salil Mehta <salil.mehta@opnsrc.net>
Subject: [RFC PATCH 1/2] cpu/hotplug: Skip disabled CPUs in cpuhp_smt_enable
Date: Tue, 29 Sep 2026 19:41:29 +0000
Message-Id: <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790692295.git.salil.mehta@opnsrc.net>
References: <cover.1790692295.git.salil.mehta@opnsrc.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Salil Mehta <salil.mehta@opnsrc.net>

The CPU enabled mask describes whether a present CPU may currently be
brought online. cpuhp_smt_enable() is an online operation, but currently
walks all present CPUs and only filters CPUs that are already online or
belong to offline NUMA nodes.

This can make it attempt _cpu_up() for a present CPU which firmware has
not enabled and which has not yet been registered as a CPU device.

Use the enabled mask for the policy decision it was introduced to
represent. This keeps present-but-disabled CPUs out of the SMT bring-up
path while still allowing registered offline SMT threads to be brought
back online.

Present and enabled are separate generic CPU states, so callers which
intend to bring CPUs online should not assume that every present CPU is
enabled.

Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
---
 kernel/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..988b7a1e8298 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
 	cpu_maps_update_begin();
 	cpu_smt_control = CPU_SMT_ENABLED;
 	for_each_present_cpu(cpu) {
-		/* Skip online CPUs and CPUs on offline nodes */
-		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
+		/* Skip online/disabled CPUs and CPUs on offline nodes */
+		if (cpu_online(cpu) || !cpu_enabled(cpu) ||
+		    !node_online(cpu_to_node(cpu)))
 			continue;
 		if (!cpu_smt_thread_allowed(cpu) || !topology_is_core_online(cpu))
 			continue;
-- 
2.34.1

Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A6B361DDC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060600; cv=none; b=OsT9OEaM8O1txfRbDtHyq51C226emZ+/eOUFDeRYjRv1abjGGC6o8Q3lCa9bmItGqfogHiSCAQ5hDZfAhdSQYUmtGbf6JZK11XgwRNeMG/pTpiobGXg9ziyBc4bJj2yO+8+jHNrLorl1LFRFhvcRrhnPnwJX/u0hUIBWEf3OQ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060600; c=relaxed/simple;
	bh=YZfMs3Go3WSABp0x0N8hUDVtHdzAJjFeURZfcGTcgG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMpjOMWZN3mFce3A4ltTe3wmVAJlBek1BnIKA2+jeHLdBs9Erq2mxe33LvDb/FiBFxEDpJjSDR9YUtRBujPHai0DEppcNCZMd7kTTkGPkJSNG2LfLOqIm3u57IaRgrXhmS/+185DrC89gfvYT5/bYqYCdqGnHxn82iD2EAT4RUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jv4GjPBj; arc=none smtp.client-ip=74.125.224.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jv4GjPBj"
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-66e61475fa7so2071452d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060592; x=1789665392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQvOpBVSB7EFzma+xoAdOHr/Eyr0ApRMjSY0dpxZAoA=;
        b=jv4GjPBjRLLxlXy5GOj7/6O5jYvBjmemYz8L6xQHaoUQ7VGX3KtF6M7N1jE9Elg1Ch
         k9IKA9M5iVyPsj/XkTYXJSHvRCsb5e4098X6bsMLHlJtx0UDL3pRHXMybVSG8Zuick+z
         Xi9rfqVhj2QI5bIMRwPSUDHVfMvRC2kV/rxwAaAMXfthuj4E9Ek2bBo55fMk0s6GYnCq
         q/Jo1IwoDJ60Em7LRkzcsw9oazPMU4Y4/U45f3acO624OFwXljqvaVDqlsVQ+XJJfvQd
         V07zC4b3ZAuSweZWIOMo1Xc1akOJGTWPbUwTTZlEuuy1IGqAim09OnQIt65sv8nSzawn
         1LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060592; x=1789665392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQvOpBVSB7EFzma+xoAdOHr/Eyr0ApRMjSY0dpxZAoA=;
        b=XGs+XQRMPOpuTv7KKTU5N17wb4FrurD3q6SJ5M6nrmAJRUXAw/2+Rdra9phoV0ih+Y
         gb+l/QGYhZj/PSXlhPcfTMR8t24s1nbHJ9Qczdj/8fSL5688nyxO8iZvgEmN/1/MF0JQ
         oE+bjMsmiXE3Ryvb4zm9bRem2V2/0PnFRpuJcHsTwq7L1RhZhdRU49b6vYWrQFQ7hooz
         G7VFMq/mkYEbRr9f+pCPFhoXFBNRt9PdIiR+xTCrzJ8n8SRs4JCkPa3JAxzERZngfHNT
         M+W/4CNrI9dSvITiWf9nbRtzytocF7IAlfhfQ6BaPxNBklHjqG7vfex3o13XjuRC8PX1
         MHoQ==
X-Forwarded-Encrypted: i=1; AKwUvByGn6Cz4NmOUWwQexfkoViOKnhV3VBhKLRgOwrl9hOsTi8EvQIELV/+rpJwP3G2w5d9Fdp4YYrbZmXdllg=@vger.kernel.org
X-Gm-Message-State: AFuF++mNbyxahChh1H0/wJvzaj1t0X0bFDfKNCEP1PWOhJ4MpmZ0YJYf
	jSJxl7zu79MDwSJE2o9zwl2Ev5HRuMkC228xvlpZKnvc2BG6Ftp1YA4=
X-Gm-Gg: AYBFou0L7J0FAcVOc5O/ZouWi82mRGNHaKjtdohcLhTcB+K+Gwu4hl2Kd9Mk/e/3hea
	seK6iAY5fgNKtmEo2Ag4Flyx1jHrWPM2Dwnc5SgCgigHYIQ5PCMWLRHxHUaAtGMmkU1VtL+zj4t
	AQhLbrZWYZV7hcCt2B0inzc5QJf/s8leMYbI9oqomAfNeXv5DPEXRK7BvSaZghbpNXIHZdTd3dK
	JYBXKzVJs8pRuEQncrueClkXjiYZ4oqWwEZjobAox0Q/8LvOVm1d1MHnQJV1t4k00lWBuwwhk8U
	9Fwd2kF2T7Dt+/TTpAbjb1d3oPp/tG/3AwLfNBro7xe/Qs/EqPle9wu8CMAFCeC1OKP27t2iwBe
	fLTR69jBHOLiwuD4dY22ijOjCvoynOeGluPI+9tYCAgxr7OWMAejWh35cq/aI5yd3b3EpjyappS
	Uaw9iCOBTTSnzTRSpCE3qG83zUEnEXnUSjSyJB37yVh/Ev4UmHoGui2eImfagE26JermpccCtvf
	2sKkmRumUn0iqDh4lsuCUtTfNZ9+kkNUG5lFjxyqUm0r2HsEA==
X-Received: by 2002:a05:690c:e289:20b0:858:41d4:c28 with SMTP id 00721157ae682-884afc19817mr1025287b3.8.1789060592200;
        Thu, 10 Sep 2026 10:16:32 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8848608617fsm2387337b3.9.2026.09.10.10.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:16:31 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net
Subject: [RFC PATCH v2 2/9] mm/damon/core: read the CPU number with preemption disabled
Date: Thu, 10 Sep 2026 10:16:16 -0700
Message-ID: <20260910171623.6638-3-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_report_page_fault() runs in fault context, which is preemptible, so
reading the CPU number there triggers a "using smp_processor_id() in
preemptible" report.

Read it with preemption disabled, and keep it disabled across the report
so the recorded CPU stays consistent with the per-CPU ring the report is
queued to, which is selected the same way.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 5fdb5922edb78..991ddb9a09414 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2514,7 +2514,6 @@ void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
 	struct damon_access_report access_report = {
 		.vaddr = vmf->address,
 		.size = 1,	/* todo: set appripriately */
-		.cpu = smp_processor_id(),
 		.tid = task_pid_vnr(current),
 		.is_write = vmf->flags & FAULT_FLAG_WRITE,
 	};
@@ -2524,7 +2523,15 @@ void damon_report_page_fault(struct vm_fault *vmf, bool huge_pmd)
 	else
 		access_report.paddr = PFN_PHYS(pte_pfn(vmf->orig_pte));
 
+	/*
+	 * This runs in fault context, which is preemptible, so the CPU number
+	 * is read with preemption disabled.  Holding it across the report also
+	 * keeps the recorded CPU consistent with the per-CPU ring the report is
+	 * queued to, which damon_report_access() selects the same way.
+	 */
+	access_report.cpu = get_cpu();
 	damon_report_access(&access_report);
+	put_cpu();
 }
 #endif
 
-- 
2.43.0


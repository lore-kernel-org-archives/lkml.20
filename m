Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D7F4A4845
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327039; cv=none; b=djyx0I6tmskN90U9WmG3fFEviEarbIPM2lbopYqXSPGS3H3wqkdh5HEDtFPJFfbTzZORAeP0ABymOfI3vROEX3HuX7umleuTcVbXxV95SJWaR7aytXoxTebXI8CAag+HXE8wfH3yHQq690CjCucSKHV6fZ2mi2At8YTff7FA2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327039; c=relaxed/simple;
	bh=bpM2wqvx0LzGiObGM29Wi7+eYG6Oxh86/31s9YDTt28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qu1rmbIO99SzikXsku8spLr/i4/L7u8NaSQieEJC3aZoqiWDGhgR7fNyQau0PPaevOGUQdUGg6jatVN016zq7DneETWBnpgPSA7rhgwxc4EdIhyJSxdPwtlVIFTdLE9RVnUynAbwPz77DEbjDKogdFgg16DX4K9Avqt0b3EC81U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=E59k7ExJ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="E59k7ExJ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8258ac98bc2so2690815a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791327038; x=1791931838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JA8912G4+SWFyMQVOIzEShc8JXcNIOJtWMHGSE0QCs4=;
        b=E59k7ExJI2cJwJQ6ixeRLZtYLcm+yv5EtpCPmnhxw/pNPB5yxyuxg+Pv3Ge9NfWgt3
         l+f/x+gIct4fngCzEta+x+T+mvgH0HIhbMr6D+egAlBLZ8Bh1dKOLMCWTJ9Fu6uumWkf
         HLT9HVm4j1MjaXjIafGmmVp47/PBbxXOVHz00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791327038; x=1791931838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JA8912G4+SWFyMQVOIzEShc8JXcNIOJtWMHGSE0QCs4=;
        b=nObbvdEdkJsaIOttT0C+Ai6TkD19vlx9ZAuPohtaQFTh02NFzVCSVTlUzngRm9PTxL
         3Pbtt0VwC3p+425FidzuYPC78h3tJoE3yQYaCrZnXT3bWsP1XDvzOCwThDKmY0LLDwSF
         MnpMX/3DQbwsrXBRy5FXDbByrNfA7jbJhl5nIzzOpbcQ4s5LuRO7oBMx59VKHmzThh/K
         IJ9MGVt9s2JYc+0NMdMVR/GnzIa+36OClYgUqEb7I9NToc209VTAdVMV7VvHOY9ZRACS
         oecml1GwyxxSXQ3qS+DGI9uzRETI7mStAkKpZwre9fXc/FDrQewIU2vFcPyitsSo0Bkv
         H/MQ==
X-Gm-Message-State: AFuF++kQKDspCKNNdvdu4aXQ6kRDwlnRagu/LqsJc2bpzmE/oju4NnA9
	odJXDuIqGijQuoLyi8UmQIW8wPm3/s6gLgDasMOxauEvIw4on2Z+A9QO7kQX7ty0mPs=
X-Gm-Gg: AYBFou2r7DoSkMZ3xjuD+DynuibSuKY+hjoe+0lnqkVt61PPCttpDB64x28/M967HC7
	GbBR6eDOjQHD5xz3/5eLV5nWSP11F+Fop8roZUF7jVe1NmWYnEeHicdQeS18wigGIix63ylZM9j
	miOyNcjLNbOAC0C/9S7xO0Uphb1NuTWz64aH9lEmQX2XKTJGqB+AKaJbKy3CQrgO7ALvbr0QDdO
	swB7olS1AMVCBF/zmtFMNSNEREgZ1tRgdWHZVXrL2lcFDnJYyhmTxWhktWFbVDVxKgVfipwc/zV
	eZzUMsNPsVJmA/GnJ0+zr2HU8E1x3joGcAb7am5oWd4mwVsdYX9/4ULWHfioeowb7oLoOIPMqfg
	1qPwCDjQxo3KQ7E7IJaK6QQktZ+SeH/WW/BrDppq3J3DE/7NhYLAocp8CuDp54wPbxgia5FDKjH
	LTAaFj8Tl5ZHJGcIvVbRg6p1fwKuxF6kWgfc1v5Ez12/AiK0/tNmtRRyUmwUMx8j4g9OPMgAvTH
	wI43AlhVEOtZjCWIEsdr1zsutXSup5duoucIZBcvs6cYkLqN4tBLwDNdxBd9L202iZejtpPvYk=
X-Received: by 2002:a05:6830:2583:b0:805:bf8b:9523 with SMTP id 46e09a7af769-82ace794239mr1277291a34.10.1791327037884;
        Tue, 06 Oct 2026 15:50:37 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adc3f12f0sm858457a34.13.2026.10.06.15.50.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:50:37 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] perf/core: Require kernel access for page-size samples
Date: Tue,  6 Oct 2026 15:50:33 -0700
Message-ID: <20261006225033.53296-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PERF_SAMPLE_CODE_PAGE_SIZE and PERF_SAMPLE_DATA_PAGE_SIZE translate a
sampled virtual address using the current task's page tables, including
kernel mappings.  exclude_kernel only filters the execution mode of the
sample; it does not establish that the address being translated belongs
to userspace.

For example, an unprivileged tracer can put a kernel address in a
tracee's saved IP at a syscall-entry stop.  A following syscall perf
tracepoint still sees user-mode registers and reports the page size at
that address.  The distinction between unmapped and mapped addresses
can disclose the randomized kernel image base even at
perf_event_paranoid=2.

Require perf_allow_kernel() for both page-size sample types, as is
already done for PERF_SAMPLE_PHYS_ADDR.  This applies the existing perf
and LSM authorization policy before the event is created, independently
of the source or representation of the sampled address.  Authorized
page-size sampling and events that do not request these translation
fields are unchanged.

Fixes: 8d97e71811aa ("perf/core: Add PERF_SAMPLE_DATA_PAGE_SIZE")
Fixes: 995f088efebe ("perf/core: Add support for PERF_SAMPLE_CODE_PAGE_SIZE")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 kernel/events/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index db7b76d6b68aa55dbe95e594d98a47230d12e979..97e5db887bd0a6e45437674670bc38efc6d7d9be 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13967,8 +13967,13 @@ SYSCALL_DEFINE5(perf_event_open,
 			return -EINVAL;
 	}
 
-	/* Only privileged users can get physical addresses */
-	if ((attr.sample_type & PERF_SAMPLE_PHYS_ADDR)) {
+	/*
+	 * Address translation can disclose kernel mappings even when the
+	 * sampled registers are from user mode.
+	 */
+	if (attr.sample_type & (PERF_SAMPLE_PHYS_ADDR |
+				PERF_SAMPLE_DATA_PAGE_SIZE |
+				PERF_SAMPLE_CODE_PAGE_SIZE)) {
 		err = perf_allow_kernel();
 		if (err)
 			return err;

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab

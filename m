Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84545629A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114803; cv=none; b=dRttY6rbCMiLcSZuEL4nZe+MVxSegVbPQ1UrUqK5sCVPDL2ovX0QMssKQO23BqufXDneEzRdk0VFzDlOIoUnK5cvbkweGVEsdMDCa4xWn0eXDNTmtJe9oyaxobbQWVjHfB/Wnl8GHAREBVJGzP2thow2B3Vy9U3GMsbEhsCxl0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114803; c=relaxed/simple;
	bh=5d+nBMlmkUKKmZzBSr3vTufMhxlvPlbEcm68Z1jOeHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r0YH8oWCypC6G4y/370lQsSPeec3FmH8Y/ivI2ATlO1T1NiKBWdaURzo/jnu81VAZJCFTkTX1Fnqg+9i4BACEkJGjJc71YPTcm1OLAypUSP54vdSAH0R1ZZetK98qQ7DHVp79nav3/8QNnWywvQJO8/0ePpSaLx/MwK4IX725no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN9xZ5NM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN9xZ5NM"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca12086c06eso679465a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789114800; x=1789719600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pkkl4LJEG0capi//WgTWNXOHfKwEBVRDjjNXSY4gWOk=;
        b=VN9xZ5NM1TBSsP1VyHXCk9qDmKpJKJFAZoxqjFlE6/9Cin7OYGDIdfyHM+KCtSmz8T
         KRAiJZcDgo3dFSEfb5Q8YX3+FcxgSjF6/7foUTWc2Sh5JXG3I3b34OEXu5sS7oBUd+1U
         5rzaig88hXTZNwQdevqdSdTSAub9R8qBmxH/dm2lB4fHGZ8xKPm5ySdiWBOyf9JXR7Hc
         tsBJqdUBDgE/BvuymESFrhmHHqr6KULjaH/hiPereepSdfDwEGb6VJyxuClbeN20TZv1
         vyoY0a53Gba/wMJYXZAQT4H7vlIaslmMAL1aoO2wmEtHvd/MjXuI0b4Z4ERYHDOvEo+S
         GOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114800; x=1789719600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pkkl4LJEG0capi//WgTWNXOHfKwEBVRDjjNXSY4gWOk=;
        b=AyLuVkb9/k1UbiqqYZ6Zt7o/KRvyMLGLT6uD94gXYXk479T40OSwOBo/nAjLC2KzXt
         tvX68betwxsd4HymBVW+PG8+Vs/BX7c+Emvh2jtdb3zj/Q8rVhCoZ9VKpDjIbjrYGS1T
         g5wP/NpGY6Dp702tUp8vX2kw9QXNTAdQgyYhkiN3Zh+TSxJg4Rfv1yq8gktjkK7Tt3gl
         MPUqLGIWkcj9RCalW8596aWcXI42Y6y/DU5RNKNK/d6c1OQXRe7fWuURzVAXMY4NAUko
         S/GEOjzE8nH6nVeBaQ5ggWWEgEB2P8s4S0HfZkQ+lUEtpxoxVQu6mRJ6/Iq42j+XaqvI
         m6eg==
X-Forwarded-Encrypted: i=1; AKwUvBwRNduWjP16ARwwodEFPH5Lp8K+NECgOK+XmrcaVty3blgMEsWMOpo8OA4uPX1KgASZSIjaedRyDp8heMU=@vger.kernel.org
X-Gm-Message-State: AFuF++nSmxlxLXe8z4Rq0jYrvqMPeK1pPozUTRw1ts000f1WSGVILWRO
	Nnhfpu3StjeoQ7Sc8JaKUQFbu/Gaf/DvX1JDEsHlTGtR4X6asd42JQbhVYlFOQ==
X-Gm-Gg: AYBFou2oC571hRoyDr2L/p2JJDHYFb6HWqvUconP2MaKCC0YQohzYBmWEFRZmlk/Zuz
	+3+EHvfo+IKjfR9tl+7MP+egF9tp9kepcIgPw4kryle+g2sCQrMVdjPyGaZXbtAzUJqLnzWiIAC
	xq+HLJoKJGUIHR6jHKtSj1BwBMcPPg+OQdKijP5iAHwu0g0v8sFIqVDWos+Vw4IX4IlJJcf4lX9
	OGO6jlSlCris476mrucZOlOt/8gTSzobFAuOj7JkIzz8puQo1lpQHAmKi9X0sniAY4plbf/5brc
	mfTA0efTRxccVsrOBrceQoLs/0g/BNA1AQupK+3aT8GeoVv7qTB7FUzj3QsYfZwSzQV5fmSneTo
	ttAOumPtMot9EzYg2Uk2rOOdUaZN+auOJ2aqkuW/B1L15CBPSWcymSAlT0vthX50ABJFXBJ8aIQ
	ztqYh6Ht5GEov5cSPdAZP69C7N6KhvR/RW9IuxnkJVsbKsuDLtn7l9EJ8bZtJGr0fHfE8WFo0pb
	DntHDKrGXb5I1Yde6E3iK4mxTpPVw==
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr5589203a91.7.1789114800368;
        Fri, 11 Sep 2026 01:20:00 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.34.211.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9947b847sm3599006a91.7.2026.09.11.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:19:59 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: loic.pallardy@st.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH] remoteproc: core: Set trace buffer name for diagnostics
Date: Fri, 11 Sep 2026 16:18:10 +0800
Message-Id: <20260911081810.740028-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rproc_trace_read() (in remoteproc_debugfs.c) prints the name of a
trace buffer whose device address could not be resolved, but nothing
ever assigns trace_mem.name, so that the diagnostics always prints
an empty string:

	Trace  not available

Copy the generated "trace%d" name into the memory entry, so the
diagnostics identifies the buffer failed to translate.

Fixes: a987e6b91a5a ("remoteproc: fix trace buffer va initialization")
Assisted-by: Claude-Code:glm-5.3
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1ed406714849..263e12f022ea 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -574,6 +574,9 @@ static int rproc_handle_trace(struct rproc *rproc, void *ptr,
 	/* create the debugfs entry */
 	trace->tfile = rproc_create_trace_file(name, rproc, trace);
 
+	/* keep the name for the diagnostic in rproc_trace_read() */
+	strscpy(trace->trace_mem.name, name, sizeof(trace->trace_mem.name));
+
 	list_add_tail(&trace->node, &rproc->traces);
 
 	rproc->num_traces++;
-- 
2.34.1


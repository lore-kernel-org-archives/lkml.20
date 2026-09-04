Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F607365A14
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518421; cv=none; b=kxS8VzXWaaqxJn235WZx3E7V3jORu/NraP+Fk2b/IJkqmkW/fwXd+jch9JJdZdGoOo69rMoiYZD/J4O5uRBGWUcN5kQepnYelqjExChrJ5JIb4jJw6wIt0aF2tN8pzWI1WmccHm2hEyn625R2oF1C8C0/+/zNvTqj/msawgmvZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518421; c=relaxed/simple;
	bh=80EQ+j08nxlitM2qb+nj2AYVXhhWaOPF3lwiA9bPMhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vs4XQ6g4p7QHTHYpEkl12KZ76h7yboS3U3qj2sjvMWUdrEWvQTHksZV6kFtWOaY0XiavTQ95/cqZqnMlWMKuomJfV+NwwshDhQ8je3zqXhj8Cf319NImNKeXDSE/KNTQ10URm0IsEch8nifRiIJLoAmZ/3TFJhQDcKzvqcYYJ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWJtqXGg; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWJtqXGg"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso894473a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518420; x=1789123220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0VsgyU3plemw9VdUhVnU63XatTfyzeFs9qQpNpEGdpU=;
        b=iWJtqXGgYgtabsarZf5IxwGyMOrNVlUbrC+OVrQIzUMx0KJmanyrrZwZ7n1P24jIVM
         lDW5pimSpCkrf9odpdVtsZ/E+y/yWjmAKNmmQgZUnX3pJwaR1imeJsugDx6zVVhbWp8r
         vIsYFXaSSYoy5W5EcoO9oawDyGsjEgoRyJOeRvaaqXWQorVe8clQ6byBetSYDoY5HLvj
         swknlYzUY5srfAP6IQlV899LXCXEAzQknGusMCznCKGM6N5hRUr43VBQRC8cUle4O2JV
         WrZi0ZQeHDChcrlfHut8Nys6ZrPatgXQzTJTM2tqFUdPOmvsJlkjRZSSwBsAlTUBysie
         2X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518420; x=1789123220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VsgyU3plemw9VdUhVnU63XatTfyzeFs9qQpNpEGdpU=;
        b=jKXmXLgB8Fd4xRIAbLBPfwEIX6/T52pr/U/Q6+AOgmlTGNc6gaynlMbZEh/KnpIw1W
         S2RUwQx6VJKOTG0hP4uwt/JDguccTH8jLWBo9svl107fDQ31kDAYpKrbZEBjQKKKLgPp
         eJe794+2ZJVSCauIqMp5VrwjkBXo1KUzP16Cbv11iqmKNyyCnMgKv3CTGNsbC0o8ts96
         AN3Xn+BfgiXANYXBwL8usrKCYPK0La3gcUzPNCLqlMhie5Y+jwsok2XFhRrpQ1GIfc6Z
         gFWPL6la3HHvzgTsIZYdzHvgzNjhuLmzyLJp2La9mLT6qTRZmX5R626Hp7vXg6uqTaU3
         U81w==
X-Gm-Message-State: AFuF++mKzhPG58LABuZ/sKS5O2X0CE34zDNDIzWRNuBZaxpzqKvyMqLd
	s6MIq9kS1UmLECS4roWvSjIfTKgOeuF9bp+PPrwwcQTYLXMfCiMmIhZU
X-Gm-Gg: AYBFou1wGskxKpGwhdsVyj3lGTeMvIuXss6uN9nzDb8RBhorAzdf7WQPE4/JSLaozLM
	qqSZ0TtXLs75tTa/CIq2z4NsvLd3XJb0qJzK/Uzpoo3fGi1ANaW1b5srCerGRLKU8zU1TNcfzFG
	bRU5B54n3oQBCsjPe72YGfDAiV1sIFRx5gFKNZoh8ArNfoDSmnMYdeN37SXqywnC15Y+6y7E4PF
	k6AzZdNgbKuhQ8GC8n6JSJBzP3RlDYq8kg1MR/ngWWIMET8J9oYHeVSSdjlrZPOtU8qdgCiI+fF
	fQPRy1HXFkEiV7M4lVlFJr4vmxlou/H5ueFAwxB+fyB6touLK00j9kkTs/aQse0o7GzhxgMF+uR
	D70/2x/2FDLnfwtAp1XTvQYZM3tBU1TDAc3C5yA2NqQmq1F30GS7QNQCofeMlhBqe765XUu5m5F
	0JUKYsMvd4r53JbHyh3kXaTKkXkenj6Gbt3YMbWjpMzzqgbwPDqVO8fS78viZO9RSUJw47u3h1N
	T8+raqHTnpKnjM=
X-Received: by 2002:a17:90b:3fd0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39b07fed101mr13892803a91.10.1788518419735;
        Fri, 04 Sep 2026 03:40:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6112649eec.20.2026.09.04.03.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:40:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org
Subject: [PATCH] tools/testing: fix typo "occuring" in comment
Date: Fri,  4 Sep 2026 16:10:12 +0530
Message-ID: <20260904104013.11549-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "occuring" to "occurring", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/cxl/test/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index 7b756000a1a6..3d8a6d2b69d7 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -246,7 +246,7 @@ static void mes_add_event(struct mock_event_store *mes,
 }
 
 /*
- * Vary the number of events returned to simulate events occuring while the
+ * Vary the number of events returned to simulate events occurring while the
  * logs are being read.
  */
 static atomic_t event_counter = ATOMIC_INIT(0);
-- 
2.48.1


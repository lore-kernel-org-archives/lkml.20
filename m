Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7F3A7198
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764123; cv=none; b=GBIsUw0KyrjjpCfnny7VoSu/9k9Kt2UhQvawlkC5m2BSDpK0nd7Ji2iTLSEF2RsoAhJkEfXPxkDynB98yBO3bg1jJNmmi/DvoRf/ePocOygW7QbtD0EbK0zylfdF5+ZHT/O5ebGV+BdDW2RG5W57crf5SN8Z7w/OOikolc/R448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764123; c=relaxed/simple;
	bh=Sq2RfRl2YhF0sjv9PVJ7qBhOhwXcgvpA41oWvqCwqiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpDwF0R9YM46ZKnK4aKnBISHay/CmfCQJuS9QFwZNRkDaq79XTIU51qzKBD2fPy+95fRCSE/xcA3qU+6s6SFgayegsi4x7NMlfz9RC6cJy90ZfDH9gZXRKMgHOTful0RBU1IF+0lO8q/o2ROHnL1ePY+r/h/ft7Z1uATg2CMEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZeMdx2N; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZeMdx2N"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-85339ed040aso2411593b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764121; x=1789368921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=244tKw7QKK+ShAsiiwM+wdP8Xia0RovTvrF6x83sei4=;
        b=RZeMdx2NwZdUz3MycZIJ+jpAOaioEhRSbVilWYTnr1AGb4p+jmXuhDQYNnr4qiPfKT
         cY5c1+jliqphQypLSxRH6IeX87JUNmQC27w+jytr3rBIcBQTkrL29ypXxRZRqbFMdJt4
         b+01JVD1BMUZMHjHldCo1TB8/7PSzBkZRXAzKxplRmZdpd2SwZVnxqqByrkvIVTs+LoB
         MKL3++26pY9BP+qXpjOVH0cy4oSU2AKs+vSbO01w0ZbCaSpwiq3SwHHb3UaBAciRgwm3
         PQYySQjhACqI5rVK64nWhY15HWcBsR8GabDU4wUmR5Ue4ibKLq9pE/aMS/R/uAFZx4Tc
         GQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764121; x=1789368921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=244tKw7QKK+ShAsiiwM+wdP8Xia0RovTvrF6x83sei4=;
        b=B7fOR4oQOzJwmR63ZDmtrcZMo1uystzirKOAl2kmgqaQkdLrnu2oEvTj6gkue4ZkzS
         mS3j7fxEQLsG+JisxNiu+CGktFnv9KBzPbWXy0V882eo1g5L1VJM6ViDblntykB9E1DG
         i3UuQA3G/NElLnvzSfaLZRQ2npZ1odxpvc+D0QE2Cnr7W3GlHk5d9x4N35jt0TGyL1OX
         4SuEs04NLGlVAG8EveqMOQ9cZbbtysfpPtkfjr8coxrHcOAUiTXlkTZEsJXd2jlPfXBw
         V9hl6FzSE1OKnLUv8T5ri8CCm7oYJgaXjO9PTH74i1WfdkCbvjJ3U5pdkFOckZA/TxFt
         eKFQ==
X-Forwarded-Encrypted: i=1; AKwUvBypg0adxcavgx2vkblobBtSxoTRvlwoGxLZmll2GuQqrfyOlNDpjaEsibj4D5t0flK9260NF+zNvFXgs2s=@vger.kernel.org
X-Gm-Message-State: AFuF++kVWVwYeaSI3BogehM8eei8Cfy57I2EiVeDoEzWvH5t35ETlin3
	zY32LnBcfPpAmrJtXZG2es9zSqvzGjU9Oyzd1rhHfx3M/ev89RAbpIb0
X-Gm-Gg: AYBFou1mtY73MemQBN3sTXjmQMKGk7eomWhWLjMlFtLYB3BIiBX4Of/UNZ0CvbxsjsR
	tlBbkdT+s8W83bi2JCgDlXRkvSI8o1Qvgg8AoBL5IP8NgpugofqGrUmhvpEfQKrEJL4DYtxw3ls
	vfBZ9HtemA7MQBvzOwWMmZAwOMS6p9CD1A9xDYsOrMaIr5k2H6LdSKWzzrwfsenmeJjUHVGHzBI
	NNy9DXM6rHBGxdrNdDyvr/uBw+DXJknURZobg1ijTKvZarQSrRB0UKymAiHTj0c1BPHSXnjpasu
	4+odkInGmW/ivWWW8C1IcnOs5SeODmbsaqmBJ8brd1AeKPwaqEIfEFXzi/cnqemjSlgkQcEWQsB
	I5PyvkzXWy6q5Tv9qydszOUKP8Qbhoio3mcwxfAdOX7nlPJDXTvEcM/39pmdCW0Jn0z3xcDxbFA
	SxLXOSXHq0HL5LdX6owbpubfArKYKPjW9Zg2WUoQjCTOTtn/jbLBiAieEt58NEIw2yRe0I3EvWD
	yQI7/7MlX9bSg8=
X-Received: by 2002:a05:6a20:7f9f:b0:3d2:df:1854 with SMTP id adf61e73a8af0-3da39d1483fmr30493513637.6.1788764120927;
        Sun, 06 Sep 2026 23:55:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm24222319eec.10.2026.09.06.23.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:55:20 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 06/14] sparc: kernel: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 12:25:14 +0530
Message-ID: <20260907065514.23930-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sparc/kernel/perf_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/perf_event.c b/arch/sparc/kernel/perf_event.c
index 0ce4ae343531..f4b7a9dfc90a 100644
--- a/arch/sparc/kernel/perf_event.c
+++ b/arch/sparc/kernel/perf_event.c
@@ -36,7 +36,7 @@
  * 32-bit counters which can generate overflow interrupts on the
  * transition from 0xffffffff to 0.
  *
- * All chips upto and including SPARC-T3 have two performance
+ * All chips up to and including SPARC-T3 have two performance
  * counters.  The two 32-bit counters are accessed in one go using a
  * single 64-bit register.
  *

Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAFF275AEB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792372496; cv=none; b=OayWG6rTRL9z8+vqj+K92NmotVd1UDBMYo1Qjs5LAoQ3pLfWKJyIYAnM4H9Qa38Gd6c7uGBOcBLWOLSZqQOzlgtowTWPVHr0DmXbXZWPfyyMrofjb982mTPv5uL/XIpNkaz4ASHcZieNwgwKJOPqbona+MlSy1DlDMX6/CL0SeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792372496; c=relaxed/simple;
	bh=MjziIp9HYumm33wp7eGvStS8U10QD8NX473m/jxckec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0celpHqMC47yJnYKYM+7rZuxbWuWWE5W5j7SoVao688GfKEQlo0wF0xUts/pSO9YJgdmXNHrrQMCUBn1BtUqq3O7gEc2aKY5NyQ7soknQRi5in+OtNP1t7QbFlrLve2pRjR5Tiv9VnhMGBvzy+yi1zp6XyMSQ8kiTDA1+8Crms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=H6winlpS; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="H6winlpS"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9906870a9baso744545241.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792372493; x=1792977293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cpnp3yMFelG0fvds3XdN1g7x4e9nS7OKWWPDPS530n8=;
        b=H6winlpSr+2NMDzblkRqAPbFFGaxkpvMQru8EVdwnlni9Ct740dXHTBe5BCI+jn34K
         4nFhwkDbkxTM+5u1ZkWvv8vqDU6D9S43ucJsDQmTlKI0Smi1fH6PIBPrir6EIw3ljOiQ
         22Zqy+GKv5HdYHmiMZKKn8SU78KZRCdwJB3BztHsRla/RCzel+N0FTngglln+sjrsKAX
         EMi8ISBmgjp40o04mJhM5Qwis8CyS0zKn2sG959OUqujQE7Qt/w8u3M6XB+0tqaz4xOd
         Sht0TS72FN41F5Eoilo2iBLLTTonr8js2/X6V1hEsl9SKMqFr/jc1jFGgiqfoswbg2zZ
         viEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792372493; x=1792977293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Cpnp3yMFelG0fvds3XdN1g7x4e9nS7OKWWPDPS530n8=;
        b=zyTWIG/FaRI9jPwsK24U/TePWMo2A7pIk8oRgy0PYl6+5tpk/WKSFPfeASuiqlhZ7W
         +tdoU5FdViV0FWsJlpAe5mLZPeDrt3sQTotmFxYUfQbPdSoam5+GojgLlONuMCnlskQU
         chzlVCxzqImePicohf7YT+pUC0lICwz2n0lvVQgzUd3l89+8Ww5xJFs+FAPj7X3q6gbu
         f7RpafqGEkKI+t/OTHScyy/b784EdQMvAsThLLRKKdvCuHDPSrxVR8QAAn9HNRpDUHr5
         NsZa0H3dJhj/ChTCknLwrTsEIm+6paSdFFElWRpuEP/m2Eh/Tckw8L6XfgPMIdnDEWDW
         npSA==
X-Forwarded-Encrypted: i=1; AKwUvBwioOp1ejhHYPp+t296jYXJ/ulXfsdoMNZnNbs99yooP6mtbLPRNKDC3B1O8TI9teYByTG9PD6es2eUNJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr8/SOEmg1QwYbbyZbtk79/3tbclypcMiTAmNIk2Ziv0tGXhAo
	Zc9dOdHptTgcdK5BRwTkTj175cI+hAQ94IfVW5ccbtjqBfeiXnzte3MW9xuneYPoEz0=
X-Gm-Gg: AYBFou3Y3P2YSG03jxOgJn54OdprQa3Ma0CmmfPQECqFuO2q5mDnpLlgLWjDMZ+YChL
	Y419wFmDCCggavkOtwYWOTV23zISjZ2r/mj7Njz/J89wIzAruR9KPSpATBOG/Wm/myPp3fj6ZY4
	gQCz4iL/TlfmRKKydgope+t3V1QfTR9X12zBzYyA8EON1c8i5NnCjQskkiWrt53ddO0pTNKfORe
	zPeJV794WXYxqopBen5nB34ZAa+3aTFeJYAqIKZPGS97wQAc8KYh64R9j/g4cVpE6mubaPCXfbR
	05a83UqItNlMVeZ4ahoYTvNdZwrJ435lNKo4DitimV5PDNNLiIO4UfMFClT3NfVez10xQfioTw5
	aKGfOvoh1ZMvOBp3sjP5A8hB6b5A6doZft8kHEP/gXwJ1E+vDZfP5uMFF5UfI8vVQ8LCGr73/Nx
	CxNKKAZbUGWOP5l3E3h5EAImxiXdyGtqFLf887sq7qo38UZq3INUBsRA24f7V7UYiQuVFsEtDle
	2Q/74xMeOZhdglqGBQJObHJ27ovFR9cFW27dS0On+L26uh13XAiFmHrm7IqmKT/qCQ4xhYPMzKj
	GMJyUYwDlfqCCPhrYlQ=
X-Received: by 2002:a05:6102:290d:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7cc369118cfmr2079452137.13.1792372493221;
        Sun, 18 Oct 2026 18:14:53 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b474b2asm8039142e0c.4.2026.10.18.18.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:14:52 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kees@kernel.org,
	rppt@kernel.org,
	juri.lelli@redhat.com,
	nik.borisov@suse.com,
	tglx@kernel.org,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	vincent.guittot@linaro.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	cgroups@vger.kernel.org,
	tony.luck@intel.com,
	david@kernel.org,
	mingo@redhat.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	seanjc@google.com,
	ljs@kernel.org,
	zhangguopeng@kylinos.cn,
	dietmar.eggemann@arm.com,
	mhocko@suse.com,
	vinicius.gomes@intel.com,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	surenb@google.com,
	hpa@zytor.com,
	x86@kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	tim.c.chen@linux.intel.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rostedt@goodmis.org,
	gmonaco@redhat.com,
	jgross@suse.com,
	mgorman@suse.de,
	graf@amazon.com,
	linux-edac@vger.kernel.org,
	liam@infradead.org,
	ridong.chen@linux.dev,
	blum@kernel.org,
	longman@redhat.com,
	bsegall@google.com
Subject: [PATCH v2 1/8] x86/realmode: Remove unnecessary WBINVD from AP startup trampoline
Date: Sun, 18 Oct 2026 21:14:39 -0400
Message-ID: <20261019011446.834487-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019011446.834487-1-pasha.tatashin@soleen.com>
References: <20261019011446.834487-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trampoline_start executes WBINVD in 16-bit real mode before switching to
protected mode. This WBINVD was originally added in the 1990s for
Sequent NUMA-Q hardware (as noted by the comment in trampoline_32.S:
"Needed for NUMA-Q should be harmless for others"), whose cross-quad
caches came up non-coherent prior to OS initialization. Sequent NUMA-Q
support (CONFIG_X86_NUMAQ) was removed in commit b5660ba76b41
("x86, platforms: Remove NUMAQ").

Per the Intel SDM (Vol. 3A, Table 10-1, note 2) and AMD APM, the INIT
IPI used to wake secondary CPUs preserves cache contents and leaves
CR0.CD and CR0.NW unchanged (0, as already enabled by firmware or the
kernel). Neither sev_es_trampoline_start nor trampoline_start64
executes WBINVD.

On modern multi-core processors with large shared last-level caches
(such as 504 MB shared L3 per socket on Intel Xeon 6985P-C), WBINVD is
not harmless: each execution flushes and invalidates the entire
coherence domain's caches and takes ~85-115 ms per CPU while disturbing
active workloads on online CPUs.

Remove the obsolete WBINVD from trampoline_start.

2-socket, 480-CPU Intel Xeon 6985P-C (N=479, mean of 10 runs):
  Offline:  40.40 s -> 40.46 s
  Online:   65.83 s -> 11.14 s (-83.1%)
  Total:   106.23 s -> 51.60 s (-51.4%)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/realmode/rm/trampoline_32.S | 2 --
 arch/x86/realmode/rm/trampoline_64.S | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/x86/realmode/rm/trampoline_32.S b/arch/x86/realmode/rm/trampoline_32.S
index 3fad907a179f..14e56ea95416 100644
--- a/arch/x86/realmode/rm/trampoline_32.S
+++ b/arch/x86/realmode/rm/trampoline_32.S
@@ -30,8 +30,6 @@
 
 	.balign	PAGE_SIZE
 SYM_CODE_START(trampoline_start)
-	wbinvd			# Needed for NUMA-Q should be harmless for others
-
 	LJMPW_RM(1f)
 1:
 	mov	%cs, %ax	# Code and data in the same place
diff --git a/arch/x86/realmode/rm/trampoline_64.S b/arch/x86/realmode/rm/trampoline_64.S
index 14d9c7daf90f..e5a3f03d6221 100644
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -60,7 +60,6 @@
 	.balign	PAGE_SIZE
 SYM_CODE_START(trampoline_start)
 	cli			# We should be safe anyway
-	wbinvd
 
 	LJMPW_RM(1f)
 1:
-- 
2.56.0.176.g3575e65682-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707450;
	b=O85WDND6MUd316GFIp1Za2HtPgijt186sH60x8P4Bmy0e9ySmiTI03ZH6livK1nGesmY
	 8XY+9vTnwSKNlHXY3zCsmi8smDigCTFaxHPhyuytQPrAW1yqJ0GBsV86/cRFv67eDUwJx
	 bAyU2KjMqZlTsOJRnNlswSbw/uHNkyiy/iGXIPujMEmScaMIFqJHIEydmbjZLHLHjJEUG
	 kIw46wB/xhP335P30Q2x6z0tRaVOeysRir0PsJyXvkO9jBXPyIeYrjC6fJFwjr+L5LzkH
	 T/3ar3mK0Pn3QwLLmwbpcDDEqMi49gbf/1WOMKR5xJ0qRpPjeZqNAnJGpv0w+Q+q83A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lomsEIzafjLVZya86Pfl4U9atLbvZi9DCA+wyh807aw=;
	b=P0TpeUWCEepNlDTMlJP0fmTBoD15Z2lxOJqGFGrpvs0jpeMBPuLx5re3D0EbAQYtGoBB
	 sSiHg3hhVJ/Sq7HfgPfFDgaLs50b8vQLa6QcmPWW94RvxV/gZE0AMHj3PohYdjGYWbG9y
	 T/P+ZAPFqQCTUrKLlkfgu32mTuVazfZgTOt4OLBzkIlY3MaEqwPJwP8dnfFL0GJ8GYIb5
	 qwaZLToBbZ3jfYJf8DbqSh24ARkV+/YkAFN2qAP9B+AmVj1c8mDERCZZHgWErItsVxLQc
	 hHQ7pr83uWFu6W0gcp/u+bZE3WnQXkHRFforuKDn4HxSRptphlw21fxGA4m4Aj+cAXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UGp6xEo4;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA40606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA40606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UGp6xEo4
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so126760e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792707448; x=1793312248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lomsEIzafjLVZya86Pfl4U9atLbvZi9DCA+wyh807aw=;
        b=UGp6xEo46X7hYGvsFsa/zX4GnG5h62cMJTqHLj8i8AKrS9J3hbUQrjgzFhQipOB5s0
         hCxwO0BSTsvVFwyx5H+uP2v2FKo5IInzNPnr0u0dUnEcQ3YPFbSzJVc4eXZAJG+j8NLb
         tSPUe8oEQSj9qbppiYXKURYXMHrj3PZbj8ekQuBAzgtsgoX6EzPtpixHmmCuj75hZX9C
         DaIeyR/G+EZyir/jT5XvHZ3HMlKd1Ub3kwmD/yklUnqz7a5LrPCbKekEAN7kN85d3mbh
         diyanZfKbfsdUp25hWiQMSXGYxyDEmbSflG/8REV/USoftVz+HLZcUtcJ/HGlMUXVlRk
         GoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707448; x=1793312248;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lomsEIzafjLVZya86Pfl4U9atLbvZi9DCA+wyh807aw=;
        b=zn2vbb73X2iTF7DPlEP9MxHgsQlqDRFPT0prY98RRgrT1G9NsYAvSRSx0+JfNKHgXG
         Lm9llPXkCkRqqwtTa0CiilIwpz3F48XIi6LW1PKP48hGMw5VHr3eeczhAidnXPQNulXo
         GqmlV5p6BKFQq1Lo0TlPVa0Xb3AUQjUi+ufgZ2GctZKbicJUmoQfY7Omvis98dIx1EPR
         SosB036ANKHexVkRkxcXg//zk4x8vqlwqMrFbitaSp16Gn1LDERO8GxWZVr406ZdRmi6
         cQPN39NCT2qlXoAcD7/1hk5PPoJhRwz6U/HG/qkupaj1b9kLPJfjGHEUgtpwI+mR814n
         pltg==
X-Forwarded-Encrypted: i=1; AKwUvBzJcsBgi2tV8mGcPkAIFx2ibb59IljRA0utuqEh1mBK0zR55X05+cgRQjWCMsZMur1r3aWqmbL8UGHFTpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkSQQ7mJeiBo9K3xJb8pkKkMIoB5yPtmcpG4Q8fNNzX0v1LxrA
	D+k39Kn07R8nWhprD/MWH0EYK7mV/ztf2K2EGANzPi44f82xbfyVG5qU
X-Gm-Gg: AYBFou0pdZ9jlsGgOWA7m1GQawyaSBn6YIGRzjDsdi9fGskHTEzIfb2tND0mZR8nhPr
	Pr/0Beuv5HzFYKQGf2Y6HbQEyDGwM9ChA3lJbBMo3ehaaBfKiJ2EGUW+2uvImNRmg3v6O5JMAHq
	Oix6ygiRUrvc+HxCfovOLM3fXJZF8C63+kLugxAXDH7XlRT+J6Kzt0SQp5ITpLBCnGXI3u+51qM
	r4XhYdv5NJ+FnHfU2q2ZU34sOFr6bR8LTAR4B8quwdlhSbOV5lksgrfRFYZ2pMiao7Gg9F9s3ab
	Qne89QIya04Jy8K60Ugt6o2CysqWtX4OXdmsry9RLqQ547eOTic8kU6ZoYmX7jeOD8S7sXsyP15
	6Rv7pu2QQ10YxQh94kc6Q3zlsbp8abrHlYbGYZAjYXbitVxm9ikapS5fxw5ARSJFvQhOhlujBcS
	yzt+2mz0EhYT1khZfDz/9c5TXhPX1pS4NLhg9eAjFmbJl/GeGRbmbrXtICsOkdbqskO80OiQaAH
	VwShAEhYhNEmmnQaoxfj+JQ7V9rTYjaDF1/kuxMSy1+ur2f6Q==
X-Received: by 2002:a05:6122:3d08:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec14a789ebmr114559e0c.12.1792707448568;
        Thu, 22 Oct 2026 15:17:28 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f2cfe0sm456271e0c.14.2026.10.22.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:17:28 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v2 0/2] x86/shstk: don't leak a shadow stack when clone TLS fails
Date: Thu, 22 Oct 2026 19:17:19 -0300
Message-ID: <20261022221722.619233-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023147.519257-1-ivanrwcm25@gmail.com>
References: <20261015023147.519257-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() maps a shadow stack and set_new_tls() can still fail.
That error goes to bad_fork_cleanup_io and skips exit_thread().
bad_fork_cleanup_thread calls exit_thread() only after copy_thread()
has returned 0.

commit 748c90c69336 ("x86/shstk: Remove useless clone error handling")
removed the shstk_free() on the set_new_tls() failure. Restoring it
only there puts back the single free. The allocation-error return
still aliases the parent, and the exit_thread() path is left alone,
so the double unmap that commit avoided does not come back.

The selftest uses kselftest.h / KTAP. Feature and clone3 availability
skips run before ksft_set_plan(). Missing /proc/self/smaps is SKIP.
Read errors, truncated smaps lines, and a VMA range without VmFlags
are FAIL. A valid-TLS clone3 must succeed before EPERM on a bad TLS
counts as the leak path; ENOSYS/EPERM/EACCES SKIP that control.

Regression (CONFIG_X86_USER_SHADOW_STACK=y, host and one-vCPU KVM
-cpu host,migratable=off):

  Scenario                         Without fix          With fix
  16 bad-TLS clone3                +16 ss VMAs          +0 ss VMAs
  Parent shadow stack              kept + call/ret OK   kept + call/ret OK
  KTAP                             2/3 (test 3 fail)    3/3 pass

Changes in v2:

- Nest the TLS error check under CLONE_SETTLS, as suggested by Rick
  Edgecombe.

- Use a dedicated shadow-stack cleanup label.

- Return zero explicitly on the successful path.

- Remove the redundant cleanup comment.

- Selftest: rewrite on kselftest.h / KTAP (plan 3). Fix RDSSPQ
  comment; align get_ssp() with test_shadow_stack; SKIP only
  ENOSYS/EPERM/EACCES on the valid-TLS control; FAIL on truncated or
  incomplete smaps records that would under-count ss VMAs.

Link: https://lore.kernel.org/lkml/20261015023147.519257-1-ivanrwcm25@gmail.com/

Iván Ezequiel Rodriguez (2):
  x86/shstk: free shadow stack when copy_thread() fails
  selftests/x86: shadow stack must survive a bad TLS

 arch/x86/kernel/process.c                     |  13 +-
 tools/testing/selftests/x86/Makefile          |   3 +-
 tools/testing/selftests/x86/shstk_clone_tls.c | 334 ++++++++++++++++++
 3 files changed, 346 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/x86/shstk_clone_tls.c

-- 
2.43.0


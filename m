Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003935;
	b=KUO3DzHfgjN9qMjvrbHvpQmZZHVvFowvBlVsGqnRIyxsYChc+u/YIfdWDvtZSmzXzcNc
	 0X+OUfQjvXggUvWrbs6fZNof0Qm9P85ye5WF+fFHd7TdwFtzI/StVVrCsuV4CcZFsDYcw
	 umkJ120YlEnvMg5oMBHFjFgFSS8VaIau08Z9iKOGxNLEOK5wJ6e9BO4LdPx2uWIkHRlIc
	 8sTvio5wjl+KJJK9p9MdlGdgJZGNwX9fWKBZo8nTtFtdJBdarD9Yne9NTk3gdiwsCYQ9a
	 cC5998KLIFs+RWFnmqH76K6wn+I1PSNa2EA5qwQdI8sPbl1Mx/WdCBVDOpaFPksoTMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v2TXdy77yZs6lhjkghwXzLiUq+CTx5G8/xzkyCr4Phw=;
	b=QlE6lt09CQmUIpvUblhM5qrIJdPwxziBlmpL6dTRN9ipfTej2YNiud6TktmHaJlas4UI
	 /tBUntCVK5tDuNeCUtCGWWA0kFOt9WucCv7+soy6PuSWqxvvYIZqN0BP6fsfq2B4QQZIM
	 906ZM+fNxF4vw6w3/k9lu9menBswzWdssM4TYW5/LbjZX3nnHwn4KCUez2dWHPQxU+14u
	 kgRNJfOifwnhG3H9rN5roO+OgxSA0c3mrgGMjQd0ow19LltsZCxnYxuMFfeJSdFDVv8Fw
	 oPR/y28HGUOEoBn8FoTWbneVS4RDIB7YnZBxI9B0zTLKJjTrnGeiK9I+BeZsEqwKiCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fcZWPz7v;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0533606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0533606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fcZWPz7v
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c37b612635bso334414466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003933; x=1793608733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2TXdy77yZs6lhjkghwXzLiUq+CTx5G8/xzkyCr4Phw=;
        b=fcZWPz7vQX7V6cHygER9FjxsXztyRH6iisu9upb8RWrU9QYXfF/v7Hpo71QO/j5teu
         R26DH/1A9DyQv5jzuI64n8MDX2gV9HCiAoV0zdOPMtmPYqlW9R4VgnxtWy6CNM64xdNw
         H677G+9869pV6U+xakZfixIPEYVZx1EkiZHNNZj7ckBeBKi/gJlTIuI4PeXgv9rTemfz
         2CTVFYXEYDfVr8LXLt4IzeNSaqCNIpN4xYydMltpH7xDC+vxpbJjNSh1LdOvCHFGnZKX
         TUnM1r5UKiyxFfu6bbmvR9NMcVSaoYR2kDZPUuKgy1K4+dPvaaB1nRb1kDoqaYu/o/8b
         AmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003933; x=1793608733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2TXdy77yZs6lhjkghwXzLiUq+CTx5G8/xzkyCr4Phw=;
        b=p83//S3dgCgyEHIIznp4ufcQO0qCYVCjY1KAgvV8bdjb4Twlt93JjyFOLMzpX3h0Z4
         QrHE02YiANx+xUlP3mL/1Wsp04p9gRDzGPuMmlYrP82TEP6h5qnJBcpIcT1bfUFj6hOW
         265Hc8CAC9FblApZP7QCnQsU2hz5bKA1/DPWsIH72p3D0Qluuq3T/seSKxmfhOC5Aw9i
         CflWFEWn6oTo6U5LDm1kpHVzWj7aLncwfQgU5RZlauqGjafmqEa3O/xlTNV8lm7syRl3
         F6GmO/QIJM/ByFEmAomKFmS5RpMPHGEBbw+QYm+/6smwZxDJKT7hAq3N6bqYlUCy3L5B
         oBMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKFAu8H1vT3X5G2KTYIq/pAfsoDCFfV5bmPE7BV9NIBRCYorpbVrgA5HyyMqghoIvxsCMS1VUObDmBsOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiDVPp0gknySg+Og/YUuI17V6NA0+bx4XAZpCgE2RcdmOEY7UU
	e5kx7NewRoiZMPIDtxqVdPURur9G8kwzPiNWP/93rWuwqOMm2vdOBk5L
X-Gm-Gg: AYBFou11KeYskIBJcgdsebfVpUgQjpT9rD7apo8pAQGIqYEpYJSryKzdUb0Eth8ZSoX
	s9Gs2UFQc5isBXmv2qOEb2DgbsQR4J/IvyTtM7C/nTG7FgBTn2WHaorjPQ371SmdbQsK21sKzzz
	VxTx4pQm8OgQDnkuY8OeXqk5ViF2i7PuArcgT3M6JtoZO/qTJLTVzYwy8zmBqkAqCMYwk9/H+ye
	3es1G6xTCke53fJ8+YIXKJdCVLriZkHkwkjqsjVJW8X4FTFqpTmsaZckmYiFOXJu8O0ZdENsCuU
	bVSYvmw6QNQIVJg7nKeinmTnDRokgcVoXTNDIcSV9EFn+AFNnwP+bfRR7qLCqZeEtKTPKwHwbVe
	3kJOURKqyrMmOtXdikYvmq78p3GCs7vCwc3wXT+a/HoWA6m6SQvnNdEl8j9CoUOSE26n4pv7L/O
	my6qDsZLFQlV3hl9n3g6/4FDs3IIJ9jVAmUKsEtbszoncyg7CLwsoEosQ5Om7ujhW0m6zYCTX9a
	TyypMZcWh0OYamMEz93gJJmkCylF51DKlN+xAH0TmHv6MM2gtZULaeDMtb6Lm7xh4ZT1Uk0g9XZ
	hC+AXOEA+X6eRWJdctbGO8Z83uWp1fjrwMo5fpzfhdM=
X-Received: by 2002:a17:907:6ea4:b0:c41:b94c:4539 with SMTP id a640c23a62f3a-c46bdaa7f8dmr744588766b.6.1793003932600;
        Mon, 26 Oct 2026 01:38:52 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46c59c063csm249655166b.34.2026.10.26.01.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:38:52 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 0/1] sparc32: prevent stale writes by failed bit-lock waiters
Date: Mon, 26 Oct 2026 09:36:55 +0100
Message-ID: <20261026083837.1055953-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
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

I traced an SMP HyperSPARC pathname-lookup livelock to a failed bit-lock
waiter restoring an unlinked dentry. Skip unchanged stores in the SPARC32
emulated atomics and bit helpers, without changing generic bitops or ABI.

For background, PA-RISC made test-and-set/clear conditional in 2006
(af5917f0cd60). The 2018 generic rewrite (84c6591103db) routed bit locks
through atomic_fetch_*(), which needs the same unchanged-store rule.
I keep this fix within arch/sparc; PA-RISC's fetch helpers need separate
review and are outside this patch's scope. The SPARC32 fetch helpers,
including fetch-add, gain a comparison; I claim no performance improvement.

The forced-interleaving host test reproduces the old lost update and
checks the corrected generic acquisition path. SMP and UP builds and
QEMU smoke tests passed for the architecture-only implementation.

I completed a native GDB 18.1 build on a dual-CPU HyperSPARC RT626
SPARCstation 20 with 512 MB RAM and a native SPARC32 SMP kernel containing
the combined fixes and optimizations, plus separate platform prerequisites.
I observed no core dumps, livelock or new kernel messages during the run.
This validates the combined integration, not each patch in isolation.

Magnus Lindholm (1):
  sparc32: do not write back unchanged values in emulated atomics

 arch/sparc/lib/atomic32.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0


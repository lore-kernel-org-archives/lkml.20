Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218DC3AA4E0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381659; cv=none; b=hBKO1SVn7wfVXqc/DXckITAMpcYVnnxPDwEcqMTgYlJN3DXerJZKfSxBjAkqzyFJ7g06eJ5KFf0xl/T8mVjiojD1jdo9/GH2LpUS/iicKDdDXLfKoDfKcbWhZynqOBPRME/HA5A7D4knt8YFRRvx7S/s+bDAT6BDg/wgcntCB1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381659; c=relaxed/simple;
	bh=2AOzbfze9GxhHWoUdvI8sofdY4TtcK2hVkMRcbw+AkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=txzebwmUWnXw+z74dDEVjRnO3EnBEJBiEI/eNYIKVFRX0hUjEC8re2Vh9wTEZ4glkQmy/odvn+DoEWnvkST0NnywDCEb/tD/0jdgJsxGXCWjV5pT/GvuG67m1aHktMYYHqbi9LAACxx4z7mkGaep00RNENLDswI3VWsJmVvykws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=csUzlSVW; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="csUzlSVW"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so1866772a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1788381650; x=1788986450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHleeibfspL0c+dohY0ul8TuzUb19RkhPlnJA1SPRN0=;
        b=csUzlSVWbpvQxbee8PgK+sEgnQ2FaSJ2QrcBTn7XGj0SP7Y/DtBnvktF+Syh4a5KFV
         kms2G8Bmozu4Vpr+8emRz2yd516woM0X5uZdof8vwxB3lS18txuOL3vK13G3+lzkFxW3
         l+tZhvSIuJHH6tMKIH6vs3VLI7KpAjYb2erWkwSRbNSpEVdsNLgq73DsrF3SQd4fEODR
         cyb1dFZH7xSYZRGjGpxx30GdWwGBliltTOgWsvdZCwH5jMFWDzlcfFVHB9nnEW02aLmo
         hpA4ymndZ0r8A5hu6akR3gdSMPv0ikp4BgbhlwTYlhoT0Zo8uV5JK3Vg/n3ZDntBsgbS
         4V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381650; x=1788986450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHleeibfspL0c+dohY0ul8TuzUb19RkhPlnJA1SPRN0=;
        b=lVu/z5i1GgqNALywuVhTsqqVMiafTIWFYEQwRagZZkYgxPpNUtgacvgveh2Givi9dM
         36+eZJABFqc4oHXst6/fRAlJWSoz6RQQmrqU2RE5xXZfOchU3w8Zy6YBl5rudlb794CD
         rA5YnAJNhRF75Lb4nefUaFnpD9hdCF8JGQPJK90/F2WGddyGcwyi0nmWynoGJHVQSqU/
         bLFMOF1NrnGxkzNdTmdZZRH6s3L2i2DQqJgR7kkjyU986T+BbDfr1B3ubY4F2x4q6s+F
         1bxBBXUK/9LbnAVF5YqFvaoIlt1Ht93ZTXzIHjgNOjsUBbDTNuFRRbsVZGpRpAiB3n9L
         qPCg==
X-Forwarded-Encrypted: i=1; AKwUvBy1I7bLAG53QGC+7wFb4tmkJKS9pP2gaJmnuetFHwmvUGlQGorSo1sfNm2/gACDsRgJqiO/jDYxOfVpjlg=@vger.kernel.org
X-Gm-Message-State: AFuF++kAnt9uePBjLwTQW+4k7RFwf+7+Nx9qqdi5dx+kEISoGZYy6Szz
	q/r2uHtUdCpmA6/+lJSsgndui6C4DDAqv7d9atEmh909PKkpCyZHMAQbIXhal2plK24X/+3HoIF
	eArN9zhoTKeG/63XHpX++aeH52xQF46DGsB6K
X-Gm-Gg: AYBFou1xrMHEo+HEqNS0YDvsXwUeeMLFqhQaBQPmFyRgC+5K+O32TWy0/aK/jIYBNkc
	RUmkMm5cskFCdu1C9UCuvv7V/0KaBtbTlxPlio/4ZG/7Zxm6v87JoZG9dFHs4982ykGL8hizrW1
	g4gaDKkXVQRHZz4sd4IM/iMyc4UqIjM1zt03cRqkeeRvkskjFGubSLkyCAeKWAbPVN1A8OrAl5n
	6/XlagcWF0bFKV/T/n7OMXIT2z3YGcrTxg0r+LzIvhQL1mEsf5WiK23r0dYXQ62PXJvuiyJxko2
	u23opSCiipPAlFIvHEtrzbHBcKA8rskJZ1PtaTtpPFuQJOksu5RFtIx40hLYPYiqKwO5qY70Dk2
	cNSW5sEiQy8LTVqJFzmttJEChboB259MJcnC0/4U=
X-Received: by 2002:a17:90a:c10e:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39aedfcc05dmr11464023a91.8.1788381649998;
        Wed, 02 Sep 2026 13:40:49 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b0e607aa9sm61929a91.5.2026.09.02.13.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:40:49 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id B4A553402BD;
	Wed,  2 Sep 2026 13:40:48 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: Re: [PATCH RFC 6/8] SUNRPC: Reduce rpciod workqueue contention
Date: Wed,  2 Sep 2026 20:40:48 +0000
Message-Id: <20260902204048.4100864-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831-performance-v1-6-8d9fd9b67f96@kernel.org>
References: <20260831-performance-v1-6-8d9fd9b67f96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am seeing a significant throughput regression from the rpciod SMT
affinity change on a high-throughput NFS/RDMA workload.

This is a 96-CPU, two-socket system with 48 physical cores (2 threads per
core). I bisected the regression to the patch that changes rpciod to use
WQ_AFFN_SMT.

With the default cache_shard scope, the workload sustains approximately 45
GB/s. With the SMT scope, some runs fall to approximately 15-25 GB/s.

The failure is intermittent across workload starts and appears easier to
reproduce shortly after boot. However, once I have a bad run, the
dependency on the rpciod affinity scope is reproducible without restarting
the workload.

For example, during one continuously running workload with the regression
actively reproducing, throughput recovers to ~45 GB/s immediately when I
change /sys/bus/workqueue/devices/rpciod/affinity_scope to cache_shard,
then regresses again immediately when I restore smt.

Nothing else about the workload, mount, RPC connections, or RDMA
connections is changed between those transitions.

On this machine, wq_dump.py reports:

    SMT:          48 affinity pods
    CACHE_SHARD:   6 affinity pods

The SMT pods correspond to one physical core / two sibling CPUs, while each
cache_shard pod contains eight physical cores / sixteen logical CPUs.

I have not yet identified the exact mechanism that causes the SMT
configuration to lose throughput, so I don't want to speculate about the
specific lock or scheduler interaction involved. But the live smt ->
cache_shard -> smt transition seems to isolate the regression to this
affinity-scope change.

Given the magnitude of the regression, I think this needs to be understood
before the rpciod SMT affinity change is merged.

I can collect additional workqueue or scheduler traces if there is
something specific that would help characterize why the SMT scope performs
poorly here.


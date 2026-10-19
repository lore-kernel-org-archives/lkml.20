Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443971;
	b=NNXWn0dNyclmoTHZrnMCBx1jG0GSIHSh+JZ9t12Ek9nsqifm/NdtCGSyLYe+i2S09JhP
	 VvWhH23d/95TaeRJGlziNnOp34EqlMPK2ZRWgN6WqlwYaKFEIW/x4PcftVofuCQVFqudc
	 qSez/ZE6RvjtJd5QmlSPx7+DgwVMlggOZ/LR/JaaITUUS4T2gP2bOxYG9FnTfIRlLpW86
	 ZfB0SDwdrmD2zyvZjVNDuBMkvRjsGxB+zYk3cd1j7X84MUguqvHToiRd3xqdfpUjgbwKp
	 D9mg0TerFLuEn/hCXoTt8WeHB3IAq2VqFQMeXobWnNzf8sF62PxKDCgn2mmQCdsg8ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9MAmvIn08RerEdZ3pqVcuDHmjNgJDApJ50B7PsC0yxA=;
	b=hLQVvoSS10MNtp7orK5XnnjULP2A8O3kf2UZy9hAPngtUjPSwPwivwJpWbE88i8DvcIS
	 jHsHW/qoTL9PtNDVj9PaoEumHI/6AHDnJ6Bk6Fe7qwtQ6vMs+Gtm7WUHbWCrpkSm2nMwD
	 k/qSVvpqFSvypwNtqtldtidw/9jWe94NLSpjt7rTsZMQGBda/EyMItWSdUXfR0wfljkg8
	 eP85yjA2TIqCnLjElFmNHQ18aOKLZK5HZDF+MsnGFI9OPUbk8ZtAfjzgNthT9PuFW+Nm/
	 ynH3oEqcy6FLVcuPFoOL/oLXtSgjLj6ijKvGY96O/CKL5VhKZXxPGfv+tpxPLigtEJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=aVHZ9bvT;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE62606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE62606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=aVHZ9bvT
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6afa6850207so3286548a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792443969; x=1793048769; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MAmvIn08RerEdZ3pqVcuDHmjNgJDApJ50B7PsC0yxA=;
        b=aVHZ9bvT+GAk2MN8y6KUiGpMemjJ3Sqzfu1NGkwM1zMiY7e/fRsvy0CG/t2b/7448H
         WcYyR74Rne/rwQSVZSFVV3jIw2Y2iElBCeuqMxCYQrbHUKDasUuQUWW7D1f1FBZ5EpAf
         x9XgVKvIkNSOKoac4yrZldcfcqAZSXe17lCpot5uxtLRJNWUX7kY+J44ssawbw3VR8Ry
         IQle1kXpcra9tUJmsTmiJTkBu9TK618H1Y72e8G5Sxauw+vXHqkVlqV0mekur5XgUKcJ
         jWOl3hgWktw3TE4vKIEpwu0jO4hJRRY9gIOkvVilzTRCZ3ifndJKeW8BRu8aUeNgfUR+
         O/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443969; x=1793048769;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MAmvIn08RerEdZ3pqVcuDHmjNgJDApJ50B7PsC0yxA=;
        b=g1zKZVixE+udO9am27ZmlLlSjEoqXHJDNNLKGRii+obLQQHdkurCpTJIJ0Qp38kxuS
         NaOPxdsAgC7NnwYv6ffFU71qMwGHTJr2NzBr3F0TPcISBW1CibOXdalQBPkDdO7WiOCr
         YvgiOKXmLDzz2hz0ZfPGM27gnQ/HHzY8yIleScet1fxOls7Tq88ATBYRsX9aoppVgTWK
         wiWtSa+wrUQRfFuAbnPTToPZAc8PEMQ8mu9vzdb88I2B40ShVVMfMXCFtvYQrCwRZuN/
         zBYOKE2HgAqyXv9ekDqhlE4l7NYY2954weSk1Xc7F058LqLgmdHsULQM/5VJ+AleUSQH
         ITXg==
X-Forwarded-Encrypted: i=1; AKwUvBx5FceQFaw6mEnuiN9GgT6bReuE9P2wGNhEwlP/vgyYQ5CN0K81Z9rsMABf0o2/2yy+LFVoGo/RHS4ib70=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB/2AaXjWLMfxSc34X5wWSSVdcG+AjQdi1kIfwty6kNBbsKHLI
	8MBWK3Hp9u9SLbQ5H1+MAk3W5TLNdpyC639cKKyqGdguiFmdoukJtta5PwzQYOa8flsMujfkQrr
	/MJXH4w==
X-Received: from edvi20.prod.google.com ([2002:aa7:dd14:0:b0:6ae:14cc:13c4])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:354f:b0:6aa:f14f:5571
 with SMTP id 4fb4d7f45d1cf-6b3a81f6f9amr5851038a12.45.1792443968890; Mon, 19
 Oct 2026 14:06:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:06:02 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019210604.2433620-1-lrizzo@google.com>
Subject: [PATCH iwl-next v2 0/2] libeth, idpf: use GFP_KERNEL for the initial
 Rx ring fill
From: Luigi Rizzo <lrizzo@google.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Luigi Rizzo <rizzo.unipi@gmail.com>, Brian Vazquez <brianvv@google.com>, 
	Joshua Hay <joshua.a.hay@intel.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

libeth_rx_alloc() always allocates with GFP_ATOMIC, including when a
driver fills its Rx rings at open or on queue reconfiguration. That
fill runs in process context, right after page_pool_create() and before
the queues' NAPI is enabled, so it may sleep, and GFP_ATOMIC is
needlessly restrictive there: it can neither reclaim nor compact, while
the initial fill can allocate tens of thousands of buffers across all
queues.

Patch 1 adds libeth_rx_alloc_gfp() taking a gfp_t parameter and turns
libeth_rx_alloc() into its GFP_ATOMIC wrapper.
Patch 2 switches idpf's initial Rx ring fill (both splitq and singleq)
to GFP_KERNEL.

v2:
  - split into two patches (libeth helper and idpf consumer)
v1: https://lore.kernel.org/r/20261016151835.2500807-1-lrizzo@google.com/

Luigi Rizzo (2):
  libeth: add libeth_rx_alloc_gfp() to specify allocation flags
  idpf: use GFP_KERNEL for the initial Rx ring fill

 .../ethernet/intel/idpf/idpf_singleq_txrx.c   |  7 +++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   |  9 +++++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.h   |  2 +-
 include/net/libeth/rx.h                       | 23 +++++++++++++++----
 4 files changed, 30 insertions(+), 11 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog


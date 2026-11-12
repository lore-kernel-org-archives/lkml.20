Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446128;
	b=E1Lh/pro8yQ94t/aTQy0uWLUyIegeJBQJNAYsD2j4wqth6tEciN7R0EZr/fmvKsGIAIr
	 9VfeShD36nSRxaC5dWzHGYUGsywXylEbzIOrcAJ4fyz49BvAw64ycXrR7wTogdXfXJ4ri
	 5ZVqW6Gs2ZzT3KFJ3aErqQC5SS0S/y6+ocZXGTEB3LGyjMFHXfc0P+CguhazAdf1ulPFU
	 8VrqVZZW0we4zgC4KWijtMYL7J1CJ5eKgf1K1s/06a8okOBBtcj6+RAE8LM8dSViT/MQd
	 GDN/81SBGtuLNWoEUSpjN7pC3NLfpLFuIiyEEmwLts3QQTbXqfqRxSzorQl4iKwHSrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4vMtlOYMUM7DqpBECZ2GpYW99dCeiETIH6lMWEaKB8A=;
	b=GgvNZ8CNa6aZrcksxzUCqtwkJ5gAm9Vihoki121dA9OzyE1wM+bcUx4L/t+dEN6bNFcv
	 IEgoVMwyDpVC2mCJhR2jxFZTBfJmG7JkIenMsP14KegkYpVVZHjb2L/3rJtlknXogkdO9
	 waxpJ995Qxp5VhYgk09baPpnwIpKM7g1Fey9TM9vDrCASzWtNxwTez/a1XFGhda9mcK0u
	 YYW/JKcHxcPfytzO1bV1xMZ9G2Nx/J6qgP0vhSqPHaPS7Y3u2jbN7aevLvIr/HcM3j+fj
	 2QKHoSKqjd7e8a7JMt+EWCtxtPz6IPfFhNOjwmasJ34B72NazzsZxZrftrgLsQO+52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dL8uvWFo;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95302606A89F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95302606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dL8uvWFo
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6054791eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794446127; x=1795050927; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vMtlOYMUM7DqpBECZ2GpYW99dCeiETIH6lMWEaKB8A=;
        b=dL8uvWFoFQ6nqr2SUdFOz7YbJ2zMHWkam13Z7mcHdH1XMs18faAqBuoJe87vYebzt5
         zPi0oRDNKWvJOgzg64/D8/J3Ubzyv7Q742mQOwpID9G3ZOcrjhRjyKofLTQ3DsC0evhA
         fnIK4A0EEqm19VoI/6NK+aERl2rN0B7OgvEuWj7SaQ0X19zdAC8zyNYHHfqTuoG/dF53
         Oc6OAejDjaoL7/OJKbNbIisS01u0SsIy3QoqFfJ86dBXyvawtooCdmBtz1S4wW/buhRM
         2Rj4emqGky+/AWYjWgVNUohEj8oET5ztU5bvV6o3sOXlzCMfg5WFXXFA6IpHmxs8bo7i
         BpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446127; x=1795050927;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vMtlOYMUM7DqpBECZ2GpYW99dCeiETIH6lMWEaKB8A=;
        b=yae0cP4ySaniNbrCZYWPuqOjYQitzTgY91WwY7heIbdX+YCEw8YMh3wXZ7DOWd5cs5
         XcKPX8KtmykpF/AhBWBn5qvFTQEP4A4i1DOk1nbNiJsRQ2g3Ya6Hk9ThqaTjyZNBifXi
         ur5gOK3bz8nraAidOdK1H3zo7LoLZgRLc4ny6K2KEc2hhmxa7tNKneZHnQ4P2aMKbCpT
         4ybfgCwU6dDWokcuKq6BK1L85b3V1v4tpmQ/Tfa2P55rDyQ3gZX5qL/FLJ6FjlHoqD2U
         vnYh6uBkwqqrhrbgq5gns3LSdk4F+nnyMEbq3vIzQ307EhWMEzaa1NEqWNdv4myhmA6/
         iX0g==
X-Forwarded-Encrypted: i=1; AL+hErEGS+IsXd/7hvSsoBZ8Z4PA8yt7LSqkMZi5aeJr7huemKM6AZ/sv9OMqWMt4qUmuUJ3kvwGFBUZiR38P4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a2e3/U6Q7JVgN4KBH4YTeHcEY89hPSDiSgBZ9DP7cv0uhhCM6
	75roeGWq0h73LgYDo1hQ3lkWaAlDAcIoAOjgR02/E1VCfJHI5Dodq+uS1feznXr6QC7TNK3Q7t3
	oUlXlAhNFpQ==
X-Received: from dldyr7-n1.prod.google.com ([2002:a05:701b:4507:10b0:1a7:5148:9561])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2616:b0:16a:c6f2:60c2
 with SMTP id a92af1059eb24-1b3c02f37c9mr2938515c88.12.1794446126283; Wed, 11
 Nov 2026 17:15:26 -0800 (PST)
Date: Wed, 11 Nov 2026 17:15:11 -0800
In-Reply-To: <20261112011514.4032822-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022204627.1813821-1-irogers@google.com> <20261112011514.4032822-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112011514.4032822-3-irogers@google.com>
Subject: [PATCH v4 2/5] perf build: Sync bpf_skel.mak get_sys_includes with selftests/bpf
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, andrii@kernel.org, cupertino.miranda@oracle.com, 
	eddyz87@gmail.com, james.clark@linaro.org, jolsa@kernel.org, 
	jose.marchesi@oracle.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Forward __loongarch_grlen as -D__BITS_PER_LONG and the MIPS ABI, size,
and endianness macros in bpf_skel.mak's get_sys_includes, matching
tools/testing/selftests/bpf/Makefile so system headers receive the
expected architecture macros when compiling BPF skeletons.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bpf_skel.mak | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/bpf_skel.mak b/tools/perf/bpf_skel.mak
index f2559de39f96..60d104ec573d 100644
--- a/tools/perf/bpf_skel.mak
+++ b/tools/perf/bpf_skel.mak
@@ -22,7 +22,9 @@ bpf-skel-prepare: $(BPFTOOL) $(VMLINUX_H)
 define get_sys_includes
 $(shell $(1) $(2) -v -E - </dev/null 2>&1 \
        | sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }') \
-$(shell $(1) $(2) -dM -E - </dev/null | grep '__riscv_xlen ' | awk '{printf("-D__riscv_xlen=%d -D__BITS_PER_LONG=%d", $$3, $$3)}')
+$(shell $(1) $(2) -dM -E - </dev/null | grep '__riscv_xlen ' | awk '{printf("-D__riscv_xlen=%d -D__BITS_PER_LONG=%d", $$3, $$3)}') \
+$(shell $(1) $(2) -dM -E - </dev/null | grep '__loongarch_grlen ' | awk '{printf("-D__BITS_PER_LONG=%d", $$3)}') \
+$(shell $(1) $(2) -dM -E - </dev/null | grep -E 'MIPS(EL|EB)|_MIPS_SZ(PTR|LONG) |_MIPS_SIM |_ABI(O32|N32|64) ' | awk '{printf("-D%s=%s ", $$2, $$3)}')
 endef
 
 ifneq ($(CROSS_COMPILE),)
-- 
2.56.0.567.gdb80ae8cd5-goog


Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A163377A8B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505342; cv=none; b=UYmiRqQZ2OYW/pB15h6RPfugVRK4ewmwl223pEKA7EOAOnNJgPO9DBIY8tV/0+bI2dFbE2Oir2ftUzG4V/MMf7bPoEGuqrqFb0zD1O1Pa4aRpbp70dFstwBZjW5ZgzqeAz1RZ6X69soVUA2PRv5FporlRkWcs3D+PRWN3+VhDTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505342; c=relaxed/simple;
	bh=OsS7JXbczUOKWByEP5CiGAcQ+FzXXK7rO90IZ4MvpM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cr2rKCF+lulEYejTDAo8PqMLlQUxW92tkmz1xc2lw7mygbhLOlb6a2w9TyFRCY8o40IEe4Ii6O6RjLZec2jPO0RM1kp3GCe02cxMCHNHB9hKBEz773nEC3IabaCr1c/25V+SYkyxXKixph3/jktfzn0zSxv8fhzB5bXrzP4iVbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sc34Oxn2; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sc34Oxn2"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc4528b4f75so216415a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788505340; x=1789110140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JcMzX/PCeTf7UGtxAjVYfuJkqAdewy/yttwf8L/2oc=;
        b=sc34Oxn2DaydCYOoLpXKuzrz/V4nm5LW8E3DW5Gp45xF5akMYYOlqGOv+eV/L4AWjf
         QOl3ysR1pl1iKj55V/xOElmsZFnwGD0yjgwqLEZLHWXBOTOI/wVlrkPlOaU1lTux6d/v
         OsrBJL/nRIpP6cHKrcU5uPYhugIgyhmQAW5ldsaJ3EuBnInJWksOZeVW4kWEpagsOTvb
         EtnPaJfBpG4nw3LNWuT370supaJ5WUZ6Qpktmw3enWFpqVO8YkF3c42V0sS4MFsftO1Q
         KV2Txe6Y6gvyiKqS+0/f3VIZqMObBsh1KUUcft0J9+Cj0qhSSSsOEk0N7SQW8QypqoNy
         8EZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505340; x=1789110140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JcMzX/PCeTf7UGtxAjVYfuJkqAdewy/yttwf8L/2oc=;
        b=AMK8q/RjaUgWAFsT7LMVNZNF5Gh3pxG3QOLRP8CczIGfgQJeHt+k71Aw+PBSR3MAk8
         gGEYSL7Hyn9rhNj10GjQob0zodBIwFMhB8N1mJvP9LKMtnMoKMLEJMlNdkUre5xHHonT
         2Ji/2MxUANYKuAd2lLeuOT/JHj+n0M5pUlaYt8YWIgcMwoaCeUXWaaTD78In2/Sk6ErU
         jvPwDIWHkn3224kY2hhLeq81QidGPlVRC57T0L9BlJzMoXz1v6exqhZL9ufQtl2hVCde
         MRTMbesAWIF1foIN8vt0Cw6vHZCfpC9i1A+2ClygeugKQ6Nsv5oXDsQyiCwasIkxC+RH
         VyOA==
X-Forwarded-Encrypted: i=1; AKwUvBwL/mMZXj9SuYaPp6zesyIUphDelNx8bggmSbfs9OAinWUXjgk0FEPaWtvph2gRiDI/12mD+B1Umwit3W0=@vger.kernel.org
X-Gm-Message-State: AFuF++miFSj04YRqtowZvZIFIwZn+GRVk7Od15kajCSeI2qsShjUjhLW
	Xlbl8WMsHgvMUfEkXOJM5hXYp1pb5B0glRChJKOueBkBBNn3P175gzg=
X-Gm-Gg: AYBFou1mbarUgFfW1AutDzLibN6Kf4UY7cM1FcfWKR+iWUb6Qg/vzUGbTyc/K+PJBmK
	n/COC0lZjkfq2pc40M5A3ccsu+mCmESKlOv0w3T6aRkLqiDDe3Pbbmzys9LWAUavdbp+Wl96ILM
	hlv//DLDc/FlEG5fhHxHBdPYzy3BgK/BMayCUfSQv/wBS/QrFx/O3HMx3DwyTchL+djcSxkySdn
	4RUqE7kPcP1Q3AoAUFH7Lje9I9Qjt63ZoP2tVpQHfTpS4U7GsM7OdjbseZN9OKt3tUqwfiNEYf7
	dQs4++NHBQO+6HHeCQxBPK0E82pAUxVCPg8jexyt9AGtPKweEo7hxwapWUwh5SVQ0Hnqmxw/bcZ
	W4LqfyJvpTcc2500YoRrpqyoet8+xAV3TOUNVPwQjwlnL2SSQFCx/Aqq5HkZayQv+isF42bL79B
	KLm+ndfgU5v8DGkqjzdnwv2fDDRsSM0wTjwO2QFUTFMepx6AujeEBNDD+GlSdEHhVoWrup8MtEc
	hh32NMRMO0poBmvMzvPw2On
X-Received: by 2002:a05:6a20:6a1d:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3da39d2e51amr5960262637.11.1788505340274;
        Fri, 04 Sep 2026 00:02:20 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615273e3a0sm755511b3a.23.2026.09.04.00.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:02:19 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xu Kuohai <xukuohai@huawei.com>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH bpf 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Fri,  4 Sep 2026 16:02:08 +0900
Message-ID: <20260904070210.4163193-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm64 JIT does not set BPF_REG_FP in the prologue of an exception
callback, so the callback runs with whatever x25 held when bpf_throw()
was called. A callback that materializes the register, for instance to
pass the address of a local variable to a helper, then works on the
frame of the subprogram that threw.

Patch 1 sets ctx->fp_used on that path, the same fix commit b114fcee766d
("bpf, arm64: Fix fp initialization for exception boundary") made for
the exception boundary. Patch 2 adds a selftest that reaches the case.

Tested on aarch64 under QEMU with vmtest.sh. Without patch 1 the new
test panics the kernel, because the address handed to the helper lands
on the helper's own saved return address:

  pc : 0x1234
  lr : 0x1234
  Call trace:
   0x1234 (P)
   bpf_test_run+0x188/0x3e0
   bpf_prog_test_run_skb+0x47c/0x998
   __sys_bpf+0xbdc/0xdd8
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

With patch 1 applied the whole group passes:

  #116/11  exceptions/exception_throw_subprog_stack_cb:OK
  #116     exceptions:OK
  Summary: 1/118 PASSED, 0 SKIPPED, 0/0 FAILED

Not tested on other architectures.

Donggeun Yoo (2):
  bpf, arm64: set up the frame pointer for the exception callback
  selftests/bpf: cover the exception callback using its own BPF stack

 arch/arm64/net/bpf_jit_comp.c                 |  2 ++
 .../selftests/bpf/prog_tests/exceptions.c     |  1 +
 .../testing/selftests/bpf/progs/exceptions.c  | 29 +++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.53.0


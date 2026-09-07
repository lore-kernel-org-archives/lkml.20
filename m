Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1777D383328
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759766; cv=none; b=DXZfBleoUwWu8rIhTU6NgsVVNM+j2E8G7FNbo5Pa3SsOwGGDcwdvMamXN/UJE+eDQhnV+4f3eisSHwTo9cWQurKYPZxskrnF1kDJ91tlvt8C1lNjjASzzEeSOYumBI5h0qmUn+LUjitnEBsGPitwJ0B2SlJ32c41PkxUGMbWpR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759766; c=relaxed/simple;
	bh=+96xv4UMzgCobHxPWEb/ZyfxeRIg/8YFBZx2BYzFCY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCM+JZUjuilupiba0b/EtUcUQnJbI5V27jQaINNROT0SlJ62f1KddPjCVYvRVvEuUxVRRV6kH4iILuxRlAOZrgXM6TdCTaYku5U08THJyl1PLhg51lO6bIDmS6Aih7qZ/+/EPVbMPYI+njIcKrvtKyWCWKOzjLkoO3oGJVQMZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6wpjmeh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6wpjmeh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d9201076b3so35706845ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759764; x=1789364564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAu5fxgyZ26sDg3uDkdewTDvba5N+Y2xWOAnHoqr7Vc=;
        b=n6wpjmeholvTO8xRbvSHyEVQBfSofWVOJy5an/ZpzWp2+YNsBrnig7DvnpLFTcNEVV
         N9c2kHThpUA2d32A1Y886voMYRkuc456PYf1F39JdRPkkOwWVd637AB4X/RhjNm1p5Lg
         s1gtKf8ztptS7k6JjjPCnrWwsltY6SNFUK9Ch5VlG3D5jLXwMBvxHT1QN37QoIaWvXNA
         EQ/NLAg8YFghaTB/25sOlg37hq4HwFvDSyfGe2Mx6phSv7oPGEdU/hgvLb3TOKoXCdDO
         AHPQd10yJl4ho6qMzD4v+iV19eWiY6qKUj3n4xEzt6VyGkaUDCHQKMLvs4kVRtMZJf6O
         JlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759764; x=1789364564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAu5fxgyZ26sDg3uDkdewTDvba5N+Y2xWOAnHoqr7Vc=;
        b=V0IaO0wLeV4Ltbh9WlF2UXoig6vYsYnZQBo/TblFkn7qe7WcWO86zjFTURpsbaokwG
         iiLhjhx+QaU/eMNbGhAEGOElqxSJaCwpkiwAlvY6IeakKbbpe3wfvTZnFEaKZOkWjewh
         vBoqgOVpdFthIzgYblX2IWKT8nv2XkdHx2TTFIn1is0AXVbMoZjYhH3ClDZ1bzpf7XhW
         eecVWv/UjGRUNoV2cM5twoDkurJXJ1FCY9SsEyg0vd5bHvJXvIgRRkT8e/t2KQtOTrhS
         q/R2QMIj6lfcw/es7RqWK/8AIDqtt/t0wWjf76JijbNpCYMCH82+pNLtUZ/kZ1SvypMq
         0Hcw==
X-Forwarded-Encrypted: i=1; AKwUvBxruyHgkw2wsYr/uewWmggKnPpP+HeqEPOsBlcUPQ/W5GWCl7fhBJxaYPf8jeyBKqS2XCensH4B3nk8zAA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1VVS4OuiVUYLLFE0dKJHuGiGxx1Sn2ywZM2rJXvP45SPbwiKV
	kAMlp+O2TBK9NFni/FWoj4jXJnUOhAithm7ILkvUwLoJsKNkyw1YT4Y=
X-Gm-Gg: AYBFou0uRmZsfll/ane4LG15wIJHMB2VCRou7Qp7zesF5l0cerCAb6T0zuBR+kaBi7l
	5KG7R/tSaFpQb8kItZiU++Ax7h0T3P43BrSihMIa/eIu5U1MdWbdeGihw+IFiPoQQDgCGrn6wRn
	KeedaCXfjoiH9puNkOC+SsCXXkwk8Uyi0KiFA7avnQBvuNLpJaL7r+JphBxMd2+E1GiTatWU3OX
	HxTMp+NKCtETEZcBO/nXMTMzusUgpI5J5SGHEOmbMfp5HszGBV83kZndm6+CenAO+gVbndKSjc4
	7nnDt2GGCfK+61ZU9WcqgrW3Veo4SJOD180lTZ4eORxL3BYCL3weaUYLxXqVTtqvAfeZQIUNfEE
	SKK9IrVOAD2q+L4d3lSXsDr7uXbP0G7xckZrcgfAzQ9x6XskcYO5Bg+gySehV/O+KZKjYi2qc1X
	FWngU9VARHcaTgG9Q64XBmAnRQqBi7sEcWo7vmT4d3afRpzQZQ1FJH1b4hDqhWEUqRJX1oP0+A8
	kqU/vSnxPcS4q3w
X-Received: by 2002:a17:903:1a8c:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2db1267bc0emr293026495ad.20.1788759764353;
        Sun, 06 Sep 2026 22:42:44 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm39107695ad.12.2026.09.06.22.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:42:43 -0700 (PDT)
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
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v2 0/2] bpf, arm64: fix the exception callback's frame pointer
Date: Mon,  7 Sep 2026 14:42:33 +0900
Message-ID: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
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

Tested on aarch64 under QEMU with vmtest.sh, on the base below. Without
patch 1 the new test panics the kernel, because the address handed to
the helper lands on the helper's own saved return address:

  pc : 0x1234
  lr : 0x1234
  Call trace:
   0x1234 (P)
   bpf_test_run+0x188/0x3e0
   bpf_prog_test_run_skb+0x47c/0x998
   __sys_bpf+0xbdc/0xdd8
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

0x1234 is the value the callback reads, so the helper wrote it over its
own return address. With patch 1 applied the whole group passes:

  #117/11  exceptions/exception_throw_subprog_stack_cb:OK
  #117     exceptions:OK
  Summary: 1/118 PASSED, 0 SKIPPED, 0/0 FAILED

Not tested on other architectures.

v1: https://lore.kernel.org/bpf/20260904070210.4163193-1-donggeunyoo.kernel@gmail.com/

v1 -> v2:
 - rebase onto bpf/master; CI could not apply v1
 - spell the three new declarations u64 rather than __u64, to match the
   rest of progs/exceptions.c
 - no change to patch 1

Donggeun Yoo (2):
  bpf, arm64: set up the frame pointer for the exception callback
  selftests/bpf: cover the exception callback using its own BPF stack

 arch/arm64/net/bpf_jit_comp.c                 |  2 ++
 .../selftests/bpf/prog_tests/exceptions.c     |  1 +
 .../testing/selftests/bpf/progs/exceptions.c  | 29 +++++++++++++++++++
 3 files changed, 32 insertions(+)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0


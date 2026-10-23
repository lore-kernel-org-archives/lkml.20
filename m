Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750738;
	b=ltPlkkXxNKm3Lckc6a/f/LiYSYMT9gHSOrhGOWAHavUwcgZo1/YF1oQdZT2uiQH+Qep/
	 UV5PZkzfJ4uif3glsFoKgQDyDyZxId5hocg17C8rST2/gSPspdKPQy1HBsj/S/ZITWukG
	 rgr/C0e+VqmuHzhwUPF8OB8tPA2Z6DO7rKjogeuzmdvz74mIxQiplofoyBB4nIQ6oiuEd
	 jrJZNCA5qrv4Qkj1Tzue01/hWG8KSPKDrQgzhjTp4FIUbV5hv8wKbImKeAGOWaphExmgn
	 y4rE5ZPWw8vTOyf9BWEtWI0NnrQecZck/3ob/31mWQDeX7vOvie8tXZDHqaU+YPCamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EiRKif/CjX01ct6IZOevu5Hw8STctFNztvjIHwXGraI=;
	b=aIi4AjFaOe1DB+BDu7lj6QuJ1VAhQMOtubxVOxxrdNsWCjskEExXPld2rb9JbB2gcpbs
	 XWt745S1PKQ5PpmysgjtU82azI/5beVia8p7RgwESqzywFt4eSrb/cAPKhqfir+me/AQN
	 vdkiwSzcOp4UAiuOwiHoRYvyP5CObYxih+sNZktX6trzAh9SXbsg/GTX8XzGK/8dkNmOy
	 BFfpo5GtxtYdQIHHF7eaLc07/lqRsep0sRdzTm10nQtj6n/KPAxR8i//TdwhJHpRvqvxO
	 G0VVMkRuIS+Qs1HIhMYHK8fdgv/L8r0wVjF7ptft/3LaBGWRYQc5igJN4+kxJm+Z2pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NtXZYYB1;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC3F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC3F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NtXZYYB1
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1150569eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750737; x=1793355537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiRKif/CjX01ct6IZOevu5Hw8STctFNztvjIHwXGraI=;
        b=NtXZYYB1icV/lPS3+rQgreOmR84b11YSHmAYylCI56Ct5xzx2yCVwaJDet8CdjUmIT
         7RFXyA6k01QFQl/spqK9lgNFRsSkmkjtBM2LwkasA4gn+052pYC5eNc6899TdUHjAFBM
         OPbn4+rPp2EvQ2k5vcgaL6F7RGAiz/50Y/J+NY7zaiAtlIXcRGl0vIHqcBPWSqVTZbFh
         cNQw0ykeA0vwtWHwdIr5WjX+YkbEq9rX7Pkim/7nqMIMrcarQnwb+9iEju8AiLnSqFRk
         oBYPj56oX9BWrFTeY0EKtCt94aFaQMiPwVnDVjvvZyjpCoe9uAqCT3YIQiMbC8tHpTMC
         BsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750737; x=1793355537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiRKif/CjX01ct6IZOevu5Hw8STctFNztvjIHwXGraI=;
        b=rxyJ0cVTmycYxgh1KzVmHmb1laZ6gE9NOInBi/utJGR5l3F6h5xUDWH5ORXRfD7nZV
         tVfBxjyOKtgtxQjN7ZyuOfDuAovhPOlbfH5x99tNQmyNIWdFcDwvFIY+dWgORQSiZIo5
         t9+xfBns2gMp44dHrAKKa6c2LaeDgcn2KbVQeYLmhEdrM4jLsU9xKgW2O3jOkzQUql12
         1Yu38MxGg33TQSLQ/kqAwvYjHlgs7YJd+jiufAtoQfVUwM15cZd9puYCPKofDXtgkx1Q
         0OLnP+ukFjAjSXFjPoW7Y/ESXJTdVJ8WQFjaHcPLWBrvglmffodEXlWsx8ryGNGfzS93
         Ceug==
X-Forwarded-Encrypted: i=1; AKwUvBzwOevzR/6nYY3BDkB4nKjdGEQX6son7MatKBCOKQxOCuqQHI8QaKLbi1/RS/wc/jj6YcgfRH/YY9kWdyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkU9eAXnbhmXtFTpAXAYdReD/9fqfMiyDYMboqohTRczfP1bQD
	Y5YdKo5x8o2iEhAE3H8awc7ZL7uCdrMHFRgX1oWe5OdlHGbcmRYm0KP3
X-Gm-Gg: AYBFou1oKgARABxHnwQlbVCLEBETMT5clfhlFDGP44e9K0gWrC6TkbrOp28KCDINfaM
	XjW7lh7Gm46Ejgp4NPde1UkpJHj4R0vZVNyovE/lNOT3hBh0y+XAxYc4CBO2GCd7FV9WDscNa3d
	fdIUetScjLAO46MJ53+yn7IFd4dnaFbf7yroHQUv9ZmeNPY0dkUyR1mKqTzTuQl24/aU5kGtKkU
	qDkmFXpsP8g4I10lnxR5UJFcZB29/8J7TwXatWIAQtBG9NeFyCCY6U+1K/UzJsRgipDgfjy0k/W
	8ZLO+T0KaCaJzQHFoGfoYdIbjyhWS9FuCC6OTWBb9Oh0LMXwAYgdYCc7sqP54hNNoPRQxqq+8I1
	9MVwh9+IC3igxjOzftfoqpY2sNYRyCimjBH7CZxZw/UGwNSz9WOzhElJhDlcT0xBHMYDtfSAMQx
	G9dPmzqB7XdfBplZRsezzdGNfRcYA21QkmH2kZDfIcbrIKQ+/dJJpYedjTwO5ULpnGR8veMk2yK
	D77IKbXEmEm7s+RzLhW55J1IRdhMRZUYTkwvUD54gKbPsG9goYSbqWFFo+mK86oyAgxZ1mOew==
X-Received: by 2002:a05:7300:e9cf:20b0:361:8d52:e148 with SMTP id 5a478bee46e88-369d90c8111mr2746649eec.4.1792750736987;
        Fri, 23 Oct 2026 03:18:56 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:55 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 0/9] rcu: Improve callback diagnostics and validation
Date: Fri, 23 Oct 2026 18:18:32 +0800
Message-ID: <20261023101841.2910719-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

This series improves callback diagnostics and validation across RCU,
SRCU, and RCU Tasks.

Patches 1-3 record callback registration stacks for KASAN in Tree
SRCU, Tiny SRCU, and Tiny RCU, matching the existing behavior in
Tree RCU.  This preserves the original registration site in KASAN
reports when callbacks are deferred through irq_work.

Patches 4-6 add rcu_head alignment and NULL callback-function
checks to SRCU, Tiny RCU, and RCU Tasks, consistent with the
existing checks in Tree RCU.

Patches 7-9 detect duplicate callback enqueue attempts at
registration time, report the callback address, function symbol,
and object information, and limit diagnostics to the first three
occurrences.  In Tree SRCU, moving the check from srcu_do_enqueue()
to __call_srcu() rejects detected duplicate registrations before
they reach the deferred-list enqueue path.

The duplicate-enqueue checks rely on the existing RCU head
debug-object mechanism and are effective only when
CONFIG_DEBUG_OBJECTS_RCU_HEAD is enabled.  They provide
diagnostics, not full protection against concurrent registration
of the same rcu_head, which violates the API contract.

Tested by rcutorture with KASAN enabled: SRCU-N, SRCU-P, SRCU-T,
SRCU-U, TINY01, TINY02, and TREE03, each for 3 minutes.  All
configurations completed with exitcode 0.

The KASAN aux stack was verified with a custom UAF module: the
"Last potentially related work creation" line in the KASAN report
identified the original __call_srcu() registration site.

A targeted Tree SRCU test module exercised duplicate enqueue
detection on both the direct and irqs-off deferred paths with
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y.  Both paths rejected the
duplicate at __call_srcu() entry without list corruption or
hangs.

A targeted Tiny SRCU test module exercised NULL callback
rejection, duplicate enqueue detection, and post-callback
rcu_head reuse with CONFIG_DEBUG_OBJECTS_RCU_HEAD=y.  The
first two tests produced the expected diagnostics, and the
callback and reuse tests completed without hangs or stale
debug-object state.

RCU Tasks duplicate enqueue detection was verified by code
inspection; no targeted runtime test has been performed for
that path.
 
Kunwu Chan (9):
  srcu: Record callback registration stack for KASAN
  srcutiny: Record callback registration stack for KASAN
  rcu: Record callback registration stack for Tiny RCU
  srcu: Validate callback arguments
  rcu: Validate callback arguments in Tiny RCU
  rcu-tasks: Validate callback arguments
  srcu: Detect duplicate callback enqueue at registration
  srcutiny: Detect duplicate callback enqueue
  rcu-tasks: Detect duplicate callback enqueue

 kernel/rcu/srcutiny.c | 30 ++++++++++++++++++++++++++++++
 kernel/rcu/srcutree.c | 32 ++++++++++++++++++++++++++------
 kernel/rcu/tasks.h    | 22 ++++++++++++++++++++++
 kernel/rcu/tiny.c     | 11 +++++++++++
 4 files changed, 89 insertions(+), 6 deletions(-)


base-commit: 940793b926aa94bf65ec404043050888e3053188
-- 
2.43.0


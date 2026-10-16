Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFFE2E62B7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117330; cv=none; b=cpaZan+e5VxREd9b4pjFDma+5mAJcRzn2X6cxJzKXb5WdqiUtyXKf27byNZQsEv543wX9MR7MApMBjkxaCJXE7b1jEyP01N2Rpq4Xq915JU4eRs+0kR+1HIYhkXvjNdlrEW6Gn1UBjx+yWFUlfvGJyL07tMD7syZ1rvqwKznZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117330; c=relaxed/simple;
	bh=7Q6IKmh8hgNOnP1yiHyT5ic6oYj4j7ar9wKDauewCns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGUECzZMiUL2KBgwwJ/hw6MjNVkTgnBC9BWIlNUjKoK5e/RpsTvlFybofrfr3sw44918Y5C5m3WcU+uQ/zSBluG9IwcYxNNsYNq2RryyT5EE8y6JLSVZ/pCruhBClNsWxVbIHk2/nGQffok7jyVFaj4hQ6+pFOzOBVNanyPPitM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Up0T6q48; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Up0T6q48"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1319956eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792117327; x=1792722127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LfQgKp0ztlf0EQ9y2RTrGf8UOpxokWsfVnFXAkS3BA=;
        b=Up0T6q48dnYruownusx4TOFHibVfhtCfBD0GN95+Lzi/8/09hZ2aUm/YHhneZE8n80
         mSkO5hcXqSzrEDUalnJZqIvZjvOZ8wlgQwvdxCxKYXFSHoeFv6/C3cJG81y/m77eUCvQ
         kkeDtuygjPwad2J11xD+0XOd+VghjV5JJ1bJZJ/tu7cVbViueW9s2cBS+pjY/46A7uBC
         sMeeatDSWgbJ49aoVV/dBiPczUwOQe8qYCCeV6FlhcY/7VDhvTYk2Xmn1WHY01exIpZ+
         hMgwZwiYdfBv9R8ONhPaLqnunOptp+sCF6sWgwY/6CtR3y+cepTcXKZS5HCFVGpihXx6
         QVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792117327; x=1792722127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LfQgKp0ztlf0EQ9y2RTrGf8UOpxokWsfVnFXAkS3BA=;
        b=oVwDkFXuK6DI2OSuKXR21eHSrnqnOlhohrGot6a2ZtAzDHMEHQCZokiCFVMmNIQe0Z
         xVxAXbzPMca4mZnfAtn43I6xNbcFAiNDfqJlxwLMFbaGXcJHqlCzVNMUx4CudcIM+tZW
         wVLeOlbYMo4HTa76mLgRAZUrgKCXtd/p0xs/EPDSbX1vCbJ4EiGDYxvofqHMcXzrXpKB
         QoSefaLIhvin/rSHuImpmZOmJ2YeyFM/DcUCg3hr2ebt0/amxPCcFMfyhEAJSnMZ2S1R
         Qtgz4w78rGrMQNXu1kVpLD8tgV11gMUJkl/pMlFKKhLr84q3XLq7XCIkGB6faWOtLVDk
         s6Ew==
X-Forwarded-Encrypted: i=1; AKwUvBx+3davlCHVL0MGNLO72RV130WTWFXtptSBptwOGT8NAufyqS3PV3BI3u+HnO6xq4NJj0y7Mvgon8+EVzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUYWYHhi/jg8AdKJ8klWfBxj4B+S++w7ppjmtlbEdFeTtBrV2O
	iTrBUtyeuNqeaJvCTGwC7K6MJg7BPHnGSyUA9h8Cf14Z4P2BnZbXDRv4nYCBRHVp12I=
X-Gm-Gg: AYBFou0W0mUP1fBMjwi189NkoRDvbcis/5dDNKB29kgGjaY1sLKuLDIAhjZyGUCa8tR
	15LdUuPBCm7Dj9O88ZGNsKKncho34UN/4pkpSJl0iaGQ75kSPI1TFXd3+FhuG/ufB8Aqbs0Oosz
	OK/ozCKLgGF54RKvR4m03wSUOK2OvEEps8rNaKRuJHZQKsRWKbeGkvGr/v6otOkddfMJk93GzOT
	ELHlxz7+YWIgRdj1/UdvqIK+zlIK/0SW6qSR0B46xaz2GWOKjPdkTglY8Jh3eppXzNJlOAL6lca
	w5LVKF4XUPSW6Ibq23aOf0YDd+B3UlmDeARYoLfKxXw0NSBZmpBfrqCWA7bz4JzPi/dvcyk8NJh
	7aV88bCr2ERvECVANOof8+4lmo0WNIfd70tq0OLlt18v1hiiTzmJtA56+o5A3Pnqpta2IC4iD4Z
	NHQjZvF5LbLgrRKI364I/5SrtgwZQ34b2YsN8zy0RRF3kkryyc1dwc5YHIlpXxnoIJLYuxtdQju
	EFcpdDSCLVCbwtbIwpIhi7tFiKXLAGax/Xs56nXiESoyVe1NgKHDRDpwmvX/MIkBN5g3Q==
X-Received: by 2002:a05:701b:2510:b0:13f:c85d:17bb with SMTP id a92af1059eb24-16a5888c49cmr30633764c88.1.1792117327042;
        Thu, 15 Oct 2026 19:22:07 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d66:d0e8:dae3:3257])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831bd28789sm1380909c88.19.2026.10.15.19.22.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 19:22:06 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	linux-kernel@vger.kernel.org,
	martin.lau@linux.dev,
	memxor@gmail.com,
	olsajiri@gmail.com,
	paul.chaignon@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev
Subject: [PATCH 6.6.y] bpf: Check the helper function is valid in get_helper_proto
Date: Thu, 15 Oct 2026 22:22:03 -0400
Message-ID: <20261016022203.17034-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Olsa <olsajiri@gmail.com>

[ Upstream commit e4414b01c1cd9887bbde92f946c1ba94e40d6d64 ]

kernel test robot reported verifier bug [1] where the helper func
pointer could be NULL due to disabled config option.

As Alexei suggested we could check on that in get_helper_proto
directly. Marking tail_call helper func with BPF_PTR_POISON,
because it is unused by design.

  [1] https://lore.kernel.org/oe-lkp/202507160818.68358831-lkp@intel.com

Reported-by: kernel test robot <oliver.sang@intel.com>
Reported-by: syzbot+a9ed3d9132939852d0df@syzkaller.appspotmail.com
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Paul Chaignon <paul.chaignon@gmail.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Link: https://lore.kernel.org/bpf/20250814200655.945632-1-jolsa@kernel.org
Closes: https://lore.kernel.org/oe-lkp/202507160818.68358831-lkp@intel.com
Assisted-by: LLM
[ Backport to 6.6.y: Apply the function-pointer validity check in
  check_helper_call(), because this target has no get_helper_proto().
  Refer to the target get_func_proto() callback in the tail-call comment.
  ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2025-39990 to 6.6.y.

The helper-validity check is applied in check_helper_call() and its
comment names the target get_func_proto() callback. See the bracketed
backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 kernel/bpf/core.c     |    5 ++++-
 kernel/bpf/verifier.c |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 9fa984ee076bccbf5e90eb6a194cec68f2351200..bec8876f12375bbbe00d8cbe5ee7d410e48ecd88 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2959,7 +2959,10 @@ EXPORT_SYMBOL_GPL(bpf_event_output);
 
 /* Always built-in helper functions. */
 const struct bpf_func_proto bpf_tail_call_proto = {
-	.func		= NULL,
+	/* func is unused for tail_call, we set it to pass the
+	 * get_func_proto check
+	 */
+	.func		= BPF_PTR_POISON,
 	.gpl_only	= false,
 	.ret_type	= RET_VOID,
 	.arg1_type	= ARG_PTR_TO_CTX,
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 778a68bfb91dd4e765252cfb1bacb4b658d1381b..a72e1561464cb94942afa723e57c76f032d30dc0 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -10091,7 +10091,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 
 	if (env->ops->get_func_proto)
 		fn = env->ops->get_func_proto(func_id, env->prog);
-	if (!fn) {
+	if (!fn || !fn->func) {
 		verbose(env, "unknown func %s#%d\n", func_id_name(func_id),
 			func_id);
 		return -EINVAL;

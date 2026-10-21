Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602890;
	b=vFF9oGecRbyfIqNC8SVxogMcvPnum5fdQ9M1Zogz2zLaHabjBSNWcpq5ztBctgG6I72/
	 fyzY822aQ6RAnUvnXesNX+g0sKrgdhbWFQwMObr9IqosvlG2dVbr/m/bVEoAaTi/PQBdr
	 JZSnkO1rdZxftcX/5nt18QeeMTQYTyrlav4P1khWxlI+5HdefkruLbd9lxZ0MT/BOnnGs
	 WL4Nml7QgXRvkIrbNbq7YxAE/zrNc3uL4FNY2lekP1m5J4088qP8zn3DWHxhSbTb+cQVf
	 QgHJGc8GFvleIbTf9SRpYD6Om3Up9u7xW1KnM57ZiPpFbsvdagoAO3vqStycqVc1krw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1LfQgKp0ztlf0EQ9y2RTrGf8UOpxokWsfVnFXAkS3BA=;
	b=eEP9VryBXPVzEZ0528cFkd4c9czkdnp7a8VxA32L3WJQAaenNYJO+tY4e7+RJBticPHd
	 lpumgwBEOdoM9yrcQP2hu6sIMPiCJuoDOCFz+frdjvZZjA8P0aEafmrqg+u7DgLP1air0
	 mMZKNqC55E7KpBo1zJuWaLr+UZZAjgg4qoUAb28YYDQs7sy+7lsx4dtciAhSMhj9LbQIR
	 oZKa8xMIzjeC8g0QAW5N12KOm5zO1hk2VRysgGDVvSt3FG85rbm0Vxv9bBV+WaKBEUqc2
	 gKaU46XABWwojiBD95aWmPFv4DRq/YcYSm76pIaJChRA6HXAUNZhBxKVTzMbEJvN7wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=gyrnnNCA;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513F3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=gyrnnNCA
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-368581df789so85170eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792602889; x=1793207689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LfQgKp0ztlf0EQ9y2RTrGf8UOpxokWsfVnFXAkS3BA=;
        b=gyrnnNCAok29B5+xIlr8Sc9LwxGU7weiLCTmja+5PDQ51jyX3L5E5jTHOBbHvb0EOc
         aJmUsu4f4VKzJPm5US+CpAyN5P2V5jP+qTW5fj4+oDwJMLPLuSc6vEZGUmrLnaR9Amq/
         CU2qjlqUvJHRLfize0/hrjt5c5q7ZzD6uNNSl4FxxDj8VuM+CXyUSxaIi0ffJdgPj5Vt
         VpV3uo1gpyhDLsla4BpwksK6CL+A/wY69psQHhtgUX0ZyQnzOCOWYXjdql7KS4m9elLR
         9fpDiFDNS9Qq44+MEgYuJVMmWY6DhP+MeHFXY5UOE6v1hlte2/M0dLUmowo/QwA+6BnO
         pQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602889; x=1793207689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LfQgKp0ztlf0EQ9y2RTrGf8UOpxokWsfVnFXAkS3BA=;
        b=de/KkKtDuxAeUei9/CSFTWvtfiTZfy6u5erpNK19jDYgmQ5ckp3UKCSuuIAGlndORs
         6HJXBLWrCqlhznjy9H14EkJ0nQJ04hwXofZt/Rgx1L46qIbuELpNrxcOmioARdCHHg7A
         AHjsnD39fCmI0Csp42jlop54LDLZMh7rp+glHf+Wnfab1PWxmljqW0/jQ7P23w7NsaYO
         i8ykvCCIxpEproYhvMKje4xNLANH7VZjKgZs9Jc3CjaSc5heNHgRXDbDsgq+JTCUAUo4
         iPt8K6QMyrWMWrqN5vJsdnivi6i7hlmASativmAbrSYPG7Z3oqUlw/8lsu4d/QhUIFtw
         nQHg==
X-Forwarded-Encrypted: i=1; AKwUvBy+gsocorhJ17VBMTeUusrCvGMLMX7PhhU4dxZGpRhq9wYpS5Uk79T15ntCfqVLHEaHgjaeT3wRYI6NlH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrgQecK/32Foa2u/2IX7NxujN9/zhWN6FtCXNmCBmY+0tI27Ea
	hZ5I2Pf8zHDeb1OwRfbIywMjR0uCa6R0cWK5WlFm7g/m6GSTGlOnin+/xYFOknXwYfM=
X-Gm-Gg: AYBFou2TZyitBU9admOJk9XF49/LJrHLxwn0c2w2mlvBbQ3py5XwGVy26WZ6v0sZY7O
	Hu2Ew17NDvz4Oel9b6dixqXPn1XZLganFcVKiBpZZJMQzT+qjyCLE2iwdJPqG1fqK0FAi4mO9vj
	drY4GONar676whKDuFl/aTME23AQxtlkMOZLa5DcMn+D8cqQ7KsrOMF5q7p9Hw4Q6+PcB5kOQ2H
	ASj1/l8RFJqfCwJyJrSLa9YEQFOhDizP3F4edWPXH98W9sT7oPUoZwgFwVi7wNhvvpTEd0HTkR3
	M2DmE4klCljBD4g9w6q/WYH3CZdKszcJDYDn948V9NBTWXU8f7A8yuZaRAYJAizvweljnFzpNT0
	//WcA6Ax9UJn0jXqys35tIEll0Zic/VdCLEBd+YySDtHqqvUVQSwAHFD3d6htxaaTQIWekRChSS
	p92zgoVZHkFNZuSPYEHU+JWXrJXAmJJw5YjcOE9x/6MeSTJR2XSl3lyiWoi87z2p08hTceNnCQe
	G9DZVcoMJ1ZwRpq5Z+5jpKpQKUGcKRjbWNJO82BXESw7BtoK8tRMRv8FZGas07FbJBhXlnawTDz
	dUDJtkIw+9Bfaxu7/b9v0SNnKsibsJj2ofBVkIWPPnqs2IZk8E6F
X-Received: by 2002:a05:7301:d804:b0:351:7848:85ca with SMTP id 5a478bee46e88-36888be04femr354554eec.7.1792602889175;
        Wed, 21 Oct 2026 10:14:49 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d059:e601:becb:a5ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm9458105eec.11.2026.10.21.10.14.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 10:14:48 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 13:14:44 -0400
Message-ID: <20261021171444.99931-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
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

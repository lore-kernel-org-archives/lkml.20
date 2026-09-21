Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC644B95B3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005630; cv=none; b=Rd9D6TH2xdG0HFQ3z+Mp/7Ei99J06uHAd40TGr3gVpedZhCULpub5JE+wp0kz+1ouJN2VoDbDWwwIQuhQ6IdEcJEKhE1oYiutl7sJwkQBPYb6vpo6X6ly/+TeOZFG1eDlG9lLeEHZwKgujxjbfzFCyFpS0LQ/tdnCxjE2F6/Uvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005630; c=relaxed/simple;
	bh=C4xwW2mOduY+1qJomfHxU2ms1BcQsIMtec0pb8iWWZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RfFkwFrbhvfd3MU5tKguj8plkVI4/Yoo40ZNjQFgsx5hmAJzMsj5udAEgJHidOL9afV2YZAXciyOjDpJbKgkzsfysFELmzr8ArGYUAK7x0sCU91u+V5aJu1FTD6zAtQDGP0813z3kZqkWbCVmUK0rnL9xbcgYOIgcvuNMrdaLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeY0AY4C; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeY0AY4C"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso167601a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005628; x=1790610428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqoyuLnxl7hAbksadhiNpkBzn5St1OFv+pfKgvkEAqY=;
        b=EeY0AY4CEzemyQ/eUCBkvoGnbNL7SrzBiOo5U8J+MEVOqEN138vceTAVwqSPSvTa6a
         TEOqD0VJAuS/nYTcJUrx/8Wjp3c2JX62gU+VgZ9JU4S8g0RhL2tDeaK7J0umGpgeFWSV
         sfkbJ0yLF2QYjMBXPFVMn8JxyshNORytUA7qt7plrdbFCcM5uypbDdBqpC0LYumyqyQW
         BwZ+KqBk0Oiv1waiMoSNXHq8q7Exo2eaEE3kf7L/gOAhinmpeROxEURbvr4v2WoIVWc/
         qnDebq1PeknrO2pCpJ/a9vOW7hgcjpewabTbUIFkMwKl4gYjRAkNKzy7SqaOZPmMnxwB
         zEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005628; x=1790610428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqoyuLnxl7hAbksadhiNpkBzn5St1OFv+pfKgvkEAqY=;
        b=iyvfRK5hyIi+Y1Du0k+v6d4fg8bcSLnwUlaTfXwsd1LLGY7vd0wBNGg70sGg5hi56J
         ZXoS0o2C+gnnHMGKqrE9Qh8J5D28Yxp/SKlQYEdHRDH45lD3PwFlyf8ihJFzUG4/51y/
         Ohk+x1AQg0As+7qUANIdMzFXbtvxmzu0GAzXCFjpc6l4CyeHrXA/iFyoALUjgHlDcZGC
         KyLrJsI7DjaWbFVMHQLwucvBK15ReKGZnRq9A0aJs32PTGvcdzX8UCCpHhEM+qP/xEJi
         QPVcZj4hmTCUrC1VxBuvE8WZ/Kh2XKUblXZwMZGt9GcUMneUsm1nUlNyqxkk2cBFyvp8
         rJqw==
X-Forwarded-Encrypted: i=1; AKwUvBzFcrsaTU/tZGo3jkFXNtpmmLx9PZJJADxtzr9Y8/vegtfjCCT/i+ySEBZLlrbt4YNu62Wh3exFl0UZPrU=@vger.kernel.org
X-Gm-Message-State: AFuF++lrauwQJ8h1z6zvS4xkv0RnWYo+GB3lWS0pTTK1Ljn/l0a2x4co
	DgFo8kzlYxRBX9zI/ePfbRlcD0QvOYsULl87PezqTjzZsD/hBSFPnhGi
X-Gm-Gg: AYBFou0sVJ9ZDF9S/KetisbI4aSmRLUgo/9tVKdYh4VdGd9rcISNcwnchz/7c3zLfBe
	QfnzJ/IiTBH+wf4M+4gy/qm/niiZZt+c/1FiRxVGpI3mHLk3wvtHvHpdhgK1zFAC7jrcRh2IBCs
	WfY8NQKSgRGMvlB1wQw+TeofJcclc2o+O1Rc/bzbHcNiIcpP44bkksCgLXtUncpEYZfDpt/H6F1
	ZBNbMv9Kfz9LSUT7fk68ewyqWAI+uYD/yHFbt3+9/wfh/Pi7zJ+pQHpHAFVc/qEcZiXdbi6mAMv
	syHfjivicFemb141JHI5+5P8ZCgMVzjm4FGvXogwzg2bmFtIdfucz09BP9f7czrkGKvJUX63Cjr
	ldEAT+0Td6GDBlY3ERaRySU4lHrLznowbUbdWXZ4Wrq3FMmSaDlPm+KSdRhfHG1ljar9YcI4gAP
	vUkmhu2slAWDJpNe4HWtk5RfxMUzQiO1LwtSZfRCH2Vf6y0CKfKE6PQEdFZNnFbLQ8J/arQWvis
	+dYkCqy7U7BfeCuBm9kfgJaw4VHU0IpAmd9SB2CDWj/b2Sm
X-Received: by 2002:a17:90a:d648:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-39e6c6a67b4mr9499408a91.58.1790005627594;
        Mon, 21 Sep 2026 08:47:07 -0700 (PDT)
Received: from archlinux ([205.254.163.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e554e5529sm7838802a91.4.2026.09.21.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:47:07 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev
Cc: song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] bpf: add diagnostics for rejected memory and map accesses
Date: Mon, 21 Sep 2026 21:16:50 +0530
Message-ID: <20260921154650.130677-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emit structured verifier diagnostics when BPF programs are rejected for
unsupported or prohibited memory operations. Cover sign-extending arena
loads without JIT support, read/write access restrictions on maps, writes
through read-only pointers, direct packet writes, and modifying helpers
used with BPF_F_RDONLY_PROG.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 kernel/bpf/fixups.c   |  5 +++++
 kernel/bpf/verifier.c | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 2add8001c3ec..b8baf77d933e 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -9,6 +9,7 @@
 #include <linux/sort.h>
 #include <linux/perf_event.h>
 #include <net/xdp.h>
+#include "diagnostics.h"
 #include "disasm.h"
 
 #define verbose(env, fmt, args...) bpf_verifier_log_write(env, fmt, ##args)
@@ -958,6 +959,10 @@ int bpf_convert_ctx_accesses(struct bpf_verifier_env *env)
 			if (BPF_MODE(insn->code) == BPF_MEMSX) {
 				if (!bpf_jit_supports_insn(insn, true)) {
 					verbose(env, "sign extending loads from arena are not supported yet\n");
+					bpf_diag_policy(
+						env, i + delta, "sign-extending arena load",
+						"the current JIT does not support this load instruction for arena memory",
+						"Use a kernel and architecture with JIT support for this arena load.");
 					return -EOPNOTSUPP;
 				}
 				insn->code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32SX | BPF_SIZE(insn->code);
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 3a676fc70f4b..ebfa53930276 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4365,12 +4365,18 @@ static int check_map_access_type(struct bpf_verifier_env *env, struct bpf_reg_st
 	if (type == BPF_WRITE && !(cap & BPF_MAP_CAN_WRITE)) {
 		verbose(env, "write into map forbidden, value_size=%d off=%lld size=%d\n",
 			map->value_size, reg_smin(reg) + off, size);
+		bpf_diag_policy(env, env->insn_idx, "map value write",
+				"this map does not permit BPF programs to write its values",
+				"Remove the write, or use a map that allows writes from BPF programs.");
 		return -EACCES;
 	}
 
 	if (type == BPF_READ && !(cap & BPF_MAP_CAN_READ)) {
 		verbose(env, "read from map forbidden, value_size=%d off=%lld size=%d\n",
 			map->value_size, reg_smin(reg) + off, size);
+		bpf_diag_policy(env, env->insn_idx, "map value read",
+				 "this map does not permit BPF programs to read its values",
+				 "Remove the read, or use a map that allows reads from BPF programs.");
 		return -EACCES;
 	}
 
@@ -6527,6 +6533,9 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
 		if (t == BPF_WRITE && rdonly_mem) {
 			verbose(env, "%s cannot write into %s\n",
 				reg_arg_name(env, argno), reg_type_str(env, reg->type));
+			bpf_diag_policy(env, insn_idx, "write through a read-only memory pointer",
+					"this pointer permits reads only",
+					"Use a writable destination, or copy the data into a writable buffer before modifying it.");
 			return -EACCES;
 		}
 
@@ -6613,6 +6622,9 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
 	} else if (reg_is_pkt_pointer(reg)) {
 		if (t == BPF_WRITE && !may_access_direct_pkt_data(env, NULL, t)) {
 			verbose(env, "cannot write into packet\n");
+			bpf_diag_policy(env, insn_idx, "direct packet write",
+					"direct packet writes are disabled for this program type",
+					"Remove the direct write, or perform the modification in a program type and hook that support packet writes.");
 			return -EACCES;
 		}
 		if (t == BPF_WRITE && value_regno >= 0 &&
@@ -11188,6 +11200,10 @@ record_func_map(struct bpf_verifier_env *env, struct bpf_call_arg_meta *meta,
 	     func_id == BPF_FUNC_map_push_elem ||
 	     func_id == BPF_FUNC_map_pop_elem)) {
 		verbose(env, "write into map forbidden\n");
+		bpf_diag_policy(env, insn_idx,
+				bpf_diag_fmt(env, "call to %s", func_id_name(func_id)),
+				"this helper modifies the map, but BPF_F_RDONLY_PROG forbids modifications from BPF programs",
+				"Remove the modifying helper call, or use a map created without BPF_F_RDONLY_PROG if updates from BPF programs are intended.");
 		return -EACCES;
 	}
 
-- 
2.55.0


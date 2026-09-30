Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DE30F7FA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733382; cv=none; b=ZVm2OFKUtShTzFsXo7ns+Ty41el5zz5/lMzsttmxhsYO+WpHmZS4/eE/1MqC/7GvQP0o2HxEpUFMSV+n1SlePU8PTYAKuPj2kiKmVsr+U2wwXqHu3elGtaOCrnPPSyy7OhyL4H6C3UUOslG4tMiB8r6c9eZuso+2BQIBOAPtNng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733382; c=relaxed/simple;
	bh=1X9WMm6nO73BSNX0XiXUwdgJyOm53vDdlYm4yIgxJxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gSFi19kTqkqxvZ4UPrlJMEhM15yu5TZ68dkUW5gyzp4VvJFWvdyG4YHUQfXRXqci8ZcpgexcwWBGx9EttevPhEi0k+sRo6XlMiURpu1insuP2bjwqUloqraJWefsJscAYTjKL+H+3m1WmfEx9n8SXfhBqFXpoC+6EWVECh5s+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2bUyoSJ; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2bUyoSJ"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso4140722e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790733380; x=1791338180; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jiokBM+2KkCvQhixHkz/hquXLtTM2q3HiYRP1LxboyM=;
        b=l2bUyoSJ3GvlejO212oCOWV6dxKy6yCGDY987zCfOEu5QWK1e6XbhkL8JFQDyZtQ3C
         tSoLOx4gtgg3ck6uehyGwut5Ed0AhqyfNw1wPZtR84K/HYLjdD/UmXM8EJkoDeKZKqaQ
         L8LiaH9ZSbPaeO4VvILrNwLhzJB68ZEWf7DQ3LhCUgyK8AWbEuszDWlKYWrfOvGb0Fdj
         QSr6nk5uzqynJQLdKv+2LdnwCgRsZKtKG9bLmxbH8U7pCUFwB481MrLuAhD4M9Fwsk1w
         FxicUGoh7JQIVw6VJJOnuH0XKB0kDvPs8ietoiwoq4Mv/tNOTjHvMzGD1pk/sKHZyCj0
         8niA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790733380; x=1791338180;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jiokBM+2KkCvQhixHkz/hquXLtTM2q3HiYRP1LxboyM=;
        b=iFhVKjmrxmWVtScAef/LXJKcpQNydGuTr2usTSxnEP99taAEm9lDtO7PkmKFjB0iVm
         KNlIR2G6V9OBn9HM1UgAC2CfimTQBOAtgBEcAPJ6qiAYguDOqZUPgki2WK9FXLu393kZ
         MVVEgwlmOHoEJP79ucBwEl44TEiqguJD6F7j0rwVb2/qUehopTrIkLyxybDUU+uYQ1+0
         Zf9eVXjU4GCsaNKJx6gd+cOPm48vchTU8jrYaU9pbQnfmOcJMAf89gPyB+rDRWss3C9E
         ig4oFZhRWv1o91WitRzUC8Qj3PAuD0y7MnvPYgrslG4sNc8HPBMfWhiP/ooll6MkRspH
         XOxg==
X-Forwarded-Encrypted: i=1; AKwUvBwenJxbWoVmiFGJHJun97QFqyIutQPZ9oaljSAoRhw3O+Y4ZR3oOIzxkiqgCor0s1yDLj6tMfVQt6E2+8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg+UuEr5nLNJrWoFEQMvdEcdn5Bl1A0W+a2RL/dbFoiizaW1Sp
	dbG1kMPfW6QGQcxm29KKMaLPEV9WsLhilOX4WLM4uP4j2TxX5LvWDG7I
X-Gm-Gg: AYBFou2EpwglrO3PbirOTdoZ2Hmz3rF7ANQ24u1/sP+Gr3P0/U4jWBUxWXjnw6UfQ0W
	XwDgzI5jxArhlG5qMsTqFn69TTVUDdauUG+FOxDmoI6ZmPYptxJN/kekfOG5bZdw/GWEVVtgGOh
	CAnHlwvYqnqjERpVUssBB3pkaCtgOK2/EGzhM7bnPBEOHEhvy14tzTyPtnGKeodbsNS0cVUVtoA
	SoH20aMw3XO89dJ6MiPmbJGINay88z/KlSLds5aWRY+TkMdFZsSnNJWCLWJ0rVZwDoPtUSw8J2R
	CRh4fSMXFyTImTW8QfE9H+SV40a7/NFTTz+V5twlFjAQTb//LbwgAavcwtz3urfw6KXIC09SPDd
	lr/rYAC/HSCC7+DvGKWHVjsfJcU1CScD71OD1JnOug2yF4xfEeGnkKNXEKbFpUQSBkrc8uTwPBv
	NWMoxFVHbdI2YRSczVr19/YefiMLEMThCkdMlPPSe4oxQUKC7BScC6e/NM9QBozaLmkEMBQ7+7w
	Ws=
X-Received: by 2002:a05:6122:da3:b0:5c9:a60b:e5a3 with SMTP id 71dfb90a1353d-5d518d1cd80mr613221e0c.14.1790733380036;
        Tue, 29 Sep 2026 18:56:20 -0700 (PDT)
Received: from [127.0.1.1] ([201.162.73.164])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d611ef88d1sm75525e0c.6.2026.09.29.18.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:56:19 -0700 (PDT)
From: Luis Vieira <luisflavieira@gmail.com>
Date: Tue, 29 Sep 2026 22:56:12 -0300
Subject: [PATCH bpf-next] libbpf: Fix cleanup on invalid CO-RE relocation
 offsets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-libbpf-core-relo-cleanup-v1-1-c9cd0b5775a9@gmail.com>
X-B4-Tracking: v=1; b=H4sIADtsvGoC/yWMwQrCMBAFf6Xs2YUaRYm/Ih7S9UVXQhKSthRK/
 91Uj8Mws1JFUVS6dSsVzFo1xQbHQ0fydvEF1mdjMr259NZYDjoM2bOkAi4IiSXAxSnz+ST2asU
 Z8aCW5wKvy299pz2JWEZ6/E2dhg9k3M+0bV/ntf1IhgAAAA==
X-Change-ID: 20260929-libbpf-core-relo-cleanup-43c979ca2cfe
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luis Vieira <luisflavieira@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790733375; l=2003;
 i=luisflavieira@gmail.com; s=20260913; h=from:subject:message-id;
 bh=1X9WMm6nO73BSNX0XiXUwdgJyOm53vDdlYm4yIgxJxI=;
 b=Bn/0lWwFEpY7S3B8Rsy+c1fIhaeeLisr7wrbpQ2S4GeqhDfo8rNM/Yhhd1XUwbm/S8Gm4PTzq
 X2hHpAhaF39CFO+DqEdowIcI1ROjX4CDjh1r0hPVt0+nM2yIRVi9GuL
X-Developer-Key: i=luisflavieira@gmail.com; a=ed25519;
 pk=98MeC/NdrC6ah7zYpPnkWiQIoyj62iUP/rNuV3esCW4=

bpf_object__relocate_core() allocates a CO-RE candidate cache before
processing relocation records. Two instruction offset validation
failures return -EINVAL directly instead of going through the common
cleanup path.

These checks were moved into bpf_object__relocate_core() when
bpf_core_apply_relo() was split, preserving direct returns that were
safe in the previous helper but now bypass cleanup.

Route both failures through the out path so the candidate cache and
target BTF override are released.

Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
---
 tools/lib/bpf/libbpf.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 238e35c1ee3f..fdd69aac39bd 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -6255,8 +6255,11 @@ bpf_object__relocate_core(struct bpf_object *obj, const char *targ_btf_path)
 		pr_debug("sec '%s': found %u CO-RE relocations\n", sec_name, sec->num_info);
 
 		for_each_btf_ext_rec(seg, sec, i, rec) {
-			if (rec->insn_off % BPF_INSN_SZ)
-				return -EINVAL;
+			if (rec->insn_off % BPF_INSN_SZ) {
+				err = -EINVAL;
+				goto out;
+			}
+
 			insn_idx = rec->insn_off / BPF_INSN_SZ;
 			prog = find_prog_by_sec_insn(obj, sec_idx, insn_idx);
 			if (!prog) {
@@ -6283,8 +6286,10 @@ bpf_object__relocate_core(struct bpf_object *obj, const char *targ_btf_path)
 			 * relocated, so it's enough to just subtract in-section offset
 			 */
 			insn_idx = insn_idx - prog->sec_insn_off;
-			if (insn_idx >= prog->insns_cnt)
-				return -EINVAL;
+			if (insn_idx >= prog->insns_cnt) {
+				err = -EINVAL;
+				goto out;
+			}
 			insn = &prog->insns[insn_idx];
 
 			if (is_ldimm64_insn(insn) && (size_t)insn_idx + 1 >= prog->insns_cnt) {

---
base-commit: cc6010e6e5cbe1f743d3011991041f227d976a5e
change-id: 20260929-libbpf-core-relo-cleanup-43c979ca2cfe

Best regards,
--  
Luis Vieira <luisflavieira@gmail.com>


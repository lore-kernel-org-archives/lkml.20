Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352198;
	b=0Ro53xno145d5Nv12QVCBUVuNL2IfI4XfNieuY9h+M10bXx9X0m9YeUShq/6I0I3J1p1
	 BiR2P/lj5N3cHNBkTd1WjC5CQNwVA/NmjFgENGQ5+Tyq9LLoE1zw6bcWC3QbJojVIe7lQ
	 snMcXoVIL//imi/p48/MRpVwpsxvcsG6HAJy57KtXtTi1faHVqJ1pjTdB7TsWDvA+8C1j
	 qTUZAiyO0DNXnitDNkwiE7CLuv2SgntKQsa4HqoAb0VeZlcLFC2gpAyhsjQGNEzePbVHy
	 IlksamFxvOPsAjReNP3FZZQ42OoVdtAOpDNxL7knkH7SixTpm/QZJVN6/PplABsXwBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JAuZVLYEPLoEITPcQc7Yebtk0mlDdnLB2+PWyq4KYq4=;
	b=DlO4s+8hJApoJeTx58X6k5uNFFUxyrIenDHqxLwGsRpTbh9V+JtHVjfkvmmxfzyXXoDX
	 lgvcO6dV7yFTsMslenzEDOYnfXG0xd4Ztu6i2LZ+bJEDdV4vtLP9Sm164nMpuq23+USbG
	 JXk65kZAPCot6YFR543VLLQ/zzTKzMONDtlRpBox0MulQznFdn+/yU8oq0i6QprEAZ+Mc
	 A/dhEfPx5+8QQEAhRterEdNglBEce1tBI5qKHuBo1U6m9XQU+5/x9Ee/HF4FqWnLQDL+r
	 Rk0GIGbtIsyzijaAa8arIIn75zSi79eJpDTumhLlLntXrBix0VfHQrDYtiARwlJlYrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RlUGkL6U;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B341606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B341606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RlUGkL6U
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so3115305e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793352196; x=1793956996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAuZVLYEPLoEITPcQc7Yebtk0mlDdnLB2+PWyq4KYq4=;
        b=RlUGkL6UQIf8N+8QfoyQMOAtrl/MGzXwj1MTtmRX6sSAL6Oe7Psm+JoPST563PChA1
         +8n8iwDYnw9iOJwugMG6AynJozQnl+0+b4HC8dYknuPTSzyTllJG7DtqHspj2pcAR08y
         hqwmfB0TXpYkQ60kC1uZjPOdoJnTJ+3RCoibIAw5Jqps+EKWlm6IKY5zr9EdSPhzwbV/
         4PqJXRyT9azEkf0jnr0OAHBOhhKSBPLBhd78HaRtDT2ufeTsZkIzWeTzI0v/rEUqcLtr
         B76/K+3lZcqjFQk6UMNeUvo7DeXiFO0XJqz75zNjlXEd8jL24DK8N868ojdfhUu3nYFv
         sK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352196; x=1793956996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAuZVLYEPLoEITPcQc7Yebtk0mlDdnLB2+PWyq4KYq4=;
        b=Og1gg2ryeawxk6zqqIEOl+erQ76M0EdNHWugtY3qnGQZGEMwKwNtvp2Z7w2CGM37iz
         ZSiAAftjqiggOPI/dPD2hKzK3F5A5LY8Jn0SHS0TEjEgmy+2SHB5YpQpNApRAQrR5TlQ
         gPwhFN7pWQWUV98IIjWsHcEwkkfG2kcCJ3vpev00Wa8yDBwjiap6sOLB0LFbILviVaWH
         lwAYjbKdNoA5TBbvIwIP5huxS4KCBgYLYlu63Ejhnr7F/u5e2FiZ7/9u7AQYYnryZO65
         USWTZJr/6XBe3fXiS8//uxkaCSzlUpKnH1al/aNenZqAzj2+Yohx4oCGkZyr133X+ux3
         mlmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz509W0iLPPPu7HAW6+mF9tJTIu2X0lXbNa08ETnZSING/1pRNELi++lQP2GKWF03R2X5JEKW6aL49pACQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk0G5l755JRiXntHhCTTpUko4IDLX1ifieKE4qbFZ+srp4ImLv
	Z3kFU0SY4PBNMXzlOXLTTqs5FnkYpl/j2/Eb57NLk0RlQbPGwGZz3cK6
X-Gm-Gg: AYBFou2Msq47egnQi8zAN90GQiDYVhmGkTLGvPtx4I7lmHzqv+ay33Uk6pE7HWg1whc
	dblKkH+22yQTGSdZib4dEwiiw+nrZ8FWY5uzobgk2vIKMyhkHcwF7bsBFUYlRDzP+RNtxnjEa/E
	eB+BwjiwNHxUMZMHfd10dxtcSgMhm1fUpASMu+WPGcVHH5cQuQ0ykOamuSacusG23jYrqMFnnTV
	//TxwM9HEkuuExC8HryIwAZ1ZYs1FRGs+zpAOEACngBZj9dZJx7qGOisZe9E2exkQGg2Aov5740
	O40bPMgvNf/oCROPEV6pWoTHmcoJxDHnUHJqpNl25k0ZI+KTmSVj3yNQqsYvHaVD6YAsYf2P9iH
	q2tB1fBnP2wt2cKvP+SeEcoYxXOi7Mezq2QJxmz7/Ydnnkop2bhE2KniMGUiDcuy0Zi6f6hHU6n
	kdv7qAS6D9TJ1nTuojDq+hz+vNj2Z/aYyLkDGSw2gU2/VIj0baCuDCYUG+dAYj6PkfjphiUYiiT
	NDdqzFt3J9sfDe0oTcWBBrYEs/1Z69mk6fa8qQJg7HIiy+3FmKQc78YBrmk9IGh2oL41YLzUsVK
	I5rAgtChcm5pDiScs/Fkfhf1ZQJHys9FwTxxrlM0o4W3Rc1lehGmzubsFNGKNq0hIvDNenjeIQk
	Ux4t93cQQuBW1IG7mmh1ayw==
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr33393895e9.23.1793352195788;
        Fri, 30 Oct 2026 02:23:15 -0700 (PDT)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm47072665e9.14.2026.10.30.02.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:23:15 -0700 (PDT)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	linux-kernel@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: [PATCH bpf] libbpf: Enforce program limit only for loaded programs
Date: Fri, 30 Oct 2026 09:22:48 +0000
Message-ID: <20261030092248.7388-1-mahe.tardy@gmail.com>
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

As explained in commit '259172bb6514 ("libbpf: Fix gen_loader assumption
on number of programs.")', nr_progs which is obj->nr_programs at this
stage is including subprogs and autoload=false progs which are filtered
later during the generation.

Quoting Alexei, previous patch 'aac5ba0a4d52 ("libbpf: Reject excessive
program counts in generated loaders")' does move rejection at gen time
instead of load time, but some programs are still wrongfully rejected:

  Two objects with obj->nr_programs == 33:

    object               before aac5ba0a  after aac5ba0a should be
    -------------------  ---------------  -------------  -------------
    33 progs             -EACCES at load  -E2BIG at gen  -E2BIG at gen
    1 prog, 32 subprogs  -EACCES at load  -E2BIG at gen  loads

  The second object fails today because of the cleanup loop in
  bpf_gen__init(). It closes nr_progs slots of prog_fd[], and
  prog_fd[32] is at r10 + 0:

    r1 = *(u32 *)(r10 +0)
    invalid read from stack R10 off=0 size=4

We now clamp the loop generating the cleanups, which may still be more
numerous than necessary and do the actual E2BIG check just before
writing the actual prog_fd into the stack for the cleanups, after
bpf_object__load_progs() has been doing the filtering on progs.

Fixes: aac5ba0a4d52 ("libbpf: Reject excessive program counts in generated loaders")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/gen_loader.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
index 80a6b5306183..555d4757a898 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -122,11 +122,6 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
 	gen->log_level = log_level;
 	gen->nr_obj_maps = nr_maps;
 	gen->max_func_ptr_maps = max_func_ptr_maps;
-	if (nr_progs > MAX_USED_PROGS) {
-		pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
-		gen->error = -E2BIG;
-		return;
-	}
 	if (nr_maps + max_func_ptr_maps > MAX_USED_MAPS) {
 		pr_warn("Total maps exceeds %d\n", MAX_USED_MAPS);
 		gen->error = -E2BIG;
@@ -144,6 +139,8 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
 	emit(gen, BPF_MOV64_IMM(BPF_REG_3, 0));
 	emit(gen, BPF_EMIT_CALL(BPF_FUNC_probe_read_kernel));

+	/* nr_progs includes subprogs and progs that are not loaded */
+	nr_progs = min(nr_progs, MAX_USED_PROGS);
 	/* amount of stack actually used, only used to calculate iterations, not stack offset */
 	nr_progs_sz = offsetof(struct loader_stack, prog_fd[nr_progs]);
 	/* jump over cleanup code */
@@ -1139,6 +1136,11 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
 		gen->attach_kind = 0;
 	}
 	emit_check_err(gen);
+	if (gen->nr_progs == MAX_USED_PROGS) {
+		pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
+		gen->error = -E2BIG;
+		return;
+	}
 	/* remember prog_fd in the stack, if successful */
 	emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_10, BPF_REG_7,
 			      stack_off(prog_fd[gen->nr_progs])));
--
2.43.0


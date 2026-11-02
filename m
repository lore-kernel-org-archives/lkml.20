Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623034;
	b=t6DrhhcnBuB1eDbPTbn4v21Ea3XA06fM1EIZBuoz9hWXtFBrKbibA28TSf23j9IC+sQV
	 59IbcUz5zRsJt7q/o2fqLIlfN9MrBBEAA+qt8erNeQ2zwg3tWpuQjMahAFXsGdd5sjZzt
	 OaGbGsb9ClE65ykE+E7pErZdA+gx1iiBe9wM48NrOYtiacQP/vhv8qVkh40ee6I+Z1git
	 ZdkRMpldcPOX7x+3vFPayypt7Ctg1iZWrw6Oo2BdlrolixHJsXwgGt1jgHmeP+EtmaFZI
	 ixf0sTZi5Gpo67zUiSWbUARqdT/5x8RjpifsNBHEs+uagwmM6xlsu1jKc+MLkGZbguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U/MTiY1V0zUX7TqOPFUlo7c3lUS2apbndjwJUhDa+Ak=;
	b=N5ywNfQ9dzO7Zq9v/9Dzdy5KSiigb6C4TKYyrfug5zeXTy+N6PDe/Ef5APfgpGqKODQx
	 OV1xHTxiIt93Qo0SocbjIaQX65+vz+U0znDhFnI73n0cGvoFn0FgxboiQ7JeR40zIi8Uw
	 xr9GI4SwYenp2MWCXQTwwIIUk8iC80eXLqIXBtLg7fcwxmu3Iz3Tcfzi8AJq2Qo2zgm+T
	 sUXLpC0I0nCQgL2lUkVPqod2ASCmulcsqRkEAqm417Q9b+w67wwXOHqmFHB5rpGaaGnXR
	 R3EEmXazH/Fqoa62UptehxwnCvgxCf6ntPJRQheoVMtcoF1HSjxX6E4MMxGGxfm4++A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhpDXLq7;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219CC606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219CC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hhpDXLq7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so5993964eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623033; x=1794227833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/MTiY1V0zUX7TqOPFUlo7c3lUS2apbndjwJUhDa+Ak=;
        b=hhpDXLq7zFo/Yz4pfSGzL3ZIgyuvIihlgymMJdmmDgl15ebCTDxI+fPvf+j7CDxuFW
         bp+EYpoGPrbWFrgyeA+2Pro6qA9o9Nb2WIzh+J5KbBSsX0gn4TnC6HqFK+nwkQi3lzaM
         Gjazrm8uWGY1Xki/C24/F/0qBMSDLPf74m2dP1DO6hVwlK+kf+UHl14d4AS5hpq+VEw0
         nyhmMxZgzoqQCcQz/PuaiyH5lqmKZAEicpKfogUdyiNGYIRwPGL8e+EbXjSFBe/r0VgS
         fFZLXAvrr1saS/WWIYlfxlqmgVpqEc6XNFOlh5pFKh24UQDC7MH9txxmEDHA5TLmjy8H
         gMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623033; x=1794227833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/MTiY1V0zUX7TqOPFUlo7c3lUS2apbndjwJUhDa+Ak=;
        b=qSgQl+6qEtxhKEUln/mBC5kpFVZ4KApjC0nJqHmoMgR0H7EeL+ZZfCm5i1yTSbPtqX
         nY8s6QBTeCx/p50mHanlBW8XF3HP2ii7QJgNvlIbcwmVhbywFGBMLSnnsAgJYb5lfPtW
         86ddwV9+wxhZp9IYGvWgt1rVZMVT1YXHMI+js0b/5xTll39YdY075bGz88QEY1wq/w2g
         DIFjof5tS1lV5WtWRAOb0Wzrej75Dj1KrYGupjxZUAP+8L4JB2GYAmLACWaymyVycZ9W
         pI2jj6sZqbN8H8K83+cTqSGUH2mpjUjjT0vd1K6Gn36JvaLctKEJWb2YVVayVfrogh4B
         kSMg==
X-Forwarded-Encrypted: i=1; AKwUvBwcGrFzEUxCBA/kAh/AfabbU70AvjCJqRMdzY7/p6ZVeL9PPimJMo8HzAwkUSAD5cmY7K7rD5H0oKVwe64=@vger.kernel.org
X-Gm-Message-State: APuU4Z9trBs0xp7XwUjVq0edWfFX8SS0HUrUC0UMYSGlg/S2nEQdVneO
	EmsqCIeWrsBWHFKQCxtcQYHTCc6MHrcvnb1wiN4HV+pJW4qsLJnDjeQ/
X-Gm-Gg: AYBFou3PTOwC/AbBFWYPxIoa7wfDAkgeq1YFsFSrM1ESu+8VmWsaGys0kkLQSsVOb3P
	M9xk6gQjbKSH0ekFsYIflSBQdrsRfn6vQKhfNDsW5kqszR0YbqhPnwlNyW0xxBqDu6Ti4MrTA59
	CSPD0W2bZu4ByH05vh0XhgM2mr8PhfhwQ/Q6eHRjRx93JajFpnErmvJkNonHxB8QTB8h+4rR18g
	zy6nhzigF7TTxa1720j8YOyQLM2y0ECtG25UnX0vU4aLgRtjwftT9GG4xhMMLyipdtnANWxG13K
	pdUtNyOxKyFSh2fpmqrzh6YdsbO5HBaH/FSenkQFPFw1IB9X268a9LWPPr8GuyAzjjJt/igc9KN
	mQsRMcnEE4ONBLhXB/1maoZvIeKZIJG3K8ol+Hhzsg/kK2deyO17CnxkuNqr861X6jeNFuBbj37
	JRrktC9rfBUXm4sQsP2X8JQshK3bvU9yUWKGmrWKY+9X+ljBGa8frTui5+xUbgj38lJZ+TlkHlD
	f2sxhaaubqb+1eh2nbC8DKQKs7sENQHqEkaMMBEIGX+NCEF8xGXHclv9D9uHM10ETC6Ojd8bD3+
	3E8SM6Jwqog0Jylj3NkgjW/0PQ==
X-Received: by 2002:a05:7301:714:b0:35d:7565:8577 with SMTP id 5a478bee46e88-36a6524b024mr5497839eec.15.1793623033018;
        Mon, 02 Nov 2026 04:37:13 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:12 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:37:01 -0500
Subject: [PATCH bpf-next 1/5] bpf: Put the line info back when the JIT
 falls back after blinding
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bpf-blind-nops-fixes-v1-1-844300e42cdb@gmail.com>
References: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
In-Reply-To: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_jit_blind_constants() blinds the constants of a clone of the prog,
which shares the aux data with the prog. The line info moves with the
blinded insns.

When the JIT then fails, the kernel goes back to the prog that isn't
blinded and runs it in the interpreter (CONFIG_BPF_JIT_ALWAYS_ON=n). Its
line info keeps the offsets of the blinded insns. A prog of 4 insns with
a line info record at each insn, loaded with bpf_jit_harden=2 and an
allocation of the JIT failed through fail-nth:

  xlated=4 insns linfo: 0 3 6 9

Keep the offsets from before blinding in aux->linfo_unblinded, and put
them back in bpf_jit_prog_release_other() when it keeps the prog that
isn't blinded. Free them either way.

Fixes: c454a46b5efd ("bpf: Add bpf_line_info support")
Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf.h |  6 ++++++
 kernel/bpf/core.c   | 29 ++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index a80e81ca19ec1..83b3688f176e7 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1963,6 +1963,12 @@ struct bpf_prog_aux {
 	 * using the linfo_idx.
 	 */
 	void **jited_linfo;
+	/*
+	 * linfo->insn_off of the prog before constant blinding, while the
+	 * blinded clone is JITed. The kernel puts it back when it falls back
+	 * to the prog that isn't blinded.
+	 */
+	u32 *linfo_unblinded;
 	u32 func_info_cnt;
 	u32 nr_linfo;
 	/* subprog can use linfo_idx to access its first linfo and
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 0586ed0203975..d45a82f1a42a5 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1762,6 +1762,17 @@ static void bpf_prog_clone_free(struct bpf_prog *fp)
 
 void bpf_jit_prog_release_other(struct bpf_prog *fp, struct bpf_prog *fp_other)
 {
+	struct bpf_prog_aux *aux = fp->aux;
+	u32 i;
+
+	/* The line info moved with the blinded insns, move it back. */
+	if (aux->linfo_unblinded && !fp->blinded) {
+		for (i = 0; i < aux->nr_linfo; i++)
+			aux->linfo[i].insn_off = aux->linfo_unblinded[i];
+	}
+	kvfree(aux->linfo_unblinded);
+	aux->linfo_unblinded = NULL;
+
 	/* We have to repoint aux->prog to self, as we don't
 	 * know whether fp here is the clone or the original.
 	 */
@@ -1808,6 +1819,7 @@ static struct bpf_prog *bpf_patch_list_apply(struct bpf_prog *prog, struct bpf_p
 struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bpf_prog *prog)
 {
 	struct bpf_insn insn_buff[16], aux[2], *last;
+	u32 *linfo_unblinded = NULL, nr_linfo;
 	struct bpf_patch_list pl = {};
 	struct bpf_prog *clone, *tmp;
 	struct bpf_insn *insn;
@@ -1816,9 +1828,22 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bp
 	if (WARN_ON_ONCE(env && env->prog != prog))
 		return ERR_PTR(-EINVAL);
 
+	/* keep where the line info is, for a fallback to 'prog' */
+	nr_linfo = prog->aux->nr_linfo;
+	if (nr_linfo) {
+		linfo_unblinded = kvmalloc_array(nr_linfo, sizeof(*linfo_unblinded),
+						 GFP_USER);
+		if (!linfo_unblinded)
+			return ERR_PTR(-ENOMEM);
+		for (i = 0; i < nr_linfo; i++)
+			linfo_unblinded[i] = prog->aux->linfo[i].insn_off;
+	}
+
 	clone = bpf_prog_clone_create(prog, GFP_USER);
-	if (!clone)
+	if (!clone) {
+		kvfree(linfo_unblinded);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	/* make sure the patches go to the clone */
 	if (env)
@@ -1883,11 +1908,13 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bp
 		 * 'clone' is still valid.
 		 */
 		bpf_jit_prog_release_other(prog, clone);
+		kvfree(linfo_unblinded);
 		if (env && fatal_signal_pending(current))
 			return ERR_PTR(-EINTR);
 		return ERR_PTR(err);
 	}
 
+	tmp->aux->linfo_unblinded = linfo_unblinded;
 	tmp->blinded = 1;
 	return tmp;
 }

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361122;
	b=a0ophJ+nbZUdTc/4N3a8AggVnHrIZrLnYNjzwdT9ruA/Zab3iSrJGd5N54Rsqlmnk+vr
	 VOXJxuX+S/s3+eyBpY71DAnkIbfjmYZnYacd7Blkzl4WzHYxuKP2NoXkVuu3aQqPwjXMw
	 H+a4B1CyDqD3MAB0OV3ApVh9v6n1pFDEqggwuN15ImEDbvb7aJYvOo9D5++TQrJDkp1WG
	 www9gcJ7DaIIinkeF4dKSZLtmwEG+23+ntSQt/inoMu/6ZF3Bn16kEX+af9XKEw52hFR/
	 YItiCKRvD6QOU+8j9gILO6GOWXyY+S44O6bVrI5OdzqSEwWv/Lyt4v+cywsyjI2pXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8K83MvirmLcedwTYF9Q4UGI3XIPEELC6zheJN0q7Km8=;
	b=sjJ6j2muWu6bzk5ayiRqycveBPgaKMmbmmhN+Jm9EJ/+MxY8P7D70lIHRa7ylTM7LeAv
	 Yvh8tSNB97HViLh2RcublWsumrxrXe8jOPXDLnfS8uwOmPOoe4ddZM1X7jFFpnUC29UAU
	 poYGodjcuXrFm87PVz10Ais4ot/OjZoRK8mdd2gfCRMstmCOZzPVQmNU0EffWd+pGfrUO
	 ZzvXjH8SGzWylNKMqPOtfYsLoQzRc6yyOm6Jgdjgjk9ehZ9eMDSwLQcm1IR86UcUwO6Qf
	 6tgPdRMas0vm9nNhQhqSwNtOx7giY0OrnbhJ7PSgjnLZMzgKaWWmWoZmiPLLEWOssiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eXWG5/Ci";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC5606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECC5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXWG5/Ci
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so718312c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361121; x=1793965921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K83MvirmLcedwTYF9Q4UGI3XIPEELC6zheJN0q7Km8=;
        b=eXWG5/CiHLE2ofZX9CA7yn4yhNP+++MBTukCLVchIVP3wiGWo3MH85VA2CYCTWDATc
         5VVOF+ySJhG8R5/6RSsqivvQ7qDEH4EEEsGv0daTwWSYKxcjYDgzUYHSSc0fdul/r8ml
         G99nfWuFm9sYy80KCBn8Uetxux/+AID1xuyx62vmHKYl5Bjl2kvXmr29JJS7SCq48916
         jK1IVMvGhFCA7P00HkTPEJHY+3BfI6AD6+6GPArjhAHKUMdE5Yg5F8gBDh/GflsPYz7O
         SH1u74g9tybp177RDoXXpUXO98dGjWH8XyD2Kwt4FZDHRrAbvy2OtRJJJQUA137i3ZS3
         k6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361121; x=1793965921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8K83MvirmLcedwTYF9Q4UGI3XIPEELC6zheJN0q7Km8=;
        b=mivrD2CNRDJviNuiD+JkT4r2eZSwxbSh/LIWOQz4T/KbNsoXqDL3sQm+eFBFPibIBY
         W/ktdIkZKmmSFfJx/PBqzSNitBwVuGqgEMF10VVe/Ivl/PI+Ia30EOwpp6cNzN/+hs0l
         SaqOj0gw9hehWHzZuK0GfK06ZNonG9OoCWTUpZdQ5uNtJ6MQMYooLQkZlMblNFEwBPmH
         Hwlv1qxgyvU+y0piutlr7RELMskG9BmGX+QRO8aMUQsYnU/LEOpnJzLdIsq3Uqx+2jsI
         m8LtH/c/jXdESbNiV628+Gm/mYf5ZYp3JxjrqCiUyPdX82dIgQ+y5iYeOgH+Eu5n+/dg
         zLCg==
X-Forwarded-Encrypted: i=1; AKwUvBzukXtoPv8vCu7LhWxGqbqa/+r9ZUB89D426Yn8gye7uJEFoPMhRuu3FISSEekJU0My3YDQusQZlGvlJoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIz+P9XtRC0OtwQcn0YrDCwOAYdgw13rKCePlJ1a/S+Hlbm6U13
	jMbuFGDHGuHPq9XMAVBwVP3HABqkFxgZafTSTbjcQlBCtX7BiSSln3WbPnZnd+LC
X-Gm-Gg: AYBFou3ICaRv887DDFuvNccOMPHMSFG09FTKtlGBtfy3NH9aYQo0/75RDksFQK+dLw6
	p0kMlPvVikT/SRLvG8lC1xCctq0BncMD0CNPxuIYpu8JzbrUHL6qod/AU94AxmQSJNI+igJohqb
	G8v/LRJDZc5Hqwtu62/AfbjMQ1zmnNPp+PJSYNVwpSvtGZrIS6rrpOTrmm679vWtCjTRM0Yz7+K
	O1x3fImF78a/ou8NyXZUnlEnqzghKs/KGwwgwez4uG2OSikDs+GzYfIy/DM12SzyOmUQc6WlhRQ
	krQyoupXhMy5mPS3LtUppEAzTb1J+nmwprlWmTkKPpYSkiAGfk4Izmwl9ztLPg+Rs2pPrXASVIH
	jv0ixA9q87citXaR0YicmUMRKIomZnCdMwGBVacXCkrP9CAlOQqz0pgex/OxXyhB0eSWyc/6uPw
	4c+NDkM4eWQlfPxwatD0P1QTtUzc3XR1Yj94k886DSsjSM9Uiij14HHg2jvk3+e56ILCsi3/Ww+
	vaxVFsghHBwwTw89E69R5yZJNhFa4vPUABhxC2VB21blHetrTpHRVVJtQZnTAlVMEHsjiMXqOxM
	eG28dqL8AvWp+Ul8aSE1XyT9
X-Received: by 2002:a05:7022:eb44:10b0:154:dc96:c1d8 with SMTP id a92af1059eb24-1ac56c9fda4mr2899533c88.2.1793361121009;
        Fri, 30 Oct 2026 04:52:01 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:00 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:46 -0400
Subject: [PATCH bpf-next v2 01/22] bpf: Add a list of deferred instruction
 patches
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-1-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_patch_insn_data() and bpf_patch_insn_single() apply a patch right
away. They move the tail of the program and walk all of it to fix up
the branches and everything else that names an instruction.

A pass that patches M instructions of an N instruction program does
O(N * M) work. pyperf180 from the selftests has 930
bpf_map_lookup_elem() calls on hash maps, and inlining each of them
into 3 instructions of its 24k instruction program takes about a fifth
of the time to load it.

Add a list of patches that a rewrite queues against the unpatched
program, in increasing order of the instruction they replace, and build
the patched image from it in O(N + inserted instructions). Map each old
index to the first instruction of its patch, as bpf_patch_insn_data()
names a patched instruction, and relocate every jump that leaves its
patch through that map. Build the image aside, so that a jump that gets
out of range leaves the program untouched, and move the poke
descriptors and the line info along when installing it. Keep all of
this in core.c without a verifier env, so that rewrites without one can
use it too.

Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf_verifier.h |  47 ++++++++++
 kernel/bpf/core.c            | 213 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 260 insertions(+)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 5926f13ff43cc..a56a996b3d953 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -1060,6 +1060,53 @@ struct bpf_fd_array {
 	};
 };
 
+/* one deferred patch: insn 'off' is replaced by 'len' insns */
+struct bpf_insn_patch {
+	u32 off;
+	u32 len;
+	u32 start;		/* first insn of the patch in bpf_patch_list.insns */
+	struct bpf_insn orig;	/* the replaced insn when the patch was queued */
+};
+
+/*
+ * Patches queued by a rewrite pass, applied together by
+ * bpf_patch_list_commit() in O(prog->len + inserted insns).
+ */
+struct bpf_patch_list {
+	struct bpf_insn_patch *patches;
+	struct bpf_insn *insns;
+	u32 cnt;
+	u32 cap;
+	u32 insn_cnt;
+	u32 insn_cap;
+};
+
+/* the image of a program with the queued patches applied, see bpf_patch_list_build() */
+struct bpf_patch_image {
+	struct bpf_insn *insns;
+	u32 *new_off;
+	u32 cnt;
+	u32 new_cnt;
+	s32 grow;
+	u32 bad;
+};
+
+/* Map an offset in the old program, which may be past its end. */
+static inline u32 bpf_patch_image_remap(const struct bpf_patch_image *img,
+					const u32 *map, u32 off)
+{
+	return off <= img->cnt ? map[off] : off + img->grow;
+}
+
+struct bpf_insn *__bpf_patch_list_add(struct bpf_patch_list *pl,
+				      const struct bpf_prog *prog, u32 off,
+				      const struct bpf_insn *patch, u32 len);
+void bpf_patch_list_release(struct bpf_patch_list *pl);
+int bpf_patch_list_build(const struct bpf_patch_list *pl, const struct bpf_prog *prog,
+			 struct bpf_patch_image *img);
+void bpf_patch_image_free(struct bpf_patch_image *img);
+void bpf_patch_image_install(struct bpf_prog *prog, const struct bpf_patch_image *img);
+
 /* single container for all structs
  * one verifier_env per bpf_check() call
  */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 3030beb531d99..d2c36db09c8c9 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -531,6 +531,219 @@ int bpf_remove_insns(struct bpf_prog *prog, u32 off, u32 cnt)
 	return err;
 }
 
+static int patch_list_reserve_patch(struct bpf_patch_list *pl)
+{
+	struct bpf_insn_patch *p;
+	u32 cap;
+
+	if (pl->cnt < pl->cap)
+		return 0;
+
+	cap = max(pl->cap * 2, 16U);
+	p = kvrealloc(pl->patches, array_size(cap, sizeof(*p)), GFP_KERNEL_ACCOUNT);
+	if (!p)
+		return -ENOMEM;
+	pl->patches = p;
+	pl->cap = cap;
+	return 0;
+}
+
+static int patch_list_reserve_insns(struct bpf_patch_list *pl, u32 cnt)
+{
+	struct bpf_insn *insns;
+	u32 cap;
+
+	if (pl->insn_cnt + cnt <= pl->insn_cap)
+		return 0;
+
+	cap = max3(pl->insn_cap * 2, pl->insn_cnt + cnt, 64U);
+	insns = kvrealloc(pl->insns, array_size(cap, sizeof(*insns)), GFP_KERNEL_ACCOUNT);
+	if (!insns)
+		return -ENOMEM;
+	pl->insns = insns;
+	pl->insn_cap = cap;
+	return 0;
+}
+
+/* Extract the pc-relative operand of a jump, a subprog call or a ld_imm64 of a subprog. */
+static bool insn_get_rel(const struct bpf_insn *insn, s64 *rel, bool *is_imm)
+{
+	u8 code = insn->code;
+
+	if (bpf_pseudo_func(insn) || bpf_pseudo_call(insn)) {
+		*rel = insn->imm;
+		*is_imm = true;
+		return true;
+	}
+	if ((BPF_CLASS(code) != BPF_JMP && BPF_CLASS(code) != BPF_JMP32) ||
+	    BPF_OP(code) == BPF_CALL || BPF_OP(code) == BPF_EXIT)
+		return false;
+
+	*is_imm = code == (BPF_JMP32 | BPF_JA);
+	*rel = *is_imm ? insn->imm : insn->off;
+	return true;
+}
+
+/* Set the pc-relative operand that insn_get_rel() extracted. */
+static int insn_set_rel(struct bpf_insn *insn, s64 rel, bool is_imm)
+{
+	if (is_imm) {
+		if (rel < S32_MIN || rel > S32_MAX)
+			return -ERANGE;
+		insn->imm = rel;
+	} else {
+		if (rel < S16_MIN || rel > S16_MAX)
+			return -ERANGE;
+		insn->off = rel;
+	}
+	return 0;
+}
+
+/*
+ * insn is number 'idx' of the 'len' insns that replace insn 'off' of the old
+ * image (an insn that isn't patched is its own patch of length 1). It lands
+ * at 'pos' of the new image. 'new_off' maps the old image to the new one.
+ */
+static int patch_list_adj_insn(struct bpf_insn *insn, const u32 *new_off,
+			       u32 cnt, u32 off, u32 idx, u32 len, u32 pos)
+{
+	bool is_imm;
+	s64 rel, tgt;
+
+	if (!insn_get_rel(insn, &rel, &is_imm))
+		return 0;
+
+	/* relative to the first insn of the patch */
+	tgt = (s64)idx + rel + 1;
+	if (tgt >= 0 && tgt < len)
+		return 0;
+
+	/* the patch pushed what follows 'off' down by len - 1 */
+	tgt = tgt < 0 ? off + tgt : off + tgt - len + 1;
+	if (tgt < 0 || tgt > cnt)
+		return -EFAULT;
+
+	rel = (s64)new_off[tgt] - pos - 1;
+	return insn_set_rel(insn, rel, is_imm);
+}
+
+/*
+ * Queue the replacement of insn 'off' of 'prog' by 'patch[0..len)'. Patches
+ * are queued in increasing order of 'off' and applied together, so a pass
+ * keeps addressing insns by their index in 'prog'. Jumps in the patch that
+ * leave it are relative to the patch placed at 'off'.
+ *
+ * Return the copy of the last insn of the patch, which stays valid until the
+ * next call.
+ */
+struct bpf_insn *__bpf_patch_list_add(struct bpf_patch_list *pl,
+				      const struct bpf_prog *prog, u32 off,
+				      const struct bpf_insn *patch, u32 len)
+{
+	struct bpf_insn_patch *p;
+	int err;
+
+	err = patch_list_reserve_patch(pl) ?: patch_list_reserve_insns(pl, len);
+	if (err)
+		return ERR_PTR(err);
+
+	p = &pl->patches[pl->cnt++];
+	p->off = off;
+	p->len = len;
+	p->start = pl->insn_cnt;
+	p->orig = prog->insnsi[off];
+	memcpy(pl->insns + p->start, patch, len * sizeof(*patch));
+	pl->insn_cnt += len;
+
+	return &pl->insns[p->start + len - 1];
+}
+
+void bpf_patch_list_release(struct bpf_patch_list *pl)
+{
+	kvfree(pl->patches);
+	kvfree(pl->insns);
+	memset(pl, 0, sizeof(*pl));
+}
+
+/*
+ * Build the image of 'prog' with the queued patches applied in img->insns,
+ * without touching 'prog'. img->new_off[] maps each old insn to the start of
+ * its patch. On -ERANGE, img->bad is the old insn whose jump got out of range.
+ */
+int bpf_patch_list_build(const struct bpf_patch_list *pl, const struct bpf_prog *prog,
+			 struct bpf_patch_image *img)
+{
+	u32 cnt = prog->len, i, k, n;
+	int err;
+
+	memset(img, 0, sizeof(*img));
+	img->cnt = cnt;
+	img->new_off = kvmalloc_array(cnt + 1, sizeof(u32), GFP_KERNEL_ACCOUNT);
+	if (!img->new_off)
+		return -ENOMEM;
+
+	for (i = 0, k = 0; i <= cnt; i++) {
+		img->new_off[i] = i + img->grow;
+		if (k < pl->cnt && pl->patches[k].off == i)
+			img->grow += pl->patches[k++].len - 1;
+	}
+	img->new_cnt = cnt + img->grow;
+
+	img->insns = kvmalloc_array(img->new_cnt, sizeof(*img->insns), GFP_KERNEL_ACCOUNT);
+	if (!img->insns)
+		return -ENOMEM;
+
+	for (i = 0, k = 0; i < cnt; i++) {
+		const struct bpf_insn *src = &prog->insnsi[i];
+		u32 len = 1, pos = img->new_off[i];
+
+		if (k < pl->cnt && pl->patches[k].off == i) {
+			src = &pl->insns[pl->patches[k].start];
+			len = pl->patches[k++].len;
+		}
+
+		for (n = 0; n < len; n++) {
+			img->insns[pos + n] = src[n];
+			err = patch_list_adj_insn(&img->insns[pos + n], img->new_off,
+						  cnt, i, n, len, pos + n);
+			if (err) {
+				img->bad = i;
+				return err;
+			}
+		}
+	}
+	return 0;
+}
+
+void bpf_patch_image_free(struct bpf_patch_image *img)
+{
+	kvfree(img->insns);
+	kvfree(img->new_off);
+	memset(img, 0, sizeof(*img));
+}
+
+/*
+ * Put the new image in 'prog', which has room for it, and move the poke
+ * descriptors and the line info along.
+ */
+void bpf_patch_image_install(struct bpf_prog *prog, const struct bpf_patch_image *img)
+{
+	u32 i;
+
+	memcpy(prog->insnsi, img->insns, sizeof(*img->insns) * img->new_cnt);
+	prog->len = img->new_cnt;
+
+	for (i = 0; i < prog->aux->size_poke_tab; i++)
+		prog->aux->poke_tab[i].insn_idx =
+			bpf_patch_image_remap(img, img->new_off,
+					      prog->aux->poke_tab[i].insn_idx);
+
+	for (i = 0; i < prog->aux->nr_linfo; i++)
+		prog->aux->linfo[i].insn_off =
+			bpf_patch_image_remap(img, img->new_off,
+					      prog->aux->linfo[i].insn_off);
+}
+
 static void bpf_prog_kallsyms_del_subprogs(struct bpf_prog *fp)
 {
 	int i;

-- 
2.43.0


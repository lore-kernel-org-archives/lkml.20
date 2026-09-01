Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC513321DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245633; cv=none; b=Pxgx8IWHAEJ/RRtqskvgp988IaoSz11/NCg9dmJhagi0M3Ae3Ec87kjn+QbY7nyGGcrdTadGVTW0WWA1c636sy6GJ84hwnqQecuEYufBN0o+iDNX0leiKsQwy77EI6KJ7PIhj+GaYlUt0wKuDb5+qoTLGBmyaam4bcx7zwQ+2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245633; c=relaxed/simple;
	bh=EAN73CwP5GYNU4Aef57VO4fpEGSppas2T3CEp9oChiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZnBw9sTrlE5FWztwAU1tkzX0dFgTLx/rnJvRWCITc2u6Cn47vtZSko2ywwLkPa7iWnasVRXjxI1Et8Uv8d2bpftTrwBlNZpULcsCqCxAZYplSoObYBHnabKu+nRIhI3HHQb9WaH6ErkzHJF3HwZ8kcFHtgW6HXqBWZveWs+3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dNueY37O; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dNueY37O"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d942c7cc2fso4766695ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245631; x=1788850431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pqodk9eZGUbM+q/R0T+xK36vWMF9pQz22svUZwiNjm8=;
        b=E0B9ndNojB1EeoCv0WBPhk+Qv/i2lB2C0VBj7y4olOuVerNfvUjTuizd/fDJXNYPZI
         DN79gP427sVkUP7XyoQl8qac2KExFrEJI+diudgaEoG18HCAo2n4yElr/XTV7rI6K3sJ
         hSj+0b02ESer13i1skaYOXyZuhclUgudy6poPf0Y3L7+f8Um5gTMPcA2unxn/fqJNb0T
         HFGbUWKhMehCL65eRMpNm8oH1aqDxSCXbb4dqDfQRyZBaAMyZIX0KP278vnD93amG0Vh
         FFexUjtYr/GFf7g6j7zdFoHjnJAL02ivIudrpYy2zwwmJmHG5UlEEbRZU/jrB5ikpyqR
         GQpw==
X-Forwarded-Encrypted: i=1; AKwUvBx5++CHLgV1CP2PEj2V5VErvICYjka/roczQUDCbcCrWFD5GapaIdSaEt7uUrlyUodMWx2RacdYmIzQcDw=@vger.kernel.org
X-Gm-Message-State: AFuF++mYhAMuh0FQOJ44EdQQdKEY6tq/QeFIY/d2cjgAt1376FkHRjDP
	+aRGErxIeRm5vZjWOVTYnCXhuyokkNrrlOGpec1M/HCyw+VxpPpaWGvbEuQMrrKBSMOys0ZjhyY
	FUiUBCsF6CPTbyCHzJmT1nmf3Gdp/HghH+vkRLtVI3GlRD1efXZljDXKVlZpfRANyQalb//mUXT
	sLwvFMRWtgr5VLhSdEKtwlK+QgTqM9EYuEewHGrqYgFoikoBnjuWYz1FbaFjfwYSPb3hnqaCFEB
	zSFyE5A5yDBevC9+dE=
X-Gm-Gg: AYBFou2r+p0X69E3ihSC2GcuhbLDMTtbbsslOaIdZJ36Ue9Io9RJ/hy0+YuEhpi4qQR
	RZ3GzmN5zlxdfmK2/ak6rzSgq29HWbLENujNq1AOzZNwz9SgcbC7y6zf7GOtZ22gcLyKfwUbudZ
	JR+7sjzY/HKBRLTyNfYI8V4C1gHdZD9cM8/TzN1z6V7Lhm4lZ9oKlSj8q4QO3czLxQgpM8fU263
	qouD77vTn1I4Sj5MokKzxfqhXYlhZoJQGlrpgwmUTCddVYajQlJIYI+DXLqng7e0AI4DmRxuvTW
	F2bdMyUQv2p7ra6NCoxF53sxZm8UviK+uiFjAazcwXY5BSOPjGvrxQBSVmWyN51mendyIvAXaUg
	ZZOKGkbDkyaWt7I6cPs6y2qcSbpiGRAJKgs87tdxL/FG/uFne63QxrLTGW4HOMP7SPKV9Rnma3r
	rB/IlSXfTQVge5S6AR8ldK545zONQMwMxk
X-Received: by 2002:a17:90a:da8d:b0:398:d286:344d with SMTP id 98e67ed59e1d1-398d286371dmr22547824a91.22.1788245631292;
        Mon, 31 Aug 2026 23:53:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3990cd9f09fsm702866a91.5.2026.08.31.23.53.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:53:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e80ce3597so10869556d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788245630; x=1788850430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqodk9eZGUbM+q/R0T+xK36vWMF9pQz22svUZwiNjm8=;
        b=dNueY37O4XAYAyXyiA4s5gxlQdntu/ArT23AV6sgelCcOSEMceHEvQcQC9LbfUj6rL
         P0ZDy4BDc4X/nb4zvsxptrHMslreJ1Uf4MAIcd/uOgTvZiyJvcyDDkLY1JdmjW0B0+0G
         dYrNfT7styGm9JleJuImX0ksxGTu/VIT3bviE=
X-Forwarded-Encrypted: i=1; AKwUvBz+H7WSzHkX+CRJsXtBneedV1dgcKCxO4M2GrUmIblpxmBYLqCV9aA7+w2QnkJBJLIlqCMi2VyWT5ajID8=@vger.kernel.org
X-Received: by 2002:a05:6214:3f87:b0:90e:9a16:aad9 with SMTP id 6a1803df08f44-90e9a16ab8emr7413616d6.22.1788245630102;
        Mon, 31 Aug 2026 23:53:50 -0700 (PDT)
X-Received: by 2002:a05:6214:3f87:b0:90e:9a16:aad9 with SMTP id 6a1803df08f44-90e9a16ab8emr7413246d6.22.1788245629647;
        Mon, 31 Aug 2026 23:53:49 -0700 (PDT)
Received: from photon-dev-haas ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce8769b76sm93125576d6.13.2026.08.31.23.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:53:49 -0700 (PDT)
From: Ajay Kaher <ajay.kaher@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v6.12] bpf: fix the return value of push_stack
Date: Tue,  1 Sep 2026 06:23:57 +0000
Message-ID: <20260901062357.1150988-1-ajay.kaher@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Anton Protopopov <a.s.protopopov@gmail.com>

commit 6ea5fc92a0fc1cde976cb701db2c1dba4dcab7cf upstream.

In [1] Eduard mentioned that on push_stack failure verifier code
should return -ENOMEM instead of -EFAULT. After checking with the
other call sites I've found that code randomly returns either -ENOMEM
or -EFAULT. This patch unifies the return values for the push_stack
(and similar push_async_cb) functions such that error codes are
always assigned properly.

  [1] https://lore.kernel.org/bpf/20250615085943.3871208-1-a.s.protopopov@gmail.com

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
Acked-by: Eduard Zingerman <eddyz87@gmail.com>
Link: https://lore.kernel.org/r/20251019202145.3944697-2-a.s.protopopov@gmail.com
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
[ Ajay: Modified to apply on v6.12. The check_kfunc_call hunk for a failed lock
  acquisition was dropped: that code path does not exist in v6.12. ]
Signed-off-by: Ajay Kaher <ajay.kaher@broadcom.com>
---
 kernel/bpf/verifier.c | 88 +++++++++++++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 64a6ec8eb847..4c439ab978a7 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -1700,8 +1700,10 @@ static struct bpf_verifier_state *push_stack(struct bpf_verifier_env *env,
 	int err;
 
 	elem = kzalloc(sizeof(struct bpf_verifier_stack_elem), GFP_KERNEL);
-	if (!elem)
+	if (!elem) {
+		err = -ENOMEM;
 		goto err;
+	}
 
 	elem->insn_idx = insn_idx;
 	elem->prev_insn_idx = prev_insn_idx;
@@ -1710,12 +1712,15 @@ static struct bpf_verifier_state *push_stack(struct bpf_verifier_env *env,
 	env->head = elem;
 	env->stack_size++;
 	err = copy_verifier_state(&elem->st, cur);
-	if (err)
+	if (err) {
+		err = -ENOMEM;
 		goto err;
+	}
 	elem->st.speculative |= speculative;
 	if (env->stack_size > BPF_COMPLEXITY_LIMIT_JMP_SEQ) {
 		verbose(env, "The sequence of %d jumps is too complex.\n",
 			env->stack_size);
+		err = -E2BIG;
 		goto err;
 	}
 	if (elem->st.parent) {
@@ -1736,7 +1741,7 @@ static struct bpf_verifier_state *push_stack(struct bpf_verifier_env *env,
 	env->cur_state = NULL;
 	/* pop all elements and return */
 	while (!pop_stack(env, NULL, NULL, false));
-	return NULL;
+	return ERR_PTR(err);
 }
 
 #define CALLER_SAVED_REGS 6
@@ -2542,10 +2547,13 @@ static struct bpf_verifier_state *push_async_cb(struct bpf_verifier_env *env,
 {
 	struct bpf_verifier_stack_elem *elem;
 	struct bpf_func_state *frame;
+	int err;
 
 	elem = kzalloc(sizeof(struct bpf_verifier_stack_elem), GFP_KERNEL);
-	if (!elem)
+	if (!elem) {
+		err = -ENOMEM;
 		goto err;
+	}
 
 	elem->insn_idx = insn_idx;
 	elem->prev_insn_idx = prev_insn_idx;
@@ -2557,6 +2565,7 @@ static struct bpf_verifier_state *push_async_cb(struct bpf_verifier_env *env,
 		verbose(env,
 			"The sequence of %d jumps is too complex for async cb.\n",
 			env->stack_size);
+		err = -E2BIG;
 		goto err;
 	}
 	/* Unlike push_stack() do not copy_verifier_state().
@@ -2572,8 +2581,10 @@ static struct bpf_verifier_state *push_async_cb(struct bpf_verifier_env *env,
 	elem->st.insn_hist_start = env->cur_state->insn_hist_end;
 	elem->st.insn_hist_end = elem->st.insn_hist_start;
 	frame = kzalloc(sizeof(*frame), GFP_KERNEL);
-	if (!frame)
+	if (!frame) {
+		err = -ENOMEM;
 		goto err;
+	}
 	init_func_state(env, frame,
 			BPF_MAIN_FUNC /* callsite */,
 			0 /* frameno within this callchain */,
@@ -2585,7 +2596,7 @@ static struct bpf_verifier_state *push_async_cb(struct bpf_verifier_env *env,
 	env->cur_state = NULL;
 	/* pop all elements and return */
 	while (!pop_stack(env, NULL, NULL, false));
-	return NULL;
+	return ERR_PTR(err);
 }
 
 
@@ -8471,8 +8482,8 @@ static int process_iter_next_call(struct bpf_verifier_env *env, int insn_idx,
 		prev_st = find_prev_entry(env, cur_st->parent, insn_idx);
 		/* branch out active iter state */
 		queued_st = push_stack(env, insn_idx + 1, insn_idx, false);
-		if (!queued_st)
-			return -ENOMEM;
+		if (IS_ERR(queued_st))
+			return PTR_ERR(queued_st);
 
 		queued_iter = get_iter_from_state(queued_st, meta);
 		queued_iter->iter.state = BPF_ITER_STATE_ACTIVE;
@@ -9947,8 +9958,8 @@ static int push_callback_call(struct bpf_verifier_env *env, struct bpf_insn *ins
 		async_cb = push_async_cb(env, env->subprog_info[subprog].start,
 					 insn_idx, subprog,
 					 is_bpf_wq_set_callback_impl_kfunc(insn->imm));
-		if (!async_cb)
-			return -EFAULT;
+		if (IS_ERR(async_cb))
+			return PTR_ERR(async_cb);
 		callee = async_cb->frame[0];
 		callee->async_entry_cnt = caller->async_entry_cnt + 1;
 
@@ -9964,8 +9975,8 @@ static int push_callback_call(struct bpf_verifier_env *env, struct bpf_insn *ins
 	 * proceed with next instruction within current frame.
 	 */
 	callback_state = push_stack(env, env->subprog_info[subprog].start, insn_idx, false);
-	if (!callback_state)
-		return -ENOMEM;
+	if (IS_ERR(callback_state))
+		return PTR_ERR(callback_state);
 
 	err = setup_func_entry(env, subprog, insn_idx, set_callee_state_cb,
 			       callback_state);
@@ -13246,16 +13257,15 @@ struct bpf_sanitize_info {
 	bool mask_to_left;
 };
 
-static struct bpf_verifier_state *
-sanitize_speculative_path(struct bpf_verifier_env *env,
-			  const struct bpf_insn *insn,
-			  u32 next_idx, u32 curr_idx)
+static int sanitize_speculative_path(struct bpf_verifier_env *env,
+				     const struct bpf_insn *insn,
+				     u32 next_idx, u32 curr_idx)
 {
 	struct bpf_verifier_state *branch;
 	struct bpf_reg_state *regs;
 
 	branch = push_stack(env, next_idx, curr_idx, true);
-	if (branch && insn) {
+	if (!IS_ERR(branch) && insn) {
 		regs = branch->frame[branch->curframe]->regs;
 		if (BPF_SRC(insn->code) == BPF_K) {
 			mark_reg_unknown(env, regs, insn->dst_reg);
@@ -13264,7 +13274,7 @@ sanitize_speculative_path(struct bpf_verifier_env *env,
 			mark_reg_unknown(env, regs, insn->src_reg);
 		}
 	}
-	return branch;
+	return PTR_ERR_OR_ZERO(branch);
 }
 
 static int sanitize_ptr_alu(struct bpf_verifier_env *env,
@@ -13283,7 +13293,6 @@ static int sanitize_ptr_alu(struct bpf_verifier_env *env,
 	u8 opcode = BPF_OP(insn->code);
 	u32 alu_state, alu_limit;
 	struct bpf_reg_state tmp;
-	bool ret;
 	int err;
 
 	if (can_skip_alu_sanitation(env, insn))
@@ -13356,11 +13365,12 @@ static int sanitize_ptr_alu(struct bpf_verifier_env *env,
 		tmp = *dst_reg;
 		copy_register_state(dst_reg, ptr_reg);
 	}
-	ret = sanitize_speculative_path(env, NULL, env->insn_idx + 1,
-					env->insn_idx);
-	if (!ptr_is_dst_reg && ret)
+	err = sanitize_speculative_path(env, NULL, env->insn_idx + 1, env->insn_idx);
+	if (err < 0)
+		return REASON_STACK;
+	if (!ptr_is_dst_reg)
 		*dst_reg = tmp;
-	return !ret ? REASON_STACK : 0;
+	return 0;
 }
 
 static void sanitize_mark_insn_seen(struct bpf_verifier_env *env)
@@ -15672,8 +15682,8 @@ static int check_cond_jmp_op(struct bpf_verifier_env *env,
 
 		/* branch out 'fallthrough' insn as a new state to explore */
 		queued_st = push_stack(env, idx + 1, idx, false);
-		if (!queued_st)
-			return -ENOMEM;
+		if (IS_ERR(queued_st))
+			return PTR_ERR(queued_st);
 
 		queued_st->may_goto_depth++;
 		if (prev_st)
@@ -15751,10 +15761,11 @@ static int check_cond_jmp_op(struct bpf_verifier_env *env,
 		 * the fall-through branch for simulation under speculative
 		 * execution.
 		 */
-		if (!env->bypass_spec_v1 &&
-		    !sanitize_speculative_path(env, insn, *insn_idx + 1,
-					       *insn_idx))
-			return -EFAULT;
+		if (!env->bypass_spec_v1) {
+			err = sanitize_speculative_path(env, insn, *insn_idx + 1, *insn_idx);
+			if (err < 0)
+				return err;
+		}
 		if (env->log.level & BPF_LOG_LEVEL)
 			print_insn_state(env, this_branch->frame[this_branch->curframe]);
 		*insn_idx += insn->off;
@@ -15764,11 +15775,12 @@ static int check_cond_jmp_op(struct bpf_verifier_env *env,
 		 * program will go. If needed, push the goto branch for
 		 * simulation under speculative execution.
 		 */
-		if (!env->bypass_spec_v1 &&
-		    !sanitize_speculative_path(env, insn,
-					       *insn_idx + insn->off + 1,
-					       *insn_idx))
-			return -EFAULT;
+		if (!env->bypass_spec_v1) {
+			err = sanitize_speculative_path(env, insn, *insn_idx + insn->off + 1,
+							*insn_idx);
+			if (err < 0)
+				return err;
+		}
 		if (env->log.level & BPF_LOG_LEVEL)
 			print_insn_state(env, this_branch->frame[this_branch->curframe]);
 		return 0;
@@ -15791,8 +15803,8 @@ static int check_cond_jmp_op(struct bpf_verifier_env *env,
 
 	other_branch = push_stack(env, *insn_idx + insn->off + 1, *insn_idx,
 				  false);
-	if (!other_branch)
-		return -EFAULT;
+	if (IS_ERR(other_branch))
+		return PTR_ERR(other_branch);
 	other_branch_regs = other_branch->frame[other_branch->curframe]->regs;
 
 	if (BPF_SRC(insn->code) == BPF_X) {
@@ -16129,8 +16141,8 @@ static int check_ld_abs(struct bpf_verifier_env *env, struct bpf_insn *insn)
 
 		mark_reg_scratched(env, BPF_REG_0);
 		branch = push_stack(env, env->insn_idx + 1, env->insn_idx, false);
-		if (!branch)
-			return -EFAULT;
+		if (IS_ERR(branch))
+			return PTR_ERR(branch);
 		mark_reg_known_zero(env, regs, BPF_REG_0);
 		err = prepare_func_exit(env, &env->insn_idx);
 		if (err)
-- 
2.53.0


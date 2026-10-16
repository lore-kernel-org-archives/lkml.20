Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180035201B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168962; cv=none; b=ddiy7svQrX8Vt/FdDmbvdX8HTycf14SGddgfc7kn6+zriazPwACI+uqLAV5VYLB8kvECLKaeosvoSLbD4PrBO8JMGmiO2Nu1K1g3GUXnRSHdmrTv64OQT+DGOyafQGPIVa6WtZ1WELEp9+UEYo9BuNO6tbpzKffo+tUzgyeAvkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168962; c=relaxed/simple;
	bh=6fGk/cz4lM/vcLtY4nj0S79G2e4HoMiA2Rti2eE6utc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=gZLOuTAtOFYz/lQFPMx+uN2PQ9leS94Fk9xETjn4zR+TtbnTLs4flXIThFOpn0Ps7KPTQJqwMF5OyP2utkZGzhTSIDBONpc12SKb2BROWTUd+FDf8uc44Xav2eWWNYywwsgSROZdVTttxjSGLlQgwp/vpyVeb9WrS80QQ+nlJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9Sg8swK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9Sg8swK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso127300a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168960; x=1792773760; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eCAyx7AuZ0Q0woC1cedtvhLk+r2xvJ+25iib/kChqHY=;
        b=e9Sg8swKEvFpVmVZ+PEqqD+A4N+RWX7CA1qgVJPlhgpblgswpuPoHC/GPxmTKz18q4
         nSKExaw0VOkwr/rdWLHh9l0WBFl63MgjUBTYVGGTGo8E/UkonCfMbKKOV/RyV0ZuM9jV
         yGkzwD/n5XzqL659LttqMa6+6SyH56xNStFAE2vodQe0t0dJNOTAizxKwv0flRhC+FNR
         2R61m/ZsK2iCFRl/dcXdXjT9e24KVqU/MZQjO5seTngc+bo2yJJaJNp22C8FtHSkLVVI
         vh2kiQtYiup83XmjVTSu/lzYeZCIXTe9T38Wd/dTFs1dXgd7U2hCpQH23JHzve2d3+Xx
         fOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168960; x=1792773760;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCAyx7AuZ0Q0woC1cedtvhLk+r2xvJ+25iib/kChqHY=;
        b=coNdB5zpxRtknrLd+0R/dREzLolfttdgWbC7NCITDefRrOE+KjMNez27ZGdUHITKdz
         IoJoksJdW+uXXksdSaz9OhbDh4V+9i4MlifNBBho94F5jejNCaLwjxUYG8K57RNXwTYp
         7DPE0eZM/I6MmT0iTeARpvg4Osv90gdF1A0FB2eIO6V2amEwuX1hGjYQLYNOIzN3hChC
         Dfzox1Q71RABfgyM6QaJPLXWW4AMh2C75gpeD9nmz29Zdy8mSj/0k/QjSZHHYk9+N8/+
         TanB4Nzjzv3H4Xo7NHLbTn9QiQStVE3KyDUyBA0ZOA01MJoGWNjBS+KZKAygH7V2vY71
         kSlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2BroyhmuYPqstz06w8tFOC4vK7Yva7L+s5ITjMl2vWdIhQE8E0Il21/pYSC5IV/FfSBDnUgA4rV6jLfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsL3pFOMlDfa5urUvwk6RYzw6KCWa4HUSakPsrJgCf8x7rTZlR
	7q6RRP8W2yFK7aHWkO3f0hcqwYlnRVyxhNLfTNcKqG0g3KBn8NOl/kfr
X-Gm-Gg: AYBFou2aBDNDJshwHrOCCBou7N2G0gDp+HMBVIwyV2iwZKB4m8fGo/WHWG0ppFGF3nm
	TOKdBbnSamtGN9Fam741f14lTYe9P10NX23OqC1t+9XJ3O35vIckI4dtcCiXEOf8vhL1MoRyiJ5
	FZSJiYUgoQyXbc3JF7sE1Fyv57AbzcSv4PhHQcOqAKpXlV1hI+rfaWfJwx4FpA4ihgg/cOZTK70
	wpmJ0xuVj2oUuJNteUqm1VpV/EHpedhEdg2QBUBiEKqso0fWQbMdZ/Kytd9o1EGWJlaib3KTMkL
	UVC0EuntokX0DbJSRGFNsJJ/OlXnEo0NqLKBKguAoXwIMEQGpdW8yptV4Sohd/ZTylMiBrU/+Pc
	RQdqEVDc+JO/5Ums6xeGKNRzxsG8v94QF5I+I53+irtB2YD15hh279uBPC/C3NULWAmchVGRA7y
	g/VdDJut1ejXzXgkAlLj1sbsIJkohgKntmBIT2loxjq5TCP+0ADl2EocMLOErb54q8yQR0k6ael
	5zSazEoFrmjL4PxIS9lj9Kn3LsJL3feVRaERewLhG7suJ37j05ZsSroChKWRn0b0WkWHK7+WMxD
	KeY=
X-Received: by 2002:a17:90a:d44d:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3acef13e596mr338758a91.26.1792168959867;
        Fri, 16 Oct 2026 09:42:39 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm10102429a91.3.2026.10.16.09.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:42:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 16:42:39 +0000
Message-Id: <DM6EVHTVM3IR.3RCFLKV9WC80J@gmail.com>
Cc: "Amery Hung" <ameryhung@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Nicholas Carlini" <npc@anthropic.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>
Subject: Re: [PATCH bpf-next v2 00/11] bpf: Scope callback arguments to
 their frame
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261009202759.50520-1-ihor.solodrai@linux.dev>
References: <20261009202759.50520-1-ihor.solodrai@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 09, 2026 at 01:27 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
> Introduce REF_TYPE_FRAME for this use case: a reference owned by a
> callee frame, dropped when the frame is popped. Tie each argument to
> this reference so callback return invalidates it and its descendants.

Another idea...
The id is owned by the frame. Can we keep it in bpf_func_state
like diag_frame_id ?
release_reference() already takes ids that are not in refs[].
See unmark_stack_slots_dynptr().
Clones copy parent_id and slices hang off dynptr's id, so both are
reached.
All setters have callee already, so no need for patches 1-3,
REF_TYPE_FRAME, frameno in refs[], the reg that is its own parent, etc.
Something like this (compile tested only):

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 54144372281c..4f82b86cdfe2 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -3185,6 +3185,7 @@ int bpf_iter_map_fill_link_info(const struct bpf_iter_aux_info *aux,
 int map_set_for_each_callback_args(struct bpf_verifier_env *env,
 				   struct bpf_func_state *caller,
 				   struct bpf_func_state *callee);
+void mark_frame_scoped_arg(struct bpf_verifier_env *env, struct bpf_func_state *callee, u32 regno);
 
 int bpf_percpu_hash_copy(struct bpf_map *map, void *key, void *value, u64 flags);
 int bpf_percpu_array_copy(struct bpf_map *map, void *key, void *value, u64 flags);
diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 112ca1511da4..8865ece94ef4 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -364,6 +364,8 @@ struct bpf_func_state {
 	 * reused after returns, while this ID is preserved across state clones.
 	 */
 	u32 diag_frame_id;
+	/* parent_id of the args that are gone when this frame returns */
+	u32 frame_id;
 	/* subprog number == index within subprog_info
 	 * zero == main subprog
 	 */
diff --git a/kernel/bpf/arraymap.c b/kernel/bpf/arraymap.c
index 0fe9afd4a591..3376cc81e5d9 100644
--- a/kernel/bpf/arraymap.c
+++ b/kernel/bpf/arraymap.c
@@ -855,6 +855,16 @@ static u64 array_map_mem_usage(const struct bpf_map *map)
 	return usage;
 }
 
+static int array_map_set_for_each_callback_args(struct bpf_verifier_env *env,
+						struct bpf_func_state *caller,
+						struct bpf_func_state *callee)
+{
+	map_set_for_each_callback_args(env, caller, callee);
+	/* the key is on the stack of bpf_for_each_array_elem() */
+	mark_frame_scoped_arg(env, callee, BPF_REG_2);
+	return 0;
+}
+
 BTF_ID_LIST_SINGLE(array_map_btf_ids, struct, bpf_array)
 const struct bpf_map_ops array_map_ops = {
 	.map_meta_equal = array_map_meta_equal,
@@ -875,7 +885,7 @@ const struct bpf_map_ops array_map_ops = {
 	.map_check_btf = array_map_check_btf,
 	.map_lookup_batch = generic_map_lookup_batch,
 	.map_update_batch = generic_map_update_batch,
-	.map_set_for_each_callback_args = map_set_for_each_callback_args,
+	.map_set_for_each_callback_args = array_map_set_for_each_callback_args,
 	.map_for_each_callback = bpf_for_each_array_elem,
 	.map_mem_usage = array_map_mem_usage,
 	.map_btf_id = &array_map_btf_ids[0],
@@ -900,7 +910,7 @@ const struct bpf_map_ops percpu_array_map_ops = {
 	.map_check_btf = array_map_check_btf,
 	.map_lookup_batch = generic_map_lookup_batch,
 	.map_update_batch = generic_map_update_batch,
-	.map_set_for_each_callback_args = map_set_for_each_callback_args,
+	.map_set_for_each_callback_args = array_map_set_for_each_callback_args,
 	.map_for_each_callback = bpf_for_each_array_elem,
 	.map_mem_usage = array_map_mem_usage,
 	.map_btf_id = &array_map_btf_ids[0],
diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
index 953700822fa7..43d6682037fe 100644
--- a/kernel/bpf/states.c
+++ b/kernel/bpf/states.c
@@ -995,6 +995,9 @@ static bool func_states_equal(struct bpf_verifier_env *env, struct bpf_func_stat
 	if (!old->no_stack_arg_load && cur->no_stack_arg_load)
 		return false;
 
+	if (!check_ids(old->frame_id, cur->frame_id, &env->idmap_scratch))
+		return false;
+
 	for (i = 0; i < MAX_BPF_REG; i++)
 		if (((1 << i) & live_regs) &&
 		    !regsafe(env, &old->regs[i], &cur->regs[i],
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ec136cf377c1..bc12df55d2e2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -11465,6 +11465,14 @@ static int check_func_callx(struct bpf_verifier_env *env, struct bpf_insn *insn,
 	return check_static_func_call(env, subprog, insn_idx);
 }
 
+/* The arg points into the stack frame of the helper that calls the callback */
+void mark_frame_scoped_arg(struct bpf_verifier_env *env, struct bpf_func_state *callee, u32 regno)
+{
+	if (!callee->frame_id)
+		callee->frame_id = ++env->id_gen;
+	callee->regs[regno].parent_id = callee->frame_id;
+}
+
 int map_set_for_each_callback_args(struct bpf_verifier_env *env,
 				   struct bpf_func_state *caller,
 				   struct bpf_func_state *callee)
@@ -11631,6 +11639,7 @@ static int set_user_ringbuf_callback_state(struct bpf_verifier_env *env,
 	 */
 	bpf_mark_reg_not_init(env, &callee->regs[BPF_REG_0]);
 	mark_dynptr_cb_reg(env, &callee->regs[BPF_REG_1], BPF_DYNPTR_TYPE_LOCAL);
+	mark_frame_scoped_arg(env, callee, BPF_REG_1);
 	callee->regs[BPF_REG_2] = caller->regs[BPF_REG_3];
 
 	/* unused */
@@ -11885,6 +11894,11 @@ static int prepare_func_exit(struct bpf_verifier_env *env, int *insn_idx)
 					     callee->allocated_stack / BPF_REG_SIZE - 1);
 	if (err)
 		return err;
+	if (callee->frame_id) {
+		err = release_reference(env, callee->frame_id);
+		if (err)
+			return err;
+	}
 
 	/* for callbacks like bpf_loop or bpf_for_each_map_elem go back to callsite,
 	 * there function call logic would reschedule callback visit. If iteration

Patches 5 and 6 are fine on their own. Pls send them separately.

pw-bot: cr

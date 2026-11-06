Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998327;
	b=zIMV5ULKkP1VWoMglFGY5Jj9MpMxJDpHZ0qysmIoR/NFX0eUbJVeKqtvrbnWgN7ifoqx
	 34gcEdgSq+vdq3Oll6XjagBzUq6OXAptn/3VS08DTCmwjcGot+Rg6FlnD+0lT0VurjCeG
	 rmwhiJHdHbbQQDFBAuJN/1r5EKEYM7OXYWLSREF5vzFzGPLPQdSXZTLw4Zl/6QJLn/+dA
	 +TsiR+D6B1d0p0rBATIqc88ZkHHoHEjKhKlINuVlfP1c78X2ZzSOsg4P9i9JwgGiRx4HB
	 75XHDE72dsr0nXnokUzOogU2v0D4LqkkNmfQJQEXgJzOtZWveUfQ2l4ERh4o1Ah2u1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
	b=LgTzJl+b6MKzARJc/mR+xdezdRCn0xNmDgJgP2MceOLl7efyFE1TApSXdpTSdh3d/QuW
	 JmiJTy2Agti9pkl7BVgiV4/1JycvORAZTRRLi7gq+t0v5K9THM6wDSo8s806m470tBPVT
	 +WDclMRNzuVscQx5E6URZtDnexEc1Na9a2NLOns7FZ/kJjNUhz+acqAeL5npKPN7ZIX+y
	 dkJp+/54nMboJS46zGvL8M47nrvJwfgYgdqbk5YZn0d+gSrMIfhUf0HyMR7RlkqZ0ACf5
	 cXLB5C/W++MnybXLircAQ1fpWTJNA3awTNUx/mjKM3XBkk3+4I5szemVTdiIfzOhWag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMpZUxa2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81ED606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81ED606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMpZUxa2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7204355e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998325; x=1794603125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
        b=OMpZUxa2DmOqXeYLkfvY1jIvfHLVRBtEm/bML0zD0v903rUKrOHr6WDuHGooFOXIw8
         tn9ekq0BraocV093l1uBMtPtmvOQIlkGjBydj++f6A/jwRTBa4VleBA+lEVb/pRYJYyw
         JJ5IVOI+QgkxlkRquAh+ox4DFZUO6VRVPXhs/0lEL08Gfpis5tE0JlLhFc4i6aca34jl
         6UduRZc1odTaqpUAkkdU9iC6lKuRBsPW9zshcMbsUyyj/ZI2CcB6ZzJ9+WGcjOwD78p5
         i7BA6MLR3yBM/qA/9i3jo5/cGN7ozTilm8+NufktPFlm2KHRa/SdKuPJL2ndBgYkgrna
         NYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998325; x=1794603125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
        b=sfNur7CM0f7VshVdN3RFzXjywwwMHN8ohO6yI3XYsR3Za16o4Kmme8uvA4wJXmB1lK
         Sq8zvtZkbNINDV2wtWMNu1lY2wOpTNfeiCu28GEsgH1NlOX3yDxhDMvgLGZZ/Z+wAzO3
         4itr/nvi0tLn3wsYSqPWsqrDDO8inB1xHXQ09uuAv9trny9/0AgE3Kzmcuk4XoylcvG0
         d/R9b45Xvna6eIkPcQgHn3dciQjENnQAg2iu3yvbc6w3sy+2LTN5cMpkhqV8nmswILPq
         Lt2DgYoRypWhw+wn1EXvZhnbGWTrdI8KFfrKLG/7hayQrB/lmzMw5wOq4kIT3uiLSgs/
         4XCA==
X-Forwarded-Encrypted: i=1; AKwUvBynEFcc/m7mbsWQdMKHsJK7WJ1r0JjCl6mnBgJtZHEs5jJSbvo6o52pkT96dJvvIkP7cQMPuM5sB8qBRok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l68+07AZWZM2jQTY9KosQ533PXO0C1gnOMuUO1bWlzy5lbfKw
	/iWOeM0PWqwPo9B/3E4IEGfVxq0gpvz7L36N0TKfMlZQDNPDTzg+RqQn
X-Gm-Gg: AYBFou2qOUCDW5qJQnbp/jV9E0C8pXtwjJyZR0X3shUet87UTEIJ06CuEPebhbsZDJk
	yXZDXz6RvbeuYnOaaY9jPzJ10kmO+y4HxN2dOOAuWccuNSBVniIBb7ykU1lesDJLIm5zbugC9WW
	PfKnzqRslM/OQJKKIeWjBqCOXAubhuQ7AkII/l6Bl5Rj5eAA17fErkvs0K8Daah0GNPAV7uGqA4
	7uC5pXyk8nIen66HYZEXn6o0ICn77N4nXN1Vt+dOXjEU7JvzDemHxDSwPfEHnRW0IL+pK7Lm/w0
	vr7TPHpEfra/wB2jJctXAq3pYoEykxL9ZgrM8xaRM0s9wJp4gF4ivfh6zKomMYzgDEBnFOOEFtf
	sqBYUpM44mnsrId7OaRFS3gfzECIkfg6u7VdEH2vOBJmAOmIPxseJKy1wPE1X76dfwL7HNSwhEs
	bgD76Fb8pros0wVVak/2BaypSNnJ8np4TyWlhWCQ+vUYeYlxQfvC0fTBEzlncwgfXYOev5fE3iT
	W1xUSq/7l1CV0N3UCSy4uZUMADaOAErd90f8vc1pcZ+SbiQcb+1FmfQoaVFtig9KZSyksfFYPHE
	BxDgL/MDp40Wp5P2yk0eGvYH99hZ3/4264Tp9iYbbmHGsHqINJpnjGC6Hve49GyyhLko
X-Received: by 2002:a05:600d:8408:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4b6f7374730mr48781405e9.13.1793998325212;
        Fri, 06 Nov 2026 12:52:05 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:04 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v1 bpf-next 05/18] bpf: Declare fmod_ret targets with BTF_FMODRET sets
Date: Fri,  6 Nov 2026 21:02:54 +0000
Message-ID: <20261106210314.1767267-5-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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

Move the fmod_ret targets of the BPF test functions, MPTCP and bpf_testmod
from registered kfunc sets to BTF_FMODRET sets. Attachment flags stay the
same: bpf_fentry_test1 is still the sleepable target.

These functions are no longer kfuncs, so the bpf_kfunc decl tag, and
with it the vmlinux.h declaration, is gone. Only
bpf_modify_return_test_tp() stays a kfunc, as it is also in the
common_btf_ids kfunc set. Selftests which need bpf_fentry_test1 declare
it themselves.

No code registers an fmod_ret set anymore, as the kernel builds them from
BTF. Remove register_btf_fmodret_id_set(), so a module cannot register a
second set next to the one from its BTF.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 include/linux/btf.h                               |  1 -
 kernel/bpf/btf.c                                  |  7 -------
 net/bpf/test_run.c                                | 12 +++---------
 net/mptcp/bpf.c                                   | 15 ++-------------
 .../selftests/bpf/test_kmods/bpf_testmod.c        | 11 ++---------
 5 files changed, 7 insertions(+), 39 deletions(-)

diff --git a/include/linux/btf.h b/include/linux/btf.h
index 00495e7833b6..5522c7fe1373 100644
--- a/include/linux/btf.h
+++ b/include/linux/btf.h
@@ -632,7 +632,6 @@ u32 *btf_kfunc_is_modify_return(const struct btf *btf, u32 kfunc_btf_id,
 				const struct bpf_prog *prog);
 int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
 			      const struct btf_kfunc_id_set *s);
-int register_btf_fmodret_id_set(const struct btf_kfunc_id_set *kset);
 s32 btf_find_dtor_kfunc(struct btf *btf, u32 btf_id);
 int register_btf_id_dtor_kfuncs(const struct btf_id_dtor_kfunc *dtors, u32 add_cnt,
 				struct module *owner);
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 2c45e5fa1d7b..f81a8ae9b92c 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -10294,13 +10294,6 @@ static int __init btf_fmodret_tags_init(void)
 }
 fs_initcall(btf_fmodret_tags_init);
 
-/* This function must be invoked only from initcalls/module init functions */
-int register_btf_fmodret_id_set(const struct btf_kfunc_id_set *kset)
-{
-	return __register_btf_kfunc_id_set(BTF_KFUNC_HOOK_FMODRET, kset);
-}
-EXPORT_SYMBOL_GPL(register_btf_fmodret_id_set);
-
 s32 btf_find_dtor_kfunc(struct btf *btf, u32 btf_id)
 {
 	struct btf_id_dtor_kfunc_tab *tab = btf->dtor_kfunc_tab;
diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index d6c9dc62182e..d63c3b697552 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -643,17 +643,12 @@ CFI_NOSEAL(bpf_kfunc_call_memb_release_dtor);
 
 __bpf_kfunc_end_defs();
 
-BTF_KFUNCS_START(bpf_test_modify_return_ids)
+BTF_FMODRET_START(bpf_test_modify_return_ids)
 BTF_ID_FLAGS(func, bpf_modify_return_test)
 BTF_ID_FLAGS(func, bpf_modify_return_test2)
 BTF_ID_FLAGS(func, bpf_modify_return_test_tp)
 BTF_ID_FLAGS(func, bpf_fentry_test1, KF_SLEEPABLE)
-BTF_KFUNCS_END(bpf_test_modify_return_ids)
-
-static const struct btf_kfunc_id_set bpf_test_modify_return_set = {
-	.owner = THIS_MODULE,
-	.set   = &bpf_test_modify_return_ids,
-};
+BTF_FMODRET_END(bpf_test_modify_return_ids)
 
 BTF_KFUNCS_START(test_sk_check_kfunc_ids)
 BTF_ID_FLAGS(func, bpf_kfunc_call_test_release, KF_RELEASE)
@@ -1905,8 +1900,7 @@ static int __init bpf_prog_test_run_init(void)
 	};
 	int ret;
 
-	ret = register_btf_fmodret_id_set(&bpf_test_modify_return_set);
-	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SCHED_CLS, &bpf_prog_test_kfunc_set);
+	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_SCHED_CLS, &bpf_prog_test_kfunc_set);
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &bpf_prog_test_kfunc_set);
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &bpf_prog_test_kfunc_set);
 	return ret ?: register_btf_id_dtor_kfuncs(bpf_prog_test_dtor_kfunc,
diff --git a/net/mptcp/bpf.c b/net/mptcp/bpf.c
index 4cc16cbeb328..d0d489624689 100644
--- a/net/mptcp/bpf.c
+++ b/net/mptcp/bpf.c
@@ -20,17 +20,6 @@ struct mptcp_sock *bpf_mptcp_sock_from_subflow(struct sock *sk)
 	return NULL;
 }
 
-BTF_SET8_START(bpf_mptcp_fmodret_ids)
+BTF_FMODRET_START(bpf_mptcp_fmodret_ids)
 BTF_ID_FLAGS(func, update_socket_protocol)
-BTF_SET8_END(bpf_mptcp_fmodret_ids)
-
-static const struct btf_kfunc_id_set bpf_mptcp_fmodret_set = {
-	.owner = THIS_MODULE,
-	.set   = &bpf_mptcp_fmodret_ids,
-};
-
-static int __init bpf_mptcp_kfunc_init(void)
-{
-	return register_btf_fmodret_id_set(&bpf_mptcp_fmodret_set);
-}
-late_initcall(bpf_mptcp_kfunc_init);
+BTF_FMODRET_END(bpf_mptcp_fmodret_ids)
diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index 41ff36f0ca77..91cb311a2dc8 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -2607,15 +2607,9 @@ struct bpf_struct_ops testmod_multi_st_ops = {
 
 extern int bpf_fentry_test1(int a);
 
-BTF_KFUNCS_START(bpf_testmod_trampoline_count_ids)
+BTF_FMODRET_START(bpf_testmod_trampoline_count_ids)
 BTF_ID_FLAGS(func, bpf_testmod_trampoline_count_test)
-BTF_KFUNCS_END(bpf_testmod_trampoline_count_ids)
-
-static const struct
-btf_kfunc_id_set bpf_testmod_trampoline_count_fmodret_set = {
-	.owner = THIS_MODULE,
-	.set = &bpf_testmod_trampoline_count_ids,
-};
+BTF_FMODRET_END(bpf_testmod_trampoline_count_ids)
 
 static int bpf_testmod_init(void)
 {
@@ -2633,7 +2627,6 @@ static int bpf_testmod_init(void)
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &bpf_testmod_kfunc_set);
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &bpf_testmod_kfunc_set);
 	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS, &bpf_testmod_kfunc_set);
-	ret = ret ?: register_btf_fmodret_id_set(&bpf_testmod_trampoline_count_fmodret_set);
 	ret = ret ?: register_bpf_struct_ops(&bpf_bpf_testmod_ops, bpf_testmod_ops);
 	ret = ret ?: register_bpf_struct_ops(&bpf_testmod_ops2, bpf_testmod_ops2);
 	ret = ret ?: register_bpf_struct_ops(&bpf_testmod_ops3, bpf_testmod_ops3);
-- 
2.43.0


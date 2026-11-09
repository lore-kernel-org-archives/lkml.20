Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243289;
	b=Ot8xqjWsSdJRIT86BaBCH05YX4gCIG8ridaLuML4EnPf+hXvcQLcDC1RhQbQ7hx58ZAe
	 dZA2NM1RW3qLRUrkLXHbvxe/tJdNygvMPKjoYAXJj53HDtFgygZ7z5xOg0TJ9D2tGd5QA
	 qEJMX5cEKJrB2VEtpi6se/ZWizH0yfD4vxlwM5DeVXpvo8z7nqw+TPDm9+Z9Oa+P/3Ii0
	 v3MSKWGDUt+Fsq1lGal7mhwSRd4/HvQiPhNpdwVKDI7+XClfRrIkj8Yuw1OS0yMREtS8r
	 nrxVQrRVKs/+4T3Tj/WDniJ6TrUl3gNMa5H4gR7vb7FA0Trh5rxgx5fvEftHybM+4FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
	b=zO/pZqx6R7p4hYjxIteXGXQPyWNYfujxwaet9hpgudJaPiT2s04/yd2wLz1/xNYwh7Jw
	 TnxAHQydRNsAwF+FPrtRZveN4c2jG0xSNmTef5rougNRxTjzm9AufoTRBvkvez/O8nDlk
	 kpkQoF9jN+7SLrOKloOt+wnFtpGtRkjha1MGnlXkRRI9VLKDZPDt+emHoww7dHiK/VzG8
	 YXnK7kqYBGYa1Sye2Yh4yn7zN9P1dMIjaA1WX11nHhIhEX3NQCz1lmFjF8s4AIFGQKw5s
	 od7QNoQsfLqjU3XSUD2r+Mx2dy4/rPLDH9ZkeCEnfMHoccwVSPljXkJtmA4FErJfz5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDIGLpU1;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AD60A5BC2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7AD60A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDIGLpU1
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4919a880834so709860f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243288; x=1794848088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
        b=MDIGLpU12dyazLzj1gduW4ftQUKJoGj2Abg4DQEQ85HbKPIs7BVCUuDtm8IIpn6XTb
         6xLk8czGRWsgwflXpvSpoVwIRqZ133asGUr7vYdrNJ/VmaNFIL49xUT7BhA/umdUmO5t
         A83XKK4Yw5GWdnHUQ/d/xUE31m/hH/xuGWNLiTCt4BJLuXiFbmR4RXNqwH5DCGIABwGj
         yhBMiWWW1W+YYliT5sxV5e61j1mG/FrKLFbC7A1JeVw06xBsRdoSr0ROubBLlHyTi7nX
         ZVKLaKWZLlZlSnYYoxGynrOQvBk1V8SDwckE1Z4YjjNaYPJrNPiLl07dyx0ka3nxwZKe
         B7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243288; x=1794848088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
        b=YAMeAVezuG86CYuIVcNgUeDrb6YnkyTGz6asg8MopxSTzUJe7yGQtSjQILywSEY+pD
         OXv2sV8lLRfmzNrIh/aZageBvSG+44zz7IOGQErCMz5oBcXsHx2iffX2nxfNl3OMbdIQ
         KCS3cTLC5NFt3bdrUpaNZivNMVlTuGOEt4Wpqm2Vx8tFLEGBbkVwNEp1frejHMjgh0qh
         O0ENu0IUxgXECLdjnHHqK5WRVDgd8c1aA8IXFRb31A44n1mbJSRr3UsjWXUyZJt8MAtc
         XmltRZrR7uQu4Lv249P1Fg1gNEjMaa1IQDGjb4bPHjGM3ErudNpZHgGV86rGBZCS4YXi
         30ww==
X-Forwarded-Encrypted: i=1; AL+hErHf6zWJ/pnoTrCftEljfDm+FAmA1UxBZaBsbUQ2PsCcWIdjyOQ86aDwa8ogjq3DvhcQ5cI41+Tu7/la478=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fqsdWCiyzWPUBXjyVUTEzBGfeLgcwtBeFh+5ZH7uYpnQjFe0H
	aG+sYpMVBXM5yesbyZMHkNaHDdqFKAznFpz57i9YzBXKr/fxIC0TMnhq
X-Gm-Gg: AYBFou0bWwy7XWkDsT2RXkClGwst/KJ23P53+VXHUS2nT/Mfy9U3dXVuJj9Z4S1PdKA
	9Bkii8x0x1VYzaE48ejDy0XTpM+ikV/eb3wJsuhy2ln8+bQlNHh6g7GgpksIqqRe/Esh1edeQGG
	R4MSnyl+YzRvTX9F89sJ5Xd+mp4kJf64abLynvtMgXbUNds9yfPrbYTLN84xOc+Mca0g3/0GNXa
	BDa/J4kgHm3QdwJx5Na1tOsriFESyq2yxlpk0k/9TJw42y57aJOEFyOUC9s7ulpEP7QtzqUuw5/
	ZHr7TnV1ftQggp60OUu+GdjbyZKWlj4tzJJjngkHyCnXzmyDmEHm7joC9/n9kw/I6N2/LyaAaqD
	wCOJcVQb3YocTglMUuLvpQhEGzil5XaLXFE2OedjtCRBfjYbCNptq6Nl+PZpVD2T1tpA4NdPpnL
	U/T/B2UOz0yy0hmTebw6LodO2R+5tUtoeLhivyHnGA2n+C5UJyAqgd3EWFca2TD3QiCu9APNRaN
	+GpSVs01HTQmZngTo+mBIhLzdYcUL41/LOOYY0ey9+h1hBrD5+rpyVLWSgBdakHsfUH6OwIVoB9
	efss5zC7Jx4VUm7O6MU6l2//sf+BWx1SIwUySmQhYCUwBdM=
X-Received: by 2002:a05:6000:2006:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-4982b28a87amr173590f8f.5.1794243287705;
        Mon, 09 Nov 2026 08:54:47 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:45 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 05/18] bpf: Declare fmod_ret targets with BTF_FMODRET sets
Date: Mon,  9 Nov 2026 17:05:25 +0000
Message-ID: <20261109170550.141443-6-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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


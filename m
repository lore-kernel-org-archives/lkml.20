Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328171;
	b=Zao9YtcnG0X+Q3ZNOZNl6mHL89a3AsL9/2gpGXpR5ESqkasbU1Ka09+ygK8Kc7SO/5vI
	 vVTRqNfUnp4zIIB/VVvdp1Jd5Oafbjjgx+VMBAvV6Wg672pCXat27dnnmgBV3HGRadFl1
	 ki5amM+w3p5YfyWzlHbbrsVt4dNLHXNHNctLkVrAetgnNEWbW9JMrgUJICM9kbDV85ebu
	 0GlpSdUHJaYvrIe13/sz9n0pZnG/5J+j2u5f1lce6PjR7ZW34xHy/gyXTYEDSyqFM/oig
	 04vPWFwWwQIu1zay7QqtEgvWgELqJCCAMKOFksUZNuf2HIjEbfE13AwzhWgjDbUq2Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
	b=Yx9SfV1sDWuTmtAB9UswZ7p8DDe7/ETAned0mDY2E+Zol5CW3jGA+BoUKthaSvJIND/U
	 bqIp7i86LI/01h4i0L1fvL+NtLfrwBjzOo8U1pyUn59H0kW3H3sqfuGb4QWZr4fvFn7pz
	 uOuNAl57ysXGjInPJdJOHDn2RAJvQwhZr7uH2gDEh4q1nuF9hgidPW31uTar6/LrRCwwI
	 6h00aay9iPY5A0Xw+VjoWxIi3WDy5fEhZfxp/bYFODcs64Mzi1LlTcYcLtJ3azuG56umA
	 QZKPbkcxIUXh98fMGbOLghDO9CcOgA79LEOsMfzUXvF0tedcgL5aNVY9gWmr2nDhzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XOpK9OW/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC5606D7F4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CAC5606D7F4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XOpK9OW/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15877755e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328169; x=1794932969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
        b=XOpK9OW/maoQLHYZJ6rXsBidMvFadNRQ5mvV+vQh0adhjviKGHOkWLEFw2hvn5/HXc
         eWHgB/GmKSVgIWXFLp8gLxQDTuMkWv8atbeHfve4ENjwjozL245/87nbW+8lTcMY34jp
         0O5ynawkihMQkQD9Gc3nF6eaX8kGxgk3f5JaorZXRk4XpyVSfQMMDjG5ZqgzZdYPyzuM
         96bomNokebHsP3rVMr2UbNhzKs+UkTb25lANpzc5/pl5BAaDBGS+8MNo+WLnQqEO13AH
         UxVydmJne0OKzr9pLNxcbBmEq9LOJfQLwDJ7ueOGWX8o7BIVeBVf99pxlYIkmccHMM1B
         dMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328169; x=1794932969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnSlEXCfAYWX0BUaQQssXYW/i20wZpZ88Wvzskv1kms=;
        b=a2EunhLbt51xCugo5Z6kn/tdYizt8Apv32qmHwikQi/TL2kRys8f3fGlXaqan4LeM4
         Xi7/cNWbKUxwx2oE2tVrwoueggMoqDSvtjiHXGic1/bTAZgwsD0yYH/hiUVDZvbfyOc8
         OJwM6ho14/IqfN2M9F2x7Ya7Z4wY0da94sTqiZge98eCZOL0MbKa5CoVOqprmmsxzWjT
         AcynGDDsTHCM2nL7TR2PARisPe2EjWWu63RgltqeiGMEnkywqUxSD2vqF7cxCHCcvr9L
         NpCyv1tLk0iE6BT07nMnoHOW9O5+rserlWFRb0wReii3fLQPkcS3gfcWS2u14+GbMnNp
         pssw==
X-Forwarded-Encrypted: i=1; AL+hErGNWHVeUv4s9iaI1tgXBJtHIXwSJ4/xEqvj6/K26CZ3Lt0nIkz9dVUQ5A9C+IxkY+IJyUK5L0xhHldGAHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aEMrlqxT/ZUtZpPZ5u5+ppQOy8HD3ZxZCrTJouWXhjZXNqm21
	AFL287n+HY5yNRD8rHXfO+vknA3LOII4hwVjLBLw0Wo/vAzcUS4Carzx
X-Gm-Gg: AYBFou3cwW+Xl6psPKYNwgeVagunYMf5pP+Sa2aPnMOS3nnc11c0opOHzqtrCpx658R
	zE6CkuW2uDc9TVageur5Smohnoe8hkihL3BEzrDLtEUkBkIWk0d9epEe9AK5XGEuzP5f8lodcBa
	+vVLAUcEM/WkWdSCCrAaq5OlxmLpK62Oq6mpkfCaiR4pdGMc6/CLGPj3BAbErWFUyaLbeA12dU8
	6extXML7uBh6PQSRqrI7I/+YCjKzQDnFhYGos2pZMGDdIPEtYlW12j28HuwEsGKTgJiBrItbTns
	6+yfZbf+6znsoaZGBAff/366mI5nbxWzVd4zb05HxhBJf9WLDVqAP14e8hmF9uvp6bJzOesVP6Z
	f0iT3SDvxBgXEULy+X1gbHSqLwSXI+AJcgISS0R3F4oWwtsIpTfruNcP8AXXcyD7UbqM/0duiHG
	TBW8En+i09VFEjAAlf4t5kGYD4sj07B7CANd9o6glu2myQ8NmLq6qiWGA0vRkZZDP0mwlyIJw25
	wZDMurK94oE7CV8SCibSA/uL7of+/Af+tWTvR1gll2mM81mKMfLAAroSGBJnUh2CalEwuSCJcOq
	SiWSbH7MKNyPcgpo/jr1A3GCermWFzZDEtPanlUkVwe73fk=
X-Received: by 2002:a05:600c:350c:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4ba0233ea4fmr53156235e9.9.1794328168839;
        Tue, 10 Nov 2026 08:29:28 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:28 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 05/18] bpf: Declare fmod_ret targets with BTF_FMODRET sets
Date: Tue, 10 Nov 2026 16:40:25 +0000
Message-ID: <20261110164046.454431-6-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
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


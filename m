Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633390;
	b=sba5fW94b6zVXWy30ioxgAUvLyPgGN+WUV9N7SbOysaVIKb2Y2tXhSxzMY+Rqekspg58
	 vkIZs89Y0DYHmO/CamKWzuoMeZEBVAat8sy9yO2l80OuaN8Qmh/iE0CggXazvFAUfx4hm
	 DMT1NEvBOmpp89fQH4J6gNg5bENfq/X2UI5dK0/+hUEK6MwMGEb1Nv4++e6sDEHSd1jPr
	 ezRoObRaCDMYbxLZwV3E3ai0bqIgjYuH3Ebo+rxY206dlU7QzXgS9n4EwDlMNQKwOFQHY
	 YaXPfbuixM+dsCSzhcV+rEGqHUSjXfS5Lltojc7vqFLp5s6tLW03acReTs6pnI7SgUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AfMnsvVTtJkxmfxbs2Yxgr4hKJCAmoy0tOEQOe4nWZ0=;
	b=yTfdgtFd6iSA5JLFqD+FdKUGqnb7xc81W+WPjfWki1BRSmmdIGcg/0EmB32rdLuahRbk
	 KWk9SzPh19IR911N6StupkcPAtDz961OnVHif9O+R8K6rseSOX0aFZn/tZO7CQDGutzRh
	 fEs2SMAHfiq+tP0mC4HGM313gPBfHvS/E7V0l+dpFpISwOLHL7ViHJIfFkmmTGY8psDw+
	 y1JNiXFGO16IdzX1/Fu7I9I35ub3xsrJGa4zmuPatYhZI2POLDEe4fkIBDJaHbzDorsh1
	 KsgtITKJuVhK2cqJ9D41X83auKbLoPSPy62saIAURo85eXKlOw40lhFfh5jnA6IJfcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBu3G+7A;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160260865D7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6160260865D7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBu3G+7A
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c49c32650adso401210966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793633389; x=1794238189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AfMnsvVTtJkxmfxbs2Yxgr4hKJCAmoy0tOEQOe4nWZ0=;
        b=eBu3G+7Akvd7S5AmxMjgRwbGGdaOYmvss883RtWON7poOSslYNAYnjLsmkiIM2l8PH
         0dbDdV8Gma/D/wO93QPARhoO+UU/5YGy3quG2VLJPbv/w8ekBOawD/spCsrocvs2aZWU
         7iTioHmJ0h9mOKxJ5CkiJGoX/sR3DHwXXk1xiKe7c/2AN6qk9h+ltisuJXEC6UveCFIV
         qSMJbPN13YzJQ7nmdTg/e8YQPAv0g1Ig/JWQ8fA6QaGw9XzFS/7zH6hDgavEFkF2eu5c
         y1EyA2uKOFujmaUMBDkBgf+2Sl3VxhaHKdNKBAkH71qbOM5ATJyZkf9gRyRU7sdWfpuT
         lwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633389; x=1794238189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfMnsvVTtJkxmfxbs2Yxgr4hKJCAmoy0tOEQOe4nWZ0=;
        b=tJFaRKlANXNim0UzHPPyB46CNPe1l7A1ztMufeZ6hGu3zQGumSXxYKArZKhrLFmQ3F
         xKBijnoqtsHMpdfOKeNjzE3cssUZj30AKcsnLWrYfcx4FuKFyX6/ig1ihgJFUkUdLQj1
         GaKfyBOtZc2KN7q41XZa7+j+TImmok6R+hBpSx7gna3Jx8AZW1dgqtdTonuC19twS48A
         5l+YkSYJfP8DR6JUbe69+z1oOpBx9g/WgtnEcNy6iIDxnOHpXpbU4i2B9v6eaGHkxId+
         e3G86gXQnIdG0QsMajerZ8wh0z6IufZE3yvWyciPB4Hg+xunEtSU0Tb06E4jt3JWU59z
         veog==
X-Forwarded-Encrypted: i=1; AKwUvBzr1BWn12+a2mOMXAJ6Jx4cR3lQ/KDol8Lns1lRu9YR9w3I3huWUbG9uKzeuwiTVI/rFMxoj2VWjxXUsbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wb9LHQq4XgyjzjWOlq9VLf6n9vWqisgsohTQJZ0mJLQ+osg7p
	COOgE+L4S2Fw0tfJGOVUnlrS09POpkBYG22zU3YtC9B99Tz9NlxfqDkw
X-Gm-Gg: AYBFou1QP8ugEGAzssHUwr1q8gtmT7bXq6o/0QEUBC9I6OY45clWRAxdwWPBnWRbxbI
	hCX1I3aHv4H4uL5IRa/qPC+JdsQ93wvTQUemGsUZwhPBnir1jb55ZfcwEjialYUzrG/qdrEZLzO
	rYJ9IpITVnjcNoa6Nz2SMmnxuwc7Zz0KCmm/pn2iTVMy8PrtU5m3RbPLzoz7AXG/Xx7g0tq88xq
	W4akmNrW1eT0tFyQHKOMqWO3RuHdFzms5Z9dcovAAUz7M4yo6WgyeTqqgvXlriiZWoQ+zlI5k1C
	CKgcaof7Ax7azjCKKgk+9qIpT78FKHk8eYSaFxpgFxOykNFMGiN/R65tOwKz49xYcAgA5xr9if9
	2Y3hOcMGYrywjOmIg32U7pdFu0A7wcO0ioqVLkVvdvd+ioRjghxNNZEpx0HxTAHK6F7adCm/TQH
	G0uUVhS/jxnj60PDpN0vL9XAdFmDyjkIcR2qoKGXTZQBB3fwtcWl/ylBt5pjLFN4bKpMkR6VREE
	G9f5J5dFl1RJXpkcayGm/rRF+WeM6abmQ136T+OmfMckKg95tLJmUF5cxYVvLTblXHmHKx66rAM
	1jr/T7qSTDpdPOj5a6xZrqc/D0CkuOoe9U/vxVmUBPGakcKKx4XSq3wRDpQmkftISLQJIiBtIIQ
	=
X-Received: by 2002:a17:906:7314:b0:c40:5de7:33d3 with SMTP id a640c23a62f3a-c4ca7b450f4mr799928466b.35.1793633388489;
        Mon, 02 Nov 2026 07:29:48 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725a2sm19381692f8f.13.2026.11.02.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:29:47 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: kpsingh@kernel.org,
	matt@bobrowski.net,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com
Cc: Andrea Parri <parri.andrea@gmail.com>,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	sdf@fomichev.me,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf] bpf, lsm: Fix cgroup shim selection for socket hooks
Date: Mon,  2 Nov 2026 16:29:12 +0100
Message-ID: <20261102152913.366237-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
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

bpf_lsm_find_cgroup_shim() picks the shim that runs a BPF_LSM_CGROUP
program from the first argument of the attached hook. It compares
args[0].type, the BTF id of the argument's pointer type, against
btf_sock_ids[], which holds the struct ids of struct socket and struct
sock. A pointer id is never equal to a struct id, so neither branch is
taken and every cgroup LSM program runs through
__cgroup_bpf_run_lsm_current().

Socket and sock hooks therefore run against task_dfl_cgroup(current)
instead of the socket's cgroup. When a socket is used from a cgroup other
than the one that created it, the caller's cgroup policy is applied instead
of the socket's, and __cgroup_bpf_run_lsm_socket() and
__cgroup_bpf_run_lsm_sock() are dead code.

Resolve the argument's pointee with btf_type_resolve_ptr() and compare that
id against btf_sock_ids[].

This makes __cgroup_bpf_run_lsm_socket() reachable for calls it cannot
handle: ip_cmsg_recv_security() passes a NULL socket to
socket_getpeersec_dgram, and sock_create_lite() calls socket_post_create
before sock->sk is set. Fall back to __cgroup_bpf_run_lsm_current() in
those cases instead of dereferencing sock->sk.

__cgroup_bpf_run_lsm_sock() needs no such fallback. sk_alloc_security and
sk_free_security run while the sk has no cgroup and stay on
bpf_lsm_current_hooks; every other hook whose first argument is a struct
sock is called with a non-NULL sk whose cgroup is already set.

Existing BPF_LSM_CGROUP users will see a behavior change. Socket and sock
hooks now run the programs attached to the socket's cgroup, as described
in commit 69fd337a975c ("bpf: per-cgroup lsm flavor"). Hooks that can run
in softirq, such as socket_sock_rcv_skb, inet_conn_request and
sk_getsecid, no longer depend on which task was interrupted.

The bug was found with the help of an LLM.

Fixes: 69fd337a975c ("bpf: per-cgroup lsm flavor")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
This changes behavior for existing BPF_LSM_CGROUP users: since
69fd337a975c, socket and sock hooks have run the programs of the current
task's cgroup, and with this patch they run those of the socket's cgroup,
as that commit intended. I'm sending it to bpf with Cc: stable because a
socket used from another cgroup is currently checked against that cgroup's
policy instead of its own. Happy to retarget bpf-next and drop the stable
Cc if you prefer.

 kernel/bpf/bpf_lsm.c | 8 ++++++--
 kernel/bpf/cgroup.c  | 7 ++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index f58dce888ff4a..9547d4f351103 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -95,6 +95,7 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog,
 			     bpf_func_t *bpf_func)
 {
 	const struct btf_param *args __maybe_unused;
+	u32 type_id __maybe_unused = 0;
 
 	if (btf_type_vlen(prog->aux->attach_func_proto) < 1 ||
 	    btf_id_set_contains(&bpf_lsm_current_hooks,
@@ -106,9 +107,12 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog,
 #ifdef CONFIG_NET
 	args = btf_params(prog->aux->attach_func_proto);
 
-	if (args[0].type == btf_sock_ids[BTF_SOCK_TYPE_SOCKET])
+	/* args[0] is a pointer; match the struct it points to. */
+	btf_type_resolve_ptr(prog->aux->attach_btf, args[0].type, &type_id);
+
+	if (type_id == btf_sock_ids[BTF_SOCK_TYPE_SOCKET])
 		*bpf_func = __cgroup_bpf_run_lsm_socket;
-	else if (args[0].type == btf_sock_ids[BTF_SOCK_TYPE_SOCK])
+	else if (type_id == btf_sock_ids[BTF_SOCK_TYPE_SOCK])
 		*bpf_func = __cgroup_bpf_run_lsm_sock;
 	else
 #endif
diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
index 57a785241d42f..9100d1c4f35ff 100644
--- a/kernel/bpf/cgroup.c
+++ b/kernel/bpf/cgroup.c
@@ -171,15 +171,20 @@ unsigned int __cgroup_bpf_run_lsm_socket(const void *ctx,
 	const struct bpf_prog *shim_prog;
 	struct socket *sock;
 	struct cgroup *cgrp;
+	struct sock *sk;
 	int ret = 0;
 	u64 *args;
 
 	args = (u64 *)ctx;
 	sock = (void *)(unsigned long)args[0];
+	sk = sock ? sock->sk : NULL;
+	/* NULL from ip_cmsg_recv_security(), no sk yet in sock_create_lite() */
+	if (unlikely(!sk))
+		return __cgroup_bpf_run_lsm_current(ctx, insn);
 	/*shim_prog = container_of(insn, struct bpf_prog, insnsi);*/
 	shim_prog = (const struct bpf_prog *)((void *)insn - offsetof(struct bpf_prog, insnsi));
 
-	cgrp = sock_cgroup_ptr(&sock->sk->sk_cgrp_data);
+	cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
 	if (likely(cgrp))
 		ret = bpf_prog_run_array_cg(&cgrp->bpf,
 					    shim_prog->aux->cgroup_atype,
-- 
2.53.0


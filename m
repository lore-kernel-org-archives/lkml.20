Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724958;
	b=5ErIYrgE1IY2x+7ydvYzUI3Zn5VpgqP9sxGvz6W9WftchYmrXj1oz1AyThHy5Cvyx/q0
	 TZiSc/6rvmUtiGDz+fzWBNBOT9Aj3ipdtDLIHskl6cFbIxJDjkkdCg7UYG8Jzz5JIoSRN
	 Q+nHVbMH6WcBiYEKIoZPgXL04qk2hz4cu/GJrkiq25EQaZd5bJ8W7aZv7MUjg1NC32PRc
	 P+kxAQKxTKDYLBBQQBmRlhNiWx+WJiWPoNjcDh9Ptg7uXOUn0b97rdJ+mjLbOkWIAshwk
	 I5PlPRyJ8o2TEp58I1KRzmEWdTrqStbmBuyfH2FBsX8clZ01ZJX9OUz0pBL3P0APpIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dx0fQ9jWsbJGGEfFlztRkY1SCts3dYp3DMV0/n4sk/0=;
	b=2kqgykEUv8I3hrmRnkbsi6QpMKvq1NYjmFXHIOPnSaU1LzJ6xPyjDYCIZM9CJJuAhVQj
	 nvVaNqpu4kVOI7BRepHXCnNbuoY/KX3ppyk7HPa0w7USwhsG8RHR7wqL28+htFjZcU/6r
	 DFCBKw5NTP+3W94GkXcXmM2QAPQ4F1TtKOh/Xf7AmEGTGBmMVNGgSNeFl7uIhjlf5oRMp
	 T4fu2r16b3cJBfkq3/R9klMnYopzqsKeLGw42kzXIvzKOKc9BbqhLl/Dcm0PmDT8GARrY
	 2359XNCxYENtU1OUbktaxI0Bz7tN9m0+iSX8YQISqAtQfXrWHUhF0LYAxSGr2jNhnKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z920EnPC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDE606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DDE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z920EnPC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso36096055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724956; x=1794329756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dx0fQ9jWsbJGGEfFlztRkY1SCts3dYp3DMV0/n4sk/0=;
        b=z920EnPCDnXnUS73ipITtZNX/YHqpZa0drLuvN0rSPm7+jJyQ2fp1Ei404814Vumuv
         o9lM1qdTr5rQc5+7Y/BApDoQZo0Nn2/tFgCV8cIqGBoEZl1PoHMX2m6xz1puawvkpFID
         /fOjaKp4rz2UehtNfnd5s++vuhjZX8RO0PBLrfU811mWZZZlsqy+QmWUmoasOTeJEskF
         d4lujM9f8yNwUYU4kDWcYHqiXn7hH5XhHk2KBL7D0oh2FGRBJaw389zcIjy3a/bgKL2g
         Mje31JrrxgfnG8VzL/WfyhYSiPL42fOUMLzes8zT5r3ct07qSCKg4lWrlOZyozQpaRuZ
         a84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724956; x=1794329756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dx0fQ9jWsbJGGEfFlztRkY1SCts3dYp3DMV0/n4sk/0=;
        b=sgGS/k6TTmu7r+wGUHQXZyrYP+sScE3v0mUYCgBHeZBvebnFpPiiOjZo++g5pxDHbS
         jbN2x34B/xpkZGJsUA+roCthokAZ+m7ixQP9ntJ60raOzSVeRvknPNem2FCGeTshN80Y
         LehdEgM/KPY51GvkQOd2ZryhLNKqOMMZTzSH0qf1mrMsOgaVvdOZU/c2DCf1gGgPAsmF
         csQPn44RSmuJeWqiGnXpSGc/cAmuxlxZKS6CIBgKzgpRiSBKDonmEeYv4uflStxvdoO0
         dS4GyrximJ8r3vl03H1831tlkbrHOopMG0GC7rid5c7sMYmTfVHm7WfoF7NDbtmWu/PT
         9X9g==
X-Forwarded-Encrypted: i=1; AKwUvBwjftI+9wwB1Pv2MLdt+DEC/is1QRpjeGyzNGDlKDZng0R2HpumIbet75XiIxcdpT5cA2AVZ55dvSL0i04=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nGusrE5BVlO4PZvxb0RVsIPfaI7E1JmXJLZonHmbfxEKQ4+4N
	jDE8AsWTtu2cnlCQHS1NHPnxcca7lUXx1NeqeYYWi0M6eVFUQg4bLK1I
X-Gm-Gg: AYBFou24X4HAHk8OXfg7hgHo9gZ0qX4GQko+Ro8T5ozEJLziNFtwknjASYpiJMbetaz
	XQaxr4Q1jY3PSR62oE0CyEutWgcHDsgwtOFG2oGKwdxUanhIKcgxjgtmjlhLPlOMTbr8Cxa4fFt
	wDzn/6xajAowOY5EDk7Xo7MRxWPaln3Z39nLzJQ8FHG92UZ6IrwCY5cn9UbFz+QgmGexKnRV65J
	cVtUOsoaM2CqovZO5MAzqM8/YrVQ3NkmNuHF0jnWR0DDXTRmfGgpEWp9fAkucfiVKFsC3KCCV1y
	ZRGV7lB1PpEqY6ZPGnoBNsX3WmvflY/xbHvYVRr00keZaYCH/vlSFyQbEeGf/Hv52y+R6IefI2U
	sLONHAbo5F7bxM2n8udkCW8XeeblfxSgWbsAqNajC+mlQQ2NhWA2vvibHOEjVjRtYm7BGjpoeAm
	v0gjV2bZsesCOD2oJBoj2UfYJymMCmDkklMHmPObSokKa6MNokHm1PW/ZM61S3dvN35CHb0iDYO
	FIdxIc+DdPnBYihSxt+7pFzzs4UMs99SXTFF0PK1VKsjYGac4bJF6FBB3Kp6N6X8CjdeT08OFVz
	Q6QgR/M4FP4kihp3KaA5DRINthhuKP+LuP9dL9Ejk5/OSIlAr9HiO916fRTt+VSm9gVvJATukEy
	LTbVj+89whylG9SFJvSG3oC0=
X-Received: by 2002:a05:600c:870f:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4ac1899348bmr289523635e9.30.1793724956048;
        Tue, 03 Nov 2026 08:55:56 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm239726215e9.1.2026.11.03.08.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:55:55 -0800 (PST)
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
Subject: [PATCH bpf-next v2] bpf, lsm: Fix cgroup shim selection for socket hooks
Date: Tue,  3 Nov 2026 17:55:40 +0100
Message-ID: <20261103165541.291744-1-parri.andrea@gmail.com>
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

Two socket hooks are not always called with a usable socket:
ip_cmsg_recv_security() passes a NULL socket to socket_getpeersec_dgram,
and sock_create_lite() calls socket_post_create before sock->sk is set.
Add both to bpf_lsm_current_hooks, so that their cgroup does not depend on
the caller.

socket_post_create is unchanged when called from __sock_create(), where
the current task allocates the sk and gives it its cgroup.
socket_getpeersec_dgram keeps the current cgroup, as today. The other
socket hooks always get a socket with an sk, and the sock hooks a non-NULL
sk.

Existing BPF_LSM_CGROUP users will see a behavior change. The other socket
and sock hooks now run the socket's cgroup programs, as described in
commit 69fd337a975c ("bpf: per-cgroup lsm flavor"). Hooks that can run in
softirq, such as socket_sock_rcv_skb, inet_conn_request and sk_getsecid,
no longer depend on which task was interrupted.

The bug was found with the help of an LLM.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
v2:
- Add socket_post_create and socket_getpeersec_dgram to
  bpf_lsm_current_hooks instead of falling back to the current cgroup in
  __cgroup_bpf_run_lsm_socket() (Alexei)
- Drop Fixes: and Cc: stable, target bpf-next (Alexei)

v1: https://lore.kernel.org/bpf/20261102152913.366237-1-parri.andrea@gmail.com/

 kernel/bpf/bpf_lsm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index f58dce888ff4a..485e8fe8524c8 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -66,6 +66,10 @@ BTF_SET_START(bpf_lsm_current_hooks)
 #ifdef CONFIG_SECURITY_NETWORK
 BTF_ID(func, bpf_lsm_sk_alloc_security)
 BTF_ID(func, bpf_lsm_sk_free_security)
+/* sock->sk is NULL in sock_create_lite() */
+BTF_ID(func, bpf_lsm_socket_post_create)
+/* sock is NULL in ip_cmsg_recv_security() */
+BTF_ID(func, bpf_lsm_socket_getpeersec_dgram)
 #endif
 BTF_SET_END(bpf_lsm_current_hooks)
 
@@ -95,6 +99,7 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog,
 			     bpf_func_t *bpf_func)
 {
 	const struct btf_param *args __maybe_unused;
+	u32 id __maybe_unused = 0;
 
 	if (btf_type_vlen(prog->aux->attach_func_proto) < 1 ||
 	    btf_id_set_contains(&bpf_lsm_current_hooks,
@@ -105,10 +110,12 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog,
 
 #ifdef CONFIG_NET
 	args = btf_params(prog->aux->attach_func_proto);
+	/* args[0].type is the id of the pointer. btf_sock_ids[] has structs. */
+	btf_type_resolve_ptr(prog->aux->attach_btf, args[0].type, &id);
 
-	if (args[0].type == btf_sock_ids[BTF_SOCK_TYPE_SOCKET])
+	if (id == btf_sock_ids[BTF_SOCK_TYPE_SOCKET])
 		*bpf_func = __cgroup_bpf_run_lsm_socket;
-	else if (args[0].type == btf_sock_ids[BTF_SOCK_TYPE_SOCK])
+	else if (id == btf_sock_ids[BTF_SOCK_TYPE_SOCK])
 		*bpf_func = __cgroup_bpf_run_lsm_sock;
 	else
 #endif
-- 
2.53.0


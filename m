Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605982;
	b=nZMLkIlLrdhW8vTkyV+uUDn7RnQy2qnJ9GVgRQCKSjvYtn6rUpjowK1ciEWW8BbpG5Bu
	 fc0QDxypARrC2r9Ql/RSXrRTRvsTXIif9bHuBRxvY/daKCZc41xC9QpK+QRTTqYu7N2Bb
	 YZrLkrnKwXoOqIufQNP7rHiBJBRLiZJNwjvjNctSr2K6IsAyJEkWRNcHQkFac2OH/ciog
	 n4HHNsAMlYXPtUYar+1c9yc8FqAZKIffTLzDHeaC22RxWblBYnMmk9/mGDaH9d2O6pDRk
	 DWjsaUB48FPV4t1o1qmFyJAJgbiIw81uYJEOGjHRqDv2ebrUWoXQnCn4CxTz5ME2Z9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605982;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Nt+tD5eel1+juGfB0bn0ewMdd0XQY42b0RXAW/sHZp8=;
	b=rFYmLC99yfvN9CY4dTm8LhmwzFHuY1jgZfkmIrm0cvGQ09JPpT3rg/fVdI7/C3ho9HFm
	 swbJSwcHE4XkSwo02dfj1YeIzg5GtnE5yK72Zbu5Sxda+VJ1LU+LgWe7Vxr5r7qkAFyGH
	 TMMJIsowhk2vPsiCX3rdqm4pGgsikb9Tb49yV755RsKB7EdjT05Tzf9RJBufkpflJlcxB
	 jqQTsl48e+W4RhmFsS49VmtVXknK0cTCcKJ7z/Lxwwx2nrSQDpCuWNGd9ZAZcI5zY798A
	 RQr2Y1fZOJsTlu4sMxYsiGJVMrEqHWIVxmXPBRam9w8A7yWykr3IDJuHKA7V/q6gQFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xkAv4AJb;
	arc=none smtp.remote-ip=91.218.175.58
Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A16606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A16606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xkAv4AJb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SyH/NBefpbrhrMgpO4cBEl+yb3ImXhQAcjtwk1134+Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794605978; v=1; x=1795210778;
 b=xkAv4AJbhizxO34SZGkSQ9zn8x2hZnwl3awQXN2Y4awt26z0PpefsWKVcIc47YC0FG0U5iJC
 SKTS2U6dZT75Hebc6BzPhqEKOMbOdZxWIzprEoDjDUm6QVAeLZ9et+4osvvcuntFjkgm2HiwdMM
 hfSuKrHuG7EMjgPAkc107Ji0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5cc9cd8cf4c2abad;
	Fri, 13 Nov 2026 21:39:37 +0000
X-Mizu-Trace-ID: 5cc9cd8cf4c2abad
X-Migadu-Flow: FLOW_OUT
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Amery Hung <ameryhung@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Nicholas Carlini <npc@anthropic.com>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v4 0/6] bpf: Scope callback arguments to their frame
Date: Fri, 13 Nov 2026 14:39:15 -0700
Message-ID: <20261113213921.1646681-1-ihor.solodrai@linux.dev>
X-Mailer: git-send-email 2.56.0
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

A callback-calling helper can pass its callback a pointer that is only
valid for the callback invocation, and the verifier has no way to
express that lifetime.

Two helpers need fixing:

  * bpf_user_ringbuf_drain() passes a CONST_PTR_TO_DYNPTR over a
    sample it releases as soon as the callback returns. Saving this
    pointer in callback_ctx leaves it pointing into reused kernel
    stack and allows arbitrary kernel read and write since v7.3.

  * bpf_for_each_map_elem() over an array or per-CPU array map passes
    the address of a u32 held in bpf_for_each_array_elem()'s own frame,
    leaking four bytes of kernel stack.

Give the callback frame an id and make it both the id and the
parent_id of such an argument, so that slices and clones descend from
it. Invalidate the id and its descendants when the frame is popped.

---

v3->v4:
  * Rebase on bpf-next and include the callback setter cleanups [1] as
    patches 1-2 (Alexei)
  * Pair frame_id in join_func(), and add a selftest for it
  * Drop the Fixes: tags and Cc: stable
v3: https://lore.kernel.org/r/20261106231157.2840635-1-ihor.solodrai@linux.dev

v2->v3:
  * Replace REF_TYPE_FRAME with a frame_id in bpf_func_state and drop
    the preparation and refactoring patches (Alexei)
  * Rebase on bpf, and add Fixes: tags
v2: https://lore.kernel.org/r/20261009202759.50520-1-ihor.solodrai@linux.dev

v1->v2:
  * Add the refactoring patches: release frame references in one scan,
    and fold diagnostics into the REF_TYPE_FRAME introduction
  * Replace temporary argument mask and deferred register scan with
    reference acquisition directly in the owning verifier state during
    callback setup (Eduard)
  * Reuse callback_park_dynptr() for the nested drain test
v1: https://lore.kernel.org/r/20260922010333.1226537-1-ihor.solodrai@linux.dev

[1] https://lore.kernel.org/r/20261106232110.2867412-1-ihor.solodrai@linux.dev

---

Ihor Solodrai (6):
  bpf: Share map-backed callback register setup
  bpf: Rely on callback frame initialization defaults
  bpf: Scope the bpf_user_ringbuf_drain() dynptr to its callback frame
  selftests/bpf: Cover the user ringbuf callback dynptr lifetime
  bpf: Scope the bpf_for_each_map_elem() array key to the callback frame
  selftests/bpf: Cover callback-frame map key lifetime

 include/linux/bpf.h                           |   2 +
 include/linux/bpf_verifier.h                  |   2 +
 kernel/bpf/arraymap.c                         |  19 ++-
 kernel/bpf/join.c                             |   3 +
 kernel/bpf/states.c                           |   3 +
 kernel/bpf/verifier.c                         | 128 ++++----------
 .../selftests/bpf/progs/user_ringbuf_fail.c   | 161 ++++++++++++++++++
 .../bpf/progs/verifier_iterating_callbacks.c  |  91 ++++++++++
 8 files changed, 316 insertions(+), 93 deletions(-)


base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.56.0


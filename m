Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504479;
	b=H5YAx5Xy1hGMmdyxseVd+VuqcgJb+b0IxQdleWZNBnpLK5JZ061ZnnyiLARCARTrQW3R
	 HFFfJfe5UsYyUcN3D/rQydigh4ufk1nNUU1OaEMJmTWkpVLflwe5/jtHGEAHor9Gs5h3S
	 BJgpLVo9qYfkef99yja+mC3RV94uEUKzFkDYyjb0u8QmhApqX27PyMf7wOwOeOcdAb0si
	 O7jDRm2dlhr/K4gUTDW5WSHbr3Jdy0Z8Dm82NT1PUg4ye9KN5Kmeuc8V4OTFRqDVY8673
	 pcQX+0wDoQnn4jr5efbtPYAlloWIMZBOmgobUq3t/DEXkipmKUSTpDXKtsGUExblybw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504479;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=msn9KDZfrO0QD3fBAuONrovFFP9yIYwzBUbwG0cCJrM=;
	b=EqmEWhQC2vtQfcoeFh2K61GWoByaGMpiFMf0iQD79B4nHvRSzi9BgYuCZBj7+tqbl5fW
	 P0Fz0jg1pq2Vn67E7askJD0KJBPgd4+guGlhD0/pBaYUZU+wkL8b1i0lfBMlZAORZApD+
	 lvg8cD5SJQrIS+q5mMnlSUGSfqg751Qsi1mWvzJaMWGlgm5odQXBSyQJmotw3jodDzhbr
	 RFzIcQw8okFHL6KlCmc9OHsuEvz3Yd7kRig4GrAS5nJhFqYSf9x3VK7gf2QF8C8DMO79+
	 bmdHBORWJx/M1nhPPiwleB7m0fTVsZfm5599nmvWtbRGJPVb6nvNpdWwsK9tU9zLWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dhQ9O0UA;
	arc=none smtp.remote-ip=95.215.58.174
Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C03860A3806
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C03860A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dhQ9O0UA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TST9E/y57Nvizr+gsVIQqWA7f/dSY+xcgKykPeBhINA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794504477; v=1; x=1795109277;
 b=dhQ9O0UA/LoXKwaZ7sg5/cB7iMo78P8TY2vVOGJRIuobKH2i9ruTJ348pos8X4Pw/3NyYE7S
 PGcbfakAsJDa+zRl7zIGyZkfBPoAfdfrHa4uNwdjASDz5wq6xt8reb2bU8p6m3R2h+pv4MGcT7u
 vs54oxgsVRhHPPhJ/fJDFXtY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ebabef697ff486c;
	Thu, 12 Nov 2026 17:27:57 +0000
X-Mizu-Trace-ID: 3ebabef697ff486c
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Amery Hung <ameryhung@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Meta kernel team <kernel-team@meta.com>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/3] bpf, cgroup: Don't read freed effective arrays in BPF_PROG_QUERY
Date: Thu, 12 Nov 2026 09:27:13 -0800
Message-ID: <20261112172721.440275-2-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112172721.440275-1-shakeel.butt@linux.dev>
References: <20261112172721.440275-1-shakeel.butt@linux.dev>
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

BPF_PROG_QUERY gets the cgroup from an fd before it takes cgroup_mutex.
If the cgroup is removed in between and its bpf refcount drops to zero,
cgroup_bpf_release() can run first.  It frees the effective arrays but
leaves the pointers, so a BPF_F_QUERY_EFFECTIVE query then reads freed
memory.

The window is small because the release work also takes cgroup_mutex.

Check under the lock that the bpf refcount isn't zero, and return
-ENOENT if it is, the error the fd lookup gives for a removed cgroup.
The release work only runs after the count hits zero, and it takes the
same lock.

Reproduced in a VM with a debug-only delay between the fd lookup and the
lock: KASAN reports a use-after-free in cgroup_bpf_prog_query().  With
this patch, the query returns -ENOENT.

Fixes: 4bfc0bb2c60e ("bpf: decouple the lifetime of cgroup_bpf from cgroup itself")
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 kernel/bpf/cgroup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
index 57a785241d42..9258c2669fa8 100644
--- a/kernel/bpf/cgroup.c
+++ b/kernel/bpf/cgroup.c
@@ -1446,6 +1446,14 @@ static int __cgroup_bpf_query(struct cgroup *cgrp, const union bpf_attr *attr,
 	if (effective_query && prog_attach_flags)
 		return -EINVAL;
 
+	/*
+	 * cgroup_bpf_release() frees the effective arrays once the bpf
+	 * refcount is zero.  It takes this lock too, so a nonzero count means
+	 * the arrays are still valid.
+	 */
+	if (percpu_ref_is_zero(&cgrp->bpf.refcnt))
+		return -ENOENT;
+
 	if (type == BPF_STRUCT_OPS) {
 		u32 type_id = attr->query.type_id;
 
-- 
2.53.0-Meta


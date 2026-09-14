Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1080B46AF00
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405354; cv=none; b=SG3keJRVPtk0+6OTbk9yPyf9b0mMpXKCsg3wtBAkj1+y44klcSOwTi9YV/kffSksAJkB7ON2xsvx0VDhk3iI0l5pNAGFHXa0fpPD3Em0eEYXt74HP3uhqH5uj/kuIDlCb4Y59ycpsuxOU5uvJqqQMhmcZ1mMvwMWkFJAeB18YXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405354; c=relaxed/simple;
	bh=CjIjWkMTK9FskVJQo3nHBXYkjnAhMgGt1KVw9EjE6K4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Liph1EXEA63K76dEPer8tAs0nt+lraRUtkj3AI11wiU55X3aerBL4RnY8ygGY+ipzWfwZfmUvC4pPQVQ9W6hsI0LVg4bMo6L1TVE0xKSEJ2dyy+yGsLiZLesKWXXfYHH20Qovi6R6GvbJgGSn01HOUNnSEC1w0HOI+WCIGgCngQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbBvFFV+; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbBvFFV+"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3735252a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789405352; x=1790010152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJDVd5ug/v9/QfAbvxEbhWXl7wgBpdpWGbbUb99beIw=;
        b=SbBvFFV+sCiktopV9WY+N+qPZL3xbUamt1N2h+slT0+kvmhZb0BBnfFDBtVywmNWuO
         jxXKj0YGZecLgCM3avrMl6DRKsxvMmO++bpEFQ1Fj+z02T7MflzliMhuvnK076eeBsrw
         T7pVOTQHb54cerFbnD1wJrfI8UPrm0vZGxZAeCycxeREqc8pgVZEJCUqlgf9l0hYzfmC
         DyN/A94xBDGgCeDlmRZqkEffXw/XpWHc0SGKEPmUoCFsO7zvWDsLMPZ3gkxmgF5nY7rQ
         GFSUnjCtuuhdyVF2BCZgVAk6h8PLmV4vS1xGhlJDbKTUC6oEnN+lkTP9f1dwopk9oeTZ
         s3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405352; x=1790010152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJDVd5ug/v9/QfAbvxEbhWXl7wgBpdpWGbbUb99beIw=;
        b=ivk/goZQUc1kmDcXnDPqmpgkhoYRs0EXO21tPT0Xs9G1IA2huVsDZFMxkx8+zxqXVV
         YIe47MrS1o0oNEXl3RNx/hs0LG2JlHdZz2SOdNCHG5wJvBlL8RNXRL7gJWF7GgzZDBmL
         TMaNA/O0ivEgK3xk8XXdv7beMJLdtORnIQ8b6It3AOzEezGgbYsdsgYjaQNFgSDpPjJz
         /L0Td5Zg1/1QYMyZPP7AUQW7eS9viuSvMPbctJl1Z/1EPAYd+4PxfesE2Fchds1yOVSl
         BpSWgRgfcpqPNab82U7L5Cl7YC7nvSTGPDM7KT+KuCQiVGgMhQOwzRTjDo13TB8960Ro
         VH2A==
X-Forwarded-Encrypted: i=1; AKwUvBw/Ous6Byo/xsTIBaNTUoKry3Tdk4spI6DXQQlLPMK4aboMzfOQ3WKOmo4XUn+rMRG2PtMFytdC1xJzGAg=@vger.kernel.org
X-Gm-Message-State: AFuF++mDLobqIgvHq4lFMoT/+NeaH7hLQTXqjcWtqpNWi0FY2dUf1Cwh
	vXLUqpPiYGsnsq+wQhVx7GjjuyqoEU2wC9wlP+Iwezo8y7mZ2mGieN4P
X-Gm-Gg: AYBFou0w2aXTuuQlBdOaSjeUly6BEFpOqpiIVgQS+coIlah7PzCX5YxXWPvz4H3UUx3
	N5ZZt5eT70FbAEk9t4ixWXVn+l4pzVoftIeg9IQTMznJJYFzxdajk8H9ITY0dh6C7TG9c8g3qie
	N0iYzx/8Y/nE5nbQEg3L5sj/7GOdN2xCm0C4h7KPcFbtfdUpL9KBVrgtZSe76tn4WGlQmYPBhbk
	DfSd6cKyA5rCEv+gKjrxR3e/I1ykcCpY7h1VvLOCsGxWW6t8pSJy1jKm55kBjZDTD3eME4MQL0p
	NJ7JczBC+kc7yA/O1f8dt0auQyDLOcvxGq6lgmahE+xxyIH84V1jReHu1YhSrOkn+u+Iz5tk6zk
	clSkfQ1mzmKc/zq6Ig1w8ZF5jQ5vQWxfBJDyI/fUGoiW8Mwx6l0au9I8ASy2UJjNI1N487Kr6pS
	ORT6addXdYDgmV60a9etYgdguDucaK76RatM70DmqATPOCBhixPkNhd0xmbSWqCPFl/WVroOriG
	FH1OCStkjxOkCK9msBLvAupwxfosC88ZJAMyw4j5hA=
X-Received: by 2002:a17:90b:5810:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39dec09871fmr6980757a91.17.1789405352147;
        Mon, 14 Sep 2026 10:02:32 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm52758255ad.66.2026.09.14.10.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:02:31 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitrii Dolgov <9erthalion6@gmail.com>,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH bpf] bpf: Skip unsettled links in link iterator
Date: Tue, 15 Sep 2026 01:02:07 +0800
Message-ID: <20260914170206.170723-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_link_prime() inserts a link into link_idr before anon_inode_getfile()
succeeds and before bpf_link_settle() publishes the ID in link->id.
bpf_link_by_id() treats such an ID-zero link as unsettled, but the link
iterator takes a reference without this check.

If anon_inode_getfile() then fails, the creator removes the ID and frees
its still-private link directly.  The iterator is left with a dangling
reference and its next bpf_link_put() accesses freed memory.

Treat ID-zero entries as transient in bpf_link_get_curr_or_next(), just as
bpf_link_by_id() does.

  BUG: KASAN: slab-use-after-free in bpf_link_put
  Write of size 8 by task exp/384
  Call Trace:
  bpf_link_put                    kernel/bpf/syscall.c:3372
  bpf_link_seq_next               kernel/bpf/link_iter.c:33
  bpf_seq_read                    kernel/bpf/bpf_iter.c:158
  vfs_read                        fs/read_write.c:572
  ksys_read                       fs/read_write.c:716
  do_syscall_64                   arch/x86/entry/syscall_64.c:84
  entry_SYSCALL_64_after_hwframe  arch/x86/entry/entry_64.S:121
  Kernel panic - not syncing: KASAN: panic_on_warn set ...

Fixes: 9f8836127308 ("bpf: Add bpf_link iterator")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 kernel/bpf/syscall.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index a8c9b2865c5df..2870ff3167d42 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -6044,7 +6044,10 @@ struct bpf_link *bpf_link_get_curr_or_next(u32 *id)
 again:
 	link = idr_get_next(&link_idr, id);
 	if (link) {
-		link = bpf_link_inc_not_zero(link);
+		if (link->id)
+			link = bpf_link_inc_not_zero(link);
+		else
+			link = ERR_PTR(-EAGAIN);
 		if (IS_ERR(link)) {
 			(*id)++;
 			goto again;
-- 
2.55.0

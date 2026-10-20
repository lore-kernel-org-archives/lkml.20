Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792467847;
	b=4SBvvEZ/3E3Qrnrj7OtjMhICHz8KNeB/jXYTuPIYDcTQwZeP6ESOsr3Ddhsr6QkMkW34
	 4Y/nshi9x2ZunL2lyav8lXqsi4qtKWN9IOzpfqTiCwF63QiRBNcdzuMKBoT5KS+rPmiN/
	 QpX8MkJsMpzGzGgRQiBdoQ88WD9dra2Jqw31Ee8VSW142sQivZimLpbfXHfb/ZwkXGr0z
	 hJ6osGEG8SvRmrhvxMlZ+s5Hj1veoreVyGzm24P8GluFfwYAUvK2nO5/WIKS3UXCaPjbf
	 HjkbA2uFISh0f5JJGZocUUC5EGSMlxNG2xq4zaqwnzt9TqvdKOlJR1yK+1MfzaPC2mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792467847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w90pHw3fGNmejRxHV3IQ5d0u+flhYgOFmkRKLGlwKUY=;
	b=Yvnsx4+ksGNaXL+aU2RhKWsg4YpZMLqg+pQ9LtxQdisjz5/gh5UQ7LKr9g6a0QYhSCpo
	 emso54MWdmL/mWnrC/TAzBgz0bq58eIoTxrb5jD9cM3o886dyXh0Gee//pri/ooCJoXc0
	 g00g7zMpNmwxFiywnwoV0RrgtbbfbTlkvOeYv51KjM7/TCl7IKRskzrdYkSkJlMWHa7+h
	 75vgalRgsRdiCwNTdup85g8O3Gt+hBAumF2tZ3bIKnTWssZZvhsqVEIPlBlEYiAZpJfqd
	 3ckUHxxKZS23TeY/t3EUcRycv0FyuCDsr9ijYzg6BVcLhXd57LxhEWBiD/89tnLFTyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKYUKJe1;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AB606A339
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6AB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKYUKJe1
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e901e114fdso13628455ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792467846; x=1793072646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w90pHw3fGNmejRxHV3IQ5d0u+flhYgOFmkRKLGlwKUY=;
        b=jKYUKJe1Qxu3OEvXl+CyKhrb1gysrHVihdVulnoLL39qaO9RJmO6ZZGFSWsNpJ9tTp
         q3MGx3yk/C4W/loq3ecbZZa8SBnRpMnqya2hLCJfkvHFRPKA9jFh8ul7rl6OrO/llfLW
         i1RcjOxJjGUhWkgCETfb7uab1oKAcCTft7lettkw2I29eXYLuMMyJTYwSqJJAgmQN2xI
         1mu2kNuhujB/uPJTp+pns+aCp24ExiXR0JITQJ3MLoxttWpVHcwmzsJsbqw/SmnM+Ytc
         3KvMeCRJkBXFfMWgWtLkB72qUOGzXzStX0WqbCYzXaKpYnNtRdO0DSnVAYCoN6dMs9ex
         llZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792467846; x=1793072646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w90pHw3fGNmejRxHV3IQ5d0u+flhYgOFmkRKLGlwKUY=;
        b=TBMDbeVuzrEc0YtQcWsCiICwIN9BoBNbAhxbFgJYURsl6oIbm+uDBAnFmDxEtR9wJj
         jAFePSyYWF3bzK6lzRnmx7jAm8jgI2UprB/17ymPWhgXmxJOAA2VK8jsMKKvBNRcS3Dv
         /QePPkCsdOGj8mKFSte2sAgnsaJ4GnuHGszGTugI0WU0gaXb5eaj2gxAQGfzaGDPMd8A
         ucMkE16gsBeniZ678p6ujLWAaC7FVAvuDMiZGuyxf+hYUWPGkVkHEoxx+hwUGS1CBS6H
         tRQcd7uSVrAxF8KsbTnawxuhH2rZpi3O7aK/nLH1DX71Qg8f2rpIPChT4sHidh5m9fmF
         MkQA==
X-Forwarded-Encrypted: i=1; AKwUvBxdGo79UAhsBvjaiNl6qjyNs9kSF99zf8X0S4fP+y/bE7QQKmgYqewMvlBok8mKU8huQyX5zxSdFbz6Q/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5QQquI2NeE/42iDY1wcc16JRXd2ieBxKErbSUcQwTlhRPvshW
	TRaAVbXdwzBNBJ94lDEZwQM20y1dAOh/3VjSOQso21uRhxNpX9PzZ2DY
X-Gm-Gg: AYBFou3lD6LY5dzftNZCpK4d49Z9LXJstpBEAa22hPCB3g1HflWvhChtHCcZqmbvXUW
	BSuLAJD3shznMGhL7nQxlKjebNFtvqifvzz9bqX9X5N2Zk0nMtLhR7+uiqGOC98wFkj+bMvhfa4
	jIyXSjcemd3E86s+/N7OSMkC10d6ZyFpXfJD4CkKuKTT3n11F5JEBdEN4YGzkDnzLvW2XrxCWI4
	PN/F+jUJDPO2ye02nXSrDoKt2F41gdGJ1fuO50Yc1zpEAXch8Rk+d9xoNw5RcICM9/MH/GvYtSD
	J1N7qf9Y/h8FY+nwm9aDzx0BUj6Kup86Vjju9M3tCQ0PcHE2xkUeWJ/0SUlqo+zgNOtKrydrIb/
	EVOjPQAT/Y4nkZ+E7cdPVqTA2okXQmv+Jh89EGE1wUyaRCcY2Gh4jOopwwVHdam97iwo+5Smp29
	cHhV+fWYM37u2O5xj7+8Q6olqGny2kLDHRD31EpwcA4v4uarpW/MiAey+3B9XCjdlLcg==
X-Received: by 2002:a17:902:c40a:b0:2e5:e1de:9c3c with SMTP id d9443c01a7336-2e9a6d2b9b3mr84139745ad.47.1792467846122;
        Mon, 19 Oct 2026 20:44:06 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14caa857sm8143885ad.12.2026.10.19.20.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:44:05 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 2/2] ocfs2: snapshot the dentry name while tracing file release
Date: Tue, 20 Oct 2026 11:43:52 +0800
Message-Id: <pm-ocfs2-objects-candidate-0088-v6-d3056754af7e660155d9-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-ocfs2-objects-candidate-0088-v6-d3056754af7e660155d9-0@gmail.com>
References: <pm-ocfs2-objects-candidate-0088-v6-d3056754af7e660155d9-0@gmail.com>
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

ocfs2_file_release() passes the live dentry name and length to a
trace event while holding oi->ip_lock. That lock protects the open
count, but it does not serialize dentry name changes during rename.
The ocfs2__file_ops event sizes and copies its __string separately,
so a concurrently rewritten inline name need not remain consistent
between those operations. The separately loaded length may also
describe a different name.

  Release trace                        Renamer
  -------------                        -------
  hold oi->ip_lock
  size the inline name
                                       rewrite the inline name
                                       under dentry->d_lock
  copy the changed name

Take a name snapshot before acquiring oi->ip_lock and release it
after dropping the lock. Keep the trace call and open-count argument
inside the original critical section. Cache the event-enabled check
so the snapshot is paired even if tracing is toggled meanwhile.
The snapshot keeps the trace name stable without extending the
inode lock over snapshot acquisition.

Fixes: 468eedde23d6 ("ocfs2: Remove mlog(0) from fs/ocfs2/file.c")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/file.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index 3c4637b32c09..8da73d0707ce 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -141,18 +141,26 @@ static int ocfs2_file_open(struct inode *inode, struct file *file)
 static int ocfs2_file_release(struct inode *inode, struct file *file)
 {
 	struct ocfs2_inode_info *oi = OCFS2_I(inode);
+	struct dentry *dentry = file->f_path.dentry;
+	struct name_snapshot name;
+	bool trace_enabled = trace_ocfs2_file_release_enabled();
+
+	if (trace_enabled)
+		take_dentry_name_snapshot(&name, dentry);
 
 	spin_lock(&oi->ip_lock);
 	if (!--oi->ip_open_count)
 		oi->ip_flags &= ~OCFS2_INODE_OPEN_DIRECT;
 
-	trace_ocfs2_file_release(inode, file, file->f_path.dentry,
-				 oi->ip_blkno,
-				 file->f_path.dentry->d_name.len,
-				 file->f_path.dentry->d_name.name,
-				 oi->ip_open_count);
+	if (trace_enabled)
+		trace_ocfs2_file_release(inode, file, dentry,
+					 oi->ip_blkno, name.name.len,
+					 name.name.name, oi->ip_open_count);
 	spin_unlock(&oi->ip_lock);
 
+	if (trace_enabled)
+		release_dentry_name_snapshot(&name);
+
 	ocfs2_free_file_private(inode, file);
 
 	return 0;

Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F103E3115BD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792300636; cv=none; b=ToTrIIKd3hQgqeszaTTVIoDRAhsab8/lBzbH6FBonsX03Rqn/muFv4Z3r4kF4kuSl2znQm5uOV8qKabqk0Z4O+oh5dE5R4zR2V5bi4DkPZCyLbtkyiDsUtLcg0CP4TV5AhQQwoHL0AZTOiL7i8VGLtx7fgkV+0rwwR9JqGb8lBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792300636; c=relaxed/simple;
	bh=KilMq05uzi4HI0Ezxaorsi5+F0WWcCljoUy8AG6YhJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7YWdyiT2wQe8hayyVzY1Uo1pXxE3rtSACWN5YstXXOZ8iREFTmFPNxP8bGs+nCT/DtCJ0F4D0nDli7kkmV1WCvRMhR02nOSddbr64uRpjbLxIZuvPwDhsU2MSVshoFQXDDwStdWyMRrdUMfQFehnVkAAASodInuJ7wkbqdDsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfJUqAxB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfJUqAxB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d7791b00so711965ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792300634; x=1792905434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VyyBqnBLxay79+QmsoCm7/qbWfkvgQCsej7i+h9gEsc=;
        b=QfJUqAxBzhZnuepeH2i+cXu5PLoESB3x3z+OhLFsBVxzXinzLnHUC0hGLR/31tUCya
         gRYXWTPph6V6ZFHpVSDgNdJlsHosH5F53jmD14plvKcvoH+/kpQzFfITSh76e1zxq/Ph
         Fzc5+a7Fb6yt+dE0PaU54Lx8VBDGN1myh2HredveHff93hJJ16nMQWqTb8LrHOO9I+c3
         BN3WJGArhOmZJErcCDFg3vKHIUIQgpm+5n+IVQMC9SZwx51RRmKPoXoCAfi9mwCgIFW6
         8N8f+epYVp667ryK7nd5mOtRe9Pu6Zm9IBUkYzuMZVMwsNf4l14pmKND9Z5ECWwicXMU
         NEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792300634; x=1792905434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyyBqnBLxay79+QmsoCm7/qbWfkvgQCsej7i+h9gEsc=;
        b=GBOVS07QGFsJxzvNr6TkAQ5LFKsPy9Eg2cjdXTKIUZJ6qqWrXYNoBMDn/bRYP+cNLq
         2AdGFPiUgBzIuFnRsmoVVTpRkUOLrTk7VswNsnQHs+WEmM081bXrBW4WqOGWEQAjnhJz
         KCg14zQYv1VaNnXTXg3YippXpHfGxtn2SNs36mSSN+iBJLP7pokxMkttbTce+SrpoGKW
         Qch4N0GwwbKckEmpgv4R933wvZwwAvqUork31LSgfb6scsyThlxJJAUrcRvrbAvDGzRG
         5iyu/N1iOWzMhfamn0AgMfdoBqM7VqvXa4KOwmZVBUSMEc3HKz9ftkSuaYCEdnkEYQLe
         kqMg==
X-Forwarded-Encrypted: i=1; AKwUvBySFjWUSwkCl3CKtJ7UsvCoKuIyGNue+ksikAE+PtfEEDteI0FiWQbS6TqKaOH+qPdyTsDHAMOyhuY4df4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5vEfkf2VsvEiqfANySLiv5IUCeTy9UtKS4DF1pGZKw2cjSGry
	VRezh05pfN/wwkpHAdTh8bM8tZpV2byzZBL4WTQH+GsUT54wp0BJtYcr8T8oqP7l
X-Gm-Gg: AYBFou0EetmBxaGoRq5t8/nvuFtojFYpYBDhpdGk7tqEvyUqK6EvZQk4kgeumZUjHPv
	NOT2KzQQaPRdRA3sIlX8uHYCO1XJyi0Ae5vqHwvJMtohMaA5SqprtO1bdWmidLdVz09D9/wIG48
	bsoUM/5vCpTdbBIXxsivw5R2+A2n0/Iij8WCf+OCAn7cI+dXM5adDQ2nYl4MOMUS+fxD81XJogm
	WTLx/qbp7xWYzrGeU3HSpwmBKtYO5ZavuW0+epjWXrEL64dBRFhwEqvICN2cyDStQdCXeGEkyWk
	Xfz1yed1HiOlltu4BQT7vlPKiD3L8hljq2/jGOfHtDVrSaSnAOIpJmtYGXMbPxZzDsWH1XVWFQY
	8FZyY21p4rrW7ei8SbPorz50eLSlaREUXeR+mz29dNfRQWPU+g3LjoG0ZcAWFUhtn8hsv7UdI7h
	+nEq+UGrTz0VnygEL4gEBtXAj3kVUo6u2N0gX5/7ZA/ZXcMQQgAPs/cCah0mxwWb+X+7yM+pPr8
	biT39QimoXCNRCAXlRv9g==
X-Received: by 2002:a17:90b:47:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3acef0f4821mr3298541a91.43.1792300634197;
        Sat, 17 Oct 2026 22:17:14 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm15432955a91.8.2026.10.17.22.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:17:13 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	jack@suse.cz,
	linux-kernel@vger.kernel.org
Subject: [PATCH] splice: avoid stale f_pos writeback on error
Date: Sun, 18 Oct 2026 14:17:08 +0900
Message-ID: <20261018051708.2422394-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_splice() snapshots an implicit file position before calling the splice
helper. Since splice does not take f_pos_lock, another operation on the
same open file description can update f_pos while the helper is blocked.
If the helper then fails, the unconditional writeback restores the stale
snapshot.

For a directory without ->splice_read, a file-to-pipe splice fails with
-EINVAL. A concurrent directory mutation and getdents() call can advance
f_pos and refresh the filesystem's revalidation cookie before that failure
restores only the old position. The next ext2 readdir can then trust an
offset inside a directory entry and copy data from the adjacent page to
userspace.

Only update an implicit file position when splice returns a non-negative
result, matching read and write. Keep explicit offset updates unchanged.

Fixes: 7995bd287134 ("splice: don't pass the address of ->f_pos to methods")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 fs/splice.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/splice.c b/fs/splice.c
index 9d8f63e2fd1ab..96378d3e65580 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -1349,10 +1349,10 @@ ssize_t do_splice(struct file *in, loff_t *off_in, struct file *out,
 		ret = do_splice_from(ipipe, out, &offset, len, flags);
 		file_end_write(out);
 
-		if (!off_out)
-			out->f_pos = offset;
-		else
+		if (off_out)
 			*off_out = offset;
+		else if (ret >= 0)
+			out->f_pos = offset;
 	} else if (opipe) {
 		if (off_out)
 			return -ESPIPE;
@@ -1373,10 +1373,10 @@ ssize_t do_splice(struct file *in, loff_t *off_in, struct file *out,
 
 		ret = splice_file_to_pipe(in, opipe, &offset, len, flags);
 
-		if (!off_in)
-			in->f_pos = offset;
-		else
+		if (off_in)
 			*off_in = offset;
+		else if (ret >= 0)
+			in->f_pos = offset;
 	} else {
 		ret = -EINVAL;
 	}

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0


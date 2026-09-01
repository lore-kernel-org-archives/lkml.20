Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BBA39022A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262840; cv=none; b=TLQZa/wI6XKCEls3ErdPkNhhDtn4hxnO4IaoU/Z8Aai+NYigO4hs3GJ3p5ri6+25Pm5KcLoBlGaBkMRft231M1s2Mkgzv8wJBw9+WPvqgX3lqmrxATAnwE2cHZz6F9/h8jhiAEblJKIX372gdcc3BL/s82Ko9j8mxt2Je66N5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262840; c=relaxed/simple;
	bh=P3hdtakuwRs8sGgX8SbTRg535OO9QDcChPnINsMgxSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N+8nRLhQOUHY6VuiTHbxDQXfmpgdh0m5KqaI1moARm3TikDq/Z+JnbC6aoNMHbeZ60rgvF3XnbTVc4jXSEN8xpF/AA3P+jaOe7zqysmVtVaYKaNQov8wVQYXcDCuKDmhqwPMoVGGEiL+7TJ+gpeq7xd3+zjAZaUYxqxNU9XA2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7t5Zjwn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7t5Zjwn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d91ded8174so6519215ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788262839; x=1788867639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbJYqMSdfBVb+Q8QcPC8voCv5rVOzcHLGQSLMYKXoJs=;
        b=Q7t5ZjwnMTl4U8MTQFe9FeEEbQfxsNXumEVXieQjXQVV+LMhjiPc8ZgZu4iqx1EzQ0
         QqSaEB884GtaVuF/QAwB7qA4SjV+qRR6/mhP5DAUeU+WSN08HV8tPf+CAu9K1CWGNNh6
         7qEGAxECy/VV1SFXATiCL5BB/6JR95IcOc8L3HeVzQt1DAdTcrHMP5i4mksng1rN75pw
         2/lKQAFdVH8bC9PlooAFIOVDKp9IjU+zEIkNclJJR1FCGewyI88To4fEr3nV/dyH9AvD
         KpxI0PiZECpY+3q2JLMi6mTJ4FHTHYwpb3PbcUPS9G4thtIiGpYKJt6eEN7go0yepQzL
         WuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262839; x=1788867639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbJYqMSdfBVb+Q8QcPC8voCv5rVOzcHLGQSLMYKXoJs=;
        b=M/Hjcm+xBCiLU4qOPmJRzVox+UGnD/cvxf5FWBVey6gK5uEqqJl8S2ZRyYbycP82xM
         gnC1ngGouVP7B8TJDQBzbfnVeJng2fkLweoyXrgQytEphM4IqtwxfCyy6sR012L4y1P2
         N3bB1CzRJ4JpTpGEdI+dLxmtpNvvHYq1Z7Qb7XMZYS0EQtfyRCtzTSKwvQOKNtmxr56d
         uN4P4A3LsbtL/iAuPW9qaDBAZCI3DycGHNJt3zYB3ySUgIADGb3kKUBoEx0BfZUsTSAn
         7SYDno12JHq3+XMHpLH/C6HhF1SbJfUYf0aGK0knUpmdS9m7sQwfiKejyQGhlcG8rb1E
         zUsg==
X-Forwarded-Encrypted: i=1; AHgh+RrUN2dX8nqxn+UKFiYdEVeqhrkmFvDbIB59miBMAC9GZd50/j2CmcdZO4uChLx36HMZ46Wt5Z+90RiCX+8=@vger.kernel.org
X-Gm-Message-State: AFuF++lUK33nZT1boKpghUGJoV0lLTE39ur5pn+uwoW+5wAZXLrv0rGm
	j/4+gdRGarSA4xW3e1dWGi5Cc7sq3F6J25qfKurqMRl4qSRvhztNAERq
X-Gm-Gg: AYBFou18gEhq1EVlv8j1lM+4byqjYJhqYZ86GOWcvhBcIqkwE5pjODdliBiNyHbzR0T
	KAi5ccCfI8bm3sx1mhpAb+goI0EeqWAEuF/SgYhzC9loIbEeH6GCHJC7YBcnErH+zEyGTe5RYDM
	8/3UfG+kptAQwGfwJeRWDYCQPrUuGWeDqYyXYKJyzAgLvsauNuGnhzE54YmrXzLMWBylh/0iPXA
	ww11W9rh1zJCmfEKtR+8hIAsfqiXHnsp2IuTYxzQwIBCemWzMc5R9Xf57+HtUJnVDWPGdMTHn6X
	unqgUiG8oaqKC8m39a6HODGE+ne+aOTF1xwbNXyt1CPgo/AHK3OL3YrgNRqFGJcEmRn4VsGhNrI
	7kyUdSnZuiRXElxE/A69xsQS2c0DNRTTGVJCWimMQi/Jc6+sZMkE55dij+OE2F2FWnZBntEwGkN
	T2NDyqga0Cq7DabOj3NQqAGPWb8WQCTqLUdT8QdOAQtayCYP+N5MQqUZKLfH96ldqDSIl2lNM90
	0QcT6GIMmNqNjcY0IoFohjnUEItNJ6bHRedYukPzJuN
X-Received: by 2002:a17:903:42cc:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2d74e1386bcmr327790875ad.14.1788262838570;
        Tue, 01 Sep 2026 04:40:38 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100:1e0::500e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b6c7sm49316075ad.60.2026.09.01.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:40:38 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: kees@kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	tasos.papagiannnis@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf-next] exec: Drop bprm loader before closing bprm->file
Date: Tue,  1 Sep 2026 04:40:11 -0700
Message-ID: <20260901114011.112375-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_bprm() currently drops what may be the final reference to
bprm->file before calling bprm_drop_loader(). Since
bprm_drop_loader() is attachable via BPF fentry and bprm->file is
exposed as a BTF_TYPE_SAFE_TRUSTED pointer, the file can be observed
after its reference has been released.

Move bprm_drop_loader() before do_close_execat(bprm->file), keeping
the file reference held while the hook runs. This preserves the
existing trusted BTF contract without changing verifier behavior.

The loader file and bprm->file have independent references, so this
reordering does not change their required teardown ordering.

Link: https://sashiko.dev/#/patchset/20260831092305.42062-1-tasos.papagiannnis@gmail.com?part=3
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 fs/exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exec.c b/fs/exec.c
index a14f28b15607..263b1f67f1f8 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1469,9 +1469,9 @@ static void free_bprm(struct linux_binprm *bprm)
 	/* exec swapped the mm but failed before setup_new_exec() freed it */
 	if (bprm->old_mm)
 		exec_mm_put_old(bprm->old_mm);
-	do_close_execat(bprm->file);
 	/* An unconsumed PT_INTERP substitute from a binfmt_misc loader entry. */
 	bprm_drop_loader(bprm);
+	do_close_execat(bprm->file);
 	do_close_execat(bprm->executable);
 	/* If a binfmt changed the interp, free it. */
 	if (bprm->interp != bprm->filename)

base-commit: d761934c9483ecde93fe99d8705282f716dfee50
-- 
2.43.0


Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC283446A7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791346239; cv=none; b=gqoe8m2U0tM95ATexRF9Tj+R8AGR/QD+BgBy8HGYqId+kmuSFLBIZh76EPoQhQVZtSmxMKWyngdRctSHEnL0tHs7z+RL7kpj+q1pmgAlVR8Y/H138eG8cLd5hGaSs/AnpNUkxkxsXOOzOECbe0IbeHvkVRuikW3wITB3Hozsih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791346239; c=relaxed/simple;
	bh=Dehgm5K17KIypaeoxVLrFfQbIbVwDYhVkmn2kILdwV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ftm0s9AwuCIVR6emo/+YepxRUVuEZ+6WuUjwYZlVAeXxwPXqRDG0OtTIzliepauLyWKFT0Y3VxMw6WF/jwaL6t3u6yQAgZFklhn5oEng5DUM39CBcIESOQSWIrHL4yYRKrGP02MQWX36kZPDAY1xmiQOixZezhjmTPeSX4x/P2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=TyUpRJ0f; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="TyUpRJ0f"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-82503732024so584308a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 21:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791346236; x=1791951036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBRXZKUt5w8de+h8RL2geRZW1pbP7GywRMbabudOQ+U=;
        b=TyUpRJ0fkdV7w7jhnkamoD2M5Np6Sj0eylTDuC8ZZ5I1yuide3B2q69m7EKm9IGsB+
         W5TgQSdzZxFsNTm/vURpVBsRwlNSc4qpNvJvTduUdNaXLrtbLO7DnqERnfoHqtwI/+4m
         KgmDEIhD1yZyk7SrGEz/DWqbpAWgV12+c2zTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791346236; x=1791951036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBRXZKUt5w8de+h8RL2geRZW1pbP7GywRMbabudOQ+U=;
        b=12YKehAACeys4Jlo+trIAK+JnedlM9fJmZCqyr4cmLA/usSFgR3FjdhoTLh3ykjRQZ
         biGdePqeH916/gdvk7miiDnNOCXrv3fWt0OlGXjIqO0fJfQfzoBIetNqzGSdCTcwdedS
         xorbYJDiCm+6qXbhdyBrKC/sEAUfpcw6vuDoNnJJVhU6bkvsD76U/S8VZjBsZL7/iTSD
         uqgI93N4Ras/ZHxPng30slbhVziy0nryDABy8SrtoshxpiyJhEbZoldA7Ao8eJ/k3zIw
         xfZ9nLUEHRgcM9/BC4c+7NCau1x4qnZMFPWCHw+Iy+/IazstoDNZA6wK6lM0SLY33MFg
         vt/g==
X-Gm-Message-State: AFuF++kGP9FJAmMhKEfLLbKIT0aq1dI1slnwmcKD73i3RWnIi2uD+Glb
	MbFsNQ4yExe51+hIylZrthtY3ot5HsihiSrUXgc1doAeV86z36+KC2skeDPMFj49SwClKWT5guL
	88IGqhHPVnA==
X-Gm-Gg: AYBFou2WdQvVYs1TXH09WQeykSNU3Kaqc+G440qXH6pB5WXb3eCcXe2d7xgBI8Jji9j
	H6XxSr5lZml/zkcQPXu58sVtWLPRm4DS9bO2GHXvYWknZzAEiu30tgt7DqfbUF0V5kjyNwYn7iH
	WdP8wMhPT3lTnwYdErJKHFJaHJ0D9sO4p18gTim/MTLW50sJARog62bWMqVjJP6vEW+6A87p6+B
	IqW8GcFrU3bp2uQC9jTS9/kBh67H0CgFSOLtU+fbRGW3cec1zdSvUCtlEbGnwVEvSJX2S+bWxUL
	qiqjp3KCgYnUAG2ydrKi8/z0Tl7pbwdE0xuobbHYZHzLu+sRkj5vvGrYifyE9mfUfRErhJmTMCX
	0gPDwedUchQjep5QozvLKUU65QMxf46K+QyeV5E+Uf8rcJ0LSXITN3QVj0LSkf8HVTvQ68PsXSR
	JU56dthBLEv2yXmSnw8DLYn0/p9BNS5ZsBdNSn5OjoztbwYeoNVq8heN9jqThVuxmcm1sWi8kIt
	ZncR1MaPX8a3RDTwME3o1BjSHd/kfGLMJqvt2Qt83kZPCXihvxUkqnkTAzqpHFQlznXu2SVF90=
X-Received: by 2002:a05:6830:6485:b0:81c:e3de:d194 with SMTP id 46e09a7af769-82acefa6e00mr2083117a34.10.1791346236482;
        Tue, 06 Oct 2026 21:10:36 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adcb187c8sm1864670a34.22.2026.10.06.21.10.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 21:10:36 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mm/khugepaged: flush deferred unmaps before dropping a failed folio
Date: Tue,  6 Oct 2026 21:10:01 -0700
Message-ID: <20261007041001.43181-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collapse_file() can fail its reference-count or dirty-folio check after
unmapping with TTU_BATCH_FLUSH.  Both paths put back the isolated folio,
then unlock it and drop the lookup reference before reaching the common
try_to_unmap_flush().

The page-cache reference does not keep the folio stable once the lock is
released.  Another collapse can replace and free it.  With its PTEs
already gone, that collapse cannot flush the first task's per-task TLB
batch, and retract_page_tables() skips short or unaligned VMAs.  A CPU
can therefore retain a user translation to the freed folio.  This has
been reproduced with unprivileged MADV_COLLAPSE on a memfd.

Flush at out_unlock while the lookup reference and folio lock are still
held.  The common flush continues to cover the accumulated pagelist on
both success and rollback, preserving batching on successful collapses.

Fixes: 6d9df8a5889c ("mm/thp: collapse_file() do try_to_unmap(TTU_BATCH_FLUSH)")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
Changes in v2:
- Use Assisted-by: LLM.
- Explain that the common flush is a no-op after out_unlock flushes.

 mm/khugepaged.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 75639298efc2..e1a5890818ad 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2478,6 +2478,11 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 		index += folio_nr_pages(folio);
 		continue;
 out_unlock:
+		/*
+		 * The folio may have been unmapped with TTU_BATCH_FLUSH.
+		 * Flush before releasing the lock and our last reference.
+		 */
+		try_to_unmap_flush();
 		folio_unlock(folio);
 		folio_put(folio);
 		goto xa_unlocked;
@@ -2488,9 +2493,8 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 xa_unlocked:
 
 	/*
-	 * If collapse is successful, flush must be done now before copying.
-	 * If collapse is unsuccessful, does flush actually need to be done?
-	 * Do it anyway, to clear the state.
+	 * Flush before copying the folios, or releasing them in rollback.
+	 * This is a no-op if out_unlock already flushed the batch.
 	 */
 	try_to_unmap_flush();
 

Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1389447F77E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523862; cv=none; b=mAcHgpDi20earM+Iv8q6o5/zSiL6rlnt+A3J+yAFPOvcRiVqiqbpGnEtt3+4Jl7yDdTqk1rC3gpVSEowWl6iCm1Hjp99ZNq8fSyKEwmSGIQQaSZJkNja76YpCJGuqG0xUpRW5yrjsHgdkQpoZJUVlsia1t39uL1Xn+6QxH8A8rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523862; c=relaxed/simple;
	bh=Pq3cl7yQ2QNaCZJt/nNrvJhW6CeSfRnWOXTi3RilZFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LI9slARofUHb6IEW2WMkvJxlFDCilPdmbI0OUWkN5W6+UTiVfh+XUt5VsRx/BlXOYj9dmrh6/vmTSVbd99ZFMhXT7N3hk4I6hJt7ZLmxBFucvS1NL/kCKFT1PoBNvDJOf3UN+zTRvgauOsV3hI7yLxNiu/82PQF9KWkT/EHUtNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB3UU587; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB3UU587"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b1b233ca8dso446165eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523860; x=1789128660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRdr8GJ/+SsuQYeXKm29acq0jkmVX3isHirCcw8TxR0=;
        b=WB3UU587ZX+GUC+ztX9e2eZNTPtDbPunBjPGna0FgTRhmzxdLz8jpRcq+1/99klOB/
         EDzXq+fwmJsS3YnIGQAOpwGCnuwKLw8IRRxit397j8SbmPYaT4eU+kk3wEyHFJ9n1/Sp
         XNXLoX1JuWRv7OrLVwRjuYlyJmbEuD2OJrWeI+cyDO3q5muZCubhJavMDvNmb+sx3YpA
         wYBUyGFV0SlUj/l0Bj4BbH6fVDxY7kajv33/G6SNgI2aSI8X9RnAI+yC0zHglstykQ4H
         rbWZmCYdybIrvN1HsMN6c6X+AChD9QA6BmIuJ1EUBcxsWmaP8xT57BqStAuW3zKM/pAj
         sREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523860; x=1789128660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRdr8GJ/+SsuQYeXKm29acq0jkmVX3isHirCcw8TxR0=;
        b=h97JDEAJK66BeyIXIG6mhKJ0ipcjmR6d8jEMkQ5JYFFFh4U2z4jro0mxzr2KayZdZf
         gj+R+YB769fshI+4l7I/c0ytxObCUgbamDfTQ5pt/0oPOvcwLoHoYbB7233XrAO4EGCA
         l5w9vjJ6ABbbfD5xGdn7KCnsOb85wH9jplP94o4yjPTqxoeJZL5SiUJy3okFV7YLcILJ
         z+Bwg7mExucM8w/p5w0mpvgJrRSYwgYhnHfcqgcfn39Sulwzkw1qoC9gihVlgPnWD5oK
         TefcRcqa+uRD98MgAYQLvRZK372GrL0IYLWnf6ZKiWZkWoKJMEMhJ5VAu1fpMase/fQi
         eIVg==
X-Gm-Message-State: AFuF++lAQpHLM9dPiD7n8d/yaVE7f7Q5rZVsJ9LbBJzwL6FF1eMseNff
	eolgsxAHwWqRVp+gqPGK/EPY0xSZKw0LH9hJHzX8ptdipzZdb+0sxPKp
X-Gm-Gg: AYBFou0PDnK9dDHwy6uH+9oNmH74V9HLuVOr/L3llJdd9f9DXffU567rz7UGeo3Upf2
	G4EsDiFmvLRbTtgXM8CNH9KI0kjyrWjVSL1A4o/gspcoyC7duvVN7P2lmCwN3q992+fbXx765wH
	v2x/0juayMq2nkdUSmjX0/bUYkSk9n5eZmZj+L4bEPhWnCgjvo8ys+LhOtdG5Q4doMJw/d3sFoc
	N6jxUEQ/McHWBHTeq9kVII9tElrBhoMYamk/J2xfDMYKgRuU2u2ZRjJU0M0mIikanTfB8KjjGDm
	BlIHZDi5y+m7NLoEINqnirqy0N8rBaxiUcS+Lf6VJWM/HtkfT/DTRxCAb1Wdq4qm5QihNq/SNIH
	0rARVq29h9fLtE8DkqJ7MfWtgPkbfToi6zqMJK0b0ZucFzH3UlJgFToQ5L1jcLP1KzbUNItdit8
	qJLn6YHs7VQmPVtz5hyWQoyVPfULoWIXV31xmtWNG1YGQg8w0Utqpj5L/KzzEHgmqn2Du0reUGY
	5VmlWTxKpcEBjujcEbiPX5yyRQ=
X-Received: by 2002:a4a:ee1a:0:b0:6b1:4b76:1c18 with SMTP id 006d021491bc7-6b6fd7d85d4mr3858206eaf.24.1788523860068;
        Fri, 04 Sep 2026 05:11:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm6461237eec.13.2026.09.04.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:10:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH 2/2] iommu: fix repeated word 'have' in comment
Date: Fri,  4 Sep 2026 17:40:44 +0530
Message-ID: <20260904121047.21701-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904121047.21701-1-hemanth.selam@gmail.com>
References: <20260904121047.21701-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'have', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/iommu/iommu-pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
index 3bab175d8557..0c469b9dd185 100644
--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -104,7 +104,7 @@ static void __iommu_free_desc(struct ioptdesc *iopt)
  * iommu_free_pages - free pages
  * @virt: virtual address of the page to be freed.
  *
- * The page must have have been allocated by iommu_alloc_pages_node_sz()
+ * The page must have been allocated by iommu_alloc_pages_node_sz()
  */
 void iommu_free_pages(void *virt)
 {
-- 
2.48.1


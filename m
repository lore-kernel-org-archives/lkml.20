Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED34EA39D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633119; cv=none; b=c1SPBPe7Q+N/Q7JA1CxTfkpeklJOq5gLvFc4dzyAezZgsRiKdSKeDRM0bWjmxp5t+zeOSuNs1XaL1/9r+OENfOe/9RRNR4EZub7Evn4onXBiMRuprx+mpKR0TFSGXhd0FySbMXvPQVs/K4WxANFDP8KIvN56O9XTL4b3BbJtioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633119; c=relaxed/simple;
	bh=V00CAxo7BtvlqZdNIWrnFx9Q3CiP8SIerSKxaj/2aVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiNiHeVFhWed+fOJAg9opg+AYq/zuGPwJpXDhAIDoStjM2JIqI59Z57x1mJamYxrNLjMpXpsNwZfI2cim/swKoDDTS8EvsTH54c8C6yMaPjwx1RJgr5mtc4rVLaF7oKrNswY5SxVjeM8282gD2lEpQN90ozjljW60Si3sjKzLyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4qVF1kq; arc=none smtp.client-ip=74.125.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4qVF1kq"
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-4843169420fso531321f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633116; x=1789237916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcD2qnbZrk6xfsMXTNlMY/8/zgvFTRRcKt+3bM1RQW4=;
        b=e4qVF1kqxsHc+XgtHo0CC0NcC0r69b2J4Z1abhjvlS0zbJqFwE7s1+qg4sIzaYRTvB
         88nhG6zJKd9gxsKlhrEfcAkPFy/fa0utQT2CMHwWF/lR8oEA7adePF1JZVYPcenaGIjf
         NUxekHX/Q+DA/Lx6srO1JrUKRY9wCuJxFpITRfFfD9yPFLdSUVyMKuqCxrUWr8f8WuAv
         frPyzzIIHjeEsKQZ8irqGpW95XF+Am5UJ6pAWkOL2fk34KyLrcXEnZT+xsz9et8AKles
         RuhgesA8dSVEp+qJs6C7IIJyhU3t657DiL/GeeCwSkipXRphIV4BVVw/ZZXFHgNSEgRF
         x4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633116; x=1789237916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcD2qnbZrk6xfsMXTNlMY/8/zgvFTRRcKt+3bM1RQW4=;
        b=ImJB8LrTiEpgVEukev/9Ah15kqyDzHBY5cfxZQ30fGn6K4a8dUC7Q3LIHJZRCFx7RD
         p8KbtxRtlW/H3mfrUJrO3WtTd1pnqzr5BV07D32us4W/4tnGn0sT3bjHKNj/RECkmeED
         SWiFEtJ1sYkfbTjbXMFGAOmK3+dC68uRDMNm/Gvuf7nMM1DA+SXpprkLVAOSF+cqvg4+
         nYDudRytFYER4N69kmda0+CmnQkfYiS1T5KQjbVn3I6Vn0w0lqreYbHmYx3OtaJH5QNG
         vJ3bf+sPB1VfO4jz0DLTgz/Z+2Yon+7gCU331mBEOTVemGq7V0/Qm0LDsvqaVOHO1E4y
         rw8g==
X-Forwarded-Encrypted: i=1; AKwUvBxI8rj60vHbSE0DpGkX6mIWWqSmO5ihD2ZfNj/sXYt062CBiOI5z9dtOSe2IER1yTxsp20zD0D0BZHLqFU=@vger.kernel.org
X-Gm-Message-State: AFuF++mSQh8yS1w1+Zyv8dFBcXBVbNW1pyx7//XgYLSrP1rMKDXSUi/S
	buF6B2N/GHZqYKU5NhZigVmWZiOCcdZ7oclnj5gzE9s7QlNJACSNXjQ7
X-Gm-Gg: AYBFou22jNhHdWW6n+47gpVt7FMFP3VTJ2r/FFYRIzwNIX8J0qTmC2KoSNT3wK0IVxd
	ri5yh0DJ/QGvEZc8B5wrRFelMiCpF8hdGpM+noCfhrco/ESDr9Q9OoKXbk5qYACQFGCT6zeCsfb
	wXvZ83QdK7acOKdYaEvlZCmHxNfEvxMdJuaNWRQZII4BTq70fVDRTHLrXOR7+GRo4SIsWBD/s0I
	2TvqLFe2UaT7Z6bXoEBJ/z8VkXctNymirnuAmGtNAHINl3Gxg+amRhC737JbK3FoJOpBfVMfIVD
	y2k5EGipl/RVJ+0VnF452g9wN7/lFWDcmfksiGoN+VVQFc8QLYagUWg4UpoEvFyUL6O9NqpGG6X
	KKP5y7WNcjvD7YtSFb4xKxWtwAIQ7SE0WdsCprOD+IOpLTB9JX/+EqsbT/7jj98dnxGLJP2a539
	T0epPUUKHPoImXzEN9XhZFDDPsUzx7zZT3zISVY1YOk1k3C+B5cKWt24AtU/oZj7MPLhbBBY5U2
	nA+DiFeYyxMbDQKQd9lh2qfF5lZoA==
X-Received: by 2002:a5d:4c8a:0:b0:484:338b:3bc1 with SMTP id ffacd0b85a97d-485872edfb5mr14248775f8f.27.1788633116296;
        Sat, 05 Sep 2026 11:31:56 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm13066670f8f.3.2026.09.05.11.31.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 11:31:55 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH v2 1/3] mm/mmap: fix various coding style warnings
Date: Sat,  5 Sep 2026 21:31:33 +0300
Message-ID: <20260905183135.20993-2-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
References: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve coding style warnings and errors flagged by checkpatch.pl script. Specifically:
- Add missing blank lines after variable declarations and replace spaces with tabs where needed.

No functional changes are introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/mmap.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 4bf26b0f1e6e..6016a43d3c37 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * mm/mmap.c
+ *mm/mmap.c
  *
  * Written by obz.
  *
@@ -526,9 +526,9 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 			 * And don't attempt to combine with hugetlb for now.
 			 */
 			if (flags & (MAP_LOCKED | MAP_HUGETLB))
-			        return -EINVAL;
+				return -EINVAL;
 			if (vma_flags_can_grow(&vma_flags))
-			        return -EINVAL;
+				return -EINVAL;
 
 			/*
 			 * If the pages can be dropped, then it doesn't make
@@ -832,6 +832,7 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 				  = NULL;
 
 	unsigned long error = arch_mmap_check(addr, len, flags);
+
 	if (error)
 		return error;
 
@@ -1017,12 +1018,12 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *mm, unsigned lon
 
 #if defined(CONFIG_STACK_GROWSUP)
 
-#define vma_expand_up(vma,addr) expand_upwards(vma, addr)
+#define vma_expand_up(vma, addr) expand_upwards(vma, addr)
 #define vma_expand_down(vma, addr) (-EFAULT)
 
 #else
 
-#define vma_expand_up(vma,addr) (-EFAULT)
+#define vma_expand_up(vma, addr) (-EFAULT)
 #define vma_expand_down(vma, addr) expand_downwards(vma, addr)
 
 #endif
@@ -1454,6 +1455,7 @@ static vm_fault_t special_mapping_fault(struct vm_fault *vmf)
 
 	if (*pages) {
 		struct page *page = *pages;
+
 		get_page(page);
 		vmf->page = page;
 		return 0;
-- 
2.55.0


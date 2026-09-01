Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5337449502C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286049; cv=none; b=g/sECd/zug12jvMOLUaXOoKGR+PTAPMckkuAdnyldtj9LWPtCQWnKYoyLKFshirDYROP9GpXWNjss6Cq8zP/wgzEbtvVV59dpPzO0rfSh34bW/OK+6DFiJ50LGvQEe/X0dZVH/3WZ96IkrDP/OFOocXt0QXAs6K3ivjLHVCwK8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286049; c=relaxed/simple;
	bh=uFV6QdZgs53Cc//57Ww0okrOM7FWgj7HZIJ7HnfB/tI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lAnbFTISpsbf//serh7etn5KKc/4+1lTw+dWcQMmGA6J7ELHzEDAPyjTaHz/utoU+f+T4M1py8BgAEJzM1WFSpd5t5Smr3vCWdb9S1mkJa9I6XTK/66Mlm0T/5QnmQsGVxkBIa+vE1BsvB77xyFpW9I6R3Ffct/4+DEh8xZPhjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NdxWsNN7; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NdxWsNN7"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso207136a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286048; x=1788890848; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abQNPJxLdJSbNwggArhdklh2mCXd2+hz+eKc3bSV4GE=;
        b=NdxWsNN7eDscQRVtniyJcrdp3jT5UfT7moWS2ymVPhgLtkt5eDAiZwvyFI7X1kIB07
         au1hOVocwh0+C94HUCEkNg3zr75dDzIGNRFLpAnCz4WmKQbl3LPtpKlw07zEfJAnirfi
         E0QP//ZsgNjeeIfNl3rt7oy/cCNGOwnACnPJINML5TtSMSj/lOZjnnYd13ota7eeMT6y
         rcLuLkNKQtE7D5V4qX1PmwflX8EpPZjYEvZs7mPmfRMb3cw8pykWgk/HNUwCMCkbjbuJ
         i22VbET8c7juTwyad7JDy+c3HyNUj8rYieEhEdsYUr8eg84G9MReAUUXWn90khRpw2ZW
         vnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286048; x=1788890848;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abQNPJxLdJSbNwggArhdklh2mCXd2+hz+eKc3bSV4GE=;
        b=Btupn41MJC9r0O3ZcRowMfuXbY2MsVIEEjEz2cVLZBXmpeKR2LhK+7l74BfC/WLWOl
         oLIF0lOjg+0mDGKs85IO6j+vNmGsxUBZvhrHUSuLo6A4ny5Dxjh2FT37ZBJZ9Dk7+D48
         jNMGLecxGVDNXtSDp39UsDVx0rCGpF5uCEqJ2AOarxlHjjFxZetiqOwlb0amAYlPDdgC
         wp5vyULogwTud59fH642ropff6L4UZgula2f61WE1EAX3+uRv+j0SB71q1d56hc+q7EO
         l2DT8yCHHw65OzwOyANMzQEi1ONFh/CIBPlosqxexktfXYVgd6nW++qENKigGWHlyu/c
         hQ3g==
X-Forwarded-Encrypted: i=1; AHgh+RpIqqVvWAeTQZlw2JZN+ieStAjaq1lDXcquamR4Jc+Y0nN+eQGFU+fy8wL0HLWs5yc/j95RVilFg/X0Jho=@vger.kernel.org
X-Gm-Message-State: AFuF++mF4murL+Fwp+EGoDyxrRsYrl0Z+iHBtCnSz1dQ8Nh/q1Anyfxi
	ygX7eMcJsFvXni31KgrhU+YkiwBqCiApkH/tMcfZRVuNmz11BPMEGB+UTNICWuj6a4rp7xkdZR9
	m7KCtjL5+76grbQ==
X-Received: from pfux35.prod.google.com ([2002:a05:6a00:be3:b0:848:7bbd:284b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3309:b0:835:6388:655d with SMTP id d2e1a72fcca58-8562ba7dae0mr58420543b3a.14.1788286047461;
 Tue, 01 Sep 2026 11:07:27 -0700 (PDT)
Date: Tue,  1 Sep 2026 18:07:12 +0000
In-Reply-To: <20260901180713.4185641-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901180713.4185641-5-dmatlack@google.com>
Subject: [RFC PATCH 4/5] mm/memfd_luo: Expand support beyond memfd to all
 generic shmem inodes
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Relax the early validation checks in the Live Update preservation path
to allow general shmem-backed files, completely dropping the requirement
that the file be unlinked (!inode->i_nlink).

This officially enables userspace to push standard, path-backed tmpfs
file descriptors through the LUO session ioctl instead of being
artificially restricted strictly to anonymous memfd pseudofiles.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 mm/memfd_luo.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index dcda5bf98646..107115c97bd8 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -9,14 +9,15 @@
  */
 
 /**
- * DOC: Memfd Preservation via LUO
+ * DOC: Memfd and Tmpfs Preservation via LUO
  *
  * Overview
  * ========
  *
- * Memory file descriptors (memfd) can be preserved over a kexec using the Live
- * Update Orchestrator (LUO) file preservation. This allows userspace to
- * transfer its memory contents to the next kernel after a kexec.
+ * Memory file descriptors (memfd) and generic tmpfs files can be preserved
+ * over a kexec using the Live Update Orchestrator (LUO) file preservation.
+ * This allows userspace to transfer its memory contents to the next kernel
+ * after a kexec.
  *
  * The preservation is not intended to be transparent. Only select properties of
  * the file are preserved. All others are reset to default. The preserved
@@ -24,16 +25,17 @@
  *
  * .. note::
  *    The LUO API is not stabilized yet, so the preserved properties of a memfd
- *    are also not stable and are subject to backwards incompatible changes.
+ *    or tmpfs file are also not stable and are subject to backwards
+ *    incompatible changes.
  *
  * .. note::
- *    Currently a memfd backed by Hugetlb is not supported. Memfds created
+ *    Currently a file backed by Hugetlb is not supported. Memfds created
  *    with ``MFD_HUGETLB`` will be rejected.
  *
  * Preserved Properties
  * ====================
  *
- * The following properties of the memfd are preserved across kexec:
+ * The following properties of the memfd/tmpfs file are preserved across kexec:
  *
  * File Contents
  *   All data stored in the file is preserved.
@@ -580,9 +582,7 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool memfd_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file) || shmem_mapping(file->f_mapping);
 }
 
 static unsigned long memfd_luo_get_id(struct file *file)
-- 
2.55.0.966.g6673acef38-goog


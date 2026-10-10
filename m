Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD0F414DCA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616001; cv=none; b=iFkj2KoCzQ98PBybJ84IUmrr3Mu9WjkHviGyL91mjfVOdyrP+C+xTCs7JAQbFsFANBN7U+cKZVvfCgjnPq6q1cqpS9U3Zs37OIvu1zdJ+anTc2hJ9n/L1JP0YgKpAVl3lr5+7aJUsRmbnJUCi+i5JylPg9bbR2IAqN7K7bBiong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616001; c=relaxed/simple;
	bh=0w4mStVhxJBNt5V5WsEgux7l/W9KHeoC5murt7H3MiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SAkjRQ55PFea4GbMr5CW6Z8hfMlFzhWVkEOemEMgTE829OYLZUyYP7pvol6Tvoq84mPEM8dIeQBJFVsIXOOKimmjrfZApRcsZxeLiyQ3HIKv4SGA9auZaN9fev0Cr9QdJaA5Wf9arYsoHGd9eHYa4dXLkjsN+JOmAzXmoUURu9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEJksbD7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEJksbD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93FA1F00893;
	Sat, 10 Oct 2026 07:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791616000;
	bh=Suzf8PCRnkauEGFkBM6f+/nSdAYzije1adxZPO+1Hvw=;
	h=From:To:Cc:Subject:Date;
	b=YEJksbD737KiIJ3DHjtl8X8VgDFniow81R+lnSWCbirvFR0+9HrrMM0yC5hkJn1N2
	 MnihZN7sy1Lpn4sX3fTqt8KKsc5HdCL5rddTPeDag3lTyJbEKs6z8mmMR4apWjdb6i
	 8c8ONZi9ZfgFs4bVrYGLXKIFE7aoe6tu2XDN/D+wK+5k5+rWOipsTk2G3FkjCX8jaF
	 c0nceMI89x44CX2Ss07KvwGQdRRhpWpTbzwBqx7+aiVfFIAaeqFd/u5AK6lPiZe5kD
	 3D5+o7Zvx9Sij8ZATxCoZLpGaNx9HnD4Afzp5lFe1QIYR5GkQemjXUnyTpeqsQxl/d
	 6RnmqYV9iDgNQ==
From: Chao Yu <chao@kernel.org>
To: xiang@kernel.org
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] MAINTAINERS: erofs: add dev branch to git tree entry
Date: Sat, 10 Oct 2026 15:06:23 +0800
Message-ID: <20261010070623.1766952-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

The EROFS entry lists the git tree without a branch, so tools that
derive a baseline from MAINTAINERS, e.g. sashiko, fall back to the
remote HEAD, which points to master. master only moves at -rc1, so
series developed against the dev branch fail to apply there.

Name the dev branch explicitly, where erofs patches are queued.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 068beaa035ac..63c8de75ada9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9690,7 +9690,7 @@ R:	Chunhai Guo <guochunhai@vivo.com>
 L:	linux-erofs@lists.ozlabs.org
 S:	Maintained
 W:	https://erofs.docs.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
 F:	Documentation/ABI/testing/sysfs-fs-erofs
 F:	Documentation/filesystems/erofs.rst
 F:	fs/erofs/
-- 
2.49.0


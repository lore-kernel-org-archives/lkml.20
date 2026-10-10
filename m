Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D9370ADF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615595; cv=none; b=AWr7WX4idX63yMQ9chlgoCqyT3ozb6C7oAP3yRG2SgaPLOCUg/rywTkMvzTIB1zHrXHBlnqSvs/6hkFlUQ+Cj5uap3diBphMaaXjhuvyp3LxvBdRofrFugcEhevHdftkrVA3gDgjmYBInt1wZ7UAMBDJsqrZfWxTncEC+P0C2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615595; c=relaxed/simple;
	bh=NM1BheaNM6GveJnEhrUcYvLHRfIFX0qyRpbBJAZvU2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XjuKjUZldKh+WdkxB8D91CjFlxhlKGesBbp4YuTBYHPbNnjiqRUtGzQ2Gysp87NKWphS5nWerujJmRxMgN6TQ4+wJW8kjPVy8WEP30V1cWbQOiLi3n7+2U7KPuuixYjrp3h36tNt13I6qIjq3jiTxxGsmPVbA1fpPkYTByfKQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQuiAvpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQuiAvpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64D61F000FF;
	Sat, 10 Oct 2026 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791615594;
	bh=fDPUvN/ZiQi3Vp5qShmOzcpuRv0wYB/MjMNxCby/yDI=;
	h=From:To:Cc:Subject:Date;
	b=cQuiAvptIOpVfYBAZoOVsDS1wF/r96u5WKBq3qjCPfxHZIlbwMXfJaeJqS9iEuFBF
	 5hAR2J7myZmBiqquFmmtSyVNq+IRr0LTfZSHfy0fhYjrHV/P5iQXfYoUJFXN5Kzj7H
	 JysKrsY+oDgv9Dsk6XUyrSVNWn5T9sucW3exX/t6GRAy00mmOpZTKj01xO6HClwoum
	 +mkzh0f5gp/P+tl8pPHn6W0HxJt+P8/usyPG1p4c/GrJBQXVm4wNM3oVt6y7VKIEuT
	 ibnLTynJz9PZprrEnFO6TxggwqWHg6Ybj7o711AM32AiKZUQQNA2cJhsv1N1ukU+/a
	 TjaSfZgEdUPkg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] MAINTAINERS: f2fs: add dev branch to git tree entry
Date: Sat, 10 Oct 2026 14:59:46 +0800
Message-ID: <20261010065946.1763794-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

The F2FS entry lists the git tree without a branch, so tools that
derive a baseline from MAINTAINERS, e.g. sashiko, fall back to the
remote HEAD, which points to master. master only moves at -rc1, so
series developed against the dev branch fail to apply there.

Name the dev branch explicitly, where f2fs patches are queued.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..068beaa035ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9947,7 +9947,7 @@ S:	Maintained
 W:	https://f2fs.wiki.kernel.org/
 Q:	https://patchwork.kernel.org/project/f2fs/list/
 B:	https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=f2fs
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
 F:	Documentation/ABI/testing/sysfs-fs-f2fs
 F:	Documentation/filesystems/f2fs.rst
 F:	fs/f2fs/
-- 
2.49.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566063EB7FE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541916; cv=none; b=KqtjCxMIGLGFakwZkRMlPs+bdP+/aKa5jtyuQXQdDIZBSXh9xfKdJhkMcShgDAr8mCG4ZrXbMLA8BvrlYQiHVR14FW0sSbRHGUY36KfP1VsipLdBbL/Jx+DmBodnqG8cL4SPE+zKlVIurm1b/pj/D4TOC4sCXcyULYU7/QmTQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541916; c=relaxed/simple;
	bh=/24CJ6sM8tIj1+BP2M4DUv5591Ibu6PCHryTpZEHGUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pjGACA77y/yWpv/gjp6L2plg/1p87Z0r5Va27tmFMeiMm+kfcmE1zmxS4j3LCLOnxqT0v1msea6x/x3weHQQQ8TJxwhHlzg3mEan+dDOgLD61aVxvJv/5j3pCSUQ8PqeyW9JFikvSmVJAlbBqr+zEYKkRGgE0m1I1Panzz2xFQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVUMtqgc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVUMtqgc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA7B1F000FF;
	Wed, 16 Sep 2026 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789541915;
	bh=Cp85D4AzAHwPfiXaKoj27DkJMB/iUIWmXYjVvJsP5+c=;
	h=From:To:Cc:Subject:Date;
	b=RVUMtqgcx/GYIMfERvbfvHFUob5TOHN3L6i/cSv+a6l17eT4+mvpRZk6MsI5Iutjk
	 7DQeqF7qq0dlp6nICfz/70Z8ul0NpPQgPYF57qSXRbw78o8WCsHX/wxzlsZ1/3vFAd
	 Z7/2IV0Vx58ixi8WdmLnYBu23dS4C3SxDwmFbBBgxfjN833QXrfjaPLESIL233Ry8a
	 MqhKkif8p1YrHjwWNLfO6IBrYJ1LxDtYmiAJyyypdXh+a8hAHW9Eu/Jc6sz+SmI3Qq
	 R4HTrphCyzhvgiksUK8ZFhAI2O0i1T8LxnTJCVJgLTS8q/qptl9vjyXtswi2zAkTz1
	 HdEjmIZKBit0A==
From: Arnd Bergmann <arnd@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>,
	Abhishek Bapat <abhishekbapat@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Ge <hao.ge@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>,
	SJ Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] alloc_tag: avoid implicit padding in uapi
Date: Wed, 16 Sep 2026 08:58:20 +0200
Message-ID: <20260916065830.1619425-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The implied padding causes a harmless warning when testing the uapi
headers with -Wpadded that could in theory indicate incompatibilities
or data leaks:

./usr/include/linux/alloc_tag.h:41:1: error: padding struct size to alignment boundary with 7 bytes [-Werror=padded]

The code here is fine, but it's better to make the padding explicit
and avoid the warning here.

Acked-by: SJ Park <sj@kernel.org>
Acked-by: Hao Ge <hao.ge@linux.dev>
Fixes: 1d581ab2348c ("alloc_tag: add ioctl to /proc/allocinfo")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2; fix changelog typos
---
 include/uapi/linux/alloc_tag.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index e3ad94444864..7d4618bea043 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -38,6 +38,7 @@ struct allocinfo_counter {
 	__u64 bytes;
 	__u64 calls;
 	__u8 accurate;
+	__u8 pad[7];
 } __attribute__((aligned(8)));
 
 struct allocinfo_tag_data {
-- 
2.53.0


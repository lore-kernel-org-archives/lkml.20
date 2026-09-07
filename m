Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0F03F8ED8;
	Mon,  7 Sep 2026 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763023; cv=none; b=t0OuoSYnT3JKAHCjobKiDJVkzUUpzWVopFYc4mLSaghxal2PyqC43V1PXrAp3ahk8qrw8Z8znvAMx4+2BX3GKI6T/RvKhUV6pSsxZ1GR8jH3ReCMr5Ix+XerHAOJ2ZAvb2qUY9ww48+mdp7PRiVz2BcXH76zVStcQ1tdJDXn8V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763023; c=relaxed/simple;
	bh=akJFplTRYLFZ4C5tDX5VB+42Z4Qr/6sLZAY0LLttJrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fHjLpSkJiRVejjXBIC1MnP59NW7QAEgOO81gpTGha1dGlZUKR0XW2cI8W9DkvLeEEM/Hlzu1Wzi6MZTybyNTaXmEC9W4Nrx7Zodys3XiPN4H280m0fsZwgM0ZyMkhMIGCQSL+1s8daTExWpF0ii1uOZQY7qS4gBujZfHdyY3g2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFT32ivH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFT32ivH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798071F00A3A;
	Mon,  7 Sep 2026 06:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788763022;
	bh=mF0fvVIFm9TJ4XBgHK9DNtihxrTbpRaoDt8xcwKRZQU=;
	h=From:To:Cc:Subject:Date;
	b=QFT32ivH6l59iIEOyI7y5QXhvovuN8DAeBum5PH3gR/zWRTBFZhGs5BBkVX7xlGJW
	 HOM/w46lvm6n8/iIeCAniimrq0n43jPygMATu0jEP/qduQnNI+cSim0yhUt6xgcLHg
	 f9BZJjXJtwhzhIvwLI7+Oew58ya95lX5zawqIhB3ZTMbXrJfoy8jG5/+rDqWbsZ1/n
	 nQzETlocgkM0IDjVXFu+yssJ/axp7HCcDwECRojprvhXAueeSp/baPB6BSpsxNpiOX
	 lQESHRSG4tGLEdR1YDNWhUwK3TofDdg/RnF1+x9zOcqjWxsOk0TtlMDgs614AvtJPi
	 X+h2VlyIBh5MA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	SJ Park <sj@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] docs/core-api: memory-allocation: clarify when to use kzalloc_obj and kzalloc
Date: Mon,  7 Sep 2026 09:36:54 +0300
Message-ID: <20260907063654.2248617-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Make it abundantly clear that in the most cases objects should be
allocated with kzalloc_obj() and buffers should be allocated with
kzalloc().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---

This applies on top of "docs/core-api: memory-allocation: add
k[mz]alloc_obj() and clarify kmalloc" series

https://lore.kernel.org/all/20260902-docs-memalloc-guide-v2-0-218c1a4dcb80@kernel.org

 Documentation/core-api/memory-allocation.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 823f7fa57429b..648222b6c8576 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -23,12 +23,14 @@ answer, although very likely you should use
 
   kzalloc_obj(<VAR_OR_TYPE>);
 
-or
+if you need memory for an object and
 
 ::
 
   kzalloc(<size>, GFP_KERNEL);
 
+if you need memory for a buffer.
+
 Of course there are cases when other allocation APIs and different GFP
 flags must be used.
 

base-commit: d7dd88ed029164fe0a959e126d0ce18dd3719f89
-- 
2.53.0


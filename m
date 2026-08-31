Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD8243387
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171712; cv=none; b=SLSSm3qkVomLipDUvPWB2DTETCCKhRHRY2IbR9G81sYMEcNRSIO6sPW8yso0fyzVgZEF/ZvSyLQZzqgwlHfeiC1X0VRaC66SD2pVV+mgXFroLUqmaSV0V07GHOjWqxD9sU68BwYXTwgpmKn8RjEwODmGzzZsphm7Og9nNyJ5LIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171712; c=relaxed/simple;
	bh=iOWjTJfw0OnMxiHdz4Cl73bZbcKZAlWthvrzke2Ff74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l34YYMKTSkok+7ZAWrv36lAvXrUls+ouMKNx2W7M/qMiHBPvXRjpfMRoTcMI1JZ3DedWZebv4scJJmxkM0TMp2Ou7jOP6HmmGpJoaApeDAit6yMSIgoywOCOehpBfM6vO9GuM8XCsZyViQDoboIEtnQTBDyCzYhneBaGQa/UM2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nadmiYF+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nadmiYF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F141F000E9;
	Mon, 31 Aug 2026 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788171711;
	bh=yiR7x9/v4RMoVRI0sREa2O7du016hdua950VEmziwYo=;
	h=From:To:Cc:Subject:Date;
	b=nadmiYF+WjxzCff8CEE9MFVzPy15iC/X3xVb0THTf7eFYTRCmRPErsvHK6wBkntA9
	 yLxm5EHTLTNsUav5UE62b5bCAiyXHMuiHtE+APe52/XPcbOPfdlbiKBWos1woglkE/
	 ZN9kKViEqFbxU80DpbpAW0zdKKubHvTFYYmvE1TVUI4fwYtN7qC8YDucmSg/TrkoRt
	 DhTj6cEvpSupOYeklNHxbqRpRQqXgHGUmcDOQ22wJj0oCyr473NQMxosJ8QkHiVhIb
	 NcvXKzjIMKI0PkvHrAbrMkDI4jWH/tDunHNonrGYzRiJhxWb1Hd/xl/NlHkKXLVFa1
	 aUix3kK3g5Pkg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update memblock tree URLs
Date: Mon, 31 Aug 2026 13:21:43 +0300
Message-ID: <20260831102143.69265-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

memblock tree moved into mm/ namespace at git.kernel.org.

Update the T: entries for memblock to match it.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
I can take it via memblock tree if there are no objections

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..1731d197c33ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17036,8 +17036,8 @@ MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git for-next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git fixes
 F:	Documentation/core-api/boot-time-mm.rst
 F:	include/linux/kho/abi/memblock.h
 F:	include/linux/memblock.h
-- 
2.53.0


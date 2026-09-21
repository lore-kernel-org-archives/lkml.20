Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12892496D32
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993901; cv=none; b=KZuzF41V795nYjh8iNqRxFTShZLykxAWAvedHJvJNS+H1Gvpr3KPRYH6mVkIm8/mXIN97CCcFl811cQGdyEYrUz9hfot2t1/2nLHUaxSb13wJgbYSu5aLjrPi4+Nr0LNfhecQF4Sd44K6EvGW2ogbd2lSJOvFj3z5Pn6mutXUUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993901; c=relaxed/simple;
	bh=bFMsXFJyQ36WfeksTJPCjrhaFvrzgYycx+/jO0rLZYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z4wY/6erCrkuOxGHs77DIYW884+ZUyMWr0+0DgAMdDKRKgupI/4xP4VjgW0XsWR+kQ3Ca/f1g1uxbepwvDqZjU3aM1bwU0WeTvyA+pw1XMEgTReE4tJxp2IXI5xWYOMTgJNRLtVCnEvLXi519yINojgd3dMzI9vo45aigTgFt3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=D7grE8ZP; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="D7grE8ZP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=itzIMrZmkJ8MCeTVLVRxYjqDuw4fC9HM264ZP4CC/sA=; b=D7grE8ZPMQxDkp3ySxIdfArfIL
	+Rap0h8EvJpyGDjwx20BhmclpbVHzdwC0LfiTSBR06n9eyT/uyntHi7VMmOgvC/BR1APlcIIG3qrO
	hoFzmZr0wIdsUG14ziidDPi+FH76S1cSelpIuQvJyC5tz33I4jMD/NqUnMDNJsaFr5ugC6YtaJecD
	La8EtZxBX8B9o9xReHGNl9PIoCh5J96j59ztYhYiGLuqNc7+v9sCjW+K8MBl24fdZdP/wlcYuOFxL
	mlvEnw4K4fc/akIAwqHmzyAxPWWoI80XJX6GBCVXHyJ/7RRaLLud2ftDj6TCh9nMRhAAfM+Bbc9Da
	FONFwD3Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8dBB-002CbU-2Y;
	Mon, 21 Sep 2026 12:31:30 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] mm: kmemleak: batch the struct page scan
Date: Mon, 21 Sep 2026 05:30:25 -0700
Message-Id: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEjsWoC/yXMQQ6CQAyF4auQrm0yEIKjVzEuOqVAQUYyVWNCu
 DujLL+8vH8Fk6RicC1WSPJR02fMKE8F8ECxF9Q2GypXNe5Segw1TrPMD6EJF8q7MUXkM3ETnPd
 cd5C/S5JOv//u7X7Y3mEUfv1isG07CW19I3kAAAA=
X-Change-ID: 20260918-b4-kmemleak-page-scan-c7ac6b088c4f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936; i=leitao@debian.org;
 h=from:subject:message-id; bh=bFMsXFJyQ36WfeksTJPCjrhaFvrzgYycx+/jO0rLZYM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqsSOdebnPkkS0U9mCkMeiu0aKMri1nI9kkUYDp
 xqAwOwP/niJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarEjnQAKCRA1o5Of/Hh3
 bdSzEACgRVNBpvLdVBMPsKl2a/DZmmoFmxJIp51KzGgZvAoWPG9BZXk9u3x9VgLvQaDA7/VmFHS
 pIP9oCsUz8KvbI04hHjvG4Tzc+k1M5fzjSLZ4RM7kYrX+LkZaPOFkSNJqVYyVoxKJKSxjVZAIdW
 CQ+VmXlfZyECHGUJ+9KVIAG/AyctKttvctwN/MtZDJVXXd78U1/e40rLRnJO7RxxijIKAqwYfdz
 bMuG5GJcVwRsd21VEElIcWxvNKuGYAD0ohCqFPQJl63YolvocA+UdBzKkOFjjzkL4iswh+3m03V
 KG7rxJXBsYA+tRrFoPR22aaP+RguJBVVSnEfvS7F5EsHogm0L/kiYduYlHmQrH0BAnxZ7YWXr29
 WYOQH73i9AcGedZYv2/JHC2SjoV+vrRlkFfJRxahSxxXu3Rovj6sJEV7FCRPIlcPu3jhfrrnkwf
 u3sTeQ7i6M6TrOsElbkF0xXgirqGrkv29Ys+LB60H5o8AA9fFE/hrxXD8W2yCb96AleSvqOMeSo
 Q6rcwzo90PJIEBh4vk/wesHtslQ6r9YD+thveDKf0Q2DF9SxeAuELXQ0dso327rX7qPBsYD/hcW
 uDo11CTZJnhuaf/W2DWzz6yhB4Dh8yz6jL13Va2MeuquKIURhTp3N+gFX3Jm2svDOH5rQthZoii
 JpBFR8Mbml+27Cw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

kmemleak walks the struct page array as a scan root and hands it to
scan_block() one page at a time.

scan_block() takes kmemleak_lock with interrupts disabled for the
duration of the call, so the scanner acquires the lock once per online
PFN in order to look at a single 64-byte struct page.

Batching adjacent pages up to that size keeps exactly the same pages
under the same maximum lock hold time, with MAX_SCAN_SIZE / pagesize
fewer acquisitions.

Patch 1 lifts the loop out of __kmemleak_scan() into scan_zone_pages()
with no functional change. Patch 2 does the batching, which is then
contained in that one function.

This improves the performance due to less atomic operations, which is
not a big deal on a regular machine, but, given kmemleak usually comes
with extra debug options, such as PROVE_LOCKING, DEBUG_SPINLOCK, etc.

For instance, measuring Meta's "debug kernel flavor" on an arm64 hosts,
this improve the scan time by 20%.

It is safe to get more work into scan_block(), given it has the
protections, added by commit eb11f56eeca560 ("mm/kmemleak: stop the task
stack scan early when interrupted")

MAX_SCAN_SIZE is also not a new maximum for a single scan_block() call.
kmemleak_scan_task_stacks() already hands it a whole task stack in one
go. On arm64 and x86_64 THREAD_SIZE is never below 16 KiB, four times
MAX_SCAN_SIZE, and it is 64 KiB on arm64 with 64K pages.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      mm: kmemleak: move the struct page scan into a helper
      mm: kmemleak: scan the struct page array in MAX_SCAN_SIZE batches

 mm/kmemleak.c | 70 +++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 23 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260918-b4-kmemleak-page-scan-c7ac6b088c4f

Best regards,
--  
Breno Leitao <leitao@debian.org>


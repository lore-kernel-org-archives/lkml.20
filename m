Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222109;
	b=yUjAMqJfk/kN2Ex1fM+4XGDgbfRrcwywDNrLMSQOgQuxWA1p7tFP49jniBAXSyAdFJuI
	 oB0jGvbm2u7F8XMCuXk/ORCPcXYmsesh3LRRbZ4l3sPbuMU5i1XUYMK/CLZDUTDGWysIn
	 dhxiaQs9n07ckkdP9j+Gr1lJ71gbjpqej7QxeeWzBiowq6TAXyfm8D3txl407nh7dkrLS
	 UOHda2eQ2tQPb/Cs2YA1KolJevvRgqXzKu8qy0Z+wxQQ3PXbiomUwqB74bJqGO2NKH2fo
	 zmsmms+7raQ265ka4kYB8GDSIsrvNxxYL9j3+ko4h5D2/vWjLCsbSUHReR4rydYhk5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222109;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=P1q1C/a9QiwEb53yKMxHM/wi7D22xCM+hnEZR059szc=;
	b=e+moWSiUrT6S7KJlIZqHbyGeaQ+9LTDn1Ez3fIuq102ZMNPcTNYECHbL0s0N4lwuoGAd
	 alXILHO1BqmOHo0PGB+NsmnEHyAVxspuzSp0/ylxWsAct3j3vw3Y15J2zeWXViXW54Oeq
	 dl5ts9luT4n2J4BV+e2pSqFMTGz3pL2vEsagVfPi6gKR6YcFHdpms5su2mMgSrFsYoqlb
	 044Svh9ZJRdBxVT+tk6jRfEvy4nMFIoSec1oq7YcKofVcCsD57kgA2L8zfJVbx+2RMgVe
	 zb+C+7w3l3OFJI8klJWwwk5kM+ICDH9YhW68Y8BWlEe1zx4A2/W5RoFXwa1rK7CzUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h+5EGASZ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBE7606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h+5EGASZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5AD91576;
	Mon,  9 Nov 2026 03:01:45 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.167.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 539D53F632;
	Mon,  9 Nov 2026 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794222108; bh=wBOvuFzqHwhioAeXRHhM2TmRHYOrpJxrqcK2vl7GtaA=;
	h=From:To:Cc:Subject:Date:From;
	b=h+5EGASZ1f8gbLio5gY5nhY8K63rukruJ6kpJHClxcXpC2IBi1jCvrWL+xZC1gMeX
	 nxS73CvQFry5eRkN83HvJ8XjDihDC5fXQ/sBbwLGlXjkbG1qrm+Uv3MI3RpGcNOuHc
	 n1TiFym/xxKzvEGZVTNn+iok2Ie4ukfQc5r9rh8w=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zhen Ni <zhen.ni@easystack.cn>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH] tools/mm: add page_owner_filter to .gitignore
Date: Mon,  9 Nov 2026 16:31:39 +0530
Message-ID: <20261109110139.216653-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing page_owner_filter to .gitignore in
tools/mm.

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/mm/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/mm/.gitignore b/tools/mm/.gitignore
index b4ac68a08e1a..2d08f713b664 100644
--- a/tools/mm/.gitignore
+++ b/tools/mm/.gitignore
@@ -2,6 +2,7 @@
 slabinfo
 page-types
 page_owner_sort
+page_owner_filter
 thp_swap_allocator_test
 gup_bench
 memory-failure/hwpoison-panic
-- 
2.53.0


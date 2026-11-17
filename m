Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907952;
	b=lfD2etFBtq3iuxDq1//ehISGWjK4DROuUoNJY6paSqZy2r0Jw2LYSX+1hEnd+3oUpHYU
	 Lsropf5T/1XJJKO8+evIPoctAxa+z/+YQs0JvFaA+3zn4ccbsuD6Jt2WqwwCOH+BtZHxu
	 PZCQw3uANXGvW6TlmQme2k2pJub0jWF4yTa6IVPOewOFVp3bsiNVhsQUJbzVCbSCTBJ/d
	 dJvtyqHT1Hv5UBMpF78oYPwZbmH9OiK9VnmygNdAubv9Rl4H1zTz0xeuCExmqxVEm3jXl
	 tNf13xU9gkRPaWHIjj/7aSskoZKpuTsC2HNjLmN98KqQy+8aHYVQQE+bt7WfBFZBRGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907952;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=kXfjSX8A0sMCwSrc1NZ9DdCD8p1mIiqPqqCInt2hce0=;
	b=4V4UUjPCl0AyIkKsxv4ANGceFPJf8nmvg049yRi64iIbemoOWnoexyyTTedTKk9UU4EC
	 5oOPx0LhhuCygaU8M81NVY90/5TyyCFcXNp5ryIOnkUQAYxnBDNN3u9NuJRDH6nfmVEyl
	 s4aOHiK8ehLHd4PA2jSfaKRR+cShB2kNzSNpmjWZZkdV72fxkuxHwTFRdkkpLg6t4Y6nI
	 DmcB01pikFLV2KgdmpWK/hn2sKkWdauLMtoLnSZDa852R6SK6v1fJqIT7Mbdt9MWPL8so
	 aX+q1L4l4u90Rw5jYZ6COuB1gaByMavC5MLYr8ADB9bcxKxeRRj8AXz6cXtGxg8PXhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=akHKDD3X;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C9606A32C;
	Tue, 17 Nov 2026 09:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0C9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=akHKDD3X
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kXfjSX8A0sMCwSrc1NZ9DdCD8p1mIiqPqqCInt2hce0=;
	b=akHKDD3XFur+jgEm7qdeoTDQvtUIj3wMYu3N0UKMq91NlUGx2dBznwEFvtCsCCn9/iyCcX/A7
	pH8DowUtdDJ20EZLRab6ImOXhhKPaRGe0ZNw6+SGzwl3qr2It3xOXSGjJwU5d5Qg8V+C4WxjbM4
	EtkRZJz/82xI+rt0JH3IkVY=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jTKJF1tByzRhT6;
	Tue, 17 Nov 2026 17:32:13 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id 398054057D;
	Tue, 17 Nov 2026 17:32:27 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 17 Nov 2026 17:32:26 +0800
From: Long Wei <longwei27@huawei.com>
To: <rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<akpm@linux-foundation.org>
CC: <graf@amazon.com>, <leitao@debian.org>, <corbet@lwn.net>,
	<rdunlap@infradead.org>, <linux-mm@kvack.org>, <kexec@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH 0/2] kho: expose incoming sub-blob metadata instead of contents
Date: Tue, 17 Nov 2026 17:29:49 +0800
Message-ID: <20261117092951.4017931-1-longwei27@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo200009.china.huawei.com (7.202.195.26)

Incoming sub-blob pages under kho/in/sub_fdts are owned by their consumers
and have independent lifetimes.  Consumers restore and free them at their own
initcall level, which is always earlier than kho_init() (fs_initcall) where
the debugfs view is built.  LUO, for example, frees its state in
early_initcall, so in/sub_fdts/LUO ends up pointing at a page that has
already been returned to the page allocator.  Reading the file then triggers
a KASAN use-after-free in _copy_to_user(), with the backing page already
marked page_type: f0(buddy).

KHO does not own these pages, so it cannot safely expose their contents at
any point.  Instead of trying to track which blobs are still alive, replace
the raw blob nodes with a read-only in/blobs file that reports the name,
physical address and size of every sub-blob referenced by the incoming FDT.
The FDT itself is reserved by KHO and remains available as in/fdt.

The first patch does the change, the second updates the documentation.

Long Wei (2):
  kho: expose incoming sub-blob metadata instead of contents
  docs: kho: describe the in/blobs debugfs file

 Documentation/admin-guide/mm/kho.rst       |  6 +--
 kernel/liveupdate/kexec_handover_debugfs.c | 83 +++++++++++++++---------------
 2 files changed, 45 insertions(+), 44 deletions(-)

-- 
2.43.0


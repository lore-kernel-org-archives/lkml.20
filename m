Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438194;
	b=Yfa16yvr12e9CgDR0uxQsJTIVkAoxCJvBfIxWhqeGNdh8D2V71NsaKmFbEQi7NIcZo7+
	 NhP00JHhDjlrfcT86cZEgm5iVSj+q3mfRc6+/hi4PkeImXJ0f0tAbytbB5T5YKrO0j5xr
	 ZPkags8JdS0c7ZYXImg9P38QZW3rDc17t1t9tz15tsxPBvpp7rf3ifQwIHvhgEV3eFFws
	 th6y7sgNpbm2+kUESW2IGHSXxgP3taAUVIFavzbj7KPFWD9m4iWOQa6CFf7TeCPxyLnqd
	 CpHMtYfFJwJ3euMmcE+hrJdpr0kdmz12hCMeYVlEhYyfwhSI747H+B5ZQppujIyIP9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438194;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pbZnjc0aH7SqSay+uNUOqZC70h/Fhs1yPbwPdK/7hRk=;
	b=Dyij+B3iJhcJXQVwJDJmX1WRicWtG/iBZlwy83P7D9Z+lLx8jsgg6zIU3dzQE1lgOC+n
	 d+W9Y49pYLb4ysI9SqT+fnlTaTUZppkeYNvtJlu1Irs2/b+4GLajNMQdiZWhoe/iRkw23
	 x4DSXmmZXaBE0G5VOfrcrqpLfwRx7OxlvwqwBJRboE8/i60fLXFahQtqcqI1lKrLFKUI0
	 RaFjpUX/p4ujYGQuW3/kxO5PEMlbXi9wh//N3xlk5H1R1GFLDQCX0aWyTwKb+JcJTmX5A
	 FDQC67ujWJu2UgTd5f+Uv4iWUZxRUYcD7NulFlBY39AuTSD+dtcJN9RcGCYCbxi/n/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=SRU7+qtF;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C83B606A33D;
	Wed, 11 Nov 2026 23:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C83B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=SRU7+qtF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794438194; x=1825974194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pbZnjc0aH7SqSay+uNUOqZC70h/Fhs1yPbwPdK/7hRk=;
  b=SRU7+qtFcHAGUOQH8FmgxXEuNmtPJ9QhjdG52F7y7jws/hkfDmGti+oh
   yvKijC7UqAp2yEGlkQB9K1tCUEhWXalC7zT01QLbR0lbe9SnoU0OjJrjw
   y6KWCKmwQ3tZZJL7ah3G26tXW8vT4BOPJc9EjQLmeM1EZrFaUKhTXiEA3
   By5zY0ZQWPfpNKfTTUjZY3oqxurULsyrt+vh1PGvwJHRExpUIHMm+Lobg
   U6gC6mn65TUFLwg6UxPpTtAV+ONIesk3eoHkcfyNqJFC5FFMzJyT1tGNt
   SOyyH7H2+YZa1sX0GK74mCcnCb56+hm5BceCxLk7KlREnKlDAkdmi1D+z
   g==;
X-CSE-ConnectionGUID: 3Lsv9MqRQ0+uXXjXKo9SdA==
X-CSE-MsgGUID: ANK7tCt9TI+DkYa4xsb2Mw==
X-IronPort-AV: E=Sophos;i="6.27,208,1787011200"; 
   d="scan'208";a="33663271"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:03:13 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:5799]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id 7b1afc33-599a-4b5d-a75f-31c09bfd95d7; Wed, 11 Nov 2026 23:03:13 +0000 (UTC)
X-Farcaster-Flow-ID: 7b1afc33-599a-4b5d-a75f-31c09bfd95d7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 23:03:13 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 23:03:10 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Shuah
 Khan" <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, <linux-doc@vger.kernel.org>, <iommu@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	<nh-open-source@amazon.com>, <linux-mm@kvack.org>, Jonathan Corbet
	<corbet@lwn.net>
Subject: [PATCH 21/40] nitro_enclaves: Document the slot pool
Date: Wed, 11 Nov 2026 22:59:25 +0000
Message-ID: <cb0d5adcf580f5fa3f1bfa4150040dedb4fc8eb5.1794393490.git.graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1794300002.git.graf@amazon.com>
References: <cover.1794300002.git.graf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An admin sizing a CMA reservation for Nitro Sandboxes needs to allow for
the memory the driver donates to the slot pool as well as for the
enclaves' own allocations. Document both halves of the pool: which
device asks for them, what probe donates, how they grow, where the
memory comes from and when it goes back.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 Documentation/virt/ne_overview.rst | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/virt/ne_overview.rst b/Documentation/virt/ne_overview.rst
index 3cfc50f788433..16d6b4a2771c7 100644
--- a/Documentation/virt/ne_overview.rst
+++ b/Documentation/virt/ne_overview.rst
@@ -215,3 +215,34 @@ An allocation lives until the last of the things holding it is gone: its
 descriptor, its mappings, the regions given from it and the enclave it is the
 info page of. So neither closing the descriptor nor unmapping takes memory away
 from a running enclave.
+
+Slot pool
+---------
+
+The device keeps a record for every enclave slot it hands out. On a device that
+holds those records in parent memory the driver donates the memory for them
+before the device can allocate a slot at all, and that device draws the memory
+an enclave runs on from parent memory too. It counts both donations in slots: a
+record pool that holds so many records, and a memory pool that backs so many
+enclaves. Neither number on its own says how many enclaves can exist, because
+each one needs a record and the memory behind it, so the answer is whichever
+pool carries fewer. Such a device reports the highest number of slots it will
+grow to, the size and alignment of one donation to the record pool, the size of
+the base donation that pool hangs off, and how many slots one donation to the
+memory pool is worth. A device that holds the records itself reports no slots
+and takes no donation.
+
+The driver reads those numbers when it probes and donates the base run the
+device asked for and one run of the granularity it reported, which is the
+record pool an enclave needs to be created at all. Both runs are asked of the
+node the probe runs on first, through the allocator an enclave allocation uses,
+so a per-node CMA reservation there covers the pool as well as the enclaves. A
+run that node cannot serve comes from any node that has memory, because a run
+in the pool is read by the device alone. Probing carries on when a donation
+fails, with a warning naming the error. The memory pool starts at the number of
+slots the device backs without a donation.
+
+The device holds every donated page until it is told to let go, so the driver
+takes the whole pool back when a probe fails after donating, when it is unbound
+and when the machine shuts down, and the pages reach the allocator only after
+that has returned. Pages the device will not give back stay with it.
-- 
2.47.1


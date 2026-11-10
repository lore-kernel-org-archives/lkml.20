Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351467;
	b=Fe7HNFcRg55qrqdviwnjB79HB3RTq0Ym3cqKlJkB2OetPhOcY7BLZSX9LjOdIGQ1/XND
	 xBrtzVK7tUPV/7+Z4hw+DOz6uXg7qtS94DwAuXY2nEapNnbfA/+j3GnvHdyKvHuu0Qdq8
	 zsR2hELWggYJqg4KkI1PDbUynUwhTuM5WP43mPU/g/kTefk6OtO+PDtgyuTWY+HkN26U4
	 PBoZDq4cP1sTSesRKHfaSqjtlSMxnCdpvT652m64Sj2J2J1veGIHt0XamVml5O9vo7C2B
	 IuBktOjdf75AJp6DMozUBE7h+T21iXzntMHvHJ2fP89VThAOhLvhBiijUo3GruFUKqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351467;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=KCrohZMPQ49/6mvhlHcErh3G9zGs/xibKV8aanZizrM=;
	b=ggYKNAwOv5ShyLQW24A+wNlh0PEsxT4vnPAMQ6Sk9aSgwm25mUknLoOwHTamHbAr2PxS
	 KldGQ5ArTrlU5RD/MRpKzfSNmqiVRBNh7mxyWUZMb3bE83ifVDgtN0G/nBxEdABomTGOR
	 KWDzSs4KQISQB3XgCTYAeExKj+LBUfkA+SQepA3aE2l+BnKJPTONikkURcHRj7YjjR8xl
	 23kUjXnzWCZE14OCexicVhA6kB8xYd9JKopgIdulGWMC7fZHRCx/G/59mWPJSLbQkdjHB
	 6vFgwNfVzxcytLXk0MFSzpeUzcR+pWhp8MIf1wis/hAd4JtEM6BPm0rueYv6mhJRsmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mepsQgqO;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C041606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C041606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mepsQgqO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794351467; x=1825887467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KCrohZMPQ49/6mvhlHcErh3G9zGs/xibKV8aanZizrM=;
  b=mepsQgqOt43CcnujTC0GbYuXfsqEjHBtibA96EHkt92MPYzHRPn96U19
   oHw8yJGw0jMIc55/MnwAqnanNfkXq+o/UP4cfb7tlHoWuyabEA1yK2lPS
   4Kuuff5Zuxu89mC+aRE1dHY7ioM2WmsB9uWRSL6QbA469b2oel66DClfN
   S8cwgehEk7qbCoFH7HXRKpPXJtUyyPrB4I4RCtkWVaphcyxpGN0KefG6o
   PSIHpw9K6YpCWuS+YmBz7CYMLEbQfCvRv6viAXt5uTsYnKC3wtkiiP4jo
   jc6UGEQl2K8/yi14IuUkFPQf929zo3nZKvvqT8ke8otmoW+3ct9lo91aX
   Q==;
X-CSE-ConnectionGUID: HdsSGMfTQ8uu4ZlcpBxg8g==
X-CSE-MsgGUID: pbzLt/NVSYesoRccpqMgyA==
X-IronPort-AV: E=Sophos;i="6.27,206,1787011200"; 
   d="scan'208";a="33476163"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 22:57:46 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:10377]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id bfb556e2-6c58-4936-b169-98b50b90d9a0; Tue, 10 Nov 2026 22:57:46 +0000 (UTC)
X-Farcaster-Flow-ID: bfb556e2-6c58-4936-b169-98b50b90d9a0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 22:57:46 +0000
Received: from dev-dsk-mkbund-2b-9ea2efba.us-west-2.amazon.com (10.2.100.138)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 22:57:46 +0000
From: Mark Bundschuh <mkbund@amazon.com>
To: <muchun.song@linux.dev>, <akpm@linux-foundation.org>
CC: <osalvador@suse.de>, <david@kernel.org>, <jiaqiyan@google.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Mark Bundschuh
	<mkbund@amazon.com>
Subject: Re: [PATCH v2] mm/hugetlb: add htlb_dissolve vmstat event
Date: Tue, 10 Nov 2026 22:57:34 +0000
Message-ID: <20261110225734.3549172-1-mkbund@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <D6862DF6-34D8-44B9-8412-B241812F6754@linux.dev>
References: <D6862DF6-34D8-44B9-8412-B241812F6754@linux.dev>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Hi Andrew and Muchun,

Thanks, fair questions. Some context: a management agent offlined memory
blocks on a host using huge pages. Each offline dissolved the free huge
pages in the block and lowered nr_hugepages, and later the workload
failed to get its pages. It took me a while to work out that the
offlines, not another process writing to nr_hugepages, were what had
shrunk the pool. The counter was meant to make that visible.

Thinking about it more, the offline itself is already visible (a
successful offline sends a uevent, and auditctl can log who started it).
So I don't think this needs a counter. Please drop it.

Thanks,
Mark

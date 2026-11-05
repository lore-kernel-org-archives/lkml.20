Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905953;
	b=WOn7cw8hYmIVDwcKNIX5ETaH7mgMicTUOid5DQOYbHo9sVlhJNzwIjoEmbt47K1CnXQX
	 WFO2UtIgVTZXcNpbQLFJjGUmUy4xrdam3JGcCE9R8cVdCKYN8qmrWS7BcpjdEzyBAIL1r
	 2D69S9nDATKhIPX20YAaG1aMT+A987AXTDd/RzehTWUT2KR3ApVLQhXK9Hf5EADHEVThc
	 nVSsthle0AFKFw7aVOfuNKQoKP00YGvQDVTMSAIywEH8Qu2r63da0C4bKhKS8RXtZIOcX
	 zrNOP2jg44SmSpOLH/RrWQ6zgOfwRZqp5nxHSymJsQFs6WQ0M/9xYVMyd2P79s9IKuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905953;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=5CeXz8onmx0GjUbQmMDjhDtvEqqOc02tfY/WFEpYS+U=;
	b=Iff2TT8NgjHttHHqbuUYgcGjcfnirHMCvpUm1TkcCKCSrGaQQ7VHBo1c6m5ks3WH48Qi
	 EiXclIGtnmWDxvDfDp8nwT6zwei/qrGzy5IuDixxxcL3epzWguCVr1wpIFWXFJi03GaQ+
	 fZkmNPc7AfJAI6aZ5MHXueTgpKESjh4xFZMQZgRTJLTxDAmsNEjj8Vlu+55eq/W8OIyxY
	 PXkC3WuiY5mN3Ge04fq8yBCFts87NA/3bW/GpeZwq1A2iXtA9zMmaOLC8Q9unyq4kV2O5
	 B9m3AjZDiTSKvdfm0ck4ypM7rABV6dR2Sq/PTWpD+jPv/GxuxeN1ankCANtUvmWZn4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=lptYNywC;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C5B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C5B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=lptYNywC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793905953; x=1825441953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5CeXz8onmx0GjUbQmMDjhDtvEqqOc02tfY/WFEpYS+U=;
  b=lptYNywCq1pYWLojc0zfGY7TL4f3umDkwjrnMSDUpM/NkXfR5tGiPed+
   O2HEe3GRjDjToUQSe95dDedGXMyWXsab8WC7Bmhh6DCcO3BXQ7Fx6SqNN
   kykb0q9rtb/DiuIHhl/pkqCfeLbJi8uIlIOI1FnhzZcIScfGYUTF336Gj
   I1WEOAFhKVp3L0c5vBVQZ+dFvqCAsA0eoJGXyClF7P8mTBwR64YE0f6BF
   PkDMks7hyqrr7geabU3l9yakH38EMnGVCBt23H6C1XCKv5kH8RC7LOOXp
   VhbPXBSuNh7dpfB4cNj8g9oFZS+34euAqOrPLZEtywpOS6MXKxXbTQdei
   w==;
X-CSE-ConnectionGUID: QNV2v3RwToC2Q34F/9Phbg==
X-CSE-MsgGUID: iAvjnRKrRjG3vygHqo3ljw==
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="33006063"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:12:32 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:27964]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.15.208:2525] with esmtp (Farcaster)
 id 5c580cd9-511c-44d4-9ff9-4e168f6574bc; Thu, 5 Nov 2026 19:12:32 +0000 (UTC)
X-Farcaster-Flow-ID: 5c580cd9-511c-44d4-9ff9-4e168f6574bc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 5 Nov 2026 19:12:32 +0000
Received: from dev-dsk-mkbund-2b-9ea2efba.us-west-2.amazon.com (10.2.100.138)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 5 Nov 2026 19:12:31 +0000
From: Mark Bundschuh <mkbund@amazon.com>
To: <jiaqiyan@google.com>
CC: <akpm@linux-foundation.org>, <muchun.song@linux.dev>, <osalvador@suse.de>,
	<david@kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/hugetlb: add htlb_dissolve vmstat event
Date: Thu, 5 Nov 2026 19:12:21 +0000
Message-ID: <20261105191221.1010676-1-mkbund@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CACw3F50bfsm0pZoEYL=y_9yiQ2XEQTjCE=496D-=MJbRnXGhQQ@mail.gmail.com>
References: <CACw3F50bfsm0pZoEYL=y_9yiQ2XEQTjCE=496D-=MJbRnXGhQQ@mail.gmail.com>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Thu, Nov 5, 2026 at 09:46:58AM -0800, Jiaqi Yan wrote:
> >                 update_and_free_hugetlb_folio(h, folio, false);
> > +               count_vm_event(HTLB_DISSOLVE);
>
> What if update_and_free_hugetlb_folio() failed / bailed out?

dissolve_free_hugetlb_folio() already rejects gigantic folios without
runtime support, and restores the vmemmap itself before calling it, so
the only bail out left is a folio with unreliable raw hwpoison, which is
leaked on purpose. That folio still leaves the pool, so I think it should
be counted. "frees" in the commit message is misleading though, I'll fix
that in v2.

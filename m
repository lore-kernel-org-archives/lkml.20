Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103273;
	b=kpjP2/HA8OdaqTstRgCKJBCq62tG1CM7Q37Bpyc0cuczNnqZl8QeLGoTogesIIQRSdy1
	 O7nmCiWlZm7srOkxsH3F3tNrVWVusKNmMxG9bFdLoNlVmhtHmiQdb2agPOsuIgKOUkZ2L
	 Zf/aNq4eKqEHEDx+yAQ1ZTcq1V2yhzuqIiKh83pCm3k/UE193snyY2AH5mu+OQqsLd2Sb
	 XWrqgR+Mk5TvsNzvb+gXcM3xQcPyx/AhBlCqqaaUDsxxN9qdjPpuqOM+b7yjXVE6iw49A
	 +ZmZLX1pAuR/duK57MYHxesDLwQOIkCoHv5uMjUFUM1mZKlEnnQXlRAaEKUbrHAgfmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103273;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2elqJi5kzHeKCGHmCgG7gHaV/IXQ0JiU4P+KhvVimy4=;
	b=H4BNAanBan54r5YYzHe7pLew21TyZFj+foYVgMerZDyK9ZtYe9kN+ui9+U+6YMShW0X/
	 ARvwXqQ9FI3gQiuyT9b1/Nxm0Pnr8de2J0gHGCyWPkSo+/5cuLMm82+dwuTqt/M9s7jiR
	 eYDjROD2fn3LsdRFbE+PlpG6TNC84mJOo6klnQXLWaAIlYsc1/iotbohMQR6C4JoyOaEa
	 2RtkY5eX+gQUOOdmquSFtKBYgloLdsa/qqsUT2PaLl8BB3cAni8Np+UjsiimPQfxOSYAl
	 RD3q0YHpt0qffU4MTp33/7ry5LefN04SgL0+eXzllBidOl5PI39Mgk0VLwVKfLKl6yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=KWOQssk8;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D0D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=KWOQssk8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793103270; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=2elqJi5kzHeKCGHmCgG7gHaV/IXQ0JiU4P+KhvVimy4=;
	b=KWOQssk8Um2NQDz5Nw/qk9tJ5s7v3UiuwZftIS/bwbhbqUITYEk4VprKIVns15FvnY6QfmsE4EdeLhxOHyJ01qT7yZG2d8A28/pB8pralp3jwhfaWaCnPnM4mOiy9vk+DWCpISox+NHzQZOjdfcB+ItTUvzdYhGB0tPU+gAmXeE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XDdogD._1793103258;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDdogD._1793103258 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 20:14:28 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: david@kernel.org,
	akpm@linux-foundation.org,
	"Kaitao Cheng" <kaitao.cheng@linux.dev>,
	vbabka@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: Re: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
Date: Tue, 27 Oct 2026 20:14:18 +0800
Message-ID: <20261027121418.1222887-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <87pkww7lnl.fsf@DESKTOP-5N7EMDA>
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com> <f28b2414-ff07-427c-8e18-e950b492b351@kernel.org> <87pkww7lnl.fsf@DESKTOP-5N7EMDA>
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

On 10/26/26 11:21, Huang, Ying wrote:
> Therefore, the primary value of this patch should be to reduce
> machine checks (and panics) during memory copies.  If so, we
> should place the check code before copying.

On the placement: agreed - the next version checks before the copy as
well, so data the flag already condemns is not read at all.  The
check after the copy stays: a flag landing between the check and the
copy would otherwise be missed, and since the DDR poison state is
sticky, a late flag reliably marks bad data while the destination
folio carries no marker.

On software-injected poison: it was our reproducer, but the state is
not debugfs-only.  Errors reported asynchronously (GHES et al.) set
PG_hwpoison with the data still readable, and a THP whose split fails
is left on the LRU flagged by design.

On the predicate: agreed, the next version checks
is_page_hwpoison(from) before and after the copy.

Performance numbers will follow with the next version.

-- 
Yuanhe

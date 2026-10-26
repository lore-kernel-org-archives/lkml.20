Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792983482;
	b=CGPqGhDsXo8C03c4WoBsg/MJvRZAyomb9Q44ZqnG110I7U1kRUzQN+zPJ3TtcqGUdOJ1
	 ZMyHinnuofWe8RvRMuLfGJ5/3iEvsZZHSbJ/D0ZdnxmrYypoZD8kCl0v95Lv81s3XH6vf
	 LSRI8IEvpZnU5iD29TflF3gHS6g3xRm8peiMn0L2gZ9cfLLHtJ88qQjyOpcVLBi3rwvNi
	 rmMFe8U4aKGs9XLITcqYaVt5WtTmPOOPH5gxMaDSXHn2+12YToqVyno3hTRTto2szXhmp
	 BPXvRKSZJtCG2lMwM6BGhGMRjmp1q9ni358NGzl5r1yQgsRZ9AyzXUNgZhbUgMJoJOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983482;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8M/3vq7XpKzMqLSjMclXqdhAjifEnbo76yvSfWikbsc=;
	b=JnikSAefjhLb34djVD2GoJ5gY4EW6hvOgmJMmBBiS2xGvys3wzEbM2WLyR0UK3wjb5d8
	 oyjg8OSOwTW7eXqF0dwN8aoGHxgNc+nutvgMX+qBmCgvSUWqZj4XVK899VpLgabc9gwKF
	 LCvBtAJCV+6+BGoDuYz9A3BDU5kaIpBseykHu8FSPLo53nfjiewa+b06wmVG1Xu/OcXQI
	 hFrBMPIHv/D6fmWj4QsS5Gdo+Ght5QDOxAW59B+3pSaXYq6mTQvOSRxL4uaKAON98Nler
	 qczbTr9NenZwVggZIlIEI5wk+Bs7IamQigeIW9TgTPfnojbZXan/L/2ZCq9HhcyRWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AQBh4jnx;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C0606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 058C0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AQBh4jnx
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792983478; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=8M/3vq7XpKzMqLSjMclXqdhAjifEnbo76yvSfWikbsc=;
	b=AQBh4jnxWU+RQza3aTplr8CzlBwU9IIXGZeBmcAf3ZMrjS+9bjDdUnLdpwJrXMkGU/xO5GWXRlmHJaUHKo0ds3m/Xq2XS+IZM7BSRAeJleTsXjF2L+UMcmv6oLVr/RSVwn8pnTV1bzfgK4oLykIVsjXfxF3Xa0NGNqHnJhXO9ZQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R451e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XDRaNKg_1792983468;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDRaNKg_1792983468 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:57:56 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: david@kernel.org,
	kaitao.cheng@linux.dev
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
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
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned pages
Date: Mon, 26 Oct 2026 10:57:47 +0800
Message-ID: <20261026025747.1432066-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <58cfeba3-a3c0-426e-ba97-8f82da5b1e8d@linux.dev>
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com> <20260928105805.1215770-2-xiangzao@linux.alibaba.com> <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org> <20260929034123.2705745-1-xiangzao@linux.alibaba.com> <331b4e40-8d0c-4333-b2b6-b81e4c4b2e17@linux.dev> <877bjowf9i.fsf@DESKTOP-5N7EMDA> <20261020071600.3695395-1-xiangzao@linux.alibaba.com> <95a5ab94-5d91-4a01-a417-19f27aa91b54@kernel.org> <fbd5ae06-b6da-48f6-9c46-188fb6ba9684@linux.dev> <bc1b3255-99f7-49c8-bb52-bada6df80f72@kernel.org> <23d3756c-1a87-402d-80b4-c838dfc29f4d@linux.dev> <9da90d76-031f-4211-b9de-439cbf7bc63d@kernel.org> <49966df8-c092-40de-a05a-ff6d69382dd4@linux.dev> <e4c3ce3a-c19b-418a-a92e-40e077f1ea63@kernel.org> <58cfeba3-a3c0-426e-ba97-8f82da5b1e8d@linux.dev>
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

On 10/22/26 20:39, Kaitao Cheng wrote:
> Here are a few subtle corner cases I came up with. They may be
> extremely unlikely to occur.

Both cases set the flag while the memcpy still succeeds - that is
the "how this makes sense" for checking after the copy: a check
before it misses them, the recheck after it catches both, and the
refusal is the same either way (the data is still good in case A,
already bad in case B).  What no flag check, before or after, can
catch is corruption whose hardware report lands after the last
check; that needs architecture support, as David noted.

The migration paths spell out the same placement and races in v2
(patch 2, just posted), and the fallback patch ("mm/highmem: refuse
to copy hwpoisoned folios in the !copy_mc fallbacks") is posted as
well, with the races in its changelog.

-- 
Yuanhe

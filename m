Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818473;
	b=ar7Py7KBD/tws/KYV7X+KswmXT4G4j51zc7h+nK+Dds9V8NQdLthccV2Txx2APdAa2B6
	 eqQIDWkqar5vncrJsNrLBpEiKvghZzscP7GOOHf8DKmPoELjoaXxwaM4bEzGDk+m2PfZk
	 Xt1dUiYXBhJnGIYYLUeR/GmpLLQjb3AD1lOwo98tfjW/qyLi+V24P7CEqc75d+2QzTFK9
	 QWFd5ewz78nfKvFg81H91cZMBy1micDLhF8oXeN2oiMdkXjoRhckcpB2QleslSa5GUUn0
	 fLD5rWKnALuQ/Hg7LvEbKYCM+6Z2KzClMwGMspfTyFZRawBDTrP70WjxtMDZTiXYyFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818473;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KL7fn0SdUfh0PwymNywyh+Qt4C7W+qSR1vaw9n0yfcI=;
	b=PzEzlFJUIYpQ0AnYurAZREWUXSv239o0KjIVjMIOaxAeFtEKrXvOfidS41opU/RZvVre
	 Sm0EsFjC/Xnguz/imtNATrnUsUkhFAQXaAu7VASU3A8+2uK+F7ovEYux7lwHivr7MuYtb
	 k1TLqEh4PF3JHUId6+boNywpCNL2BNvuAoWhx52zpR8xWUqSP/jLJ5TPKIeP936RT+cyf
	 8wpUqy+0008YogyvRBaGftmBE89jJUs5nkgngUn4IJEPgMLUrHs+PNoz/AmAr8ot9uQiS
	 DpJc27GsySty9SkPWreEZw/thzHnxpaFOwAvkwRcG8Y2Z3C3NmU3eJ6IA4tCHHUtBqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CzAvgxDR;
	arc=none smtp.remote-ip=91.218.175.121
Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13266606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13266606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CzAvgxDR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KL7fn0SdUfh0PwymNywyh+Qt4C7W+qSR1vaw9n0yfcI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794818470; v=1; x=1795423270;
 b=CzAvgxDRLdpr5bqzJ957Qy9BPZfLtXeVM+exj5wU8LWrLIFPl7DJ4aLl41ieKbhA68oET4UP
 9CTuvGW2WJszG/rIZb+iVxAsbrUYfMHjJZKXjbWkrqoIXmnhpARca2mSgk3UskbIq6c7PlxwFU3
 1umvd/QJr5dn8IKpTJ4p61aU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9d6598dc497ba3c;
	Mon, 16 Nov 2026 08:41:10 +0000
X-Mizu-Trace-ID: c9d6598dc497ba3c
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	osalvador@suse.de,
	rppt@kernel.org,
	lizhe.67@bytedance.com,
	apopple@nvidia.com,
	balbirs@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	jthoughton@google.com,
	lance.yang@linux.dev,
	qi.zheng@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/14] mm/mm_init: verify zones for template-initialized pages
Date: Mon, 16 Nov 2026 16:41:02 +0800
Message-ID: <20261116084102.57957-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261113033442.62970-4-songmuchun@bytedance.com>
References: <20261113033442.62970-4-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Nov 13, 2026 at 11:34:31AM +0800, Muchun Song wrote:
>Template-based ZONE_DEVICE initialization bypasses
>__init_single_page(), which means copied struct pages do not run the
>vmemmap zone consistency check.
>
>Verify each destination after copying the template so the fast path gets
>the same validation as regular page initialization.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>

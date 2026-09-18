Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E72135B8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699387; cv=none; b=K3qwGATobipFc1OwECqNVNntVSi2RfNuehHtn08LjXwka0s3uyQjvFRgQHzFmlU3RiEnc3myO3C63Vw8Vd6rD85u8SeC/t9u2pNNgFhpYyvb9xp7ZAVrdHHngG8e7MZbuthntq0eOeMauS1I6eqTJylOt0qMHz7KQ7l/evpHkl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699387; c=relaxed/simple;
	bh=G3dURyHBUsICEwcTyMrIFBFXHTdN1aL9C3KaqyOtbJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YIg/AwQBF19l9JJP49KMLyKR44zsqbJ635Qfzaadct1D98XrQjiJld4M/Mqtljp+Rs1XG1JSj5Zn4gxJajMQkBXsnKRgGg7Pq76qwQFlNjRXvAXHIwTzUDO896j+UuFsMiLcLJbVuBWa6ir6FHqeAq7CZ7bencgW714DTu821xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxgqVmHB; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxgqVmHB"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so180429a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699367; x=1790304167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pChBH6fnUF5InIxQDkQOn83gyJog7ZSG5ECzSiY4hs8=;
        b=RxgqVmHBuiFZlbddKnPcO7EnEgutRDYgwrLSdLO2TOaVOxBWqlWwsFXwYNdECzF2z+
         xkJv7/nLlKjg+dByOv2+uqXo/aZ2xsPaLkPjeBjlpiMnKiJlW9XGA6aXPo6weh7exsMA
         ddY/IdqmL9dTlWsncRwb50RFbHtGhzQMGXkVpfQTUtR0BJzuEYAujT5+WioVGb2oZoph
         vPrpMW4P27PWLft6gFo5pGfZP6EIiAmIMHrFrhUoGO5OpgheHl3pFlBUkkgLLyu3IFhg
         faFafbq48CZ+92oCqUbjzLotDQEIzpVWUfhpjZO/rl/d+yZJ2PHjH2XvImXVJ8t6x6SR
         uu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699367; x=1790304167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pChBH6fnUF5InIxQDkQOn83gyJog7ZSG5ECzSiY4hs8=;
        b=oMhgSgqJwdWOUMYw3sL25vDsaxetM3LXyIZbFVoq0jomDQS2WOWOTVpdUl3IKRtQIs
         tL39dgIOhEylnh3cUBz5DXDqjarDLy1BlQBI469epQw7MXORN9aX5BBCKhHhiY+71Bdm
         EibKKdh8AlJS9Yx16q2khrx2LdsA+JzbWWx/SM31J+OWYZWTJj0hk2lgbtftixQKS4qy
         Zeeo3aknZh4jG/rFAMl3Qbyq4VIYWQvTYT5g2Yiga4n8q1BrsEBTbVU9dDi2fcS/MCcf
         Ms/QaPyzKD01sb7BXdZRxqZRLi5w/EfLISW3B6E09x/lS3WOjbOq9ukWCsvZbfo74WQh
         XK6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjDpQXlYKYKubnteiB2gD3V1pu623imRFMEr+WKbwLQ6TNA4GXqodENiCbXRn1iwwZhBOqlIV5KQcQODA=@vger.kernel.org
X-Gm-Message-State: AFuF++ng+Y0u7YZpZxjHP0a3LqedyZKa9iQsCmaJzFk0JH8gmkyM4bAo
	Xy6LtDzjPS5/wGH0keyLs5e0L7oO5qyTW1tVLM3x2ZB51ClIHzitQ8UX
X-Gm-Gg: AYBFou2uj9mw9BqVkpOK+DSLoo+cFJ0BQV4nU6d3yAXv1EEenWGP3eX1oQnABLyjPNW
	eadY762Fd1I5tj8rRUsb0ZGQxtCNIy8ErpHRZWLzsMFp3cdaWTWlnD80JpImoti8rlYdf1ND6Ji
	wUbJKULMPPz07EIwssNAKgySFtlshSUgngCV2IRp7D2FEDTf/cLgfZbkdwvreBK8nduDJ9cJDKZ
	LODKqHew+tOa6A+qIlpW2V58z20uQxyKpEfNF80E9a5hYpMydeMyharH1MBZP/SWDIVWqeBHDQf
	3hYf0N7ynZpEBe5EOPNpfqfqxXAEUBJdnZnPjkhOWhvRAq7b2P3HErBMumhmZFe9Bag75Tfazl1
	C+BKl/KfhLxX3PPYrRSAGGp4TXU+7yzGsJgUEaatguoeRjC6wvF9NKly8lBZde182ylvn9Jr3gs
	xeibiyW8fPaUMDAbfFdWapqny3zFsNWEB/w7ElRQidSBuAn5Q7sVBWn02l7mOHOnzM2GFL1cug7
	6JB+YAX8uUHRgM5Sv0cz4Fjo4o=
X-Received: by 2002:a17:90b:39ab:b0:39e:34d6:7eb5 with SMTP id 98e67ed59e1d1-39e54b85746mr2288555a91.9.1789699366611;
        Thu, 17 Sep 2026 19:42:46 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a53e4e1sm550938a91.13.2026.09.17.19.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:42:46 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: kmanaouil.dev@gmail.com
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/4] mm: adjust free_pages to make __zone_watermark_ok() mTHP-aware
Date: Fri, 18 Sep 2026 10:42:38 +0800
Message-Id: <20260918024238.31128-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917171642.b4pkhqmvjwnq3vmq@wrangler>
References: <20260917171642.b4pkhqmvjwnq3vmq@wrangler>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 17, 2026 at 06:16:42PM +0100, Karim Manaouil wrote:
> > +	if (READ_ONCE(huge_anon_orders_always) && order == compact_hpage_order()) {
> > +		unsigned long free_pages = 0;
> > +
> > +		for (int o = order; o < NR_PAGE_ORDERS; o++)
> > +			free_pages += zone->free_area[o].nr_free << o;
>
> I understand that you don't need a precise value here, but in every
> instance in the kernel source tree where nr_free is accessed, it's
> accessed under the zone lock. Do we need to use READ_ONCE()?

Good point, thanks. The nr_free read here is an intentional lockless
estimate. I'll annotate it with data_race(), matching how
fill_contig_page_info() in mm/vmstat.c reads the same
zone->free_area[].nr_free field without the zone lock:

	free_pages += data_race(zone->free_area[o].nr_free) << o;

data_race() documents the intended racy read and keeps KCSAN quiet.
Happy to use READ_ONCE() instead if you'd prefer.

Bo

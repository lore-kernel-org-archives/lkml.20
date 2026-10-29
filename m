Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256321;
	b=N6N/hXlhPMVme4+Mz8ZJJJKJOkJPMhFxK3gh/lzhW5pKTIwpXT4ODZgm4vCL+eAlJPDf
	 3G+jc8pOmso8DaMqWjesZgStrl9SxR5P4+TEdayBQkGPI1LvKmY0v0cYH1uMMycZSdL7h
	 uw9PwACYqAZFl6lSoTu2flEhDRC4W4Bcn/DkPKTOyE4hhLYshtq1Sg342uaqvnH6vjaZy
	 W/J1v7XTNHHbhcqjzFqDkC7iT9TO/1PDHNW2ZfCK62ItBif3ZNx0dXM4XIdpfW4QaKd54
	 HWMYTnrDpVZtHsyvVBWMorZHCbn9IxuuJ7unrGZaMSbO8DLv2jbrVpZJeDy73zAVtIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=PpZwiOLy+qBSQ8PQ3tlsCfW6m/0pXMByVlZ/42AmEx0=;
	b=EZg/ULujjcdWYie+E++ONQ71f4wldOJDQS/iJAssMrcS5SPLbU8bf5VJbhqfLj3cnaO2
	 UxJK7Zf6cFARwI3A/gkF0urSJZwFQakyhsmlQLGB8IZb8O5vZkBTS69fTmJYKLGdm3iv+
	 h6MZ5bgrtmgt15um4Qwr5nihVxLBIvWPcdoVCrPTC0DgIhYIb/Wa25bEHCAVmt5brYhnJ
	 k2miFbmcCJwJctWNyWKk9PuWc+vB7DGzTW3fmneP7YvJhdBX8POmcuSUhmmigfmjNi04J
	 E5PkdtBiIko8be+TCC+M84z2cM0t4XfoDJC5iBe0hWXG+/1/uspopI41wHIyX5/aP3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KCg5n/Q8";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1956F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCg5n/Q8
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1156155a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256320; x=1793861120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpZwiOLy+qBSQ8PQ3tlsCfW6m/0pXMByVlZ/42AmEx0=;
        b=KCg5n/Q8XqL00OlgFFq3nv6XZvSJbvibwOIUf3l4ieuhRJh02MJd3TmHNL8ItAvBb6
         DQI7zORWyFVVog+kbdHN/hAjpeFznKr71mR13ljhlNkwi/XxIpA2gM2IQ7y8YAQ+0G3H
         ji7h8gpO2SHejHiHeGkBF7sakQPW7l1YdGaqRXkXMFRuxljqORyfWpIq0YHu7SCZ6iVS
         kye+V+d3VcqR+mnKfGJi3n6/Q4Yd+xqIXxBtOLaP8gROLPokcoy9TYDEdztFWQUwCpQ5
         bETn4zmz0nsCFsoruMBK6xUnzv+Hfawie6E/LuJYrcqEEaNK3MZ0HvwhMP7lgfZhK9T0
         kgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256320; x=1793861120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpZwiOLy+qBSQ8PQ3tlsCfW6m/0pXMByVlZ/42AmEx0=;
        b=V0ywfEV/9osZCo6Ctk5d5EC3I5rojnQeHcZ8hcZWi5s5PKcTYrWkddcavkqRWKQ1k7
         lJ1dAXl2az4ujEcuzqxVNE1Q4EKYN+krPQpOuBCD7huiO1zr8QIUxyuIz0a8awoNdk6t
         ENyTj/rTxAdNMxtVIwH8DddwfiWMalr3vNKgSteuHtpsak6B+PXk8FHpfEktuW6+rMcI
         LxLNFRbyRbP3oI3Se30oF8KV+4uxACVLuckjjU7+rmvgfr0wElEPMNUO+FNAP0Ixp5fD
         jRiDCzBBhsfWzCCX6tvVx6CW+vjYBtd6E/mjehmS7hQlphCDoqlWhzkbUKvPou8fJFJy
         zEvA==
X-Forwarded-Encrypted: i=1; AKwUvByKZ8YHjKocpJqBcBqRp/60bymz7VNjXp1wBTzLIeEKUxMV1ziO/VQhT1jgm1Uk6BY0tr+G/++eRAwYC1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpx2T8JFk3CwM3U76MYojwGVxJEtyJTrt/TZSI3yDto7ME3UaD
	8CCOBU4+H9BZC42QY6YfrU2x3Q9ZKcODQ6JkxqoFWqZPGCg6QRQyTWdr
X-Gm-Gg: AYBFou0RoLuMAvxWutbj0n2SsDFzQ2kepPvrNzVltDeVn8yFzXiAGkdDq4YnZ3RlmBS
	oSsmmRKV5tPjRY3FMVVCAUwI3dioU6EKRM2OrP7jSD4pItG4pk9aP886BgVN1QzEsqjXuUbIAem
	pP/Ljn/zpXvoO0t6wGHXFpwNot8a/jiPfrfv2JZ6m5eCG3wuxC+RaYB1mVydvzc8Wsd2PCpRS93
	Ee1Xc0iL6KmP8t9JKeEiARJpzB0MPxvMl1sET/PZ2KSPAJdrvjhRMLVtyOCuwX+Oqhf9YvfwY1r
	zOTeQ1mDcGDEXQI8L79yIf3+vGFtSdBnv7hklSNhEHcMI9mnmu1lrl9OeTe3VyF/SeodOhycCry
	35w/6UaQT+zlNaXUektMvmjMllawfPartVr5SdxsifSiobIzBM0J8AY8yirh0in32GFaBtOajwA
	oZOmlM0/u7Tfz5JMVkDcB/1V48W4ig9LtEdm43em/9fCcezyrxd2Ory1iRx1fmPp3jppU1snswr
	/H6cyiybcmOAEXinh0D7paxnK+a5oMmie35WeR8DGCkLWxSaLwZmwXhD+xm8u5ux967TWhxsjcj
	J/6s8pb25HrEsZqGD9NtMz6s/A6NC+Euirb4WgyN16OXTqJqL2c1Pg==
X-Received: by 2002:a17:90b:2543:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae58172e4emr3338233a91.12.1793256320522;
        Wed, 28 Oct 2026 23:45:20 -0700 (PDT)
Received: from localhost.localdomain ([101.44.96.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8401casm2729502a91.11.2026.10.28.23.45.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 23:45:20 -0700 (PDT)
Sender: Yilei Zheng <trilithzheng@gmail.com>
From: Yilei Zheng <trilith.zheng@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pankaj Gupta <pankaj.gupta@amd.com>,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 3/4] mm: add shared read-only vmemmap support for FS-DAX
Date: Thu, 29 Oct 2026 14:45:10 +0800
Message-Id: <20261029064510.17667-1-trilith.zheng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2E5C10CF-F3E0-4694-965C-B0E432A1A962@linux.dev>
References: <20260903122128.12264-1-songmuchun@bytedance.com> <20260903122128.12264-4-songmuchun@bytedance.com> <20261027065723.66564-1-trilith.zheng@gmail.com> <4c9741cf-ac62-41d4-9c7a-7d5ceea4a8e1@linux.dev> <20261029030511.12004-1-trilith.zheng@gmail.com> <2E5C10CF-F3E0-4694-965C-B0E432A1A962@linux.dev>
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

> What's the size of the roots image? And I just want to know how much
> memory this series could save in your workload.

In our setup, the rootfs is an EROFS image exported from the OCI
container image, so the pmem device size follows the image size.

Most of our workloads are simple today, with images around 1 to 2 GiB,
which means 16 to 32 MiB of vmemmap overhead per guest. And we expect
the average image size to reach about 5 GiB as we add heavier desktop
and agentic RL environments. That would save roughly 80 MiB per guest.

At our target density of about 200 sandboxes per node, this adds up
to around 16 GiB of guest RAM saved per node. Memory is what caps
density here, so this saving helps a lot.

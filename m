Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A1D3C2BAF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895017; cv=none; b=b5k4q2UGjOtZQWqz+ChcSINO4QC1eEj3Rqjw5S5UqYtnnTABdwWsSLzfQMZjvVK2pXoqKMgZk+BV3rVo/ugdGUDaQkmofWfkh2xp2IiUR1kc8iI1H+2I8s3GTOpmbE8LL6JSIxBMBEWfKFCgC/sNKEyLq4vc1Z88trNIe4f3pLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895017; c=relaxed/simple;
	bh=mtqi38h9DnqwhETyTcFF31oaSRnkxp4QlcAD58krSpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sgr/PV1dWJzt2JtqVhv+CE2zCaggX1p0/CqEgNkPT61EWg/MQ4FqbXwbkWS16q5d6M4Hli25tKDKybcJRVQp3+rYa0O6Tip7YQO6uAP+Kt7CiqF8o91L9XU9sG93zc19XLcRrxXV7ln7USWqGjOMW0koLjr8kc8gW4ub7z3pAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLvvsOj3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLvvsOj3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d5335cf904so5930615ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895016; x=1788499816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjyf211XtRs0nkL10Qp9VSObiEIsDLFDi9ZSA9jafOA=;
        b=FLvvsOj38MgqFBUciJ/vDSZ4XIo/6//8Nty+qFkdOR1C4WA9k+ty2xp8q5WuhY2J76
         P+s4lEWpXdAVRHearhDx3XmKkxA1cJxcPGjrGNwgAPv9gaeWiDwRvtz0SKtHRmKXfuvT
         YHgwOXBRSwSpVpCOfn5jT4vHA9qNZxpVLwyrybQaPbIXwyT+naM2rBZMLgWPL4vnKngp
         kU6f5dVA+Ra8oOrxzXW0QkvJCcdXm5tsyRx2/CtV8f6qwMfeBr/Fhv26VG7IC6LfdMkA
         JfasdCd6e1FdoLXNDI4bLFZRNbfjULbM+08tecsil8BfEq1EGUEY0saTG5KjRRPnwUqA
         RICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895016; x=1788499816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjyf211XtRs0nkL10Qp9VSObiEIsDLFDi9ZSA9jafOA=;
        b=fZd4l7IXV3FtPaMZrQw8Fnx1jiXVZpzMmh2CuWF5a8FTp+UT/5feFBvYUWUJTlooDe
         2zsqdP66fqiNj0n0v4Z/j4mg2BK1/ZqV17MX5pYrTecF5pKzW/Csj9WASbKFiZSqGOi2
         ieBn0tcmZj9h/S9pBzgQDIbtGDiMKh2njEl5HnBjcR/C1iB/Cx4C1bMP7yAF1Hsilq8r
         LED6TIljOoGCrKMhYYydfsrZfpL9EmGkn7DiCZgp4T0d9AsHdoAZuCPvsqmPHKGo9vFF
         mSBgabcN1et13Jm1EdBI2Y/7x16dnrevzqQVJfnxYyrub80YUQAvt6Myxb56KwE/BG1t
         S/eQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOa80ljJEsYOCm2AghDhpeNidAimnsElnmCXjkcCYE/p/WOE2Xl2n4rvvGu1jcFTi0n1nqL/sKdWJitwE=@vger.kernel.org
X-Gm-Message-State: AFuF++neL7Rsf+aynBrEEDE0wyZAj7rnj8We9rvI4R8xsoRZ03rxmmcU
	ySYLD1HVXS3hfw3nzouULNyoWqeG7ugJwMP+MPqEuS2pSUB91X8n1i53
X-Gm-Gg: AR+sD13+yXgjcS6bNWpYpWlLuysYJtwA+/2VRlEUxZvAvkdTMvpdRJvQ7Z8bY/tVtaL
	2tLoN6iHKmgjkWVnUMZJle6oUDJaA3mJM7piKmP71WiybVeGz+P80OuMjC0WJKXjb1Y133/45PG
	VN5aHjnux+j1lOsV8ZYN7Kp0ACiXM/o5NRfIT0YnFqCYhjFuBnwN1cWTCcr3YnPWbmkd2SDXiRq
	Gwt1avJH1B5KFK6c/b8qL77rDXnqiu+v7jhTWqtzlMmHyrsqnOo72vF5rF38LyRaE7n0jEgsIfe
	rTGxrkIz0+knwF6mplmrVgRc6WOOnMAuhGcGx9SCdXcQBEMCr8YHtS8HR3Iof7i3RPeR16eHNd8
	cpx+yBMQ/9cHGoNn//GV9nHXftLIoFWhZYsPW/rN33D3D9zdcjjZYC3F8BFse5We6T+utEYFG1u
	VEUz2zxGyQlySjHnGVpD2IyAKzOo6ZPjNYacEpY7/EAq+MJqC39KA2T8N55jPkx8kBC7ClZdTIB
	PQ2Gk6fJjzEH/H6TNVVo+AQM1+A
X-Received: by 2002:a17:902:d591:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d74df52c1cmr1686825ad.13.1787895015897;
        Thu, 27 Aug 2026 22:30:15 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988cb5dsm2170415ad.64.2026.08.27.22.30.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 22:30:15 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Cc: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Yu Zhao <yuzhao@google.com>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kairui Song <ryncsn@gmail.com>,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH v3 5/6] mm/mglru: use explicit tier range in read_ctrl_pos()
Date: Fri, 28 Aug 2026 13:29:28 +0800
Message-ID: <20260828052949.52874-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826-mglru-flags-cleanup-v3-5-d9f1c75549c8@tencent.com>
References: <20260826-mglru-flags-cleanup-v3-0-d9f1c75549c8@tencent.com> <20260826-mglru-flags-cleanup-v3-5-d9f1c75549c8@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kairui,

> Replace it with explicit (tier_min, tier_max) parameters using a
> closed [tier_min, tier_max] interval

While touching read_ctrl_pos(), would it make sense to add:

	lockdep_assert_held(&lruvec->lru_lock);

All current callers run under the lruvec lock. read_ctrl_pos() derives the
history slot from min_seq and combines avg_refaulted/avg_total and protected
with the atomic counters, while reset_ctrl_pos() rotates and clears that
state under the same lock and already has this assertion.

Adding the assertion here would document the snapshot contract and catch a
future lockless caller before it can observe fields from different history
epochs.

If I missed an existing lockless caller, or if this is intentionally a
best-effort snapshot, please ignore this suggestion.

Thanks,
Lian

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273810;
	b=dTdNm0deJrCwSsMY/4MABq9/hRYR1gXidkcc5gymaG1DWqz20fXYz/9xRgXqM+cDmOnX
	 7IHvdrKShN5lp3QhurN7ULlMrDlDHUaqLfyZ1o+edwGGZTk1p6v2kMd0yrxi9Q24CoS+Q
	 XYptG7XtWJrC5lv4AE+oELv18eJMbuUguMze1dgPpENM5RuMNlvShE7zihhdvD9kmJf7T
	 qu6APrAWx0y9o5KxO3xWRIMtxaYQaQ/4shvivSrhsDE2kdVdOXIyHpVgBcgn2mNEhtUsy
	 RQ4no0isN1QTQ1TY1XTNnP243aCka7O7U9LyoRdYaCaAwXeRUfNPtgMSqIg6l2GSRIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273810;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=05hTPr4FUsWYnaGend0CJdILpGB7dM6UzKcEst4eqP0=;
	b=ScXYWqQXQi1UbWoYsWjY5WBd6ecI8b+lhLsCLq8b2HjrVZfcAzRGnRDHuS7J0LFD0STS
	 lQAUeAXdZfYWHk5sEWH3VY4C05oPvb/eFzxPUdEieaAFjkSZNMZDzDIDJbPWgBybZnkDZ
	 FslXB+DhYT3g4Lt2CdM68tsfMNk8BN9FmcTbmq66Ime7ZlquA+TdBXMYfA/01QIHC4FVk
	 C4zHZJmEC+uIjiS7XxJV9tBJ1P/sOmu/Nr1yYOi+6Gl34m0+3T1yUnjwYmGHq8NovMxWd
	 X/zmtc9ZfFMTrYTGgdNHUMBCjB792eFZTRcN8zpF4ed9p370daLAxzGNzITqgmGJ4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcGmPkf1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039486071870
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcGmPkf1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB801F0089F;
	Tue, 10 Nov 2026 01:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794273809;
	bh=05hTPr4FUsWYnaGend0CJdILpGB7dM6UzKcEst4eqP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hcGmPkf1GZM/IdW3McVwji3+ikHi/qWLv2QatMViEmyKeor633JLQTCh52DSaSSx4
	 xMzKzbg/Ba3xKpCo8YRpYc0Tbpei3Pj3+C6hGGb4Ak7eLkWhRwILLB03JH0DOwN8Xw
	 2uTLLflkEmzL74PXpZ54hEN55jE+BTG3H2DzIL4rKiiFp13AjUV+EbONLRt+iojzrT
	 9Sd0KhISEl3qoIPb8m6T5e4wM/o0ti0zPhVv6WfApFb64wAmWUepWh+GF70nK7h5nW
	 4es71hsI0T/mi9JJSgc3ifOKxf0b+z14XlixgEmqBAVGBte4D4TKgUwm4oNoZTQNt/
	 x7xcbwFm2t3Pw==
From: SJ Park <sj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MAINTAINERS: remove myself from MEMORY MANAGEMENT - RECLAIM
Date: Mon,  9 Nov 2026 17:23:21 -0800
Message-ID: <20261110012322.106757-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-maintainers_mglru-v1-2-c25e6de60bcc@kernel.org>
References: 
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

On Mon, 09 Nov 2026 19:31:54 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> I don't really get to look at most reclaim related stuff. For things
> that are actually relevant for me, I'm sure people will CC me.
> 
> So remove myself from the MEMORY MANAGEMENT - RECLAIM section for now
> to have a bit less noise in my inbox.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]

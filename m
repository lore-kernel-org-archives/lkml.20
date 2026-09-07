Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE75A442B08
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771468; cv=none; b=P9USJYkoYogqnsHNc/kdoQZIO9DhUYAlZ6WLl9JxcX6Qek+1Ow1uK+hJu5p3Brd9DFDna+5eCrwa5on5FQNvOHgTrPBK1z56eHRInERB1dTdhblq2Hdhxnd6nrubobjbrgBm5TDyonVtk3F2TR95aG/Afg6qtBFTg+ZcoOB/gCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771468; c=relaxed/simple;
	bh=zCMgfNKf6TOQvw4cLaFphgwZncCbxFQeJvqbosjYVYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzfoGR3DlI8ggV1RoVaw8WXNpAwtnx2eVMV6fnA47dSUZBGDn9Bw6uiv5dzX3cIWPy2A9jYcNimhuhnJuIjTmyGK7LkhpjJoIZAMBhwxyKH24duuBpzrjkpT9IoisLYO0lyjmqUf6VblfK9aYUAx7xZJd9Ai8LM3uaTDwUlAnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-0f-6a9e7c7c9731
From: Rakie Kim <rakie.kim@sk.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	urezki@gmail.com,
	chenwandun@huawei.com,
	linux-mm@kvack.org,
	kernel_team@skhynix.com,
	Rakie Kim <rakie.kim@sk.com>
Subject: Re: [PATCH 2/2] mm/mempolicy: stop copying the nodemask in the interleave paths
Date: Mon,  7 Sep 2026 17:57:27 +0900
Message-ID: <20260907085730.2009-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <aprm5dwF_kWaOe44@gourry-fedora-PF4VCD3F>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsXC9ZZnkW5NzbwsgzmrtCzmrF/DZrHrRojF
	l3ermCyeb/3FaPHz7nF2i+Nb57Fb7LsIlLy8aw6bxb01/1ktvvVJW6y+yGKxek2Gxeyj99gd
	eD12zrrL7tHddpndo+XIW1aPxXteMnlsWtXJ5rHp0yR2jxMzfrN47Hxo6XHuYoVHb/M7No/P
	m+QCuKO4bFJSczLLUov07RK4MpYfvMta8JG/4sXzY8wNjE08XYycHBICJhLHt51ghLFfT33C
	3sXIwcEmoCRxbG8MiCkioCrRdsUdpIJZ4CeTxKoZeiC2sECExK/tfSwgNgtQyZ6PG5hBbF6g
	KY/u34OaqCmxbuMtsBpOATOJJT8Ws4LYQgI8Eq827GeEqBeUODnzCQvEfHmJ5q2zgeZwAfV+
	Z5Nobb3JBjFIUuLgihssExj5ZyHpmYWkZwEj0ypGocy8stzEzBwTvYzKvMwKveT83E2MwLhY
	VvsnegfjpwvBhxgFOBiVeHgvyM7IEmJNLCuuzD3EKMHBrCTC+3rq7Cwh3pTEyqrUovz4otKc
	1OJDjNIcLErivEbfylOEBNITS1KzU1MLUotgskwcnFINjIY5ny8Iv7llE1j1s9/lnKG2hMSN
	fonDHxyy2L7XnU90cn+8e2n1y3ss2mdKJBhtWhJD99dPKDrdv+LDxyPqkYcuvA35Gbf+5yzr
	aLG0t6IhH3+csyjYJ3jWTanFrF6uZbWU6nzLndMk1ac7vzpls8WPwcVKSGLDu49azv1Xlunz
	rr65h/1zlRJLcUaioRZzUXEiAA0wCWuHAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsXCNUM9RremZl6Wwb/FMhZz1q9hs9h1I8Ti
	3JTZbBZf3q1isni+9Rejxc+7x9ktjm+dx26x7yJQxeG5J1ktLu+aw2Zxb81/VotvfdIWh649
	Z7VYfZHFYvWaDIvZR++xOwh47Jx1l92ju+0yu0fLkbesHov3vGTy2LSqk81j06dJ7B4nZvxm
	8dj50NLj3MUKj97md2we3257eCx+8YHJ4/MmuQDeKC6blNSczLLUIn27BK6M5QfvshZ85K94
	8fwYcwNjE08XIyeHhICJxOupT9i7GDk42ASUJI7tjQExRQRUJdquuINUMAv8ZJJYNUMPxBYW
	iJD4tb2PBcRmASrZ83EDM4jNCzTl0f17jBATNSXWbbwFVsMpYCax5MdiVhBbSIBH4tWG/YwQ
	9YISJ2c+YYGYLy/RvHU28wRGnllIUrOQpBYwMq1iFMnMK8tNzMwx1SvOzqjMy6zQS87P3cQI
	jIBltX8m7mD8ctn9EKMAB6MSD28B/9wsIdbEsuLK3EOMEhzMSiK8r6fOzhLiTUmsrEotyo8v
	Ks1JLT7EKM3BoiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpg7Ba+/n/imXWde/3M0tT1ehjb
	Pn2Ycdnsb568xoqCS1kBDeHGBzaX+uezW/A/5xVdVDYnJFOtInP+yycHl2s7zVqjqTJVItd1
	5Z6PJWvFy6rDmr/tXcbp9LFMP0DlUHGS/LazptOaDqYuDPTvWnn6LFeWaXprR/fkIwd7Vqxi
	Odxw+r+SpOY3JZbijERDLeai4kQAyw3lVHwCAAA=
X-CFilter-Loop: Reflected

On Fri, 4 Sep 2026 11:50:47 -0400 Gregory Price <gourry@gourry.net> wrote:

> On Fri, Sep 04, 2026 at 05:01:37PM +0900, Rakie Kim wrote:
> >
> > What I had in mind is the gap between the two reads. Say the policy
> > starts with two nodes, every weight is 10, and 100 pages are
> > requested:
> >
> > 	/* the mask is {0,1} here */
> > 	do {
> > 		cpuset_mems_cookie = read_mems_allowed_begin();
> > 		nnodes = nodes_weight(pol->nodes);	/* nnodes = 2 */
> > 	} while (read_mems_allowed_retry(cpuset_mems_cookie));
> >
> > 	/* a rebind grows the mask to {0,1,2,3} at this point */
> >
> > 	/* calculate total, detect system default usage */
> > 	for_each_node_mask(node, pol->nodes)
> > 		weight_total += ...;			/* 10 * 4 = 40 */
> >
> > 	rounds = rem_pages / weight_total;		/* 100 / 40 = 2 */
> >
> > 	for (i = 0; i < nnodes; i++)			/* bounded by 2 */
> > 		...
> >
>
> Consider:
>
> 	/* nodemask: {0,1} */
>  	for_each_node_mask(node, pol->nodes) {
>  		weight_total += ...;
> 		nnodes++;
> 	}
>
>  	/* a rebind grows the mask to {2,3,4,5} */
>
>  	rounds = rem_pages / weight_total;		/* 100 / 10 = 10 */
>  	for (i = 0; i < nnodes; i++)			/* bounded by 2 */
>  		...
>
> in this scenario every value is wrong.  The weight total was calculated
> based on {0,1} and the loop will use {2,3} weights and ignore {4,5}
> entirely.
>
> It's the nature of the mechanism and race - best we can do is ensure
> safety.  Ensuring correct distributions would likely require locks or
> reworking the entire weight mechanism.
>
> I'd rather keep the change simple (cookie the value that can cause a
> div/0) and leave the math alone.
>
> ~Gregory

Fair enough. Your example makes the point. The mask can change after
the sum as well, so matching the two reads does not get us a correct
distribution either. Keeping it simple sounds right to me.

Please feel free to add the following to this patch:
Reviewed-by: Rakie Kim <rakie.kim@sk.com>

Thanks for walking through it.

Rakie Kim

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029463;
	b=nvcRISsqwxCm6w7p80up/tp+ZF8iV8SNVUVj0X2raPyRfXXdWUsyb9uax/3l8/OLJklU
	 SHAiPo71PXZGBMviROH+zMv+rw8f6pJQh1HidR/cPGVgsxzTdv0oHIyaLzlolulVrRTFB
	 fzUSwhksDoQ5vLbk8wakIurkUWMZKdUy1p8+2DqeHp37UBaqDqT4EWHLPiI/jzTc+vh/w
	 5VtFt4z4/M3Zs6XqJ2Wj1W1/KKFk2F0VEoZ1rsQOVLxR6ijXQLUydxH4S/Uupj+76bNnj
	 t9MPhktDBgfEBZdoU+g4iu0/GSvtSjvSVu9f33vvtCxdK3w7dcP83AsrLLP+tNm8plA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029463;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MsBzCvBBi1qFDcBWHy9H79d/yhN28jLEiEbY1lNFkTQ=;
	b=iS9CHT224rlNDLa4diLVLKJIxAQ0PpgX+UdZiL66pULzKIjlJqHqjd78S6N6R8/lO75J
	 JTFDzVEXEpfq33dV9XxYLDKxJ7JcUzjAQZDe/EOUnAUhS/YKsFD7JWh3vazAgAFdMt4Bc
	 pNOga9v8Hav+3alXWSQUd/vpQrsgSr63pm3N4EIY4ITLoDCu8sjOHDhRuKPxgDiGoqDyo
	 h14lr+wwcn5tZNQuXALFjbHYvczQC83SjGkbqdJjIG+prXA7VFfQwD7A144eMQ3eXtvxG
	 fB2mebxjOltgz2WtQUyNvfNW1Utsn1oz/dWRQ+rphd8mge6qK4mQm/EYh68sv6gHuSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=V7jA5GL8;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Z8TGrGcn;
	arc=none smtp.remote-ip=103.168.172.138
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35127606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35127606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=V7jA5GL8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Z8TGrGcn
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 5F2C413802B9
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 26 Oct 2026 11:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793029462; x=
	1793036662; bh=MsBzCvBBi1qFDcBWHy9H79d/yhN28jLEiEbY1lNFkTQ=; b=V
	7jA5GL8gC9YVR4ijRaAinUcl+AZfdJTziwrn0WOtfO1ft0A1UQagGKf3u8bQ5Pnv
	+aBMqH/UJzEdd0YTPBG6bD0Jc4H0uP5rCnv970Lsg+Ur1abpFK1Fh/uzWW4CYiWg
	QrSMvWEkKkqxRkH0SoPxOyHFL3i1cZgZ/+6gCvsOAJG+GfdxQxx7nxaWJEeTAHRL
	DPF93ri5kB1iD2ndgo5/UWH4xyN7p5dunh3Atjz3zZ/7jElvN6M9NoTOdInxtL1G
	L0IKYvEtwQVjJD/O88fe+aXL/U2U1dW5qA4W7PYqRbLy03xsgfTH56JLeoLFHsPU
	Gn3Lj0kZB7Twc9EOtx6UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793029462; x=1793036662; bh=MsBzCvBBi1qFDcBWHy9H79d/yhN28jLEiEb
	Y1lNFkTQ=; b=Z8TGrGcnmqMmQObZXRtGFSxzZEuOQX8GssEByugATGxet8PT6Xe
	Rj0ymMJhUfNlHxINVs9+A9FnBy+BE4FPaNYvYa1AIF/t4haBwCZVkDNb3MYTyo3L
	fpDTCSuse1JfKpQBSCzpK5GVIKObchSV/M+glfsvpOSv4KA0eVWl4o6KRZIUz2lY
	jg8vXwQIGAx0EGfS6jacFQfQ6pOHB5KRMPMyScF/+IMXCYdbLeMC0+KlrcN7BnNu
	+XDxwpMoOd62/fq4M/DNoyoxy0JUmLdkMnRUjH1z6UI+UJXL2W/uE32lkSXqZPm3
	pojz6ngWgGF6GnBbv8MrdkV6PTcsbjgq+DQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793029462; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:CqEtI/9QMqUnnqsZnHj/07l1sbjq0vd4+YNsZILQ6gTuNLz
	WRdQn7du/OKPG09kbRJrWEXo/6BAbM5f8blk29HtOU9tksZrqgZPU7U2J9Gz9c4Y
	7lriCIYa2RVdBtxoUdCNjpAznsuFCnQGg2fZpvRVgQA55bOsXO5HPmDBEdJRjB9f
	4a0KhBUwMCQojz9sDjek2wIIb1FnHhx+4MG/0r6xSwlXGX1ssQLi1n73zT2a/js9
	vRbii1BxMTxlJnVPO2rU3CwBKztWH9zoWhjPc9NIeC/JZm6RH1eyl8mSeZb+jwZZ
	ZxyXcpuy+9Z9+IR/ZvKBqUhMbepC2K8TaRBxsFQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XotbD7fpvAzzCGWJuVhuktAumN+rvaA9s3fiyUfgY6c=:XqKWWhJxA+x9auqNjWAMnDG+H0yfN8OP2NNOlTPpJU8=;
X-ME-Sender: <xms:U3XfaqfcFJS0ZSBxJN2FgyWyDG7MpcXSZ-rYZBadLQNCLAQ_LXgiqg>
    <xme:U3XfamDL34hubBKFuP9_R_0CsYhct1O6wftrt4GTHjfbdNpAUP8vDlj9Gc50LZBGZ
    GVzPkg2jhVxpKrXL9_Rn2khpzmCql6PEsYL3NMNYIjlyL_wj0uPeKs>
X-ME-Received: <xmr:U3Xfaqr1hivuVR2k_d94m95f8QiHnS6SpoigYzePW9IuXgmma9fZVDVJ3fk>
X-ME-Proxy-Cause: dmFkZTFJ8xjKxkODpSRRf7sUfgHfvt8g6PK2A2CrYeOjgirOm7AGaGD409wBNtw8s2ifQN
    6SNZlN6LHupXBZ7ClSTK+Va3BkAQr266ey67CD+ar2qxSF2IkJuTlQkn2siFRjQh4V7YzE
    RvxeuwfChl3oCpci/8krcX+3fg0RpcmlMUWMTWOL4+GOdTK9SD0e1JIbIWu3SAVX3c+cY5
    CJ4+UQY1jew0wuKOivp7/2GWJwqBUI8j0Ol5fvjPRXkVAl5K9NqBFefrOGaE85oyEYr8ls
    1J9kXundrAU2oj8ls/7OIxgbvr2IaC/qngmwAMw1u+t8SyL7jWthmDAGSMFWDIjux3Ebqp
    NVW58DNZcRuPP4M5p1NuFhTCINz/krI2McfXo/RIP1JlNyTFRDiWCkiQ87EG3wCil9LxSt
    DY2Z+HjW28ACzgXrfS/HPdvMd09KAALKTKvNtqu3L3ZnMhLDWQtOD7u36KnM5NVK8iQ/zw
    o0FwWC5xllWhu2zJdourhf03u4iFjRga12NdJ9VYm1c4ffKSMkHeNF8JKTnYPYXgGcZ91x
    RVGz29s6mkkOkHj2qjbFAV1Aev4EnO0bUyGQO0FtdxK0+Ppk+sFUmTsn6MTB+xkguOlDCA
    KAPRQQZ9+Zlaq4HeYxlSOsUT3aq01sQIGqOekcVMbDNRirLoW8QmsIkUitJA
X-ME-Proxy: <xmx:U3XfarTevoH8emebj-6ycB_YK6mvmGyfe8R601CeJwb0j6FC2VbEAA>
    <xmx:U3XfajdchqI6AUO5UIiwUvdYKt9jUgZeWb_mDiQWe7PyYqSm7ay1Jw>
    <xmx:U3XfalQCcYBMaW9CexLvdEboJGuEHWIAHeGEKYGm3FmvpM6afKbSTg>
    <xmx:U3XfapPE5WhN66cKsLgIhJhLYMfIJEIrAw_hJc8JqNqHcGJcft_ErA>
    <xmx:VnXfauoHkdDQBJTFO5-RfGEb6OoR3poF7CFMC1MEudXeqaXg8DERCDaK>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 11:44:18 -0400 (EDT)
Date: Mon, 26 Oct 2026 15:44:17 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vladimir Davydov <vdavydov.dev@gmail.com>, 
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Lukas Czerner <lczerner@redhat.com>, 
	Carlos Maiolino <cmaiolino@redhat.com>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Stevens <stevensd@chromium.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, William Kucharski <william.kucharski@oracle.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 01/16] mm/mempolicy: charge shared policy nodes
Message-ID: <at90mp4ffsuas-pR@thinkstation>
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
 <20261026-fixes_shmem-v1-1-703206d5fa0c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-fixes_shmem-v1-1-703206d5fa0c@kernel.org>

On Mon, Oct 26, 2026 at 10:40:34AM +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> Any local user can bypass memory.max with mbind() on a tmpfs file, and
> allocate unbounded kernel memory.
> 
> mbind() sets a NUMA memory policy for a range of a mapping. If the
> mapping is of a shmem and friends, the kernel also stores the policy on
> the inode, in a tree with one entry per range of the file.
> 
> Each mbind() on a single page of a mapping can add one shared policy node
> (struct sp_node) and one struct mempolicy to that tree. They outlive the
> mapping and stay around until the inode is destroyed. The tree is not
> bounded by the file size, so the file can be empty.
> 
> Memory that user space can allocate must be charged to a memory cgroup. A
> slab cache does that for all of its objects if it is created with
> SLAB_ACCOUNT. numa_policy_init() creates the slab caches for both
> structs without SLAB_ACCOUNT, so they are not charged to any cgroup.
> 
> Reproduced with mbind() on single pages of an empty tmpfs file, from a
> cgroup with memory.max=8M: the global OOM killer killed tasks owned by
> root, and the machine panicked.
> 
> Fix this by creating both caches with SLAB_ACCOUNT. This change implies
> that mbind() can now fail when running into memcg limits. Further,
> the policy_cache also serves task and VMA policies, so they are
> similarly accounted now.
> 
> Note that per-file limits are not really helpful, as the user could
> simply use many files; having limits per user is tricky as well.
> 
> Fix generated by an LLM and submitted by Chris Mason in private.
> 
> Fixes: 5d097056c9a0 ("kmemcg: account certain kmem allocations to memcg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: smaller description tweaks ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

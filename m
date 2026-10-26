Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029936;
	b=zPgr7aUFDHJzX4rHPb1Hka/gwLIpywT8VPZBcBLZOZ/D//QhyU5zcjwO3du8QRQgY8K/
	 6d2wlWI8X+VI5tGKkwO3Qk1/7kqryqdIGGhNyeVDyP8OfZcSat55cac0N+n7Hs6Jlr9vE
	 sfcUtrlwY8NG0uRhDjru64fXSLmO+CeMIRW6aOUA1sy5HfZbSVQE5d/gQ/2iTyVML0pK8
	 wa6Vc7sAoNVE4PMbbce+aBQBp2JG9ZLrgQ0FP1QNIyGuDhedCfwMu3W037go1KUAcUqwp
	 wtlwSOyhrSF38rXKDq6+14qbjTUIZuBSLNritSLNEx6CPjerM3i3m/WaHR04nI1TIiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029936;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CPgBc4xaMzIFqQc4IC3B48/bd19HMe5+87bnM/Zq9yc=;
	b=ZDCok+SEV2cSPVkxgp18Ym59PhXXSM5v0RTyOBmdooy3xSf40L4UaSnR+355VcVr2a/+
	 HLJxQrDwMavS4c/891g4llpPLqcLugAHNy0Scalu0/UvDtDwjtGuZMAW7WZ9ojdyL1Z9u
	 ZvnxbCMRAp4QeTGNBVe6HAECwVjUOhAanWRVfAo//o10yzrUCTC94v6encOb7shcnDNlX
	 xG5KzVFqjy3Rk+CpSkZFtaTecVpl0cdsojAT4q8Rgsqy4C0ue8HW4errwPP9t34599Y9x
	 GY3Amat1BFI6Gzara3H7EL5hzXlOnIC72bHV5LeFIR3nFuVxxa5zRCvp8s/TFxs09Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=o0BKoQCE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="Kz0s54/5";
	arc=none smtp.remote-ip=103.168.172.138
Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096FF606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096FF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=o0BKoQCE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Kz0s54/5
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 4BF4713801F0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:52:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 26 Oct 2026 11:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793029934; x=
	1793037134; bh=CPgBc4xaMzIFqQc4IC3B48/bd19HMe5+87bnM/Zq9yc=; b=o
	0BKoQCEo3nSrcyVCxtJP1KJxl/yw5aVebOquu+la35y5fz9jh9W0wIbsccWPZOtw
	lPv0PfFhRS36jmErd0kS3aCFrWXSr6hBe03n1budn0uiDaaykqK2f/fDwglTEM0t
	PwRTOZut60Q9SQoxlkepYalWady5fZJfrJlIjjlj/ouTkGyII3DFnbBLlyiSIgvV
	HHQgPvG5QWRfaHVffWOinWQo4RxSsggAVN06fL9rqytCyZKaVtvisskLTe6pRuZU
	qcGSazzOT/ln+dhx15bgJEhjQlIkGf0AuMAgwSAlVOy34OCMk1Wg6x87uYKnqG5c
	x7vr6szoyhJTqwIVnvqvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793029934; x=1793037134; bh=CPgBc4xaMzIFqQc4IC3B48/bd19HMe5+87b
	nM/Zq9yc=; b=Kz0s54/5iJjqL/Hh3p2OtVE9uLiC6AN79waFcNg2he6mabZvfnm
	n0XWxAimat+vJBiSn8Jmd3iLewQGdKw47wOJnPMQDOdSKl/xZ15jrFiCga3kHtfL
	M6gAB6obdV0GQEymXG0DOWwQhKGTeNNAuPSqWN78l1t4UbPSAIJWNnwkiJJQ4YTr
	tIBJTJTkj9DwvnS19J2+X0k9gt3dbElymBO/yct7zQlUPVlLMAo706mTvH2cOUwO
	jmuESzMcfXZ1yXG1biavNgJK7DU4hfnaioqEiCZ1ifmblUbrCkMy3YXTK/JkGVlH
	erWJcKTsyKCkg2+QATFWk/r4KG4nH6Soaww==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793029934; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:uYWwaAOc4McT8GfERt6VidmNCQ+ICl6X8qudvFKY46njL52
	j1/FbUYH9tNIsuZ/tgNgURs/2gBFNFZkpc5jNAGRm1eT18d7XdH/pxejIQ+ZUjsF
	kpNT9W5Y6OAw75oMKaK6VqFEQbeppF80Q586hOEEri83aofGrj3gvrfKk6u17jeT
	QzbUe5dttprkNY08L1SYZLKWKpH8RJLSDxw21hi5hLUt/JoixpqAyQn68ukbpncQ
	Qw7rCIzrWV8X2mfgfJxUGtIy86sC37xH2C+NUHo6CbYhQHmB1MwKVoZZ8qcZe8zv
	QO6yijsripFPubUPFej1Hbpt2q8ZSOnY8VbI+6g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TSptQC+uPMW58EhXC2TW+E5AzwHwIj0iAaNeMtqyI1A=:5YQRYL/pXslXA49efxXcFJfhlbdrgkaeNfpXN03LNGc=;
X-ME-Sender: <xms:K3ffahXllY81gQANBHMWb7ApPzS4XFdgRPGgmQsQBZqVrOI-rfCLvA>
    <xme:K3ffaoS4f-N2KBXy0sO2JKuIUYhwMZ9jSMURIQtPmKJaFiuHdBHnUX2StJGa_IL5L
    8A0YepPvhed_5e-_CoeEJI8vqWAoNyRTn1Ki4XBNBlLzi4HYd5E7io>
X-ME-Received: <xmr:K3ffann2o7DU9q1N8a1-EiSkbdymdeOHlv95OV7smwUBwfgkxPDQN5Osb3Y>
X-ME-Proxy-Cause: dmFkZTEkSluo7FEz7n1qY7QYOfbn0owFYeZY5oOq3jGyfhvPnNpVEknLvAeGR1+iGM3syA
    9KIyaf94wEd0nEJHg2+khnrAfvqxgujFfy94I/ENHCdc0906l3qTkFhAemCDZZtRoxQBpm
    ISOWhrDqbIIdQD/XOE0Efd3BZFKX5jwo5O5BVQet0MVPWPwjx/89wQFabKcqsb87E2zGhQ
    AhHs9zIIZ+GdDFr2ga3NpUuXWeHL9qnhJdz8bu55mbEWD3a9HPXRp+Z1vqFAzmuJVpG86o
    jDvHzSpOLflmtoY1U6+79dpdUBqHq75y5KpZ9OM97P7mgyK/gICBKBi13o7qY++ND5OLLr
    YZTLwIugW9gTdbWrpRzW1DUeaLESRpM8rozbGIb7htDEohjfWM6G0235tRBvr5Lq4T46p6
    Hy1JiSS0d+flJ3EyLB1tHFF6xqKs4XcGDrliXW8nyDab27YUhPkoMSrRX0Q28XOlGmGwKk
    qhM8mFIJrU5PxpeECU37qyJkils1hwny+zsf1IpG52mzKP1ds/hxmicboQ7qzWJxQ8S3+0
    Pv4PtDi3sLD+barIJSVFqqNfykQ7mAowqBqY6pOX02pWMz74t/xkVx+6Bx4Ok7znZcyAV+
    GJ2hnpW15TnIYQHZYc3bCOWkqiZotgTDwAtJEqKb1lbgbzxXsZhL1SoYbGuA
X-ME-Proxy: <xmx:K3ffak_F0cERTHmcQXmxXAI7UweRjo5_rxdsq5rs3fPxmQdpTENHJQ>
    <xmx:LHffavWFQzi_x4edbTi0is-2e57xE3DOZA6BYkc4e8CjvbhJ8LLUBA>
    <xmx:LHffauT4MRVbf9U50mVFfA6bl6K-ealI_VMKfGYJUT-sh9uJVp8T6w>
    <xmx:LHffav0lwvfFc7HeGCdTdI6O7GaLWe95hMP8ont6HY_mJQ1JZHKKfw>
    <xmx:LnffaozOOq9MK8xz-qfmkdgz7WlkK1yxG60yntUXhVC7MpPc-gw5b-C0>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 11:52:10 -0400 (EDT)
Date: Mon, 26 Oct 2026 15:52:09 +0000
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
Subject: Re: [PATCH 04/16] mm/shmem: honour F_SEAL_EXEC when an ACL is set
Message-ID: <at93HVbtV34eDnOM@thinkstation>
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
 <20261026-fixes_shmem-v1-4-703206d5fa0c@kernel.org>
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
In-Reply-To: <20261026-fixes_shmem-v1-4-703206d5fa0c@kernel.org>

On Mon, Oct 26, 2026 at 10:40:37AM +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> The owner of a memfd sealed with F_SEAL_EXEC can still change its
> execute bits by setting a POSIX access ACL. With CONFIG_TMPFS_POSIX_ACL,
> this lets an unprivileged owner make a non-executable memfd executable,
> bypassing vm.memfd_noexec=2.
> 
> simple_set_acl() updates i_mode directly, bypassing the seal check in
> shmem_setattr(). Add shmem_set_acl() to check the resulting mode. Share
> the F_SEAL_EXEC check with shmem_setattr() using memfd_check_seals_mode()
> in include/linux/memfd.h.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: 6fd7353829ca ("mm/memfd: add F_SEAL_EXEC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: use common helper; simplify description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

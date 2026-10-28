Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195280;
	b=azudrdoblNjxy6SKMZ2yqXh6CdWdzFDqBn80+RYXmt8n3lirmDnW4EOIrXkBTC9yDJrV
	 SzBi0f3HFIdMWr/l9OPo5b11cOsEr5+PRURcLhHFXy/0NjB5WoWlVUJhXGSCRwNcTWDe0
	 zTyxV6j/2pZc1lgqhGSWNLQYKneo1Om+s044btoVMAWdEAemr7b6yzUR4E2u450k4px6q
	 326ECO+HrS0cncrtqljD7gP8s4MWed8BMIPTe0DGehSWp81xJkZjJYqEdw3MII8/8jV4J
	 FAPVdbz6LPuBuppfbQx+zMCQxtrMljnfUtTYgCqOKefbJyin8OpGs18st0udKC+Y66Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195280;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=idoYOC3z+fcHVodb6uVVCkkEj9ml2yjsfszDNHVYELw=;
	b=M6ZTAL8E7s3514B5q8fUvsFDGsNX/ud/v5dqPgcWj1HR6OOIKiibPKSpooE8fO0xrF6H
	 9wfHQrPR3XHFBgwyKIF7pN/yx+7Oxx73woX+qM6ukQsKUHME1KjItfB+1W3UjobXrjtuo
	 HYCiLEJ1oFt488E/g4HZ7ZZlR4H8AqDA6izrILV+LX3oNtfPbHXEVsKURzs8bOW9PB/vx
	 R4itVo0cPZFzYH49/AR2n0bqCLJxQwgSAltrxPMgvVsHZpzxoy/atXC1amrXiHDGNThxw
	 inTTLX1XhnjVsJzqoVtQ7Yi3v3gIfR9RO1Vxk3IekHvFHXdYKxbhVfmzmtM6AVSGGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ApHKPPw1;
	arc=none smtp.remote-ip=91.218.175.137
Received: from mta0.migadu.com (out-137.mta0.migadu.com [91.218.175.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ApHKPPw1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=idoYOC3z+fcHVodb6uVVCkkEj9ml2yjsfszDNHVYELw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793195277; v=1; x=1793800077;
 b=ApHKPPw1H1Xc1WQqFBILX6ARyMr3+ZSovKwWSKxV9S4CAR559P0xbjqaljbiacDk0PsadFVu
 /duWA3QB5jSf/tAGDUbwE+mpbt+R74UVGU8eVLzSu49UyKzGFASuU78xjnr7NUhTslEOd0o3geW
 PVwWhr426TgexAD3F9Dx3bZI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 29e8c50da497430a;
	Wed, 28 Oct 2026 13:47:57 +0000
X-Mizu-Trace-ID: 29e8c50da497430a
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 1/3] mm/hugetlb_cma: fix incorrect hugetlb_cma_size
 assignment on malformed input
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028113319.38544-2-kaitao.cheng@linux.dev>
Date: Wed, 28 Oct 2026 21:47:32 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Frank van der Linden <fvdl@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>,
 Chris Down <chris@chrisdown.name>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3545C17-96BB-4A17-937F-3C91F8A0A1CF@linux.dev>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
 <20261028113319.38544-2-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 28, 2026, at 19:33, Kaitao Cheng <kaitao.cheng@linux.dev> =
wrote:
>=20
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> When hugetlb_cma contains a global size after node-specific entries,
> cmdline_parse_hugetlb_cma() enters the global branch and reparses the
> original parameter string. For hugetlb_cma=3D1:2G,4G, this interprets =
the
> initial node ID as a one-byte global size and clears the 2 GiB =
reservation
> recorded for node 1.
>=20
> Global and node-specific formats cannot be mixed. Return -EINVAL when =
a
> global entry follows a node-specific entry, before updating any =
settings.
> This preserves the valid prefix, so the example retains node 1's 2 GiB
> reservation and reports the malformed option.
>=20
> Fixes: 38e719ab2673 ("hugetlb: support node specified when using cma =
for gigantic hugepages")
> Closes: =
https://sashiko.dev/#/bug/linux-10f40d3e-3feb-4622-9da8-1fedecb2d0e2
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>


Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks


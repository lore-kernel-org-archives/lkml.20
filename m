Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEE84D37B6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726684; cv=none; b=ji0Vf0UduNQK8m7ktOY6H3AbFsOVmJ2lZ24cx6Zr0FSUmDany8zZuJGWStdWmhq4uZluiXK1kDIaitsC6RqIMKYYS1QMiRA7xsVnrFgp+xEmeX7O41CtkdxbUqmC+lMQawiVWbaida6O/bsDzRr1Ep5rHP4QHTpDn0OrqLKc2w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726684; c=relaxed/simple;
	bh=18ClDMS337/UyOV8Vwvx8OEa0L/tY5i0i9rO5jDrfLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7eXYfwWOnLUAGcpmu5VMI1tdkUgl+vBuvyFuWZYz9xuiZFxLQkdiSV0y8Cy3OBMdqnF4wOHXf3rGbHkaydWzIs3KLUpDMYcQeq2MEPc8mivWLtK41nW3iFLL0EehcbzLG4tgsE7a/nq+XH22jT+ONyt1JVkJUZEi2NsHal55PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVXiiKnQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVXiiKnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FA01F00893;
	Fri, 18 Sep 2026 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789726678;
	bh=ypCsA238jQaSsrumZecpZnUkEvEZS1oyy492kHC+ewk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iVXiiKnQuX8gPgjXoAgMgL7aWzEcOontGC2Ias7Jg2S2qHLJEP0ddGOSQCD8G2E76
	 P5KAZ+m32dDsuC7uziPL+ovDNjfDYhO0DjgZ2pIKyMD7Y3ILe7mPgg2QwlA2vZUuNO
	 S07EjaeLi8PAiDtVF6v/GDd4XIKuPi/ar9Ek4ZeztNzz09Sio/UFKNVoDk/OCtwgHD
	 Vhvko2aXexcEdJkJFXkoK1dfZJxEighusXao+5D53Sk4v59fK9TI0gwCyBFoBF7SPC
	 8yKHbBiRs68qj5n2zHx9iDimwaQC6Iih62wdlJ3bzVQAlFpj39+u9DNIFAgfgmoMk5
	 M3jtaXySjPdWg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id A903E1980050;
	Fri, 18 Sep 2026 06:17:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 18 Sep 2026 06:17:55 -0400
X-ME-Sender: <xms:zA-tank5xMVXkupold9m9PdHtzpFh7-ihnntztTn7Yc6fkdmmeBMIg>
    <xme:zA-tal0U0sLE2yKUnNwuiJ5GoWr0DHpOjGzqHTOlUgfkizGcSkB8ai9lne9-m07CN
    T38RI3K_bt0BfQ4KjWc6vn-IbJDTY9JuV2GFrUstvAD3bEVEKLhefGH>
X-ME-Received: <xmr:zA-tasrtKjAZMMqdmt4O8viPFWAKIZPdJoqKtY-IRSTyj6x4nYj_ajHKnRg>
X-ME-Proxy-Cause: dmFkZTFOJ04tLraS8Ld6DiNC03fk1U1TPxXokJj5HDUNGVOCuzuERevcrpAkfuxcfgiX8C
    PQsHD5glq2gHcWyZk3QJbD/+NzFO+t4/s+FrJRSqoqIIL9uunXdzdBOYKFPiOB4rpx65nu
    G+AIbYPCRMp4607LbXCbnze2tVSWmUT7XBOzlaE2m6cYsXs488RvxnRKmukIxwfeZKeKCf
    cfZdvKfeq99gzENIngK3Z1slqai4Uhq9Uf2ES5OypkYOMOQEMH+lGml5bFXXrhsoqG83bL
    Qe0BpFnxcfjw2CAHHyY1EUcwCqOmcMKwSQE3J/yxMJXzBxZaa4lJJgagI6vJq9i3GJjWEs
    BTjz1z43/a//Tbn3h4wrXht4u5Se3Ogk9iRhBuS85wqjuQWYl/KnVrAdP5i0srvaDsR6MY
    JxVI0cY3EUxQrjfFHnW2/M9heFSV4mCpgv4J1XKw9CcQ0C+7UEVJiEaoG/9rdYG/5pzB0j
    a3JRoxUTjd/0fW2Ph9TN8j7zRECA3vRubUjAj6LLlmnS0JiXrKT+12pZfnQayN6d8fgXm2
    ya/GwkoSI1iYZGGfzo3VHM39NclDpxhhUUpf7C+F3aq6Zsv5JQG20GheFhKNBrTVMm1ndb
    P/1Vmml24MxTaVNUyUx4wmdIhsnP1SveU59HnTqTxeRX3YUXkfbc15k0CCfA
X-ME-Proxy: <xmx:zA-tahTONOE_LRuJVOINMxPoiDr0FjcZPaN9FYT2Fh3FvqAODlY0qw>
    <xmx:zA-talfDq-dL0jw0-6M966q6vDtUyj_wTcUeHOxEowv9ZbqRo6VQQA>
    <xmx:zA-tajS3Vuk-zgx_kHA2Hn4uNF2A8NDOWO2mTlnUOvdbkDKfWAe4wg>
    <xmx:zA-tavCLRehoQGfgw1mpG2b6ZVl7Css4TeaI-2UONHw4IARA7xW_nw>
    <xmx:zA-talrurcJ-XoXojc9qMEEhWNNCeYrCwCJN1zLcf2SumuaISrYydCkR>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 06:17:47 -0400 (EDT)
Date: Fri, 18 Sep 2026 11:17:46 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 	Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 	Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 	Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, 	Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Xu Xin <xu.xin16@zte.com.cn>, 	Chengming Zhou <chengming.zhou@linux.dev>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Chris Li <chrisl@kernel.org>, 	Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, 	Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>,
 	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>,
 	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 	Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, 	Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, 	Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/vma: const-ify vma_assert_stabilised() and
 associated functions
Message-ID: <aq0Pn6EBVu1jugKB@thinkstation>
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
 <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>

On Thu, Sep 17, 2026 at 08:47:41PM +0100, Lorenzo Stoakes (ARM) wrote:
> The vma pointers are not modified in any of these functions so make it
> official by const-ify them.
> 
> Propagate this throughout the call stack.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

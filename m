Received: from mta1.migadu.com (out-138.mta1.migadu.com [95.215.58.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE30364044
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376370; cv=none; b=NfOlC6Gj7FU76wbu8pVaY76jMG/0SkMV1G/rWANqBO4X+Ycuy8ltf/WCluS/x5wjpnntt4V7fWjyjEfQTmAT0aO0MOfKUGDHaTgap7nU6ce/+mRdUEewF5Ki6jo3aUce06OHvuZdCXV5TvA2nA36cRqC/eayYfzudeydXb/t1n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376370; c=relaxed/simple;
	bh=u9HaVC9yb8cnMF0BGh/IsIBs0kCSUhaTfBn+ofOxLvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7pTWTVjqDCy4KJXzbZZun8fR86jBkLMeB6dC70Bc4MJEGhvUB27J2qvCtP9B1phUKOSwv1Ve37DkAxrG1IA4H4XYoUFKHE8KtG0TRB3yjY7Gmm0GLFmOCidemvfkEEecqEvD0vuNuKWu0fCsTaDnY9VyGic9uujv3770NlaYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=muvQKXnY; arc=none smtp.client-ip=95.215.58.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="muvQKXnY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u9HaVC9yb8cnMF0BGh/IsIBs0kCSUhaTfBn+ofOxLvw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790376365; v=1; x=1790981165;
 b=muvQKXnY1aR0WDClWFLBjxEyDFd9BlHQvVl7IigXG0TyehESvntz0q3sxZ9XQgXOWi72FSk9
 gijZI7Xeo5VuBOyFBHwclMwokb8piBXppQ0pFFsZN16tGHyKKX4CuhPLk+OkCUxa5opxzcaizKB
 jMs/kEnaXXlaISqXGpXh1MM4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d3ecf85df4c964fe;
	Fri, 25 Sep 2026 22:46:05 +0000
X-Mizu-Trace-ID: d3ecf85df4c964fe
X-Migadu-Flow: FLOW_OUT
Message-ID: <58411d37-dd5b-41c2-8b9e-d54939a1119d@linux.dev>
Date: Sat, 26 Sep 2026 01:46:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Zi Yan <ziy@nvidia.com>, "David Hildenbrand (Arm)" <david@kernel.org>,
 akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com,
 artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, edumazet@google.com, harry.yoo@oracle.com,
 hramamurthy@google.com, ivgorbunov@me.com, joshwash@google.com,
 kirill@shutemov.name, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com, vbabka@suse.cz,
 willy@infradead.org, yuzhao@google.com
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com>
 <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
 <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org>
 <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
 <DLO1WIACYFWF.3N01DXYFJLMD0@nvidia.com>
 <a1d5881926dbf4b16dc796fb1da939f32dd42f18@linux.dev>
 <CAHk-=widZMoVwT+to2PKPfy-y2gERYWdLsZCZvXcz0ZbXYpt9w@mail.gmail.com>
Content-Language: en-US
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
In-Reply-To: <CAHk-=widZMoVwT+to2PKPfy-y2gERYWdLsZCZvXcz0ZbXYpt9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/25/26 22:00, Linus Torvalds wrote:
 > On Fri, 25 Sept 2026 at 00:03, Ilya Gladyshev 
<ilya.gladyshev@linux.dev> wrote:
 >>
 >> Hmmm, I’m afraid that since you need CAS for a safe 1->FR transition,
 >> it will result in a CAS loop for the decrement itself (like in
 >> atomic_sub_unless). And this will introduce scalability issues just like
 >> in folio_try_get(), but this time for everyone...
 >
 > Note that we could make that CAS case be the thing that only the
 > special cases do.
 >
 > IOW, maybe only do that slow sequence in compaction_free() and the
 > memory offlining.
 >
 > So we'd have two different cases:
 >
 >   - the high-performance case is ready and willing to accept the "sees
 > zero" window and the extra 0->FR state that can race with somebody
 > else taking an optimistic ref
 >
 >   - the unusual slow cases that are *not* willing to deal with
 > optimistic ref takers do the "CAS 1 -> FR" state atomically and always
 > use compare-and-exchange for their freeing path
 >
 > That actually sounds like a good approach to me.

Cool idea, thanks!

This, however, will still require converting all page_frag_free()
callers to use the generic dispatching dtor (which is __folio_put()
for now), right?

---

Beyond that, I see two trade-offs with my patchset. Neither seems
important for the current kernel code, but I'd like to outline them
anyway.

1. We lose the "high-performance + custom deallocation" scenario

For example, in cases where the current refcount allows you to write
the following:

if (!put_page_testzero()) {
   /* We failed to steal the last refcount. However, our refcount is
    * already decremented, and therefore we can move forward -- the one
    * who stole our page will free it via the generic dispatching dtor.
    */
}

The proposed refcount impl will require either a slow decrement or a
proper (slow) deallocation when put_page_testzero() succeeds. So,
basically, the compaction_free() scenario but with a performance
requirement.

2. Page deallocation becomes unpredictable

With the current refcount impl, if you work with a page of "type X",
you can be sure that folio_put() will perform X-specific actions on
it, and you can make implicit assumptions based on that. This is no
longer true for fast decrements.

---
Ilya Gladyshev // foxido.dev

Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBA73FBB4E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820575; cv=none; b=YvYDVk4a7C2OLzBc3TpmO3WOsIyIrOZMAiXmFuzyYe4J9RNBnUlzpNT/uNmDCkke2pITCF/Cbcglb0HNZogEDIsLO1faBtcMORCDyXHJiPk6F9esRkJJapLaf9e5rtl3zRi5EDY1aLd2zt5Wn5ZqnzH1CKfRiY3UDgPEQLOMSik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820575; c=relaxed/simple;
	bh=xOo52WEwM9OcvK3XM7gppK9P45+gQdtp6SHuVaRQ8xQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ncUkLWZ5Ye5uiXUgxtaRE1leczMjFQAHIpO/Jqup2ewN7kqMQHeNu835Wj0qZpM45lmcRI/62EJ1DuHAoCFRwFkLe9nKSkuxeekPrLPCRTQgfWaIBDlPJvko/1pbC6GOAW47Ec/2KpTZk3SJKDfN/PS6jIkDc0dWiHpCfZ7duhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TLK/unnv; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TLK/unnv"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836ce6cbe1eso24394537b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787820572; x=1788425372; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1qjuH7DPdLHxaMJrgal+nSqcPVjkvrEhw9rBC64WAk=;
        b=TLK/unnvDueiRDw0p19YY9LJInr+bAz6RJn/uhc2MjNoONapzkLRyqgMoEOEX68sKj
         V1wShyCVWvpQl1vJWbA69ZAa8rzZEeFoR/GamjLhCEsDw4Wrez1Zr/vDfLZp5OUp6wnN
         oWgtEMEV9sBRzENHNAHW/VWom9M/MVqnQ2C6Ypo3HdgRfpGZBKbZSeO2a/fKMV9XykYk
         xggeaYbtnJos9DzAWoe1zE9UTwd6F+xm5xF63NFUnoxdXsPqL5RQqAyc3ewIxhZhiBh9
         UeZ/Tbl/Xr+XjEZCIY3HVRm+kVkkVGaI09NU3p4tK6MT/dJOy4ja997IpVrtw4aERwRO
         UWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820572; x=1788425372;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1qjuH7DPdLHxaMJrgal+nSqcPVjkvrEhw9rBC64WAk=;
        b=ruZTSZ5FkiPROXjGoYcntW+EgAU8FuyhrEmFbd2cg6LI+cjFS3Abi+EIIhzhQUStVD
         DIZNge86xq6ytrMED1TdmsRUUh1w/bP+91g48RYEibwXsL8AsOhQFglYXT2hMLofl5Yw
         2dwIAnORjh7MzL+ooEauaC2paDOuAxr4VOZ7g8n4Yui52IS2swUQPmmf+t3I1SyMd0aP
         /DEa8XEKw6T920+R0TA/6r9MA+U7VNviGwFxu668P7mh3+dOEaQFDTtZJCIREUbxpxFN
         5RSlyKoWqcX8dzv9FMNbKTHd+N0frvE2mySc+cAujKXpOEyrMCn8IopNKgzf1vty/oEu
         mIZA==
X-Forwarded-Encrypted: i=1; AHgh+RqXp064jsBrhbNMNRYFlIADPXE6XXAfWezgF+40RjvgMLeDrw8nQeYxFLBZ50Wd37hHE19OEhm3ASXt584=@vger.kernel.org
X-Gm-Message-State: AFuF++k/5Fm4+e/y9SjyKEmdmPRkme8lCvofE/PfKb/gMGh/DnpdXjGv
	ixja4qYlXI9EortK0IfZgrXpjep68qGzsAWO2ycIieVK/rD+CBw9wb/1kmDcRvDALQ==
X-Gm-Gg: AR+sD10VcKWyPaj/gJ2IvxJooHXCUaVD1/J6xyc3QfTldm6rDEO4sqMkUOEV+6ESSIe
	BVOLPhJo5z6+f5hgS4bUHw+gBjMKN1sa/MC9atyyEFai+vOvOZb9fjhCLvFf1AcD5TIlw0eVfnJ
	a+qoywgz822PXEbkD3miQbV8uv7Gph6KlBwee5Lu03oHpnsvpMTqhs2MqA04SjzwhCfbr/s6pqq
	HLonAHUhNmFGFnlW0CBZxLRBnlYAYuOqplD/O0Ti+ZWD0yF7Ft4VrJekbSokaMiTD7l3wJmYPq4
	REeY/+KcT5oyWcICv37ZGywpN3P6kQU3Q3A3Z+D0/MJ5awmwx0vE/wITqIyhaOAWo4SW3mO4Tuz
	s9UW7qEfH7m8ydFVPQahAynZWr38dvyTgjN1F1KUgxfVebUhv5LTSQs131Yhtx+RZn27QUPXyZq
	KEpS2AAN1a/Yxym+ryELBHlTMQVNRMthSOHzEoi7DND4JbPtdbdhSXfht6wNsbUlywHNS+jN83E
	CSs7gytknHdekm/hLt8AijfsJ4IDrp5gwxJVmZPbbwHCQzm
X-Received: by 2002:a05:690c:ec9:b0:85b:35f6:bc5d with SMTP id 00721157ae682-85b35f6bdb2mr18592327b3.13.1787820571154;
        Thu, 27 Aug 2026 01:49:31 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85b5cccdd31sm6315477b3.18.2026.08.27.01.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:49:29 -0700 (PDT)
Date: Thu, 27 Aug 2026 01:49:12 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, David Hildenbrand <david@kernel.org>, 
    JP Kobryn <jp.kobryn@linux.dev>, Jan Kara <jack@suse.cz>, 
    Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
    Kairui Song <ryncsn@gmail.com>, Kiryl Shutsemau <kas@kernel.org>, 
    Lance Yang <lance.yang@linux.dev>, Leonardo Bras <leobras.c@gmail.com>, 
    Lorenzo Stoakes <ljs@kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 20/25] s390/fbatch: no lru_add_drain_all() in
 s390_wiggle_split_folio()
In-Reply-To: <20260826155722.0198d3ce@p-imbrenda>
Message-ID: <2319f670-fe0b-f032-c0dc-486cbec0f3e1@google.com>
References: <14a16945-529b-8bc0-ab38-3ea97e54e223@google.com> <7bf68e7b-f88c-6ca9-39ab-e9fedab0c8be@google.com> <20260826155722.0198d3ce@p-imbrenda>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Aug 2026, Claudio Imbrenda wrote:
> On Mon, 24 Aug 2026 07:39:12 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> 
> > s390_wiggle_split_folio() has no good reason to lru_add_drain_all(),
> > now that the per-cpu fbatch references are gone.
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  arch/s390/kernel/uv.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
> > index dc14ebc0105b..120a467026a5 100644
> > --- a/arch/s390/kernel/uv.c
> > +++ b/arch/s390/kernel/uv.c
> > @@ -364,7 +364,6 @@ int s390_wiggle_split_folio(struct mm_struct *mm, struct folio *folio)
> >  
> >  	lockdep_assert_not_held(&mm->mmap_lock);
> >  	folio_wait_writeback(folio);
> > -	lru_add_drain_all();
> >  
> >  	if (!folio_test_large(folio))
> >  		return 0;
> 
> This is black magic for me, I am not sure I fully understand all the
> details, but what's the new purpose of lru_add_drain_all() ?
> 
> will we have a guarantee that no stray references to mapped folios will
> ever remain?
> 
> Any unexpected reference (i.e. not due to mappings, see
> expected_folio_refs()) will cause a protected guest to hang.

I most certanly don't know s390 or that code well enough to guarantee
you that no stray references to mapped folios can remain there. What I
can guarantee is that no references, of the kind which lru_add_drain_all()
used to be needed to remove, can exist there: so there will no longer
be any point in s390 (or others) calling it for that reason, to help
split_folio() to succeed.

You wonder then, what lru_add_drain_all()'s new purpose is, why it
still exists at all? I did hope to remove it completely, but found
two usages that I could not argue against: one is in user-forced page
reclaim (two memcg interfaces and a sysfs interface), where it's
still desirable to push folios on to the immediately reclaimable LRUs,
rather than leave any on the per-cpu fbatches preceding those LRUs;
the other is in memory hotremove, where it will be necessary to erase
stray addresses, through which a subsequent folio_try_get() might have
accessed a struct folio which (I imagine) might have been freed.

Yes, your split_folio() may still occasionally fail, because of
transient references and folio_try_get()s on that folio; but that's
so before and after the changes. And there is (in my mind anyway) an
open question of whether "folio_try_get() blips" will be visible a
little more than before.

Hmm, looking again at s390_wiggle_split_folio(), it seems rather
odd that it was doing an lru_add_drain_all() at all: because any
large (hence splittable) folios have themselves been immediately
flushed from the per-cpu fbatches, not left queued up there. Maybe
there was an earlier time when mm did not enforce that; and Barry
is currently looking to relax that, so the limitation intended for
pmd-sized folios is no longer forced on the smallest large folios.

If Barry's relaxation goes in before my drainage changes, then
there is value in that s390 lru_add_drain_all() in the interim.

Hugh

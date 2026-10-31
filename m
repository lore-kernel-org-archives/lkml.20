Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464975;
	b=oK9kIuO4981mtHo/mh9UUi7nkivjhPuBp5WRsGdd6I46+GkhhY3tk1iqT9SLjom5IVoO
	 fG/l3CJ4lMdNhyTtG4bnBhFoSFVFI/XGmevIknQR06pSJ1O/eixuw9wqcWW0b6pL5xxKi
	 +bQy1C/3YxnAkxsEQmaWmbw1D/se5/IivJ6bwe1+0tbJrRmoLgAQJ28LO0JQFSG1iy/DG
	 TvUTnTMbfRsMtIAr56qlPkJPGiPvwU0tLf5LW6QIEaCc48MtnOdR7huDm+/kdh2NXmVST
	 IqYxDjncEyh4Ljnub095yTv1WinLXFyl40AvxiyQwGJR3yuSFnup1VCD0PvhxiBUNTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464975;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J41Y1S2rh3yGXRCAhNBommWpMFq+IhDlxy5NAe+nz38=;
	b=45QzEYvzWE+svrWIRKiXPcuiesS3+JdGeOQZgify49fD80V4gIzxd6rD5QL+ioS7ZHaK
	 v7zmZtRp2yc8yL+EthuRoxORhSITJTPXpHL42J7UF5evDOK0ca6enBQxfCs/j08aY6UxV
	 KWAyru4/oaK5Y2Ehblp0d4PYjC2IiY5rtttG0t6Y/5gv/YMv5Td1tXUrzAwiJ1fB9tgfZ
	 IkgCFRY/PuIp0wvbPmIt7a97p3tUVjoqIbZAaYLASL0L2yz3EpHIuQNkDA43r7vfGiStN
	 8cVacpEaQJcgyLWOabntSAM49DxPPNizEfQ+IAPlDcPtWvxgorVg9EnMoC/4ymhSdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=maf51kOi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD55606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=maf51kOi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6831F000C1;
	Sat, 31 Oct 2026 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793464974;
	bh=J41Y1S2rh3yGXRCAhNBommWpMFq+IhDlxy5NAe+nz38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=maf51kOi2GfeExT2mteFp7wbRm1Pbs4NPJ8LE3EJWN7TJAxJ+lFNA8GrTaJtq2Ssf
	 BOvgg2MqoNiY2Lxsx0H23hLjEqLlDS6PB328E6JD3yfPOJYCuZISy3EUG6x1BN4b11
	 alPh9jtkf+21MD4RjaM/0HgJ4mZ1YCQxzeKaFHCo=
Date: Sat, 31 Oct 2026 09:42:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Qi Xi <xiqi5703@163.com>, linux-mm@kvack.org, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
 <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair
 Popple <apopple@nvidia.com>, Qiliang Yuan <odys.yuan@gmail.com>,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
 sunnanyong@huawei.com, xiqi2@huawei.com
Subject: Re: [PATCH] mm/migrate: fix softlockup in do_pages_stat() with huge
 page arrays
Message-Id: <20261031094253.d28f484e7e27de469cfa76d2@linux-foundation.org>
In-Reply-To: <76579248-64db-47bf-b8d0-4eb3ca556f5a@kernel.org>
References: <20261031033330.3416326-1-xiqi5703@163.com>
	<76579248-64db-47bf-b8d0-4eb3ca556f5a@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 31 Oct 2026 11:52:30 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 10/31/26 04:33, Qi Xi wrote:
> > From: Qi Xi <xiqi2@huawei.com>
> > 
> > do_pages_stat() walks the user page array in 16-page chunks but never
> > reschedules, so a huge nr_pages can hold a CPU past the watchdog
> > threshold on non-preemptible kernels. Add cond_resched() to the loop so
> > long move_pages() node-query calls yield periodically.
> > 
> > With KASAN and function tracing enabled, a move_pages() node query
> > (nodes == NULL) over 10 million page entries (~40GB) can trigger the
> > softlockup on a PREEMPT_NONE kernel.
> > 
> > Fixes: 80bba1290ab5 ("mm: no get_user/put_user while holding mmap_sem in do_pages_stat?")
> > Signed-off-by: Qi Xi <xiqi2@huawei.com>
> > ---
> >  mm/migrate.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 7bdcdb57652f..6c2371020cc5 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -2545,6 +2545,7 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
> >  
> >  		chunk_offset += chunk_nr;
> >  		nr_pages -= chunk_nr;
> > +		cond_resched();
> >  	}
> >  	return nr_pages ? -EFAULT : 0;
> >  }
> 
> I though we wanted to stop throwing in cond_resched() at this point?

It's almost unneeded in current mainline kernels.  PREEMPT_NONE can
still be selected by

	All supported Alpha configurations

	All supported Hexagon configurations

	Non-ColdFire configurations (classic m68k)

However 99% of the world are on 5.x and 6.x kernels and many of those
machines use PREEMPT_NONE.


IOW, cond_resched() is not really needed in mainline, needed in
-stable.


I think simply merging the thing with cc:stable is the simplest and
most reliable way of getting those older kernels fixed up.  mm/ already
has >200 cond_resched/need_resched so a few more won't matter.

Presumably the day will come when we remove all those scheduling
points, after which people will have to work directly with the -stable
maintainers to get these things fixed up.

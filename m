Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646608;
	b=mUgQ75LWhi16n5yxze/xC0JE+tbRq5jOlSw4O61Q78phm2wvnxSknDEyZNrxEpG8Ptvi
	 NzBZuT5dmBfbkwDtwJ28BekeFANLhxpjy4Ht6lixr5SWTq9ukMe8obVYmIBntUVZN3FyY
	 0fmFqRizc2RI67oc35IjjaMoBkbF/WMkbqKOAjpBWQeyyTixYYzyJfnBJ7OIn9wRBVFiF
	 X37LOQWd8rnY/UmjsvPfLI/3OdZf/9/ghIiYZl3o3lHRr7215XPFfhORTLhD6+BaALlG6
	 rjSYrH0sKcU74c0+PvWWjSMmCa7fqkvt6ySQVNz+XNcdP5gNxoRlVK5oYmKI8LfawvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=0OsLVE28qnFLFA/pfT2TsRBwEfIb/3blusAAAo9RVPc=;
	b=a0khvoiTDsmpd3COzhgEYnQdEGvI+KFnjt2WVBfenQPiwjSVNOzYYGT9d/SqN4CuFwmO
	 E8tQKMnp5UX4qgQn/QFOrqttS4oOO6fO0TItQEYZCyroSj5kya9+cBjy5AJag/Mjs3v4E
	 LNEbgVWBqn9NjIe1yVy1fObIxu07I/Lk8Zu3TyJA7eGrvAPgCpIGwUdBAEiPz2WWpCu4u
	 gLlzJ86aaRqWEvM8VomKI3M0kdoxo9oUH2BjqRh3eoLGY5y63Pziijxn0T7Teq5Lahwst
	 1IxrpQtiC3caWz/yHn24RNwU1k5DpGFdhvGjSdzSxi7pMGgLOZJnLZ3xj3D0D3484Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=csDbeDbP;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261DE606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=csDbeDbP
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67921b515a7so2805797d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793646606; x=1794251406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OsLVE28qnFLFA/pfT2TsRBwEfIb/3blusAAAo9RVPc=;
        b=csDbeDbPv1LLT2ZhF47ifCqaLT0Awyz68W14LeaHyxAObezZzzcUZ1kPzxX/CmrN3k
         Cvta2B1GPgldTQWMHlYPQMeniy9mWPTNaPPg9vYcQDugmgRtZvKFpFgMjMF5xZKsHTdI
         AofmqXqLC45TNLIEIOV9Hk3j7O8pQA8+GOqO8DLVsH1mz3oHwbvhdDOJ5uGCxj23Ohi9
         MjkEhIh32xA+pMzOtDKxVMnu/rfoQS7iRZPPnWYj35QTul3wsmQsEI9tBHfyDM1k9Ek+
         l9OcV9Ymc45mQ39CyH2gDx80cAxMzhsZ5hHdHHu9YHq8xU5PWas7lQy0vWC3HoIabAxQ
         sP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646606; x=1794251406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0OsLVE28qnFLFA/pfT2TsRBwEfIb/3blusAAAo9RVPc=;
        b=Hg8ncjmpmZxC77Ys7HQ0eeMoD/46JrQejbaugyAqcBEnjaZb0x9OKI/s2H4JT5axdp
         ca74iXJQWnFthzq3Givz9mHe6JZ8tCWqLSNVuIloDss8/smswu96pfN6l8Gipgb5Uc9s
         bfl+yKvu9du+G33AGpYtQNh3EZuLhcE1sLOgWHI8agcab4EyF52LDA1m8U+NQXxrXiNE
         V13BvPgZDbcn7g7ZLzGKSB0GJ1N36diBEDCRTdwMnPeQU3Li4ubtTwmA4p07STcMya2q
         4AIboal9DXVy0EOpJ5Fc4h2IpG1CA0II9XnyBJYnof8dbxFdU2uf/LYnv6zFGueSEsR6
         A3lw==
X-Forwarded-Encrypted: i=1; AKwUvBze4gONkCqOl1Wp1owfvFagkucd4SLf3iCfT00nCwZqwa2RxtdbU3LKVOWLUFhGN0UCm8/3rziyUCJ2XaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z85uryLvhKLturKsG3jwyTbWk27ZOHd9gWjvKtHAC5j7iKM6PCx
	vr0/6JEHTi8Son6xI2MVaUjeF8y5ZdzDgNq5TTvYgZptkyyELzUT78hZq/0wFljKw58=
X-Gm-Gg: AYBFou0Ve5ugW5hJ2cmPyVKJVBDxOwFE33ZETt5FJUyEKBmSLlczaqUXrsDijRfCjI1
	yLbGknh5i3ehbLSWike87x3lqCvanM99Hin9YUeKhmRq+9mKczWObrXJG5xdfEKw3SfipaEUAaF
	m+OyqNUcXZvNH97gRr+8zfHCS0PPycmch71sqPlTm/jO5H8KYeyleqvDLd7g1SfnglWhRchGx90
	78nsmAask1XdmQZWcJKy9laX/E32uuh0Mg2BMtUlBXOX8poX8spnNVUB/+eD4EMFePIMlEy5L6y
	KzjNL7qakFr4thaqGyjm05AJ/Vc06f7Sd0g8u2+DmCySAVA/2MuSobhqYWT9GuAdWNkTTCLGiZU
	aa9v8i03G/cM0XcOJZhtZDxKjfPCAzp0wfAb08a2YPGbNu+ayPjQP55iulWIJ4anaPo50uTbtis
	uz593jhlaYW3A9fcAizfpTqTlA/H1ICNkPrrYOQnwaCkWqaXGEhovUqiQqAAUDJYHQn5VKIo19F
	RWGNoL0+kD7maDNe+L2cVZC8+MAZ2tOA8LbTJVXTL8oGs0A+dhcVFmVFTDdE1B6KyG123Yspnvc
	26VTkydBl035DYIR7Vq+TUUeajxqREcQgpkh+EbpySemBQbN
X-Received: by 2002:a05:690e:e88:b0:674:7fa:6a3b with SMTP id 956f58d0204a3-67ba4c82d0dmr7698101d50.5.1793646605944;
        Mon, 02 Nov 2026 11:10:05 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf27263csm5641093d50.4.2026.11.02.11.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:10:04 -0800 (PST)
Date: Mon, 2 Nov 2026 14:10:03 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>,
	Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH 2/3] mm/swap: account synchronous swap reads as memory
 stall
Message-ID: <aujgC6qPrTqewPPP@cmpxchg.org>
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
 <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com>
 <auOz00OGB_8dgniC@cmpxchg.org>
 <CAMgjq7BYgXLheXDyc=p2mNgxdP3+92v2WHGiXiweDrsiYQ0u2g@mail.gmail.com>
 <auSWtJzFQ7KdElKL@cmpxchg.org>
 <CAMgjq7AJ0uajpVM+Kva5=_EXtmaawYR8TJQ6RdhrP7+NUZDx=w@mail.gmail.com>
 <aujA7X0IPvtRTmFG@cmpxchg.org>
 <CAMgjq7DZYKXGw1McsDT345HS4BNqa46xte_dTJia6EMv2Dy6jg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7DZYKXGw1McsDT345HS4BNqa46xte_dTJia6EMv2Dy6jg@mail.gmail.com>

On Tue, Nov 03, 2026 at 01:26:35AM +0800, Kairui Song wrote:
> On Tue, Nov 3, 2026 at 12:57 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Sat, Oct 31, 2026 at 04:00:22AM +0800, Kairui Song wrote:
> > > On Fri, Oct 30, 2026 at 9:08 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > >
> > > > Hm, I think the only option to avoid this would be to split the batch
> > > > and flush more frequently, which I'm not sure is worth it. The batch
> > > > size is only 32 folios...
> > > >
> > > > diff --git a/mm/page_io.c b/mm/page_io.c
> > > > index 22e5ac1d298f..806cfe633a95 100644
> > > > --- a/mm/page_io.c
> > > > +++ b/mm/page_io.c
> > > > @@ -207,6 +207,8 @@ static bool swap_can_merge(struct swap_io_ctx *ctx, struct folio *folio,
> > > >
> > > >         if (ctx->sis != sis)
> > > >                 return false;
> > > > +       if (rw == READ && ctx->workingset != folio_test_workingset(folio))
> > > > +               return false;
> > > >         return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw);
> > > >  }
> > >
> > > We are in a dilemma with this change: if it fires frequently it breaks
> > > batching but improves PSI accuracy.  If it doesn't fire frequently, it
> > > has no negative effect on batching and performance, and it isn't helping
> > > with PSI accuracy either :/
> > >
> > > But after a second thought, maybe we can live with it by having both this
> > > posted patch merged as it is and appending your suggested fix: the two
> > > kinds of devices end up differently.
> > >
> > > For sync devices the batch is now always one folio, so there is nothing
> > > fancy, everything is accurate.  Readahead batching for them only happens
> > > on the MADV and swapoff walks, so the cost is limited.
> > >
> > > For async, the window covers submission.  That cost grows only mildly
> > > with the folios in the bio, block layer and dispatch work, unlike a
> > > synchronous read.  And the previous per folio accounting was not
> > > exact either: in a single threaded task, the throttle or cost of
> > > a non-workingset readahead folio pays is also holding up the workingset
> > > folio's refault, since the task cannot start the next submission until
> > > that one returns.  Same story for delayacct.
> >
> > That sounds reasonable to me. Zero benefit to batching on these
> > devices, so no point in taking the fuzz factor that comes with it.
> >
> > > And we are missing the completion wait either way: if a fault finds the
> > > folio in the swap cache with its read still in flight, it blocks in
> > > folio_lock_or_retry() in do_swap_page(), which no window covers.
> >
> > It's there, if you drill down to folio_wait_bit_common():
> >
> >         if (bit_nr == PG_locked &&
> >             !folio_test_uptodate(folio) && folio_test_workingset(folio)) {
> >                 delayacct_thrashing_start(&in_thrashing);
> >                 psi_memstall_enter(&pflags);
> >                 thrashing = true;
> >         }
> 
> Thanks for the info! Good to know.
> 
> > > So perhaps we can live with it for now by having your suggested fix
> > > on top of this posted patch? Some comments could be helpful here and
> > > maybe some further improvement is needed.
> >
> > Yes, I think that plan works.
> >
> > Want me to send a proper patch with changelog on top of Josef's?
> 
> I've tested the following code on top of V1, and it worked well; it
> seems there is no need to move some functions or am I missing anything?

I did that to keep the write side in the same sequence, and remove the
then fully redundant submission in swap_add_folio(). Seems a bit
easier on readers that way.

> How about I keep your authorship and just send V2 including this ? :)
> Any other suggestions are welcomed!

Works for me, thanks!

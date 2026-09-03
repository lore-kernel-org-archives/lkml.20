Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E982340A57
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420430; cv=none; b=eYC7pD4k/8Xpb5AmALneJu3zPXKvMJU6/zQbUSXneOGS9QOe3ixusI9fh6gWPdmuiXM1zf0qrs02jwJWg9uojAeChgqWivD0CbnGyj6RefHMUA+BstYgw0zmxHpNFA0lMRWKaD1NFfPxnMSD9WvwVUlXantVaq3ezBE5TJu4lI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420430; c=relaxed/simple;
	bh=wld4Tm6tiu1CmgqNMJydEtK1Ph0iA/iefmXGnb4A4PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zljv0xSA6vw8uHWvtYQDwzFdX3tZxgrTGG1zkyQPTAjZlyiVURUqIPUxGhTXxkUyrVfhIM9KU3oaAfaRoknIKB4JBcRI8ESLoriCEQp5an3UO/oefL541vmvxRCNPWdoOa8nwN7DbpHao0iwLMAp2hbbtwziSMzWRPFnoolXfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SvMJGHuL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SvMJGHuL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so20255285e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788420426; x=1789025226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OvwfsT5XsU+XlCBye/Gynm+OK1RDDicBO8P4RwFQ9O4=;
        b=SvMJGHuLo2L2pJvx9PSlX2RHKD3iEX2CTn7t22fzaWpzQLa5nGBZ12aR9YsEncSs8W
         I1KmDJrfCj98fwKi/Do0+1pf0gjbohydHA81zCLZcAXUxKUun5xQIcOfHzbqoBb9MjTQ
         N9DSrqfVpN/q1t++KtVoYrdoeWAqYqtxiIMuGssT/rHy8AlZJHuRyZeFcwouH70qC3ND
         oFhUtr/2iL2Oq0dpTqPn+KczztNB+gjkYzYULQ/2H/DBA+Y4/VcIciJ+LIwEyqwaJJ9P
         8oq22VWj559xECNePq8MYkiLPQBG7TiotVlpmLNP2big2Q/UN8FLuqvkHbgoXD4A4CzE
         qHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420426; x=1789025226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvwfsT5XsU+XlCBye/Gynm+OK1RDDicBO8P4RwFQ9O4=;
        b=TMcU6MH4utyC3KPJCNxviE26oQm+Er92a4q5pKDV8TsJzXE/3t1yzj5jlI+Kvs6Tfo
         741FiZUtmrifMIQ4hBDnnRTWmlBSYo/YOodpEqmc5nJ0biiDCVzPNWS7T9iakYBl0NN5
         lHxK9sXdmwT0p7C2/2pW04q2tZKK41foyj8df2k7KPAbql+BS3MiMCXoxmcyaPntTQfN
         VF58XuODos3aalavQnbGVy0JonNEvp1yxvqqCp6o56aQPQJxUjbFPyAtYBxOuIS7lofF
         lZJBJzSoS+TM8U6I3lqR/VkiUeNm9I2Lh0XyqJeS7P06odBMr8BGGI+/3nyCSH8M8FK0
         TKKw==
X-Forwarded-Encrypted: i=1; AKwUvBzArlbWwC4+4EMtGznXzjeiLzGLPnpB3KmjwjImyc8DgQouoZsmXnBrY+jCYtDCZvXSB0KoJAZ1uJSmlL0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Md4EcvyK++je3hMCdu0L7Ab/X1kuSXzoglqrAx5czYmARSk3
	abzK0GypnF73pJ+zNU8Off5f52AHU2Z9QLDnhilFYfRsqrRPKsxXNgdp0oSQcCkF81s=
X-Gm-Gg: AYBFou3jH8KuCIajttvjNTLj/XEiFjZiKjk3Tvb2GwfOT4yvrqz5Jdpz5v5IuSDXJIA
	B6khgFQVNUiCjlsEGc7Xe7mj0U1KxNS55uOD1dwPQrw+s1tk9MEvPNmhrxog9UfH5wCJnau0AlQ
	WZAc02VlBm4QCREjC7geKA36RRvpC4OyCUjnE3tyZLLhZ5Hf5T3lLm3COn6uZA0YPeXoEM30e8o
	qT6273V6miaImiIvNo0zooyGxc8jHStP9DNFUu89s0Ia8fwWgZ0xqIchbpo7i07jOv7nRepGgaz
	XLnS7ngdBMX15yMVkrDVQ1tvdz96cl6Z5LHkx8/H/0utyXZCWLacl9Dl3+Se1bBupgJhXqYkZ4A
	maJXutMhecm0EZh/XZ9H8Uo/F21EEqWye7psSs2zvSpNHvyEAxAoA15k1sFrZn2sd8WId6IJri+
	eNPncxTQonH4xZPF9mrl3Lvjajq7R6JHzFTZwzSJaqLO8AbgsONBF4G5gYUnfd+3jcHDBXgHu3d
	3hIHbhPNNt9OA==
X-Received: by 2002:a05:600c:46cc:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49ce5812d7cmr176613335e9.4.1788420426281;
        Thu, 03 Sep 2026 00:27:06 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm53367115e9.13.2026.09.03.00.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:27:05 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:27:04 +0200
From: Michal Hocko <mhocko@suse.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Charan Teja Kalla <quic_charante@quicinc.com>,
	akpm@linux-foundation.org, mgorman@techsingularity.net,
	david@redhat.com, vbabka@suse.cz, hannes@cmpxchg.org,
	quic_pkondeti@quicinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] mm: page_alloc: drain pcp lists before oom kill
Message-ID: <apkhSHr3by5Bf8jW@tiehlicka>
References: <cover.1699104759.git.quic_charante@quicinc.com>
 <a8e16f7eb295e1843f8edaa1ae1c68325c54c896.1699104759.git.quic_charante@quicinc.com>
 <aphSYFTd12oia8K2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphSYFTd12oia8K2@google.com>

On Wed 02-09-26 16:49:48, Yosry Ahmed wrote:
> On Sun, Nov 05, 2023 at 06:20:50PM +0530, Charan Teja Kalla wrote:
> > pcp lists are drained from __alloc_pages_direct_reclaim(), only if some
> > progress is made in the attempt.
> > 
> > struct page *__alloc_pages_direct_reclaim() {
> >     .....
> >    *did_some_progress = __perform_reclaim(gfp_mask, order, ac);
> >    if (unlikely(!(*did_some_progress)))
> >       goto out;
> > retry:
> >     page = get_page_from_freelist();
> >     if (!page && !drained) {
> >         drain_all_pages(NULL);
> >         drained = true;
> >         goto retry;
> >     }
> > out:
> > }
> > 
> > After the above, allocation attempt can fallback to
> > should_reclaim_retry() to decide reclaim retries. If it too return
> > false, allocation request will simply fallback to oom kill path without
> > even attempting the draining of the pcp pages that might help the
> > allocation attempt to succeed.
> > 
> > VM system running with ~50MB of memory shown the below stats during OOM
> > kill:
> > Normal free:760kB boost:0kB min:768kB low:960kB high:1152kB
> > reserved_highatomic:0KB managed:49152kB free_pcp:460kB
> > 
> > Though in such system state OOM kill is imminent, but the current kill
> > could have been delayed if the pcp is drained as pcp + free is even
> > above the high watermark.
> > 
> > Fix this missing drain of pcp list in should_reclaim_retry() along with
> > unreserving the high atomic page blocks, like it is done in
> > __alloc_pages_direct_reclaim().
> > 
> > Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> 
> [Sorry for thread necromancy]
> 
> Hi Charan,
> 
> Are you planning to respin this patch?
> 
> I know that Michal was questioning the need for it. While doing some
> stress testing I came across a couple of OOM kills that had significant
> amount of memory in pcplists. Something that would have been prevented
> by this patch.

Could you share some numbers to see the scale of the problem?
-- 
Michal Hocko
SUSE Labs

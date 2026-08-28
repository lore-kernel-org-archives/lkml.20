Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19F538C42F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787954569; cv=none; b=hPpdrwXGSS52CaycFqgeFFc0McGJGx8fha0ivLSbiDLwtEcb0qoy1MbRFkka6yXDG5f4QIa3pOYgexomiUFJlenXdg/x+2AmroYmAOi4a68XVt6+XsU6R1qtZfdw92JrC7w2GJNm0o9SRnePpg28UFl0ai/jlA6RTRRiZwdNi+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787954569; c=relaxed/simple;
	bh=C0Lc/ScTW7fF2d+eNiSG940ybJdGv1UZt4Xd8+iuGxI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PhOyxEuSI13AXeVjIc+ydmRaz9dapZtBVLxs+HNtKc+H0IZyeu8xsHrerdEq/HyQ0mcjsH+vz0USfUEPoSORPAWdOcfJIlSGwcTeOVvBIL/unirArFemtKmP6yuSL+w2MhxdxWmqMl/H9l2YKjsMdV86XsQ9UJtifeF6IBIe+38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sBC4WQoY; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sBC4WQoY"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-85aeb506b78so22823037b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787954567; x=1788559367; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA8fy7HWE3V3WB6sMl8dDfF3ITuMIwqNn0Xomqm4doc=;
        b=sBC4WQoYs8GQSIqimBn8xzQ315Fj59wL2qQoiJrY4J0oixs3aZurBXDzqF5rEbHomu
         /U95D8YuGC2LCu8vX5bpSEVtk74AkfzfUodToAB01mxvf2aINgs98KINPjXUlv9C5zBP
         mgn1IqdMgSmeThjr9DN8n0tIBYZAHp58WpR14Ada7H5rPe7Mvs5tIhTyP41achStTj7Q
         RMc9+mL2P/JnPqgeSROTpULhMSMjy1shj7gCB4XNYSnN+HmyozK3WJHbmbJMODYM2ZRS
         HYLD4K1gYxrcLGG4zNOMGx8XQzTyPPSm1TJyDATXw8BnhU0hdlgfLMfHt7cnFr6jCF8Z
         4IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787954567; x=1788559367;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA8fy7HWE3V3WB6sMl8dDfF3ITuMIwqNn0Xomqm4doc=;
        b=MKCB92r7Tfvm5MJnEns7W+AGlfkVtWT9pLRtnNgWHJ4vE9rYtRr7BdsZfV+P2M3XF6
         9nEG8U1ewIkAu3q9xgnHkYHMsZW5rWUeqDbR91VXc4eHsRestAQhh3TvkaId1ERuNlsD
         ILDxSU6gMhrdYIy0WopnbBX7QZHtq+RZcsavM6Jfb+dS6BSwQAAab7JUZCOZF/RTYJ/3
         /P9SbpvQeblSgy/y1bpFIqmCpyYCpnpU2AYK3nOgh/cB8tLg198ubgFP9lLDQLuMUTus
         KTiGVfZsK9mUR2/CTafZSgueS51abTitRKZM23oJWzz3NEzVeORlgkLFX11k0GTIIeZH
         TuvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZmivdj9Gh7KJ01IIUw193+NqnA6G85+eQftHIjh1344ThW3gUcJDc9BE2WszaZWhBRO8KIAtXm48WxNg=@vger.kernel.org
X-Gm-Message-State: AFuF++k86tcGSYuYH30i9Kt6+5NfSzTydehvS87+TzwZoFsvn6lnInMK
	Xjvg0B5JfldC+e+aM/R/7Ic5NUaxfs6cjpzq2jONSqbH0TLoT5iB6NH/xhQ4fpYORA==
X-Gm-Gg: AYBFou02cECfCGY/hpC+JOi4VUajy4OlwJ8CnOIrQmdX9rbBP+tqEniTxxmuA0SRSjm
	ZjNtFMyZhCDMrV3m3RvbbW2+OM9IJhUinStwMOnhNfEKerw/qOJthPBjlXUe3+rb4veU+gM060R
	KWSJIYDK3ZaL3P7VfU6+KseHpdPbVUV2Ry4FswF4j1/nQd5ZeKZ0TRqWBtZmxCDt1cM8hJi24Ky
	HrtY+wuzD52UV2+kVZB/+49MXsH5HVPdcP7bnMYh9koD6ddEe2Z9ybCsjrWvaDhtW28xnGBeuY5
	JWmXNlYTTJCKn3hX0NWCtqacMGjJYbrvxaoe82UKUp/COqoQqNDH+vWKWrLTR+pwTqw4wS42kmX
	hMKOtKSg4A6pYAmiwuiGfv8fd+pB/2ZXjPiHldZiS2Twy8BFI0CeXpGqaXpVYCAqkpr/ab8ZnaH
	TwDnvFqDncJeECX0mCqbtYXtCl93CxDOOVffoxk4uRVAjlVmt8iEwt36lE7j65/SSmiR0C5td3K
	5Njr5Su/GAa/b0aMLuxwlGInt8Oh7ceIHJ/rwQSN5bxXPj3
X-Received: by 2002:a05:690c:692:b0:84c:6169:49f4 with SMTP id 00721157ae682-85d6a3d835emr43441127b3.19.1787954565878;
        Fri, 28 Aug 2026 15:02:45 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abaf31sm12814067b3.35.2026.08.28.15.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 15:02:45 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:02:01 -0700 (PDT)
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
In-Reply-To: <20260828170217.324c3445@p-imbrenda>
Message-ID: <ef4081a0-908d-bdad-4e6a-91c4c8b20130@google.com>
References: <14a16945-529b-8bc0-ab38-3ea97e54e223@google.com> <7bf68e7b-f88c-6ca9-39ab-e9fedab0c8be@google.com> <20260826155722.0198d3ce@p-imbrenda> <2319f670-fe0b-f032-c0dc-486cbec0f3e1@google.com> <20260827145502.2fb4505b@p-imbrenda>
 <cdbaa4ff-d2b3-34bf-dd41-01fdc65edebe@google.com> <20260828170217.324c3445@p-imbrenda>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Aug 2026, Claudio Imbrenda wrote:
...
> 
> so if I understand correctly, with this series the LRU caches
> will never hold extra references (as in refcount) on pages anymore,
> therefore calling lru_add_drain_all() will never decrease the refcount
> on any of the pages that are in any of the LRU caches

You understand correctly.

Though just before hitting send, I remembered one further detail.

lru_add_drain_all() also invalidates the buffer_head cache on each CPU:
entirely unrelated to mm's fbatches and LRUs, if I understand correctly
it's a genuine LRU cache of blockdev buffer_heads very useful to some
filessystems (e.g. for quick superblock access), which prevent the pages
(folios?) they are attached to from being freed while attached.

My understanding is very poor. but from glancing at the folio-oriented
kvm_s390_pv_make_secure(), I'll guess that you have no need for that
aspect of lru_add_drain_all(). But if you think that you do, then
we can replace your lru_add_drain_all() by an invalidate_bh_lrus()
(like 22/25 does to drop_caches).

> 
> in that case the lru drain can indeed go

Thanks for confirming - but please reconfirm in the light of those
buffer_heads.

Hugh

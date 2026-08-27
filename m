Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A17391E5F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822220; cv=none; b=FgLpUTKYE62L6eQvULe1eP3ovVGTltqrz5hBN7H6wRDL3NL8Ije3fF5uJyzoi5d5BpCMvfN9EkyNGMxrsj+y9DJv+oOWOiNn/I+lqNPKmvDjAegRzBoJnwvzlyRodl8Ei/ARM3Xanr5Y3W5+yt5bEQiL6b0pvl280kios5Ejda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822220; c=relaxed/simple;
	bh=5VfrgZkKynHJykbnugTUAuRm/lIC9QY5cTmsrhtNC2k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aA21BtKAZVsETt7Kl2HBJxC2A+8sHUzTiDhmmjxeze/hvzka4PoFvrEMqk26PJhv9Ymj8fuC8P6QS0tw88S6VY0ZMVuTcndo+Lhu/yAr2q7YP9+yh1HJDLq7SovP0p/7vAFwGmh/CFXDEvZek2B+1W+/xxOiDpxEEi4ReMhsrYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSk8urBN; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSk8urBN"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c4e9769bdso2657569d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787822200; x=1788427000; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wURAAqpmYnRm70wHLRDHhfOf5KYKWGXPLGAT3tMJ/w=;
        b=fSk8urBNEAkuiCBeBo8SyIw8Z9Njl+3rvjRUdLpXZytpltL9YV+ApmncSKJhsSTULG
         awxP4kNb1tC0v/GgHEJ8NHFcrKguTgEpwcSQIDOVDuObeIeYKLKUi8XJIwexy8hpI2gK
         Kat4E4FaIkNe/iXENpa31GKKX7YlYUcZETZ6ee4B6yKAUxtYXsewyisIQt+g19oRS8JE
         TZBLa0XEmUzKL0Zf7vr86YlY1fiVpj5inj1R03NWQbH6SRB9QMoa7+/xNyLNr3ed+B72
         zraFmfINVpNZyj6K4SgVd0fTzSaucr6SvAA/OEBfxcbMchrzTSvR/4VNgW98MotRcspY
         PgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822200; x=1788427000;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wURAAqpmYnRm70wHLRDHhfOf5KYKWGXPLGAT3tMJ/w=;
        b=l1GN+hc/vFhkl6t+47ZPcQ3dqJN8abpYxZSFlAk8xgnkhz2ia1lSULvjv8TBiKdq1a
         DtSjx5vZWbx4WNcJzYOOMvr3+f6wvVd/46hAZTtIuClqut+NPbrNpN/N4alkKf1JYf6o
         O2czbC0rZ5XTXJYLWjylLRLzSDDPgRvrj5B8EtOV8RwB9/M4JcAKKX0ifdyLfZQNzSHC
         xT8aQhvPNkl1g6W0FmxOnpleTf/FS7D5MoWDZewaIK5ikjTETatvcnK/1lGvy6EEYB3M
         dZjT69M9j8JpmdswiV5K7jB6yZ3dvUEoV6qreE6A3VBpdZNCZmpwHFt48qLSdOxV7k6m
         nkCA==
X-Forwarded-Encrypted: i=1; AHgh+RrZXKo0dy6+GD9pmJKcMj488ww6agNc6GUru6A3zqbhn9uJHDzkga1yn7ATpyMKVyDcLFveg84G8y/x2eg=@vger.kernel.org
X-Gm-Message-State: AFuF++kNRUWQGICzMvDhdwuP4D6nHJejQqychx4sxa2nQ5HpbuRCL71D
	r6mv+9VhiN4abZFsEkgJDQTTRtXbEUSmrGr3sUb2VOVtiaDknrB9Cd3ppxGhDc7bWw==
X-Gm-Gg: AR+sD110tWKTURERkS8Kxt15+rnlddRbxijFpU9KmmVd3oC6W+n2ztUUPdnCwG27gmX
	TTEavGlSTF714XlFxtCAShhGy8BI0rcVP+Ojo7+cbUtD4cS/jh32Qdm7kS9XS0Mv7khPMeX8IJm
	FR3JOJKQi9WTz1HKgtMAweUZz3bMOMUdeW9mnDsHuckxyxD2uvUqe6gWV4hoyWcIYeSXwByvpRK
	Emb2apR7wNRN0zzbaV7iIoNJEuMbmpQ6G9nkq68B6Y9Br7PGNwCn+OM9Y/hAzinbb0cLVPql7UC
	QcwCY547TdqDDXttDXz8ObeJW9E+Q72eI0KncI3VIoTYDy2YWPUeGGbOSoipNIdQ9HXG6qFsEF3
	qP7s+zB10tKr5sMgQqC12T/MkmFdhEkggM227YYs/hXkdRIvKi0LyU4BHewPVOpk0+eUirHhBHd
	g5VYg4LcredmXNHC/gKwCRyvDuHQB4LUrnRZYQmC8s9glUaaXY4ghz+5mBVTljgyGRWJzvZxcWA
	ELDnQMh6gwMQKT9Si1POzb7UX36kcrcDE8g8nD9J3rxkTpH
X-Received: by 2002:a05:690e:150b:b0:668:568e:8618 with SMTP id 956f58d0204a3-66d256571a7mr4352551d50.1.1787822199153;
        Thu, 27 Aug 2026 02:16:39 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66d24721e47sm2631290d50.13.2026.08.27.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:16:38 -0700 (PDT)
Date: Thu, 27 Aug 2026 02:16:25 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
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
Subject: Re: [PATCH alt 13/25] mm/fbatch: no lru_add_drain() to
 collect_longterm_unpinnable_folios()
In-Reply-To: <5d42fbfa-1cc3-4161-8ba0-7318267576a1@kernel.org>
Message-ID: <e10bc806-f995-e48d-a24e-8872f0a71689@google.com>
References: <14a16945-529b-8bc0-ab38-3ea97e54e223@google.com> <fbf3fa74-c646-8855-17e4-e8b35dfd9c14@google.com> <333bb765-a36d-e07e-d3c4-5ea2f1cadfcb@google.com> <5d42fbfa-1cc3-4161-8ba0-7318267576a1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Aug 2026, David Hildenbrand (Arm) wrote:
> On 8/24/26 16:55, Hugh Dickins wrote:
> > collect_longterm_unpinnable_folios() has no use for lru_add_drain() nor
> > lru_add_drain_all(), now that the per-cpu fbatch references are gone.
> > So remove the recently added lru_cache_drain_for_folio().
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> > Alternate version for use once David Hildenbrand's two commits
> > here have been pulled from mm.git into linux.git for 7.3-rc1.
> 
> For 7.4 we expect another user of the helper in KVM guest_memfd code (the
> primary reason why we introduce the helper), so depending on when this series is
> ready it will just remove that user as well, or we'll need some coordination
> between trees.

Yes, I could supply an alternate alternate version, providing an empty
stub for lru_cache_drain_for_folio(), so Ackerley's and my series can
proceed (or not) independently. Later. But at present your patch or
patches seem to be in both mm.git and Ackerley's series (17/46),
but not yet in Linus's tree.

Hugh

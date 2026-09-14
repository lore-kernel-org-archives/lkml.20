Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D3437F334
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410981; cv=none; b=rVUsM5cTxQIOcEh2ontna2cCMPzFL+oEBN7zmIqrz8pxh4ancWDzZ16x6+CJOQ26lTQnW3j7yar9FfKlV/mHm+DAxO4DGFC5ErH8JHZ7TFJizuXSC1gwYvqKWlyZdGG6D29jRXKRH8qVYTunpE3cHrkAS20+HYf9REeWZwiix1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410981; c=relaxed/simple;
	bh=OxXVneQUOJfV6asvw2nS8AReGbL3K40Oma8k1pj7BrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im0pQe2ihatbhoKEc6APDcB9HJTh1uQMMu0L5E/sBbvqQ4v1NzIOrNs1DOXF2HPI69N1TrafW9efa917CD78UAwEOEbjv0sbDnk0S4gRnTKtkAT7+B/tHCkDb0SvfvscLf5mbI6x4zHt1RjhaaRgFJjhX/thDlB/KE11zl1+LWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LuEjuPg1; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LuEjuPg1"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so3384460a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789410978; x=1790015778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sLXWrepmwzfofzjtX5AuHaJ9cfFcfDLD9/VG5Rf9x6s=;
        b=LuEjuPg1541PZGK8M3SvutAtAHxcvR/emCJamN51jIGTvwgOZuf++Xv1hxmBN7ixQj
         Ooq2rnD70WRu+XDNygAN8xVyzQ91/37dTAWf7mf2YJDEkBjwDTyuyiIuoDrhVxY/dDb5
         y8rw3qhJAq7PaRUP14uIf/e7nCImHK5TIlPKECJUbKQ6UflZ2Y7Hy+YV3syvRAqmhbCn
         R/OhKy8mqs1WoFrEim4/g5xMd6uMyhjdAhPha4Q95oSP2sVa0IJQ/GLNWfPzgAr1+i5E
         cnJgds+n8KaecCQeKzlJz7S3r+fU33+8TY5jD4It1aK03JylJyl4ate2RGgCSij+lhSY
         zExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410978; x=1790015778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLXWrepmwzfofzjtX5AuHaJ9cfFcfDLD9/VG5Rf9x6s=;
        b=ms8sVEof1GqDjPoliD4fOB5uhh5Wdtqv+bCPXlDpLP6ATGdgT5ugiI1UgTZnHWVN+E
         SgSae1pL3AcI8hulbkBPg1xfWDnpxFiqFcetii42DQ3kLm0a7VlW7rQ1zGmAQNYnFrl5
         PiYMjv8eIvr2ouJXSp2//7KTmyEKqsj3jffxVP5RXWJO7hPcoEbWYDTgb8IwiMVlB+oA
         deJA19tZbcIAsYb8wHm2R8KU3Hyxh3Jdj5AzC1k1/W0lVzmB4plD53DiTkm88e4ncr+c
         jDAX3O336/SgWqSShc9+z2gL10fZFK8dAEc5ZQzjWqS3yM1DvAZicFSocdJr+k3VB82R
         +WaQ==
X-Forwarded-Encrypted: i=1; AKwUvByEHsCp6xLrAipMZlx2NSafkvy8VfUCK1u/6lNYeoem48kVm4CQeabAzpIShAvRo9EgZxgiuGYp4SG8904=@vger.kernel.org
X-Gm-Message-State: AFuF++mXLmfgNuOEhv/pGram7ywLyamutMH0o2z9s5YFQz0SilpG+izK
	Y2ZlccboACxxl1RrfjhelNj4F4t8s/3P+1cnlpNJnB+ouyscAw60h9VadWfIkl66oX8=
X-Gm-Gg: AYBFou0piKDv69/nEZwOSSAO+jcPCJTpMpk5qbd83oXwp/v51gfhw17OqOGGLMPPEg1
	TT3Wilk4go4WXbi1oPeSCHyehFsMbmD6KdNnyjuBKu8d/MK/2QKISUC30NVqOdXjQ4cByjVAsm3
	w/Fu26A7ZTG7prk8ADQDsCo6IfiL+L13QZnOklt1vWyEtSIo0421/943CYbPUOgmPw0JGzLi/pW
	nmCGEdwr497NrWpG21/LUsoU7cLGbD+MWK8r6MVQ8py17AN+ZdYWjsOgpEe9ItEWoponnCwaD/h
	LqMZk68In+rgMUPW0Vfxo1y8ntyaH+PW1Mb29g7lZf3cwlciOig7VoIrWCHHA1gDVWTbz5+ZrWT
	K/QHM98p+MLwQb9IGsVTsUpU/CIwIIit7Ps/+Wavhq5N11DauFTE1sEi8Zc7RveU9RD9eG2acMz
	tVv5pbmjhtcDHBqfTQCSdkYzhtNCkNA5DkV0BrQnFPVPj706LKB9cTvBgl1MnF
X-Received: by 2002:a05:6402:4499:b0:6a9:cc6d:ea4b with SMTP id 4fb4d7f45d1cf-6a9f63cd8e1mr2485859a12.21.1789410977836;
        Mon, 14 Sep 2026 11:36:17 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594c28fsm4680607a12.23.2026.09.14.11.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:36:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 20:36:16 +0200
From: Michal Hocko <mhocko@suse.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
	Zhou Yingfu <yingfu.zhou@shopee.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/oom_kill: fix hung tasks queued on mmap_lock behind a
 long reap
Message-ID: <aqg-oG2HDIUeK5Us@tiehlicka>
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113239.367200-1-jiayuan.chen@linux.dev>

On Mon 14-09-26 19:32:37, Jiayuan Chen wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> The oom reaper holds mmap_lock for read while it unmaps the whole
> victim.  Anyone who wants that lock for write in the meantime sits in D
> state until the reap is over.
>
> With swap enabled the victim can be several times the size of RAM and
> the reap runs for minutes.  LTP oom01 trips hung_task that way for the
> victim and for ksmd, on 6.6 LTS and on 7.3.0-rc1:
> 
> Call Trace:
>  <TASK>
>  __schedule+0x487/0x1870
>  schedule+0x28/0xb0
>  schedule_preempt_disabled+0x16/0x30
>  rwsem_down_write_slowpath+0x1d4/0x750
>  down_write+0x60/0x70
>  __ksm_exit+0xb4/0x230
>  __mmput+0x12c/0x150
>  mmput+0x1e/0x30
>  do_exit+0x283/0xa30
>  do_group_exit+0x34/0x90
>  get_signal+0x952/0x960
>  arch_do_signal_or_restart+0x41/0x250
>  exit_to_user_mode_loop+0xd3/0x560
>  do_syscall_64+0x385/0x470
>  </TASK>
> 
> KSM is just the one LTP happened to hit: __khugepaged_exit() has the
> same write lock cycle ahead of exit_mmap().

Why is this a practical problem we need to care about? It is kind of
natural that the oom victim exit path might race with the oom reaper. They
share the same lock that is mutualy exclusive. The whole point of the
reaper is to ensure there is a forward progress achieved. So before we
start modifying this let's talk about any practical/real life problems.
-- 
Michal Hocko
SUSE Labs

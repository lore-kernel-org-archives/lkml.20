Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362884E1414
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010181; cv=none; b=MeZy9S8Jh2sRHBI1fG/da+FJZAOCI9xYrV1H86F8vvp9QsxsUQDqqkc6N6bkWybe1Fc2HYp4gyevcNj66w1Ydqzp+f93v3WobLfsScXwADeC1RchwrE7He5vX0Lwq/F2XQe6GcLQXD7teIaBoY0EteIKU9G/pDOlewsobZMz23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010181; c=relaxed/simple;
	bh=0oQTC/1nit8xtttyPLngZa2mAS9b958j3IlvELrn/tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rv9TaWK9ogzZ/s+0ndg2D9OyVccFXcLiFKx+RFCprG6N62ffa3QUo8IrBlD3kJl98zgTGznqGEtnehrh9IcfxuB0q9074MoLMLn60N+fdSDmfuGf8MXSWfDcGI+zwI+rRzfw0U6ogLUOemzcp2XuAes3XrULe7cS/yYIMKDO36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IVfebPCd; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IVfebPCd"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52fa9c055b5so662151cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790010178; x=1790614978; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zam1HuieMGo4IVtIDS9XVWJbvXE11Q3uTiDlxDLMxb4=;
        b=IVfebPCdcxu7JEGtSeXhDXopipg/6dGmEihMBn6DRAhhLr93waBxOZpRz8WpFs/x6K
         tS8FuLAnwSpudbK6M9LS9GCaXFtJ1XJwjcq6FDssRMGBWp8tFZ1wvMXipcSDn8lgurFd
         p4c9oC2HiZTO3MIkFlDQIY+VeEQVkEksw1Rm1CdlS0FIJCE1m5UNcH0Kge9KgAn70p9x
         VUpZl2V8ajpitWDr6M0kg3NPC3ZRnqDm8gm0JqsjgdvpoZg9JoPvxzjRtHqhNXI12ygp
         w29whUsrb5bGAi7JO/lWjiyVBAZ2yMAFDNzZ0IqHE6Egp83TSzwEOEbRgTlbM+VxQqD3
         D30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010178; x=1790614978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zam1HuieMGo4IVtIDS9XVWJbvXE11Q3uTiDlxDLMxb4=;
        b=HmrSdkG/SRJk04mXnNx8w7/ymf7uut0kbHRCbjeOSMT4eldsA5PTeQaqozW3SMszXO
         Y575WyLrQiTiffNSXtKCvub2XnPHSGDbfvZ64e+yrEM/50fHJLKyATlj4RgHQe5KvJQF
         BZoJeKfea1buWzYCbgiFDWlikzpVbLS4kcW/ZwgmrCjSojBWRGiYY0ISCxQru+cN4v0Z
         0iKhay5+UwAi8Vn/27IRkHwOjWUT2hSv16+e42Cg2ufEjJV9ovTTuufuJWJMj6Gg8R/K
         CXXq/lY50gQ8Ac/ofFSLIWFOo62euCAhtPodycQWV5HBzRbqiZCoCYTp6Zel926uvtWn
         YVpA==
X-Forwarded-Encrypted: i=1; AKwUvBx83Nic+TiFbAXmxGlfq6bbwSps0Aiw/c9oPreuRx0i37fjRiVVPj0kz8eDvh53NdZRnDE/RgSPFjSpeHI=@vger.kernel.org
X-Gm-Message-State: AFuF++lsJy7wWOSmMDrGo4118hyKK6pkBDb/+fhPzAJko0b5okejUrFJ
	A8kz3G8EXlM/gjmc+voCZBUT9AcpY8xJdMnBKpn5GmviYaL6yXgYA3Sr/S0IP26WH+8=
X-Gm-Gg: AYBFou2rZjSnLe0dgoElC8qfYJr1R9bNMuotHP9/G+fCO/qHPMD7kGCvINlLO3fSps0
	7R0AQyIXlT6/jfJ6ioDS1aIlzWQjRCSY5lnouo4lkty4Nzpl7du4AZgQXU6gtu+3/QHUpfICjze
	NfRFLaZaegyWkhTW2j8k4Osl0VFtinH3vlu2aD4Z+dpmuAAcfYzzCv18ucWTEt6kMyatX9fiR1Q
	rwJEkcgdg4uCz+1UY13EmGnjJd1C/3xZJKZ7OTiOSkw0HMv3vU5z9CfjUpNqU4muwnLzs82vhzy
	2BZlDI9rsjtkwkX9BZ+3Y/1FpwHZcZWV/D9VpNjzhJii12dNaITCqHXuMf+GV0N0piQ2CNJuGap
	LwtdRYJajExcp88xcDmxs2Ivs/mokS74ysdclYv28l/rH6kTsKOiTeSXYdq8grLJ6iIpKWSzQzm
	Rm18w3zl/MrUggPiLnVkEZjMcScjr2dcl1v8T1vRwZ+pLil72+wJ5apNM91OE3AMFvJSoEiZ8UH
	8bgjkNG4/GJulcCHWltY5Q=
X-Received: by 2002:a05:622a:6110:b0:530:fbd3:2038 with SMTP id d75a77b69052e-532db89fda7mr2849411cf.26.1790010177750;
        Mon, 21 Sep 2026 10:02:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([152.186.177.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae618698sm68095611cf.16.2026.09.21.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:02:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 13:02:10 -0400
From: Gregory Price <gourry@gourry.net>
To: Chris Li <chrisl@kernel.org>
Cc: Kairui Song <ryncsn@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arFe215hUcjLhvmS@gourry-fedora-PF4VCD3F>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>
 <arEotFqE7ZZoxMHd@gourry-fedora-PF4VCD3F>
 <CACePvbXb1WLz=OAAzVawf3oc3+dE3Z7qfPdagQ2dYuf3OALc2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbXb1WLz=OAAzVawf3oc3+dE3Z7qfPdagQ2dYuf3OALc2g@mail.gmail.com>

On Mon, Sep 21, 2026 at 06:32:56AM -1000, Chris Li wrote:
> On Mon, Sep 21, 2026 at 3:27 AM Gregory Price <gourry@gourry.net> wrote:
> >
> > This would preserve the existing memory.swap semantics while allowing
> > both backing resources to be constrained independently.
> 
> It sounds like you want memory.tiers have limit enforced.
> 
> I suppose it is possible. Again I want to see how people would
> actually use this feature.
> 

Possible, but arguably not needed. the swap and zswap counters already
work for this existing interaction.

As I pointed to in my response to Rik, in every reasonable use of
pswap+zswap the global swap counter is pointless.

So then pswap=swap and we're left with zswap and swap.

And I'm not convinced your reading of the swap counter as a limit on the
*logical* memory allowed to be swapped out is actually accurate.

  memory.swap.current
        The total amount of swap currently being used by the cgroup
        and its descendants.

  memory.swap.max
        Swap usage hard limit.  If a cgroup's swap usage reaches this
        limit, anonymous memory of the cgroup will not be swapped out.

There is no documentation I can find that has ever documented these
counters as "the amount of memory requiring a fault".  If you put a
compression system in front of physical swap - the counters as-described
would still be accurate, while your reading would be broken.

"swap" here is highly implied to mean "storage" as opposed to memory,
which is why "zswap" defines its limits in terms of memory.

  memory.zswap.current
        The total amount of memory consumed by the zswap compression
        backend.

  memory.zswap.max
        Zswap usage hard limit. If a cgroup's zswap pool reaches this
        limit, it will refuse to take any more stores before existing
        entries fault back in or are written out to disk.

If you're presently using swap.max to mean the "logical amount of memory
allowed to be swapped" - then your usage does not meet the definition of
the knob.  You need to justify that your use case cannot be expressed
via memory.min/low controls:

  memory.min
        Hard memory protection.  If the memory usage of a cgroup
        is within its effective min boundary, the cgroup's memory
        won't be reclaimed under any conditions. If there is no
        unprotected reclaimable memory available, OOM killer
        is invoked. Above the effective min boundary (or
        effective low boundary if it is higher), pages are reclaimed
        proportionally to the overage, reducing reclaim pressure for
        smaller overages.

That's an SLO interface.  memory.swap is a provisioning interface.

As it stands, I'm left viewing zswap's counter inclusion in swap as more
of a bug than a feature - they account for different things (memory vs
storage usage).

~Gregory


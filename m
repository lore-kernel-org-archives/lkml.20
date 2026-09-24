Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649CB411665
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234412; cv=none; b=SdWX9Emp0zTUww8Zj5x1HYqYLPBBaUnQt/0Gb2YvLJZSeXLYavzXHaHYVesA8jaMDjocKinFCqbBNPvb4oiJ+j5lAAG1fmk4rDOcHO2QQdOgPU5+toi1REG4NAPKml3QNf106j9dbo9XXmFn+io4qKFuBUqJiGOR2HLsBzVrRAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234412; c=relaxed/simple;
	bh=GHHMs0wM9MmiRMNcNEelwZhzqNS10q95ZUYc+svftEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ4/1MDcVul3v8kalJnthQ5RExaif4prPOtKvR9Fl7jdckpvTQ9fsp627YoNU+ar/tENS4i57RpONjdPibHCODbcwqIFhqqtn+hSYpCYFcVYyJ2RAzJbNQ1YsAJ6bxZOJ3WSO/nTVPCrczfzBRTuIpMXygEHZ8UpW0mJClNHipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ous+ukrS; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ous+ukrS"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d6489419so1500658e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234408; x=1790839208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4viioSB1Cdhru9S874ZQwRNPODne/nPyQTptgVZoI4k=;
        b=Ous+ukrSKYKNVCz+tHieApuBuIfSbYX9L9MUv1X1E+g1UuwdYfuBcx+/+/4q+iO8KK
         ExgpZwbIg11R8P9igE7ToqQfMi3uYKB8jTgf36LCG9Fg24D0eGUVdNeU9fbbuWQ8SJG5
         U4g5VtB3pBeLJ/LEeQUofStcLfY6lYhcw+RIKRS1QnUqSDlFe1/xB4w0DrNInTkRaaq2
         VxdHi8w2tG1uD+Vo8V7p8xIm4luVJUkNUERKPdtSwu1VgOYt+zg0ped4YsIy2Js1espo
         2Xj330Lf2gO60zKWmInLxLS2i4oT5/yuTmBXoeFmve3inADcyV4HvKIwFrgh6G6NE3Qs
         sILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234408; x=1790839208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4viioSB1Cdhru9S874ZQwRNPODne/nPyQTptgVZoI4k=;
        b=PW5Si/YibpZVXhn0VvuSJ9/8Yq3oWgt2dh0WzIOgJYjAPe2LWcXkc3gxpK612oB30s
         lQW5FDjDuitmDtKTEXX5m0Bfm6JQg98K0kUJQ2wymNSL/85VuIuC8dG7rzXHsnVOOiRb
         yUq6jCINnpFMMKuTy4zxGVOFaYI+lFmvDV56EV2efQIE3YIIGJKSnns9hDfOJflbCZpW
         fAcQ4V9/pZrM4ug1FbC7OZQgzNAglzn51RMPKy2n3srZ5EmvIzkJj79FjDG9xrfg7224
         Y1sHqtb8N5eoNqjt8vIvHy+7tCuQDYh9fNDSf3KXbdIAuG0A/06TCKF/QKo2vIEduCE/
         bCxg==
X-Forwarded-Encrypted: i=1; AKwUvBy9zR8HkZXgTH1RXsrKI+Pi7w8I0Hv2t2+z47F7he5qZITd0fHVe1Eh1zFTDY4gqO+U5WvzOUhf4vLxGCw=@vger.kernel.org
X-Gm-Message-State: AFuF++lev7pI/xNhRNh8KTxJSCiLQeQmql13ju6+d3h3R6VKyk6OTejR
	k2tKI3Vu/kO+czvwjiGQPsxF//fdq1EssZVu5sfrvaI/zl8A6bebYBD9
X-Gm-Gg: AYBFou3DQb4tCca+DaKJpeZB9WcJMssX2GHfL+tphrsT9nS3+bPTxRpHaTbhBMQCtAW
	8FJovK2gkR/oD2Jh9bpzUSDayF7QaMUZK8udZXS+uordIEpm8EohtVxP/CnF9U8PvxWIs1QGpGj
	MPovC37sRNre9nIQdmfJ1FEKhJwMt/hiIV3GOQLCwOxoSmp3dd+cKgEtEaed/dGeopYMry9kBZQ
	3qwPZIF5lR2ZYiGQtUAO/hOjzV28nO3jnaYEyhGLUrhxnQtdoWsr0QcFG7pEvmg8w9xB7wFuwEM
	LbVWemnDITxzo82EbxVXd6jnrcoTrJsK5ampE0ybjo0zeEI6jg9gE81NlH9IrVHfz/UFSawgvG8
	zxy5VicAMJ4UmPeSmEgjSWJ2g6Fl7lDrafRAZE7U7ijb/BlXoBIMEL/gXESBbVHQH91DYfaQxYi
	qKtHYB0O27EwwGUlyKKy0LUgRnL5+gM9zN7NYk0nntXzvefbFMyCQn4+CmLKx+78FGn9j2PyJ04
	QzIYy7chpHTcSXEf1iDocCxaGH1
X-Received: by 2002:a05:6512:234f:b0:5b5:e2e2:5f2e with SMTP id 2adb3069b0e04-5b8df05906bmr513502e87.18.1790234407919;
        Thu, 24 Sep 2026 00:20:07 -0700 (PDT)
Received: from localhost (sol-eduroam-pathost130.ki.se. [130.237.96.130])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857f7edsm1229650e87.31.2026.09.24.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:20:07 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:20:06 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Chris Li <chrisl@kernel.org>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arTNdz2P4ZZZfruh@parmesan.int.kasm.eu>
References: <785353ef79844e81a8cd97e87b00ef1f785b15e5.camel@surriel.com>
 <CACePvbXZ4i-DsmbQdNtBQb79y59uwZC9J8qHD2wTWpcYaet3LQ@mail.gmail.com>
 <83539be885f15bb567b30264f5f62e718f4a9fd0.camel@surriel.com>
 <CACePvbXZQERwLF_f2FYTHsv--kq_-Aw2vVVFF+z+ovdnsHy1bA@mail.gmail.com>
 <arKbXe1Qe-FDCTMM@gourry-fedora-PF4VCD3F>
 <CACePvbWW4avTV2WB6iRU+LN5zqkMTg3UhBrq41R0iw91-7Ni0g@mail.gmail.com>
 <5a7ad159b2fabf377b7e1fc4248c433287ac11fb.camel@surriel.com>
 <CACePvbUtEdQLmmudON_qC2aKuLYCNktBuAecFKiSvDC6eTfXeQ@mail.gmail.com>
 <arO0RCCE3Woh_I_z@parmesan.int.kasm.eu>
 <arS6dvzAI5XLHuG-@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arS6dvzAI5XLHuG-@MiWiFi-R3L-srv>

On 2026-09-24 13:51:50 +0800, Baoquan He wrote:
> On 09/23/26 at 02:52pm, Klara Modin wrote:
> > Hi,
> > 
...
> > 
> > Chiming in as more of a user perspective.
> > 
> > On my 4 GiB BPI-F3, I can reach more than 10:1 compression ratio on
> > zswap during some parts when building GCC 17 snapshots. E.g:
> > 
> > MemTotal:        3966864 kB
> > SwapCached:        31872 kB
> > SwapTotal:      16777212 kB
> > SwapFree:       16638128 kB
> > Zswap:            280140 kB
> > Zswapped:        2859840 kB
> > AnonPages:       2927376 kB
> > AnonHugePages:   1409024 kB
> > 
> > While this is 72 % rather than the 100 % you asked for, I think this
> > shows that what size a potential limit on the uncompressed size of zswap
> > is suitable heavily depends on the workload.
> > 
> > I have been using vswap consistently on all my machines since about
> > August, and I have also tried one or two versions of xswap (but the
> > current lack of writeback makes it inconvenient for me). I really
> 
> Thanks for testing xswap and reporting issue on xswap rfc v3.
> 
> xswap has writeback now. I only built foundation for xswap, while
> writeback part was left to other people for collaboration. Finally
> I added it.
> 
> [RFC PATCH 00/17] mm, swap: xswap writeback to a physical backend
> https://lore.kernel.org/all/20260920072043.430390-1-hebaoquan@kylinos.cn/T/#u
> 

Thanks, I'll give it another try when I have time.

> 
> > appreciate the work being put in to decouple zswap from needing a
> > physical swap device to work.
> > 
...
> > 
> > My personal preference would be for a default uncapped (or very high,
> > and I don't think 100 % of RAM is high) limit on the uncompressed data
> > which is backed by zswap, since that would mean one less knob to tune.
> > 
> > > 
> > > Chris
> > 
> > Regards,
> > Klara Modin

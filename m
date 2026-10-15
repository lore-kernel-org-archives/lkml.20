Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4C4BE42D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061657; cv=none; b=VKT2+1TsLadR6KST4AdlxBM7wG6SGobEgyewvDPmuL7Gum//jt5GtfjZh5qXdj7ShFHFhw4PgRZUCaIUya4qyhsb9taQID2Bdl1HlwkAhyTKgSTO0gliO2zafdo9K3XNVXs9cUBnehQvvu5e7CM4b/azyuusTI0r0eRpzpkxlOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061657; c=relaxed/simple;
	bh=XF2hsS/QlnZTmxGFa4yiCAWY+VKnATHPGqUwRoR83RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T87oxLLuRvDqiPF7SN7Y6HJ43oNg27rMdOAF4bqHWJLc7xd0XlWKcZERsOxe1JTOh7znMjy/MWQig71aY/fwKAG9A4X96Nlt/Kw+1kkfJMc2BHCMxuH0Sd1ln+H/kdc4EMbH0pro/qpIlke6qZ7kcGqqATtx4ElHZofRKBWnrDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TuwXhNzp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TuwXhNzp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso269262f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792061652; x=1792666452; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GiFJNEdHCyl9o7lyZvAVM97bzBWzN9FAsadD1M92V8=;
        b=TuwXhNzpqiD4HcR69AkdwToM912vQN0w1KUGG9FXCPnImjyTNDV6LtECJ6hG8kBGAi
         1eEe1opR2kPKbMYvhC9vNKa5IrdeyL+w/UpEAjDF92Y753zzfVhLAjcei393FKp1mLc6
         NhXyYAN3mEGXIzyV9jxUyAhiIiIE8v2yZIiZQDAHCUpJStKooB3c38dEAJ/lEyiwZ1X6
         pzOn9jZJGDyYZFTKh6ZcLLgQW1AAfyYlxkjqyX/dv6DowL+hBaxcLNoomz8nZ2E+XiQU
         kZfO+a7jeVY5NHfqRbii91R5bLin9Vy08gAvmlxnWnYNoFQo0lBY3/HZZEHdz/vjncY/
         5/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061652; x=1792666452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7GiFJNEdHCyl9o7lyZvAVM97bzBWzN9FAsadD1M92V8=;
        b=yGNbTjFeJ7NAsC6GuVy0AjkA1lL/CU9O03C8XYrI2CVj6IcNuoWYBTPMJYy1QNTUWN
         GlVchMV+KfHwImtS0AvZ85vqZ5gE7ZPK7vemyXwRhcLgJbRQOW9RD5IAMRfc81RPJGmP
         co+YADOjaGcp267epInjgVPzWn4j+p9CkDHZn0Ai5zWrKtF8CSEjZL+hlsvjP0iATItM
         tkL8hT6KMa0qIcpfH/+WT2O3USsHDz9ePBnrWgGKMhPbZXvyC6uye+Ntc9cEC2I72Akr
         sWyU5CgJqCI+Mb0U35NdDpy1qLicSvEMULcqANNiBTBI0iUo+S20AiL+vwX147arwsTv
         GMsA==
X-Forwarded-Encrypted: i=1; AKwUvBwRLfLjaWV1Zj3xw2KMogrN0jKMHchyd0/3mEsl4u+Zw6gb1ys5XGmK4yDFU9ORdru9z5wP5a7Xfj5Y5TM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr9VmZQJ8ZMDg6C/HLkiVPNwwlHLHfw+cZeM1ESuc7LSwYVE6S
	xS+p1UeQiusX5Rpb89Ovu+ZEniDV7MdKgCP2n+/DW9WzZb3RFWAEkKjYKrL3LHRG+LxS8qV1D13
	M9Tb7bsA=
X-Gm-Gg: AYBFou2363r2zTIwVb3blk9xC+IBH4wHJwrf4Q49wfaqD1AWlaSwX9KZWNh5KCBBANH
	h1YBdQ18EKsbHDRDZuI89muszQijhHhqnLKIPequr3XmpDfDV2za7Ai80m0LwQfIgChH6MCwtq8
	2ZKaFCJP/TItSNxdloJxfoCwsQuGvVPpYzfGMlddc+OBNR1BuUADyHjCZmHk8b5bvawpR80LMFY
	LmpRZJl4MVf3Wm9y5a89G21bcwYSumvetHHkuZkw0qLwFRpU4nZ1swiQGWXvwk1cyKVSPspyA0a
	wv8Fv8DK8PkKVBruiByi7flgSaUzb+3AXA46dmYiZBQAsXDIVc5Nn8h58S4j8B+HprYBbiYEYXZ
	3vthuXt+uA753Cjh2CiwHAkeX5DwSUNlL+TqXNrGeJaRTQSsJY0P44LNK/KPXoEjIY2qScb5w3p
	RBSdGc6IuzdGsEtAEwYhBYgVEpGBgybh4fjmMMbwW/6sHS5QxRzQKWkQaFJ+7tM6EDm3nq1zplV
	BeZ05Q4mOd8
X-Received: by 2002:a05:6000:388:b0:48d:ed0a:e064 with SMTP id ffacd0b85a97d-48ded0ae0b8mr9811826f8f.24.1792061651748;
        Thu, 15 Oct 2026 03:54:11 -0700 (PDT)
Received: from localhost (109-81-30-108.rct.o2.cz. [109.81.30.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de77606fbsm10461734f8f.53.2026.10.15.03.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:54:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:54:10 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH] proc: Move OOM-related procfs code to fs/proc/oom.c
Message-ID: <atCw0gk77fF5ISQV@tiehlicka>
References: <20261014-oom_procfs-v1-1-f2d75e73571e@linux.dev>
 <as9MG_BtepLV6DsC@tiehlicka>
 <e51c14e9-5559-4ff7-8a38-de815a8f8230@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e51c14e9-5559-4ff7-8a38-de815a8f8230@linux.dev>

On Thu 15-10-26 09:32:53, Ye Liu wrote:
> 
> 
> 在 2026/10/14 17:32, Michal Hocko 写道:
> > On Wed 14-10-26 16:54:12, Ye Liu wrote:
> >> From: Ye Liu <liuye@kylinos.cn>
> >>
> >> fs/proc/base.c is a large file (~3700 lines) handling all per-process
> >> procfs entries. The OOM score, oom_adj, and oom_score_adj interface
> >> code is self-contained and has no dependencies on other parts of
> >> base.c, so move it into a dedicated fs/proc/oom.c following the same
> >> pattern as fs/proc/fd.c and fs/proc/task_mmu.c.
> >>
> >> This makes both files easier to read and keeps OOM-related procfs
> >> entries together in one place.
> > 
> > Are there plans to separate other functionality or is this one off
> > thing?
> > In general I am not against of moving stuff to more specialized files.
> > An obvious downside is a review as it is quite easy to overlook a subtle
> > change when moving so much code. Something worth undertaking if there
> > is a bigger goal. Not so sure if this is just a one of and fs/proc/base.c
> > still keeps other random stuff in.
> > 
> 
> Hi Michal,
> 
> This is a one-off move specifically for the OOM-related procfs code.
> I don't have a broader plan to split up fs/proc/base.c at this time.
> 
> I understand the concern about subtle changes during code moves.
> To address that, the patch is a pure relocation with no functional
> modifications — all function bodies are moved verbatim. 

But you do understand that I effectivelly need to redo the patch to
confirm this is the case, right?

This is something I am not particularly thrilled to do for a single
isolated patch without a larger plan. taks_mmu.c will remain a huge pile
of code after this change. So what's the point for all that effort?

-- 
Michal Hocko
SUSE Labs

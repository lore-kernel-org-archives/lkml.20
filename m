Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1049374E5A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455426; cv=none; b=I/dwgIYV8+QXtR/2lFC3yFpk42IYejQkSaIuxihNOF6s8UV5OMUFH4OsCpYRAJRlLJNlyGVP96gL4v4UETS1EzTepDWXNfCvKdjed/QOQhrsxKmYFwuy+rz0KMbyJcg58HkWmhjCUVoU8K+u1qKBV129zW6Eojol6PA7lip9C+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455426; c=relaxed/simple;
	bh=ZdgAncXPqr85Ge4r2yoSn4ghNCrcY7iODlDFrmg1qdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ0Tm9Px3YuFBeBG2vhenSzypS0wyxzYt1HyljC3gns1WBmQRkD6fSU55JpWWfWxZG5ozAozJO0Ljcb6JHnFdEI74KoQ7jUrRPKhKsVTPyjS776sbcXCpXtFFL81iyot30TmoRZXxgeuZ+A7dnzZySr6tZ7dgfSLRRZpjCtWj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MeZdsLxL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MeZdsLxL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c29c6a3930bso126201566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789455423; x=1790060223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=19gTsJshLkl6xms1dIGVk+IXi9BTm+f13eumbdPgk68=;
        b=MeZdsLxLiWHKLuCgr7M5jD6oIS1kcromUG0vZtInxKDGXeax08uhpw/bQh+of1PwwT
         TEfVLYg5xwb1sMdqo1qfcEyfrjZwQ/X8i083KWo0tXS18dg/CEsw+N6aWgUQ/AnMzm0r
         a7qS1WA+jyGAJRkIfYOoBR+ekIveqeQl1Jgs5Lf6rkgHsMvowI5ICtX6Ifq2WL7RlP+L
         enpbfXbUHQiiiOSTPkocj3bpnSlYTrgQ+zFqP4cvzZDhE4XLm7yloFmgb+XDmYm1mS9g
         LXzh9Z9D4/rpHRmy3wt9uXHGLvW9XrDyL58zaAAADQJubgnVuARl4H7MYSxX2yVHVMkJ
         sLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455423; x=1790060223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19gTsJshLkl6xms1dIGVk+IXi9BTm+f13eumbdPgk68=;
        b=ke97LsiLc2JcGKk1SWGvu0yycUqPqoZeRa/3s4wTwvFgZSs14oTw+aD4Oey3kb/Ais
         lEiwzjuJTGT2z/bl4Tje46A/XFNYFFtY2yVlS/zEuHDo0YxxXO/YtvNYkIqBplaY3SMf
         tAnYPezwzRoeOowPRb7yDQYvIgWLSOF9tXlXSrSCdef7gvB6UCVle/aSDzQzfG46/o2Y
         FyWVC0/3XhTjvLis/g6VDGL4F8hkoCDoL0HgQOq1OMMXzcGgho2+GJCtNY5GDbDDsevd
         /MX5m5rAxp/H7czWO92xoR/ndY2xGp2HJBQTOxkhF7Jy82+JgaN2l+P+DAGFvmh0Ixsh
         YwCw==
X-Forwarded-Encrypted: i=1; AKwUvBxSL9Z6Nm253Gh36cXl0/IPRH/wHW03GlXqiQ/S1PiWDMI+xSy7aKFKpiayrf4xyS7660owlRRhWlFMXzA=@vger.kernel.org
X-Gm-Message-State: AFuF++lneRLfu91YWKFFbnSPzxWRLRJduaET+L9bjI0x6+UX4+9DpTpM
	pKN1g1U1Ktq8UPcskrJBQ9mFEh/q3joqGBIi7v4SdfXzOPW/VLyIF58g71gq608J+ck=
X-Gm-Gg: AYBFou1Bm/JOY/8Ds5pixqEvwUzuQCiE0hVNakTmjsNtbZHugwY+Z5L2PzuEgEPLfUV
	lPqInWU8NvkHWBL56PeM3FyZe/BgzPl1Q5JjkMV5X+vfWMeCIxUWfb1FXBtzxZqdUdEgSu01Lyf
	c3N2NyoPhTSTpjcLlkU2rg1tpzrb8AlftDLv243xk7SF/sXwmpoH9Ojaz1KfbZ9Ej3SrOQtxvMz
	yN0OZ/DeGXch074M9fCulo8lyD0Jj71NgVGMj0Q1CKvRnSCDu1VoTFqI4dhSHShWAUGsPSBOseq
	1aOIOGO5cF/DbrQePKUxUzGYlAOpVji/TS7ehfTgHUevl2v45XUa0oafoycq0rsYDqzQOI+siS3
	FYEARW6ygnasRKTtHjWqwVDfUuw5jdPcPNB/Wme7sXFFEbBzCL5y8zBHBm4bVmOcjqFSM/bCLEE
	i5egRQnxWw/2TD0ludjerW1vDrZkkCus58YOyOPzGBL8XkOY8IyoEcUnFu8Djw
X-Received: by 2002:a17:907:1c27:b0:c26:22ec:db92 with SMTP id a640c23a62f3a-c29b876765dmr355857466b.47.1789455422717;
        Mon, 14 Sep 2026 23:57:02 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067101sm537544766b.35.2026.09.14.23.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:57:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:57:01 +0200
From: Michal Hocko <mhocko@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-mm@kvack.org,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Zhou Yingfu <yingfu.zhou@shopee.com>,
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
Message-ID: <aqjsPW92SgcHONKO@tiehlicka>
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
 <aqg-oG2HDIUeK5Us@tiehlicka>
 <20260914203533.3544ae8dd0903c7603b385c6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914203533.3544ae8dd0903c7603b385c6@linux-foundation.org>

On Mon 14-09-26 20:35:33, Andrew Morton wrote:
> On Mon, 14 Sep 2026 20:36:16 +0200 Michal Hocko <mhocko@suse.com> wrote:
> 
> > > Call Trace:
> > >  <TASK>
> > >  __schedule+0x487/0x1870
> > >  schedule+0x28/0xb0
> > >  schedule_preempt_disabled+0x16/0x30
> > >  rwsem_down_write_slowpath+0x1d4/0x750
> > >  down_write+0x60/0x70
> > >  __ksm_exit+0xb4/0x230
> > >  __mmput+0x12c/0x150
> > >  mmput+0x1e/0x30
> > >  do_exit+0x283/0xa30
> > >  do_group_exit+0x34/0x90
> > >  get_signal+0x952/0x960
> > >  arch_do_signal_or_restart+0x41/0x250
> > >  exit_to_user_mode_loop+0xd3/0x560
> > >  do_syscall_64+0x385/0x470
> > >  </TASK>
> > > 
> > > KSM is just the one LTP happened to hit: __khugepaged_exit() has the
> > > same write lock cycle ahead of exit_mmap().
> > 
> > Why is this a practical problem we need to care about? It is kind of
> > natural that the oom victim exit path might race with the oom reaper. They
> > share the same lock that is mutualy exclusive. The whole point of the
> > reaper is to ensure there is a forward progress achieved. So before we
> > start modifying this let's talk about any practical/real life problems.
> 
> If this situation is expected, unavoidable etc then perhaps the best
> change is to periodically poke the hung-task detector?

Right. Reaping 10s of GBs worth of VMAs might take some time indeed and
that could trigger the hung task detector.

-- 
Michal Hocko
SUSE Labs

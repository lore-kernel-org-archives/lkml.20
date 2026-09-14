Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A531F9A7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417756; cv=none; b=rSa/LJXuTp69IQShwM6aOuhr/Cg9oRcFr50rktB3O9fayB/H3WKlfIO8vYfdnCHU9r9AB1AbWb33INJvb7rcKIvttdp/7r7sNvfG/86ce74jqj8i0nZyxezHKYd+iuJKeAny681BUAinQ8YVHAp1zQysxf49Xw6c9jf2/4f247M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417756; c=relaxed/simple;
	bh=V8mhYwrBMYJn0Atprf4OLURmdEZN1k4wCeZYck4YItU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbGoSUoXI4d3s8GeSNxK37TfiQjG/2TugC5GLMygD7GCPU8ZZGpM/FuHTYH3dUhPfJE5kq8CYUaOhjaK0EoBxouqLjthkWWNePoO8DXDqOUelDt59SS9dno+2UNd3971ZrIEo+Iyg+959oYukv+bvTJnNX3M1yZ2TOINN5xPat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eFH2LnWU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eFH2LnWU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b917769so191615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789417754; x=1790022554; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1RB04FVKilnMj3CUMQjbhrQYe/qiVYK3aULFxVnZe0=;
        b=eFH2LnWUDN17cBc6Jt9SLxjlisyLFXIqXmP5FlhdsYeIo4k3/6NF5CewZL3/3X6vTu
         gkm0wZHS2ZAci77GTi2NjriSQczz2tqrPQ5DWYyjBoFVb2oLLx6SIXoJ9gCE7XKVfNPv
         KmBMtr06zkjjrW+7YdjOoJNAnFwXCCzCvIdiiaR0QWmerOlfc4IJyObNJVaN2Did40Z0
         YjliKDeEsRbEFz9I0Mablv3T9jxC/vu1h4dF8aMxRP8E4ZzWCLYWr+qimbaABuAlCvb0
         O+yhD45MlChNrqH+bXY0L1YaJeJiksL2nTfv0WjffMASuTkNmmN4wk8SuOvfq9pzaokx
         ySmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417754; x=1790022554;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M1RB04FVKilnMj3CUMQjbhrQYe/qiVYK3aULFxVnZe0=;
        b=uqj2T3MGAy8x8/zwcqYEHhppBkXpzv7e3TN9ILKG2ZpTkDlQmB/22MKCA5IlGv5iXr
         B+pOGEykCgN1pqnIptkohobM+bYyK4X7qhhp5+DtPwXtdVtdVe1rVP1OS9uqqdz7i41B
         uLnm/mnHavwYnNqQsquvEjyb97P3aDZzaEyFosnnq+y5wcg2Fxas8T9Rk4AQAVeRzYcw
         83TLLoXm7tfyExF3DHgo5Beb9lSEFVkxmcESHvUMYtMaaNYmX+m2JGEJYyf8lMzuLYiQ
         TYOF8AruL2dFREPKiKJz6VVZvI0pxW1Nv9uQT1LRF0uRNnBrJ4U/t8AhV72kW7U2/25Z
         Hh/w==
X-Forwarded-Encrypted: i=1; AKwUvBzMe597Gd2Vm60ZLjLKp9PVkAGRbeX3bOFfd5BoNP9rXnThn2gyF5hJ3By4fwhIThLN8Q6wdW+ysHDOR0U=@vger.kernel.org
X-Gm-Message-State: AFuF++n8Ezm7agtW+P/gWP1a57WV9rymN+Bk0VLBRLdEvASaPJQa5zm7
	JUTvWgjrPytzCpKXh7O8aeiDzIf4e0II4XqGAge0eucyzpB29jJLnLimKkviKI2eGg==
X-Gm-Gg: AYBFou1z8pb9reQQSDpzs2P4zTGZZMQ+0xEWMbf4HH83x3EIIAowu/b0y+jx7B51cZO
	M8jkHYL/k60p/4zdEVmCP8mOfAfyDK2RMO5mYEhdTbEl4dPdZj+qirysQ/eUOrpO0WsKJFgdaQE
	paTnawGKeYzbrxCjdIgn3LkN8/g4e3QRHJMS5xDR4hGkqo8EwcfpHhpCJcd7MHadIjBsnyiXjnJ
	PQ/ZsVvWUe5vlyKuD73UfG1gi64+6uwjGKb9SP0yFDrzA6DhoDiPRw9VF//0heHgozeov3vsC+z
	GUBAAH+cle8t0PHLLcHmLaoIPQ9y9ku2gZPPVzEqX/4q9dyEYXLJjE3Q+d701UHljmgbX7JJ/0Y
	ANTwKbw4Pgmkuwnkxtyj5OzuEsiDKiw7a7IEU9x0+7kv967ionnZWSyt7q1ylYHG9rV8DHOob3L
	S5pVBKbb8Ty4V0iIEmUOz0o+CjX3wDzBNGDMckdyKmq2tCtOGNVdEr2HUODA3v7lCTZBjY8PItW
	wTDRLpZjO78c0X3lRpf0y+OYmGnEgE2tSyAlg==
X-Received: by 2002:a17:903:1b63:b0:2d5:cad1:a2e8 with SMTP id d9443c01a7336-2dd76b014dcmr2269015ad.6.1789417754079;
        Mon, 14 Sep 2026 13:29:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:9e:b709:96a2:f1d6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm27582654c88.3.2026.09.14.13.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:29:12 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:29:06 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: =?utf-8?B?6auY57+U?= <gaoxiang17@xiaomi.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Xiang Gao <gxxa03070307@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?utf-8?B?5Y2w6Zev?= <yinchuang1@xiaomi.com>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Lorenzo Stoakes (Arm)" <ljs@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [External Mail]Re: [RFC] bpf: account ring buffer backing pages
 separately from Lost RAM
Message-ID: <aqhZEuQTu394hYB6@google.com>
References: <20260815091819.3651099-1-gaoxiang17@xiaomi.com>
 <04f3ce2f-67f5-4829-9551-a69b9df29854@kernel.org>
 <CAEf4BzbwZkoacX-iP1j4+p8YNbWsq0pc3eTermh2uT5ir66zbw@mail.gmail.com>
 <8d2e20842c24460296e4c83e6dc0dde3@xiaomi.com>
 <CAEf4BzYQvhSVN=Hggg5FHzFdkRr4UNBD6yXaBsOaAwbsRpXpsw@mail.gmail.com>
 <aqSNkbhIuaB5D0H0@google.com>
 <CAEf4BzbAOgwQqsRQnY4yxvubLtioQNL_BBHer4ExvNF7Rvvu4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzbAOgwQqsRQnY4yxvubLtioQNL_BBHer4ExvNF7Rvvu4w@mail.gmail.com>

On Fri, Sep 11, 2026 at 05:04:55PM -0700, Andrii Nakryiko wrote:
> On Fri, Sep 11, 2026 at 4:24 PM Isaac Manjarres
> <isaacmanjarres@google.com> wrote:
> >
> > On Wed, Aug 19, 2026 at 10:24:28AM -0700, Andrii Nakryiko wrote:
> > > On Tue, Aug 18, 2026 at 6:46 AM 高翔 <gaoxiang17@xiaomi.com> wrote:
> > > >
> > > > Thanks for the pointer. Understood — no new NR_* counter or
> > > > /proc/meminfo entry.
> > > >
> > > >
> > > > The remaining question is on the consumer side: Android's Lost RAM
> > > > accounting would need to enumerate all live BPF ringbuf maps
> > > > (BPF_MAP_GET_NEXT_ID) and read each map's fdinfo memlock to sum them.
> > > >
> > >
> > > For BPF ringbufs specifically, you should be fine just iterating all
> > > map with BPF_MAP_GET_NEXT_ID, getting its FD with
> > > BPF_BTF_GET_FD_BY_ID, and then passing that fd to
> > > BPF_OBJ_GET_INFO_BY_FD to get map's size.
> > >
> > Hi Andrii,
> >
> > Thanks for the suggestion on this! I did want to express a couple of
> > concerns with this:
> >
> > Scalability
> >
> > I counted the number of maps on one of our devices, and there are 112
> > maps, meaning that there will be between 224-336 syscalls with this
> > approach. eBPF is becoming more popular, so I'm concerned about how well
> > this will scale, if we have to invoke 2-3 syscalls per map.
> >
> > I had a test program that implemented your suggestion, and it took about
> > 2 ms to identify 39/112 ringbufs. As the number of maps in the system
> > grows, I'm concerned that the latency associated with computing the
> > memory usage from ringbufs will become even more expensive. This is
> > something we had an issue with before on Android, where we had to
> > iterate through various sysfs files to gather wakeupsource metrics [1].
> >
> > To improve on this, I was wondering if we could expose the ringbuf
> > memory usage and potentially other bpf stats through bpffs
> > (/sys/fs/bpf/stats)? This counter could be a lightweight counter that is
> > incremented/decremented on ringbuf allocation/freeing so that when it is
> > read, there aren't any expensive computations.
> >
> > For this specific metric, we could just use a counter to track how much
> > memory is being used by ringbufs and have userspace read that. That also
> > brings me to my next point.
> >
> 
> I just don't see a good enough reason to single out ringbuf maps
> specifically. other map types also use memory, why would they be
> excluded?

I was looking at ringbuf maps specifically because they allocate memory
for the ringbuf via alloc_pages() and aren't attributed to any counter
that is exposed to userspace. The other maps use either the slab
allocator or vmalloc() to allocate memory, and those entries are visible
via /proc/meminfo.

> If you are worried about too many syscalls, look into map iterator
> program types (grep for SEC("iter/bpf_map") in selftests). That will
> be super fast and way more generic than what you propose. You can ping
> such program in bpffs and that will be you custom /sys/fs/bpf/stats
> implementation that you have full control and customizability of
> 

Thanks for the suggestion; I'll look into this and let you know if I
have any questions!

--Isaac

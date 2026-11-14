Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794617742;
	b=Er5FusHaI6BHrTkOmzwK9KJE+dpDwBTUj1LhXdGMyAI/yBIDTk1iEaBdC9YJGf6YiCtQ
	 Ovw5QNT8ho6m/rRC7GY91LYw0BCEUSwqlgp4E4LWN7ks48E4ZTdNrxsyq6EnqxsjcN3Hj
	 bu5UsqbevPRi61Pf49QK6nHmNbYhQwBc7PrULo5F4QO+o/43sSJn53tQFhE1xwLcu8hze
	 7unUp1cCzBY0NTdgap0lji2UFNARf1PkpBDiq5LxGWJDOPiwP1ShfRW5WrNAtSVTtfgQw
	 Z4di0q1EF2qv5zMAWbNrNiYLHnr6iWCTMDTc3MLhojAXoKxaHiuN3UGw5od0jPXcNJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617742;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Dc2wTdruAX7BIRkm9K76z8EN8ORqfaiMn2o2Hl2qzx4=;
	b=YTG1lGfP5xBRFTTbCh5Rxa+vcqZTSm1qLKHjoMUCdMGeBZQE1aY3abNs9v3PVouAi2e3
	 79cbvDYmNqnDKyHnih3FgOH0I4NfP3gjVrDcx1n/lzl1hurCOOp9Vzt3XZQHKgact2jw/
	 5ldo85V0hZ30V/x9371il3/zkN6156+kLr+hyEPLmQP2srIefZLt2h2gi3Rgz1wOlK3jf
	 MOXupBn1IY0TNoWhf4Hi2Xs7Pi6TwlSqeQV9+VB6avY7cqzASSHiuYMqN+cdzSn4NtNma
	 LoUZabvbYvPaVk0oNPSaQ7+rjJv3tqlldklzllSOhdG9u0dmoTKc7OGZXgAgsHtRRag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQTicRg7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mRQcf5qM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6A606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F6A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQTicRg7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mRQcf5qM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794617741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dc2wTdruAX7BIRkm9K76z8EN8ORqfaiMn2o2Hl2qzx4=;
	b=FQTicRg7QOaDlKix54PDfNFKynLoQ7fs/fh9qJCHOuUOwp82UXE7rdOsGLq2CU+66vsTpx
	tz9xBOX7cwREJO6OsW6ZBJKVvvALlL0Zk5pj0vKhR9pYp+PlXt6CBitlgPjwODHqL3eVtG
	9wd1oBEkbT7i+9znEg2bMGn6pk1zsvc=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-TzMNzNXEOO29BorD9mVnbg-1; Fri, 13 Nov 2026 19:55:40 -0500
X-MC-Unique: TzMNzNXEOO29BorD9mVnbg-1
X-Mimecast-MFC-AGG-ID: TzMNzNXEOO29BorD9mVnbg_1794617739
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso6669194eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:55:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794617739; cv=none;
        d=google.com; s=arc-20260327;
        b=Tfj52xoRVri47Rw3ExBEMWAnhltVMbLgUYv5jyjcJ9d/C+TEHg1A1q9m4Zs7OMy5b2
         t5RDHBwbACzkSn0ZgBB1cAOG6A14rmlxaWTjtcJtr58spmcIYcyfxlP9zgoHV8GkXDQf
         1d3G19q2WTeVnh236TNAtRenBojUAY94sFCL/gxPF16ljHKBLrAUKbz/S0MqKmpn5EXE
         xD+bQ1fIVS9VlbQiFJUrYb/iQxxcl8tC0/AlGh9t7wJ6JHJsoJXDuQo271efR7fCPJen
         1gtKdZM40FrXcBwGRV12VHkayl3zDBWb6U4Tsv+xghjD1fmOiUdko03NE03rPBZfmHFC
         MSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dc2wTdruAX7BIRkm9K76z8EN8ORqfaiMn2o2Hl2qzx4=;
        fh=fW1czGqTpNy2idIjTSBmXFalo+XU5QpLSeZLJ9llegc=;
        b=A4bR2JLgTgOW3bASfRY8b6XVFKwsmYVNVLSK336YEY4MMkBoRvBoW9GvhYVLcDs1kj
         JpPMvkyGrXPLvBkAVfzEJs/lPkPEPE7JwrGgfzrEILA3mkGpzTLqnUGiZCF9t5oMIBwo
         edRF9n5NoYhMzOOk9PshLB7C8ofIPYYbRUH9ahtwcqnyozLv3bR6qckw8ywd75RD5A2H
         1o2/g+vanATLk1/3Deg+DMys/OesZL75/VSOEueHUqcAM3J0Lcxmfuy3GIFfGKF7s8rt
         igBuGU+40yF0eTKIaoKDHQO4AQty0FGBAd0E4Ne02uBE2nmmwjzNRPrQJXgvecqPcGRe
         RJFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794617739; x=1795222539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc2wTdruAX7BIRkm9K76z8EN8ORqfaiMn2o2Hl2qzx4=;
        b=mRQcf5qMnbUKYpwoV5NT1FTeFOepLmFNU5Mp2eivoEnpH664hlb0OnRhJ/JJKDFxoc
         VzmfHkuUvxkxK2tse0s6V/TYhEo5DIDaW6BdrF9rRrkoYjnxWr6pXxT7il7YkmPyhAvr
         dHzNi18MrIb1c6r1C9/Q7wgLdf1bEWYoY0c/qe1IxXJ/X+yVzp4kvnpwgI5sqzTVV4Tg
         mPwwiBAPq88yd6R+YwRFSAx5F2eRpv5G5Xgp51qSPx5CXaotdn1TZXBD0UaHKMuV7r6e
         KLF1ANvo7v5+c2j6Z2FGDRVw77MA69gzteQZNBIb+erPyL5UsWP4EgKp3VD3GP2KRnoN
         lhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617739; x=1795222539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dc2wTdruAX7BIRkm9K76z8EN8ORqfaiMn2o2Hl2qzx4=;
        b=y4g9a07k08JR0/vktXMqy7lv9DTC13BJktF0/0S7IZZFeF4dkDYksdYdB9cVsLXw2v
         GOANo5mEKMA/cwrFgIDwxsbJ/TZEXryZWbTbQ1EqZRYDZmezCJGdRlo5aUQL7Q9EPiEb
         vTmYZuBo1w8dN08DyJQsOe3uk0AcvMGhAdIJk6hWhvy7KXR5Ov7AlDhB9YtmYWZZ/lmR
         LphBepnPzp86FQ3h/IpHaJxhY+g7rsnIPNQlYE/4wDU7Q9LDT17l9bxEkFfeQpgKlfA4
         zMTKCnxfMBciGhlK3knagMT7rKGaj/SHiy4D5e9rVgH4UmSnhj+slBlGD81jIDEyExYi
         xeWg==
X-Forwarded-Encrypted: i=1; AL+hErE+Y62Q4KbJnkkGc+zUhxCXyPO/4zlc9ye1YjElQZfJcR00IrmlHk2Z41NsJ1bo7HhcviBuFx31sPNsBL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z97uXnzhjFGRHbD7qFiXlO/bfreQ8YTI4aoVdy3vLhyOl93nbKQ
	vV21mihUozx4yEPyC/lqP2zJ+n5kyOIpFurm2yeoK2SPA85dUhfDQc6MrnJpN9RGoI4Mx/vwIO9
	+nNwHGYGndc3NMDw/VpCgyPmOx6d+rtCGSSK8ocCc8gf1hgGK4mXAFNdVip1rnq8JW7vhym/Sji
	DJdowarTOdeZqtEt4Kz/PsSJqmz/KqGs7Gd7IJguyo
X-Gm-Gg: AYBFou14QgJvjUZW4tUUYd46fXI4MUjfpQVFN7IQDx5gA8cktYVYXs8Cu1O8fVR/EBG
	kmNoV9eJg6+BdSh3CPMjQQsR17PCiyeCc8WoKXnRe+1pgMuve7xNtu/yB9MNEXXyZvuIMdr8WRK
	73hJW03ocnSuxXed7Q4S5x8G6h784nEzKTz+FSMiKU71tacxZcCxijz3/s
X-Received: by 2002:a05:7300:d80c:b0:36e:a11a:b2f1 with SMTP id 5a478bee46e88-379679e4a4dmr3265025eec.30.1794617738451;
        Fri, 13 Nov 2026 16:55:38 -0800 (PST)
X-Received: by 2002:a05:7300:d80c:b0:36e:a11a:b2f1 with SMTP id
 5a478bee46e88-379679e4a4dmr3264978eec.30.1794617737648; Fri, 13 Nov 2026
 16:55:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1775065312.git.tim.c.chen@linux.intel.com>
 <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com> <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com> <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
In-Reply-To: <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Sat, 14 Nov 2026 01:55:24 +0100
X-Gm-Features: AclHuK9M0p4MGbLVBDXvR9zhZaFVmze8hLn4u5MjUufwNhaSKppwmVcqiVoIUlM
Message-ID: <CAE4VaGCSLPa3VJWbYGTtCpOS1L0MkQs-5kquSrQz5arjK=U-Ww@mail.gmail.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, "Chen, Yu C" <yu.c.chen@intel.com>, 
	Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Hillf Danton <hdanton@sina.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Jianyong Wu <jianyong.wu@outlook.com>, Yangyu Chen <cyy@cyyself.name>, 
	Tingyin Duan <tingyin.duan@gmail.com>, Vern Hao <vernhao@tencent.com>, 
	Vern Hao <haoxing990@gmail.com>, Len Brown <len.brown@intel.com>, 
	Aubrey Li <aubrey.li@intel.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Chen Yu <yu.chen.surf@gmail.com>, Adam Li <adamli@os.amperecomputing.com>, 
	Aaron Lu <ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>, 
	Josh Don <joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>, 
	Qais Yousef <qyousef@layalina.io>, Libo Chen <libchen@purestorage.com>, 
	linux-kernel@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Philip Auld <pauld@redhat.com>, 
	Joe Mario <jmario@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tim,

> Was THP enabled for the MG run?

Yes, set to [always], and the MG working set is essentially entirely
THP-backed: AnonHugePages 27,738,112 kB of Rss 27,748,260 kB
(99.96%), measured mid-run. That also explains a number we had not
reconciled: 3.3M pages migrated from ~20k hint faults (160:1) is
only possible with 512-page faults.

> In the third run, did grp->footprint become non-zero after the
> sweep completed at t=33s?

I had not measured footprint in that run, so I re-ran the combined
trace until a sweep completed (completion is stochastic on this
workload: 0 in three earlier 43-53s runs, 1 in a fourth, 1 in this
one, at t=37.6s of 43s). The moment the scan sequence advanced, all
64 tasks ran task_numa_placement() within ~4 ms, each adding ~105k
pages: grp->footprint went 0 -> 111,785 -> 215,225 -> ... -> ~6.7M
pages, i.e. about the full working set, crossing the 27.6k-page LLC
threshold at the second placement. The aggregation was withdrawn for
the remaining ~7 s of the run.

So: sweep cadence is the problem and the size estimate is not.
Agreed. Our point 3 (0.1-0.3% coverage) was wrong in the THP
reading: the fault count is small but each fault carries 512 pages,
and a completed sweep's estimate is accurate.

> I lean toward doing both: Fix 2 for the cadence, Fix 1 for NUMA
> balancing off and for the first sweep. Peter, is the RSS bound
> acceptable when it is used only as a gate and never as the estimate?

Both fixes look right to us. Fix 2's predicted trip point matches
our data nicely: 54 THP faults is well under a second of faulting
once scanning starts, which lines up with the ~1.8 s warm-up we
measured before grp->cpu settles. With Fix 2, the MG run would
likely never aggregate at all. Fix 1 closing the NUMA-balancing-off
gap is also what our numa_balancing=0 test argues for. From my
side, the RSS-as-gate-only framing answers the April objection: it
is never used as the estimate, only as the bound while no estimate
exists.

> Would you consider testing the patches when we post them?
> We will CC you.

Yes, absolutely! We would be glad to test them. Please count us
in as early testers.

One data point for the validation matrix: nr_running_avg is a
smoothed average (~89% of the busy threads in our MG runs), and the
threshold is 80% of the LLC's CPUs (115 on this server), so around
128 busy threads it sits right on the line and aggregation becomes
nondeterministic run to run. We need to keep test thread counts clear
of that zone on large-LLC parts.

Thanks again,
Jirka

On Sat, Nov 14, 2026 at 12:07 AM Tim Chen <tim.c.chen@linux.intel.com> wrote:


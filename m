Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAC3546EA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479438; cv=none; b=LL5AFDhrFgMGyMwH7PQPm8prof1R90A/wjfjMG5K1d8v39rlVXgiF30QeHSJeIIkn5BBDFKPpTSEdtTqoCC6B8QgHAY0BDlOCbEWFEbkRjT53JkBHXy2bdhesW3AC7mOD8mfljME02fLZa6YwoYEjlWEovdzeH7DlWXkm9nihYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479438; c=relaxed/simple;
	bh=ktXBKo9qRrHQGe9ioJQ+KZslRf9Yl8uhcjxXZRkrkts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LkDvMO/z62qn9Kg+eVG4GqJxKzg+n3w4hm9wFoOvHkx2GiI7oPi1LmeEXsHhZ9MTUSLOm6A8kfwBoz2OV1/v/kBY4xGq0E+1xm8jH+HptQasi+8zNHCs3nLWInBL4NjSBeIegopzDzttTrR9ZQ+0WgSMPltv1dYWIM4/F0cKxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=2S4cFN2W; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="2S4cFN2W"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cbee846deecso717554a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1788479434; x=1789084234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcb1FmSMiMhe6mHwcvPWRPOaUi1fkweD2+2nkEYu3ww=;
        b=2S4cFN2Wxd7j1hNt7ymMU/ICD4hEC3tnekwfemdo3JGZfsrRG9Ypk2NZmeM7hI3EdT
         FJmwzH0rYAfDyl6gBaa7UKHVkfcLfhzcJJVEe93BtlUxjfqAEd/n6H6V7labbZJmfoU6
         jkQad145VvpNlcbM5zdSNKs7hJVQuE4ylSAomXM5vfeF27ZBm/qyOU3I6iJdFA+hVd8H
         8AShXFTY2UgwGnzKDxL8JfN0teGii0MIFxKK2dVP9c0INPWdXLwk5lrEEpqH3Ev0MNxc
         8HFHAW4Y5gy6U6/gHj+gFnrK9dkkbT0+yzlC73W2ITQi6beLk3BNOW04BGo2eBRM2Fh7
         wvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479434; x=1789084234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mcb1FmSMiMhe6mHwcvPWRPOaUi1fkweD2+2nkEYu3ww=;
        b=ltSMLFxGgWyl2xtFiyp+sx+15rCB/7zrU7wr9oUVFj5pqFQNCsXFNSckSZYjSvdFst
         T4xAWNm2KojT3Ub3j0JqXDIffqGiKeT1/lKMepZ2GskAcMb/7WFVWSmR7GdYz8FjRY5J
         riiN2xP240HajqoTi5LaHfs/XF6kzS22MxWWkMrz12e72QSng1nuJ05u+yHVy58Ts+GH
         ALVp+jolACf8zF/lEGoKPo8aB1ok4iEILFVU4NKdQhhVkHAEvxxYSsqiLxO6TfjvEUpb
         Y3cizF4Ti0Qzav8CdgDASafeLQrCsshUpTEd1pWS9XwQJnDuozKg9G7KeOLMyhg67xKZ
         qj0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzUTflTA8GnAmvGmwRsCVB/BMyhzu5scWYBqzR+bTJPsG5L6og3s9OLPeygVfm5lIMiJtpqB2aEwiBnTm8=@vger.kernel.org
X-Gm-Message-State: AFuF++nQf19vBFRKYmtvlY8lQ/TXb8xfg5yaG+5nDQbmuitGFegWBSUT
	RCw8miSdOqfcvZqRx48sQj2vEoo3gEALb+S5U3Bqj9KSbAkar5aQ88PRLaEEhinDXZtmcr+X74+
	bKQgUzL/f/WGQ9pjY/kcrbu0geDmdPYa3yYvL
X-Gm-Gg: AYBFou0Q9/c78qASQdiSB6TGAfbaR8izATVxi9PVMNu1cHFWOl9UBMvSt6Gdb7lT2DP
	21p2w83zKctJG2gc5fcQxExp9kALRDh8oBRGZnl4q438CJcW+FWFgvPjvgnmjzd/vBvujElKubF
	GipXVjXcocgZh7jZffWshPQiqUyDDtBobT3y0haYE9doUV7uMWEfdJcmJFpbiogsYbutQoQqSn3
	pxSWIddy8rspaAikbh07Hbf2Gtkk9GEyWVntbHHH7Fxfco0dgk7Yw8nEATYkIUq5Uy/lXRgcUab
	goZlWU8QbBeGn1kUN6Te3pFQO21yederzoSE640XH/axdYFkGLOpJ3fWGCV/ybC2CKqy90rkoeN
	hDXDrAdjtqZUOF1MughxUrK6zX0sj3ELAQ8+R/vs=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr3473262a91.20.1788479433717;
        Thu, 03 Sep 2026 16:50:33 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b15aca3fcsm1783706a91.0.2026.09.03.16.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:50:33 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 0CCDE340ACC;
	Thu,  3 Sep 2026 16:50:33 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: Re: [PATCH RFC 6/8] SUNRPC: Reduce rpciod workqueue contention
Date: Thu,  3 Sep 2026 23:50:32 +0000
Message-Id: <20260903235032.960219-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dc18f84a-f53f-440f-b0cb-f27b44e090eb@app.fastmail.com>
References: <dc18f84a-f53f-440f-b0cb-f27b44e090eb@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. I did some more testing with v2 and collected the requested
information.

> 1. Does v2 of the series behave the same way? v2 dropped the
>    patch that ran the first RPC states in the submitter's
>    context, so the rpciod traffic pattern differs from v1.
>    The same smt -> cache_shard -> smt toggle on v2 would tell
>    us whether that matters.

The v2 series behaves similarly insofar as some runs see ~15 GB/s and
other runs see ~45 GB/s, but the low-throughput state no longer appears
to be directly controlled by the rpciod affinity scope.

I have started runs with both smt and cache_shard, and with both scopes
I have seen all three of:

    1. start and remain at ~45 GB/s
    2. start and remain at ~15 GB/s
    3. start at ~45 GB/s, then abruptly drop to ~15 GB/s

I have not found a discernible pattern for how long a run remains at
~45 GB/s before dropping.

cache_shard does still seem somewhat more likely to give me a ~45 GB/s
run, particularly as uptime increases, but unlike v1 I can reproduce
both good and bad runs with either scope. The deterministic live
smt -> cache_shard -> smt behavior I reported for v1 is no longer
present in v2.

So the low-throughput state remains with v2, but it no longer seems to be
from the SMT affinity change alone.

All captures below are from separate runs with the scope set as indicated.

> 2. How are the RDMA device's completion interrupts placed?
>    Please share, on a bad run:
>
>    * /proc/interrupts lines for the device's completion vectors
>    * the smp_affinity_list for each of those IRQs
>    * whether irqbalance is running, and whether you've pinned
>      the IRQs by hand

There are two ConnectX-7 devices:

    mlx5_0 port 1 ==> ens3np0
    mlx5_1 port 1 ==> ens6np0

at PCI addresses 0000:2a:00.0 and 0000:ab:00.0 respectively.

The substantial completion traffic in these captures is on
0000:2a:00.0. Its mlx5 completion IRQs are individually affinitized to
CPUs. For example:

    mlx5_comp0   -> CPU 0
    mlx5_comp1   -> CPU 1
    ...
    mlx5_comp23  -> CPU 23
    mlx5_comp24  -> CPU 48
    ...
    mlx5_comp47  -> CPU 71
    mlx5_comp48  -> CPU 24
    ...
    mlx5_comp62  -> CPU 38

The affinity mapping was the same in the good and bad captures I took.

I have not manually pinned any IRQs, and irqbalance is inactive.

I have the complete /proc/interrupts and smp_affinity_list captures
available if there are particular vectors or deltas that would be useful
to see.

> 3. Where is CPU time going on a bad run versus a good one?
>    A short capture of each would help:
>    perf record -a -g -- sleep 10
>    perf report --sort comm,cpu --stdio | head -80
>    In particular I'm interested in which CPUs the kworker
>    threads for rpciod and the ib-comp-wq threads run on under
>    each scope.

The perf results aren't showing anything useful yet. With the requested
--sort comm,cpu, the top of the report is dominated by perf itself. Without
that sort, the top entries are things like cpuidle_enter_state and
cpuidle_enter.

I'll keep working on the perf capture and follow up if/when I get something
useful, but I didn't want to hold up the rest of this on that.

> 4. tools/workqueue/wq_monitor.py rpciod, sampled for a few
>    seconds under each scope, would show whether the pools are
>    evenly loaded.

I captured rpciod monitoring data from four v2 runs. Here are windows from
each.

cache_shard good (~46 GB/s):
                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        27613426     3    534.5       - 1699488      16       0 

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        27817822     5    537.3       - 1713539      16       0 

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        28027937     2    540.1       - 1728063      16       0 

cache_shard bad (~15 GB/s):
                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        71754056     2    932.1       - 4767531       0       0 

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        71825047     0    933.9       - 4771333       0       0 

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        71901102     3    935.8       - 4775677       0       0 

smt good (~46 GB/s):
                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        17036137     2    144.9       - 4993757       0       0

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        17220514     0    146.8       - 5064827       0       0

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod        17397194     3    148.8       - 5132231       0       0

smt bad (~26 GB/s):
                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod         4937072     1     43.2       - 1407321       0       0 

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod         5037193     4     44.0       - 1432686       0       0 

                     total  infl  CPUtime CPUitsv CMW/RPR  mayday rescued
    rpciod         5138509     4     44.8       - 1458079       0       0 

> 5. The workload itself: thread count, I/O size and direction,
>    number of mounts and RDMA connections, and the mount
>    options (nconnect in particular).

Workload:
    elbencho --iter 1 --threads 160 --files 16 --size 256G \
        --block 1m --dropcache --iodepth 64 --direct --read \
        --lat --latpercent --log 1 ...

Mount options:
    /home/ir/exapurity from 10.71.61.129:/exapurity
     Flags:	rw,relatime,vers=4.1,rsize=524288,wsize=524288,namlen=255,hard,fatal_neterrors=none,proto=tcp,nconnect=16,timeo=600,retrans=2,sec=sys,clientaddr=10.230.36.66,local_lock=none,write=eager,addr=10.71.61.129

It's pNFS over RDMA with one client, one MDS, one DS.

This is a pNFS flexfiles workload. The MDS connection is TCP, and I see
16 RDMA rpc_xprt instances for the data-server traffic during these
tests.

> 6. The base kernel the series was applied to, and the RDMA
>    device and driver.

For all of the data above, I applied the full v2 series on top of:

    940de590b839 Merge tag 'hardening-v7.3-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux

The RDMA hardware is NVIDIA/Mellanox ConnectX-7 (MT2910, PCI ID
15b3:1021), using mlx5_core/mlx5_ib.

For the active interface:

    driver: mlx5_core
    version: 7.3.0-rc1-mainline-bad-v2+
    firmware-version: 28.47.2682 (MT_0000000838)
    bus-info: 0000:2a:00.0

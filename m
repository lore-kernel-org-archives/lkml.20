Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com [209.85.208.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24093839BD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789305270; cv=none; b=P5WXY/sQEbMCrbjRV7UC/GbOK84S/btGvDQ2q9vtfkzbJaLyEvj+wyjTPt9JlM72ayhZrN6kCPazDXhZ0d0FLRUppYBb/RZQ8swtJCiNyOXvSZGNqtIzdxkTUTj/o7lK90W4Sy7nCViy9EvaNIp4i838OKSA5rhEVutfBX1fH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789305270; c=relaxed/simple;
	bh=h8GqD8eT8gEKNyf4N62nMzzDjn8V+dpPWDDFnP+eS4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TsR+QqsHAdB5+hfvSI0aVdQ2pHgG+Zmy4P70XdAqXFXz6H0YfaaWrGOYfFyvHYveeeNm5/MioUeTmyrsUmcpiT5VbAKF6Q34+0kOTwPJ96Pcq1F9gPqP5T42zU0MqelcHcyjayQ3TsY6RhC+N/zYItjNTepuGDSO9utCvqyyd5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Y721YSyK; arc=none smtp.client-ip=209.85.208.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Y721YSyK"
Received: by mail-ed1-f100.google.com with SMTP id 4fb4d7f45d1cf-6a9bd4db6ccso2681337a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789305267; x=1789910067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkWYFlgXqLkfZO9+TzU0ObUDSvdImYwWMpTtrvE8A2c=;
        b=Y721YSyKz8+Cmg3ZxjvuUN9LyW8J7UhWLUSbBcaehLlBmzdPcTbO6s4e5eoWbcZR3k
         as/vK8sD7qqh9RrWHvTieZYF6QiTh7Df6/xTQKEWK9RSBXj5EJekvOQ4plCX9RMjT2RO
         f2SXO70ZKDvzlYaEAGK6Zmj7b/go7wvmXoT3Ce1ZoA5IM/ndTKXNJ2VGlf9hCdhQUdpz
         wIBAeKIinhuA23fTiZ0TqQpMyzBQvaESmYW7466DJL0c/lKZZbbXjKVG3ukp+qqxKTEQ
         Mei8O8uwOKEOWtewSOawZY4tvoVi0pvBtoFWIwo71/8Est34weuRXcvOxE3F8mHokauj
         guKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789305267; x=1789910067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkWYFlgXqLkfZO9+TzU0ObUDSvdImYwWMpTtrvE8A2c=;
        b=E2FmsncrM+4R6WlGIINZ04t+sCG2KCLL626WV3xDnNnjw2XUrRkQlx4dSS2u58jE/s
         TKVnZz8+yojxjFzJvYRz2hDmBeY61LsPhJOXlSNhFgWvVb8TsrZdkbjocmCBINoBbCWU
         ZiKfrEwG1ztIloYOvU8mD6qMeR9mS3NXvz1vmDGTUEMhaJs83uHpSHMeclLol8vsKjSN
         8E7FApqnpumNPRkNAmJQ0D16S5k7+OiIjOPbW1+P1K+e7NnAbHgPaWAYG0T4KOIY6PVe
         pqLXJz9ByIDs5n/IUnxXQCzeKAwZq5ex4X/hdbaTLWIU/lPJ8TwCYy9VZRFL8CqPWAH6
         BCgg==
X-Forwarded-Encrypted: i=1; AKwUvBxzOwOyHKU6yBvQJ47DGvbMRkG4e1rt2zA1pj8FqNeEiR2d7HUdeOQrnz1Jo6/LML60kldareuDK5wjdUI=@vger.kernel.org
X-Gm-Message-State: AFuF++mCbDGTzjhHzZxLN/QbunL+QzFD3pwIxyliShXCnYTzPaJb+Slx
	QBalkH0eki6+raph7DKfjK+Xq1EjhizUsMCPTsKFzbRSx2G/pls5I4ZowU9nufqWlNdbcSwlMMO
	TdfiSvqQRNso1Qz9IfK/JVDx4HVaIGchYJvWb
X-Gm-Gg: AYBFou07okDKs/vSS7Hb/j/5z2Zn7qJM4aYoMtpx8Rz4gY4Pg8TfHGK20Hp9FrJeyga
	Q1HO8QJTg/46agPRaDTnCaLJp3i6b9o+wSaeoa81pMynaTWoEPGrxC1EJj1G4Gp5RRXMoZkt6x2
	QH79Hhu9vIAFBxns68K7531aBDyVAPCNezZDUdegPeM2EEkBhdQvEqoRNLLiLYgSfL/Rrt/pZzT
	PSJMEhyN67t3D5fjU41yheHGQc+99aoFKabxd4K1cccOJg1Qk5fPXTw6vgfqwJWboxeNdq4Bsb2
	qLr5b7GiQEE6N8LTg69VD8ApcShQFVxkfXGc6lBGbNgY59ExAgAhzZzjHGxMWtkfdbzI4kORTEa
	ZhkL4hWriN50J1iSLNKWSUeKmiqa66qPtLKdE3A==
X-Received: by 2002:a05:6402:3509:b0:6a9:adea:42e2 with SMTP id 4fb4d7f45d1cf-6a9b56cf69emr6512366a12.39.1789305266844;
        Sun, 13 Sep 2026 06:14:26 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6a9b5830390sm2705326a12.2.2026.09.13.06.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:14:26 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 0E2FC340245;
	Sun, 13 Sep 2026 06:13:55 -0700 (PDT)
From: tmenninger@purestorage.com
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
Date: Sun, 13 Sep 2026 13:13:54 +0000
Message-Id: <20260913131354.1026639-1-tmenninger@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e18e121c-5c05-4caa-96ea-e0886594ee07@slotpi15m67>
References: <e18e121c-5c05-4caa-96ea-e0886594ee07@slotpi15m67>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> To separate the two, keep the all-local CQ placement and pin the
> workload to node 0:
>
> numactl --cpunodebind=0 --membind=0 elbencho <same args>
>
> Sample the same nfs_page counters and perf lock -l over the same
> 10-second window. free_slowpath should drop toward zero.

I waited for an all-node-0 CQ placement and ran elbencho with both CPU
and memory binding to node 0. mpstat showed the NFS/kernel work
concentrated on node 0.

The 10-second nfs_page deltas were:

                        unpinned       node0 pinned
    free_fastpath:     +49,161,373    +119,680,629
    free_slowpath:     +70,391,872          +8,999
    sheaf_flush:        +1,582,440     +13,436,760
    barn_put:             +673,877      +1,596,175
    barn_put_fail:         +26,374        +223,950
    barn_get:             +673,860      +1,596,219
    barn_get_fail:      +1,199,576        +224,090
    alloc_slowpath:              0               0

So free_slowpath does in fact drop essentially to zero when allocation
and completion/freeing are kept on the same NUMA node. That seems to
confirm the alloc-on-one-node/free-on-the-other explanation for the
large free_slowpath count.

The dominant slab lock was still heavily contended in that run.
Filtering it by caller gave:

    2,907,948   __slab_free+0x126
      269,174   get_partial_node_bulk+0x9c
      175,965   __refill_objects_node+0x4d0

So roughly 87% of the contention was still coming from __slab_free,
with the remaining ~13% split between the two refill paths.

I then tried to answer the remaining question of whether the remote-free
behavior actually bounds throughput or just consumes CPU.

I ran several trials with the workload pinned to node 0, node 1, or
left unpinned. In this set of runs the unbalanced CQ placement happened
to land on node 1:

    workload      CQ placement      throughput
    unpinned      balanced          46-47 GB/s
    unpinned      NUMA 1            43-44 GB/s
    NUMA 0        balanced          45-45 GB/s
    NUMA 0        NUMA 1            42-44 GB/s
    NUMA 1        balanced          46-47 GB/s
    NUMA 1        NUMA 1            46-47 GB/s

I did briefly get a 46 GB/s NUMA-0-workload / NUMA-1-CQ run after the
machine had been up for a while, which made me question whether the slab
contention was actually on the throughput-critical path. However, after
rebooting and repeating the experiment, I could no longer reproduce that
result and it returned to 42-44 GB/s.

For NUMA-1 workload / NUMA-1 CQs at about 46 GB/s:

    free_fastpath:   +119,574,437
    free_slowpath:        +12,127

For the cross-node NUMA-0 workload + NUMA-1 CQs, free_slowpath becomes
large again.

Taken together, I think your explanation is correct, that the workload
allocates nfs_page objects on one NUMA node and rpciod completes and
frees them on the other, those frees bypass the sheaves, hit
__slab_free, and create the slab list-lock contention. Keeping the
allocation and completion/freeing sides on the same node makes
free_slowpath essentially disappear and restores the full throughput.

The one remaining oddity is that the severity appears somewhat
uptime-dependent. The cross-node placement was briefly able to sustain
46 GB/s after the system had been running for a while, but that behavior
disappeared after reboot and the original 42-44 GB/s result became
reproducible again.

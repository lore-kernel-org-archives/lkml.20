Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325760;
	b=esiDKwRpJcP1kBLc9LqsQhPGmFWIhkCRxNQqS678deKF+sPX6deSsaGzHJqXUqZHUEGl
	 WNX707Q4DLheSRvtjRI4RooTCVIa5w/cbwccIW7bXMEoccRsqCaSsDkgGFgO3iX0Won7Y
	 5x5QYGeER9W8koJErNYT9eaEoUEBWQbpDDlg8hwhEeyg1j9XGObRCHMDXWj9xJfPQXonS
	 /nnZs3tD79AQSIOKGNIfZZ/BPC6QrJRLse0b1CvAYwvQTFsZIIw7SUjjateuQ913Gdzd2
	 +7CY8obOmtLTRv2z5BoyZymqCPMv3jKNLDEmCDhOvFZgNDNaPEm/QgItEyDWgXNHZ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325760;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GvgzEb2UEt0lDkhOWoviEIQi70A0ynQFKu+41cMZqRI=;
	b=2ktuXEacugMawlHEcUdW61q1WACKMLVFaHvDJkPgLp04ZLLygGTsTtzjPOg+vmAeKbh1
	 rYztegmZ5R6J+sU0nFypLNTd308+MFXjCcUnyDZPULzTrh7UX6JIBQi6zILgeBoszX0NW
	 FW3cjkSjrc+LFprSjH26Z+OoQkgYr9KFMpdDhDl5w/CWVZbI4nzzch0ThbACy7bxxxMxL
	 QDaSJVvI9TZfekCe3l2IOw23iE8Fd0l2tOH2pkMMBYT3aQrUR9adLWlsLfVK0dQvVXnCv
	 nl95wuPDYjPUKlrBEou/7ob/fVGnCKV3wNWkCJct0/NSvZXm1GMkwcrkJbZ3wZKj0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="e/raf/wY";
	arc=none smtp.remote-ip=95.215.58.205
Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC08606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC08606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e/raf/wY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PiJyayPM7vNnZ3shaWarAAoNfXv1NQQo8Z036gp8oXY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793325757; v=1; x=1793930557;
 b=e/raf/wYx+rPGSeQcvsrcHQ7+PkBnUZFvmo7noB9g27irMErcBBYqoO9GjeV7RwG/rj9zNaq
 AesCK9qXnEyaco5DJ/ntUWjM0d0BQKVUBDAhD3n+xk4Yz9GkMRoIOu2cT0EGOjUefLV0ZRPRTZA
 spOb4mIHn6xipogGm1zUk/t4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 387f32f4a38555bf;
	Fri, 30 Oct 2026 02:02:37 +0000
X-Mizu-Trace-ID: 387f32f4a38555bf
X-Migadu-Flow: FLOW_OUT
Date: Thu, 29 Oct 2026 19:02:35 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Boris Burkov <boris@bur.io>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Shivank Garg <shivankg@amd.com>, 
	Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on
 cross-node migration
Message-ID: <auP6rl655zYaJkIi@linux.dev>
References: <20261027043214.2248986-1-ridong.chen@linux.dev>
 <20261029180326.84ae7b2c1f63f016c66bd28e@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029180326.84ae7b2c1f63f016c66bd28e@linux-foundation.org>

On Thu, Oct 29, 2026 at 06:03:26PM -0700, Andrew Morton wrote:
> On Tue, 27 Oct 2026 12:32:14 +0800 Ridong Chen <ridong.chen@linux.dev> wrote:
> 
> > From: Ridong Chen <chenridong@xiaomi.com>
> > 
> > NR_KERNEL_FILE_PAGES counts page cache folios of mappings flagged
> > AS_KERNEL_FILE (currently the btrfs btree inode).  It is a per-node
> > counter: filemap_add_folio() adds to folio_pgdat() of the new folio and
> > filemap_unaccount_folio() subtracts from folio_pgdat() of the folio
> > being removed.
> > 
> > __folio_migrate_mapping() does not move it when such a folio is
> > migrated to another node, so the source node keeps the count forever
> > and the destination node underflows once the folio is freed.  btree
> > folios are migratable through btree_migrate_folio(), so demotion,
> > DAMON-based migration (DAMOS_MIGRATE_{HOT,COLD}) or memory offlining
> > all hit this.
> > 
> > Reproducer, on a QEMU guest with two memory tiers (node0 is DRAM with
> > all CPUs, node1 is a CPU-less slower node described via HMAT) and
> > /sys/kernel/mm/numa/demotion_enabled set:
> > 
> >   1. mount a btrfs and create 20000 empty files, so that btree folios
> >      are cached on node0;
> >   2. echo 2G > /sys/devices/system/node/node0/reclaim, which demotes
> >      them to node1;
> >   3. umount and drop caches.
> > 
> > nr_kernel_file_pages in /sys/devices/system/node/nodeN/vmstat after
> > each step:
> > 
> >                   without this patch     with this patch
> >                    node0     node1       node0     node1
> >   1. cached         1868         0        1868         0
> >   2. demoted        1868         0          36      1832
> >   3. dropped        1832         0 (*)       0         0
> > 
> >   (*) the counter has underflowed to -1832; negative values read as 0.
> > 
> > The global value in /proc/vmstat is 0 after step 3 in both cases.
> > 
> > Move it together with the other node-keyed page cache counters.  It is
> > a node-only counter, so use the node accessor, matching how it is
> > accounted elsewhere.  Interrupts are disabled here, as for the zone
> > counters below.
> > 
> > This was pointed out by Shivank while reviewing the NR_FILE_THPS fix
> > for the same function.
> > 
> 
> Thanks.
> 
> This and your "mm/migrate: move NR_FILE_THPS on cross-node migration"
> "only" address accounting errors, but a bug is a bug and these bugs
> might mess up people's memory-monitoring and NUMA-management tools.  So
> I think cc:stable.
> 
> What do people think?

Yes this is stable material.

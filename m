Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322207;
	b=oPEnxji9l41N/VXY0AINg/Ceh7MPABN70dHRKF/tjBKlTawuxm0CpGVBjlHlhRz4C3Gr
	 Cw2rWWWAmXMpZshVDiud4RrkaWBL+XOIBQuDlWA/mxVTgxE6gvTMms6B/owOC68lY+Opp
	 sRdySlyUQ+faziOGJmTJ7PaiXK331hspu0Fu9z5Tern9ueyrkFlMdXdNEQdDwS61Gc7hU
	 sWM9NTG4NcPDPeWnFA5cTBKC+57wgjBmiTWKWAnlIrOmwBKGrkFcpexg7+eiN3VrXbI1U
	 6sa3+XbYIC7tT79YcHd8ta+P5Fy824+gr54D6OnJ+1oT7UQ6nE8JLKd6BW8d0ziJXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322207;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iLjjIJoENlE5NAFUdiFmod8tblyrc0j45UpKCHBEwzg=;
	b=nwvopefOn1U77yz9k/w5SsXO5HvMuFDCH8LdK7kcXaz1A8Ym+3scLPfVrRxG/H+gC22w
	 tyvG4VqbTCY5k1FNcvBk3rlSGwPqp1JIqI/I7AnfPQtHEZjwwKUsyHSB9M+G9dLu6Jxux
	 sPvNgu0uvnAXiyiKRQ/aIM8+2SKAdfsmzOPhCVwS+2OAzRBFgMBalGOp2VXItPU3/E1D9
	 m2kJFb/B8FDVIdufBriG9KNNPXiE87fTnL8w8fwXXXqSvdbDWSEtmBSzMTwnXt1pp5Uf4
	 614UrVjScv4AnwbIv6zFux1sDzgUMwQ+N73g8AOnAO/9A54Dbwt1DcYkxTPU4ve+r0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XCq4Acgu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A330C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XCq4Acgu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11E41F000C1;
	Fri, 30 Oct 2026 01:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793322207;
	bh=iLjjIJoENlE5NAFUdiFmod8tblyrc0j45UpKCHBEwzg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XCq4AcguHeTD9dQitt4/EBRovli7cQL1uJTwLuRvZE1p+o809ocaZ1bZmPb/kNEwn
	 otpAwCQ5AWfGVSWI/cmYJNW5EgmwSZSCW5TI9U5cjA9mBfK47eGK9CfARrgwqQoGDA
	 IgbBkX2LLa9w8zBTzG/fpmaHPFcDgsR6rNWLRrbA=
Date: Thu, 29 Oct 2026 18:03:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew
 Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying
 Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Boris Burkov <boris@bur.io>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Shivank Garg
 <shivankg@amd.com>, Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on
 cross-node migration
Message-Id: <20261029180326.84ae7b2c1f63f016c66bd28e@linux-foundation.org>
In-Reply-To: <20261027043214.2248986-1-ridong.chen@linux.dev>
References: <20261027043214.2248986-1-ridong.chen@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 12:32:14 +0800 Ridong Chen <ridong.chen@linux.dev> wrote:

> From: Ridong Chen <chenridong@xiaomi.com>
> 
> NR_KERNEL_FILE_PAGES counts page cache folios of mappings flagged
> AS_KERNEL_FILE (currently the btrfs btree inode).  It is a per-node
> counter: filemap_add_folio() adds to folio_pgdat() of the new folio and
> filemap_unaccount_folio() subtracts from folio_pgdat() of the folio
> being removed.
> 
> __folio_migrate_mapping() does not move it when such a folio is
> migrated to another node, so the source node keeps the count forever
> and the destination node underflows once the folio is freed.  btree
> folios are migratable through btree_migrate_folio(), so demotion,
> DAMON-based migration (DAMOS_MIGRATE_{HOT,COLD}) or memory offlining
> all hit this.
> 
> Reproducer, on a QEMU guest with two memory tiers (node0 is DRAM with
> all CPUs, node1 is a CPU-less slower node described via HMAT) and
> /sys/kernel/mm/numa/demotion_enabled set:
> 
>   1. mount a btrfs and create 20000 empty files, so that btree folios
>      are cached on node0;
>   2. echo 2G > /sys/devices/system/node/node0/reclaim, which demotes
>      them to node1;
>   3. umount and drop caches.
> 
> nr_kernel_file_pages in /sys/devices/system/node/nodeN/vmstat after
> each step:
> 
>                   without this patch     with this patch
>                    node0     node1       node0     node1
>   1. cached         1868         0        1868         0
>   2. demoted        1868         0          36      1832
>   3. dropped        1832         0 (*)       0         0
> 
>   (*) the counter has underflowed to -1832; negative values read as 0.
> 
> The global value in /proc/vmstat is 0 after step 3 in both cases.
> 
> Move it together with the other node-keyed page cache counters.  It is
> a node-only counter, so use the node accessor, matching how it is
> accounted elsewhere.  Interrupts are disabled here, as for the zone
> counters below.
> 
> This was pointed out by Shivank while reviewing the NR_FILE_THPS fix
> for the same function.
> 

Thanks.

This and your "mm/migrate: move NR_FILE_THPS on cross-node migration"
"only" address accounting errors, but a bug is a bug and these bugs
might mess up people's memory-monitoring and NUMA-management tools.  So
I think cc:stable.

What do people think?

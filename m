Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959C379C35
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570730; cv=none; b=aO/HcGvoyH1pLUG9efvXx5uB96UOnsHoqIh5mWhSLARzLV/EgyTrR1u8N92oVYA+pY9e5Wptx3ejffPqy3/Z1TEb5s223lV+pkrae5xp0tjcSd35SRqMt6iZ6UtuW6UW4RoyzrlwQqX8FkPwj0f1Tgy6A4CD8ZOt7+hpSiv81NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570730; c=relaxed/simple;
	bh=ziSYX+Tk5BasGCsqQfKWS1VS4Io1Aag8BlV1W3FQcoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUCFDy1x2CP5KUhrKbrwOtygWTrluVRzXqmq1rt1iDJ9GzbrCl1zAQM+6hNvAqqGAwlkSXdJ/bq012Cug6JN+IUHt3siPDHkV2dAbsQgzix6iXOP5VrQINdozbEiMS3nJXDjd9P+wCc7nGXiS2hxWuPej1mLpY7E9sIQkRacT5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f62Z177m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f62Z177m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4EB1F00898;
	Wed, 16 Sep 2026 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570728;
	bh=KxAsq6mlrlRgY8e/8njCByVAcxEtv6lXs6ng+qgkRns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f62Z177mbNaPvPScjrfQX0fc68CuY9vm59QUctkG5Gm2BCXa60ClJxz2jUUTQr2mK
	 6wAmw/nfu067bSHUSuw3TJRMwZmRKgEtQ7579H8RjV+H0fLY7zWCcAhLhU/ujFtMvQ
	 TERixAWjUXJ0l4d7777aJr0yvuHa16dy5sXeVYC0d0JB6WQRDg1BCXFhuuuisypFLn
	 jFBwkiuGztiM9Syzd9KvNt2D/Ht4XO+FEa2WMiwhnSpqo6LPR+BcYS39jo7abLPcZ9
	 OEtNOrli8/TSUHE8S+w+hnHaMKzfNFKH0IOAMzjpgol4FVmGmxWgqEcjOLO1cYU3YZ
	 N8QQ/R6bjQ4jg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 163591980047;
	Wed, 16 Sep 2026 10:58:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 16 Sep 2026 10:58:45 -0400
X-ME-Sender: <xms:oK6qamBZ5gTzffPWX-HGjDTTZoZEF0APcqLdlUXOhc05nocB0Q8gjw>
    <xme:oK6qai3kQlu4jPL2Qvu0Kxz_s6Rrr56CBkLyU4V0Lp9D11hxc8oVCOHRtMhRmgCg_
    oAHc-7sI2TBrvZ36eE3GEjTjzdYA-8NEcdsGO5Mfu3tXkqlDCLTimIJ>
X-ME-Received: <xmr:oK6qaoW8ooCkOQQjBi-OjYcnpCAMQOLkps_EmJmWzbkY1V5GAJhKaF-YH4A>
X-ME-Proxy-Cause: dmFkZTFnpmf2cGNwLkZB02TtYoQfXJ9CYV4Z6v6aWvRoWtlSDu/ryXy+f1A0x8yggrT6pc
    74E1O46vF2Ghy3wWTQKsuryfYPAHQWdgKyHFYusv5Hp2PFKCX2b0YoW5TpB/FMOmgTRU3e
    0rPdq8Nm4X3aaX52mXDmdfUjVnpqLxyZJtxgWB2J9Y7N+Ads7wL6SM8cD9T0bR/yRxkVbz
    ul4lGtKVXF83IjqQm8oQwLPVRtgSwlpzF2Lgwx9bu1MIQiWR5J6oqV8z0Lss21/BiVArkl
    ED0Xe7vVfYMHRQTNozB95yux7Vilk9hKmoonRC15QkVqCZD1prbWRZ9xp98mhGjkL0omSH
    9zcAaLfvETIEYKPBR7mU6pFQRrH/oI1296OKFPe8lRZSWQeNYaYMzer3lX2CIIG4Uirr58
    L94BB4SRia4Wgd/xgt+8eh9jrIZLVk44Vz4A0Ue2mQt45eOajNHF6gJWehH9Z8Unh5LhAq
    bmCFWB/qawZyUpKHtb2COIYxDMHab0zRXYubycnp5rAJeSZZyVePCub848zUQwrsBOj5pJ
    q6VF71UDjWEBW61gEqHQoJaIswvc9PmggCzLNwPfbSPanJmNkVcfb4aOA/lGxaiii+FkYk
    6Cict8JHxm/PpzzSVgnAoliVBS9hCF2Ugk10XA2DBHDQc0sb5Z2Iix4xOj+Q
X-ME-Proxy: <xmx:oK6qau8u1SRu7HNgsWn6eLaKFBBh11y_uWDR2g01gJGHPWkLtU16lw>
    <xmx:oK6qat3wzoXuXuiyX23xlTOpwO06F1O2dgmCnSE0PTZ04l7qjuVHQw>
    <xmx:oK6qapAuvZErVqBXnqXnPNZHFUjnf9oA5wxzvpamX6g8H-Hdyi_eYQ>
    <xmx:oK6qamBGJmy0pkBE4mVZpoartKTlLYUNJHn8Vixhd8ImrMoAdiC3Vg>
    <xmx:oK6qarSsv9kFkHQYS1fcmNx0s-vloq93B7HFvnC1nMSIKoMG5lKZ1PwS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 10:58:39 -0400 (EDT)
Date: Wed, 16 Sep 2026 15:58:22 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, 
	linux-mm@kvack.org, ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>, 
	willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org, riel@surriel.com, 
	shakeel.butt@linux.dev, alex@ghiti.fr, baohua@kernel.org, dev.jain@arm.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, 
	lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com, 
	shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev, luizcap@redhat.com, 
	kernel-team@meta.com
Subject: Re: [RESEND v7 10/29] mm: make PMD migration-entry splitting explicit
Message-ID: <aqquaDH9gFrdCqHK@thinkstation>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-11-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914122950.3283997-11-usama.arif@linux.dev>

On Mon, Sep 14, 2026 at 05:28:00AM -0700, Usama Arif wrote:
> __split_huge_pmd() and friends take a "freeze" boolean that every caller
> has to pass and almost every caller passes as false. The name says nothing
> about what it selects, and the one thing it does select - PTE migration
> entries instead of PTE mappings - is only ever wanted by the rmap migration
> path.
> 
> Rename it to use_migration_entries, keep it private to mm/huge_memory.c,
> and add split_pmd_to_migration_entries() for try_to_migrate_one(), the only
> caller that wants it.
> 
> migrate_vma_split_unmapped_folio() also passed freeze=true, but only ever
> runs on a PMD that is already a migration entry, which the generic helper
> expands into PTE migration entries either way. Its folio_get() only existed
> to balance the put_page() that freeze=true performs, so both go.
> 
> No functional change intended.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Nice cleanup!

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890072;
	b=vDu+nR6kgH8bVOnt61vmBtWPJlM39NijoLgbIBGkqGC5PVFGUnMDdtY4CZSrTGhkdUMd
	 SDHHSAIG5uxTRkCGSzKYlRTQmR87TJQPnc+gaZt/i0pCIYlc+Ngjn0NSS2za5WYDq1/c/
	 EdbUpIJm+Am6Zia3tcUODwUyW3rTJb7XZgDucphnGvZzZr2PPYbgAox86V1XnTXTcyHfX
	 ZNOHgN5cEQuF5IWQNBHJBdYJmHHTdkCz5TbYzD8TloC5fd/nRZbvx7HSkNbvBYfWG6OsC
	 ITRygbxzYk48EWsqfhFRSCWUDjqbu2Oif4JFC+xRA+TnLlBxaeooZwxpFd+d+fKPabw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References;
	bh=TsmecKMB53MMLoeV3U1sXBEAHag3fepZSE22CdWa2qY=;
	b=QPAIf3aBGEMZhaCn2fepWgq2DWVxwPcQVz6r1GsD8ML1DbSdclix7mmf5sPKyvlSvZnk
	 cNDqwulK+VGs4zFHB4clQs0e07NIMi8xRgBACBIdvD+ylQpCxA2lWR8vMiHjhe96pf4ib
	 i2KW1MUg8dA+q6+RXqJjq4wRFR0QMa/l+5RVTu6vnw/B3mvKDbmmsiVBWRdV4foKuvT9k
	 VoZi54zO61cHPFumFaE492gVZDM20NYU4YmW4RB5pMdNeJpHReVuXDg4ZGJvxd0eu11PQ
	 eMW/rjds0Fusewz18rI+fCDZqCeKENxpfE8etT5UNSgURl3kKcH8psUqbGE23DKEYXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TqrbUF3S;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE84606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE84606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TqrbUF3S
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8285875e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890070; x=1794494870; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TsmecKMB53MMLoeV3U1sXBEAHag3fepZSE22CdWa2qY=;
        b=TqrbUF3Szyfy25+T4qoTrOZ/exXBHTJroxjpvjzh4fQ7VBRe7+AWGpvzWDKILi5pM8
         GEG3eJzDk8AMp8n7wlEIpcpVcVS3XNrJdCODUnlh7Zgpw+SoaswU7iDDmo8D9qrTWCPv
         HPOiHvKok4sisCw1IplBuXfiAIAXLGI3FfNWM/HbIIRH8evuRDRWTNMXZxkYGkWFKiJG
         A9vVHnnJbrgeJdcIWwSd8k6iGtUDfXPYtrwTM/rFgMm9fbFKV2XJ29T5SPbGpdtda1Dg
         uxuoLiFqvT8c5MAGEw2MJ1KPruc1Q2laY+SBWspl0gve9pu8IAok6P5qMv2wM7MBRiVQ
         5NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890070; x=1794494870;
        h=references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsmecKMB53MMLoeV3U1sXBEAHag3fepZSE22CdWa2qY=;
        b=PI8e0Qno6TLUi4oKSK3S1DJw2f3eo449Z9m0AGGGgMo0FdBWEixqDpuwdAXNazcSU0
         4LC7rgmKNZQoNOdCYBxmqtQXfFeJhfnhmipy/GN2+JRZ/nnmUTFtLvo0647bJsrb+HhG
         se788xx3YyCwLAd5DCMzfwvQssuLtqRxiNCyJ1vbW06ovAo3qxpwIq8L1DRr7M/QF9i0
         qM5DTdmO1ZmiUD5fEpaQt5LlCCJHOSiAsJK6KsfchDhfx0x/g0AxvfSGhOFu62CBfkNy
         L9+tevcXjgq5Md4UaSotaDADqmfq5yQDhz0MkHbION6IGXGM6syKrxlEgh1idBYQMddo
         ozzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT4ZPgkP20zQ1oJfIzDfpriviM+fcCFYsH3ybPLHVkyJt8S0N9nVverRxBMJisaYDJ4iwRLWhKXLWJa+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XS+Nx5bCkETeeIX85FQJBWnbL3GBxrsmSPoza+s2lalBgSNtd
	omDMy81YCFCxLPULdJ2S3NuDWed1lwtDmeL7pvcEktk3gFZGDrL0BBjWLJ8GBUQE5VEzVA==
X-Gm-Gg: AYBFou2Mw4c/CQQ774c9iMXIjt3bw9IKsIppkTDYX10wIc+ztteiSPsWaaxmp00Yt3O
	Zvcs8JHXP512t8+pB97WdHll3hyR+cGJAq9n5ZFWWu/f5DfNOo1vt+4nc58GqEz5XwgReg8Ieh+
	Xk5PiNB0MhywAx4pAMb2TlPlZ7FCR4mx1W/FTkQM29pclIbz9hVyQExbZD2Ddnf3KpRK4nsLvPm
	tkcOLcLzNMEHpmqCqZ0b8oPUVt68EkNBsVzfkXoEhgd9TQdDzTA8eb5r+r23lTEjyaXaJk+lYZV
	pjgot2oC24g0E2D5PTE/eNf+4sRN3eXieZrP2CQwlNeOW3dg6qyIuQ8a4qTp1bvve+PL8fxB+ia
	8M+JF0lG0azaGg5S7ReczE3XuffaeBf1B1owv/+jfiaKpi3kO4WTmkP+s0JAghrn/xMh2vPiKpi
	iwc5BlnYXmTYKUJaK2TIALS08nwupZD4xpXDWfmrSiMd57JttqRK1lyDFkupq0u+qogy90X6UGQ
	qb+iuViqTSrObxM5AYfNv8fmhYdIqdRA+LbibLB58VKJGa9F8qzUZCLElucJBYr8UVh94Hl2Viy
	7gWFrFUwX+3K6jiSnw0wICgRGFp537W6PLljg/iknt+46PgPTK4CngJVIzoV19ZaqtNzSJqK6Nd
	t2UFRopI/tk8V1MnvYb1p6E0/LG0IdkXuVfY=
X-Received: by 2002:a05:600c:3b04:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4b55d8cfdbbmr48479825e9.12.1793890070263;
        Thu, 05 Nov 2026 06:47:50 -0800 (PST)
Received: from localhost ([46.36.23.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm84600345e9.8.2026.11.05.06.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:47:49 -0800 (PST)
Date: Thu, 05 Nov 2026 19:47:47 +0500
From: Mark Korenberg <socketpair@gmail.com>
To: Qu Wenruo <wqu@suse.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 Mark Harmstone <mark@harmstone.com>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: tag all metadata I/O with REQ_META
Message-ID: <35f7fdfe3efd8e949f9abfb1411de4db@gmail.com>
In-Reply-To: <9e2c808e-6edf-42b4-a70f-5fecc8f1eb69@suse.com>
References: <20261104-btrfs-sb-read-req-meta-v1-1-e06b4d059897@gmail.com>
 <9e2c808e-6edf-42b4-a70f-5fecc8f1eb69@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

On 2026/11/5 19:37, Qu Wenruo wrote:
> > - RAID5/6 rbios build new per-device bios from a bare op, so all tree
> >    block writes on RAID5/6, and recovery reads, lose the flag;
>
> I think this can lead to very cursed combinations.
>
> A RAID56 mixed block groups. In that case, how do you handle recovery?
>
> A vertical stripe can contain both data and metadata, should the
> recovery be counted as data or meta?

In v1 it is counted as data: btrfs_chunk_req_meta() returns 0 for any
chunk with the DATA bit, and a mixed chunk has it.

I don't think that is right, though.  My view is that everything that
is not pure data is metadata: if an I/O may carry tree blocks, it is a
metadata I/O.  A device that caches or places metadata differently is
better off seeing a few data blocks tagged as metadata than missing
tree blocks.  So in v2 mixed chunks get REQ_META too, including RAID56
recovery.

On a mixed RAID56 chunk this tags file data writes as well: a
per-device bio of an rbio can cover sectors of several original bios
and the parity, so only the chunk type tells it.  I find that
acceptable for such a rare setup, and v2 says so in a comment.

> > - scrub and dev-replace read, repair and copy metadata block groups
> >    without it;
>
> Again, what if a block group is mixed?

Same as above: tagged in v2.

> > Tag these by the chunk type: metadata and system chunks get REQ_META,
> > mixed chunks do not,
>
> That almost kill the meaning of re-introduce this flag.

Agreed, see above.

> I'm more interested in how other dm devices, like LVM/dmraid handle
> those REQ_META flags.
>
> E.g. a btrfs over a LVM/mdraid, and btrfs passes REQ_META for a tree
> block read, then should the LVM/mdraid pass REQ_META to the underlying
> devices?

dm clones keep bi_opf, so LVM and dm-crypt pass REQ_META down.  md
raid1/raid10 pass it too since e879a0d9cb08 ("md/raid1,raid10: don't
ignore IO flags"), which names the priority inversion when REQ_META is
cleared.  md raid5 drops it: ops_run_io() builds the per-device bios
with FUA and SYNC only.  I see that as a gap in raid5 that the
raid1/raid10 fix did not cover, not as something to follow.

> If not, I see no particular reason to strictly follow that for
> scrub/dev-replace/raid56 recovery.

md resync cannot know what it copies, btrfs scrub and dev-replace do.

> I'm more interested in what you really want to archieve?
>
> Just to make the REQ_META more consistent?

Not only.  The ublk zoned device I use sees REQ_META as
UBLK_IO_F_META, and its server caches and places metadata differently
from data.  A tree block read issued by scrub or by RAID56 recovery is
still a metadata read for it.  The same holds for the in-kernel users:
BFQ prefers REQ_META requests, blk-cgroup issues them as root to avoid
priority inversion, and wbt does not throttle them.

> At least I do not think it's a good idea to touch RAID56, unless you can
> prove that mdraid is also passing those flags.
>
> I want to align btrfs to existing RAID56 implementation, not the opposite.

I'll move the RAID56 part to a separate patch in v2, so the rest does
not wait on it.

Still, I don't see what it can break: it changes no algorithm, only
the hint.  And within btrfs, metadata writes on DUP, RAID1, RAID1C3/4
and RAID10 already carry REQ_META, because the per-mirror bios are
clones of the original.  RAID56 is the only profile that builds new
per-device bios and loses it.  md raid1/raid10 pass it as well, see
above.

> > +static inline blk_opf_t btrfs_chunk_req_meta(u64 type)
> > +{
> > +	return (type & BTRFS_BLOCK_GROUP_DATA) ? 0 : REQ_META;
>
> Missing BLOCK_GROUP_METADATA_REMAP and also handling BLOCK_GROUP_SYSTEM.

Both get REQ_META: the check is for the DATA bit, and tree-checker
allows only five chunk types (DATA, METADATA, SYSTEM, METADATA_REMAP
and DATA|METADATA), so METADATA, SYSTEM and METADATA_REMAP are all
tagged.  The SYSTEM rows in my test show it, METADATA_REMAP I did not
test on its own.

That is clearly too implicit, and it leaves mixed chunks out.  In v2
the helper returns 0 only for a pure data chunk:

	return (type & BTRFS_BLOCK_GROUP_TYPE_MASK) == BTRFS_BLOCK_GROUP_DATA ?
	       0 : REQ_META;

and the comment lists what gets tagged: METADATA, SYSTEM,
METADATA_REMAP and mixed chunks.

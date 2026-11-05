Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882757;
	b=lxuWTqOAt7eG5xaNowshr1Vh+MufnwhqmLp1QS22EmN0OWlwJiePOeTm7Du3ZYbGB8af
	 kyGW9H3gU4X+5RoWYJLm1sgOhn4P+u242l6sE5Ss4mByNSklLK1FFX01cyEvwXK9yQzxy
	 XZHUZHKk/keFw7LHO8x6NSUIsTg3pevCX7MTPRnx1EtBHDe7xcK34gAbZX9BCta+nzx0t
	 4oJMlyY9Bz9/DLZI6u6JZ6KQ7CzUxBXlE7VqRGmw+TuEGQqZeds72x7/4iOOt6KOpa3b1
	 BsDCFFzHyvmJKthl37WWg5FKCGbM0OKNF0WOsX8Aplj1PnR1yTomOwl8hFgW7ViEq3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=i57L9NPhlWOeObQMnsgg83R3hDrmi9l2QFEwRbn/Ljs=;
	b=YhzYL/xrDUdvUFMJfXqr8rASyYl5S2Od2F7kAdfrBf6Ze+SSA46c8R1NMofH+588IWJD
	 io92IFT3nf2qE2/plOGexDUD3gD85FtJO/d7E13LW9MZl7HE2vgRkla8WSy+prAxhXAjf
	 ai+6RWGD4GPKD2PJct3m483WeSHpWMahqp5YtKr7TBiw5Mpq+t87IuJGnj7dQOCJw9xH6
	 Cqukk/PVSPcv4Kya5O5UjXjjiXkhmS6uyAX/jhxbknMsxlE6MQekXr70f9O4j3ZoACB4w
	 yWeoYO4lB6mVLQdfFMtcUhvKZRYe9w31Y0k4cAiuBwu66ZqMKEyhzF0Sw22WGaGXTzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ns5PjF7Y;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB56606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB56606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ns5PjF7Y
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso855455a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882756; x=1794487556; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i57L9NPhlWOeObQMnsgg83R3hDrmi9l2QFEwRbn/Ljs=;
        b=Ns5PjF7Ya4uyR2QPdgTml+KtqWzgFmLDMdsUQ8InjAUb6eJkT3m/ifAvufkx+zW1Y2
         i8vA1fe0joPmbOhH3xWZbD1cblYL8BtQwgosNYoxrvhe+V9C3aVEFdfUsS69GZpHGero
         Beq1z0BdJHgl0fPSlbQVyoKCha9IngnGBXEPzehERbpVlD+46hUwOXG5tMW4CEaq/UM3
         zXALsnrrCiyiYbLghekwgN7VPpsS4zOn6uouAA7pGxYVpfjHwvpoaM5E15yvq0KEW2T0
         Havv8EumZB4pkLkDmE/LMr/UzmBa4tVVfCtRzBeAg39s+iJBz6zFVnt7+Opu6knGKwi4
         KVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882756; x=1794487556;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i57L9NPhlWOeObQMnsgg83R3hDrmi9l2QFEwRbn/Ljs=;
        b=QVALgTfpBcEn/SXlui+E32sSZdCGKsCiBvzP+BeVlqZU9HQ6C34qYsLVV2Ga1gLejY
         GycvWKP7NLE758X3q9v/m5MF88l8Cdmjh7yYmhJN7j/Hu1VDbbXvIypTbDmWH1OLuPJP
         psrvmvxGpJ8v2B7hLjrj3VF79hDNku6BCg2otkw6A5IDR0WCJUCuADjD4XJEQHXV6/7E
         WQaf+CqwzzDUVis9pPtM+0QTHKhgnQ7pXu4xVMWh1E/Fq/S6jxEuVFk9bAa3zUHvCRp7
         nk2GDGgvmRTk7GJ4bdXIwP6cjPGZVr1lL0gjQnvGQmgTU8VimJmH2ienMoBuOAWaoy7l
         vMFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmthJlIRKBsYF5DTd0/cq01p+54Yf3DR0f56Zod8PQ7c2zGkE13yCa9HBiAwTVQ8ovxg0KdST6Nh258Zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z80qk67GlzMC0D9j5BpShIlIGnyBDMt5WbXj5HLDssm06ZqpR
	3ur7yvsdbjXRzDs9e/WJOMFtjwfyydvdb1YuWnuaxuWK91g8cKy0h3vC
X-Gm-Gg: AYBFou1/g5DYVBTDEPSFS4757uJhP4BZaYCU+H4me2i+ERnJyvBIq9lmyFpD1ItPb5a
	+nBd3dxNJ2CrKnI8hMxPPk+4eMBZb3HkVrvxL3fDj7edeoMpvGvF88IfNHx2tQRanuOwJT7YvUj
	0abdcv3jWE1AwdIayMrEyORv9irZVkWRieKRq/C36VQ2ObuMThzIyhrk5DC4CayGOM3oD4lZeBy
	qm/EUV92uoa4yAOzqNwzC/mSV/EtlENqSrFp3pa4oS8QjHTpUkeTxLCFSG2lGNkXbqdGL9yuGzR
	MVefS8F7Khsz/CS/l0cpd593lEgjZk+kRf8RHErCfXUreyH1gwgn/6R7BPIJdIl2jH/GE1dNR+k
	lhKIMgAAksIxEDNGkMxIkFYFYfTlvOFb9coAa1LJS+s6rvPJve3lll9DB1gRaIckr6PKdb7BnsJ
	cRfP1TLg6SW62WUbAaaiemciLDz5eidTA+PpzEPUg6hwlpezZppSRwCRdg0cSBsaEDP9xcxyTTn
	Arn/A2MldFtEfGTPNh0WKnEM2zeyMIAEPeBTA5KcatXI4Xw+LMO9PhFXnU5UY9dmplM1WvRJjpa
	uA+jWf8CviGwYu3o07sulmHaqEDwbAzts73VENKGBhq133h+LRuQ
X-Received: by 2002:a17:90b:2551:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3ae8957c8b1mr17676948a91.4.1793882755612;
        Thu, 05 Nov 2026 04:45:55 -0800 (PST)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf80c9sm3927157a91.0.2026.11.05.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:45:55 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: "Carlos Maiolino" <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+e7f24354da9f7915bc54@syzkaller.appspotmail.com
Subject: Re: [PATCH] xfs: fix slab-use-after-free in xrep_newbt_free()
Date: Thu, 05 Nov 2026 20:45:52 +0800
Message-ID: <1793882752.followup@viennaoffh.gmail.com>
In-Reply-To: <atL8bTDPVGlpZ0LB@nidhogg.toxiclabs.cc>
References: <20261016085536.591-1-viennaoffh@gmail.com>
 <atL8bTDPVGlpZ0LB@nidhogg.toxiclabs.cc>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Carlos,

I have to admit I was not sure how to reply to your last message, or
whether I should reply at all. You said to wait until the patch gets
reviewed before sending a V2, so I did not want to push or send noise to
the list. On the other hand, it has now been a few weeks without any
further review or comment, and staying silent did not seem right either.
So I am sending this short status note; if you would rather I simply
wait, please say so and I will do that.

I also wanted to close the two items you asked about earlier, since I
promised them and then went quiet.

> Yes, sharing the reproducer (and potentially hooking it up into
> xfstests) is a good thing, specially giving the syzbot doesn't seem
> to have a reproducer for it yet.

The reproducer is a standalone harness, not a syzkaller program. It
mounts a scratch XFS with rmapbt and reflink, starts an online repair
that rebuilds a btree-format inode fork, and then issues
XFS_IOC_GOINGDOWN (LOGFLUSH and NOLOGFLUSH) from 1 to 8 helper threads
at 0-100 ms after the xfs_defer_item_pause tracepoint.

On the unpatched kernel this produces the reported KASAN
slab-use-after-free in xrep_newbt_free() -> xfs_defer_item_unpause()
on every run. With the patch applied, the scrub ioctl returns -EIO, the
shutdown path unwinds, the log replays on remount, the free block count
is unchanged, file data reads back intact, and xfs_repair -n is clean.
Healthy forced rebuilds still take the normal pause/unpause path.

I can send the harness and logs, but I did not want to attach a large
tarball to the list without asking first.

> I'm also interested if you actually passed your patch through xfstests
> before submitting it. There is no good fixing a bug if you create a
> handful of others. Specialy agains scrub, online_repair (and maybe
> fsstress_scrub) groups.

I ran the patched kernel against the scrub and online-repair fuzzer
cases, plus fsstress_scrub. To be precise about the coverage:

 - Completed with a real verdict: xfs/351, 353, 355, 357, 359, 361,
   363, 365, 367, 369, 371, 373, 375, 377, 379, 381, 383, 385, 399,
   401, 403, 405, 411, 413, 415, 417, 426, 428, 430, 497, 730, 733,
   736, 786.
 - xfs/387, 389, 391, 393, 395, 397 were started but hit my per-test
   timeout before reaching a verdict. They are long directory/xattr
   walks; I am not counting them as passes.

No KASAN report was produced by the patched kernel. The failures I did
see are all reproducible on the unpatched baseline as well, so they are
pre-existing and not introduced by this patch:

 - xfs_btree.c:1814 in xfs_btree_decrement (xfs/361, and also xfs/373)
 - xfs_buf.c:389 stale-buffer assertion (xfs/363, 365, 367)
 - xfs_log_cil.c:546 empty-transaction assertion (xfs/369)
 - xfs_attr_leaf.c:168 attribute-leaf assertion (xfs/401)
 - null-ptr-deref in xfs_btree_simple_query_range, reached from
   xrep_dinode_count_rtgroup_rmaps (xfs/375, 377, 379, 385, 399, 413,
   415, 417). This one reproduces identically on the baseline kernel.

> You'll need to send a V2. But wait until your patch gets reviewed, you
> don't need to send it right now.

Understood. I am holding the V2 until there is review feedback. When I
send it, it will use the correct identity:

    From: Zheng Shuhao <viennaoffh@gmail.com>
    Signed-off-by: Zheng Shuhao <viennaoffh@gmail.com>

Is there anything you would like changed in the patch itself, or any
additional data you want before I send the V2? If it is more useful, I
can also send the reproducer and the per-test logs now, separately from
the patch.

Thanks,
Zheng Shuhao

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108955;
	b=fCtogBYq+Szms79Z/iXUt+kTvonz6jWXkDDi2z8wNDh417Rlr+isVkV+ww2ArOe538W5
	 SD5GROrSv6EwvPgeuVe5eLmllv8A+2mm8R2N8QNfBwhXNY92bWni/5a+hZ+fqn+PP+6cS
	 yTDy0ReF/YedowHRu+SKBbS3g6LfmNj+x/bD/zxQyFLwBX2/XuH7Rv793pSFEZ4mKCmDx
	 dpUrD2YbP3t6tdTcvKwOzC6RLNZAMhkvsig8dvGP8PzEJ25D0kIl8LJ1f6NTcww0ClLCa
	 UGfSlUhrS/kwQO9ZUHhupWXGiphiKtAxtZuzWFXDGPFmy0pGgiCcMNoxkRMNQYu6ErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=XomX6DB6D1/SIO93qU+NvqAlwsKLsAk/d0xRuNeXAOk=;
	b=QR2bwc5L7i9+nmGM3mQRs3+ltraRJBMu0Dun+QMQQ4QOGOC/dB97Kj2DUKAtp8LIipEP
	 UvNchMsTiXJC885Sx5TFQLujMFW/6MWHDjZ7fe7/6OhVCJ4kAmu7JvdUSg+F5evh6BKhb
	 cHbG2197f2z44E9CQ4/Yl8daLuFVDdalEiiAdgQLWpzlj+KYFn7Mu8i1rV6EnWoOmBJxc
	 FlUdZoglWelrZCHgm8ozxk9KGVXE0hAi/2hLw/wXeysoXtwuPinp8hPWfaVo7xOzqyDAW
	 giOCYrsWxEOBSK7gPsyE2UXQu0lr/JNPBNKmENPhHR1zg/t4xkIY6wuXxp3B3s9Ma7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=QirECd2g;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B727606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B727606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=QirECd2g
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53cd0c8614eso14163991cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793108954; x=1793713754; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XomX6DB6D1/SIO93qU+NvqAlwsKLsAk/d0xRuNeXAOk=;
        b=QirECd2ghwJmRxFJOo7gQFoS9QwNcRuzit5+GxNaO2qtQ+wt8h38/bJwNtvPVkzpvs
         uBKiKsScICwdQfoim073GAnQEIVbJHBo9jXXyitttfpOjHA+RUzshYmhJah2wsfiGeiL
         quU+CXY6kF1//9a51cB6/Ld44ufTmvwrx9FHP4o/SOeQEzHybxBMr5nkIL1LY5F47hgn
         NOUhG2kwUKeQOOVvId/Q2+PdYC4gdULgfWWMzo1gkaBatU8cmxuxgAeWtgwCBJxZejMb
         H/SSVcSUMG6rpkrI803+iGPyss26YF5EI2j0KKoKWo9uQjHkad4gHNpMATKcxlKytRwr
         12sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108954; x=1793713754;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XomX6DB6D1/SIO93qU+NvqAlwsKLsAk/d0xRuNeXAOk=;
        b=eZmUre8e2hQ4SIQYsv0vlgeFethjGl0VqSh02FpPirhL6XFdSJ6Xduzr1x6VdoNgux
         rfiVCMctf787BTk2EGh3+4As8HkMsK8+JFUQ7GfXHMbeLldfF5Q+Kvr6xDCNOYccmmGx
         zcZv+Cq14L9Asonw0oYAwRVV3CvVwg3XFeQQFrSK1wCTc+xDX6FTJnQTQdqGh5Tfm7r0
         Va3RC2pJdWeL7HTOBvhfhZ92+j7WiYavYLcN8TtKE0CgmBcGFHv+dX8shGxi1k+PPIra
         BPO4BBov/tvtd63GgbOE4OF6fShJ8pfxiqouSYtIZBdmMtr2x0g8sgvm4AlNxset9nID
         0TKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI/Su6q3lG1ARrUANLehRJ+BfzNc7XDGsCxQmhahJXAkPLWJK6ryO9ub7I/hEvtJdHGjgE6XWOAw5QyUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkiA/9FepfUFpwvC5ICiFSetgu8M3VzqNHtVeio5Gw5HZ68f8q
	+693Y+cXUUdmxD7Ga/ulirKxMgZjlywcb0w8V1djL3GLhOpXFcm/a8LOEdsp1qUFKUE=
X-Gm-Gg: AYBFou1xR/TDXIykV6X1paCnJIr+QJSffjitvupQ8ZdxqYxp+Q6IBSIpPdtCiv5CK95
	fhsXCkduip5lNGAA3QOn4+GsfssSib/c1fHNJa28p8Yw9Gw27Cf3BCivj7Ke5BPUEAKYtrkWnw6
	ZhKOHTIWxshkwjH0Vk5KGtLXia5XDxpNj/3lzBk06dvupLEJdPmM4Yd/nO4g7uAiMOaCrd5R6Yb
	+nfQMLdSKfEWmPtHOtmPOv9DX5Aqc3EyRUuMS9IL+DVGq29UIURvDX3Uw9xAQJeTSCU1zjsKI4f
	zSB6QUg1AYPWKdFEux1E9xsY4+ejkk3L9A8T5tcIEcyEbM3T1Yqmn5Xn31QSO4D0di8iKzLnMxJ
	A05Q86Za3Y1MGS/RPHov2OzEHAxBYoEJ6qejTim/40Q33XLy6vOQ+Gx2FqhZPj+27bBFZlLBHeQ
	bI3kmCNqoE/GYk8Q/bUoUENYANVKtNB5e4Eyabjm1YoIfPvHzuj71oGQ3xcmP0gP31UXY51TVly
	ZzCYLV3xFPq7zkpDObSyALtRpS9hL4DL9hIOyA+yLlFLx4oVwM2jb9pHULJBXsEMDROqwuAbRf0
	msT3JLZfsJmS6uqg0jQtMfo8jhY=
X-Received: by 2002:a05:622a:1b10:b0:532:f0a2:ef4 with SMTP id d75a77b69052e-5383b4caaa3mr156684351cf.26.1793108953988;
        Tue, 27 Oct 2026 06:49:13 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53839709ed6sm79085531cf.16.2026.10.27.06.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/6] mm: fix pfn walker races with memory offline
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 kernel-team@meta.com, akpm@linux-foundation.org, vbabka@kernel.org, 
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
 hannes@cmpxchg.org, ziy@nvidia.com, linmiaohe@huawei.com, 
 nao.horiguchi@gmail.com, ljs@kernel.org, liam@infradead.org, 
 rppt@kernel.org, osalvador@suse.de, muchun.song@linux.dev, 
 iamjoonsoo.kim@lge.com, anshuman.khandual@arm.com
In-Reply-To: <9051ac3d-60b9-4ed2-b781-b7191898bc83@kernel.org>
References: <20261027042204.3741307-1-gourry@gourry.net>
 <01d7d54d-0047-4eb6-a1d2-5b3f113f26cf@kernel.org>
 <179310071902.664110.12994053710961856591.b4-reply@b4>
 <9051ac3d-60b9-4ed2-b781-b7191898bc83@kernel.org>
Date: Tue, 27 Oct 2026 09:49:12 -0400
Message-Id: <179310895201.1491991.14362391061932133491.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 13:51 +0100, David Hildenbrand (Arm) wrote:
> On 10/27/26 12:31, Gregory Price (Meta) wrote:
> > On 2026-10-27 09:57 +0100, David Hildenbrand (Arm) wrote:
> > 
> > I actually have a reason for these fixes other than "bot said bad".
> 
> So you found them on production kernels?
> 
> We did not have a single real report of that for probably a decade or
> even longer in production.
> 
> Recently, we had the single first report about the compaction case from a
> stress test (no production):
> 
> https://lore.kernel.org/all/20260903095543.3752338-1-yuan1.liu@intel.com/
> 
> "We are not sure whether this race is reachable under realistic
> workloads or only under this synthetic stress test."
> 
> Where I motivated that we need something clean.
> 

tl;dr:

while these are ai-generated, I'm not posting untested, unreviewed
schlopp for the sake of getting patches upstream.

I actually care about this issue.

---

Some of these don't show up as crashes but instead as hung offline
attempts (GFP_KERNEL landing on movable).  That shows up as our
hypervisor just failing to overcommit / guests hanging.

The compaction/alloc_contig bug is one I've seen in production.

I've seen a handful of NULL derefs in production i suspect are the
zonelist derefs, but it's hard to say (they're rare enough that we
lose the dumps before someone has a thought to pull them).

I expect this will scale up as we increase the number of VMs and
the amount of hotplug we're doing.

For clarity, we use ballooning + hotplug as a combo:
 - ballooning to do cooperative overcommit
 - hotplug to defend host stability when the overcommit ratio is extreme
   (basically deflate_on_oom because a host stability issue)

We're pretty aggressive about ballooning guests to squeeze them and
dropping the balloon to hot-unplug that memory when a guest is cold.


skippable side note on virtio-balloon/mem:

I have some improvements to virtio-balloon and virtio-mem that allow for
handoff from balloon directly to mem for hot-unplug without having to
drop the balloon, but I haven't posted those (and we don't run those in
production, so this is not the nexus of crashes).

Similarly I have another extension that lets the host set a "NO_ALLOC"
bit on the zone so a balloon-only system can provide the host a way to
defend against mass deflate_on_oom events (we prefer guests to OOM and
have the host to kill them due to PSI, rather than threaten host
stability). Also not in production and not posted, but there have been
a lot of experiments on overcommit here.

> The thing is that the race between offlining and actual memory removal
> is extremely long. Poisoning is just a mechanism to find these theoretical
> issues that could cause issues faster.
> 
> And with all the other things going on, this has lower priority, and I
> wanted to get back to the AI patches I have once the other thing is sorted.
> 

Sure, I realize I'm pushing this out during the merge window, but I
felt it reasonable to get some thoughts on whether these fixes are
worth considering for the window.

If the answer is no just put em on the back burner. We can carry
fixes as-needed.

> > 
> > I have a reproducer for every single one of these (and the other
> > series) - but a handful are unreachable due to a 2-statement read
> > being emitted as a single read by the compiler (which can be undone
> > by a targeted compiler flag). Those were included for completeness.
> 
> 
> In general, I think we want something that will protect all
> pfn_to_online_page() + zone->contig thingies, not just selected ones.
> We discussed in the past using some sort of rcu for that.
>
> get_online_mems is usually the wrong approach.
> 

Agreed, although the PFN walks seem genuinely harder to wrangle into an
good rcu shape.

get_online_mems seems like the backportable solution, but i can see not
wanting to have to go clean it back up later.

> protecting individual pfn_to_online_page is just whack a mole. Likely we want a
> way to check whether pfn_to_online_page() is called from the wrong context, and
> maybe we need a variant that can be called from "wrong context" for a good reason.
> 

Agreed.  Although I fear the structural fix for this will have uglier
performance issue than we think.  Then again, maybe it doesn't matter
(if you're doing a PFN walk, then you're likely already doing something
stupidly expensive).

Where i'm largely concerned is the page allocator and the
compaction/contig code not taking a regression.

For zonelists i've ended up with something like this:

@@ -1461,7 +1466,7 @@ typedef struct pglist_data {
         * Generally the first zones will be references to this node's
         * node_zones.
         */
-       struct zonelist node_zonelists[MAX_ZONELISTS];
+       struct zonelist __rcu *node_zonelists[MAX_ZONELISTS];

...

static inline struct srcu_ctr __percpu *zonelist_read_lock(void)
{
       return srcu_read_lock_fast(&zonelist_srcu);
}

static inline void zonelist_read_unlock(struct srcu_ctr __percpu *scp)
{
       srcu_read_unlock_fast(&zonelist_srcu, scp);
}

DEFINE_LOCK_GUARD_0(zonelist_read, _T->scp = zonelist_read_lock(),
                   zonelist_read_unlock(_T->scp),
                   struct srcu_ctr __percpu *scp)

static inline struct zonelist *pgdat_zonelist(pg_data_t *pgdat, int type)
{
       return zonelist_dereference(pgdat->node_zonelists[type]);
}

With this the zonelist cookie checks evaporate, but you still end up
with guard() at every walk location - not great, but better i suppose.

I was hoping this could be sunken into the zonelist walk macros, but
I haven't seen that pan out.  I've been spending a lot of time auditing
that code for private nodes as well.


On performance:

I've been hammering this with will-it-scale and a bunch of workload
tests on a variety of hosts and have not seen any obvious regressions
outside of powerpc (which i can't test directly, but SRCU-fast requires
atomics for powerpc from what i can tell - so it will eat overhead
without a fallback... if there is actually any hotplug ppc hardware out
there to care about?)

-- 
~Gregory


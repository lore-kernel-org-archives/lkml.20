Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562469;
	b=mgvz8vxj0CTwaeakbP+CSYzjCWa+X58Fue3Rr5hNsUkPSaZ47w92gOAhXYbZPmzUS8bB
	 ooqMxSrFXWGvlJ9abm1JbvZ6pH/e60M++FrQfUogTWp7UQwxP/t2HAkse+pLqfOEp/lxP
	 1PJrha4o+SbFeg0EK0Gndq0073ANb+Xd69WO9GolAxGevV2GhDpMib5LNi8zG45FQzoaK
	 llMBXmsOxgCiWCR1/uqHkGbS9WHJpnimds1piPE5sETyNPKGCcoHWdftvWTsDPMKupHuS
	 PK38SEM/dREUSKinZ94sK0KFCe0gZaJO34swCZbbcpFP8gWe7Jm+TF0lF7cwZl5saCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9AgnBFgzwSTx7fvIgDbapaFFdCAQNBedUyXmODA5aYw=;
	b=TObvpb6/JnhuO6S4BsfjleJckYRFB2mk4KEPt3dGCaVGZosKCXD1wXFZ3bjWaca6CW0L
	 ex/tYU0F2ra74UJ/Rkfxd49dqQd4xX5iYpu/m5dDpBCFCiqlceWb4DfUx8UxC82LkLnkD
	 VF3oDXkCxyYHUpy8Uy+IcsGBGHcA8brx+InW1qDP8dx0YHjXdUcHtnxf7wOOFh+4AdYMR
	 yBh3Lx5iK7HeMpr7RcYe8SZcKDqJl/LDu1+7jsWQeeZS4f36WUz9JVMkC43jPE21nYILD
	 D/44bK2AFCGiYQ4UgdboWcXbtPMTO921zQXh51uwHD/O4CV+vlSa7IxWxGK4Y0nqcjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j3bP+aTb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 559D3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j3bP+aTb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1110866eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562468; x=1793167268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AgnBFgzwSTx7fvIgDbapaFFdCAQNBedUyXmODA5aYw=;
        b=j3bP+aTbpxZkXkMIH0Lnju33gNvwyi4iv/kBjrkTe8+qpm5HiygrcystcpAo16SRIG
         IoBqk6VWyVRnHZzUxW3V6tPx7lxWGIIzT+mOPHjMT242cwqjSANu76SIQtRUZ4Ba+NmP
         D9YWUIB5oSwJCFUjIaea/UgRZw4USzaNhQBprvSDk0KD7ksTE4m+wAIUE6U+lfJ5bI4A
         0GVF03mDzpt4HZ+vW/iZaarWNx2xGIuGLZWrklcABPgQ/OE5V2+QgtVnKsoDIYlMTO26
         fzSSWpvtbuYwHGhSwKxO7sSw1dqC/N7VAYEy5xP8OLCz/fWiB032uDsrQfIpfjqUg7uA
         FSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562468; x=1793167268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9AgnBFgzwSTx7fvIgDbapaFFdCAQNBedUyXmODA5aYw=;
        b=EFiRnR0+p2Rl5RuJpXIcqeqtfBhRPJCm9OvTW2Uwm0RpCnlMlv9ChH+qbeHph8G59r
         Kml3WHSWmcOA8mw/WHUp/oBVP14NMFrXzzfpK4Ev6Vhmpx58LrmO3dzibShiivPYgpEQ
         A5m4fxfMneamWv7h8X8R+wQacnrI2JwpRyB1YO3ZfllIkIBa9WMxP2NTQ3O6aYDKG1Hv
         TatliKyzApTVEJ4c+HLc9UGbVcZs3DofBpcuHw/qz6XYFhZKNw4n4kWkRgneMGJBVXBI
         N0h6LBobN4+RCllVL28/xuuK4balgCBOhIfq8MscehZP5/YsMMfmdKgYEqSpX1R+MmMH
         Bkzg==
X-Forwarded-Encrypted: i=1; AKwUvBxeneSyw9o00TrfWiXEavLaIHovd8fTry6uiC8C3VLHfQHReR//3foutpApZy3yN+bFcfDmXUc19FvzJmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq/Rz7W1aCsnvyhpVBRowob8LIPr9eqwq0KQb9HgluBzHQbfm/
	cRNTQ912v8V8MUwO/IiTbL1mT4YEQRNq05654uHlwQMfmLwGKbcZoX7s
X-Gm-Gg: AYBFou1auHQfIy/o272eiK1k6ha5SNWhebB30Eawe7DC/gE7pAAyrOA3jZnoIFJrDtd
	z4FNjxAuHrgJVx9TbLaH0b0iAs0RpdrAiq7xQ80JOhm68vFKthft81pkNZtc1sPEI8oGV6uO45R
	MhF2+QLP8w598Au6zx4T6dA4itPrtM+7HNltIXWCy+ha84r1hokMC6/KC19w7B2xM535GNYzbBo
	vVyccuE833NgIuhCeDljyzgVUm1X53oTV+nqmTh7dOL5BFNG3JmNogHNg9/x+pIo1Fp2ws4HVvI
	i9UjKNoPR+IpCNL17Ym2mSoxNMeDmTZsI5nH0l64hWEaSOAWr8kgwliJdTR0CllTwKQNP9Gxa+2
	5E8w3WFI321JRF8PYf9XaPaFAuubcXZaJnVtmhKJHztC10pPBngdyfyB/vW6Jy5mIe+IYA0KZgJ
	G274uaOyCMOYus7rriG//Fo7xYx2KG4udV1tQ+/7+XZENG5dHlg8n2JJ6PQ94b9LccvColcyPsX
	kA5ixAZq129z6qUZeqtf1KXnMLFsDwzNyTACzbrCLXtNgyd1bDV/kE+n59fyEK+5ZWUCzKsAQ==
X-Received: by 2002:a05:693c:414c:20b0:358:2e30:8e5 with SMTP id 5a478bee46e88-3674b62ecdbmr2229193eec.1.1792562467921;
        Tue, 20 Oct 2026 23:01:07 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm4408666eec.12.2026.10.20.23.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:01:07 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: vbabka@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm: compaction: mTHP-friendly memory compaction
Date: Wed, 21 Oct 2026 14:00:59 +0800
Message-Id: <20261021060059.2253219-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <11264869-00ad-44ea-b39c-a78347af0ee1@kernel.org>
References: <11264869-00ad-44ea-b39c-a78347af0ee1@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/20/26 16:52, Vlastimil Babka (SUSE) wrote:
> Isn't using  struct compact_control clean enough? There's already many
> fields like
>     bool direct_compaction;         /* False from kcompactd or /proc/... */
>     bool proactive_compaction;      /* kcompactd proactive compaction */
>
> Who says is_via_compact_memory() cannot be refactored into something using
> these kinds of fields and not 'order' being -1, which could be then used as
> the target order.

Thanks, that's a much cleaner direction than reading huge_anon_orders_always
and would also address the race I raised in the second open question.

I tried to work out what it takes, and ran into one thing I'd like your
opinion on before committing to an approach.

Today order == -1 (is_via_compact_memory()) covers two callers that both go
through compact_node():

  - proactive compaction         (proactive_compaction = true,  order = -1)
  - /proc/sys/vm/compact_memory  (proactive_compaction = false, order = -1)

and the real order-carrying callers are:

  - direct compaction            (direct_compaction = true,     order > 0)
  - kcompactd normal work        (direct_compaction = false,    order > 0)

The issue is that /proc/sys/vm/compact_memory and kcompactd normal work
differ only in the order value (-1 vs > 0), and both have direct_compaction =
= false and proactive_compaction == false. So with the existing bool fields
aloneI can't reproduce is_via_compact_memory() exactly without adding a new
field, which I'd rather avoid.

If instead I give proactive compaction a real target order (and keep
compact_memory on order == -1), the ambiguity goes away, but giving proactive
a real order is not behaviour-neutral: several paths that proactive currently
skips because order <= -1 would start running. I went through them:

1) skip_isolation_on_order() - currently proactive takes the pageblock_order
   branch, because target_order == -1 short-circuits the first test:

       if (!is_via_compact_memory(target_order) && order >= target_order)
               return true;

   With a real target order the test starts applying and would skip isolating
   folios with order >= target_order. That is close to what patch 3 does, but
   not identical: patch 3 tests order >= compact_hpage_order() and
   additionally gates on mthp_always_enabled(), whereas the native test keys
   off target_order directly. Whether patch 3 can be folded into this depends
   on exactly how the proactive target order is set, so I'd treat that as a
   follow-up rather than a given.

2) fast_isolate_freepages() - currently returns early for proactive:

       /* Full compaction passes in a negative order */
       if (cc->order <= 0)
               return;

   Here the order == -1 is doing something deliberate: it keeps full
   compaction out of the fast freelist search and on the linear free scanner.
   The fast search is meant to grab enough free pages of a specific order
   for direct compaction and stops early, which is at odds with proactive's
   goal of scanning broadly. With a real target order proactive would start
   taking the fast path, so my plan is to preserve the current behaviour with
   an explicit guard:

       if (cc->order <= 0 || cc->proactive_compaction)
               return;

3) suitable_migration_target() - the free-block test changes:

       int order = cc->order > 0 ? cc->order : pageblock_order;

   A free buddy page is rejected as a migration target when its order is
   >= this value. For proactive today the threshold is pageblock_order, so
   only very large free blocks are skipped; with a real target order it drops
   to the mTHP order. To keep proactive's behaviour unchanged here too, I'd
   keep the threshold at pageblock_order for proactive, i.e. gate on
   proactive_compaction rather than let the real order take effect.

4) compact_zone() end-of-loop drain - this becomes active:

       if (cc->order > 0 && last_migrated_pfn) { ... lru drain ... }

   (capture is not a concern here, proactive passes capc == NULL.) This one
   is harmless, but for consistency I'd keep it gated off for proactive along
   with (2) and (3), so the order change does not alter the proactive path.

5) compact_zone() start - this watermark check starts running for proactive:

       if (!is_via_compact_memory(cc->order)) {
               ret = compaction_suit_allocation_order(cc->zone, cc->order, ...);
               if (ret != COMPACT_CONTINUE)
                       return ret;
       }

   This one is different from (2)-(4): it may actually be worth having for
   proactive, so I've left it for discussion below rather than gating it off.

A couple of paths are not affected, since proactive already diverges there
via existing flags: __compact_finished() handles proactive earlier through
cc->proactive_compaction, and fast_find_migrateblock() returns early because
proactive sets ignore_skip_hint.

So my plan would be to let cc->order carry the real target order, but gate
(2), (3) and (4) on cc->proactive_compaction so the proactive path keeps its
current broad-scan behaviour - i.e. the order change is purely about the
target, not about switching on direct-compaction paths.

The one I'd genuinely like your opinion on is (5): the
compaction_suit_allocation_order() watermark check. Unlike the others, this
one might actually be desirable for proactive - it would stop proactive from
compacting when the order is already satisfied by the watermark, which is
close to the "don't compact when memory is already sufficient" point Dev
raised on the sibling thread. But it layers a watermark gate on top of the
fragmentation-score logic that drives proactive today, and I'm not sure the
two should be mixed. Would you let this one take effect for proactive, or
keep it gated off like the rest?

The other open point is the one you raised: compact_memory and
kcompactd-normal work can only be told apart by the order today (both have
direct_compaction == false, proactive_compaction == false). So a fully
behaviour-neutral "bool instead of order == -1" cleanup isn't quite possible
without a new field. Do you see adding a field as off the table, or is it
acceptable here?

Thanks,
Bo

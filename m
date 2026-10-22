Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703235;
	b=qMtWVvRncRt7q3OPgh884usDoZDiJzS+3AhWQOjfhhCPJDQwZ+WUm7FMKX5NMsg5z8sN
	 CbNZ1xKpnEy1syek1e7Muhx3oECGg1R3P/fOvpjjoJshSByWP/WNqmwtOV8Z6qLJ1wVsO
	 Df9eOEmzTGTAvGLXrIF8cERLTB+HujYbunGgeIiCH82yi5dsBFxP0azLSRVeBLnVqVFvO
	 T075Gv2JhsmHM2KXevh8hi51Ht9tiIFRfelDrdBQewcJQN8E8iN4V4nCsqeswV3rwHu6I
	 QpjLCh6diAmhwrba/YA6nAVzKNBDKoFHIXtET6rPkL1miBf+9l3xRMuok0qtjvhHeHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NVvn1gdNdOMG1Op9Y4sTxzvbtS66jmeV2bo4ZFR8VLI=;
	b=Tvh+XTos+14ki4/PmwdGayc69AaZ32gRertwrqwfWWoCF8K8+A1edRr1+9oac1Bgc8g4
	 0ucbKhkO00MBm5koiVyQEWeLrnH2689T9XEFpaEqqGpK2bZM/czSu6SK2+eQZ/a45JBON
	 BjGYCl+s4uxXSDvdryDcvTDvR96kYLmDwxaDbyoybsmENx+bCU1Ri0toBpghTL2j5CC6E
	 Zu1yz/7av+cEwrLKbiFXtqewovhht+SNEn83xvJxvzklaxGz8MlhUA5Ywgb6YH1LHg83a
	 P5VbFYpt8PfV2ihI3+qEGhrMb8y7HeJ4P7idDCI4q7t6ZsCF0GvcEQb9OyMKkB4U/VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=olx4JrPb;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C65606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C65606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=olx4JrPb
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d126f631so2607757b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703234; x=1793308034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVvn1gdNdOMG1Op9Y4sTxzvbtS66jmeV2bo4ZFR8VLI=;
        b=olx4JrPbTJON6uu/e0HpthkcMLPl3IbXgrBUXnWQ1ZB0ZMNZnS1liLRiNzhzv6Oc02
         m0oJwdBWjglSWge+n6lYJQ0d1PLVFdRfITrzMmuDuOOk847PZK4ra448K6LqqJQZlEZk
         RG+oBe1+fleIgogLpmFVTyf8z/DQ1qM4/2byE/Gq3/awQQHakZgLASQIZdPYBCWwsKZg
         NdJLtV0uwL/7PmyTZVQUdNRufgTAb7cf/JqO3W4J+1WoW+vfmuvQy6RZx+9WfJnHkI7D
         1LxkOlNLpC6gmCzuSZBtWilHLfmaRao0gNdtwBxhG1lANBSaEbQ3cWE/wubMrHisthjC
         tfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703234; x=1793308034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVvn1gdNdOMG1Op9Y4sTxzvbtS66jmeV2bo4ZFR8VLI=;
        b=h6Xe3ch66pCvuLJGpftpit/wh7MWCYoehQGGvnHuMlu2LFyK6Wj3YRYOgYUdM2utLP
         24gOWFmKuT+cbgenPnRnm7uN1su23FdwqaGSan2xpHgn1GDzptpIn7HUmTzNoAThnoLB
         P72KgOjDBlPeUw6tJOFUmM88Gw2FsG7uxSFsCguPDntCdI5vyN9ymSNc5PMBFLcEUin7
         WnrrAJkie7gM42pFaFw4qYvLfHYBPxaNfn7V/tZRMVPV4183WewW8t0FORyACDLg4nMS
         6xVHiDdbUEEQbs9qOcWTy7EGpBU71wqpyaBo9of8qFL/DqVbCrXKASn1O5q4iSXK/ENP
         4y5g==
X-Forwarded-Encrypted: i=1; AKwUvBz+WWv15lNwUK+tS3gxsHofC6wFS8yl/nD2qQs8cQyfbxPB3VzSzeb/+U8Ago/z1GWfmLQ5B97QUYE03Ho=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4kjrzL2AvyIUxaL52p1l1wQMwyDQxa7fCRTMmRN4hIVnjCJsK
	5zlecsUTslEJmafjNfFsNMxmOBJZI4sPvWpN8TOT1BbXZR2BLwB9iicD
X-Gm-Gg: AYBFou1i7kpiYSfA2bmD/qE+iUNmOtgTJT1FNpcZsUjbi1XLNZHiURlTiUo/ahJIkag
	VG7p/RWc/t9d4+wMtLnAemfRrECIltWjuMGyyWeng/cTSFyrsgpYLblzcdxNUe3847XkbQw7NnR
	UbdfXCvTGrIxNl49HdzE14j7i70icqa1rRT+Rh4pDtWVEl2F6p9LttUnv3wiB7UDg8md5HajJve
	V14zPu40kDJOkOkqDBL4UCpLjFRPRpauZI7pu65nHEtqGN1LffS2iaV3+hDV/k2f3vqTX+Y8x7p
	bBLmRwoal+k3f/Pok2/deQrI2FJn7a32QSUBNoD+ZVsd1AeTZ1kXIlUop9QMy9hegbBu5UCTSFe
	bMX4SHkVr4Jqz62iwR1Hx0L0VKWyXfk1HQOx/5W9js6M19Yh+FoMdKtQx6oTJeiaTqjS9C1xil1
	uTi34niftkSpZJKFp6hmhRg+pINPpmhQ+AQ30r/60e5AVOyIIzdA3DBx+J7QEgJlvw8GInUOk6n
	mlJHxoePTPZO1UjXT2/QFIFgnCdDfHrsoERKN+IrgWMBWmVipESwyjlao9hIRXU0Z17sWRlkaEU
	LFzmKnLuyg==
X-Received: by 2002:a05:690c:399:b0:8b0:cee8:53cf with SMTP id 00721157ae682-8b157ba3ca7mr2672967b3.3.1792703233988;
        Thu, 22 Oct 2026 14:07:13 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1560cd3b4sm4094037b3.8.2026.10.22.14.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:07:13 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Zi Yan" <ziy@nvidia.com>
Cc: "Joshua Hahn" <joshua.hahnjy@gmail.com>,
	"Gregory Price" <gourry@gourry.net>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"David Hildenbrand" <david@kernel.org>,
	"Matthew Brost" <matthew.brost@intel.com>,
	"Byungchul Park" <byungchul@sk.com>,
	"Ying Huang" <ying.huang@linux.alibaba.com>,
	"Alistair Popple" <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm/migrate: wake kcompactd when huge folio migration fails in numa balancing
Date: Thu, 22 Oct 2026 14:07:11 -0700
Message-ID: <20261022210712.1239721-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DMBLJDUCMJI6.2RDRAALJ84225@nvidia.com>
References: 
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

On Thu, 22 Oct 2026 14:59:17 -0400 "Zi Yan" <ziy@nvidia.com> wrote:

> On Thu Oct 22, 2026 at 1:25 PM EDT, Joshua Hahn wrote:
> > NUMA balancing migrates a misplaced folio if migrate_balanced_pgdat()
> > finds enough headroom on the destination node. For large folios, it then
> > allocates a folio from the destination with GFP_TRANSHUGE_LIGHT, which
> > wakes up neither kswapd nor kcompactd. This means a hot large folio
> > trying to promote to a fragmented destination may never succeed in
> > promotion even after repeated retries.
> >
> > Wake kcompactd on the target node when the destination allocation fails
> > for a large folio. Don't wake kswapd, since this path can only be
> > reached if there is enough free memory to service the allocation, but it
> > is too fragmented to serve the large folio allocation.
> >
> > This patch has been A/B tested on tiered Meta systems (DRAM + CXL)
> > running identical cacheing workloads. Without this patch, we accumulate
> > around 4.5k failed THP migrations over the span of a day, while the host
> > with this patch accumulates only about 80.
> 
> Is proactive compaction enabled? If yes, why does it not help?

Hi Zi, thanks for taking a look!

Yes, indeed proactive compaction is enabled with vm.compaction_proactiveness
set to 20. 

Hmm, I wonder why we are seeing this difference then. 

One reason that I can think of is that kswapd is awake very often. My
understanding is that proactive compaction does not run when kswapd is
on, with the idea being that if we can free memory, compaction becomes
easier in the future, so we should try when kswapd is done.

When they overlap, then proactive reclaim is suppressed, so it could be
helpful to have a manual trigger to wake it up when a high order
allocation fails. What do you think? If it would help, I can add this
detail to the commit message as well.

Thanks again for taking a look, Zi. I hope you have a great day!
Joshua

> > Those migration differences leads to about 25% reduced CXL bandwidth
> > usage after applying this patch.
> >
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> >  mm/migrate.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 7bdcdb57652f8..67364fe0851c0 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -2671,6 +2671,7 @@ static struct folio *alloc_misplaced_dst_folio(struct folio *src,
> >  	int nid = (int) data;
> >  	int order = folio_order(src);
> >  	gfp_t gfp = __GFP_THISNODE;
> > +	struct folio *dst;
> >  
> >  	if (order > 0)
> >  		gfp |= GFP_TRANSHUGE_LIGHT;
> > @@ -2679,7 +2680,17 @@ static struct folio *alloc_misplaced_dst_folio(struct folio *src,
> >  			__GFP_NOWARN;
> >  		gfp &= ~__GFP_RECLAIM;
> >  	}
> > -	return __folio_alloc_node(gfp, order, nid);
> > +
> > +	dst = __folio_alloc_node(gfp, order, nid);
> > +
> > +	/*
> > +	 * A node with enough free memory might still be too fragmented to serve
> > +	 * a large folio. Wake kcompactd to help the next huge folio migration.
> > +	 */
> > +	if (!dst && order > 0)
> > +		wakeup_kcompactd(NODE_DATA(nid), order, gfp_zone(gfp));
> > +
> > +	return dst;
> >  }
> >  
> >  /*
> 
> 
> 
> 
> -- 
> Best Regards,
> Yan, Zi

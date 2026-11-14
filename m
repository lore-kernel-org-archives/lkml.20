Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667429;
	b=jMxnFdPGOIQVgaAPbUDADeF8jFHrSJXxAD5x1cJ1aULT8UQlZtORumAfFCda1yyKqZmH
	 y5ied44UDz0X2DsfWk3DVdJ6Fl7+lla/GStRcYX5zAn97NPqwfU86015LD2MtPMZKqhhi
	 nXiSLoMaAGzPBPxGutg+tagbTjvKbs1m1dzqL7U1/ksGQt5Mf0KP15XelWmP0vqD9/Qm2
	 onSemUhJbclFW4oXzZWB+sgZXHAwD4PAUdPXxcq/pJmkKqq184L/6+h/fsKQaHvwwGnZz
	 xoxbEzCsNg1msot1m4pC6yFwIW0wcAeca2UckcJQjkLwnRwkujw8IKn9JRoz+JgF/vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667429;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cQfy721NNRPf+g5PYMlJDCkNFHuywBK8RJ9ovzc/M4g=;
	b=CEKpFwwdQGQ8xoK+RXI8dukmoRc1c0dF27zRtGOhRCUDl/Q3iB87mm7Q7cN+/PNW0d5J
	 OPegi8BNWPzLGzyDT8PEr+xtEXU3Blp6ApS0HxpmRASV/js6qN/7NSyGU+drjSI+n/m5b
	 cv4UsoRyCPmJLFXtuFkwuZLIJ2NpziwvgmCb7oUtKxWwV8x60yxxLzH1k2FQfuVDonjN9
	 Nxfe6PuYdP3zNRVI0qrTFWbuFcaESQuPODMOd87e32QdqAhVdMP0/XVpF/YmjuWT2auPM
	 rKL2w3+/uU8MbvRjnb8cUlCyg+/Qthw9xgsmBqX6fGkUtyoaQ32IQqYHgYicJHHL3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gh7SvrVi;
	arc=none smtp.remote-ip=95.215.58.4
Received: from mta1.migadu.com (out-4.mta1.migadu.com [95.215.58.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE6606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DE6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gh7SvrVi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nVJDnAuiRTm3tfpghP9IJ2QoHn4bNdNRote40uYVmok=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794667425; v=1; x=1795272225;
 b=gh7SvrViVdvLo74BP+WLY44sj9oq8ojTkBek32BlanZAyuqbnr8Zro64mEKQTMyA3o2qcPkG
 4NXHVu7hOnWH86hwLcrl9uK5IFGBPLpkSKDp1jHy3mLaqB3aQy8H08qme4eV7zdplwyWGvSkWke
 q+JSSzMe3SUkZX3pr4nOYNmQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d35b197d40729a00;
	Sat, 14 Nov 2026 14:43:45 +0000
X-Mizu-Trace-ID: d35b197d40729a00
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: david@kernel.org
Cc: chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	xu.xin@linux.dev
Subject: Re: [PATCH 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
Date: Sat, 14 Nov 2026 22:43:38 +0800
Message-Id: <20261114144338.644122-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <00521fb1-121d-4aef-9278-fb6b36755291@kernel.org>
References: <00521fb1-121d-4aef-9278-fb6b36755291@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> > diff --git a/mm/ksm.c b/mm/ksm.c
> > index 49977bcf04f7..e79e64372e49 100644
> > --- a/mm/ksm.c
> > +++ b/mm/ksm.c
> > @@ -2640,6 +2640,49 @@ static void ksm_reset_unstable_trees(void)
> >  		root_unstable_tree[nid] = RB_ROOT;
> >  }
> >  
> > +static bool scan_begin_new_cycle(void)
> > +{
> > +	/* Check if the cursor points to the head. */
> > +	if (ksm_scan.mm_slot != &ksm_mm_head)
> > +		return false;
> > +
> > +	/*
> > +	 * A number of pages can hang around indefinitely in per-cpu
> > +	 * LRU cache, raised page count preventing write_protect_page
> > +	 * from merging them.  Though it doesn't really matter much,
> > +	 * it is puzzling to see some stuck in pages_volatile until
> > +	 * other activity jostles them out, and they also prevented
> > +	 * LTP's KSM test from succeeding deterministically; so drain
> > +	 * them here (here rather than on entry to ksm_do_scan(),
> > +	 * so we don't IPI too often when pages_to_scan is set low).
> > +	 */
> > +	lru_add_drain_all();
> > +	return true;
> > +}
> > +
> 
> Can we just leave the lru_add_drain_all() where it is, or what's the reason for
> that change?

Sure, There was no special reason for moving lru_add_drain_all()—I just wanted to
keep low-level details out of the main scan function to make it look cleaner.
Since it is going to be removed soon anyway, leaving it in place makes total
sense.

> 
> Note that that might soon get removed either way, so I wouldn't worry about it.
> 
> Then, I would rename the function into something like
> 
> "scan_should_start_new_cycle"
> 
> And keep it simple.

I will rename the helper to scan_should_start_new_cycle(), keep it simple,
and send out v2 shortly.

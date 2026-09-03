Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1ED37B016
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451342; cv=none; b=XvoOXtqpHLJA+GATIpQ+kC7NC7m+3CNA/6QsoXZqreOYps0P3SWBarsv5t3DDHTpLlUMp47uBuJ2/nwaXhA/S+frvXPGaNbh56bJdEp1oHu9hvwQKMrgrDM42qrvHed6hxrOl1uF8pXJq0JLVfBBvXxl60VV33+IerA0BmepdF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451342; c=relaxed/simple;
	bh=Z8pfmrFHHj0HpHpQjmpJ/+l2To2IYKdZaHog0klKdjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0gpR5U0zNOrUPiAK8nIAOmwJLs71RQehqeopVn8YuMhqv93imEcZGMQfWeMQruspO0w8tmH7L9adNHezQOPPUtbc20RPIcB9NSFvzLMSQDbbxIkmqsLdfsuLTubD9WCzQIFJ3ff4MK4pgvUk4kApsFfnqFVxr3kMjqMaYFkpKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SPQdfXPb; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SPQdfXPb"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9382fbb1208so291756885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788451339; x=1789056139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IeBLEUe4Txls7CrzDF2+rKGQwzvkjoK2NOOxJbGtILE=;
        b=SPQdfXPbbyqxNwA7n6lnR1/ww6A3b5Latf4K1ITAlFa7E5eFkUepNWjQvCq5xIkmgA
         QWfd704NUuAdkSvAYdTxLKSoBXoGTEaZKS/OBvdEmILNOQashDCbZoMxFxN0qDa9SYOL
         rhqrM3jYztbNI3UAg/C65DvjqY11TfbKBBMZqhGDcXYqJMsQYw1PywyR1oq2FDqdnfm3
         h507lo7c0QSJqyCudIzHPGtb6zatsusTFIJNj048SCZkJmOgkH7KyRHIVMY2/zH8RGc4
         UeZ22Y2Smxsb/s4pLJHiBXEezG6KOm6QY1wEoZc9u4RxpDXzRLpkLlL9mQ+eH74O6u3K
         /WYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451339; x=1789056139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeBLEUe4Txls7CrzDF2+rKGQwzvkjoK2NOOxJbGtILE=;
        b=hbEpTSi8u73nGd7Hyw+9SGsDMIeEkJYpFeHuqfNqYh2RvZdEfJXAn51iRaj+NFHV9T
         XOChZr6npFQuSiNbpRmPPGf1Sh/OBFQ8dwmSy/x2sJjRsG31HaS+Fx135cQiAGP5qELu
         ykOsU1zw+zdfTNeix2v0G9CMFhiAToI2hfQR28kUAlmIccbBqiNkI92ATd1cJ/LhcLYG
         HF2YvHx0H8VmtQpUq6ByfcxqaDxGJmkzEPUpuw+jnn9gJXzdO7ha+z0pOurhqw/WS0SQ
         oPw+4mCFsOWaX+owm7TE5P56lif/AQDyP1pX05Erf1ybCaBaogi01aDdZY1fT9KFixPu
         exLg==
X-Forwarded-Encrypted: i=1; AKwUvBwed/04bvHpBuA63KHQH/yfuvtTRc6xM+cGZMZeZ7pt9vIRmrCkQIZcdIGxyavofAaLovVtVZunvtuqZbk=@vger.kernel.org
X-Gm-Message-State: AFuF++kO6HIt1qqhZUWkomxusSTMJEABGym5e2YdcH0LmjF41im328Nc
	Uz0jfwTsBAdW7YqDO7pAAqz2h09iV4eNyFlyjuhX5zjVJu8DRsMGlgvl7HNTzFVb9kzEyOwB0Bs
	cauCxfPA=
X-Gm-Gg: AYBFou2kb0iGHXOI2UUdNVu12wNaI6HmjnyybaHbN09sPFeHSU5udABb8EJr7brlFYL
	PkWcy1IP/USnFNbC/Llw6mjImvGoC3sKU6lnjXlPMuV+654JTfnG7Jra08KN18ciSkF8BcComu2
	fBFcJN+mkvr3KtW+QU3aPfZvyGd0Fq0sj+IUsWL014G88qKJy0QAioKmscUEznnL7/KP2kxpIAm
	qwAqra7a+2DY0SiCWoDJ1ScD4fenpvc9eb+p0lE+YJgXwwXOn9UKBxs5p5pWMIeMqPVwA0gLMHE
	J5bD7JG189CSBh9mvOZsJTYS+I91i1JZca/1XqSfpxEHCtxgCjenOTJYefWZWoOzjmonUD1IZTn
	4pPw8o7Nhc2yS8UfKwnKyO8NL4uK7NL6OATl0iAzGcFMbh22ZoyoJ3u3EfdYeIrTx7lrBG39079
	f9+3n8zwfFN3nP587feNL98ILAngmKRmT+yghIXNVIINu1QzTxZlQE7wDDOENNNhttsiVSJynKU
	4t3t2pc2Dc0/EHi05fbYUZlUoeb8cr8u2DmLMzrPVGF90GZ1n4VJBI=
X-Received: by 2002:a05:620a:2893:b0:939:13bf:e861 with SMTP id af79cd13be357-93960fdf704mr1567190185a.40.1788451337838;
        Thu, 03 Sep 2026 09:02:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06c72sm47345616d6.3.2026.09.03.09.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:02:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:02:14 -0400
From: Gregory Price <gourry@gourry.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
	hannes@cmpxchg.org, ziy@nvidia.com
Subject: Re: [PATCH 2/2] mm/page_alloc: refactor build_node_zonelist() out of
 build_zonelists()
Message-ID: <apmYmJSrOX7JyUVY@gourry-fedora-PF4VCD3F>
References: <20260902215853.156267-1-gourry@gourry.net>
 <20260902215853.156267-3-gourry@gourry.net>
 <9f67cacc-b063-48b7-81af-09858aa5dcdb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f67cacc-b063-48b7-81af-09858aa5dcdb@kernel.org>

On Thu, Sep 03, 2026 at 05:33:42PM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/2/26 23:58, Gregory Price wrote:
> > Extract per-node fallback-list construction into build_node_zonelist().
> > 
> > This lets us build new zonelists from candidate nodemasks instead of
> > just the default N_MEMORY node state list.
> > 
> > No functional change: build_zonelists() builds the same FALLBACK list over
> > N_MEMORY with node_load updates as before.
> > 
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> 
> LGTM, but, while we're at it, could we just do the pr_cont() printing in
> build_node_zonelist() itself (maybe behind a flag if you don't want to print
> from future new caller) so it doesn't need to pass nr_nodes back to
> build_zonelists(). Then also the node_order array could live in
> build_node_zonelist() itself?
>

Seems trivial enough, will let this sit for a minute and spin a v2.

> Actually I wonder if we could get ride of the node_order array completely.
> It would mean the loop processing in build_zonelists_in_node_order() would
> have to be done piece-meal in build_node_zonelist() itself. But seems
> feasible? Depends on how you intend to reuse/extend the new functions later,
> I guess...
> 

I can take a look.  We've been testing a couple different things, will
see how well things generalize (private node fallback lists, inverted
fallback lists for proactive reclaim node ordering, some other stuff).

~Gregory

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287387;
	b=Abu+t7o2P6zCOksrtips5H1y0YzIrDviItyxnkyblR9SpVJdPfvzJzx2EIpjRyPszel9
	 8TRI6s66xQWmiycj+VAkcVAgi3WrQCtegkrEJaljI4C//+aIoJ4fnPHtqrbca8QVV+0zg
	 ULRJ0u+Hz1+4LziwyUkB46q4T7qlM25USNbSZAEDKhVY30WJg7mpqM0gHYYAE0GO4Hdfw
	 zWAZXBbMrB2ep6Ll6qm6E1ZsYPcN30ZWU5c8E9jU1XgUXh6RoCwLs9oPu5TlxNfOJPsXK
	 Ip8xg0qjynFBxQEDThiI/KCFD11ox5vFDCabcUaQnKzkfSUNjMjl7sTzVcxSRvQnLCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9nI/EA+STEPCGq9S2NlF86HxTqJD0H0ath9HnAszLms=;
	b=NPCkgAIxIln6rhoPdC2noS1RSfJI93mvTHLYI+2RBVameWCWl/xYY51ulV4UKLv2tugN
	 WlbzZJ7Y1obtWH0wwt6YBDzxNT9rG079jHYOugmRTFhp5r75r3YH7f2OB5rj65+esNBQJ
	 TYhb3AR9SJYZ3Fe/O8jGO/RwFlKn8D6wKDZEdujeH7uIl7wPNYDIaqnPPgw41mQmKtG3A
	 NRsKKAD9IkGocVye5qbw/ozVMZm8hf0yn4N428uPFPwoVA/gjfguGDIeq/whCfbSh9+96
	 Fp7fZ37jZxyKbseIErX14XlSSRU2rdY4HnWd74CXIRWqL04RVkLpfoTiO+qCVuKAtcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X7+hQdx0;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8DD60A261A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8DD60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X7+hQdx0
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b600fae14dso654589b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794287386; x=1794892186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9nI/EA+STEPCGq9S2NlF86HxTqJD0H0ath9HnAszLms=;
        b=X7+hQdx0yyA9roUSBEbNrghAiQdwgxCGw+u08pYEgpDuVe/254alZ6BqYpQDmWWLCa
         rjbEutU9tL/gRvHmKMTjch9ruRmPPYFqn9Zd3a8lsdpZbpzmyw3HfY+iTgXKRCji3Tgt
         XdKybJyR8d25fY5DNSBXB5u0pFlyZNxVaph1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287386; x=1794892186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nI/EA+STEPCGq9S2NlF86HxTqJD0H0ath9HnAszLms=;
        b=SwmugcQUHyrRHzM//R/su2tOgdCbW5PupWdCP1PX2w4SrycB/sYPph8d3jCwe4H2yF
         jPjSguNOCb5F14EJak1fT3kAaGfmlRjl/551NtzzwZCHIVEbWH1qRwat3QxfqtPV5ji0
         b65WXSRJZ5xcj4NalZ6j2ZpoGrDUrlOFVuPwI2aWn/hvSytwqKZPbCHCCM272gbbXLQE
         NQZfVOgssZNl40NhH+/6dijDNpkBHpS5iZ8LloHmOFmE2SDY1iKh4QiRXH5dYqXIw94F
         phRK3Zfwfr1EkbCmMDW7BgQI47OX/IzfGtlX0ZHu5YXhDWnVCcxu4GTemeN8nWRMpeup
         lfVQ==
X-Forwarded-Encrypted: i=1; AL+hErFCRthgnrrHHo87B2huAGoLYNb6KQXhIqMl5PCfPkAJurYvQWpErMKo69q4Cxq/JeuyMLEuH4+o0I8nSkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GxErKLeK3zF0Fyyxd9qZMsVQ+IsO7Tv+RXP3geflfoaYQnOpc
	e/KEfzCmrz1uMBh3T+IXcbSrMcKL1ij5PNuYb7pjTgYEk6sYJLmKCfrNGQ8mnLh4hA==
X-Gm-Gg: AYBFou3FL0+3ThLq2YoYrFIcOnnUhBNyy6szS2Qsni5dwCKwsUEHi3ES4BQojcWJXYd
	pVg53jbRvrgJBZT18gnnx7hMEp0If67MNLNdPXoTh0VHL3cky+wPu69FGpTbCOTy49LHoQ5KRMM
	lra9gPKlqxnP244VqR6SFFjQcEaWcHBT+HpI6cjryYPM2zZsaojdWsoROospfuvzAvp+0kCngrK
	F0QN/eTXlHiIe6vJwnQ+OSIbocSPmpDKOK64Ftp6IJ2tKDNNfjkUDrwt9xGxhj3/JXpBdu9spNE
	WUHupzxS6I87KuofCxS5kzeTwjH6ZYm/ikfj+XWISnFo5pwclRdz4cUYbrzn9FIyQQGAaM/wN28
	3h/qglwHOtNeYqzoruDfQHfyJF1k+VO/v6fTCQCZswBtmy0/TAbjcFlyuDkvAkI2/CvxoRUp8dV
	/+dle/Tjrv+spPFpMVZuMKqjuCdYdosMTa9dhWTj0qpNL/+ZTQecfVgDT6zTOQM+CF5e/QMWAMH
	YiRpy1Hyafy1pMGNop7/LaLFYcnxCFoE7zjFokadAuF59WQfEThGbBCLjzOs4bCbCLKvNrXLeIv
	F45qt6LuQgmGPeHezTBebduCn+CccxfJ3NOfTAc6TopgDUrVdFxYr/YyiyMzkWbDrXl3vw==
X-Received: by 2002:a05:6a00:3692:b0:880:849d:c07c with SMTP id d2e1a72fcca58-8ba8590318fmr1720593b3a.25.1794287385925;
        Mon, 09 Nov 2026 21:09:45 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab4fc2b5sm384573b3a.50.2026.11.09.21.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:09:45 -0800 (PST)
Date: Tue, 10 Nov 2026 14:09:41 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 6/7] zsmalloc: fold zs_obj_write() into zs_store()
Message-ID: <avKkvXNesmBRORnn@google.com>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
 <20261105044752.1997895-7-senozhatsky@chromium.org>
 <auy6wQIz89NxpskT@google.com>
 <avKFDz0PGwkbwNgz@google.com>
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
In-Reply-To: <avKFDz0PGwkbwNgz@google.com>

On (26/11/10 11:45), Sergey Senozhatsky wrote:
[..]
> > >  	spin_unlock(&class->lock);
> > > @@ -1332,8 +1324,14 @@ int zs_malloc(struct zs_pool *pool, struct zs_handle *handle, size_t size,
> > >  	if (!zspage)
> > >  		return -ENOMEM;
> > >  
> > > +	/*
> > > +	 * New zspage is not in class->fullness_list or movable yet, so we
> > > +	 * can allocate the object and copy data before taking class->lock.
> > > +	 */
> > > +	obj = obj_malloc(pool, zspage, handle);
> > > +	obj_write(class, zspage, obj, src, size);
> > > +
> > >  	spin_lock(&class->lock);
> > > -	obj_malloc(pool, zspage, handle);
> > 
> > Should moving obj_malloc() and obj_write() outside class->lock (and
> > skipping zspage_read_lock()) for new zspages be split into a separate
> > patch on top? AFAICT, it's a separate change from merging the
> > interfaces.
> 
> Let me take a look.

I like the idea.  At first it looked like we might have a tiny corner
case is when N tasks attempt to allocate in the same size class, that
has zero empty zspages, which now potentially can result in N fresh
zspages added to the size class, each having one object allocated.
But the reality is that master does that already, so nothing new.

Maybe something to look into separately.

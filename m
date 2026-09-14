Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7149219D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404993; cv=none; b=D3lYANr/o6eWvRuxYJNwpPvPE1NVa8K5tFLpxNZbL99h4v1UnJ9pkZ+DQJVGVnrZOP1+QMp2THmPfK+hA0kcUn93d44+dii6NamYKU7wYuay2KFF13P1lreFroTrdpq/AafWhmRMhuK9Uq1enWJM9j8TqCn1ek89mpznBJKTurg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404993; c=relaxed/simple;
	bh=x+JffEREGsUU6rQb26qmBn7I8doItGb1Rk6uWwtNtCY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjAP0bkhr8OplPW9Wjc1ptrAMgije6l971qU/wbz64sR+ywrYyEnCCf8m5NnYHDdFzVUNKh6FJv0RHHNWK72lvObGWYm927C/SfsD/Nu/ME4x5vQ1DYM/QD4d3wDfcZRPWUNUTF/bd+7DfoWz/oGAryAAeyNvVwrgg/T4MSA6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7GYrCKq; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7GYrCKq"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so253490466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789404990; x=1790009790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rux4ku0a2LKW6mMx9aMrLV0v6wtNK1BD3wApxpUmX6g=;
        b=K7GYrCKqY4WHSK/VQwYSUMdGfcLGPLoPn6Zu6DaP3b1VXNjRIZXDcktNK3mN26JAJF
         SdDbtCXKknFwfATj9dnwSPXO/pXXSdFVHRkYID+uvVgFUeq9aNiUESHArEOQI6fhu8gU
         1ZbopEEcvbMZplbkAikSdqfTDIoqqgg64c9oLS2RW5n/p9OagFFfBG0mlsZJr2XI6Yr1
         oA4LAvrrT6EE8kiPrerYMXkpFz9uSF/+ZbhztOsriz3qNu4niV76I82xqMRE3alpCgjM
         YJPapF3wFs7WJwTnSfupxmCNiRCpvU45HLWbMUZnd4FU/NR2bKmvjnH/KjyikcYL47VE
         qHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404990; x=1790009790;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rux4ku0a2LKW6mMx9aMrLV0v6wtNK1BD3wApxpUmX6g=;
        b=YhunTL7mYav1D4O/pl4lIUYNtW0Q1XkB9INP5peuIly2t1JUI2nze3MWNCMwyVM9g/
         kHfYWOwZ6o5CFhQa3YQP0MY/TlUzsKoMNFTnZnd3hzBgJOww62G91kw7TyAwiRH83usx
         G2tpy26xSz7yyqL1MTcZ7dzOQLTVPLInmIFqEawRFWKcSKCmurHqvDif8U3FcjS0ju+i
         O4/5NYl4NsfzpGM/c1KQphtgvSsW2OaZ1OEXQ4Sh8Z/6/i6EoDu4XeR01DZnV5dzh/Zn
         QjPbpaAF00nmv0xQmeouhu2H7jjjZaqgf9lzXBantN/vNNGmC0xBXVHiMtccmtubOFpY
         EwtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO+2mIh3uvp2hpfmsz5lf+B6Jy6maDbQltvIOlZSw1cTMUeeBXPT6jtX6SmjASJs6RXMzaU2l3TI+ej3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mHRwruN/ItBzAfJ8f6qTXXQFAwbAWqne8UtdqUPZ02ptty355F
	HNtnbEoXliodjEJTJEeGb203S+o6CJLDdouu89S+KWy9CAzGBsKep5ih+521nhMU
X-Gm-Gg: AYBFou0vareqfreooqT5jwHjZGQ2Zj6hxYntyqPfYN4EFHSndCXzmMTsIYeYPyo1waj
	nlpky5JUzL7xCyeYXzMfDQwYHB3yRtLfw2dX+kDT2rVHbnJMMNTmnGSxRfdZ9UZgRU2zFH+/Wz9
	pDjqHvxJuji6s/f1bNdzi0fydP81Bh4r7AR6cNb4h9sVartEFNwIcR6Ah7lOgNO3UbAtAYVi0PJ
	JJvfeUVbZqXyTL9tRUJ9CMWb9RyphAH0onHxXE90SCqoyps1fBzvCOXcj2Jop2eJ1tGwIy7jxFx
	qiLHaxBhZYKds79x4nbiYtAnPmvSlLBdHcO8duT8J2FNarXdR6+EnyOVQton3td+vf+nHecIYnb
	nOEkH/5ayggr61jI6MesLybZxb5KuKfXtpXN3kVNdvk3XuIhyp/5ekch1GGDC+cRLF0gkzkE4zB
	m3Yblq8ej8BIPM50nrsN5jQE+ztde2M1zQrA0G
X-Received: by 2002:a17:906:c144:b0:c29:3711:626f with SMTP id a640c23a62f3a-c29b86f69c4mr214406166b.24.1789404989584;
        Mon, 14 Sep 2026 09:56:29 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm467527166b.6.2026.09.14.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:56:28 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 14 Sep 2026 18:56:26 +0200
To: Hillf Danton <hdanton@sina.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	Dev Jain <dev.jain@arm.com>, lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for
 vmap drain
Message-ID: <aqgnOoOjWxRtaqxZ@milan>
References: <aqAZ4H8mauWw4JVM@pc636>
 <20260909010851.613-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909010851.613-1-hdanton@sina.com>

On Wed, Sep 09, 2026 at 09:08:50AM +0800, Hillf Danton wrote:
> On Tue, 8 Sep 2026 16:21:20 +0200 "Uladzislau Rezki (Sony)" wrote:
> >On Sun, Sep 06, 2026 at 11:50:24AM +0800, Hillf Danton wrote:
> >> On Sat, 5 Sep 2026 17:27:17 +0200 "Uladzislau Rezki (Sony)" wrote:
> >> > drain_vmap_area_work() function can take >10ms to complete
> >> > when there are many accumulated vmap areas in a system with
> >> > high CPU count, causing workqueue watchdog warnings when run
> >> > via schedule_work():
> >> > 
> >> >   workqueue: drain_vmap_area_work hogged CPU for >10000us
> >> > 
> >> > Move the top-level drain work to a dedicated WQ_UNBOUND
> >> > workqueue so the scheduler can run this background work
> >> > on any available CPU, improving responsiveness. Use the
> >> > WQ_MEM_RECLAIM to ensure forward progress under memory
> >> > pressure.
> >> >
> >> If the dedicated worker will run for 4ms on CPU2 before the tick irq kicks it
> >> off cpu, the system event worker on CPU2 has to wait at least for 4ms to handle
> >> 200 events for example in 1ms, the net effect is the same as the current scenario
> >> where 200 events wait for the drain_vmap_area_work to complete on CPU1.
> >>
> > It is scheduling decision. We do not want to tune any prio here.
> >
> The difference your patch makes was checked without prio cared.
> 
> >> 
> >> Different workers does not help to dramatically decrement the micro seconds
> >> the drain_vmap_area_work takes.
> >The problem of current approach consists from at least two problems:
> >
> >- doing progress under memory pressure;
> 
> Though in general a long running workqueue work is a wart, exceptions exist when
> mm is tight. Just like kswapd that becomes a cpu hog, it is the right thing to do
> for drain_vmap_area_work to take more than 20ms.
> 
> >- do not schedule all workers on current CPU and let schedule to find
> >  the most attractive CPU from its point of view. For example: less busy
> >  RQ, less energy consuming CPU and so on
> >
> Nope as UNBOUND has nothing to do with cutting the micro seconds the
> drain_vmap_area_work could take.
>
This patch does not use queue_work_on() semantic thus i do not want to
queue all helpers on current CPU. Instead scheduler does balancing and
that is it.

Or you prefer to tight all helpers on local CPUs? What is you concern?

--
Uladzislau Rezki

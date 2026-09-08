Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE154DADD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877301; cv=none; b=Br8qh7P29sfPws0ZcNyy3jzd+7PP9kKemqi/NWAI0ylt+FuFUS1vCmt8qLr23MR/Hn95xmaj42L8xrMiCQGgHwtLntgpcJHhTCPPOlxkpK472T0Ir+sb0hfIIjKn65VnT4nRjACFXMvyBx2Yx1AZe0baVLZkx4OJayJftv9tDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877301; c=relaxed/simple;
	bh=t9VEB+Wx7FTfVlIWnys+TVYHiif/HGxsyKc57vmrBlg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyN/Qct+VtNlNOh8TzddoykAOEk5ySxGIySOAtqqthy/IojxIZeajSBW7iqVtsV74RJsApzw7Uu5lTKJXpN1ucb591XLBnXojwTFSrv8X7CAaB4Y/bjOftTSpv8/ynARwVgke6tgc1n4eFo/gZQHmSG2T5IehqMeXWLx9E43/88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSv2Dx+/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSv2Dx+/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91ded8174so36835525ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788877287; x=1789482087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elHR2dmgdiO2iJMqseykTVVlGqNYHDXkrEZm70hbhR4=;
        b=MSv2Dx+/UvwTHGw1G0odP9lswe4ypJmsfz8xFoG88tzngkBhH7g+ch3R5cLOMPmMut
         7oWZkXB6LIYNyHEb2zwqv8L5jwx3R9CBMSYKwq+k+UUi/6ytJVRAEB8w07WVjzKCn4dI
         M7mQ7HnC6eo0CRtA7ADyjcqpEXncCwdEG5jOAZmSqlsMqDF3szr0Stl4gkUE1I7t02WJ
         1mVewZr6a5QHg85jUZC28pFyk68shDryPL+ok70rxI4Hn0dqAPq/FSRONUDLpAJHSP4r
         FL/exm2vrYonpJNlDPcFI/St3UIdnlZKsEQTYW3qgHmTtbF270NRjACgwfaBhpd1olKn
         CJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877287; x=1789482087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elHR2dmgdiO2iJMqseykTVVlGqNYHDXkrEZm70hbhR4=;
        b=FMPyJtXJ/vWDDww6VDvD4uRDdWL6ZXuyau4rHK/t1KICdDi1trBr1mU1d1VpHe6cVa
         JKTX485CmJXY+uaoQTSStUXpa9DwdV9WKXelcDAdZ6+PKGrvUGmdCW/4ecNLmJXQoC11
         gjix/OmtAeawO60zQrB5OCQzy+9cy+tu3+NobWGShg93GCDNjjWbE5Y4Sx8lBBqcOS6R
         AP2bNG3CrIYpo4GBcgJGY3ci4YyPKTbhXmZn/gmmMJFQl+Oi2itEtW/gPcIXvvnG/Hny
         SXz48Z90+fWkJPvGz8c3loA3JOfsuRwOVW041XbD3uBuB3wKkyYw43hDk+ojafXpJBXx
         JAWg==
X-Forwarded-Encrypted: i=1; AKwUvByGPbaOPaaxsSmSkpQLIRL/MvYL0afqN++gNEX6uyL0xMmNc6EBU0E0b3QXfuzZRjiSk93mF2d9Rf6jvUI=@vger.kernel.org
X-Gm-Message-State: AFuF++nkPNhmpQ9Yi8q+LyvwYqic732rC0fF+4v7W8t4EbE+4uEI2xYU
	qx0QeIse9elI5ChQvrntnfZ1XKNcy+Lp37kN5tuzwPcawyOOjWGEft00
X-Gm-Gg: AYBFou2NDMc1vEmsxPjHTdIsZO2fyq6lHZlVITSgUWFmi+8NLeD1izdDDfuVAMi5MZA
	zsNanEi7b6Rzyo0mAylU+XmqZePlC1t/UGqRt8Fi+D4D2DWkCwxPR3M1xJxcP+zbYUOGGm8ZOxo
	utMq4+I/aIRF+Cu0JwFG+BWL+tiTD5Lt3jQXvPSZrrOziEWuztil/wB3gF2unbsagnalA52qLLV
	FmWjP4/Oc7hqwerUvjXGSUQZeNn06Ism4n6AblYYOVFLQnhs7gqVBgEIqcPsPMMuN1s8U8+gOzt
	Wu5YriojNJAHpnonXK2G2V4HPMN+kg41JJ1spoqdI8EdNbsw1r5c4lZzaJ8dhdFMpa+cDe1ZJJI
	EyqGfpxnoEGhdCr5JBo56aUqj9g9yeZ+vMdSTC7qS5Vz5WYyzxfIBXBF+pZjY4Ze0JDUwrqdTWK
	eMC25yjQtC3p2xLwoCDmteywnbZ8hYPygEqI3Pe0fOuQ==
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr410393595ad.4.1788877286477;
        Tue, 08 Sep 2026 07:21:26 -0700 (PDT)
Received: from pc636 ([125.29.25.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm61015055ad.3.2026.09.08.07.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:21:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 8 Sep 2026 16:21:20 +0200
To: Hillf Danton <hdanton@sina.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org, Dev Jain <dev.jain@arm.com>,
	Ye Liu <ye.liu@linux.dev>, lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for
 vmap drain
Message-ID: <aqAZ4H8mauWw4JVM@pc636>
References: <20260905152717.11711-1-urezki@gmail.com>
 <20260906035027.2106-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906035027.2106-1-hdanton@sina.com>

On Sun, Sep 06, 2026 at 11:50:24AM +0800, Hillf Danton wrote:
> On Sat, 5 Sep 2026 17:27:17 +0200 "Uladzislau Rezki (Sony)" wrote:
> > drain_vmap_area_work() function can take >10ms to complete
> > when there are many accumulated vmap areas in a system with
> > high CPU count, causing workqueue watchdog warnings when run
> > via schedule_work():
> > 
> >   workqueue: drain_vmap_area_work hogged CPU for >10000us
> > 
> > Move the top-level drain work to a dedicated WQ_UNBOUND
> > workqueue so the scheduler can run this background work
> > on any available CPU, improving responsiveness. Use the
> > WQ_MEM_RECLAIM to ensure forward progress under memory
> > pressure.
> >
> If the dedicated worker will run for 4ms on CPU2 before the tick irq kicks it
> off cpu, the system event worker on CPU2 has to wait at least for 4ms to handle
> 200 events for example in 1ms, the net effect is the same as the current scenario
> where 200 events wait for the drain_vmap_area_work to complete on CPU1.
>
It is scheduling decision. We do not want to tune any prio here.

> 
> Different workers does not help to dramatically decrement the micro seconds
> the drain_vmap_area_work takes.
The problem of current approach consists from at least two problems:

- doing progress under memory pressure;
- do not schedule all workers on current CPU and let schedule to find
  the most attractive CPU from its point of view. For example: less busy
  RQ, less energy consuming CPU and so on

--
Uladzislau Rezki

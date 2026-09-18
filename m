Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2F34D4DE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716363; cv=none; b=ELav9s1Ww3RPajDTg0/YhKV0iGI2eGDicV5MPAfFkDsE3UnRokBQuvKOZVMHiw1rog3r3erDnVSata8ta7kF9K9ZYMMNRK+JoKZFRG1KHdfYOIDOUZ9BDBJ13ScrNCijoZcgqHF4wtNNeJNVOOCxJsripMAaVMIs/EOflIeJzp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716363; c=relaxed/simple;
	bh=Sbz7BcqVKJ42/8y+BPUpR0K8j+ChkS6WaFPNfZpm+dM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7/R1FcG9DWu/fz1wuiwhgGVL0gSPRSqruim57f+eF1SCzs7QEsllZUkGZWrW/ma3Aj22MJuRT+/R1sk3q8lvYWiRGG9wO1YCBo/RhcfLS/TZwf6y785O/t5h99exyGyfkMFQ0HLv4mZ84q03kULrJdg0YatprFzCP1yOPBwwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1pQl3oQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1pQl3oQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so129619f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789716336; x=1790321136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukkkk1BOu2H2mNX0r4yxWxK0V7RNJdbdGm1o4o23Fno=;
        b=n1pQl3oQ6YqtBQmTiG2P37OJVdHNnMJElX6bmpj3diOooSm1MyyBpRdjWjPgi5VDuy
         bVb1DCYjni0WBOUmF5iwEjlt3IXltlWxATPukxIvBV96afjJDDrN4ccjjSV/HYXmgQSJ
         Ke+71S2kKAQnP6/XwVjKD4NZ7wlk4kstqJc5gcWA0NxwgBcdHxSPH8jr221Is9/kk+ru
         +KPbs2sOnvWpBPKmiwDjQsFRaID8H9WjNYGgERFMJ2TNZb5/DOhcVobquDOUE1e6RrJM
         S26ifMWmCWs3wMQbCU+H7x6hTpY/2C3F2IK7baT2+3kkUeQKaTPvbihPnK2UxmfUV96E
         Hoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716336; x=1790321136;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukkkk1BOu2H2mNX0r4yxWxK0V7RNJdbdGm1o4o23Fno=;
        b=0paAKkLwEZ0RPYQGc51uftC3+rj5DknrVDvwoGIMtxoiHHcFySW6Eb9XIEJZ/Qr4EZ
         cKdN1qkK2h03qt3Y0NdYFbbYhj7pYi/FnCMbv/Zddb9xQ+gsmhGOgWDd8f5sTjnhm6SY
         1kUgOH9L7TWn2x/6pDADzm6nHG7CV5z4RoUUWhk//WFFn5QUHEtaBSU+2lkClm2HdKic
         eYnkHzsuDzB5QhlDDXy43Qn1NCUr+OmDvx37AGYD98yK0shvSxJDHcEdtQtWMZ3T1SG+
         32EYY+E7MYdKXBzw1f3J/jQoqeBe5u7oKy7GzHBY5sxMQ+iNLB3RwVV9UYlS4nfAiJmW
         4ghA==
X-Forwarded-Encrypted: i=1; AKwUvBz0/wNoUSurqqo/4IRowmj0soy/qfRiD/ZhCFjmBh9JOb71j63e+sgYNaX28Ag1B8ANVvX8iO4XPsjCraY=@vger.kernel.org
X-Gm-Message-State: AFuF++k34HxLTVsugPduGHXVX0fzMCp87kgnuosVU3Nb5M+luQADkcnk
	5FvS0sIIk44gkrpvFrwCkEo4qoT8AMSrhJkzNSbAX9IJelSh43p6RFNs
X-Gm-Gg: AYBFou00FHjNjGeIbgSQjnWUUiv0vYmrkIioBalWW+4RFfxmZRVesG5uJDg5wSHf9P2
	tYyFWKsAtMnIbekzWpVIegKC/3ud3exLXNhR2KpKdpm7tFl9uIvUpHf7Qsl+johBICOVeyVsZLE
	YQa9zzpwScAHeRk5bQe0se1iC8nKPXnPwkIzRQOhQnwhjrkC6wmo3eWuJ2LyUoehbdHcee7xRh5
	sU2rKMFQMlVq3XZLG9pibNgdUR5rdEHROGtvX+ILdYUqrh0P9ZnHefiBbFcyQtwnYABihJf56Cb
	8vukPp5yHbqTTekglXQnVIqqHN2E9lHrzbkAqqG65Vx164X0GwmLE32yfn4i6b2LwrZl8C4RDPW
	hI46LltlSZlBZk83CTyumNmeDUpX+wbTzNmkPo+GVeyMeAnQB985krGMeDoxzcr6TzUqsho3/lA
	710z+VrsaeEf9vfiag2yJ1bqZlFGK6oUbWcAUn4yjGLv3Y5VbC9WIWQ+N38jof8fYG7+ySUXn9u
	Jpi4gOhihrt+yA7CU28JPv5RR7ghyn05+3gLopwHPQEcZ4wKzzNAcmIdb8CgJjSpFFqvIV+MiVz
	SmLMbirMPHCzdgLCkvzhkBc5jarcI5wUxvk7xI/6xMdFYC9NskdwsJLOUwZN/CNYEr+8VU2Gnjp
	48EYdzRpF06Yn63mKD+l2ZWZu/PPVIMy0FPeIXCKKJM6sPWmG++VGjBHunli3sy39vUteZ8cuSW
	/CClDa
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr21569505e9.14.1789716335748;
        Fri, 18 Sep 2026 00:25:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm33027395e9.0.2026.09.18.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:35 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:25:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260918092533.00004dcc@gmail.com>
In-Reply-To: <aqwzG_24bZSSQhTS@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
	<20260917102429.00002faf@gmail.com>
	<20260917104233.00007a85@gmail.com>
	<aqwUky1jSMGbiXCf@SMW015318>
	<CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
	<aqwzG_24bZSSQhTS@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 13:36:11 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Thu, Sep 17, 2026 at 07:15:29PM +0200, Joshua Crofts wrote:
> > On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:  
> > >
> > > On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:  
> > > > On Thu, 17 Sep 2026 10:24:29 +0200
> > > > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> > > >  
> > > > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > > > >  
> > > > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:  
> > > > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:  
> > > > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > > > the missing calls.  
> > > > > > >
> > > > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > > > resource leaks. [1][2]
> > > > > > >
> > > > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > > > will soon also taint the kernel).
> > > > > > >
> > > > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > > > which is fine in itself.  
> > > > > >
> > > > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > > > include these pair functions.
> > > > > >
> > > > > > I get many similar patches since scan tools is more powerful now.  
> > > > >
> > > > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > > > patchset.
> > > > >  
> > > >
> > > > On second thought, some drivers do tend to disable PM runtime system sleep
> > > > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > > > enable/disable.  
> > >
> > > if runtime pm disable, does autosuspend still work? suppose it should be
> > > disable also  
> >
> > If we add dont_use_autosuspend to disable then every time the system suspends
> > and resumes we lose the autosuspend config, meaning it will never autosuspend
> > again.
> >
> > I guess adding dont_use manually to the driver's remove() function is the only
> > way (which according to my cocci script it's 195 drivers that should be patched)  
> 
> Extend with exist pm_runtime_enable() and passdown delay value. if delay
> value is 0, actually it is no autosuspend version.
> 
> and merge dont_use_autosuspend() into disable function. And actually
> I don't understand why need two varible autosuspend_delay and use_autosuspend.
> 
> when autosuspend_delay 0, means take action immediately.

Actually, what about putting dont_use_autosuspend() in pm_runtime_reinit()?
https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/base/power/runtime.c#L1865

driver core calls this in device_unbind_cleanup(), meaning driver core would
just handle it.

-- 
Kind regards,
Joshua Crofts

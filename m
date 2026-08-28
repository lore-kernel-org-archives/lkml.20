Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B042B3DDDC0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904604; cv=none; b=kErax3ghvx7hoBXmnGEvdY7WVef6lDOlnbeOnV844og++TchrOl73Fj8Gxz1W+IPHKhNVVMCKaWG3zp+Nu/+mop/p5R93H2sFd+uG/flYWtU7hxEJMPtjCdpstSTBjsQWo1qG2OBVoJ0bpxbgBj3qnZARIuSmL38veJBhVbplMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904604; c=relaxed/simple;
	bh=DND+91VHQLMiEM6W4UJu0eazGvSo0yONZJ99Z8jWWOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiCGAbKAYfJl4sgZqjfK/12RTGglyKhADA2o+k/U2ZiQ5QLgEjecsUYyzQBAsXGUT8g6E2N493wKsNbVC2cRhlPOLBXA7iqHvxo5PdRfgjtqospGt0WrsxMtUCxDHB0BguzQfh0D2QnrX55PCOS0QAFaHwIm57YzoBwzFyFFBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWACTWoh; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWACTWoh"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-396b3d0df94so853641a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787904602; x=1788509402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GLrPdvAk+KW5PmpXBldOm5fk9R4JndtH1s4AmbnDxdc=;
        b=HWACTWoh0jBxtzKHPKIfOlfqupNww4r5Wtn+fRigPuTGYr7AYoYGyEVObYJsTIQL20
         h6w4NFP5MUdMStZA1SdGzJvSvvdzmUETFuaSr7NniIPSwPs4FlTIIV+jV/Ozek67Bk1V
         e6pkq2XdeHX8x02h35UxcO4rajptbCAFPzfCezGfOMdU28k35y8LeNWkZTzLkNq39o5t
         m4N2oIAQeJ5ihuzboxdvVoc2ATDhYmFOqJk4C3Lgfj4rnao9gYtKViluP97KZVQF0yeK
         CTot5DgWxIepc4TwtGHEU1BU9JNT17DGZHM78G4PQmV/TzxJ6vRnxtuuMiCFfvb6cEEq
         i4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904602; x=1788509402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLrPdvAk+KW5PmpXBldOm5fk9R4JndtH1s4AmbnDxdc=;
        b=H9zBoIKc2fucRX9MY25xq7nz+A75KKZ0u2GCqDXj2AdxhXArn3gFfRWfsYIfbohwfG
         3f6s0T51Bj8a9ISQWZwd5+dPTNrXlaBmiiGqEcEa+cBQjQAjzTkhAnVLDlXoKgEEX6Dw
         8RO7ym0ahzB0x8WRcJ21ryQu35kSL3eE+N5vClgVpXapo2bddhNZxTVF+xKSRVBCixMt
         8I1ZPZjvo9wAZneMkMCsX8QtuTqDSrs8jrs2eK0ktJazlFbGWrRvZEGbNi3IfCy89ieY
         ZWq8hIcVoFUlwfvmDINvZD37q8PsvYAbl2/zz2jZ/+nPgXyXEhBcybabrqPIIc8XWtkw
         Mu0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQamvUy3mWu9yoV0j8xEvc2LrV8UGr2U3aG4IpSEUxR6FC0suzrxNqBHhMnl1WSdMkQ2jC4Uk+8vH4B5s=@vger.kernel.org
X-Gm-Message-State: AFuF++nUdEyyDGDIfd+ZjRpeFFLxnj1g9vPSgTTfwv0IKcpgroXjKl+e
	Py2IGGoTw9cA68OWZL/s8YaGTJvngsrVDMAOCO26mfBT4tPmezF+Zifx
X-Gm-Gg: AR+sD10OH5Pe5NivZMhheeKJQBB0XpedvT4xWRKyQM7iOJgdO2nA+U49su3LD8NkxDv
	iK9xTdsFbs2BcIvAHNXW045Q5y6hsN3373RuB69TPq4IEMRPH5jRGlC8JzGL5I7KoNzSq4m3BEA
	XnLdXZkfowDtE/85/yA3b42FhCLDRa4tVT6/0Y1kxOR5Crxn9YUFVROiQwjnqVWwb27n+5XhhZ6
	jyKfUKCcJtrDE9pQFsDWvasn5cDI4RN11n8hOSt0jwuQClx75lh4OIizfb7SC7Fuch440xZPu5j
	NtQXQRY0W11kzetPzAQLVoBhjldB2AyQJPw8iMBdqh4/KxvXbPwhXQLM+EwZIwjVwdc5Fcst+v1
	OoLiu+p38C38I30jmwAdSy3x+6ryzz1+YUTS7Y0roi9YaHn9hDi62PooHdVwrMTa8apjUlSnYLo
	zesdqcsBFyr899wd7vq0U43AR0JLugA3ADBSyE+Ls9iPZWbfSkEErEENOvHUyTz90Dlttt4Ejzu
	3kLHMj6bdQecrOYpT/Mog==
X-Received: by 2002:a17:90b:6c5:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-396d0f9d0famr10886672a91.12.1787904600682;
        Fri, 28 Aug 2026 01:10:00 -0700 (PDT)
Received: from localhost (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm2885093eec.17.2026.08.28.01.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:10:00 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:09:53 +1000
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tsz Shan Chan <tchan@jacques.com.au>
Subject: Re: [PATCH v2 2/2] iio: light: vcnl4000: add shared IRQ support
Message-ID: <apFCG8BOLxnu5kiG@fedora-1>
References: <20260814-vcnl4000-v2-0-9b771290cc1d@jacques.com.au>
 <20260814-vcnl4000-v2-2-9b771290cc1d@jacques.com.au>
 <20260822032550.31a0fa9e@jic23-huawei>
 <aov_uhPCcno0YJTe@ashevche-desk.local>
 <ao0FKRhOyiIqhvr-@fedora-1>
 <ao1W99ygxMvfPdY8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao1W99ygxMvfPdY8@ashevche-desk.local>

On Tue, Aug 25, 2026 at 11:48:55AM +0300, Andy Shevchenko wrote:
> On Tue, Aug 25, 2026 at 01:22:13PM +1000, Tsz Shan Chan wrote:
> > On Mon, Aug 24, 2026 at 11:24:26AM +0300, Andy Shevchenko wrote:
> > > On Sat, Aug 22, 2026 at 03:25:50AM +0100, Jonathan Cameron wrote:
> > > > On Fri, 14 Aug 2026 14:30:43 +1000
> > > > Tsz Shan Chan <tsz.chan.dev@gmail.com> wrote:
> > > 
> > > > > The INT output of vcnl4010/4020 and vcnl4040/4200 is open drain active
> > > > > low which can be shared with other devices.
> > > > > Add IRQF_SHARED and switch the trigger type from IRQF_TRIGGER_FALLING to
> > > > > IRQF_TRIGGER_LOW. Edge triggering can miss interrupts on a shared line.
> > > > Fairly low risk change but I guess we'll see.
> > > > 
> > > > It used to be annoyingly common for interrupt controllers to support
> > > > only edge based interrupts, but hopefully that silliness is a thing
> > > > of the past.
> > > > 
> > > > So crossed fingers, I'll apply this and see if we get anyone shouting.
> > > > I think we'll get away with it
> > > 
> > > In another thread somebody mentioned a type of the signal that HW generates.
> > > Having OD output doesn't prevent HW to behave like it does edge interrupts,
> > > id est generating a pulse instead of keeping the level until it gets acked.
> > > With that being said, I would ask the datasheet citation to clarify the case.
> > > 
> > 
> > vcnl4010/4020 datasheet, Page 11 Table 15 Notes:
> >   "Once an interrupt is generated the corresponding status bit goes to 1
> >   and stays there unless it is cleared by writing a 1 in the
> >   corresponding bit. The int pad will be pulled down while at least one
> >   of the status bit is 1."
> > 
> > vcnl4040/4200 datasheet, Page 13 Section Interrupt Flag:
> >   "INT_Flag represents all of the interrupt trigger statuses for ALS and
> >   PS. If any of these flags trigger from "0" to "1", the INT pin will be
> >   pulled low. Once the host reads INT_Flag register, all the flags are
> >   cleared (reset to "0"), and the INT pin is reset to high."
> > 
> > The interrupt is latched. The line stays low until the driver clears it.
> 
> Please, add the summary of these to the commit message.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Will update the commit message in v3.

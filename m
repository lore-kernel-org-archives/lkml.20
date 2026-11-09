Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224335;
	b=ewIwNcds+dRGr7rSCq7y5qXAWG3HfpZcFgyTNkazhPvo+UW3yqtuAOOovn32D1lQWGlA
	 Ml82LsVQsFak5jxUcFVq08bZwrhe7hky3+DPFW1ZsuXJu//ls5TjQGj+040jvI0VHek64
	 oACH532HhsbzzZIeImOO53tq45FPATeQT0Do8A1SGkmhi75cysJm+3Jr4SNLwk6LivjVK
	 B5Q1M0aYGNgZEG2udqLUlVKN1lVAsIGLjDFYa+Bs1W8WHoG7J9GiDJNkTq+H+moeM1P2A
	 8tDRf/XQ8xZgPgNhGGc3q4RruSsnZG0Y1PQvOyvMwxVx6DS1Reo6tGJ9jJMLB0NReIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WqzI2P0ubLVIWtFBMZak1suctx0ODmadmSDnzYGG298=;
	b=x+P0Q3y6oQwdERtDe2ZAlsux2Zb/ekTIkwaHMLOeTf99NKRICtOzL0jHXuQN0/BJN6iF
	 rw0q78UUY/XVGlRA3Jak43xTG5uXfJ5uTe8ftXGaQkQQzjjS6e6bAG3w1F82gOzHtkRte
	 fqKOLjZPHx4gmeHgpdWOmKCGFNwRNhW0klw+VsWTbdVYXXBv3w9QSTygzGoaoyGwd9kxW
	 L17S6VAwUJgOgQPmF9O4lsSbJxCNclweJWY23tn4yLbVUrMe9nOEPi68+vVFwAzMrR/rF
	 BleXsHhiJG0MnRJBMInu7+o+rMdHk1RCFcvlkFlz51KiYG+kVsSoXzxP4KlWcETKCJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tD27Ojvw;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0057606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0057606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tD27Ojvw
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so1238311a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224333; x=1794829133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqzI2P0ubLVIWtFBMZak1suctx0ODmadmSDnzYGG298=;
        b=tD27OjvwWNQ21XqsrQmI+ENivQFIJpYKI0Aop9TO3Ee1+UZ74sOZygHNL4LADccvtZ
         cfvAZdsSGrp7vt7IU5Q8MSamOcoEouxTmj7sk0jIJOBuwu+7FD12J9kGPxXfRLKnRLCV
         92Gp6EY1CI9f6t5Cg+6UDIOTsJn34RWLrUQGtS3xsFJBj8ypKos9ClVu+j5nmTNMpWzR
         Zy0H6FrQsihXWXObhVJomMZNyLOrVd0Sbr9PaL6/ZuqkeAkJ75RcB3WHXucd/ZUCG5Dv
         RdRustwQ0Rjlh9ylvR58lRQQeb9brzhm7xhRwNPkU9sHWKH5YJ5I5qIwokJCShEcMmZy
         Z3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224333; x=1794829133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqzI2P0ubLVIWtFBMZak1suctx0ODmadmSDnzYGG298=;
        b=hc4y6kqbfr3dQAwWGqwtKKhF6AKkOiMhciXvnQUQNLetG1l5zWYKKaoJZ+BpbtQJzN
         eoid7JcKHd21RgR83llYE7JbODfioU5hKt7YlNQU2B3NXgLQ9RseyLHJMN8DreMGeGqG
         DyXSKScF9bHWURpQ8LQ0fyD5poah3TJN194uBPKtukcexxts/QYDkYBysudu66u+TZJd
         3Qeu9u1ak7O4p/Gvq5AYpDcnVx9Utny/0kSrgsL7IsOGbUrmbyeKoDRknOJR1xEmEhmY
         OQT2kdU9Od1ZyLx4DvVoVf0Va+BquuL6tPry+FppNYRRpoHPR6bIM7R8PyUvSo5lglPX
         loow==
X-Forwarded-Encrypted: i=1; AL+hErFErhfZsGtFo5YhxBen5MQ2riPDJ/UzKkdE8qY3XmKBT0fgpdykh0Zbt44Gkqy4e6BZPyur0FrZa76cITc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IaQmmn7Thw0hkCdiMPmVukj65p3nt/jEBzzq9nIPjnA1kAXlP
	+ItaLpUVrTajLbV3zDBBlg/9+OmKvrFDnbFo7n9/4DEuknCtsW0JCCSI
X-Gm-Gg: AYBFou2Fw3HLobroOAyXWScSj5eY2mlOCqL5G8fzTsCikg8W7YkuuOzweK3ndCMlq+T
	FO/i0zCOv8pNFdjClKTpczWefdnwOXAwDySuTNPOaHa2h1NM99/RjWrEUMSOmx66wzYB4UX22f9
	iXvp2M9dg1T0c8kforczFgcr7yslGfHZ/CAlH2azMibgJSA9MZ+wThh0cr+bkAjDrOnrxLJ1H8U
	5++JDFs6eMbLdcZNJKeLDtq2GDspMzv9+cpUjKshXITPusfRVSMVodNXb4CvhLuLQpf3sYUA1Pm
	daWyBI2lZNYkp0mUtuLc6Yi9KXIlVwQFWtF4Eq8ELg76BaicK1abKHvdiRqys7gmMUTwI4D3tz9
	VJGVS3hjX61vtJsoqhh6eJh+Rh0fIrAA2FX4fuPg6rNw8uMSUq2ndxpBULrGR7LxJz+Kr2f9oO1
	k71uQoBeeS5DhaHIG2/VSyz50Gk1fPKuaylb4+zEPWNUHVn6VpPsnhoqJ2JoIDfGRh3maDUWTo6
	IsEA3184ojP/FU3ZnkbUwJ/CUPtzafbuM64QQ4FPifXOEtLHfqObl3H2jdt2pEO40dv
X-Received: by 2002:a05:6402:3604:b0:6b5:9714:dea8 with SMTP id 4fb4d7f45d1cf-6b72249b331mr2626989a12.45.1794224332902;
        Mon, 09 Nov 2026 03:38:52 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm1479837a12.8.2026.11.09.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:38:52 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 9 Nov 2026 12:38:49 +0100
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, catalin.marinas@arm.com,
	will@kernel.org, urezki@gmail.com, linux-mm@kvack.org,
	baohua@kernel.org, dev.jain@arm.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, david@kernel.org, rppt@kernel.org,
	leo.yan@arm.com, xueyuan.chen21@gmail.com, chleroy@kernel.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	ajd@linux.ibm.com, jiangwen6@xiaomi.com,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <avGwySHgt3qCmvIG@milan>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
 <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
 <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
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
In-Reply-To: <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>

On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:
> On Mon, 9 Nov 2026 at 15:08, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Sat,  7 Nov 2026 21:49:43 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> >
> > > This patchset accelerates ioremap, vmalloc, and vmap when the memory is
> > > physically fully or partially contiguous.
> >
> > Thanks.  This looks pretty mature and reviewed.  I'll add it to the
> > pipeline for linux-next testing.
> >
> > Sashiko likes it.  I'm working on a different AI review setup which
> > finds different things.  Very slowly.  I'll let you know if anything
> > interesting pops out.
> >
> > Do we have sufficient ARM review?
> >
> 
> Thanks for picking this up.
> 
> On ARM review: Dev reviewed the earlier revision in detail and
> his suggestions are folded in. Leo Yan tested the large vmap() path
> on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> and others.
> 
It took a while but i think it is more or less ready. All patches have
been reviewed in the v12.

--
Uladzislau Rezki

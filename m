Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B83E1CE8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938853; cv=pass; b=UWercUOHM1ssEKJHVWfmT54p0D6c2gJrht1foNPpiXzu1DwYcta31LJuw2tVM81zAfhW6lg/G7KDNOS5YttF7QUlyDMACWp8cag9RqvTD6n2wh+delerEdpC+dRMu5RynHC0ZIxUqPjxabysFYX2pDuBOUpDePsVMxRsZK/4ckY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938853; c=relaxed/simple;
	bh=ZP2LKBPL0cBLk5dPcCtHOiZGDZ5qkSE7LN4mdOu118g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ya1RSY3wUvsqFQzDrCpGjJrhfWyuzokOckuv1x/75wmrYWKSNIZBs2IpI8nzb0FQSSfU1u22w4BsgTf7kxX4tSNp7ugBe0sCZc5EDzrQSyNcAi/KNqZS1j8G5q3FCj3lJIqR7MwhsCoOl0iHIhOVRc1OZCrOqcYXbGH+r0mnMgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=QG6rVRj5; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="QG6rVRj5"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43f9b119so18579207b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938851; cv=none;
        d=google.com; s=arc-20260327;
        b=mfuB3HNBJY+If/9uK6pfPfN6/FJEoDgbiAucbcoYkFO+me+3GPoAIgT7j8zafTgPWM
         AihWvEG9ijFrfI6tLH0oKH4Jh87/qmmEBkNKm5iiQeINbckskmlt4eYB4ogpB01tYJ4U
         I3D19JlBvPotJRhWNI+ZsgQVK70xsJ1US0CJo6xQL/oVM9E97He+SfamMBhJKjhv86s9
         Pc8r9O+s8+uER+lPKQTGZ5Qh4qiqIWsYYAOX4SgBVHxFvsqQJmcHGnqm1HEyJWG9K9Ay
         gbWTEWggzB4LQkqtqfYWufTjmFMq5vRRxnqNlA2VB6Nwnfq4wFxG1BtMQsLznb5iB7lF
         Cr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        fh=Ox3PI87R/jjs2vcEGGhGUga73f+3pIuPx9E7VA6xxRc=;
        b=Ue3mNe5cox09PR+i+DYgX/v+X3ZOKtulKnS1W0nnibRk/A5vF+U5Ffzetxh9nnQooy
         Osgsr4tMCYC7GaDrdcxrRd5hVsx+oHRwUVEtIH0Lwdebm8RO/xveCnq1v82ODC+KdhlA
         9OYxrPQFxa4GhnMr4xV8GdNJQy73IIX/Rev83abcSBssiZiJ5RlzmLeQYujoQ/MmSHQ4
         P3zn5HfsR2yl0/ZNHu4cGwqrKhDiDodK41oqVPIG2lBPm2iotcN5J6sL/H+KKS9XWIS9
         r/L5IZsIEDT9QPzovZzKwhlehEIYvoAPb6GwJhA6xzlAcMZy38hs1GVsIeuQGZCvk0K3
         o31Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789938851; x=1790543651; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        b=QG6rVRj56BSZA3UWUho/Jv42gtKpiFNVceNFgMFevj4lvznxXchdl3rTfEj4HEYEuk
         pDc7n+dF81O1ARSPEENuf+ENUTnRryfmLZSkHZmeawaqXwWH6mW/FPwmQd6kxnCIDPRD
         O71dcVG49HLAPVFQHfEPGe4Ev+KQ0KKuQ4aphhzpWkAgVcaVWkO8RNh8DtTQUBJiuOF8
         GyA4N8elHxqZnQ/CPCxoTyUjuPInm0INrbkPSx5X1QnHzjfASUA0G9kNx0hePWCPvwbV
         +qRCjrheVlipmiGXYR5RVdJerHGnw4O5XtmgXAES2PpXmO0bCitP++A4V1fDiN3on/5G
         i2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938851; x=1790543651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        b=Vrcl+35KRyl2fDNJGZeLXVR0TBjSSghd5KgAkbW5rByofXzKPJjKf0CxspFsxAoq/M
         kEc+nryYsQEB/I8hN5Qz3xpl4Ugo0HZiKY19LZdSBDA57KQdYcKh/25oFAkgwlG4IgZ1
         TTimVi0t8q1vVLbga7YgBeWrqdVxpfI3flB9+0qZfburC1E9TUaIF9vBOf9eEJc1Qerg
         ALgPj6hq+w/Rip8s9Gfe7CXc8a0JpwobDQamCt3elDgEFOlmihov+qiZ+Nt8xDiYV8W/
         7ZnTfLPNzUOTl3PsfpcG11Rwa6JnXAk2Bnurv8ADQ1Bwa45XcPehQfu4T3sU9MAWQ/Ge
         EG7A==
X-Forwarded-Encrypted: i=1; AKwUvBwonm0tm6E7/GH4G2ztFeSwYVhKNnWowjBK9TDklbn3DwssijmT9NSBU/6SekUyrj+ppyCesyOlVmB2TE4=@vger.kernel.org
X-Gm-Message-State: AFuF++nqVi/pfDDBzNh0n56pcbaERgGR5iQx07nXXH4IMI7OLZw9TkoS
	bYTIyM403b+pdzygAMY+gtrI05b3s4PB/8tBF9Hc7Bwd2BxxOOd77bo9c2m1+Q+TQ2v91qEtwBG
	U9RnZHA/kNW8NFiHUwDZ1CQfh3hkHoE90BGSl9owAgjc=
X-Gm-Gg: AYBFou22bMNNNdsw6ol5GFDlg1NwLP5RbgTtHyeYXlQsG7QbPRzHfv604I6U5p5D8Ir
	Zk4o+5EOjwsL5CP9KOWsx6vJ8BdTCpMbRVPlkvEpv0qhmxeEbnbGBZcgPjR5ovpYNvcMNyYWhZa
	4b2AF9G8Pj89G2rTFXlHLvQMghjvVcaZncJx3e3MrYvBUwftinQ5CwhctEity/f6Hkx53+Qox5C
	iAY8GU0OOeGPSwZ6COXXWT2aiY5B6KOvbzNdz8+Lvh43j1hMqd5tpJETMbgDSOdzH+c2MYeYT8L
	94SxMuqh7aDVl09lvCBUADmAQohd9f9FtBjhflbYTLPXtBtWEH0PqmcICkAZ9RQYsANd1x7ncNd
	TmHnoUbwl3YyXMfScu1Tbp2M+M9Zm9eV0AdnEYMWSX2FOKFKKWC5cftXei4R4ejQoElfBDOnvrA
	SltqmBqDdkMPdSsw==
X-Received: by 2002:a05:690c:e681:10b0:863:e8cb:7773 with SMTP id
 00721157ae682-897346e315dmr20106047b3.32.1789938851178; Sun, 20 Sep 2026
 14:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org> <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
 <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com> <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
In-Reply-To: <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
From: Chris Roy <iam@thechris.in>
Date: Mon, 21 Sep 2026 02:43:56 +0530
X-Gm-Features: AcwNN1WbQLG4glywQGVIDhxD1uJUtzAMcMfTWSPukcrARUaPtDIjPzyQr6Yayyo
Message-ID: <CAE2Bdm1zFXr7UErCUR5KR-aGj=baCh--gaiDzZhjepF-_6H6ZA@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

> Keeping the module parameters is not a hard requirement but would be nice.
> Ideally, the module parameters prove an initial configfs setting.
> ...
> Yes. See how nvmet uses configfs. A similar, but simpler, approach
> will do it for block2mtd too.

I have encountered some bugs with the sashiko bot. So, this gives me
the perfect opportunity to
re-design with your inputs and propose an RFC-style doc including a
bigger patch within the next
day.

Regards,
- Chris

"But how could you live and have no story to tell?"

On Mon, 21 Sept 2026 at 02:39, Richard Weinberger <richard@nod.at> wrote:
>
> Am Sat, Sep 19, 2026, 16:44 schrieb Chris Roy <iam@thechris.in>:
>
> > On Sat, Sep 19, 2026, Richard Weinberger wrote:
> > > While we're here, maybe it's time to add a decent configfs interface to
> > > this driver instead of configuring through module parameters.
> > > That way also multiple instances are possible.
> > >
> > > IMHO testing is the only use case. I use it regularly.
> >
> > I would love to look at this if you think it's worth the added
> > complexity. A couple of design questions before I start
> > on anything:
> >
> > - Does configfs coexist with the existing block2mtd= module param
> >   (for early-boot/cmdline compatibility), or replace it outright?
>
> Keeping the module parameters is not a hard requirement but would be nice.
> Ideally, the module parameters prove an initial configfs setting.
>
> > - For multiple instances, would a configfs group per device (backing
> >   path, erase size, label) match what you had in mind?
> >
>
> Yes. See how nvmet uses configfs. A similar, but simpler, approach
> will do it for block2mtd too.
>
> > Can sketch an RFC-style doc once I have a sense of the above.
>
> Sounds good.
>
> Thanks,
> //richard

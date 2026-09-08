Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C9478859
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856361; cv=none; b=JzPbW6IPABlyrr4XQ1stVGZIikIBPIjXlop8d1mw2TZmy8wI94HvJ+Vkk1QptvS+iNcvmTBn6NnX2MX88fvoH+djCSJ7yZc2q7Eva1zuMDtsXWenXC+xxZK/reJjD2mZhzmljWjUm/gU/uJgKqcs2fX4NpLXSLEJnEvu+jIOqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856361; c=relaxed/simple;
	bh=X0LXiwd5Oi4KUYVcotrSCSQyQDEPeZH2ej0WcHSUWuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0il0rTEfJcLS5MNWQuPlcwIDuf9FDur/6N13hq9iKV90a35+ZzUR6TACZ0adbjEGeGPgFpb7WHPsGaHURCNhOPGPCW53FQsFzevi87Un3GSub1ysSptwW3RrbrsbGQr3SY9Uiq1JJ6Ntdma2b8xs0/oehA5cvj4pRmF18p6UXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IN8wbQe2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNDk2oew; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IN8wbQe2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNDk2oew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788856359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bTs3CS9GCivYiUD3IVJLDYldRClQ2qkZlouxGAVv56E=;
	b=IN8wbQe2Hmh3C5ITCgGOXYjTf5gb5PFJySXkxPbyxTCX+5J6VfLCabaP0PmG7dywPfoQqi
	V1mv8XaIFOntMgQPhsaZLro3ZexAF5KK8LmEDKGucHa83JLwWaGrmZX6TpknnSy9wqnNg/
	ZLMqOWJShdcHk3nx2yKSbgYHo/WuS4o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-76q1Uvl1PemCW1hzN8bS6w-1; Tue, 08 Sep 2026 04:32:38 -0400
X-MC-Unique: 76q1Uvl1PemCW1hzN8bS6w-1
X-Mimecast-MFC-AGG-ID: 76q1Uvl1PemCW1hzN8bS6w_1788856357
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48597bbd963so2378606f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788856357; x=1789461157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTs3CS9GCivYiUD3IVJLDYldRClQ2qkZlouxGAVv56E=;
        b=SNDk2oewi50OP12x0deMuM3z/iIvH+293o54x1oVq24iroR5Kopejqbf1gtxgcDjf5
         yI3087vhQ7ydqVzlh3q3QA5971WHgowSF/3OUbMPCZS20b7dmcrS8zh/sjydvVAlO0pU
         Xgsg/mzQnYeEvZEV6emhkpHxFhNGZaZCFDbEQUkDDBmWlrEpcFvIyWQuPP4rz+KmKAOK
         6bDyyWffQXr2hzPuQ6IptVFwq5dndJIJcYJiK1KeFLLe42l54tgB0Q/62xZogZ1o1PIQ
         LTS36zQm5qdf5gtgUDa0fq6pHAw3bbrafILm4+ih5sR+LLowW2SLUvI9qhUHUzmTZ2Bq
         JPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856357; x=1789461157;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTs3CS9GCivYiUD3IVJLDYldRClQ2qkZlouxGAVv56E=;
        b=OTxtYYX+i4Beo9bQAxDkuFLfON3Jty6qd2TI/FlZ+yfigBgCc3lel0oMDblg2XCxTB
         Wse+SyyS1p3WvUjFOghQ2TnQKQ5LZ0gtMbA9aVguSOf1E3BqT1Qm+x1QlyagMmtr3ls2
         O/c46Ngr9r9aTgeur5XNHfTNxJlwJ7DgYCAC4pykvAZq/+WOGy+6z0PndN/hCf+Gn3H4
         DZwbbr1mtAYKAlPZgOc0FIYmKF4/uKUslBlSeRJS5DCFCtpY4ixt4CGmoBsjZqbN9qUk
         SZfkJb45INgofKXEfoGHjQ98jYSX9/ycL1alSQpl1RTedE7Sa1KeWGet/Ih0KVF/lU3O
         zj+A==
X-Forwarded-Encrypted: i=1; AKwUvBzjeVrMcYWZwf0DMKewB44VIn61MVmaPLwM3TILAlgYtoFdQhtdo51lop2dou6PyqK6DqM5DhwvBO0e+DQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mm3F7B6f/Bti5P/0rte5Ou3+n4ZPfYm6B+q9AOkAGHirIPdOAd
	dXgpoJ7C18+dZKMGHOxdLZAivImDLTaieSyodpmY1rufrebwO4+rbdMw/0th+2BNAho8NV96WpJ
	SV7ADwGiO/j6TE/b8bivYRnCqt1WUxPsPv333BUZu+SkAj/M+vYmRbSDxKWnaa+SRiD7u2hBtZw
	==
X-Gm-Gg: AYBFou1t7inPYj+ncvrU6lZ0Mb/hUYjGnAD1DViDr3O40cn6701NC2pnASHRoQgkkGw
	JJOdnsH1ldUAVtz5+F4xf584770wcaX9CTcWwXj8Qa4kSyYpEyo0DDhzybGVjZCT+KCw2/uwejY
	D0RkBlbEsijAomTC4aJPKjl2d3cIAR6/BR51EjelJHlPZhV32MadSx8wDoA83po2m23LlZYaNt9
	jUVg/yO66jwFrbQ8HEc1dZJro6uMSEL+AigfxKV7hVK+WxLIBsf3ZJ0cUu30z03KPdfUTPw4Y2c
	aVfi6RFM0sd5U9SmDS39tYXEUyksgoQKAQ/4jLdUmlX5mbHGBEfHPeFViyOOIbWjoa2QgcLChHM
	zunwRM/zTEn9SXDRWRxje8ec=
X-Received: by 2002:a05:6000:4302:b0:485:96ac:5a96 with SMTP id ffacd0b85a97d-48596ac5acbmr31640621f8f.16.1788856356726;
        Tue, 08 Sep 2026 01:32:36 -0700 (PDT)
X-Received: by 2002:a05:6000:4302:b0:485:96ac:5a96 with SMTP id ffacd0b85a97d-48596ac5acbmr31640474f8f.16.1788856356160;
        Tue, 08 Sep 2026 01:32:36 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm37007020f8f.24.2026.09.08.01.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:32:35 -0700 (PDT)
Date: Tue, 8 Sep 2026 04:32:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linfeng Sun <linfeng.sun.dev@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vduse: return compat ioctl results directly
Message-ID: <20260908043143-mutt-send-email-mst@kernel.org>
References: <20260908-fix-vduse_dev_compat_ioctl-v1-1-62264d9bfb8d@gmail.com>
 <20260908035646-mutt-send-email-mst@kernel.org>
 <ea3ba5cc-ae68-4c1d-a3a9-c2840a1cb9e7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea3ba5cc-ae68-4c1d-a3a9-c2840a1cb9e7@app.fastmail.com>

On Tue, Sep 08, 2026 at 10:08:46AM +0200, Arnd Bergmann wrote:
> On Tue, Sep 8, 2026, at 09:57, Michael S. Tsirkin wrote:
> > On Tue, Sep 08, 2026 at 03:31:51PM +0800, Linfeng Sun wrote:
> >> The compat handler handles VDUSE_IOTLB_GET_FD and VDUSE_VQ_GET_INFO, but
> >> then calls the native handler. Their different command sizes make native
> >> dispatch return -ENOIOCTLCMD.
> >> 
> >> For GET_FD, this overwrites receive_fd()'s return value after the
> >> descriptor is installed, leaking one fd per call. Return handled compat
> >> results directly and use native dispatch only for other commands.
> >> 
> >> Fixes: 455a2a1af926 ("vduse: fix compat handling for VDUSE_IOTLB_GET_FD/VDUSE_VQ_GET_INFO")
> >> Signed-off-by: Linfeng Sun <linfeng.sun.dev@gmail.com>
> >
> > indeed, I will apply.
> 
> The fix looks correct to me, thanks!
> 
> > But ... how was the original patch working then? Arnd, what gives?
> 
> It looks I either broke it during refactoring from two functions
> into one, or I just didn't do it right in the first place.
> 
> I did write in the extra patch text
> 
> | The code is directly copied from the native ioctl handler, but I
> | did not test this with actual x86-32 userspace, so please review
> | carefully.
> 
> but obviously should have caught this one myself since it is a much
> less subtle bug than the one I was trying to fix in the first place.
> 
>       Arnd

Should teach me not to apply untested code. No amount of
careful review replaces testing)

-- 
MST


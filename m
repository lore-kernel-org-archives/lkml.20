Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C52EBDE9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047566; cv=none; b=ASwVA7qprwwNIArSRImB4ykZSllS4BSzVWiSGRjtGxNHSPnaRN3J8QapmQajE94v9kblsN6KzWIFgf5q6dBm1PS9pEjjU3nHajnLfkB/gDumx2cwjDe3Td1b8QBvPK2hq9MROkBT4O1t9yfMPCKUWyY3+XtgHrBBVrT/Ihr9Td4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047566; c=relaxed/simple;
	bh=TDBy2qbTXNR0qPysOgT50JSGgqr/6R1MMiTiR1Y1yEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxgjo5z/3pwAbQKRNMVBrOz/Ll5xqP41iQ+ypr6SqxuSqGAdZpWluFqrM0P7SwnWhUonE+A2Y+SwzNAXR51PNB6fWGZZJkRouMLabfpaNsgNBqjsf9iqLS5G6p7/DOT8KHcWygoyofmZZ6kAxYUEU/zeSuoCEcjv7R59u3nLCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKAkPtfV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKAkPtfV"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c28fde3bbd2so729225566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789047562; x=1789652362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMmMNbrgJ0PThlrgbADYUy5LHKnoS0oQw5HvEhMlYHY=;
        b=nKAkPtfVPKYlnHEQnbArYK1PAMLDHDOEYSZglUm52qzqQ5QKCNxuvgymmBtqYxoECr
         q3TAWdP1aMdpWWOY03c800G+lggPtdv8FEam16nTLfB46ipKauui/yWcSC9nMB7Uw33+
         kvfFhtnMRsu83TtOmkYfZeTBPD4m7ENhjVjZmAQbgpV05ME7dSOoR6ECEQiCdTs9O4cq
         6v/FuRIoRZrN8wfzIrtBUcgV0eUz9GqsK4ew+Bn9teJjWaXT/f5VYFuv5ptHzReIBHUS
         3v/KP4alCynArvjnmegbfNEawoqvtqBizXg+IOktWv+fknScqOO4GAnMw1PXjq+qKLFh
         dotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047562; x=1789652362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMmMNbrgJ0PThlrgbADYUy5LHKnoS0oQw5HvEhMlYHY=;
        b=HnyIP4FUz7vwLdVsrGXeT1Baa9/p7N2cZhfI2XcFNzH2OQTwXoWdjZS8Np8aphk5BD
         +pxzvQzXJNWzPCGv7jEekhANiqNhp5lev4HwdLIjqC0QkUDM/TBJb0rqwjaUq5MuvYBX
         F+L2+bRjo54yzU+MZueolNqlfLT59aTdXP6AoTC4tqKQkdIEJTF6ab2rreF36VBlI4mx
         i60S1AkVsEzPjuRkj6LIc/Wm7+jymMv1BjUeM3xbeq6Nucce6JVuaRTAPPii7CBYlZ1f
         m2LDhYoo/qBF5frXZuZzSfoHIbPqbErSwsHz5W/y0bJ899420cicTAM0FSED1ZU6BDW+
         4b2A==
X-Forwarded-Encrypted: i=1; AKwUvBzlM9ojdvuEQDU9Z5H+1sC9G800ZAcZtSgRgR5BzR14CQHmLPyXsHQTdp8C2JccH6UGolyh6eng7apCurw=@vger.kernel.org
X-Gm-Message-State: AFuF++kz6coEqKSJOJfX9N48IABxvi4shRrbFoyKY2C1E6GZM0PmrSoT
	WileVw6C8JH/W7t+DZmhyoxzNZhpTzl9dG2dirub2zuVapJoO8y6yWos
X-Gm-Gg: AYBFou0x2lO3wws8JgT6EUrb/aEMnHC8iqFeEMlBLNo4gB0Fiab+tfwGQOdDX+7KcRx
	Mv3LRnMZNlBzRAaDKZH1MKoGrobaxEXOO2wUBWKNBnI3LRUnwC1Jt4gREdIbz8lS9kqRXTyzhK0
	cwdjvx4HfU4eMfzkrV3/BA6K/5Oo0U9P5LS8GO8le2tbze8+iyK0PZ4Bj3JQIainBkb8PQr4Mj7
	uvuk+5gVjZpwnNRxf0kuET0+yEZsPtP1Kc1yxUx3KZihkw8wzIYGT2qWKI1VP2tK3ATt+aVAiwe
	/7gO28tEtmVtIDJkjPh+WVlB1lOf5cD/3W3EPVjKzrsx6ai1o9dSHv/lbtOorVJE0oeaYNgUB4n
	LGlBJMl7agsMsV+BT5AIbV4mLhMK15Lo2NLmS+9fOfShM6F5Fbg3HoXFLuUgiI/d76EKjelbHT8
	/Nsi8CdO4n2AxVk7byPECXBJpVwhM6t8dShwoRa8xbHV4iQ7/bT4DZzXcLFUG5dFCbAENe
X-Received: by 2002:a17:907:72d5:b0:c26:1691:b361 with SMTP id a640c23a62f3a-c261691b94dmr1535678866b.26.1789047561903;
        Thu, 10 Sep 2026 06:39:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm910218566b.3.2026.09.10.06.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:39:21 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:39:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Israr <7israr.work@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock
 definitions
Message-ID: <aqKzBTM-CdBqQzXi@stanley.mountain>
References: <20260910124403.95741-1-7israr.work@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910124403.95741-1-7israr.work@gmail.com>

On Thu, Sep 10, 2026 at 05:44:03PM +0500, Muhammad Israr wrote:
> Add comments describing what the list_lock spinlock and lock mutex
> in struct most_video_dev protect, per checkpatch.pl's
> "definition without comment" check.
> 
> list_lock protects the pending_mbos list. The mutex is registered
> as vdev->lock and is used by the V4L2 core to serialize
> video_device ioctl calls; it is not locked directly in this file.
> 
> Signed-off-by: Muhammad Israr <7israr.work@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff62f4..41b617b553aa 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,6 +33,7 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> +	/* protects pending_mbos */
>  	spinlock_t list_lock;

It's supposed to but it is buggy...  What prevents multiple
threads from reading comp_vdev_read() at the same time?
I prefer to keep the warning around until someone fixes the
code.

I didn't read the other change.

regards,
dan carpenter



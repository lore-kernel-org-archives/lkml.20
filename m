Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD3E37AA87
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418931; cv=none; b=e4kvuoSFPqi+j8gLlcXOo8qm3vApiMx/r2sC3DdH4T99a7LbKhCAFt46CdZ7QQmWPvigYL5Ea44/nqPk7VXvgiUh7UkIo2yXgTm15qd5iwwYffVdb/CRz5Gav442uQd86nymyFLL42jdZx7J/7u3bUOUfIXrrxSCE/Y0FKdzRrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418931; c=relaxed/simple;
	bh=URiiWCSYW0GjTxFe0It1760y7ZZo93z00xWsGdIXJ5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXLr6KyuVEC+Wzp2pazTPCLm+KxDBGfGGTCkk5oMj5o0rXivlxDN7pF3HM9/9TnO4PPNW4Mp78JciX4lrlpOlOmu8NZP2UZERyzbI0oRC00FRHpxgbNT6w86VtSX8UKKVJ6ffYCRRnemddCy5oKxeRu6rw4rKgjRvuGUoWyvp9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fwpwk+Af; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fwpwk+Af"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398b3d66515so2584962a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788418929; x=1789023729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQWNPytw1GI5Bz7KWMVobnDn5jK6I/E1tnjkaIqtCQI=;
        b=Fwpwk+Af00Ygg/YnI1dO+pv59/fFkuMvNM5X6m9U06WKRnWNnKS+2bRXHSN0UUBiow
         tS6F15Ny7neuSncGdwpLseDCUIASSVZufeCZdkjmoFjaJfJHBfxzNqPYwzEeB5EtbUHE
         f5Ut7w15/TmZpKbfET9nAL10KPgH1dYnPMqolAx1LHIKKQYg7/kAHJ4IsgPsZ3/CNDBs
         gp2C3yDseussGd9y13b1vwgVuGPIYvseuXOTiGjjYk/BgiB+kSMdy8Zp1q8Fcix2f2Xq
         FUVfXcP1A/N2L6C7IGvYDUrQ6HIb4daqPMIaN5iiDjfG/o0CQ8XbVDIVKPw1X7CcpOkF
         JJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418929; x=1789023729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQWNPytw1GI5Bz7KWMVobnDn5jK6I/E1tnjkaIqtCQI=;
        b=tJWCQbrtt9fIx9dHBegof9Fj3Pog+I2Rve+X4nuwJguHcBlIF0xOl1oX53QZmDvfXS
         HZYaxy2Wf/Kd9HgnpqLvo+1CmHY19zqAHd00pxBRt8ypWQNdUA+3/78zK46GMs2AGgLl
         lkQ1doDrZgW5YiFIVfTWGEoQaDNmqS1+fyeMzRDKbgHlxO+9YpYegtmEk9hVXYfNlCYU
         RWvubfFr7ZXNCilYxJ5Wk4qFaoURm+dcDp1VJOJzt1gtGjekuoEhZMh9Gf0ebk495yTO
         LDUUrsyYlDbMCEF6NevZrNrO3v3/WDfXNdHjRGv7RfrBykGRsxK8rNdRHCOX/hLhQRIF
         N5Bg==
X-Forwarded-Encrypted: i=1; AKwUvBy+nNW28G2Xeq5TxixcoEAEXQLK3XHgRp+gRbcIT5hbeWjrM9MK4QCBxRuFopNwspj3C33dq6wzNOwK9lc=@vger.kernel.org
X-Gm-Message-State: AFuF++kc4lWQJfQsd9nbP6ZvSpzgZvkxFN1bUxHdHEiEK4PthU69lX5l
	tTzvslft2WPO2SLHVySISvSTDXWVI9odyuvNGsIT6n6wvBzH3HXsbGcO
X-Gm-Gg: AYBFou1W/aKxBKC/V4Uj5CBwqry8cMiVVGzSgyTdbqnw+/vwyg+SowR/tmqGdPVkvJZ
	RqmTsXWQFnt9nsDf8p2fVED8okP+a+cLMDhpqTDC94zgPQR6qYfvvOoZ+uZAK31s+c1+foEtErq
	32GDSLGWITeka9lRNpmU/8sHFNHg/3cd2pxq+KhewxiKQw0e1kTIcM10tIxX8dKmnI0aKDJL2so
	+ajg0mP+jnukniwzX9MUshVWq/UOWj9e+OIdIY7BYVQeqpquoa+tfGEVLgwJZcK5Ibi5kzIN0ud
	zLwipPvTvMwJjnNd/dTy9Y/2xqE6vIiI3MEKRLA0Rg+fRd06OhnbPsZGW/pKnPBqqBCrcSZ1X4/
	uOqFOla4nMdachPvp9JpF61VolOWuNOJIh7jeayL/cSGxs9I7JYQWSJOsh5auSegjnqe7TtpiqJ
	K8iW3V6wc/lWrNlOQorqlD56G7RAwRSgBWHxSmB9s+iKaYAGh/ksuDqf+AMl48q4QbixDuSMOIa
	wrAGhgiDXZXV/gVsl0UcQ==
X-Received: by 2002:a17:90b:33c4:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39aedf644damr13780688a91.5.1788418928606;
        Thu, 03 Sep 2026 00:02:08 -0700 (PDT)
Received: from localhost (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832b85bsm3439567a91.4.2026.09.03.00.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:02:08 -0700 (PDT)
Date: Thu, 3 Sep 2026 17:02:04 +1000
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tsz Shan Chan <tchan@jacques.com.au>
Subject: Re: [PATCH] iio: light: apds9306: fix default sampling frequency
 definition
Message-ID: <apkag8drdFFofWFT@fedora-1>
References: <20260903-apds9306-v1-1-3f892aa4f156@jacques.com.au>
 <apkWlzZZIIzVDz4C@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apkWlzZZIIzVDz4C@ashevche-desk.local>

On Thu, Sep 03, 2026 at 09:41:27AM +0300, Andy Shevchenko wrote:
> On Thu, Sep 03, 2026 at 03:38:47PM +1000, Tsz Shan Chan wrote:
> > APDS9306_SAMP_FREQ_10HZ is defined as 0.
> > 
> > According to the datasheet (page 11, ALS_MEAS_RATE), bits[2:0] set the
> 
> Can you add a Datasheet link? (Or at least the version and name)
> 
> > measurement rate:
> > - 000: 25ms  (40Hz)
> > - 001: 20ms  (20Hz)
> > - 010: 100ms (10Hz)
> > 
> > Change APDS9306_SAMP_FREQ_10HZ from 0 to 2 to write the correct value
> > for 10Hz.
> 
> > Fixes: 620d1e6c7a3f ("iio: light: Add support for APDS9306 Light Sensor")
> > 
> > Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
> 
> No blank lines in the tag block (at the end of the commit message).

I'll add the datasheet link and remove the blank line in v2 commit
message. Thanks.

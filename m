Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F535AC3E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203347; cv=none; b=BKrUu53DfNGNoNbXlSWnB4VlsuLQZG9bYdedLZnwuoqUSYqCP0PVT8uQ0cGN2IRiszsHN2x2FMvELgEStQ776JiYfeJg2HFRvDYNTbEZAIFn/WE5MLxK69XDRqrPH1mxM+rwcFPmINjouR7L41JgGHuQEFwezmwY1/zD41ctwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203347; c=relaxed/simple;
	bh=3x+Hh8N7Urs4wO4l3MOxQZn3pRYui7aVsr3+8aKiQps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBOqetqOCOi1M1RCWYIiMmN3Otj0/8xD/xgNQYtq48Y98X2BZFmXxlehHKHkCXgH6BziR33iWQwDYyGvHwS5hHC7pbSoewmZGQwABrkBBTpWtnWPB6uAfMJznENJ97fAL7PbUoDhcnIGPA/gSFrV8Xiqugy7L3rCn8YiBNkMHH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSOES1dA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSOES1dA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso1025595e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789203344; x=1789808144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nfn95/c9x6fz6xYVpWcEIB6NdSF/TlhDu6Cquq6o5Fw=;
        b=bSOES1dAwHQp6fIUV05g7wFBi6ID05zQHhxe2ZSppgO206gbubRn3V/P64YR1H2bCT
         9zB3f+B+n3Fl2gdUt8GET9Iv0Ep4NHnmvLjv/wjiIu4BiyAUOSbifF7dNTl0mgXPUUuA
         fyM04lPVl4W/4Qqbt4By9UNG3MHUYpmK76hqjYzXQiU24s9yU6W5pLUE26nDvomqe/sr
         GOuVCyzdx1OktvZZeyuv0T9axhN6Bx8SME/CwGDAB72exCuNSnKRwUTeb99+KM0MAvn/
         0K6D2QlmmiV9g9XKFF64cGIhCUkGlOuAW7jClR6zrKsKGpafOAr0Hl5I+XF6To2TSQ/o
         VNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203344; x=1789808144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfn95/c9x6fz6xYVpWcEIB6NdSF/TlhDu6Cquq6o5Fw=;
        b=IPeEmXSOAYgOLiLO6F9EKFoZgSTpmKBOiFNaBGFqZ7T1bN/zV/hnzAgR9sEd+wtycq
         vO9rB/gq4yxajPWDp5z+6yUPnGw98hr9pORXr6ZIqOUBsL9YZEaxPm7a2JCAsEf6XrVx
         iVjKHHaSbwfzdq849AFhl0XIppxrGrsZ16BuJpL3Tv/0I6WEmho7ISlIh0ugo3Tx7qDu
         Pcz+aWWWQVMQ1oiB9jWv2JLLcGjh5ER7qfUlkTx6GL7ks5/FeHtNdhjkkOS9wuGkWyEt
         4dKJPm1+qg6Fr/8BEupeJXMVecvyVj0Em/HbDNWic77CR490Tm78Nz+o74VGufTgy8MY
         2J/w==
X-Forwarded-Encrypted: i=1; AKwUvBypaAo+o1G5EL5WWWWqSZPeVorNRwPTZrbXV/y/YIpoxG39thHhoOMmPXr3qPMbdbQBJfM9HsPT45xxz1w=@vger.kernel.org
X-Gm-Message-State: AFuF++n8rA84sfmhDBmzkYw01J1JwXaIrHacuZs3xEmOOtI0a9bXcVu/
	K+jSprTJ6YijYL/6CrhxzgZ0YtcUlNJk7dTOTaWMCy4jWh7kh/A1IRrl
X-Gm-Gg: AYBFou0Dvr78nzZ50up2rluQxSIFuP7SL5HDz0SnbAKywhQO1ppg0G1fRILS/Yi5Vf3
	Ky504unoQJzlYCsV8uQlfyEezXqJw+nzUeIo+4pmDj7dnZSzFTekaS/94kK4ZN1t5wzL+U9+odb
	dwcHuLWFu4s1QoWv8XmFGASU7jI8I7PuO4sqJBFifogerOgIudcLmCe6aK5YDvjsWEJZb7Q11+Z
	IB0CN9pj5VVD+fQm8NocQvgns1PtStqHZWaz7n03Div99wc+1SIq7BZIzYdI/ZBO/3LCzW2cB/J
	mVSFt2yMAkBPOUokx/6Lf2wxI+1aQxOgyJ5FyYjjTyuADyZAQdE6ltYaZuKajdpb1Mvo+fxJewo
	eEXhM3IPJrl6PwAGdas2/MtPI1GQLRigMjWg2j9NsMN5a0znXMSlNl1YnxN2rZomLkv06g9jtGb
	lQv5tDF/Ig9KzW0HD9Y63EVrPIA4p5I1xtAXrmLbHXwXvcWkR+6Yrcrked9ppFIyNCyx+a3cqrE
	doksptarpUjMtiOwu18znDQGQh0Cx0MFonu6MbBegJiENzNVZ+LKkHaEDozgXmp/ZX1xM/RDpSm
	1tjVvHXxhJlt1hL9Sgso4zib+aBjYB5epZGZppQjCJoWV8IUT4Q4Qx8OjeRZ2sLWT9sL1P0lskX
	y
X-Received: by 2002:a05:600c:4709:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49e6cbf7526mr17800435e9.23.1789203343503;
        Sat, 12 Sep 2026 01:55:43 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm10588817f8f.36.2026.09.12.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:55:42 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:55:42 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: handle port status errors in disable_show()
Message-ID: <aqUTa9CgYNT9ua0S@gmail.com>
References: <20260810230432.44511-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810230432.44511-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 01:04:32AM +0100, Karl Mehltretter wrote:
> usb_hub_port_status() leaves its output arguments untouched when the
> status request fails. disable_show() nevertheless uses portstatus, so a
> sysfs read may report the wrong port state instead of an error.
> 
> Propagate the status request error.
> 
> Fixes: f061f43d7418c ("usb: hub: port: add sysfs entry to switch port power")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v2:
> - Simplify error handling (Alan Stern).
> 
> v1: https://lore.kernel.org/r/20260808131601.75096-1-kmehltretter@gmail.com/

Friendly ping. Alan Stern has given his Acked-by for this v2.

Thanks,
Karl

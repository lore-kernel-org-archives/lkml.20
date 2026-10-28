Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197474;
	b=xdOy3UWBKHmbtoAxPNhfQ5LoXXBsj5AVGr3UdRHIi6ldJ4xelVq4qanpwAbiOB0X/Z/9
	 TAgEwqADM/h9cHmhR6jmwp4m+2RgBJwCaLU6quUqi9nzDKi63HfvKKxk7DHHlDYZQ7dqW
	 ZxvZ8Mt69TFl91kCn+y3ZTN4kRpftSLGIibq1YDuvzUdA3NTAt4CUsAidlu6VmUqu0/yi
	 ayTDq+tIIpYm0RTnNzrfg4//nRRNIwjvJLQsQu2V1t+bR6ekP25pIgSg4a/GpKELgnAtr
	 5iAasfdsO31z2D4pU2MhstLLRAg4V+TkTHBJyXuqMWltNWgMv4gQldp19Ga9KyWOjfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2lNc3TmeFA42z/vlls1GtDaaIwnrmScSpoxbIc0sB0I=;
	b=rPNdfQOjTqjzEg67iSJFTXt3ZLHmMwisoBZm9DEIkXfDJXj1qNla7i+l4Sw4bOKhwwfM
	 Y2n8T/UKl5XkJQB+a5XGvNhPFW4DpfSt2JrGkHW1qSBg6vXghrVsR7jOLZ9gBBL0PXxU9
	 bCRc+Z9UmfGuWKepHDvXVya4oHVNbqjPBH+64J008DCrolbMZyk+8QwWFD63FNtkx+Fm6
	 +BYsoNDaa4gZHWOr8/ACo+50IKsY40wcI8qikknBAHyaixz19HeuXoH3RWs9MgQQtvF3g
	 DDw9KrDGp5wgzd+c7USzBhhdPw3jG+xxmngu50sBYTVexnUkgpmww/eQ+f3vy+IruuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuj+M89E;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB3606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2CB3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuj+M89E
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so1529203c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197473; x=1793802273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2lNc3TmeFA42z/vlls1GtDaaIwnrmScSpoxbIc0sB0I=;
        b=Iuj+M89E2C4BUXp3d/YGDW8L0zBd/79sxNVHYvvpUsD8kuWPNu6jNoS9QAPi137XQ8
         Max3lgZ+9dS9GfQvT2IO0vN766ns5hz4aqX5Ck3PUkO7Z92AgV5A8d5KvC8beg4uEfyM
         N5FRVYkT9vwajGJYW9KocJ+ufbhfArqdcWUMVtYaZP3s3M3FQUOAFS6beBv/iWrMr1VI
         upDYD7SS3VWgn9Kf0jjK4vCUCMxvQAz7oQoAav/wzyOUbiYc1y5NcPJ1d/0VxDnDM1rH
         jkDzlEBO6MQ2LaPaR3nV5j5T9qDMweomiegT5pVWV2QSrGcvxkT6cnbN/RRN8FvHCVuU
         3uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197473; x=1793802273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lNc3TmeFA42z/vlls1GtDaaIwnrmScSpoxbIc0sB0I=;
        b=EaHayeg0KYner7GGpqXmeapjewQuxCYilUfoIvnsnSJzLywRYnm94dlRqvmQ8ck//n
         nUJGl9B6oBoq+wloaquxqT1noSEk0gSxM8YI/uQg6sj9G16qvyzRU1lOPUVDbNnS2BLs
         Kg2oRX6+C3Aj22811kV11//U5qwC+C+3e4uvLkBQhJyDdc6K69mtG/2z9WS9HOa/nYfQ
         Aosen118VIF8lOcGycUTV7P0aPIVykQF32pjZnfEzPbRTvwyfDcrkfhPLEQjFhLwoqlc
         LilQk1J3XVkJ37JIsRaeAgetppvuT74vQV/Led3yBFh+J7FIFeH/34la0RQOS97qzK1x
         zewQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP8pNmmXCJcOrFGyA7Asmi0I9pZ+74qC5GbuiNjUnLkbXSaYxsa8AhGLjPg/Hbz2D94s8D3IVjvpoer0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHL9xohQrMougw9WwLbeexLhY1nnLR5VpxRT08YfzlKcO3bpxJ
	oW6E66x5h42FfY3NV2AlW7bhswPslV/UUJJQue+buIdJc5uc7AdMlUSQ
X-Gm-Gg: AYBFou1gV3aAbHA6h4CJGGZ1uiVuK0DTGVEmKTrk/seahkew4X1xnslygQT/vl8cpzX
	ph96TLsz/XyEERJ2bg5FvPHuOaB1Hv+Tg/4t6eUrg/Lhdhtn3cuCywUZGhJOTTT1qtLCuQEJkhP
	JUp7EuxObNsLMm+Xe0QlnixoiEVDzFy7sfxC2Ez7XvBmPU+ml1LXElDmza58jS9cMcylYVxooc+
	PsX6VllSu0StE4crTyB5aC0/2q1NwkXVwz0oMKEfT8LLAcWeYbaYVIJE83U1oqLDK7xQy2TvloF
	oQ5RRCEFEfW7VTox7SwyIPTuu0PyIYKCom7xJfijL8l2gHf8qgR50SN4erC/kujImBrxlOITfbM
	j0kR5aHMYFZiqP2s82abbvKWsTLpEgeHVtYrLzG2IFV/fiPF0AC2wMk+w7jZ1WbmWqGcSDSMyM7
	h09yF5wHtskMDGNzj8fG3TguZI1yJg9l7rzXOea06onLSoVFPdzO4NbnGoIB1A8z8szxAfl8ydc
	KpHeM1IbSKtDMqqIXxF2u2EKtlCqw0AkeInQJ88oVkY2HbRAqvE1M+OahbL6OzYSYIJGj+1/8xm
	VJxtQoQp9zvu4Q==
X-Received: by 2002:a05:693c:87dc:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a203af6d1mr3477586eec.17.1793197465873;
        Wed, 28 Oct 2026 07:24:25 -0700 (PDT)
Received: from l ([2406:da14:1f64:300:5751:346d:db2a:88a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239198c9sm6895930eec.15.2026.10.28.07.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:24:25 -0700 (PDT)
Date: Wed, 28 Oct 2026 22:24:11 +0800
From: Liu Yufei <lyf98405@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Gustavo Silva <gustavograzs@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: imu: bmi270: fix zero timestamp in triggered buffer
Message-ID: <auID4_vQSZXuNk0Q@gmail.com>
References: <20261028-bmi270-fix-timestamp-v1-1-99c0e5fe7d0c@gmail.com>
 <auG5MXTh9ZkXMw55@ashevche-desk.local>
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
In-Reply-To: <auG5MXTh9ZkXMw55@ashevche-desk.local>

On Wed, Oct 28, 2026 at 10:58:25AM +0200, Andy Shevchenko wrote:
> On Wed, Oct 28, 2026 at 10:59:26AM +0800, Liu Yufei wrote:

...

> > +	s64 timestamp = iio_get_time_ns(indio_dev);
>
> Do we need this variable? Why not call it directly?

The intent was to capture the timestamp before the bus read, so it is
as close as possible to the data ready event rather than after the
regmap_bulk_read() over I2C/SPI.

If that difference is not considered significant here, I'm happy to
call it directly in v2.

Thanks,
Liu Yufei

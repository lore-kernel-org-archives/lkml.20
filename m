Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05144063B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770490; cv=none; b=t8ml2hVuwZAxobrySZeNpY8P8vv5vswTDJY4Zz7xYqsEus8Sxxgya9t54HU1rYWDQa0VmJQ5hEtYcfq26yrotgiEUazJ8kuvudt+ZE3mnSaDGHhOtslkSxTuoHTvvGtR291CdcJA51bO3IqSTqLItWWhds+LQZgkAmVthyLtHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770490; c=relaxed/simple;
	bh=A6UKEG9tjljy5BO29IM2NVDCr1jF0sWllS0wIOUNkIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c56ctl+vU54THqJLjD7FdTbQK4qK1fb3P0PXu/NhreapzS4Gnnp2p9bhhCAIKoHrEkLkq9AbIzJnJZ7SBnUmxU/D9piNd9mwq3hvMsBa/0mR0f34zvsV7CwwlGmOXdg676ZmzUsRmx8JAZQz+PowEO7Ltm9hsiUc+GTr/xaLwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSb8yF1c; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSb8yF1c"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso2251288a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770488; x=1789375288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gD95xacnSwO5QNP7UhKSOo6QX3f1oTJ0b9N0SjSezHA=;
        b=MSb8yF1cqkrIM/JKPG4bMygRmz7myz0SeiknyjQ6IllPJXpYyVDCxrp9sM6XI39yFN
         VbNmEm1Kd5kWHIs4dJy1UIaOKtdoM9X6DPnUfdyYGpisjwqYStXVkx9+/NYM5il5nEMX
         DUoYDtU1E5k/GWEadmtd84BT995w821gEkLX1BJYr1FM4sJMDAVz8AJfXX+8fIe2nl4g
         Ny9OIgkVAnNT+/s7iZrOdHlX/p84Zto8+/7T0sTvuOBLm3BevWKlXfiN5fPRUdvnyoYM
         FwORJ2hncBcOzyeaPekAKIOGBu2C4j50O+3vKi4aZqb5YTVtcbPf8yc55YAXXrXS1b1O
         Ni9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770488; x=1789375288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD95xacnSwO5QNP7UhKSOo6QX3f1oTJ0b9N0SjSezHA=;
        b=ln7t/OsxZ1epjqmEzKCuW+XXM1UVoPKMZChgI38797BfkTtWNM9YnInGrjc08bdspn
         Ua16dsArjJiMd3FY8Kza+7agZMaknf/sGNsATXqL6A5p+IIahw/J7NocvGS0wDEHn4Up
         HvNsEKttt9wj4UAzfksUKgQOKtJ1/XjB0ecFNyZ8N974wZFgdO4zSg7etcihozwRbvh2
         pZWF4XeYITw5Thv9NryYeRK3RD9VgOEwCagtLnufU/nGrEHThIDSsv9xWDWXc4E/R3Un
         fkp2bQ24sff+lIf+NR5rNU4SqvqBQMfHOVvBDlS+LnVAWrGIk2QoJyG5Kmp4bV86oUEi
         HFHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1xF3yA3fQk8ctW9ZNcFgCI/ioNyyZxgjACVb9QZw1Ucrly8tdSnI3IKdVd4c46XrXyD5sgd3dNC5aI5A=@vger.kernel.org
X-Gm-Message-State: AFuF++kVTMK5Iq4EktEiUrQe0LqkT7gNFeuXNWa5cd+AmYb9Wfa1yryZ
	3CzRN2BdozJLYkSpJ9heXjWJaovjjImqlhRioQgAo6Gs4k4iEhPJA40s9ZATcw==
X-Gm-Gg: AYBFou00uC0584s/Q8q3vXKIs+FN0+Zd15ZnP4stGCopb8St5FH6b0fDZoTfuAtDYS/
	xUwf0rUJw1uupmq7Uzca6zYrxeEOxsaKrzUIuAbblwwoL3A5Gr3VdrMjv07JGpoNDM06yvj6hja
	tpO+n+EZ6xfBDET+zLzlPVx9p2jeqfKY0rs5OUHFybBitXcUKgWdsIgI2ddOoPY0FdRAml8YPxd
	t8rE9HhuoUOoTuoi7vG2cXMFNp9eHzfE/0Wqv6L1Fa1ugOpLvKVGqh+rfpgesuTBWn8/IEG9a/7
	YG6o5vP0MORTqjrOhfJZtphT28sNM33aQc21PwuiDBIaW/uDXBF9P/aONLwd42JEv0y1GbZ7jQx
	edFR06hthdMXqkh19+QPIL2WGHTT4ZQ09+6Xf2aDX/12QMeWtpch5os0Vq1uUjcXC1bnu+yrGHD
	HvXHI+3uPNPToO+DfzwtfRER9w/wwSqu8Np+RcRZF2y96XIy0+byOizZeVvFpfQdc2GAbRexzgw
	ofqXf+ZveYv1WiWT9XrdQ8x
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr35876536a91.24.1788770488465;
        Mon, 07 Sep 2026 01:41:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:2039:4:e8d1:b40d:5214:17c0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm25947600a91.9.2026.09.07.01.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:28 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:41:25 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: Add kernel-doc for devm_of_icc_get(),
 icc_enable() and icc_disable()
Message-ID: <ap54tQSLFZs4N_KU@google.com>
References: <20260907020504.24783-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907020504.24783-1-kmehltretter@gmail.com>

Hi Karl,

On Mon, Sep 07, 2026 at 04:05:04AM +0200, Karl Mehltretter wrote:
> Documentation/driver-api/interconnect.rst lists devm_of_icc_get(),
> icc_enable() and icc_disable() in its kernel-doc directive for
> drivers/interconnect/core.c, but none of the three functions has a
> kernel-doc comment. The directive silently produces nothing for them, so
> the consumer API section of the rendered documentation never shows
> them.
> 
> Add kernel-doc comments in the style of the neighbouring functions.
> 
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/interconnect/core.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 4aa991a54101..6f854375201d 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -423,6 +423,17 @@ static void devm_icc_release(struct device *dev, void *res)
>  	icc_put(*(struct icc_path **)res);
>  }
>  
> +/**
> + * devm_of_icc_get() - get a path handle from a DT node based on name
> + * @dev: device pointer for the consumer device
> + * @name: interconnect path name
> + *
> + * This function is the resource managed version of of_icc_get(). The path
> + * is released with icc_put() automatically when @dev is unbound.
> + *
> + * Return: icc_path pointer on success or ERR_PTR() on error. NULL is returned
> + * when the API is disabled or the "interconnects" DT property is missing.
> + */
>  struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
>  {
>  	struct icc_path **ptr, *path;
> @@ -786,12 +797,32 @@ static int __icc_enable(struct icc_path *path, bool enable)
>  			  path->reqs[0].peak_bw);
>  }
>  
> +/**
> + * icc_enable() - enable a path
> + * @path: reference to the path returned by icc_get()

Since a path can also be obtained from other functions like
of_icc_get() or of_icc_get_by_index(), maybe it would be better to
describe it simply as:

* @path: interconnect path

This would also keep it consistent with neighboring functions such as
icc_set_bw() and icc_get_name().


> + *
> + * Mark all requests on the path as enabled and reapply the bandwidth that
> + * was last set with icc_set_bw(). A NULL @path is ignored.

Since __icc_enable() explicitly returns 0 when path is NULL, it might
be a bit clearer to mention the return value explicitly, e.g.:

Passing a NULL @path is a no-op and returns 0.

Regards,
Kuan-Wei

> + *
> + * Return: 0 on success, or an appropriate error code otherwise.
> + */
>  int icc_enable(struct icc_path *path)
>  {
>  	return __icc_enable(path, true);
>  }
>  EXPORT_SYMBOL_GPL(icc_enable);
>  
> +/**
> + * icc_disable() - disable a path
> + * @path: reference to the path returned by icc_get()
> + *
> + * Mark all requests on the path as disabled, so that they no longer count
> + * towards the aggregated bandwidth, and reapply the constraints. The
> + * requested bandwidth is kept and restored by icc_enable(). A NULL @path is
> + * ignored.
> + *
> + * Return: 0 on success, or an appropriate error code otherwise.
> + */
>  int icc_disable(struct icc_path *path)
>  {
>  	return __icc_enable(path, false);
> -- 
> 2.53.0
> 
> 

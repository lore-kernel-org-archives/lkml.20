Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2C4C97;
	Sat, 26 Sep 2026 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437609; cv=none; b=l2H/ScdZqIoO/eyIAocEZekde5lpPm6zrVdMqEPHhBHy9JB5nT5P6In4HPdaMdb/V3DWTyU08P/jdAzNTQ7PaghdSuvgJiBTRQMF8oiiVQW4x3dqe2L92BE21aXh/4by8k5Pt5c+FwjCN8foEBoFYojzuECDIitmmU+WWd1cRRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437609; c=relaxed/simple;
	bh=pSPmgENrTjJ2/41M2gNcJSUCQy8sOrcn/NdxFtC8Vwo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gjq2lKoxEujNLWEIpwnfkIvbafa75BZZKWBJqPmd5baKqGm9bbkXXu1iMhBn3V77Hn93PImeVS41P9w7I/BAYcRLNT1Ts5zZmRk0kRzUSzJ7dZrMEOWA9tR7cD4NZSGrejfu3AwsvSrhITZFdlFfF5fC44AkIkW5hyHdcGGkoiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Nls3G1V+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Nls3G1V+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 32A9A415B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437608; bh=4v1rkYOarKpHHP40qyI+tr9yvZ9fxHVMi7rC8pfV2jU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Nls3G1V+ZUAnNr6c6bwHCzs+9N4+6/9CUyY6gEbV51oaRm8LepbU4f7jWLs6N8rKn
	 hB9f+QM6+lcfogidXss1Wpi008XH5F6HiQR9HV6I0YFWj7U5OOr9iqF/FSqfkTbkmY
	 TxhpZqNQpmXfBS7T0p1oysL69CMWxOHkjGAWStnJ1PPuN4gnesaeihD9wTxsYAYe2Y
	 HcbuNMkEtdhca51k/U+PYEC/VJGxYL8nd63/Mi+5Rm3utTxHdV1yK17pz1l6yoQQ72
	 sqJvdVBuFOOt1S3ImBgJ9w0Kytw/X4aJDQMtUpKAXL6SmVB0peRLYnjdzQWGyT3EF0
	 oJy7M79PtBBPA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 32A9A415B2;
	Sat, 26 Sep 2026 15:46:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ABI: sysfs-bus-usb: use literal block for console commands
In-Reply-To: <20260923024946.842697-1-rdunlap@infradead.org>
References: <20260923024946.842697-1-rdunlap@infradead.org>
Date: Sat, 26 Sep 2026 09:46:47 -0600
Message-ID: <87pky02exk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Use a literal block for console I/O so that the lines aren't merged
> together in the produced output.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-bus-usb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-next-20260921.orig/Documentation/ABI/testing/sysfs-bus-usb
> +++ linux-next-20260921/Documentation/ABI/testing/sysfs-bus-usb
> @@ -83,7 +83,8 @@ Description:
>  		idVendor idProduct.	After successfully
>  		removing an ID, the driver will no longer support the
>  		device.  This is useful to ensure auto probing won't
> -		match the driver to the device.  For example:
> +		match the driver to the device.  For example::
> +
>  		# echo "046d c315" > /sys/bus/usb/drivers/foo/remove_id

Applied, thanks.

jon

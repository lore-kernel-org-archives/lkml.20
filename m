Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76E49A3AF;
	Sat,  3 Oct 2026 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062694; cv=none; b=embl651cN1M+3sNoLeFzXUC0liz9+aPcjtkirKOIjSBKzYF/Ox1jed5QetrlrS9eshbBVj60sDbO555nYBxMNAw0JUIyoDjwGmgzt2Kbeh6qNaWbo4kqBYvnuxUXlol6zK75UFJfMdakJcAgH+IcgmvWH0aQ5EPJD0JxlrAAZZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062694; c=relaxed/simple;
	bh=w8dFbUF32AbL/4mfCX6syCCVd1xhsU/quBfprhz/VcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOjiTi8/nXHMbZzzNDUdN+nmpI0cRwl4QVZ0HO4ltHb1KtkcM5nUh3TCwBo+BhA6IN93AEzP5zHJeiVkrSS1X2+9Q2YVFlY4ItrYjwpcGwaN1HnYdqNa+jxaDXKq01RXC0G92y8+8+3Q9MmIwcTqz8dCIEpekFILxsA3TUrUiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJjexml6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJjexml6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B6B1F00A01;
	Sat,  3 Oct 2026 21:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791062693;
	bh=zCvngb9mLLtU/OT3MyqfFstZOG3lVllZVd75wGA7FsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WJjexml61cgZcvz12l3t8R+zE/vaYCf6sMQ24vYaRtxiJDneJPrwbRAWLEhLInOcM
	 kmGZcZno6tyl0DFK8o3vYea0qtAme+QrnniTKcYFDLE1BD0kVQng2VXAp9idX93SKQ
	 VFIa7MloiZGwWaqTxiR5plgMKxZhxgO99QUfezDoWvcag/Vm4HB5SmD9ZX6+f4dfAr
	 BEPy1s3l9QMV2dnsoOrC1rZFMDOS71kOrac7RTb1iLfBYncFPxIMj4MoWZ9HbKY3xP
	 ekxiHpxPpl8Ndj4rI06bM5gwKVoGgl+7bFg66A7wZ+LSGgC6unU5SybNob5lqK2RHT
	 Z0AGL2uNLWjHg==
Message-ID: <3c7238c0-b963-42e9-b0b4-3b1f231ee9ee@kernel.org>
Date: Sat, 3 Oct 2026 23:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] bus: add Altera timeout bridge driver
To: V.Yurkov.EXT@bruker.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vyacheslav Yurkov <uvv.mail@gmail.com>
References: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
 <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261003-feature-timeout-ip-v1-2-8837c311d571@bruker.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2026 22:19, Vyacheslav Yurkov via B4 Relay wrote:
> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> 
> Add support for the Altera timeout bridge IP.
> 
> The bridge connects an Avalon bus to the HPS and monitors accesses for
> timeouts. When a timeout occurs the interrupt communicates the event via
> sysfs, which user space can monitor to handle it accordingly. The
> address with the timeout is reported as well.
> 

Neither this nor binding explains what is this hardware and where I can
find it.

> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  drivers/bus/Kconfig                 |  10 ++
>  drivers/bus/Makefile                |   1 +
>  drivers/bus/altera-timeout-bridge.c | 219 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 230 insertions(+)
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index e4b1db809187..8a4ad96742e5 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -247,6 +247,16 @@ config DA8XX_MSTPRI
>  	  configuration. Allows to adjust the priorities of all master
>  	  peripherals.
>  
> +config ALTERA_TIMEOUT_BRIDGE
> +	tristate "Altera AXI Timeout Bridge bus"
> +	depends on OF
> +	default n
> +	help
> +	  Driver for Altera AXI Timeout Bridge, which can be used a bus.
> +	  The subordinate devices can be connected to the bridge, which
> +	  detects frozen read/write requests and notifies user space by
> +	  means of a sysfs interrupt flag.




> +
> +static ssize_t irq_count_show(struct device *dev,
> +			      struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct altera_timeout_bridge_data *driver_data = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", atomic_read(&driver_data->irq_count));
> +}
> +
> +static DEVICE_ATTR_RO(timeout_irq);
> +static DEVICE_ATTR_RO(irq_count);

Missing ABI documentation.


> +


> +
> +#define ONLY_BUS	((void *) 1) /* Match if the device is only a bus. */
> +
> +static const struct of_device_id altera_timeout_bridge_of_match[] = {
> +	{ .compatible = "altera-timeout-bridge", },
> +	{ .compatible = "simple-bus",	.data = ONLY_BUS },

I don't understand why you want to bind to generic compatible.



> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, altera_timeout_bridge_of_match);
> +
> +static struct platform_driver altera_timeout_bridge_driver = {
> +	.probe = altera_timeout_bridge_probe,
> +	.driver = {
> +		.name = "altera-timeout-bridge",
> +		.of_match_table = altera_timeout_bridge_of_match,
> +	},
> +};
> +
> +module_platform_driver(altera_timeout_bridge_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Avalon Timeout Bridge Bus");
> +MODULE_AUTHOR("Vyacheslav Yurkov (V.Yurkov.EXT@bruker.com)");
> +
> 


Best regards,
Krzysztof

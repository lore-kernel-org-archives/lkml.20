Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586794A99A9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374274; cv=none; b=PyMQIkZVwne7vthQlodofh6kXYVgbkYugjnH2JwDm5EyHOq6Z0QOZh4y0IMihUo7WESSygxzabj993eyJ5s5HLudizzngf8ouLKrqmxUs6Pw98uV6dOrYcI31jq1LzEOCz0af45Nq7eb5I595VwwI0Tq6BZp6q9p9iYqi4L0cMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374274; c=relaxed/simple;
	bh=uofRsaC+6uLSQZE9L0Az8+9rDxsZupmTT6ddwUMu1pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqnWtNHCm+RW3AIcBiamfQjgWiiZJGavQc/52zD66XYFvHfUyjkvV0LWU2DLCcH4iRmsvpok91KYr7y6vnn2HRnOv6cgLmtza3iXAOBdurMXEDYhbhn/6gPV/i2MEbwMduRecACIdBa5zM1W8PyJcP/cATC56BHYQclRB9K+0xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hs5HkJSJ; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hs5HkJSJ"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b354127480so152905eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788374268; x=1788979068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dk3OT6AljFk/kgpHjqstGw/si6tOmIKbjRNHYxcumk4=;
        b=hs5HkJSJEaIX9HFgzn87ukGx5bwTmjRYcRMoI0azTMTo1B0scF0bvFi/jyIG/zGx5v
         tVivLyCqjw1IXrxiyMIXWjgMIjLw+la7uCmpOUd/IR9IL72foyWfivb3oyjDUZPau0Tu
         EHSnEPKCIUMHvzRDJmJ4oHESJRr/MQcAyeZkA2JXUzRS9lx1gV6eXlo2JZBis7teNbAF
         SzQAIYFWHNYnGDgTOPUh8D3ubWBXN6NQrV7F6fztaa6PLyifbF9WC/LT/FCgBTpkAfVb
         K7mM6Rq1S6QymjqK+aPQ99O9zsJjvGW90DB7zkBM5sSr41XuR8akBwYD2E4Nd6LfVjbK
         9UzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374268; x=1788979068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dk3OT6AljFk/kgpHjqstGw/si6tOmIKbjRNHYxcumk4=;
        b=jyarjxMyLbzbglmJA1J3ulMEI9KdwvDfHedbuKIHZkU+zJF6YwmuYRz4m7MWGllkr8
         byUCFKqroiGVcPKl+tBTdnNn5iGt/nTH0feAYtXDY+jAWFwWAe7/IFCvN0HU3he+GZbp
         uuqOd3ILLTnmb+WEIZoSdPyEu9W/aww8RHUqYwL7bGJr7Bnc13dKTYxjoHntwVp3LNz9
         vYRZigI12L6XAFtcABpGMy7IpWl/uLNEpKu0Y1moq63wHQ1JEDE9Ess1Xzn0cPmS4rZV
         dWDgfMtSD9c+yQSLAz5jFKsKbtHcYl7DMvUBumdlCx3vitnhzxr5/YRYc6F3BkIUP9OV
         hzrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqbl5CzUrEHQD0FzTHHb060AhJlEucIe9B3rTXzSe/+mvAMka/Aos+27Jund24LmSq3XCratNtzWXgLaQw=@vger.kernel.org
X-Gm-Message-State: AFuF++kX9hS5shkSRJRzhP0Vz3Xuoab9mpRw6M1hRJxOxocCATqN1X9k
	1jhOU0Kbe0yuHYvW1U6fmG2UnZwG93WQE2Ros5BLNXTceNci2HtRO79YKv4zSb552Z54xXsTX5F
	84sdX
X-Gm-Gg: AR+sD10RWSsFCnYaX9qDJaqeOPNNXCwMqwzqQV7AcD5Mh+7VW2kcDJmTv+PGBUtgD7n
	MTRlLbdrRfJFNyaEXfGd6TV+lRVt28CeKJN5LfcwC/veE71rB9Krviv1t1UTWWgKvj4t+1EWfmt
	+wHtOJcIKSL2GYc2umMEga5lCipqVLPVNqZ1F8b3dWD9UkRpY3YTFgd+QvvUcJn/FDYZgme1mY1
	BdjDWPSTH+M1JlzKf3DI0m121sthrdJMggUW9SiX4lfaxajHy/FGGCrfqI3djscDKuxesE57RKU
	XaaN8s9aIAW+h1DbKcBxYnZMo0pVmmXtmzXy8OMH6vw5a6FUXMl+d0mDGDZQHp1q+DstcGxEvym
	QlhvJvGpvbaI2pov3P/NJoIG7PWqvC4MdfGJb1sc4hEnTqgaTZrGGpPGeU3iTE2DWrJt+1N5PgU
	8+F0uQQAShF/lO5bl/dLNwjlBEsKK1GLflbEICtmjbHAMi3fgYr+5J1jQqMyuax6pbbEKEbH5DI
	tZ9jlMAM87wiNh49xHe0gJNkLsLD/ycpv6ZwdBE9/oQy4pRHQ==
X-Received: by 2002:a05:6820:1686:b0:6a1:8132:cb27 with SMTP id 006d021491bc7-6b5841dcddcmr843359eaf.9.1788374268598;
        Wed, 02 Sep 2026 11:37:48 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:518a:9db8:615b:293f? ([2600:8803:e7e4:500:518a:9db8:615b:293f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ec2eb8bsm3128222eaf.11.2026.09.02.11.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:37:47 -0700 (PDT)
Message-ID: <cf9a0918-3e06-4532-8e72-ccc4d417e6b2@baylibre.com>
Date: Wed, 2 Sep 2026 13:37:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads1015: Add support for label
To: Flaviu Nistor <flaviu.nistor@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260902172230.5234-1-flaviu.nistor@gmail.com>
 <20260902172230.5234-2-flaviu.nistor@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260902172230.5234-2-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 12:22 PM, Flaviu Nistor wrote:
> Add support for label sysfs attribute similar to other adc devices. This is
> particularly useful because the label can match the schematic signal name,
> identifying channel voltages easier if label is defined via device tree.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - Implement changes suggested by Andy Shevchenko. 
> - Link to v1: https://lore.kernel.org/all/20260901184302.8127-2-flaviu.nistor@gmail.com/
> 
>  drivers/iio/adc/ti-ads1015.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
> index 0fbfa4e499aa..8be1f0c32ca9 100644
> --- a/drivers/iio/adc/ti-ads1015.c
> +++ b/drivers/iio/adc/ti-ads1015.c
> @@ -233,6 +233,7 @@ static const struct iio_event_spec ads1015_events[] = {
>  struct ads1015_channel_data {
>  	unsigned int pga;
>  	unsigned int data_rate;
> +	const char *label;
>  };
>  
>  struct ads1015_thresh_data {
> @@ -586,6 +587,15 @@ static int ads1015_read_raw(struct iio_dev *indio_dev,
>  	}
>  }
>  
> +static int ads1015_read_label(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan, char *label)
> +{
> +	struct ads1015_data *data = iio_priv(indio_dev);
> +	const char *name = data->channel_data[chan->address].label;
> +
> +	return sysfs_emit(label, "%s\n", name);
> +}
> +
>  static int ads1015_write_raw(struct iio_dev *indio_dev,
>  			     struct iio_chan_spec const *chan, int val,
>  			     int val2, long mask)
> @@ -843,6 +853,7 @@ static const struct iio_buffer_setup_ops ads1015_buffer_setup_ops = {
>  static const struct iio_info ads1015_info = {
>  	.read_avail	= ads1015_read_avail,
>  	.read_raw	= ads1015_read_raw,
> +	.read_label	= ads1015_read_label,
>  	.write_raw	= ads1015_write_raw,
>  	.read_event_value = ads1015_read_event,
>  	.write_event_value = ads1015_write_event,
> @@ -853,6 +864,7 @@ static const struct iio_info ads1015_info = {
>  static const struct iio_info tla2024_info = {
>  	.read_avail	= ads1015_read_avail,
>  	.read_raw	= ads1015_read_raw,
> +	.read_label	= ads1015_read_label,
>  	.write_raw	= ads1015_write_raw,
>  };
>  
> @@ -861,7 +873,9 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
>  	struct iio_dev *indio_dev = i2c_get_clientdata(client);
>  	struct ads1015_data *data = iio_priv(indio_dev);
>  	struct device *dev = &client->dev;
> +	const char *label;
>  	int i = -1;
> +	int ret;
>  
>  	device_for_each_child_node_scoped(dev, node) {
>  		u32 pval;
> @@ -897,6 +911,17 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
>  			}
>  		}
>  
> +		if (fwnode_property_present(node, "label")) {
> +			ret = fwnode_property_read_string(node, "label", &label);
> +			if (ret) {
> +				dev_err(dev, "invalid label on %pfw\n", node);
> +				return ret;
> +			}
> +			data->channel_data[channel].label = label;
> +		} else {
> +			data->channel_data[channel].label = "";

I think the normal way to do this is to return -EINVAL on channels with no
label rather than an empty string.

> +		}
> +
>  		data->channel_data[channel].pga = pga;
>  		data->channel_data[channel].data_rate = data_rate;
>  



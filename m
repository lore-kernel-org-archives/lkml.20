Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723B43BDD2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601642; cv=none; b=A6u0MyaV/apS9Dce88xkOXbYj2cKcD+Tm40D9ykMwWdGx2uQ5Z4rv/Kmz+6G1U73nbWvPsDIxMs5Kw79ayMhhuV9kD3Ge0QtuWHAhP5G01s+E1WbVUzUTQcCWsN0SK8frERCWUI//dyl8aMc8ASFkRgsWBvD009YE36z9yuu4yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601642; c=relaxed/simple;
	bh=22LhRkvj8Sld+sglUKrnO+ExPKvk6aEMmWFMUaXEMsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAuCU8Zh7Tu/wCv2o5LiYin7GDrhKx7smUploj8bJ6ItN056H5YMvQnIsEcGhof/dGjIPYKfxDe1Ua2umptiq9CmjHhXqeEVa54TpIHiRJrKNIr1cL4RmVFp2U4ocP/Lu1lIj1Lok0TdCHeIe4AaxtxGs+B4I0XitIZDiZPvZzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbS4mVG8; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbS4mVG8"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so184700a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789601640; x=1790206440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBlfwGeEPCPTAE5asTKk+nZQwiJmQBVdeLfzvcJ3wA4=;
        b=dbS4mVG89745VNDyUK/5r7KgfmcvGHD0ywmMItLOoVfIMHElBpKR/BYJQYLVI/b7Q8
         gan6GFBhHv9Ls4UxHarOHY3uhoIkLRLKRQwkNZ0cljFIItI+IN57n+RXQdU5FBNzHXXl
         2ucbQEJN/9pXoAIKy0lWg2Re6Y7t5m1KvToxy1m2Dc8mWephfN2LTXJn+MUbHlbSUpjx
         Ss98Lmt3/7Q9qerYR9aT4VPewEcnJn5Cg2q3nieQUCpN38LjMCN4esIkmMXSVMI2qght
         DdkoiQo1t+pnqrf4cgpuEeME+/4zilt4nzBvd2hkdS3UFc8qVKUe32PKH6x4ubtgU8cv
         l88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601640; x=1790206440;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jBlfwGeEPCPTAE5asTKk+nZQwiJmQBVdeLfzvcJ3wA4=;
        b=Pj+2WLOcg3+jxU5GLwjBLGiCeKzWbBJFsY6UpMjcaBB/clxnTnsvcbRTJtfu1Y6UCh
         VX8DhvHUGQt2jf9xUC0aqbSj72EJ076aj+FTA0t7zpV/4OVChmtClYtU+b9LeCdTjAqr
         PvUA/2o49uJLent82TRuUFUcQVE8lMKdtYObX6F/45F824kvRzX4oLkwpgnIZ5BCRgIc
         eUqNQPLCkh8dPT8zibOPAbkEzN2K29QiAz2AzXeL44KRJf39swUqD484zVz5hJR9Brok
         johVVYCyu1SWcrnsf/4bQ6B6JWf68pZgh+MxpB5ICuZl/DCSkaSUfoqTGfscJOCFF6u5
         bppw==
X-Forwarded-Encrypted: i=1; AKwUvBxbZ6oVdTSvDmnC3UvrC8B+7vtwrE7aYDOXW1AbL5kekBgMuk0Dw8kcXmJbAUhaTzhGkBVxvowyotOODaw=@vger.kernel.org
X-Gm-Message-State: AFuF++luw7wdjUvgEwWyd8RNKTaELifqS6qjsvtnOVo1cIV15h1n9OI1
	wkuMjxRl+ws6xsU+AsJDMu54pBAvpDcCRJBYXUyuC2a+uwlkK+RMeN9t
X-Gm-Gg: AYBFou13GFglopDX9+xTJQyQOioxgzm00X729YQ2mvYPo6ciuAwET1mpGEyW/FE7Nz5
	hV2/7XO4qt3RYESLmy3Huj8Czm4aD3NHbZ0EFr65TW8Ek2dE09EI2U3G/+dkNzJfzqeLEW0WVoI
	V+OczcK2Tnu3T16MhswPK4pmdGj+OTKWxs9NNh3n2m7JsTAeKkHMvRJ2j3U95eTbG6WFvcDdLoK
	KJWnXpf3V7+gwSbzxQtgrL9Mn1rO/ZxqGAnlW5uVAU48EWoQlW9/cc1FtYhNYFGtO3dlMiSJjJK
	mFQqKMeeEGjCDM9pni/wdr9GIGH7Cw6Bv8MkshZhl/ossH4surBwbld6hnKHzci7vEAlh9N1ZB0
	Do9I0iKEchqjia2VOa7txcoconENd7UCVQ3Nyd8DSO28CaTyTLOicBs1PgaBCBVKwt98aIyXIrO
	vN1JxJxtOYIwSerbs3UVw0dmkPIYkoKR5uxSroyJgBnisar/zq1X9nxKiZdUy112BrvcgOGYgMX
	WBArhyYrcesQ/F+BSuWi5EdjMkQFOo5Flo9W/JUju2Y1rcb
X-Received: by 2002:a17:90b:2748:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-39e1e4649camr13354819a91.15.1789601640181;
        Wed, 16 Sep 2026 16:34:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm12174595eec.14.2026.09.16.16.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:33:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a49ebfc-ac1c-449f-8261-d4c28f4070a1@roeck-us.net>
Date: Wed, 16 Sep 2026 16:33:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Improve raw WMI string handling
To: James Seo <james@equiv.tech>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Muhammad Bilal <meatuni001@gmail.com>
References: <20260916221912.434119-5-james@equiv.tech>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260916221912.434119-5-james@equiv.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 15:19, James Seo wrote:
> Commit c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on
> EliteDesk 800 G6") left out some logic for recognizing raw WMI
> strings in check_numeric_sensor_wobj(). This issue was reported by a
> user along with an incomplete and unsuitable proposed solution [1].
> 
> Add the missing logic and properly remedy the issue. Also slightly
> refactor how raw WMI strings are recognized elsewhere to make the
> intent that they should be treated as regular ACPI strings clearer.
> 
> Reported-by: Muhammad Bilal <meatuni001@gmail.com>
> Link: https://lore.kernel.org/linux-hwmon/20260916002907.161210-1-meatuni001@gmail.com/ [1]
> Fixes: c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on EliteDesk 800 G6")
> Signed-off-by: James Seo <james@equiv.tech>

Is this v2 ? Resend of v1 ? A new patch ?

Guenter

> ---
>   drivers/hwmon/hp-wmi-sensors.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
> index 03c684ba83bd..cb2eb9bd278a 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -526,14 +526,12 @@ static int check_wobj(const union acpi_object *wobj,
>   	for (prop = 0; prop <= last_prop; prop++) {
>   		type = elements[prop].type;
>   		valid_type = property_map[prop];
> -		if (type != valid_type) {
> -			if (type == ACPI_TYPE_BUFFER &&
> -			    valid_type == ACPI_TYPE_STRING &&
> -			    is_raw_wmi_string(elements[prop].buffer.pointer,
> -					      elements[prop].buffer.length))
> -				continue;
> +		if (type == ACPI_TYPE_BUFFER &&
> +		    is_raw_wmi_string(elements[prop].buffer.pointer,
> +				      elements[prop].buffer.length))
> +			type = ACPI_TYPE_STRING;
> +		if (type != valid_type)
>   			return -EINVAL;
> -		}
>   	}
>   
>   	return 0;
> @@ -579,6 +577,7 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>   	int prop = HP_WMI_PROPERTY_NAME;
>   	acpi_object_type valid_type;
>   	union acpi_object *elements;
> +	union acpi_object *element;
>   	u32 elem_count;
>   	int last_prop;
>   	bool is_new;
> @@ -602,13 +601,20 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>   	    elem_count > HP_WMI_MAX_PROPERTIES)
>   		return -EINVAL;
>   
> -	type = elements[HP_WMI_PROPERTY_SIZE].type;
> +	element = &elements[HP_WMI_PROPERTY_SIZE];
> +	type = element->type;
>   	switch (type) {
>   	case ACPI_TYPE_INTEGER:
>   		is_new = true;
>   		last_prop = HP_WMI_PROPERTY_RATE_UNITS;
>   		break;
>   
> +	case ACPI_TYPE_BUFFER:
> +		if (!is_raw_wmi_string(element->buffer.pointer,
> +				       element->buffer.length))
> +			return -EINVAL;
> +		fallthrough;
> +
>   	case ACPI_TYPE_STRING:
>   		is_new = false;
>   		last_prop = HP_WMI_PROPERTY_CURRENT_READING;
> @@ -631,6 +637,10 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>   	for (i = 0; i < elem_count && prop <= last_prop; i++, prop++) {
>   		type = elements[i].type;
>   		valid_type = hp_wmi_property_map[prop];
> +		if (type == ACPI_TYPE_BUFFER &&
> +		    is_raw_wmi_string(elements[i].buffer.pointer,
> +				      elements[i].buffer.length))
> +			type = ACPI_TYPE_STRING;
>   		if (type != valid_type)
>   			return -EINVAL;
>   
> @@ -651,6 +661,10 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
>   			/* PossibleStates[0] has already been type-checked. */
>   			for (j = 0; i + 1 < elem_count && j + 1 < count; j++) {
>   				type = elements[++i].type;
> +				if (type == ACPI_TYPE_BUFFER &&
> +				    is_raw_wmi_string(elements[i].buffer.pointer,
> +						      elements[i].buffer.length))
> +					type = ACPI_TYPE_STRING;
>   				if (type != valid_type)
>   					return -EINVAL;
>   			}


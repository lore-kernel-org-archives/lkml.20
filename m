Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ECF21ABD7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078775; cv=none; b=UVDXjhUvzk5UauHkNYcCn4FHqGlP1XZ0chPUSGbNPTmvKMZjQta1+4lW5qZXbR5e58A4ZrouEdz/vZ6e6dw2yQAJriexmqpVC0OyZQFTDGyy7BcIO49q5zdag5KLwMrnqPB5/OLALnnjK+ibWdL2NCVVvXpvmSvxxufRR4HBnuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078775; c=relaxed/simple;
	bh=e26TYNe2QL8d0T7JPZwSv9gfQXW/AkTljomMDCzK/C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsXYf4q+lbLMHpVvOHFiOtqtrV1McBoRY2ehMHKrasB9Dl3hZlyNwaEvp8OB0WRL+IuhXKhQdAiZ6FIvpz1tGGfeLca0EjQ/TT1avTMptMeHQokzdbCMdG1xmw4uaId9+F9JZcbyNymEvWn+bVcW0xOrlbF1UlaePImGcMsEfh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7jLS46+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7jLS46+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so1763495e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789078772; x=1789683572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0I3M3rAR5bHQYaKtviGaKS9FP0lfKdn84QYzscvg5IA=;
        b=M7jLS46+2AgDx5UjgJoVwt87sdFHptFkS2LT6DRjl9wOdCi20yudfx/lIlmzRCg8t4
         +twO1/lbPelD0r1qjfjnoj6AuO42n+HolkTqZp2wpGZzt2Vtr3Yyf0CU004uDjIvvFC3
         YSvXXmXpTs8BjH2hPvpwu7Yh6wilhJ3B268B4c9I2cmCJ6dwO8t86++j6t/bZlVAZaqI
         sM+jwos7TkGacvSU1yiJ49czA3WPM3ntgciKWZ4RLK4mrKLF26sVVWUGV+GgVbOw+7i4
         bxAG+KbbLDKZBtXo4b1XDaiJHm66TVqeOh0nfA0gl9MyAJhGCfIsC8TzsMUTFCqd5/aJ
         pGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789078772; x=1789683572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0I3M3rAR5bHQYaKtviGaKS9FP0lfKdn84QYzscvg5IA=;
        b=sTRqlKKtSK8E1M8B4TF04XSQs8Ji/vkiiVAMQ5o+R0XlXRxc1VmiGJYXEzEgoikau6
         2Z8kU+8mr99Aijy3B8V0+k7gMucXykkD2vvQFMyuB01X7QbSxACjonjjixvJNkZf9H45
         JPokTj8XmL6Ha2iR1d0pzBTRC4/H9fD0OQGtSLkQySgdygKuuZU7NqAwBllILJl4YXlH
         +vTwuSj1yq7wRlfS4mpMpfetLAj2X7Ygv8ylOg1lorjeHz5ABY8Qeijv4jS/RCq4EO2m
         kM2i+dbJzaOfbjDQ09FFWJKx7sftVYsaYpkc4YSxS+S3thHgPzNfXaKU28duPWgmgKOP
         nSwA==
X-Forwarded-Encrypted: i=1; AKwUvByE+T4uwOVDMF2I95JGZ1KxTxwVxjQuJ9+h+HDi6d40xaGu0V2YMcrL3z7/4xS3sUrDMktty220e+e/mgs=@vger.kernel.org
X-Gm-Message-State: AFuF++l1w0+N9XQ1aV7Cr7lyrHhea0H5BnBsJ6VjgaKA3djkn+b7PMyi
	Rlv+nNAkZwAuHL1WFyUhoGIPjEMq44sq1yr2mvvsGkJrPfNPZKmdks54
X-Gm-Gg: AYBFou0+kBDtD5lp1q8HgY3Ur/k99SvHjOGLDs3vLX/8PhDLElr1K4pi3sjRJTJvWRi
	y380/lrg7c5VsvMHv4mHJpkJotHjxfDoHAM0wEEv8eWobFlGxRsScLHwLcnbPmHHprcJpE5wmrB
	YpONS3t43QQU88JNoRLAuU0bfVFuAwS0UzyFJpMJTm+kjGqD+lTQzL37TjBqx9+WLbii/pEuYOD
	tyCDtoacxxiVKvdsHv4EAKUX2omXPHJ8aHMQMGyxrg7Yu9C8A7CUKBqKdd3YugDaubWhFq1x7of
	8UAOEXjfM++KQeyvlW4d98jTuOGCzDjePi+5eGUL1G7dNEbn5yEcddQC1emKJ10urmIcD/ypICj
	Tic3CkaJUcFbFN8xPgoyKclJVDrI8J/AW+bB01/rDgun+v6jP6yutOyACUfWKxeQTmqQ8ij37wI
	O5q4grhFp2gJys8XxDzV1mU33hWZCKbp8O8nQWVw4ixb6z2Om77L6dUVDJaa4DatUeXLEkd+P4I
	aYBASk4tfLt/rsZzQz4/6KMuRjKq7tv5+NMWTB9TU73Dl4afjkgzx3bH/JAuHuYFa4=
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr22607875e9.14.1789078771691;
        Thu, 10 Sep 2026 15:19:31 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfc1sm123524145e9.4.2026.09.10.15.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 15:19:31 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e21cf89d-6fb0-40a3-85b0-76bcf1cba9b9@gmail.com>
Date: Thu, 10 Sep 2026 23:19:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kconfig: prevent out-of-bounds user input for numeric
 options
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
 grahamr@qti.qualcomm.com, kees@kernel.org, pengpeng@iscas.ac.cn,
 vegard.nossum@oracle.com, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260829171902.1510587-1-julianbraha@gmail.com>
 <20260829171902.1510587-5-julianbraha@gmail.com>
 <178856431424.3782172.2818215537125415152.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <178856431424.3782172.2818215537125415152.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 00:25, Nathan Chancellor wrote:
>> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
>> index 4234a51d16fd..2227d89d6328 100644
>> --- a/scripts/kconfig/confdata.c
>> +++ b/scripts/kconfig/confdata.c
>> @@ -354,6 +354,12 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>>  	case S_INT:
>>  	case S_HEX:
>>  		if (sym_string_valid(sym, p)) {
>> +			if (def != S_DEF_AUTO &&
>> +			    !sym_string_check_bounds(sym, p))
>> +				/* hex uses 64-bit unsigned integer */
>> +				conf_warning("value '%s' for %s is outside the 64-bit %s integer bounds",
>> +					     p, sym->name,
>> +					     sym->type == S_INT ? "signed" : "unsigned");
>>  			sym->def[def].val = xstrdup(p);
>>  			sym->flags |= def_flags;
>>  		} else {
> ...
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index 2d8b0c65ce1e..6f99216ee76d 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -4,7 +4,6 @@
>>   */
>>  
>>  #include <ctype.h>
>> -#include <errno.h>
>>  #include <stdarg.h>
>>  #include <stdlib.h>
>>  #include <string.h>
>> @@ -255,17 +254,13 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
>>  		return 1;
>>  	}
>>  
>> -	errno = 0;
>> -	if (sym->type == S_INT) {
>> +	if (sym->type == S_INT)
>>  		type_bounds = "64-bit signed integer";
>> -		strtoll(sym2->name, NULL, 10);
>> -	} else {
>> +	else
>>  		/* hex */
>>  		type_bounds = "64-bit unsigned integer";
>> -		strtoull(sym2->name, NULL, 16);
>> -	}
>>  
>> -	if (errno == ERANGE) {
>> +	if (!sym_string_check_bounds(sym, sym2->name)) {
>>  		fprintf(stderr,
>>  			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
>>  			prop->filename, prop->lineno, sym_type_name(sym->type),
> 
> With this, you could inline the type bounds string like you did above:
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 6f99216ee76d..f4b5b11991b4 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -238,8 +238,6 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
>  static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
>  				const struct property *prop)
>  {
> -	const char *type_bounds;
> -
>  	if (sym->type != S_INT && sym->type != S_HEX)
>  		return 0;
>  
> @@ -254,17 +252,11 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
>  		return 1;
>  	}
>  
> -	if (sym->type == S_INT)
> -		type_bounds = "64-bit signed integer";
> -	else
> -		/* hex */
> -		type_bounds = "64-bit unsigned integer";
> -
>  	if (!sym_string_check_bounds(sym, sym2->name)) {
>  		fprintf(stderr,
> -			"%s:%d: error: %s constant '%s' is outside the %s bounds\n",
> +			"%s:%d: error: %s constant '%s' is outside the 64-bit %s integer bounds\n",
>  			prop->filename, prop->lineno, sym_type_name(sym->type),
> -			sym2->name, type_bounds);
> +			sym2->name, sym->type == S_INT ? "signed" : "unsigned");
>  
>  		return 1;
>  	}
> 
>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>> index 7e81b3676ee9..2d1c021fa395 100644
>> --- a/scripts/kconfig/symbol.c
>> +++ b/scripts/kconfig/symbol.c
>> @@ -5,6 +5,7 @@
>>  
>>  #include <sys/types.h>
>>  #include <ctype.h>
>> +#include <errno.h>
>>  #include <stdlib.h>
>>  #include <string.h>
>>  #include <regex.h>
>> @@ -711,6 +712,21 @@ bool sym_string_valid(struct symbol *sym, const char *str)
>>  	}
>>  }
>>  
>> +bool sym_string_check_bounds(struct symbol *sym, const char *str)
>> +{
>> +	errno = 0;
>> +
>> +	if (sym->type == S_INT)
>> +		strtoll(str, NULL, 10);
>> +	else if (sym->type == S_HEX)
>> +		strtoull(str, NULL, 16);
>> +	else
>> +		/* string */
>> +		return true;
>> +
>> +	return errno != ERANGE;
>> +}
>> +
>>  bool sym_string_within_range(struct symbol *sym, const char *str)
>>  {
>>  	struct property *prop;
>> @@ -722,6 +738,8 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
>>  	case S_INT:
>>  		if (!sym_string_valid(sym, str))
>>  			return false;
>> +		if (!sym_string_check_bounds(sym, str))
>> +			return false;
>>  		prop = sym_get_range_prop(sym);
>>  		if (!prop)
>>  			return true;
>> @@ -731,6 +749,8 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
>>  	case S_HEX:
>>  		if (!sym_string_valid(sym, str))
>>  			return false;
>> +		if (!sym_string_check_bounds(sym, str))
>> +			return false;
>>  		prop = sym_get_range_prop(sym);
>>  		if (!prop)
>>  			return true;
> 
> Sashiko has a comment that seems to be relevant here unless I
> misunderstand what it is complaining about:
> 
> https://sashiko.dev/#/patchset/64934
> 
> Otherwise, I like the direction here.
> 

Thanks, yeah it seems Sashiko found yet another instance where the
numeric bounds checks could be improved. Including this in v2.

- Julian Braha


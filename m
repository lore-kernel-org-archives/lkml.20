Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007952;
	b=1g4ezM5SNcUyqu6JmLKHqUtgwdR8Yz76l3XwglsnbdDWavhnvW4XAEGZ7ET5Y8OnMuoR
	 jERgKdh4P+MFDXhx0K7PpYH1dFDOWNch1Fc/MQNuNFas/sfWKDR5UJTYsyFvHNIfimmZy
	 lHNuVtwbXAc4dIeQnJCg4NCel8vt2NPAgk9S/1XjbJTg2Xo/A05BpADeeXAPfPVI2SQug
	 VozP0XNxmwm1fjJiCoBEasRYrLBGf6wv0ZuUkJHxVfpBaT1ddn/1WNyuRtZy/i1WdEJ9n
	 wKIqjN04OCyoTnY0QY9X7JBgl2MMUt43e0pBnOGvw/3o9O9fbMAoWMpvBbW0x56yl0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
	b=yHRqtMHSK3lgG5jUBAUtBgmgJTG2HCS0aMHWh5HCJd4BKCd3JI9QfY3q1XvDTvS0OHIr
	 k+U1iBycHUfjlqcAgvhbS5aoDxfvBjcp9aQQEnRlA1PmqjGqavkQPv0T+XnJJlMl0KWY5
	 jCQVrMohvy/1+infvaWvNm5Dgsoejx3WRjcnLx04U7nTUKTHSwrmRdR9KTXItsl3aapGC
	 W8FZs9eCppQimAgw5409WhIb34h9D6fF7YLgoRlqcwDBiaBvGIR4AJJXOATJANQBR/dSu
	 HAPuwybNYCcD3oYSmOAv/caa0I0u9ib9hHPvFBFv8l/Il5O38Mp/AlQ0zFedH4Jwo3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a8cOFiNT;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4331606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4331606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a8cOFiNT
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfb76b304so200181f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793007950; x=1793612750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
        b=a8cOFiNTzODoESqu/FX14nDX71ki+Ovb0lGMc4rG5YGA9fH/QDDHfoWo1RO2CmbE8W
         J5fKFEWzSMwVDgDCO8tMN/Dx7KyN8mGNby7U+hXaT+LtLVXUBUlYh6J2asFA0GAu7OAQ
         uIFCj2tEtPNskelLAqpWqFipr27pHfvBILQgIrW2wF/PaLIybuXHDas4wHZofKaQc5vN
         xICU37igjo5OnzjevgRB6Fgy5PsrNVsGq6ubhh9QZ9qzK5RquJmkXipoyjIWWt63vGFX
         ueyXwDs3FLPC0EgQyHzcp3SwTM8L9WVrb9Tk5heX7QgYYd1vo7QQD9QE1TgrywCfn0n1
         wdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007950; x=1793612750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uISNjmCShJIJ9U7oVaCYIDvxAqLTubZCQAnAKv9Gul0=;
        b=ggaKYVFUKmS+Yc9y17SvLrZSYhv+W4sA7/sKCCFg/QBjnKfcDypiGNX+Yz6YZzQejs
         /cayqA9TZbeeLH2x6a9Q9VARst1eciaHpJxEaYZKubZb7xwdU4v0BiCizNSVY8aEzGfL
         SI/2JdG4opoikprlpAVPRs6L7g6ZSdOu6ShFrLDeS135nC/l61XNn1ECvJkHWujfh5s7
         SO44u6D4TybgOSk7T17yVwkRrVJEshZBhRpjgHGyINAK6wsIJ+Xu48Tz9zGQn+Kgu6z/
         q5FKKbyXCf+gTMzugzdkXy52YZeyscSy0b0/Rhg6/WG4ls7Yt3khf+s3NA7lOVQ+ky1q
         RbAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEGxhxrUDIn+zigxRPTfIQvilHsH6zv0E3XOdHmDyBNkS4PcukComAlD/f+whDCzvGdJt6QQAqWbm20Ow=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrX2tcrfkntxDL3Sm7tCI7wAyTOdyZF4DMADw4M2QB4nWBhA4F
	+AhyCC7lnPlUluz2kG9hhjv8wDIa51OxH4gBuIStIWkPWmn2nYKUUMXaYROiP3bJeeQ=
X-Gm-Gg: AYBFou2v+tho0/zCQOwiaUHpaN9gKFSxNEI/RT0hzgvyqSjESs0jEUngea7qOTD29i+
	0TE5R0OeL4LTUZiin/In3a4vLqxAdygiBQLAUev78VLH8xBaRI2koYvEoUBBf85rerGdj/P23Yv
	If8Y8DVkw9c3GfSpIXgjL8by9uylIZ2/pvTuCoRELXayq4mh90KQYc3zRsfuAIRL4tBh/WGbWHW
	aq3Irkc3ZNiuEfzyDjT9BhI4YJeLNGwhNJ4zhC/WPWDwBnb0Q2wUqIams90cDbZKsm9ATNhlddp
	sqf1DTr2eELjSM54rOwI8OdESFdWwfLzPLpPRPPvLl6U7sMQ0hDNigNk1KTrzg1mZDTS25eCDLe
	r6+urgVeuOnC21kOTDnDZWGRwlhu7qIA+8SGwEBBwXrXssHGQtMLwgnxHuWbsx2wU4yzDYwv7FJ
	bjeTSqpxlsSVECV/WW1lEiNbI+NlTYOoqDmHVutwRURLnIHlItq+aghvkF434baf9btFUtXlK02
	UQP+DuXtLlgvjQENi6UBo7n1tA/KLKu+v8un+AU/QkoAeN8n8AtT+j0WYYc7V2/yGmx70ocTI/S
	5WFfXw==
X-Received: by 2002:a05:6000:46c3:b0:48d:fed0:ccbd with SMTP id ffacd0b85a97d-48e3eb93719mr6507061f8f.34.1793007949962;
        Mon, 26 Oct 2026 02:45:49 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm15594852f8f.33.2026.10.26.02.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:45:49 -0700 (PDT)
Message-ID: <d3e80414-4f27-44de-b6fe-36d9a675e4d3@linaro.org>
Date: Mon, 26 Oct 2026 09:45:48 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] coresight: syscfg: Remove unused
 CS_CFG_MATCH_INST_ANY
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <52b3c337cbf4a8460e399b084c6f854eb3beee89.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2026 05:48, Amir Ayupov wrote:
> CS_CFG_MATCH_INST_ANY has been defined since the system configuration was
> introduced but is not used by any configuration, feature or device.
> Remove it.
> 
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   drivers/hwtracing/coresight/coresight-config.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
> index f04e73b91d9a6..220bc54f8e5e1 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -39,9 +39,6 @@
>    */
>   #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
>   
> -/* flags defining device instance matching - used in config match desc data. */
> -#define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
> -
>   /*
>    * Limit number of presets in a configuration
>    * This is related to the number of bits (4) we use to select the preset on

Reviewed-by: James Clark <james.clark@linaro.org>


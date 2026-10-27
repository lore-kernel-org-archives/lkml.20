Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096259;
	b=gXdg5qVCOPjAFkWD9DnU4YrebLTxxg4gFduDI4fc8m+zEcreKBLE/NH7Wq3wsRDMMwDq
	 sw9BjMRtfY8Bf2ccoZmoXXvazNAbY8EQCKK6BCPurMvWYVAhwRCOjuCKFmx2Xu8G/e7KT
	 cYctviwL89k1fFhbYa5usSOXiFiEP0q7Buh5ME8M4xbmUQREjjVRdDqpRxOXOBWfujP/1
	 j64wUnB7gsZpxMcQ+OH7FF1SwB4HXVdTlH2oCDyOm1A8JViwd9OnUfQcBmKzIyPg4qRI5
	 065yL3N8qA8Qf9SEiOHnj2wMUqTrO/33iLUAJMLXyZZIhY7nBRJh/5xQCYJQ3X59/TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
	b=SvG2psA7/bQlbnPN9t1K6HasIzlPSbWUYqGytN1c58ovKW9XwLagX55bpWBx5BP8TFp1
	 cyfF9WK4m4kphtQPi8wGwXKwyZ32ZnDKxXI+hVA8/e6g061Wt9u1WLR3uT7LBz8mhU2bk
	 Cl0Et5fHOrnvK+cwkc/UXcIgx/iPGW97/346w9vChozirpolAhjQx8A4tDQLwpKxz8o/R
	 866/D9MNvPfi8EOZPst6AvE9cqPRVbu9I+ryCB2mKj2DmyJA7ijSYTQb6t6v0uSkibZw4
	 uos00Slz3bdx/VVlr/UW+uYTlbOBvdQYbWxeSLK9byIVOwMiX/G3Asf57G/U2t9LfHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=fmA5ZVtw;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F52606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F52606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=fmA5ZVtw
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so30880455e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793096251; x=1793701051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
        b=fmA5ZVtwVJcNE/fAKAHqsP3pTMhIMG/B4/fp3GRzy6U2KUaRfKgSPPQRO7kH3SZ6uV
         l+fzzhfmGr9Mctm3db6DzPN2NeHVOu5pYzT1nPmjh7/grQz1Dup/ibheJflAfN28BYGt
         sbIOe1LMk8vFbragFHLOaRICCrM6OPu2imRyfnGBgaurj8ZgT/B2EU27xE/StHY2p3vI
         0FtODpcVTVfduuEmzZ206fQ1o2SEoqVEe0oCCy1muVMUaUmDeCS4IvdMx8Y+6Yayv+xv
         4MfvlIyEMIM0RMDLyW4wNgG61M8b27rM8mXK+xBP7O+Jx/KNHvVSN9NnsB2j6/T8iqaN
         ieig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096251; x=1793701051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROl8Z/DFaCJAxQvsLDCIwxAYaCdKritEmYyIuCU28LM=;
        b=ydyxJD5o7qu9xyYTJ1rHxietaY5gaWQENdXud0hyCpXQUCwLxWZcVeGPZhfnwRNeu1
         QTz8NWc48W6fRmqqz+nZm+nSFW/lj1GT5kuEy92T8itteRcdTL2qyqfwCM+FmWcaoqwY
         FFu/qlTWACfneO5m+VGjxyHoiQ0vPTgsUpsH8JbYn9aDKTTImWAf0C+PKJcjM8eschlZ
         y/xAqpjsD8Pe8BvkSiiLaU1vW91uFiczVfVOH54836ubZF2+CnOT8OJnBK9Kpd/thaQ1
         GT2brLND5ZXpJ6OHLl35FOf5XRAX0ylOWWvf56lnEwAboL8T1BvYUh4uQjCuiTCBHYHX
         5orA==
X-Forwarded-Encrypted: i=1; AKwUvByeR0AdfKnJtVqDw3m02660IIHGgDwzT2BQ1zYyQrG0Q6mhN2Kk5PQhWjIgJfslZaqjsVfXSjvXd4Inl7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuQGkxVcf4VHk6qlL9be2kcOwVMCvyeGsS6TyCVW/qyMTg7nx8
	PYdNAnZ/dttFNLXuiDMaW6U0mGqgcAV0nNzjMiHdjXYuWsVi12I/nH0P64V9qQxe4qg=
X-Gm-Gg: AYBFou1FcLb7X0dhKM1SaQjQ3dr0BNnR176Kzx2FhRye3bktZeMn6d8ep8D/LPufIyx
	q9GUh6FKTLtbErF4Iy0RYRLTQg27ECABMcQBSbqN0KEtlVv7GPdTTR2HoCBCiDYwrji1nB8UKE+
	PYuGVSfLcDCrGufILYnN3odDV2SeIL+WnzuP2wE9ZyfB6Lu651CFYPhn32xIhyUkbathw6wKDtq
	aJWSPAxveWNeTJ567br7MtMDxWt72+oYoKb7eWUtX7yEEB9TZ8uGjnN8JnNy0zERWrwjqvNiADK
	Mm+CmHjtouUSrL8r/0QEORMbmozgNmsCmfwoJ648+s95r+lnjos9l9fAt3PUMwopvqH2cUjrLmu
	uFrgAjVtIpG3qNrJwppNw+me/w9idVuAZDZK6BnExrtbAlCa+2Qhsc/marmNK2SfC51Cxtx5Xkz
	lQqK2sUIJM/QyQOJPHUTIL2rT9TWiUf4XcLO2YtGbaVKnDDGcy7rqrBYQ0m24w6nqCZH2ptHTQq
	iO/99dHi1rlhsueINOH5gIQ/NOQFsY4lD8md6x28pJE2Y4nDB0UADzLM3ZS+fGk
X-Received: by 2002:a05:600c:4704:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a35acc2ea1mr170116035e9.35.1793096250940;
        Tue, 27 Oct 2026 03:17:30 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm271453735e9.15.2026.10.27.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:17:29 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:17:25 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 05/20] ctlv: Prepare message input handling
Message-ID: <auB5yxcuA50kg5x4@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-6-jiri@resnulli.us>
 <179302367449.58760.13616210130636541456.b4-review@b4>
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
In-Reply-To: <179302367449.58760.13616210130636541456.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 38 lines skipped ... ]
>> --- /dev/null
>> +++ b/drivers/ctlv/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menuconfig CTLV
>> +	tristate "CTLV character device TLV UAPI"
>> +	help
>> +	  CTLV provides character device UAPIs described by a checked-in YAML
>> +	  specification. It owns the character device lifetime, the strict TLV
>> +	  message format, request validation, reply serialization, the large
>> +	  payloads a request describes rather than carries, per-open event
>> +	  queues and runtime schema introspection, so families only implement
>> +	  semantics.
>> +
>> +	  If you don't know what to do here, say N.
>
>This should probably just be a simple selectable config instead of a
>full blown menuconfig. ie one with no description. Since this is
>really just a tool for subsystems to use every subsystem that uses it
>should just select it.
>
>So:
>
>config CTLV
>   bool

Makes sense.


>
>
>> [ ... 159 lines skipped ... ]
>> +static bool ctlv_message_nest_index_ok(const struct ctlv_cursor *nest)
>> +{
>> +	const struct ctlv_message_input_index *index = nest->msg->index;
>> +	const struct ctlv_message_input_nest *indexed;
>> +	const struct ctlv_message_input_scope *scope;
>> +	const struct ctlv_attr *attr;
>> +
>> +	if (WARN_ON_ONCE(!nest->msg->request || !index ||
>> +			 nest->index_nest_scope >= index->scopes_count))
>> +		return false;
>> +	scope = &index->scopes[nest->index_nest_scope];
>> +	if (WARN_ON_ONCE(scope->nest >= index->nests_count))
>> +		return false;
>> +	indexed = &index->nests[scope->nest];
>> +	attr = (const void *)((const u8 *)nest->msg->root + indexed->offset);
>> +	if (WARN_ON_ONCE(attr != nest->attr))
>> +		return false;
>> +	return !WARN_ON_ONCE(scope->tree != nest->tree || scope->node != nest->node);
>
>Maybe wrap these invariant assertions in a helper and we can compile
>them out?
>
>  #ifdef CONFIG_CTLV_DEBUG
>  #define CTLV_ASSERT(xxx) WARN_ON_ONCE(xxx)
>  #endif

Well, yeah, that would probably make sense.


>
>It helps manage expectations around WARN_ON. I assume these have all
>been checked to guarentee they cannot be triggered by users space?

Sure.

>
>-- 
>Jason

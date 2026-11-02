Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623756;
	b=Dy4Wnj5Ur44rbBxZsLOpeZVkDrZeXZyKIHk16tl1g/I4fv8PCnOPZ626IlV5cGeO6A30
	 HWDdEsAmARdlSlfRaf8rS9S5PjSgH4GNikbPZ4Zy9UjOR3+6sPU4UYMJBt5suptJEbkU0
	 QbRlcdxSp2MW4d9Ko2tec02H5k32rMcZPDSnvfJVexmBDXMMW6eI0E+/9MpEl65fx/KPy
	 22huSThSoGhBqO/3RjwjUnVCrHznPGkeYdsDxDhGl1kZhjVtWxiscisN0yMEN+Ti4nltt
	 bz5IotHfUkHdVu5UWogr98dgeeeJlk9xvNbPYMbXH4iVuA527qsajT/PSEUL6FRgNmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
	b=SUKPbqwiZr+izqzrP3Y9LYXP1MVcNAo2sFlzvyv9VlKXvQww5zkoYxwEWs8bZTRgKIuv
	 XHgX2045J/JHnu6Bl/IUdNfntGxUmh9pE1r9prXSeryicAF5rOh5Do8yHJR1V9lVCLWc6
	 xOfpHxivXgGouMM1lLCV3yFDARV2d5GOxcKjLKZWu7jKZatKp3Rsw1GvoxpAIzB+Q6GYM
	 cGymjcDXe8wTfSIlSudHzFxIp4gZb2RqJ17Ob7LlKbYrVOODDEbYPqZXkx4lVCJEFMvOF
	 MAP93eUTvqmzMVeco0yaMgdhebBc3/qzvLX0hAGZvdpUkduo6ujcYYhXLGIC4ZxVAsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NpuobCOD;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515060A383B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6515060A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NpuobCOD
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2608822e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793623749; x=1794228549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
        b=NpuobCODsaeMaWK3KSJ7CYeFzFjejBe/CdpSaMImxO/psFfYWNgksAz6IaQBHVoGnw
         yG4TCf9GwWszKn5P0wcTjS5/F7bSf5w6P8cLbEzmHkhdfS4xOg4xf7JMiocrxffE62mH
         DVHo0o1CX5jLPh/fOcr4yzR01YrMQb2/9QMO2M4askf2lmuroalMbTS/uP0jeYTWWaUI
         MeE6SgTJTPiWBhC9AUU5hmVaAXjzy50bPM6LOV17JjqC+4inRl/4yDJxVhRxuDK40T5A
         vGvZhmz6TCJp+zWhB42LV9spfusWTm3gQ9YT7of8ECrFocRAwvhVwM0uOZ6rJaD5eZkE
         XJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623749; x=1794228549;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
        b=ga3G8tqUpXLOreL/WYrNbAdC46P9AUVIZJ9mEfYL6/XyDyukDEMIPeVRWn6eCrxENS
         Ja/fz1twgx8nLytsIWnTxSzqJU8m+T/KaF7F9pqeHYPjQztz4FwKZ/Ip7r9X/PxMQwtD
         Q7jful67FZIjiZc+3/y8LENAnv1kR9GN/XkQmJURUGlxvhwJzaHJLJtscH9uGJ/h7kK3
         u9o5wo4DLjd3++5u6GxniHqryqOj+9HmXpH1uCbryhERI88xVcrWNMCb+2bmrJBBy8Ad
         aXW6fmv1V8gDe7a0G19Hb7f2sM6+JP6JdIcGh/T7kSteNd2GfLg6r1ogaT7+18tgFrhu
         jNVw==
X-Forwarded-Encrypted: i=1; AKwUvBzObunpYzgWxf2Bhqb3j8qrx43ay47lfzOwXNB+VsNOpOdHS+z7FsG+KGz6NKbvSAm5Pit06TKCewpguGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hYf/KrhsNDHGPpzUjzh4JiSzfjfrJMuSuD8aW74qVePnAza42
	UkSYcylJFNdSk2DuaXhG6NA9EX294xkZ++ojGyvRUTBnK1vdvc0UMhMyyEg1l+3TmoU=
X-Gm-Gg: AYBFou239qyYUztEv8cRy1K8dBncZVsKBOchtaJAVW/t2aSvJQPDt1+YJLI526Tu1ok
	jNjBnAX2Xmi85Tf7kLKO+jOZBBKXFyBxemYQsuyNORRVxMxWBnLoSBwCXzMbf5bcz5vro5LCMKI
	LusKu6FeE4O5aMXQWW8+OpQ9xcZJebvjJSarSpiqB0NiaIdqfgXxw9+VHHDikJ4LC//zHQ6Lh8t
	QpXY/CjahvxNzevAS3uWyxEdS2rKMMmRmDRnlp3WInVGYnG7TCgff5TdyXV7bOEL3hkDHrOTaIv
	/w7+eapIRj+mqjQvAV3yO2u858hfN49Gc8Sz24OCOGJ+Q7ZqwiO9j/bmJyvQOUFHyUcUrizJDr7
	QSt6e6sy02cEdYvxjjYJqL+bUl3Pa0mq1qHUWaE0w6Ey2vjIcAVH+qv6yNhQMCzEqRzU2YvbB7D
	MxN7B+23qiCokgqR68ZE9rJrEscNwNjR+foKgHnQ2NH5xtAzY7QJtJtx9BJQEFUrDXxkZfkml/H
	cA2syd9o2kOoAHRnGkYj+KVbm2kD3lNbVKcl4/0k9lp4grZMTMSNd2ZjxFMmbN/RdcJW4Fj0LpT
	ldBCDLODPQabEbKBGzNov34D8AS4ALf79lukEnc=
X-Received: by 2002:a05:6512:158d:b0:5bf:e799:c7f3 with SMTP id 2adb3069b0e04-5bfe799c920mr1589103e87.61.1793623749527;
        Mon, 02 Nov 2026 04:49:09 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04ee003sm1638014e87.7.2026.11.02.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:49:09 -0800 (PST)
Date: Mon, 2 Nov 2026 13:49:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 10/20] ctlv: Prepare event queue support
Message-ID: <auiGL-Xq72i5K8FT@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-11-jiri@resnulli.us>
 <auCbPdoaMq9oWoQ_@e129823.arm.com>
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
In-Reply-To: <auCbPdoaMq9oWoQ_@e129823.arm.com>

Tue, Oct 27, 2026 at 01:38:21PM +0100, yeoreum.yun@arm.com wrote:
>Hi Jiri,
>
>
>[...]
>
>> +int ctlv_event_emit(struct ctlv_op_ctx *ctx)
>> +{
>> +	struct ctlv_device *ctlvdev = ctx->ctlvdev;
>> +	struct ctlv_event_record *rec, *next;
>> +	struct ctlv_file *cfile;
>> +	u32 len, wanted = 0;
>> +	LIST_HEAD(spare);
>> +	int ret;
>> +
>> +	if (WARN_ON_ONCE(ctx->file))
>> +		return -EINVAL;
>> +	ret = ctlv_event_finish(ctx);
>> +	if (ret)
>> +		goto out_free;
>> +
>> +	len = sizeof(struct ctlv_event_hdr) + CTLV_ALIGN(ctx->output.root->len);
>> +	scoped_guard(spinlock, &ctlvdev->events_lock) {
>> +		if (ctlvdev->dead_announced)
>> +			goto out_free;
>> +		list_for_each_entry(cfile, &ctlvdev->files, node)
>> +			if (test_bit(ctx->op->event_index, cfile->subscribed))
>> +				wanted++;
>> +	}
>
>Suppose at the time of here, the number of subscriber is 1.
>However, before calling the ctlv_event_deliver(), another task hold the
>event_lock() to register new subscriber. for example:
>
>
>Task 1 (emit)					Task 2 (new subscriber B)
>
>wanted = 1
>unlock events_lock.
>						Register subscription.
>allocate one record
>ctlv_event_delver()
>
>  grab events_lock.
>    Deliver former subscribe event to old one.
>    new subscriber B will call ctlv_event_queue_event() with NULL.
>
>When this happens, new subscriber B would receive overflow event
>via ctlv_event_queue_dropped() though it was registered right before.
>
>Is this intended? It doesn't make sense that subscribe B receives
>the overflow event in this situation...

Not intended. Will fix.

>
>
>> +	if (wanted) {
>> +		ctlv_event_copies(ctx, len, &spare, wanted);
>> +		ctlv_event_deliver(ctx, &spare);
>> +		list_for_each_entry_safe(rec, next, &spare, node)
>> +			kfree(rec);
>> +	}
>> +
>> +out_free:
>> +	ctlv_event_free(ctx);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_event_emit, "CTLV");
>> +
>
>[...]
>
>Thanks!
>
>-- 
>Sincerely,
>Yeoreum Yun

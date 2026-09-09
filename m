Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E13C8182
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941050; cv=none; b=pX/TlEcWM61L40zAFWRjkqlYT3/0f2yoJXWyW14vDhBE9fXGG/GDxjeEPEmaoYqV0yAo2j6zPkqrtHktW9ShGS0C2KsNF7aJQJOHeNJjMjtVdpEueQoPS2p9p0tGxILryAJXKeEFsCBv+uQjKZAOQiUw27i8yb+Bwpt+N6+EtcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941050; c=relaxed/simple;
	bh=e1+Lb/NG+mk3Ilrk3d4Lqqcpc5Zw8k7/MCjnzOdByLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbBtuWLCaaGvp8/iryrkL+8OzTaNHvVBHk+tY0VrRDMedgV+le2ToEVgh1ZD8DSZGRNvXK2+AjfS/VT3h137W5ORng80jarQxGPep3EqgjzrFJJZGhHEiT2zxzhbS2MOa2M1E1Yj/y2PZhbX0mJvDW5HVrOZnl3A/tS1ntZpnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5TuXw0R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k9R4+inj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5TuXw0R";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k9R4+inj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788941047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGIjuVUQngRfRgvOMv6WaGJ9yxJojhd+x80M9bpkP2Y=;
	b=U5TuXw0RfH/67TVkgNTgPnYA1b5F7MUU1Kgn5bm1tp+FV7CJZ7ulPGavNJEmokUIA2fnce
	s4Dxba6Pt92pft0R8/51GBcqKoyKoQc3WvYU/u3yvlxqk1tF//cUodpMopGbd9U9weNJ9e
	V3fnLZLV0vp0nffa6X3dX9LAsp25D8s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-FYaX-JXJM062dJg60tCAEw-1; Wed, 09 Sep 2026 04:04:05 -0400
X-MC-Unique: FYaX-JXJM062dJg60tCAEw-1
X-Mimecast-MFC-AGG-ID: FYaX-JXJM062dJg60tCAEw_1788941044
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cd55ee2f7so47263285e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788941044; x=1789545844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGIjuVUQngRfRgvOMv6WaGJ9yxJojhd+x80M9bpkP2Y=;
        b=k9R4+injsc/zbqg0EA2TiH1ju0+WWPJJsyndH2z63bbD4wmNJrPQhm6Y7SKH8as9cy
         oyackBYiVfOR+IepwIF4tDGSDhZLLvYyJy0r2yKUxzfHTGv8bmYCfWAwlE1VMOpvQZOO
         USkP+l87T7hRinb+ajFFhywlZ41IQOhCD59lDeUuqJV66j5kDedOlK6o+UU2/yzj98V4
         ly6q4OXi6guTv1RiVmhgpgVrY8+sfP1DMfQ1ixrwA3HEOl5GfwPmFOrz3+qHoBxy5HPf
         HGwWMydYDnoNGQPmo8MA/DRBv96x0UWoQseLf1DG5W5W8d914yFO1spKGbTgaLJCfYkG
         0nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941044; x=1789545844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGIjuVUQngRfRgvOMv6WaGJ9yxJojhd+x80M9bpkP2Y=;
        b=IIKQo5agCfj6A/o1UbWSadXQd7iGZa0+vYeq8dcaC5PWKs4rFTiysvI41y2kVmOdIW
         EWTzJ4N1nMBTf66lkgoT6JsEoHz8MY7toX90pLOnR8Khmis+WIF6hr+t24Ong3h8risb
         BRwy7fz3ycQSJWXSPDYiGJFHPVOAsN7sBOTzONRFjgptI9dXPsSSMrgF6fJuV6Jv7Gh1
         InRGqFeqE7gzkIHYMxWhjM3D9JozX0allPcFrrs3KJWOof5ZhWcEAb5YBjOOTOSpyZHF
         xjG7H93dCCvQmgRuq3RJO2o2lAEg0cwDUEO9UNmWP5I1sOSEHqz3bbaaAajwWkHMhGDq
         gOnA==
X-Forwarded-Encrypted: i=1; AKwUvBzCdPiXIMJLyoB3+yr2T+hVqES8u97tNlI30zPV2+V3/LhzLNtcYr/ylu573vIgSc3XaWKqFbPokHs1bjc=@vger.kernel.org
X-Gm-Message-State: AFuF++mU1Q4tvFocyhUn7TvN65oQrxBsDV7CnA3tAPc0htMLUCXiGZnF
	90oDkJUnOeWO2B9srtz87uSql5EVkeOmySx9V/2+UxJAdQkz3g7xl1mJN9imL4Rtu4Awh/SklY6
	Bae3n/qvAxzsPJjWlwSvKK0Ky23nWEnnrkjzHcY5Y5KKTiYIX67U7WmfEjzW1500Ecg==
X-Gm-Gg: AYBFou333vbcTwZw6A3aio/U1ZuaMw4rbMrsuPYzYiDclouYQqkmpaGYpc/RHVPt/Ix
	ncB6rnkM/QTUkSEslf1eQvxHf/P9Ria7GX5fwRIWkACnaKVB4UxbeKqWg6R/ULXvNgOiylerbMy
	zG/5/8LO0LH9/GN+vBncvsP34ir9fYNS1FRTS7EUytI1wJFNWuYKth5az0z4Nt6elmkC+f9yDpi
	JHCs5rRmcVOsr16wphE0mDYBVmGtQCI7y4GHKJ9244AOwf6RTbpgAM/hLSfamPOnIsy5E/mlqm1
	M+GkSLIYhyfspX9Fx1/8RKUmlYIwzadkXXS0xjTPozFwSgAqZ3sKnFCFSep4Mg4+xrUmDfQGoeH
	EjZdyda/M9gGEXouZ157mi2ER8UxW9LQ3aeXawNHtWZOk10ykZhEL2/myq9wbHk8InAJT2LewlQ
	==
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr360364335e9.6.1788941044409;
        Wed, 09 Sep 2026 01:04:04 -0700 (PDT)
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr360363415e9.6.1788941043923;
        Wed, 09 Sep 2026 01:04:03 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm89320615e9.4.2026.09.09.01.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 01:04:03 -0700 (PDT)
Message-ID: <d447c4e8-9f68-41fe-9598-68a35f48057e@redhat.com>
Date: Wed, 9 Sep 2026 10:04:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dibs: Avoid inconsistent lockstate warning in
 dibs_lo_move_data()
To: Alexandra Winter <wintera@linux.ibm.com>, netdev-bot+sashiko@kernel.org
Cc: alibuda@linux.alibaba.com, dust.li@linux.alibaba.com,
 sidraya@linux.ibm.com, mjambigi@linux.ibm.com, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 tonylu@linux.alibaba.com, guwen@linux.alibaba.com, netdev@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, horms@kernel.org
References: <20260904094446.1342654-1-wintera@linux.ibm.com>
 <178887153533.219967.1817289806507440884@kernel.org>
 <a5ffb5d2-4509-4e73-af0d-aad4b1cc9412@linux.ibm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a5ffb5d2-4509-4e73-af0d-aad4b1cc9412@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/8/26 7:04 PM, Alexandra Winter wrote:
> On 08.09.26 14:45, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider:
>>
>> Critical: 0 · High: 0 · Medium: 1 · Low: 0
>>
>> - [Medium] The patch fixes an observable lockdep "inconsistent lock
>>   state" splat produced by the plain spin_lock(&dibs->lock) in…
>>
>> --
>>
>> Here is the report.
>>
>> dibs: Avoid inconsistent lockstate warning in dibs_lo_move_data()
>>
>> This converts the plain spin_lock()/spin_unlock() around the
>> dibs->subs[]->ops->handle_irq() call in dibs_lo_move_data() to
>> spin_lock_irqsave()/spin_unlock_irqrestore(), because the same lock is
>> also taken from hardirq context in ism_handle_irq().  The commit message
>> notes this is not a real deadlock since dibs_lo devices have no interrupt
>> context.
>>
>>> diff --git a/drivers/dibs/dibs_loopback.c b/drivers/dibs/dibs_loopback.c
>>> index 649e4e375be33..44a2e74c2efcb 100644
>>> --- a/drivers/dibs/dibs_loopback.c
>>> +++ b/drivers/dibs/dibs_loopback.c
>>
>> [ ... ]
>>
>>> @@ -267,12 +268,12 @@ static int dibs_lo_move_data(struct dibs_dev *dibs, u64 dmb_tok,
>>>  	if (!sf)
>>>  		return 0;
>>>  
>>> -	spin_lock(&dibs->lock);
>>> +	spin_lock_irqsave(&dibs->lock, flags);
>>>  	client_id = dibs->dmb_clientid_arr[sba_idx];
>>>  	s_mask = ror16(0x1000, idx);
>>>  	if (likely(client_id != NO_DIBS_CLIENT && dibs->subs[client_id]))
>>>  		dibs->subs[client_id]->ops->handle_irq(dibs, sba_idx, s_mask);
>>> -	spin_unlock(&dibs->lock);
>>> +	spin_unlock_irqrestore(&dibs->lock, flags);
>>
>> [Severity: Medium]
>> Should this carry a Fixes: tag?  The lockdep splat quoted in the commit
>> message is reproducible on shipped kernels, and git blame attributes the
>> converted spin_lock()/spin_unlock() pair in dibs_lo_move_data() to:
>>
>> cc21191b584c6f ("dibs: Move data path to dibs layer")
>>
>> The hardirq-side acquisition of the same lock is in ism_handle_irq()
>> (drivers/s390/net/ism_drv.c):
>>
>> 	spin_lock(&dibs->lock);
>>
>> which matches the {IN-HARDIRQ-W} registration in the report, so the
>> warning can be hit by ordinary SMC traffic through
>> smc_close_active()->smcd_cdc_msg_send()->smcd_tx_ism_write()->dibs_lo_move_data()
>> on a lockdep-enabled kernel.
>>
>> The splat also ends with "INFO: lockdep is turned off", so further lock
>> checking is lost for the rest of that boot on affected kernels.
>>
>> Would adding the following help backporters and stable tooling identify
>> which trees need this change?
>>
>> Fixes: cc21191b584c6f ("dibs: Move data path to dibs layer")
>>
> 
> 
> As mentioned in the commit message the paths reported by lockdep belong to two
> different device types (dibs-lo and ism). So not a real deadlock.
> So unless lockdep-warnings by themselves warrant a Fixes-tag (?), I think net-next is correct here.
> 
> Paolo applied this already to net-next.
> For the records: Sahiko identified the right patch to blame.
The current guidance is no fixes tag for net-next patches address old
'issues'. Since this is a false positive, I deemed it as a 'non issue',
hence I agreed with the net-next target (and thus no fixes tag).

/P


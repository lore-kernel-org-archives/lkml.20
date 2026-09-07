Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB94307AA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776931; cv=none; b=eJo2DwBGOKiBjZtbBS+RaExP0uoqxrfnpyWsI/MZ/jHPar6jbUKQ35RcE+833wK3YV1Oovj11A2a/Mms9TjNtZxcpPzvAuHihP4/PSnWwy2SgDAhdBnfO6v0S55ojkqgnv1iROFnGrk7mWJVFZgPRo+WSVRZDNd8OLkiyDgKoYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776931; c=relaxed/simple;
	bh=4Ada3OHpXiLG5T0AAsYcOgRew4MZYqz94GyBaLtLsxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0QA1/NTnPJBQPpuq3gqAeTQ0/2kvemXs7c4Tk5Sb6HDiwFpnD4nZE+96Tx7e/Cv3xDqcI25hf47ZvJyDDdoch8Kxy+8WdEg6XP3X/mhJyA/5v4822odcT7Z5BfSHjJ0+KA7TRCcElach/G/kn1s0uRGjOfkUdiCn2As+S0KOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DhzAcSlD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DhzAcSlD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482dd6ee390so3856027f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788776928; x=1789381728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZhjTAmwyW+i7ADmwUXpM1rxtxgoKnriyct2cm5k19E=;
        b=DhzAcSlD89HQ2VWd66DWzvfHNSMFsVzvjntO7u1QhhCh1mLqurIJFrBdA5iv+PMlMA
         tlK7oVHeeRGYU44W4u1gf+dH/tJeGvYe9ruP1a+4bcroliSBznuJwNNFiwm0vK2n7Kps
         1zBnN87/Qb3dENUTixohUs/0CUeEFD98ZLB7ttWT1kp8ceprqarsf7z8JzFxDArMFH1l
         0McLH5/jBgP22sP496rmkT0l4e4v3EpnOEUx/JZahz9GdG7KMpgzqmVOAkG6zvYu07O9
         ZK1eG6U/2BqpDtdItJz3BIqSzMWAlezYluhaxPuGd2SuBfloRwMiCgqqEa1Dp1WSSuAV
         HpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776928; x=1789381728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZhjTAmwyW+i7ADmwUXpM1rxtxgoKnriyct2cm5k19E=;
        b=jAcPvkVfmGMMoPoBSS41s6Ep3IGnq5rUMPqx+jTM+Rcgp7kzra/Cz6w7V2e7HNyyg4
         WheRbHsgwZLMa3ny7Sqzp2n14ohXrl8OorcABEViDTJ8RcQFWzepz8VTNdCsVnwX6Wk2
         JIx7GuM3y0y9v/zg9EzblGPoSdlzPkMEmGkcAe7BO0EbEah1GpMLbZsAOtVWYFqMfvwS
         7lOIHj93D4CzioMPpkDmH94TJk5e487zx1T5i+8Z81nhKQ3Zd8ajgVrghjDJgBbLSkuc
         o59LFrOUAiBr1Ryui9DbKEhZRSVtpVgEMaT3dU60va4hSgx26jLcy7iNpimqaa2rJTaM
         MLXw==
X-Forwarded-Encrypted: i=1; AKwUvBz5EvmqeeAc61lkTCj0yorb/YpTHSljPC3Zq+lJVQI6ZJ69D3jXTFhUrCkb4XWRrUtzbPLlgBDn0UcFkps=@vger.kernel.org
X-Gm-Message-State: AFuF++kDWBg4lzOFSW4N0ZbC3l7DRKvbhsyMDEuq7WOJ+2crpOSlaN4x
	YavjBrJlVbAXppEGmoue7gVt33X1Uo8ouRRL/+LpHqmPHqakVgfd2y2zNaxnhs4vLIQ=
X-Gm-Gg: AYBFou0qcJgFSN2qXo1PEUqMOCpPj88Df2UeogvrddzDnNYOba6GMatLZJ/TGwELKnI
	sYp4B7Nnx2eY+e/tGsjSlVZuEA2mDQkx721MZZybMuzl5Ffi66ES0MEMtF7CFzezZQEHgCWn7hO
	IjDLMD5YfOwgby+7GDgJdO/j0b5vDprh3pUpt/l2e6V4+fFUnOsPazGLyZEpv3ORGUWIjegNSDi
	ngSCfo3H+raSj3RNhpInqfYxEhOBb81VNgYwg/w9D0+yPBO3NULLyuLCGkz8Q1H/GSrGT49+IKs
	oIdUsKYOMJFhwQKEm/DZMD+MlFFbBirxTz6LNBZqEkbyZLktCRHME4/Hz+GVt/jBp9A8e3Sux8J
	rQwS5H6qRRVAPgmpWBbdBx34r0g75nmKzDdd7JPj4xpcvJzKqL36/q+qmap5WwnmqU2wFkXUf2n
	K4jXS3Zhu9YC1UJTYX/FHO8LC1xIAHC2Hb+09niLY+fgGz2WiZ70gmro3q7m9CZAmGfqpkA3tVF
	zUooGXpxiKwWHQKOdlUVJCG7qdb4gt5makI1A==
X-Received: by 2002:a05:6000:985:b0:485:8b95:706f with SMTP id ffacd0b85a97d-4858b9570c4mr18007364f8f.13.1788776927892;
        Mon, 07 Sep 2026 03:28:47 -0700 (PDT)
Received: from ?IPV6:2001:a61:1340:dc01:654b:3cf0:59cd:498? ([2001:a61:1340:dc01:654b:3cf0:59cd:498])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm27384160f8f.4.2026.09.07.03.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:28:47 -0700 (PDT)
Message-ID: <bc055887-3029-4740-bec5-7e2fe4205992@suse.com>
Date: Mon, 7 Sep 2026 12:28:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
 <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
 <ap56NTVMq8GlbjmR@hovoldconsulting.com>
 <72615ee3-46eb-4639-a408-ba29c1235d08@suse.com>
 <ap6LcHWDvIWF3oNK@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ap6LcHWDvIWF3oNK@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.09.26 12:01, Johan Hovold wrote:
> On Mon, Sep 07, 2026 at 11:50:41AM +0200, Oliver Neukum wrote:
>> On 07.09.26 10:47, Johan Hovold wrote:
>>> On Mon, Sep 07, 2026 at 10:17:38AM +0200, Oliver Neukum wrote:
>>>> On 07.09.26 08:55, Johan Hovold wrote:

[..]
>>> Looking at the implementation again now, it seems further changes are
>>> needed to fix the implementation, though. The completion handler should
>>> not be updating old_count. That's for each TIOCMIWAIT to do.
>>
>> I am sorry to be obnoxious about that, but I am afraid that would
>> break TIOCGICOUNT
> 
> Why do you think so? TIOCGICOUNT just returns the current counters.

Yes, but user space can call TIOCGICOUNT multiple times in sequence
_without_ calling TIOCMIWAIT in between.
In that case the counters have to increase if a line changes, don't they?
For that to happen you need to handle a status change in the completion
handler.

	Regards
		Oliver



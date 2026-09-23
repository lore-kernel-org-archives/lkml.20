Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A274B47FB0B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162932; cv=none; b=dev9ij85sY30RxB/PkGhEPnxp7m6zvAby6qLC+56ffQNDav5mV2MVuh9IAFePVDdhI+wOlEWEkwwIGEMN2Fvrj/sFCNKSLBVLYs81xOSC0H5av7VjF0Ni2CX6EiTYYIkVfupm+zM+j/EhebjZoU0dvhufozlxcI9TKD/awbBIII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162932; c=relaxed/simple;
	bh=3DtSxucf3CjotBWyk76xFHYpDJwmsiKXOFmPN3as9ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBrbYdNMQysBZQ2XBAKoPaMkalfBLlWLIIrcXxu2ElcJY6qHUmS9pI+nqtPD+sfC/Y27SXB6++q5okqS2lDAug1e49ouVJilMb0oTTfTPjqqj9mtJzn3hlv9Wd7Bxh7MihzmDhE7txIKDwVOOkHHkF3Muc4hXlsTkJvSAHKX4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=if7iz5Tk; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="if7iz5Tk"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so535859eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790162923; x=1790767723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sKNxUfIZoJNayKPK2p5wI6UulfeeiAabrrrR/zgiCQ=;
        b=if7iz5TkzBahnrbYMmN22ereDe5d/Vn3uhc6ljCcgU8GUVVL5o/S7//4wp7+XVQ13k
         s0kjjpv9Xz0TPLqiqxd89wHOoqwZ4weL2BRVTYNZzRwn9YBWrgJq9mnnR38DIJNPFyx/
         sXjlE7Sr4ezq8VfrP7BSDGeaV3ZqfhvllWr1AvMKlipo+r9yi0ynrzUXwBqBq/rnUIi8
         oAGU3gePVNuGv/cW+psj0V1EWRAC2lIHeO3HFXchTvz3smyU3xCG5VXkg/5LHR3XPEI9
         vlDFjoO4x4bhpinCMtWqNPrwR04ZW9jSZeoXkatR21Zo53jqBt19XoW+fF9hBcpxiA4t
         vnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162923; x=1790767723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sKNxUfIZoJNayKPK2p5wI6UulfeeiAabrrrR/zgiCQ=;
        b=BOuwnXaIj5ljm0s0HsNe1nqiYB1+1kwf00AqkyWvLu55GNC+frpPdo0qeIxSs1ddrg
         6zPEkl8aJjFSASo0yF81O8AKzPMjmkVEZoVSgQ/ef91mlxFLU3m6GUYGUlBEroGt1H1P
         gvlxVQib6YY+166e60Hntu/dK4/DPy82lEXNCT+2BP+yOGAGajtnM+gYX1upIaaJ5Sg9
         2NeAoyq1iNcSH4WWnIEG9Uf/9LEkgeQnvLRFlmclSTC8xiRyFlrBWe5F4e0Q96hl++wu
         atUn0xJmGKG9UAVy/oN69scdl9apIUYR6fVqEFVOXujmhA2Jq/yq3nSSJ3WbzwsF90R9
         rN5g==
X-Forwarded-Encrypted: i=1; AKwUvBxBXMsYTwmfhLv6tW6N0fTF/CzyiHYUrk58gBfcFJvg9E+l1WwYQefEyJ+U/U4c3miiD99smLrlyDCf2fY=@vger.kernel.org
X-Gm-Message-State: AFuF++n3w1j+7w2IqL7BL9mstwzPIUqsIg+MzBKSsRxQ+0+keJJqkfSq
	I+nKIqZDKwrUtaEPskokHJN6/tRchTSHlFq+Dsai92TcKthpU40ROnPXccK+GXc5WTw=
X-Gm-Gg: AYBFou0csISxFpH47Uig+Z2XI8E5fNTkqB3oFqjbsuYrQSiwHwB56Qovvfmz205216y
	NTjaZBd/sW4/ZMQhhzkMf+4sBEPxcumOZZL9hJXAYk4l3lxawD8DiDt+yjgyXmu5d9fdT2oSiYS
	M1E+HsCGiOpzvQ3Le5u/ZzCym3g7NsKVxSxn4TN7U5BPd8TW4pa7B0U70yhh/qH+2m2U18YXT2k
	BjpG2scUP2RVl9F4d6HpEO3nit7A693Vkl5BAwqqM/mjpj/vQKtDNm0h4bo/2XMH9y0EAZmMDTq
	t/oH3xkDMPY6BsJB3lI6AtqTnqmCrvaduN7+lcjHR0ZVpHTA7+u+r+dG9Vrm9Ty+6SivjHle5zn
	Qey8Wk+M/Os3TxMnyvgUA8fXb5UEr1Snt2nQKc5wB7yI4DsGjQn9WLfgvSDTodAfu+JWkFE3Ijp
	GUVeAZX8uln8Q8zCLQ+80sOjz8UWa5VqzLepRQXKdwobMtYlapijqLkf78RbBUB8WfPQw1MvcSe
	dJUchOogVgsMN97PRbEzRZK5qQl/G/gGwaaEH1ermVVsvzGZTHjP2gDzg==
X-Received: by 2002:a05:693c:60d2:b0:33b:f588:805e with SMTP id 5a478bee46e88-33e8d7d6b93mr2288879eec.20.1790162922427;
        Wed, 23 Sep 2026 04:28:42 -0700 (PDT)
Received: from [192.168.1.125] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm5910552eec.10.2026.09.23.04.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:28:41 -0700 (PDT)
Message-ID: <c4393178-5b5c-4645-98fb-9855b552c2e8@kernel.dk>
Date: Wed, 23 Sep 2026 05:28:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
To: Gabriel Krisman Bertazi <krisman@suse.de>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87tsnv1ynh.fsf@mailhost.krisman.be>
 <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
 <871pal0wnk.fsf@mailhost.krisman.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <871pal0wnk.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 4:05 PM, Gabriel Krisman Bertazi wrote:
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> On 9/11/26 11:33 AM, Gabriel Krisman Bertazi wrote:
>>> It has the downside of still requiring fixes to every path and we need
>>> to handle every new case that comes by, but it is much cleaner than
>>> plumbing a nonblock flag several layers down the stack across each
>>> subsystem or having subsystem-specific details in io_uring, which is
>>> what we have today.  On the upper side, it is much less complex than
>>> your approach. It also allow us to just back off during memory
>>> allocations that would block, solving the memory allocations anywhere in
>>> the submission path, not only inside ->issue(), which we discussed
>>> recently on discord.
>>
>> I think you'll find it'll be a lot MORE complicated than my approach!
>> Backing out error handling is going to be impossible in some cases,
>> think file systems for example. How would those cases be handled?
> 
> I understand there are many cases where it would be impossible, most, if
> not all of them, involving FS.  But I naively imagine we could back-off
> those early, before we get to the critical session, without even trying
> the nonblock approach, similar to what we do now, and punt to the io-wq,
> which is not going away anyway.  What I'd like to solve is drop the
> logic of other parts of the kernel that we need to keep in the io_uring
> layer, such as which network protocols will block and which won't.

The problem is that you don't always know until you're at the point of
no return. If it was that simple, we would not be talking about these
patches :-)

-- 
Jens Axboe

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757976;
	b=n2J0jHql7Jf0yx/gDfEG/d1JRC6RtHAl/Vpgo22hWnYZFfGv1FxBW5MmpAoeQ/OU5r7Q
	 DUiV9udWvhBl2tpF3fO4uGwfpSFhMufvvfM4CfCxkD18RfbPPm+cvXWo/A32sJ+nFeK9a
	 /MtKTcLY/jqJ7Zssq04WmEtK1yrxcQSVhHT5K+qblhVpL/7UXM4VtFqB3ruc/tZvq8jBr
	 ETv9m0u/aVV7xs9BnEeygUNU2EgnMFibIbUbZ+rSU6cJDIbi4l0YSKpkLjZRYgHE6tCFp
	 te1r4cr7H+cCqk/TTJgLQYqLm52Jw5EzTc1V8HeyYd/LTMhoITMWe1ccEUgXFIfrxpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tnGVfmtDG/ydhJPk7ys/dw5eqE6jQ7yst5vq99GgEUc=;
	b=dH4Gh88bupXvtAisWSUvlRHYkM2JX74XdWk3ei6ehUXAq3/uioCFTHM+9NzzAg8YpsMj
	 /Nz9DKqlDDeWxWbM3a8UanjyTKJY8XulPNl7a9VXQVi6GP3y6xWSbcueTr/HSLJTDPf/q
	 Dw/S7WvwjJSKe6wHKYuhxGPFbiss1R/UUQlmptz2t5L6czLRXhRsfFpInx4pTtX7zbZeX
	 kUSGHPQxS03MU3inCjlX/iHYMlSFbcAf4VbVQ26Aht8XqcjLGHjNLk6d2DsFzJqC9vXxN
	 RMduQzbR5bBqeJg/Cp1CGLnQRTvLY4k9Fzh5JFRP/EkfPVWKjOjcEf6Z+HXQspTsWYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=F2TQAH1U;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025A606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4025A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=F2TQAH1U
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5337fa12431so232991cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792757975; x=1793362775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnGVfmtDG/ydhJPk7ys/dw5eqE6jQ7yst5vq99GgEUc=;
        b=F2TQAH1UGfo5urpj36D52CgpWbpLq/4rhoCaUHWj+fMCW5N9rI4EYeoGgwqVL8C3NG
         uQHlBOky0ylWwx4hh43MaRqRH14Rj6FlUHW9YI+I+6hvM23ZeBNOKTBN9xSGlQt3XXG0
         TLCeM/N6rKLL7a1NFNs9yN4//+xv49JRniXWA4wxGdwJJlCfWvEg673k+K+Nz+gnO2h9
         GpwnSxZRm3P4FYenWeXnSOoNYGJvuSCy4Dcqbw8C1cHA6s3Ep+IUyWk786A30Zs5g9sF
         nQp090TodLyk9KWku9/79U3vb2JonZ7DxXoX1GLzTcGrkI3W+venBllrVKUOXcupK88g
         iG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757975; x=1793362775;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnGVfmtDG/ydhJPk7ys/dw5eqE6jQ7yst5vq99GgEUc=;
        b=HnyjBnFLcfXt7sVq9y3kOjsGRJFRJER1aF9FocIVjggAFy1dLpePNPGFRBg4UijuhZ
         OcyJozTer7u4s6JLBnc85CDKsO8238Ibi1JRx3gn/Ik//KeFfbRRHmnj1BKp4H3ZckyM
         YK8t5J1KEcLYN/o6m2c+r/1YxLNJptP2ptGhwvOaLihQNDqmwIjBRxoa1Da3eP6Yn7Ca
         q+DT90rnPb2eqbVluW748p3nq7rmNiSYQlcdyESzsd96+Q0VN/G3XK0bCyR3Lzhf0cv8
         P/h5bF2nslF7tOEFh88IrEhI8wVRv7WICIX1LjoQFqtWEAYlufjRIpbJteCGnDhyJXCM
         +G2Q==
X-Forwarded-Encrypted: i=1; AKwUvByKjI5q8WXxlzMZnOAt6ewpCfypdg1bALYY4x5vY7e1oEQev5AgY7HTBbQPu70IuLFlpLHYbxaLfaEVDPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz2BC1M6e8WzQmgmte4X73E/hVtJ96JQLjA3nkYjsTLVLWN7W+
	nBYyk9klvJY5qK36Jqjk9yHhoO+TEi9qaoS9YyEq42ArlWRjvC2u+C7jD82zh9ER2w==
X-Gm-Gg: AYBFou1oFSUkp7kiyHZ4wdQE+Do+JM4rld+K0cCz4gN8FOp5YAr4xHaFjvAwDIeHoun
	eEfgDzsyqWi0MxCQtR563p1EKK9ItDbQ0OlZxz3Rez8D4nyOZfmH+UTclMnWQAPshRlITQP3All
	ZlJjXescXeG95nMEmiGHJqLfZUtm9JkLzYmnwO/4lDfz1KE+QIkWk3QE2ugU3eg3stNf+K6mSQU
	zZWnRqDGGzhQUHJ6pWsyz47EFCSno5U6hs7QFlw5Q97P+qenyZC/o9r4BBWTBidbOZvZkiysnNF
	AAwByA4AYFFEaDs99tKkRbAzEqu7SjHyI++TYoIC9wYO0wgA8SMBDbQo9JvMd5Ik+6HqVdj55VF
	WUWwrgCD3YL0zClzdm+DZUS9+6WN76h6wb84nwr8/Ly+Iz26iMe7bd/OExIJ6Vd6qh4nfe0VFxd
	Zop9abC09+/efKvutm6nR4eb3IpUHsAgHV9UOPeVGYrnMvROhWdQd/+gZDjzwE8a1lRdfO8593r
	JJd+CL34SAtMzcy5s08G72dHZTgwezXxnrWR1xMBvLENIu2yaXdSQ==
X-Received: by 2002:a05:622a:4ccf:b0:532:8423:1e78 with SMTP id d75a77b69052e-536c48d0a54mr12945341cf.10.1792757974681;
        Fri, 23 Oct 2026 05:19:34 -0700 (PDT)
Received: from [192.168.1.27] ([130.44.176.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c45228b6asm128676d6.19.2026.10.23.05.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:19:34 -0700 (PDT)
Message-ID: <3d5f70fa-64e6-4df5-bda9-6d3cdd00682b@google.com>
Date: Fri, 23 Oct 2026 08:19:33 -0400
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
Subject: Re: [PATCH] 9p: treat read return values of 0 as EOF
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Christian Schoenebeck <linux_oss@crudebyte.com>,
 v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <akfHGcqke9qixd3Q@codewreck.org>
 <20260702090941.1298188-1-brho@google.com>
 <2237820.1783934942@warthog.procyon.org.uk>
 <f7005841-80a9-4c21-a114-6cfd6ee63a58@google.com>
 <aqbGBMJ6bntYB1t2@codewreck.org>
From: Barret Rhoden <brho@google.com>
Content-Language: en-US
In-Reply-To: <aqbGBMJ6bntYB1t2@codewreck.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/26 11:49 AM, Dominique Martinet wrote:
> Sorry for dropping the ball here, I haven't had any time to do 9p stuff
> at all recently and the wave of LLM generated patches hasn't helped...

no problem.

as far as resolving the underlying netfs stuff goes, i don't know how 
much of the logic about "are we at EOF" should be in netfs or in the 
servers (9p).

would you be OK with merging my original patch so that at least 9p works?

thanks,
barret



> 
> Barret Rhoden wrote on Mon, Jul 27, 2026 at 01:38:16PM -0400:
>> On 7/13/26 5:29 AM, David Howells wrote:
>>> This is kind of a weird situation.  We're caching locally the content of files
>>> aren't really regular files and probably shouldn't be cached.  I'm not sure
>>> what the best way to deal with that is.  I wonder if there's some way to
>>> detect that and mark then non-cacheable.  (Assuming the server can be told not
>>> to even serve them).
>>>
>>> Can we detect that the EOF length doesn't match i_size and set a flag to say
>>> "don't cache" in netfs_inode::flags?
>> Possibly, but could you have false positives from this?  e.g. if a file's
>> size is changed concurrently with a read returning EOF?
>>
>> As far as detecting EOF in the first place, my patch had the 9p client doing
>> it.  Not sure, but Dominique's question might have been whether netfs should
>> have done the detecting instead?
>>
>>  From what I can see, the netfs clients were responsible for setting EOF
>> (except in netfs_clear_unread()).  Some in response to an ENODATA error,
>> others due to the "did we read past the end of the file size."  Not sure
>> whose responsibility it is to detect these cases: netfs or the FSes
>> themselves.
> 
> Right, that was my question; I honestly just don't understand the
> requirement/promises of the netfs layer.
> 
> In this particular case we have two patterns to address:
> - synthetic files with stat size > actual size,
> e.g. /sys/devices/system/cpu/online
> - synthetic files with stat size = 0 (rarer),
> e.g. /sys/devices/virtual/net/br0/brforward
> 
> For two at least two modes:
> - cache=none
> - cache=loose (writeback I guess)
> 
> Right now, none of these work, with various degrees of not working;
> I'm not sure we can do much about some of them (e.g. stat size=0 with
> cache enabled I'm fine getting empty data), but imo
> - cache=none should just try reading as userspace request anyway and
> stop as soon as the server returns 0, that's not a 9p specific behavior
> and I wouldn't have expected having to do any special handling for it.
> (but if you tell me it's to be done in 9p case, then sure, we'll do it
> here)
> - cache=writeback + stat size > read size should also stop when the
> server returns 0 and truncate its view of the size to that; the problem
> in 9p is that we'll reset the size again to the remote size shortly
> afterwards so that will need more thinking (and overlaps with the other
> cache size bugs we have in flight), so let's focus on cache=none for now
> 
> Thanks,


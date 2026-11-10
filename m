Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299375;
	b=1wOeF5YlWotJsGCHjbNfdlWtsAh7bbzPOi405XvwX6dAZqg/BvnZ3iRE8CgR8YZNnP9k
	 VGU2FWvV4quxRpjNbSkCB/cmr0BP43V9Yb7hoF9GTq4qcXOi3pWN9b6ANfvbgqE0eli9S
	 wnZaUBMl05YHzm1XV3gduJN6QHtvVviPSkAkRqc3hb1Ipyj70MAJ+NVWblHQeOkJSAL2U
	 9KYL2uxx0uhsFqfwBqF3KRo453Hj7YbU9gnxWVrGshIy8iL4/7heSNm+nhXUPKvYLZr8A
	 84/VzquQvmGHhqummHbeSQQyVy2cKq9TrrFHHKmRq2W6iBFxycL3gRhv6z5k9Ggu0zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299375;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=szVNT0grwG3mTP35gATUs8Ippqwk85souxdiSFEcKGM=;
	b=BhspIqX0FFZWb4fvH/tn1SG0mWL4cxRY2bnAetpxcd1FhGOPVaSuwSIqQI1qTeM5Ld+C
	 050hocc/MErNDung1RqiA3mfK4/W2PgUXpsZuEnAdGi23DjvA+Xr1xKh/5quRnicrk6ig
	 BRN06QBHh2w7biorojOgCRRNFP3tHBSlld2vh2WSOBIdjzfn8baLwc/pvm+GpGNFlv1mY
	 Jkkdlw403gQ1gnC2eIGlWQ/3ws2yXV9SujoqovsjO3j+/acl/zW1eoa+1sHHIfGdrB8vx
	 4NmddTrn7e544xjPJIdd6x94rY2GEYe58fT7WyJXAL84yhHgBuJ3cXmTOIkavYI15+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WK+p6kww;
	arc=none smtp.remote-ip=91.218.175.231
Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E546E60A2627
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E546E60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WK+p6kww
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K//5Ik7wskKatJRGJ9iF9SEC4Ckl+uH7I1j64ytvQA8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794299373; v=1; x=1794904173;
 b=WK+p6kwwntpzxxncg4KMVBC1zPN3wYaT5mXIVflTth/Clczz8KW6MizKYl5mcJnlqjcT0wxi
 QKoqFgDbU2qAc9eWvFGzzf3epBIfit89Vg6lw8M7/VCJ+3BjFBQyvnMQejqkqSYJdLiimLxGE8z
 eexAlGWg6Pg2OL0733TetIt4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a92e251f632d5e1a;
	Tue, 10 Nov 2026 08:29:32 +0000
X-Mizu-Trace-ID: a92e251f632d5e1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <68fe056b-7351-4033-81ac-3dd346154842@linux.dev>
Date: Tue, 10 Nov 2026 09:02:41 +0100
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
Subject: Re: [PATCH v3 7/7] ASoC: Intel: avs: SoundWire PCM BE operations
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 linux-kernel@vger.kernel.org, yung-chuan.liao@linux.intel.com,
 vkoul@kernel.org, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-8-cezary.rojewski@intel.com>
 <fc911031-2367-4bb9-b0eb-f795965e629e@linux.dev>
 <5fa0ba39-cd95-4644-8b7c-8327a3e75f7e@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <5fa0ba39-cd95-4644-8b7c-8327a3e75f7e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> +
>>> +	pdi = sdw_cdns_assign_pdi(codec->bus, dir);
>>> +	if (!pdi) {
>>> +		ret = -EBUSY;
>>> +		goto err_assign_pdi;
>>> +	}
>>> +
>>> +	/* Fulfill the codec needs by setting the sdw_stream. */
>>> +	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>>> +	snd_soc_dai_set_stream(codec_dai, sdw_stream, substream->stream);
>>
>> That absolutely does not scale to the case where you have multiple
>> cpu_dais and multiple codec_dais.
>>
>> Please take a look at the sof_sdw machine driver (same solution used by
>> AMD), and please use the sdw_utils library to deal with all the stream
>> management.
> 
> 
> I believe you are talking about aggregation.  No intention to support
> that with this code.
> 
> After reading the read I have an impression that the expectation of this
> patchset is: full brown SoundWire support.  I wish I could agree with
> you.  The reality is: standard PCM over codecs with and without SDCA.
> If I get a user and an external release on top of that, I'll come back
> and revisit.  The code present here provides simple implementation of
> the goal, basically mirroring what's done for HDA in pcm.c nicely making
> it easy to follow.
well, I find it interesting that you are suggesting changes that impact
existing to SoundWire *products* for what appears to be an experimental
setup that will have to be changed *again* if and when there's a user.

It's ok to push background changes ahead of time to prepare the future.
I am not sure what to think of your approach.

a) Mirroring HDaudio is not the goal, if that comes with a substandard
way of using the SoundWire subsystem and capabilities does all this
belong in the mainline? My take is that support for two amps is a
standard feature, be they on the same link or not.
b) At the very least you should have disclosed your goals, limitations
of your approach, and be mindful of reviewer time.

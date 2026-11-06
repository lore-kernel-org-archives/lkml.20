Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967568;
	b=DcF0HcCy/knJrjQeM+OBydtEUCElQnmj5c0khKC5JaUD403aAUtHpf51LjEjIqy3v1xt
	 TjKjjI2wZFXgHyeld2e/X/gPEwWpkJBRk1/VFaCxLDx4XhNA5Ene5+ogwXiIVVwIXMW5m
	 K/rvmEZy6aq1spOhc+f4t+tM5WDJTkCYiRqZYdirAWVzgnnHUeOXVVUCHDRWB8RI5zQJw
	 fJxhYadtSqHMlXkqYGv+uQE5da2jhEiIcbwkv5HoUDUkWbRZ5zZBget6AAHMBRDV4aX6k
	 x8HKNFWywe2N4zDiULPHlpxd4mfg7Kb76t8JcWSqd161OFqDGpkxFKPDc8mm7v95RHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967568;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0vUodaVAX93mqin2v1QRnZrq0sGDMtFLDBopNWg3Nj0=;
	b=x08w0xyadTLZG5aek4LNhMwl7DMkNqtW82ci7fu2P2d0/HwnmPuhQcFNIC1a0dnpZ4FN
	 etf0h5wL9DOeWvYXa/i+40BFPfRnhUruBplsHGPDUM1cSHKtaCkgtVH979iU/urF4uar3
	 QKfRMU8bR3oufa1S4OgtHNusDOkQgSKHNoE1PdTTW6ZLGml3bU04V0z9sVp4CU3dHO0a+
	 hS1temHDRr622p0gGaNukshU+mjwnEkU0LlQXPhgH4BtoO0MC+STvewtis9xehHCg8sGw
	 MMDXEPqNZFDpXCEoxXOV1xncaVgqFHIzjZtU4kayFJnhepIyA15wCrnQPrqimIGQX8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V5G0adXI;
	arc=none smtp.remote-ip=91.218.175.35
Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FE1606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66FE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V5G0adXI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UjpdCFHkVQinke0+LhWk+0IZR4eqn7V48c0aBGCBqmM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793967564; v=1; x=1794572364;
 b=V5G0adXIb2lsE3Gshq9LuKJbAg5bI+F8TdF831riiz2dwOtFOnthMGJ1DD8ovycfnsqfJCX/
 6U7vCM1JJanEDINxX/xUDk2m1fAsLhqHwJuJSD33bPrkoHvu60W8QGwOWmmq6Bi2/LCzhz0tcjZ
 Qvt35+skZqDdWbc9VKphXNY0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f0b4435a6e72b80c;
	Fri, 06 Nov 2026 12:19:24 +0000
X-Mizu-Trace-ID: f0b4435a6e72b80c
X-Migadu-Flow: FLOW_OUT
Message-ID: <a6c89fe9-a239-4b97-a912-2b08b9a84e21@linux.dev>
Date: Fri, 6 Nov 2026 13:19:23 +0100
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
Subject: Re: [PATCH 2/2] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
 <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
 <1cae1b17-4c49-4a10-922e-c552e90593c4@linux.dev>
 <au2dxajs3ua9M61q@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <au2dxajs3ua9M61q@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> -	if (entity->type != SDCA_ENTITY_TYPE_IT)
>>> -		return 0;
>>> +	/* FIXME: Currently only a single unshared port is supported */
>>
>> I must admit I have no idea how we'd handle ports that can be connected
>> to multiple terminals. It's allowed in the spec, even between Functions
>> which are then no longer independent, and I was told it was due to
>> hardware restrictions, but still I hope we never have to deal with this...
> 
> lol yeah me too. For now I am mostly just putting these FIXME's
> in at all the places where this is going to become relevant. I
> must confess I haven't reviewed this part of the spec in detail.
> It feels like sharing a couple of ports for a single terminal is
> probably tractable if a little annoying. But yeah, if we got as
> far as sharing a port across functions that seems like a total
> nightmare. We would probably need to do a bit of re-architecting
> and add a port abstraction at the device level, but hopefully
> people are wise enough to not build hardware like that.
I re-read the spec and I think the main usage for the Terminal to ports
mapping is bandwidth management, possibly across multiple lanes. But
that's a 1:N terminal to port mapping, not M:1 or M:N. It's complicated
but not earth-shattering. Also the mapping is supposed to be pre-made in
DisCo tables, not something that requires much intelligence in drivers -
until the tables are wrong but that's a different story.

I didn't see any wording on sharing ports across functions, I am 100%
sure this was talked about in the WG but maybe it didn't make it in the
final 1.0 version. That said it's not described as forbidden either so a
well-intended creative hardware designer will probably make that
"optimization" at some point...

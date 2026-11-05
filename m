Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869286;
	b=gQpqLYy/iSBkZo4BnjjM2ahpAc7siVrOBv1LEmw1aD15ptq1ZHbESNDNLwe33xZQHfK8
	 Y+9Zf90LubgP6PcMwBysl9VBRJMrvqHzpi+16Y6PfHr+RkD2UY3MlDGxqFNb5WXjy0809
	 q68bW94ItZcRTttKhXO36+pS/mVmSBuT+1yLgy1Q7PIE09JaM78WU7yTHZ7nqZKthT9TG
	 ZSvPVA68FJncNYx+1gnivu5Ki4i3SGFZbqSEnP/EqoHl9RNA9zlR6Q686eBVbNhyTCxtB
	 oQF5tMqY3CQ47esu9QGiyDRRNLmck6QZzA1S/VxFoWytX7px/5scDDvg/DrIKRJ+3pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869286;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZhBHR54kEL9iXFFLculYwS1Y3YGdU3q4GAVnVZsSbSo=;
	b=OoE15+zdNAFgdhgeBq5ibTsS28KWqDbM0vOUK3xuErSNmNmF6mcAbY7Jf6npLMp8C600
	 IZMR94ugZUHo4DGqOyrYmHLEUox5U4L2FSarMTxsifN05sYONYrnPv0hLQGwoEfpa37KI
	 ShyOgRpzY+QniU3Kwza4MK65fLzKPg3541RTmWd4gGgKGSqXdM6oOyNnlZBLaMb7a63mE
	 OkBbw7wis95a1DDMoThcGH/mDjvwuCwcjnYkqtb2+aHabvAk5ocLMaPbWqP8Ns8SZwC1x
	 yCc4ybH+rMM8PIojpOtmd7cFnoVl341dlQiFNzUAL4AXbUF7NhyXT62M4XD5A3hBl3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DMMArXbJ;
	arc=none smtp.remote-ip=95.215.58.94
Received: from mta1.migadu.com (out-94.mta1.migadu.com [95.215.58.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186E9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186E9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DMMArXbJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EjAYAwEjxdMoSEuay9tHnlAFEwg1E9QXVI4FTt6mxzo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793869282; v=1; x=1794474082;
 b=DMMArXbJX6uH4jhAwXMtWHBD6gM0kyXSmb19Dcv6OpvN6afNotBJwuRKbWKJefiMT+z1S0r+
 3gjhEiWk8ccfDMSM9czOGfE87dfIDKIY8apltrCP2KZJ/yq+SsvsSWqzEKP4MjOF/hN2lJsO3rW
 FlamKKjroSuhWCTXYbUN7bpk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f9eee819d6736c7b;
	Thu, 05 Nov 2026 09:01:22 +0000
X-Mizu-Trace-ID: f9eee819d6736c7b
X-Migadu-Flow: FLOW_OUT
Message-ID: <a5b6947e-4184-48f0-840a-ff2222be3f80@linux.dev>
Date: Thu, 5 Nov 2026 10:01:20 +0100
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
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Cezary Rojewski <cezary.rojewski@intel.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 perex@perex.cz, amade@asmblr.net, linux-kernel@vger.kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
 <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
 <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev> <aus0GT3ht1oEY2mc@parshuram>
 <746bae53-ed1d-4881-9268-968c25270bda@intel.com>
 <259d0c79-2a36-4a36-8e7c-fa24137a02bd@linux.dev>
 <54b9b19e-7513-49cb-8367-8ef7711ac918@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <54b9b19e-7513-49cb-8367-8ef7711ac918@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> However, I find it easier to move from hardcodes to the basic allocation
>>> approach (seen here, in this very patchset) than the other way around.
>>> The change would consist of updating intel_hw_params() so the PDI
>>> allocation is no longer done there.
>>
>> Change is risky, especially when this touches platforms all the way to
>> CNL across at least 3 generations of Intel hardware since 2018, for no
>> tangible benefit.
> 
> Well, that's why I don't want to mix the 2 patchsets. However, I'm of
> those who is not afraid of editing code that touches older platform - my
> intention wouldn't be to level the code, obviously. From functional
> perspective it should reach status quo. And both teams have their CIs.

CI resources are limited, lab space and maintenance costs result in
older generation moved to 'community support', you'd be lucky if there
is one device per generation...

"If it ain't broke don't fix it" applies here.

There are many other topics to work on with the on-going change from
HDaudio to SoundWire in the PC space, Linux is way way behind Windows as
measured by all the recent bug reports on configurations with new
vendors/new chips - not to mention that there are very few reviewers for
SoundWire...

> Now, I assume most of the discussion touches on patch 2/7, the one with
> sdw_cdns_assign_pdi()/release_pdi(). The main suspect:
> 
> intel_hw_params(dai)
> 	alloc_pdi()
> 	config_pdi()
> 	params_hook()
> 
> is a DAI operation, represents dai->hw_params(). The params hook is
> there to give SOF some location to send IPC from. If intel_hw_params()
> is split, there is no need for hooks. Such hooks are certainly not elegant.

The reason for those hooks is not technical, it's due to the split in
the code between the Soundwire code in drivers/soundwire and the
controller in sound/soc/sof/intel. There's no real other way to send an
IPC from the SoundWire side, it is what it is now.

> I believe the way forward is to convert DAI ops present in intel.c to
> library-type functions. Let platform components call these. Frankly,
> except for our friend, intel_hw_params(), one could say they already are
> - perhaps the whole intel_pcm_dai_ops could be dropped.

No, the intel_pcm_dai_ops was introduced to have intel-bus-common define
a generic behavior for a stream and the ops hide hardware-specific
implementations between CNL and LNL. This has nothing to do with the PDI
really.

There's a second level of indirection to send an IPC with the
dai->hw_params, again the implementation is done differently depending
on generations. Note that in theory on ACE2.x SoundWire could have been
managed without any dependency on the DSP firmware and thus no IPC,
unfortunately decisions made by firmware folks result in the need for
this IPC. It is also what it is now.

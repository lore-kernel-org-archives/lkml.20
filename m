Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5386F39EF0F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391174; cv=none; b=ntRScwMRmC2mcbx2FHCFJcQpqbGxHT8obxElvKuNdVZKNZKYAuFOfDi5zBzUvJqM450i+qP2kkrPBZ37zr3IYyVgyPPqhmyTcAZuYl2fgTk+mkgfXaB6rQB5xEyxUjD27Rhjb7LcMgFMr+JZwCOsy5pFui+pdZRzBG4kGWJtKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391174; c=relaxed/simple;
	bh=573XtaTPRKCqIERDsFZPBPRfHkJBseosXV+VlcDqcS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnW5wE/BAY16jlmrTZt4tYVfiaLf68eCEB6VJNEoX5FsgRaXlLS9UI4U9Ld4WZ1mKwDEKRW2r/gyduta7bbDbobgZ4lxCeZovBjVRJqQXM3QMF+AAot4NHV+hb5GJnv7HlifkmbUmYndftN7YOvq1q/O3mBD9quOhJGzEjhbh4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N6SnVz41; arc=none smtp.client-ip=91.218.175.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N6SnVz41"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=573XtaTPRKCqIERDsFZPBPRfHkJBseosXV+VlcDqcS0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791391170; v=1; x=1791995970;
 b=N6SnVz41mcSCC5BlwaVcX/v9Pqlfg+wkk5boSBemdXjplI+DJAocjjuHwfjCzY65KiHbwEj8
 klG6sVqzYzt9xhuHsfXpY28MTF+n4naNmzojSFCjH6Yd5ldd34IuhVdnKD6MV+uAzOWLqQTVb9S
 +pN3DRO/Hd5eBjrkQfNSrBGA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9ddaedf7a893f71;
	Wed, 07 Oct 2026 16:39:30 +0000
X-Mizu-Trace-ID: a9ddaedf7a893f71
X-Migadu-Flow: FLOW_OUT
Message-ID: <f58d1a49-0cf5-4885-8011-433d7ccc4be1@linux.dev>
Date: Wed, 7 Oct 2026 17:57:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: cs35l56/57/62/63: Use the correct SoundWire DP
 for feedback
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261005155235.1386525-1-rf@opensource.cirrus.com>
 <32e25f8c-9c96-4385-9f5f-a7cf8b11ef57@linux.dev>
 <d510a866-86c8-467a-8831-b373636874bf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <d510a866-86c8-467a-8831-b373636874bf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/26 11:53, Richard Fitzgerald wrote:
> On 05/10/2026 7:33 pm, Pierre-Louis Bossart wrote:
>> On 10/5/26 17:52, Richard Fitzgerald wrote:
>>> The amp feedback path (AEC) was incorrectly using SoundWire DP3.
>>> The firmware outputs SDCA OT25 feedback on DP4. DP3 is reserved for
>>> SDCA companion amp.
>>>
>>> This series adds a DAI for OT25 and switches the sdw machine driver
>>> to use the new DAI for the feedback path.
>>
>> Is there any merit in keeping this DP3 exposed as a capture DAI, if
>> indeed it's intended to be a side connection for a companion chip?
> 
> I kept this patch to a minimum because it is a Fixes: so it must apply
> to older kernels.
> 
> However, you are correct. DP3 isn't used now. Not even on companion amp.
> DP3 is a companion output from the amp (SDCA OT127), but Cirrus
> companion amp goes codec->amp so uses DP1 on the amp.
> 
> When the driver was being written the SDCA spec and firmware behavior
> were not fully defined so pairing of the symmetrical DP1+DP3
> (for play+capture) was carried forward from previous amps. But SDCA
> doesn't provide any sort of UCM capability - widgets on the device have
> defined, fixed functionality that has to be preconfigured by the
> firmware to match what SDCA needs. Ultimately DP4 was more suitable for
> OT25. DP4 also works for loopback testing.
> 
> Removing DP3 would also solve some other problems that the driver and
> firmware are both "owning" the registers. We originally attempted to
> sync this up, then gave up on that complexity and overwrite the register
> settings the firmware made.

thanks for the explanations, I guess we'll see a follow-up patch to
remove DP3 altogether at some point.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432740;
	b=zuhZ+j0hvMjFAuKexYwB7NvAtYbNXjtDtowE7befWNUL03SI7cZQULNj72tE5N/tEOpe
	 uDZq3Zzzy5kgyIXaZcEFYuYKmzBNsbjOKMn09nwoBUyq+ckbo570wob0SOuNtfrYCsDXs
	 ODZ30zxcWEmrdjfJLxYFmYM6iS6+8Setr9TT37RKgqRp1zWWYxF3q8DY4IRu0ct309BEb
	 B+q9NlWtRFXGsIj0BOo9Z4bvYF5rk71rx/sd2TU2JueIMIAdQmid3LybacSTOAyMTcPdO
	 RYRFUehqLNH46euDLBL2bEwbRKI74yq0G9HnNaE1qCRyw6q6ZssBULka6glIeXEOCww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432740;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4rQvWxO8sUv8v60hrbY7xIJCUxNFnYQYritlvtOH6uM=;
	b=FgzqOG6Ma4+rAopJ4G9gCHGLsFCaFuAtMvxtNFt5OJ/pFYv0lDUQl+ch3vE5cYXQYm4J
	 fJAetxtD9/kBcKd9FSJa/NZ+jPqw7q9M9WhiZcTHNVI9SrHoANZR25YxjGwiShKousqwA
	 HtnLbrK+EExmhmPzBVXCvWMKKGIISN90oOp77gz32Yjc3W8Qj+LJEn8aK9FNypIGIg7PV
	 cwBx0IvQRRsl1tRQYSYzAU9/bL+jDF0GwpvJcYmCJW1MQAhutr6pMUiXKoNYO4dIhUsZZ
	 ca2s5vIyLwvGYS3U67ztGSdAYEUHTsJn5MzeglFX4esoAYFKNG4NB8bIyE0w0m/gD9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="rT0M/lDw";
	arc=none smtp.remote-ip=95.215.58.148
Received: from mta1.migadu.com (out-148.mta1.migadu.com [95.215.58.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A01606A329
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A01606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rT0M/lDw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UeKznwyM71fqBXOT8gXoRPkRu7KXVkaDkJLEKFmQuCo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792432737; v=1; x=1793037537;
 b=rT0M/lDwB2tVUe2YytEBNEpAAuy9hebSkJ1CYCjeOT8ZlQM594pKEefgp1FD2gx3NP7qDCB/
 eew9mTQLK6yEn/UB8fpYQq6c4W5HsUETwSm5vt9OBh+i29Qj+wlxSZ5FLwt2cpiOu04SltXkXSr
 p02VXTkdJbubbUxSj5WcL3jo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb6b52bbc5da3733;
	Mon, 19 Oct 2026 17:58:56 +0000
X-Mizu-Trace-ID: eb6b52bbc5da3733
X-Migadu-Flow: FLOW_OUT
Message-ID: <530df0bf-b833-41dc-bae9-28aac1d005b3@linux.dev>
Date: Mon, 19 Oct 2026 10:58:53 -0700
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
Subject: Re: [PATCH 2/3] ASoC: tas2783-sdw: load the firmware synchronously
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Niranjan H Y <niranjan.hy@ti.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-3-matthew.schwartz@linux.dev>
 <f51a62bc-18f9-4a82-aafa-c315941eb4d7@linux.dev>
Content-Language: en-US
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <f51a62bc-18f9-4a82-aafa-c315941eb4d7@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 9:04 AM, Pierre-Louis Bossart wrote:
> On 10/18/26 22:00, Matthew Schwartz wrote:
>> tas_fw_load() requests the firmware asynchronously and gives up waiting
>> for the callback after three seconds. tas_io_init() then returns without
>> the SDCA function initialization writes, while the callback carries on
>> downloading, sets fw_dl_success and so allows playback on an amp that
>> never got them. Nothing cancels the callback when the driver is unbound
>> either, so it can run on freed driver data. The download takes about
>> 1.2 s per amp on the ASUS ROG Xbox Ally X20, so it fits there, but
>> nothing bounds it.
>>
>> Request the firmware with request_firmware_direct() and download it in
>> the caller, as rt1320 does from its io_init, which removes the wait, the
>> timeout and the callback. The download now returns its result, so a
>> missing or bad firmware file fails tas_io_init() before the init writes
>> instead of running them on an amp that refuses playback anyway.
> 
> The changes in this patch look ok, but this commit description doesn't
> really say *why* or *how often* the firmware download fails.
> Is this really a problem on actual devices?
> Is this defensive programming?

This one is defensive, yeah. I haven't seen the timeout fire. On the
X20 the download takes about 1.2 s per amp against the 3 s limit, and
every TAS2783 file in linux-firmware is the same size. But if it does
fire, tas_io_init() returns without the init writes while the callback
can still go on to set fw_dl_success, so playback is allowed, and
nothing cancels the callback on unbind. tas_fw_load() waits for the
callback anyway, so the asynchronous request gains nothing. I'll
clarify that in v2 and drop the Fixes tag, or I can drop the patch from
this series if we'd rather wait to see if this actually causes issues in
practice.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529144;
	b=sfONXz+LVlujY0064KJRqV0vIvG4xDPqIDkEXMind7i1g5YruRYFmfiiOzlkF0FvwCKF
	 dHRMGCiA1aUTDbbWEZZRfnYNc4aU5Wp5SHR2539fzcN7zPPLASTd68Y1bRITvOFkA5Mpe
	 ZPJqQLpYX0PKHjvKjm+WAxcg3oyXjdfWNIGKZwgmFVw3ckCK9arZrxXN56gMnounAupDb
	 RfKclm/i3NzVnGT/XRN8lUofUr/9jmzq9eDU1zLFp1eaeTYu2uUyX2MBoo2Hi7hK2jhcS
	 aogtoT4jeEeAbdf1W7QLMEI0n3iGzDorUaFtlyVpRq/ZQm3yREQWP71rZ0+YEF7Nf8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529144;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Kik4zaKIFts3f84nZBepEdE6EIQWqhn79HqZFVKJTXE=;
	b=RU8hjmFb6LqDADCFPyaZ5gCz9fh+0/fgecJ0gsqpWVGOxYL1aE1SLl0wseNXERe+rpgd
	 syVDSPjbzAwB+HfymybFCi/loRsQcS/q8AitAghskMzUc48wBQ6gK9dazGri32mP/SqB7
	 2oZLsFuwuSDwbE06rY7IRjtP56KObcPCX9XNCf8uHIDRqJ3vL972G/T9jCqn7VpYjdx3q
	 xqtFoeaGRHlwBZQnEir3/CBQJxGTWJiLnLYgpk30an+5XFAFyr7Rxb/EIKoP8fWqb6xUq
	 DNECKE9PDh4RfgMzKOsKCxSm2mGBV0J1mttCKeH70in42q9jEq0CxPw7V7LpDq0dnOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ji7JaALo;
	arc=none smtp.remote-ip=95.215.58.251
Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4699606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4699606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ji7JaALo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qhfwl2TnPstwO9Js9xocx5wPG2amC6bO3vBFVQLWrkQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792529140; v=1; x=1793133940;
 b=Ji7JaALoxtdN5QXspHFgVEXcCkx5L8OUemG0YdI1MRDZAicC6cPEha1lfAtoIhOGbkDGOyi8
 GeNScijN+kZP4PlUzQNyCOr+J/rHELK+L0QUKeCm9gVnJHn9SXejXaIftgfaVJv4YrNuquyzJNR
 b/0BAK+dkEKtjxvB+DPBO/Ws=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cccce6f8764b0617;
	Tue, 20 Oct 2026 20:45:33 +0000
X-Mizu-Trace-ID: cccce6f8764b0617
X-Migadu-Flow: FLOW_OUT
Message-ID: <caf02dc9-cd1a-4acb-b7eb-b65d46b89f9d@linux.dev>
Date: Tue, 20 Oct 2026 22:41:43 +0200
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
Subject: Re: [PATCH 1/3] ASoC: tas2783-sdw: keep the volume settings across
 resets
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Lee Mann <leepaulmann@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrey Golovko <andrey.golovko@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-2-matthew.schwartz@linux.dev>
 <bdc967fd-c056-492d-b970-db5630f21b95@linux.dev>
 <4c1a8b04-d873-4395-badb-2762e6c40f59@linux.dev>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <4c1a8b04-d873-4395-badb-2762e6c40f59@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 19:53, Matthew Schwartz wrote:
> On 10/19/26 8:56 AM, Pierre-Louis Bossart wrote:
>> On 10/18/26 22:00, Matthew Schwartz wrote:
>>> The register cache is dropped when the amp attaches uninitialized and
>>> again after the firmware download, so the Amp Volume and Speaker Volume
>>> registers are not cached while the amp is runtime suspended, and every
>>> read or write of those controls fails with -EBUSY. On a platform that
>>> powers the SoundWire link off when idle, such as the ASUS ROG Xbox Ally
>>> X20, the amp is also reset and initialized again on every wake, so a
>>> volume set while it was awake is lost the next time the link idles.
>>>
>>> Keep both settings in the driver, as the cache has to be dropped
>>> whenever the reset and the firmware download change registers behind
>>> it. Reads return the kept value, a write reaches the device only while
>>> it is runtime active and initialized, and the settings are programmed
>>> again after every init and resume. Until userspace sets a control, the
>>> value the firmware leaves after each init is adopted instead, so its
>>> tuning stays in effect. Waking the amp for a control access would
>>> instead cost a full init of both X20 amps, about 0.2 s each.
>>>
>>> Fixes: b627da430357 ("ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach")
>>
>> Erm, not sure what to think about this fix of a fix.
>>
>> This commit b627da430357 introduced the regcache_drop_region() for all
>> kinds of reasons, and now this new patch introduces a manual management
>> of the volume registers - but why limit this management to volume
>> settings only? Shouldn't other features such as e.g. bass boost or EQ
>> also be restored?
>>
>> It really feels like the problem is that the regmap is not properly
>> restored...at the end of the day, this driver is missing a
>> regcache_sync(), no?
> 
> The driver only has the two volume controls, there's no bass boost or
> EQ control. The rest of the tuning comes from the firmware, which
> tas_io_init() writes again on every init, apart from a retained PRAM.
> 
> A regcache_sync() can't restore these two because the firmware
> download writes registers with sdw_nwrite_no_pm(), behind the cache,
> and that includes AMP_LEVEL. Of the 72 TAS2783 files in linux-firmware,
> 44 set it to something other than the 0x28 in tas2783_reg_default[],
> mostly levels 9 to 16, and two set DVC to 0x04 instead of 0x00.
> Syncing the default values would replace that per-platform tuning with
> full gain. So the driver has to know whether userspace set a value,
> which needs restoring, or left it alone, in which case the firmware's
> value should stay, and regmap doesn't track that per register.
> 
> The volume was also lost before b627da430357, since the sync ran
> before the reset wiped it. The Fixes tag is for the -EBUSY that commit
> added when reading an uncached volume register while the amp is
> runtime suspended.
> 
> Certainly open to suggestions for improvement here if there's a simpler
> way to fix this.
I am afraid I don't fully grasp the intended design, with a regmap
default, a firmware download that modifies volume settings but doesn't
update the regmap value, and last a userspace-defined volume that can
override a platform-specific tuned value. It's a recipe for inconsistent
register settings...

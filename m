Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792961675;
	b=RnQ32OUdgL2sRxPlWiq4Vndhpeg73dVNNUJ1TwWn66rJgv2nXDFfXg7qSVMmiKhYkDnw
	 Ed743BZyvQ/i2Pf8tLfAQ2ebg5X6JyBAyPMfoiNrduBk/Fa2eJ0hF6RUJMXIHnQbwdF9z
	 kirI5FKXX++QDInF2/x2Q+9vqNjAMIjyrpQ5FtIp5FnWBZexfgsv81lGMhpxwDgZTtBIC
	 ccFoGhDlo6dGgvKz9LeCskZNeqf/Q+3ZXGS7NcBZPqhfHY5WDYUwV6jW4r0UTDfCguVy2
	 KC2T+MzjzruElbFSLrk1j64B4Fs+aYCVaoX6ERJaeZ+TKJoCTy85j/pyrnQc/xapS3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792961675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aL/00IWBXdCdXkEF6EEPuYr8zZrJ9vyz7bkpiMRmEdM=;
	b=v6mKiLTY81jrT/ZDk40slQQKmgvZ6YngtIPhVVpLpJaMzEPydQ1pnNF6u7PkW51lffxc
	 gdCDIdAL1fDiq1QYqP3hBuXTtcO8rWxT+BBZH37Gr0Wmd3cS7kY7guoR5B8mSn0WyfLSQ
	 2Ep7iP5LFrD/Ihew+kUtyDWCQGMULj2DK5vLNh6QHdjCNoR7fk2HBjEz0dIy+sB0OqxOO
	 gmDQtH93CCUmA1euCPCOMkYOAuHvhve/Kiuy9QuuVLsbBdMvGd68RlYUBWeDZ7UaLEoVm
	 DzAj1INzLR7Mr/I87WMQ5kzFpx4siS4JbBg73Bwk/PS/IaYPsYMfZKeGvP/uWxtxrCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GU2R7FrF;
	arc=none smtp.remote-ip=95.215.58.238
Received: from mta1.migadu.com (out-238.mta1.migadu.com [95.215.58.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EB8606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EB8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GU2R7FrF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ankf4XxHDxRfhnLCIDBCrrc3RBZoBSY/RGT1YJVkWcI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792961671; v=1; x=1793566471;
 b=GU2R7FrFsdvUWGbn54CwHj7gxRkCgBWEUHdIpNGlMitBKsrAx8f+s5EdCmQpdRv+AAeNZXSW
 mws1N5WvjwFiktH8bCyWMhB9ToQZNFBl46NWckyBLsc7aBAw36j8oU8w7O10M95LwB5rShkQBAY
 4oUY0LBWrXkfxkjWgYvAHpfY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 764fd78aebea3921;
	Sun, 25 Oct 2026 20:54:30 +0000
X-Mizu-Trace-ID: 764fd78aebea3921
X-Migadu-Flow: FLOW_OUT
Message-ID: <c04f287c-f4d9-4633-925c-1010e0b91b17@linux.dev>
Date: Sun, 25 Oct 2026 21:54:29 +0100
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
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org,
 Niranjan H Y <niranjan.hy@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Sen Wang <sen@ti.com>,
 Kevin Lu <kevin-lu@ti.com>
Cc: Lee Mann <leepaulmann@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrey Golovko <andrey.golovko@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-2-matthew.schwartz@linux.dev>
 <bdc967fd-c056-492d-b970-db5630f21b95@linux.dev>
 <4c1a8b04-d873-4395-badb-2762e6c40f59@linux.dev>
 <caf02dc9-cd1a-4acb-b7eb-b65d46b89f9d@linux.dev>
 <eef7a85e-4cde-4941-817a-cca48b230db0@linux.dev>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <eef7a85e-4cde-4941-817a-cca48b230db0@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/26 02:04, Matthew Schwartz wrote:
> On 10/20/26 1:41 PM, Pierre-Louis Bossart wrote:
>> On 10/19/26 19:53, Matthew Schwartz wrote:
>>> On 10/19/26 8:56 AM, Pierre-Louis Bossart wrote:
>>>> On 10/18/26 22:00, Matthew Schwartz wrote:
>>>>> The register cache is dropped when the amp attaches uninitialized and
>>>>> again after the firmware download, so the Amp Volume and Speaker Volume
>>>>> registers are not cached while the amp is runtime suspended, and every
>>>>> read or write of those controls fails with -EBUSY. On a platform that
>>>>> powers the SoundWire link off when idle, such as the ASUS ROG Xbox Ally
>>>>> X20, the amp is also reset and initialized again on every wake, so a
>>>>> volume set while it was awake is lost the next time the link idles.
>>>>>
>>>>> Keep both settings in the driver, as the cache has to be dropped
>>>>> whenever the reset and the firmware download change registers behind
>>>>> it. Reads return the kept value, a write reaches the device only while
>>>>> it is runtime active and initialized, and the settings are programmed
>>>>> again after every init and resume. Until userspace sets a control, the
>>>>> value the firmware leaves after each init is adopted instead, so its
>>>>> tuning stays in effect. Waking the amp for a control access would
>>>>> instead cost a full init of both X20 amps, about 0.2 s each.
>>>>>
>>>>> Fixes: b627da430357 ("ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach")
>>>>
>>>> Erm, not sure what to think about this fix of a fix.
>>>>
>>>> This commit b627da430357 introduced the regcache_drop_region() for all
>>>> kinds of reasons, and now this new patch introduces a manual management
>>>> of the volume registers - but why limit this management to volume
>>>> settings only? Shouldn't other features such as e.g. bass boost or EQ
>>>> also be restored?
>>>>
>>>> It really feels like the problem is that the regmap is not properly
>>>> restored...at the end of the day, this driver is missing a
>>>> regcache_sync(), no?
>>>
>>> The driver only has the two volume controls, there's no bass boost or
>>> EQ control. The rest of the tuning comes from the firmware, which
>>> tas_io_init() writes again on every init, apart from a retained PRAM.
>>>
>>> A regcache_sync() can't restore these two because the firmware
>>> download writes registers with sdw_nwrite_no_pm(), behind the cache,
>>> and that includes AMP_LEVEL. Of the 72 TAS2783 files in linux-firmware,
>>> 44 set it to something other than the 0x28 in tas2783_reg_default[],
>>> mostly levels 9 to 16, and two set DVC to 0x04 instead of 0x00.
>>> Syncing the default values would replace that per-platform tuning with
>>> full gain. So the driver has to know whether userspace set a value,
>>> which needs restoring, or left it alone, in which case the firmware's
>>> value should stay, and regmap doesn't track that per register.
>>>
>>> The volume was also lost before b627da430357, since the sync ran
>>> before the reset wiped it. The Fixes tag is for the -EBUSY that commit
>>> added when reading an uncached volume register while the amp is
>>> runtime suspended.
>>>
>>> Certainly open to suggestions for improvement here if there's a simpler
>>> way to fix this.
>> I am afraid I don't fully grasp the intended design, with a regmap
>> default, a firmware download that modifies volume settings but doesn't
>> update the regmap value, and last a userspace-defined volume that can
>> override a platform-specific tuned value. It's a recipe for inconsistent
>> register settings...
> 
> Yeah, I certainly can't argue with you there... I think we need vendor input
> to get a better understanding of how these are meant to work together.
> 
> This was broken on real hardware, so my patches were pretty focused on trying
> to unbreak that specific device. Speaking candidly, I'm not sure I'm in a
> position to take on all of the tech debt that's been surfacing here.

let's move all the TI folks in the To: list to ask for feedback...

My guess is that this inconsistency comes from the commit a3b0cd6 "ASoC:
tas2783A: use custom firmware", which suggests the use of the same
firmware as Windows - but guess what there's no regmap in Windows, is
there? By allowing firmware to set volume levels by bypassing regmap,
there's now an inconsistent state with what regmap and userspace think
is the valid volume.

Possible fixes:
- make all registers touched by firmware volatile.
- use regmap_write instead of sdw_nwrite_no_pm for configuration
registers managed by regmap.
- add checks to make sure sdw_write_no_pm is only used for e.g. memories
supposed to contain DSP firmware.


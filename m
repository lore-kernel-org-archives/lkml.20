Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C51E3C0601
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792311967; cv=none; b=M3x3+4+DMAUNVF98iBAZ2fHQ4SjfaZm2asc0AqJBuE6GIGhTul6PwjJs4a3oIQyVmYHc+7e0po7f9GAKuZkillhyZpiG/s9H2Nj2ZkHbTXozge2IgfVHIdKzG1iCGzSGiYccfDa90djUCHDEpmFAg6EZRcvbZivZ50v/6Z8X2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792311967; c=relaxed/simple;
	bh=J5PC8gST+ZMQ+PlrJ0ItD5SSPSAhiAZWA1TUm9ZN3l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DC1IZl+uH8gl3c4BiZGLdzA6UvxHZQWPXkOIjq4YDRd4hBJur5xrb8BDppStfUuLI49hfBeQDJj07bJ7Jc1GlA8b1k64BfVx0cDtQXK72fw7zfHt7BabQdRBHI02UT7ByLugfAGL1iWMeKSJ7bItzbn54cr+ahjYUnROiFjjbEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zf14Chhv; arc=none smtp.client-ip=95.215.58.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zf14Chhv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J5PC8gST+ZMQ+PlrJ0ItD5SSPSAhiAZWA1TUm9ZN3l8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792311964; v=1; x=1792916764;
 b=Zf14ChhvB9YE2ZvT/kedHWyOZNKHJjcKsmDD66tuzAs55O+6tgR3gXth1Tnp1kRWXYDl9r9y
 tNVz/KkU5kgsqndckJYa8a2kzpX2SxL7qcsv8QQkKnn0mZe+ciobwDU3jg0LSHyJmjRkQcYY2KF
 Io7O3+u891NnyLP5VvkpBN/0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1d910006412fb8d7;
	Sun, 18 Oct 2026 08:26:03 +0000
X-Mizu-Trace-ID: 1d910006412fb8d7
X-Migadu-Flow: FLOW_OUT
Message-ID: <795ed7a1-0610-4215-a0f5-398dbf558704@linux.dev>
Date: Sun, 18 Oct 2026 10:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
To: "Liao, Bard" <bard.liao@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
 <SJ2PR11MB8424E1911A4CA6F9414A07DAFFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <SJ2PR11MB8424E1FAF2D8D1EAD84C3B92FF942@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <3b718d6e-462e-4d22-b42b-915cd88bd60f@linux.dev>
 <SJ2PR11MB8424C255FBA45B9F4CA02113FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <175ea8c2-2375-4b1c-a2d0-dcc7998c9e76@linux.dev>
 <SJ2PR11MB8424CCF92DD83A5E890E9C39FF9F2@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <SJ2PR11MB8424CCF92DD83A5E890E9C39FF9F2@SJ2PR11MB8424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> Well, you've got two problems here.
>>
>> a) there's a difference between generations. Starting with ACE2.0, the
>> SoundWire bus is started much earlier than in previous generations,
>> where the SoundWire bus was started after firmware download.
>>
>> In other words, the timing to sync and report as attached differs by
>> orders of magnitude. I am worried that this code might break stuff on
>> older platforms.
> 
> The commits will not check the existence of the peripherals for the
> ACE2.0- platforms. So it should be fine.

ok

>> b) there's nothing in the MIPI spec that says how much time a device
>> should take to report as ATTACHED. A well-intended implementation
>> following Recommendation {2121} would e.g. try to find the sync word
>> with a default frame shape of 48x2, which isn't used at all by Intel.
> 
> Can't we rely on reading device 0 to know whether all peripherals are
> enumerated? Is it possible that a peripheral can be attached after some
> time when all other peripherals on the same bus are attached?

yes that's entirely possible. A peripheral may be extra cautious to
avoid synchronizing on a wrong pattern, and take extra time to report as
Device 0.

> Will it trigger another interrupt in that case? My assumption is that
> a bus will only get one attached interrupt when it starts. And we will
> keep reading the device 0 and programing the device number nutil there
> is no device 0.

yes that's the problem. Worst case you would get N interrupts for each
of the N peripherals.

>> If you want to keep the code above, you absolutely need to record the
>> time at which the bus started and wait TBD ms before signaling
>> enumeration_complete(). You would also need to deal with a case where
>> another device shows up with a delay, would you throw another
>> complete_all() then?
>>
> 
> Can we add a peripheral property to indicate a waiting time and wait the
> largest waiting time of the peripherals?

that would be ideal, but it's not easy to get this sort of information.
This could depend on the clock base and frame shape as well which is
system dependent.

It's probably easier to introduce a default at the bus level and a
kernel parameter to bump that value up in case of problems.

You should also flag the case with a dev_err in case of a second
interrupt, that'd be a clear evidence of the delay not being large enough.

Keeping track of the time since the bus reset completed would help as well.

It's all small potatoes but it'd help harden your solution.


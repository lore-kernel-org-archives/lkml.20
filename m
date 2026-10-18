Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A123C4562
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792301848; cv=none; b=Txl27P7QCnc7dmypCoWuUA6++Z/Nk465dCUV27828Ht7SjG3JsjGmAQvbysUPDLzyQkVUwTwweDMu9TpyJpb4i6OLzh6I/r6+lmU/xO7QHxjim0ZtW1eQd6rY+SPXJgm2LwiUvm1vzJHBIBluwUSxozSW/bcYCLXysojqwQRyIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792301848; c=relaxed/simple;
	bh=vWhEuKKL9LsO4mJMGZjyBgO8xQYOXnRjLWkl+4mkqUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6XMbIZ9IFO451+/1e9ppTGX9K0jFiiABKHXWl00qUKvB1sM4Od7eur4/CCkEzf1cnZGYg1Zu9D12u4P+lEdZ804UXTOLGQ+G4/vATqkBBil6+kh43TXCnoNIQ8tQsLXbskZI2yoekwTIxVU8MAUL7M4c9sy/AY7pkmEHchVO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lpSsuyi5; arc=none smtp.client-ip=91.218.175.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lpSsuyi5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vWhEuKKL9LsO4mJMGZjyBgO8xQYOXnRjLWkl+4mkqUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792301842; v=1; x=1792906642;
 b=lpSsuyi5bCs/Ibn0hNW0i3NUYifYIaJh2ui3JLdtY9A8j3Tuykv62W0qPIpQiiwBYbiNSi7W
 OCX2XsxMlxD7Kk69uBQsQWvz66h+1yCLcorhmM+7KdwT+zhgtFBe7zc9hJaiqeORA62wKgnkkVH
 GezEvBlnonUTqn87JB7iavGk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5672e7cdd76799dd;
	Sun, 18 Oct 2026 05:37:22 +0000
X-Mizu-Trace-ID: 5672e7cdd76799dd
X-Migadu-Flow: FLOW_OUT
Message-ID: <9eff39cf-24a1-47f8-ad78-781d467cbfaf@linux.dev>
Date: Sat, 17 Oct 2026 22:37:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tas2783-sdw: restore the volume controls after
 re-initialisation
To: Lee Mann <leepaulmann@gmail.com>, broonie@kernel.org,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
 perex@perex.cz, tiwai@suse.com, andrey.golovko@gmail.com,
 antoine@montane.tech, linux-kernel@vger.kernel.org
References: <20261016102846.22908-1-leepaulmann@gmail.com>
Content-Language: en-US
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <20261016102846.22908-1-leepaulmann@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 3:28 AM, Lee Mann wrote:
> -	return snd_soc_put_volsw(kcontrol, ucontrol);
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
> +	s32 ret = snd_soc_put_volsw(kcontrol, ucontrol);
> +
> +	if (ret >= 0)
> +		tas2783_save_vol(tas_dev, TAS2783_DVC_LVL,
> +				 &tas_dev->user_dvc_lvl, &tas_dev->user_dvc_set);


Hi Lee,

I ran into the same bug bringing up the ASUS ROG Xbox Ally X20 (two
TAS2783 on one AMD link), and there's one more case this doesn't cover.

On for-next idle_bias_on is 0, so the amps runtime suspend whenever
nothing is playing. The cache is dropped on attach and after the
firmware download, so until something writes the volume registers
again they aren't cached, and snd_soc_get_volsw()/put_volsw() fail with
-EBUSY from regmap in cache-only mode while the amp is suspended. Your
restore fixes that once a value has been set during playback, but at
boot nothing has set it yet, so the first mixer accesses fail and every
boot logs "ASoC error (-16)" for both registers. On the X20 the link
is also powered off when idle, so the amps are re-initialized on every
wake, not just after system suspend.

I have a fix I was working on that addresses the same issue but keeps
both values in the driver instead of the register cache, so get/put
work while the amp is suspended and the values are programmed again
after every init and resume. It's part of a small series with two
other tas2783 fixes. I'll post it shortly with you on Cc with a
Reported-by on the relevant patch if that's okay with you.

Thanks,
Matt

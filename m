Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366440;
	b=aVECwmi+fBifdk6jMqr0UfJNQdkNfftSTF7YjtLWp8ndvKCM9N2Ba/mol1JWCKcymed8
	 fciWxqaT/so4ppYygDfmGeMAKTdItg7S4Mx1PUM0CAUHwStJbBGDkIcfZj0LQaoAYLXbE
	 qSxhJ4pZ5mTtxlMnO6PfM2EMpYhMj/t9mrSGuYZGaYd2fEHsP1u52hQgmT9IqMuXl+0qY
	 7ePhAntdk2CE1O8NAJ1AKRm3K8ZPDOIM8h78j0U7qFs+fOIdB5P/vyBfZBgymyuI1hKNB
	 6lR4a5ZlYvOuAmjO4ajau2qFWg8qk8hmmlycLK47+jWUlUJfx30qEAMinswaEHMTOWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5QQB/zl+ns/aEZiAq2k5y3MnGVp0J7ISkxT4POasMWE=;
	b=YAyS03FCmPpZHZaggRhtAhgFaWGKqlKn0dW4MekqHqU46McpFoSCLsFl8MEQ8I7xumFy
	 LsbZIHtx1iL1yrB6dlkjf/oZM0qf003eoncEu7R4R5JGbQbwzlySSbdSofh8T4Zv/2cvC
	 hE+Fak+715rcLXwqRPbN99BHZFTq4UpQuVejk2QaKf+krv5vG+p8/hz0z8pwP7XNw3XmX
	 5wUbTydgRYc7J6YV5eYa8U01qLOQO6HIRIkhAy5ueEUE+vyBC0/k4dD0UcoPR8ImIiBRE
	 wuU8FTZ+JFRU2FAeH8+fOHsHzQ3tqbwMulZQNanLXRQgJWC0G9tcX7UfFr7eymek7NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e56FUdgG;
	arc=none smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0656606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0656606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e56FUdgG
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-4adade2ee63so589312fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366439; x=1794971239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QQB/zl+ns/aEZiAq2k5y3MnGVp0J7ISkxT4POasMWE=;
        b=e56FUdgGsEKYl1Kqx3ObrvBbDAlwQ9Q8aHhTrJnGOs5DLITNBVk36Z3HCbLnRtlb7M
         Dd6N3liklod9yAVSXLbogiHPSve8y9RroeL/QI2pHn+wsaeOLUY8hZkezNbl5NBGrSsW
         ZkSfjcFfi6QbLafbCEgd9qLWyufAVsdbRpJbM0MqAzCvGaMp1rJ7RkaaivL7i8dfJO3J
         q+FFivwf7ffqFtCYbrkBeXcEs4iSR9OSzmELX/2e5DoRDLhqCtcM9/TS3R1CMmj2JhwY
         mGaODyeZKs5Q4XuDrVzfDtTtMNQqs+2I3usFFbJdeB5DZukcSsNABr7sNykk04R2/Nba
         m/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366439; x=1794971239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QQB/zl+ns/aEZiAq2k5y3MnGVp0J7ISkxT4POasMWE=;
        b=SJWBR/OEgAZ2t5OqtzLzy7tv9lfUEaPQrgYe79RL0mVlCd5Sj4+2quRdkuD57eNQUi
         aiolsDo5IHQ0ODmEEZn9TCj/iAAhD9e5mkxoVTGivphJtG1h8S9qXjAkIoUrNZb4NBJd
         62/LfqyzIQVoN8GQLCWO7kzG+3KBxQXQ8zEWpkNFbe54RiSzMCQUIpJHrCMiG10DFvYx
         VlH40WyEnyrbjcJ7wO7HbdNuSQmzD4Y03scuNFm+mh//ixWce1ov9S1G7VGGAuepKdJ0
         rNRRGB7Be31ep44bCXigHnE1/oHa5HV/l9D0othdKzjl0b4vGszb5KXlI7H/8ksiYQqf
         xV6g==
X-Forwarded-Encrypted: i=1; AL+hErF7867TcUj4K23BSXYb5YkRdjOaycTEG8MpETk+6053XbqkROU9WfCDRR3OkELQiSxPY9vsG7eKZakq5aE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Aqxbaf+7XqMATOXRZGOF42BYOQ3MtAkBCHnLKtA7lj4Wt2Ay8
	MenMAWfBCfkYe8xPtIBh6zDvk3/0R6f3cez/aXmV8JoJ7tY16OADR0uD
X-Gm-Gg: AYBFou3rv0NaL2YmEKZF8s/3FsR3X34KfchNEyEFHeuUOn1VCY6lPmR+N969m5myu1z
	XJpIX3eTNRaGvUuYWDTNivWaZA1D/S71/KZPh2l+XNIJGcgHMXm2PldfMLUEAhMduWTQfvLWt38
	YBCIEXGKBJmOIMBV8iEISvSe6vgG1miOOYBHVXYcC5isZooB/rfU6dUrDDRrVefb6ksXr+FrWnC
	5tEZFqzbI9OxCJDqWRfmuazr5jMZA9KF242ovpvdR6pNQ2iP2ZL/tnGnjB/QGBwzkOFNJpDeF7g
	8XoEUQCNWs9w2/FJMJe8MfNi1/QIv4bDOgd5TZTncowTrs6F2AEf6Y6CAK5vFWbTZNO0A7ozefY
	FBmjAM/zn2CoKw7NBTf/0vgh35cwX65RVgy1Y+EmBNMvEEXZGSnj1iURbUF6F7ehsz3YU5DW4vX
	eedKS2FHkH7dpoXPbNDTUiNT167JqmD1D8leZw47BPdmW4xfZKiWTlWebKRBuN0Ux78OKqG/9hm
	Ip1pOKX2qVef4GdnD4cGD+ze02ik76Z8MkQaj/oXk9zuo+Ksyd3uZXHsrCGoE7Zcich7Cp14jM/
	IIcV4FkgOsTt9waNJAbhzmie6VQxbTPyStoAkFuAyepW8cz4uQNPZ4tvc6TAqsS0DQc=
X-Received: by 2002:a05:6871:e406:b0:4ad:9471:aaf9 with SMTP id 586e51a60fabf-4ae46d0a820mr1035744fac.62.1794366438834;
        Tue, 10 Nov 2026 19:07:18 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm2712810fac.16.2026.11.10.19.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 19:07:17 -0800 (PST)
Message-ID: <2eb7d236-5fc8-4a38-9a30-d45e6cb1c1ef@gmail.com>
Date: Tue, 10 Nov 2026 21:07:15 -0600
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
Subject: Re: [PATCH] ASoC: soc-core: start the runtime's component count at
 zero
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20261110-rbrue-asoc-rtd-num-components-v1-1-fa0c9e0cb361@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261110-rbrue-asoc-rtd-num-components-v1-1-fa0c9e0cb361@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 7:18 PM, Ryan Brue wrote:
> Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
> the devm_kmalloc_obj() family"), soc_new_pcm_runtime() allocates the
> runtime with devm_kzalloc_flex(). Since components[] is
> __counted_by(num_components), that also sets num_components to the array's
> capacity, but snd_soc_rtd_add_component() treats num_components as the
> number of components added so far and appends after it.
>
> Every component is therefore written past the end of the allocation, and
> for_each_rtd_components() stops at the first, still NULL, entry, so a
> link's components are never found. On an MT8173 board the RT5514 link's
> init can no longer route to the codec's AMICL widget and the card fails
> to register:
>
>    mt8173-mt6391 sound: ASoC: Failed to add route Int Mic -> AMICL(*)
>    RT5514 Codec: ASoC error (-19): at snd_soc_link_init() on RT5514 Codec
>
> Reset the count after the allocation.

Please disregard this, I didn't see Emanuele's fix for the same bug in 
for-7.4 as d00ba321499c ("ASoC: soc-core: reset rtd->num_components 
after allocation").

Apologies,
Ryan

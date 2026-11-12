Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496865;
	b=AwvKpKyDd3+3iSvADvjlJshRC+YV2jc30JAmPp+cHqPwvIp+TOmPme9GCtooJHrsjs8T
	 UqPnJ2yEiNPLUHW68f+RF+ZwwF8IuQ2zpWi3mIPkiRsS74vfXihniTfbHIFXy5ZuK/QPj
	 JxhI6bMn9+f9pMm2xwQlp7ttx458QTOPHLHM8GH6GpfyZcrbVh0u2X+iVt3cpYdz5Q65N
	 pwiXyjsmY+u1J8Gzz88yz73fxsgsEDz8/T7l3MgFb+/ELVlhcOCG/KZ4zVegdERZq3tXP
	 TExttoY8q/pPryWDmnRfop2mhqXATXq8LQtr/froZXI844Lydt9xh7zm5brnY90LMUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GrQWj8i0KMpWLvGJmSZCRH/S1lTxVViz3a0mVq2HUbU=;
	b=MrVH49tPcOoIo45csl/7/VMdE8Bgs+R6gs5bHPimRQJ/8itfBqUwMWBydf3aVL6w/4ZX
	 vjkm3LejbaWguv3oidBmz2FfSBkaHuEFdeWjmL3khjzdaH5jumCb9q7kbeGaodmyX5c4D
	 vf4AX8DvdxGgtorsNFsdXnBcGKboliM3YA7P4L9qfH/1qlWE2QzB/CkirmAt5EO3I218V
	 uAxbK47buD97G6qg6PjZTGzou4CshZEV49yEd5bXyRKQLWpiMV2QLwl0/8NGKILlAXTV1
	 dvcTf4r8kboaJmhtl2L48p4Qq32uTm09EuuhOlr2XkAyz2irQkwWMH7gdw/42tNiSTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=ggQnnAzW;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE660A3827
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BFE660A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=ggQnnAzW
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b31448caccso36252097b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794496864; x=1795101664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrQWj8i0KMpWLvGJmSZCRH/S1lTxVViz3a0mVq2HUbU=;
        b=ggQnnAzW2tUrxbYZukvFoa7FkGVSd83TsnR33Ct8XFJkRpgtyATThxwMCXzgWaKWZS
         HmRCgD8kzAtgX1W6cJMMs8MR90/vUe65QcJtX+qH/LH76cLleMocQfmYch+ouc7RR3Ir
         dVbMMW03JOMSXfjL4VmbLNN7t6+fKrpaoTnxJwND0GtPqGvj7KU5xWgUyeRH4pP5+1Yu
         X+uGZEeUfEnqHOGeJEro3ajanho9vv3hMijzffpOEMrnkr9ECw7DAlsDKrPSy2y4yg1/
         vWPwjJ8wID0yWPJIclgjKldW8bd/XmmAbnoOoYIFfX3/YWW5dyB2POUQZvs9Zl1zgKBM
         DgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496864; x=1795101664;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrQWj8i0KMpWLvGJmSZCRH/S1lTxVViz3a0mVq2HUbU=;
        b=23Ec+ajPaqiJt3q8BPZyKUvBZ+X94drQ49sCU0vSAvGEq8WQKO95htnqoSU/0wCBsP
         n1kBtCiutyQwWNUH36erbmrliadfQjnXvAV2RDZFzyMY9X697a7wem/Zx73iZH9ZlQwM
         joJ9dkDQyao30M4kbtqvXX2zMA827YijyMcBUhZDH9rAZI+XS06FsC9VAMxRCrEkQSVc
         wllcMlKfZ8tKPUhJbU+mGSy/k29tTb+eE4aQZ1Z2wP1/wFU0B6QSv2EalOcQxzgz2JqE
         t494LpK5LnIEm1wf+P7Yt6UxwK+6CIpd1gLoRxnYeF8bayt+vk41gK5pVbLk96Zw0kYU
         G3/A==
X-Forwarded-Encrypted: i=1; AL+hErFMDwuvaC2pa0ff+J2NONfvIjJIG0N4pvUDs4Izifjk7O2eRZJHqR2nyIJ1c7lOOgrbY3cyTIxqAgJTEmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i1B90mqV8TAOXKypqUOxcTk82B+WQVCi2YGPNgFm0g+4I56KP
	LVM9Sl3iGLKcFBK7ANkoBbL07WoDvAz/bWI/EJi7rtkK4qSSwv5akbrjkP5P8msQP4A=
X-Gm-Gg: AYBFou0dT1AncAiPj8Oli1gXft8KMy6f0YgBr4jUeJiK9BI2z1PDNDs/q6CAqFjme05
	JNHc0g7w9M/oq1151SsjxhEdlBZ2u6kXf5pgOCQX0im/I96JqAGSUO6p7XFhHDlXhC4KOSMg5YP
	a6xwXj/pJwAH8JVJTTPZPBwvoHHn4RpziVf562+ZVMt5uqFLm9e2OcA1WSblm2oll6YS8ZIdW3P
	hTmgLBhkLfwJvEpDNpY4lNs0dDmDRqDiqOc+cnv7wuhuwQgff+t3G6qx3y5XHP0w/TS1tB7ZekJ
	wxNlnvtJmb3LXSrxiHUtst/pa8bvmdJO7L872JOZVVldMMOtZMUqVO9Pnbw3SIdtIJyTCe1lTXI
	RFlCgcp6iJytzzBs1bNQjQ9UJ55SU5nKKQdbhOFlICaMr0P4oyyiNdNcBa2LTKmKWptLlgGqbQN
	Akv03ZsdvKPL3Ia4ZK2LYhWw1RNl1FT54TKcL+5U9+JoHzgkVB40NH32YMI0fx+nfW46zmAmS/g
	7SsGUt8NdF4qVP6l8GEJ9qrq9AF4DlCi5ml3XvSufP7Uj8Z+XVobGaoeBIVP4po6wyFv2KW/Knx
	BE7VuXZY+m0tmKU1wVgt0AekNKMf
X-Received: by 2002:a05:690e:1519:b0:67c:23f2:41e4 with SMTP id 956f58d0204a3-67c67ee5aecmr3870192d50.27.1794496862680;
        Thu, 12 Nov 2026 07:21:02 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a0f312sm7504466d50.19.2026.11.12.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:21:00 -0800 (PST)
Date: Thu, 12 Nov 2026 10:21:00 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] memcg: flush nr_charged_bytes when the obj stock trylock
 fails
Message-ID: <avXZXMp_r5VVXS-W@cmpxchg.org>
References: <20261112013220.4064478-1-shakeel.butt@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112013220.4064478-1-shakeel.butt@linux.dev>

On Wed, Nov 11, 2026 at 05:32:20PM -0800, Shakeel Butt wrote:
> When interrupt code, such as an RCU callback in softirq, runs on top of
> a task that holds the obj stock lock, its trylock fails and the bytes go
> to objcg->nr_charged_bytes. Nothing empties that counter while every CPU
> using the objcg keeps it in its stock, so it can grow without limit.
> 
> Users see memory.current and the "kernel" field of memory.stat keep
> growing while the cgroup's real usage does not. With memory.high or
> memory.max set, the cgroup is reclaimed, throttled or even OOM-killed
> for memory it does not use. The counter is 32-bit, so after 4 GiB it
> wraps, and those 4 GiB stay charged to the cgroup and its ancestors
> until reboot, even after the cgroup is removed.
> 
> Fix it by uncharging the whole pages in nr_charged_bytes whenever the
> trylock fails.
> 
> Fixes: 200577f69f29 ("memcg: objcg stock trylock without irq disabling")
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: stable@vger.kernel.org

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>

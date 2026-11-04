Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793774569;
	b=f6QjdPbAXKMijsXjO++uVW5+tpp2QuvWwyM/5u+8XqGUjdWO86+F04Uy5s97uvquUpuN
	 kEZTzr0hC8kHUcwu7OQOghma8CrXA5oGOlntkmgulN4vrdiKEu0wGsHv4G+2rsRZT87En
	 2DWMa7ISVa7EB+vLTS1gIOx2LUB/2uxVQ+7Ev4IYp2kDweVEGNhSQqMyEZ657g0EEJywS
	 QRdRTILOcy6q07pjo+2Xx0whlVeH/p7dIOByjGMsu3poozDplSYs1OJ/riN4XRulwCjwn
	 DHXBhl+vAzk9K5jAOIkc7Hbf3RgkMspWlimdvvQAZ6R8gZrIVd2MWh/vNXpaeWHH0IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CaIA/Sr2kiTxJs6D9LfjF0iFIQjHh5ZBby7zBRLnjyI=;
	b=OPCj1ccWpERAkoPMt6O3du8gr6yOcVog6Ei3VMRCmqX+yyHiwP7l62AtfslX/NK6CshI
	 Y9dDF71aHDT/SUv+XsmOBnMBqpGHDfas6hoJ4G3VCX/LxsGQEfw7jyWpixxvOvgR+WZmR
	 U6YP64RMcsO/8Gjj3obSKWAITWGAkcY0j7qR0jrLiEDfWaqlCNj0aHtrug52yPdH3RQUE
	 /UZKmLXY9rxR2v+cJVXJog8N1CnZDpSz5yCLtQ/hKLLSlWhmGvne/SsAZcuL+0u9BUrke
	 IhYF322xQNCULMmfkrAWStiBgCSKBF113Y0znEfdQwFyITSceJpqSEPEAs+R/HPKD1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="fC4/WDT5";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F508606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F508606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fC4/WDT5
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso658849eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793774563; x=1794379363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CaIA/Sr2kiTxJs6D9LfjF0iFIQjHh5ZBby7zBRLnjyI=;
        b=fC4/WDT5oFZPWEWs60Q7RhuQZP4DJQe877ZJJI5AU7bF0gQrNjO5hGkH+3W/0KW5gw
         y77bERCqeS/9ocgr+2YbIxL0MU3EpNYL2hfq0FlDomKr7jM5/7L5JmuLAENe+1XuT/EV
         PTt72eKpBaHTGw82zOPYckddDQr6LDMsL/wcOFm7Ti3M/26Lxc9DbAy5JAeE0zPSrV+N
         OzRi6rNNV5Tf7k5usFH+FtGX1SGr76HKuj5Wf+m4Kf9XoNbmcp05AhYsFp26Vy1Tou5e
         PBkIZn42tGID6PUU8fX5iFI7V3+Kt7b+3yL0JJODXQxGXRWVLz+q4ELKzfxDBAVvsNCa
         U71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793774563; x=1794379363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaIA/Sr2kiTxJs6D9LfjF0iFIQjHh5ZBby7zBRLnjyI=;
        b=t30Oac6xh2Z0NnG8mT4YEBxdfTIdz2LDh2E0QBwgf2A0Qk3CSGk5+j8ZFa54mUBA5m
         VrAKyDoygfWq1H61LaMPNTJ2g9ZXOEluzNwS153uh1/9YGas8ArMZeal2UzK6+9D4FLu
         pYLcpMX7Fi72w0ZUPDf838xPPwoEVyCzBhKVt5SsSuDvNzAJdfwedBy0Jw3QuXE3eqnN
         L5sDurJpF0aeYCqgiB9/n3SFDay2CrxthAsMfZrhuCxEod6qJn6oLtKBGFDWSE8l6DVJ
         V0dqvVInBYau4FQNwDmkG9Xa58sP5vCKNzGTMWD19t/zzeZGf/aleeZlh8ZKAkDx6eBA
         wydA==
X-Forwarded-Encrypted: i=1; AKwUvByrbNVVnkh7k0UXE9qj2pMOWNpNzAhWK7tRGP/KlU2AycJWOZHACde1THewmyqx+EiJpb4BNIk3EbLhKXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kgE8Czcw1l72MAkemBXS2PcbNLux0V+OU9SbLM0/4qPK/ymC+
	p2U9kS0Q96hjB2wEZM/shlZ/XVIf2ieElp99GgrtLK2KucR4DSdNLn8GmjsjAcMlY/0=
X-Gm-Gg: AYBFou1BvCqJ6XOZLXEA63QuP2IjbhbsGvlsjhfQNZ7k6xnTSDrni9b9n23VuI5lLjL
	M8DJfKDoPhIx+d6jnGAjtywlnkpig7wJXX7ZVUxB93g3Du9+8l4ppkZYa50FgJULpiFHMQU+oeR
	HZ8vr2ppR3SalX3xqDH2Iabafvr4gf2Pd7LuWUN2raL4CIP+Ouw4FPknG5i/WviQseq2dqJJ84S
	DovhLklD4wsGH1Ok75gMuvj/ARMzc1EPmsWghVrJXJZXNoCLD1BFcTXGe3xePVkqn+SoRwmJegk
	sL2WzqlKbz6yYca6ZK4obSIvzkfSOlCt/c38MBcW9nkhzXlFG9NYyFJO+PuAibFAak7jYKNbLf6
	KoMEfzht57oEyOgG4z7g+FVfwWCnnPvf+IDhzqJv+MkqbyNj/h2R/68qzUq/Jty51LPotztdvRz
	N3Fp8ogGVJjlu71nDNfFVaRmPUDaJKDWoDy5gxqcz5g5SRpH+se4QoN8hMdQ010210tsuKDb4mT
	1iby2+FUeX+8XAiBHuBmSeXfSurmGnpF/fHAXjCLEAWg1+8bHabjtJmo3nBW52dBdi86RInDteL
	pgy4Tiv0OUdBZxWY/6Eqfrm4n7XJar3NYw9t5w==
X-Received: by 2002:a05:7022:1711:b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1ae59d6945fmr17559078c88.40.1793774562347;
        Tue, 03 Nov 2026 22:42:42 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F ([61.251.99.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm5905073c88.18.2026.11.03.22.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:42:41 -0800 (PST)
Date: Wed, 4 Nov 2026 01:42:23 -0500
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, hannes@cmpxchg.org, mkoutny@suse.com,
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com,
	joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com,
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 0/3] mm/mempolicy: add per-cgroup weighted interleave
 controls
Message-ID: <aurTz8SiB-nQ22lJ@gourry-fedora-PF4VCD3F>
References: <20261103122816.48037-1-lizhe.67@bytedance.com>
 <0efbf4db1decd8e6bb6a5fcdcf897314@kernel.org>
 <03bceb67-d362-47a6-b555-ed5aa1f9bd3e@bytedance.com>
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
In-Reply-To: <03bceb67-d362-47a6-b555-ed5aa1f9bd3e@bytedance.com>

On Wed, Nov 04, 2026 at 10:44:46AM +0800, Li Zhe wrote:
> 
> Does that distinction make the cgroup-scoped override acceptable? If not,
> could you suggest a better way to support this kind of administrative
> weight override without adding new mempolicy syscalls?
>

I'm a little confused why cgroup-anything is needed here when you could
just override the weight table / interleave functions.

I don't particularly like the idea of bpf hooks for a single mempolicy
mode as opposed to something more generally useful - and I question
how useful task-mempolicies are in general for tiered memory systems
(they also affect kernel allocation placement, which is not great).

You have many patch proposals recently trying to adjust the mempolicy
components and I think it might be helpful if we could chat a bit
about what big problems you're actually trying to solve.

I get that you want better control over task/task-groups, i think that
can be useful - but I also know that demotion immediately mucks all
this placement logic up (and we can't check vma / task policies at
demotion time) so I question how realisitic the value of these
extensions will be.

~Gregory

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327887;
	b=ygDfA5N3JpXLHJPid5IFd5Yz0s8bZR1aq1fZwevZ1LFVfY8KmKYCGP0QFl+egQgQGwZH
	 mpGH9p9aytb8WYQabWEEer3CieVc7EKFvq0Aw1y7v8FsZ1sPbGbon41gfaKCrWF/Nk6Ae
	 HSBDdtbqv79sJRDEVOIxfRjFK3TRmTrbojqLFFlkATv+wrA9MPcXmdvR4UTfYzRWpYTT1
	 /Avzqc9sQs3XFoOe4dbkLFILEHMZVLNIk3PRgi2HFb44mkmtMZTlFPO95W9QZcZu9DBHz
	 RoICYpZkUSDLbkJMWguFWZj0iASicgFpzo+14isqE9xbzyO9o9jJfPF7kKs+/TuoS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=d5Rnh7B5SwAkMtwkddcYgTa/ycQfIe0CQGHW3qw4hcE=;
	b=jI64YnoE5XYLZAk2Qp/+4USpvDBDIE0Xaw/ANmyOfTJjyoilZMAIZPEmBg5EJ/220xnb
	 jhtzSNxtKc+oVQyjgz26jlGzsHrv0tcQ3BKRbniQUpnCgXpZm7ijnSJTPyccwU2Vyks1A
	 SKs5Vv3mK1yIHXnc8edYnyoqIqhfxlAtOEB7gpFJyXjJeNudS6DS5wp7YIzn3YcjhTa8j
	 UhVcm61hky8RalSujvDRN7xGqw7R7ieYF6QS7CArKjNuVEqFCTqW81ClTgWqDnuibY9Mr
	 BHgcLPCjeqldJ1h+FKI+coeraOMFe7TXpUjE93vTJsFAQs1JcZn6uOIFz35dSffCorw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=b4Pm3kY0;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4AE60A3801
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4AE60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=b4Pm3kY0
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b3402105b9so17471277b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794327886; x=1794932686; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d5Rnh7B5SwAkMtwkddcYgTa/ycQfIe0CQGHW3qw4hcE=;
        b=b4Pm3kY0G1NDGFZlFCkVsqesQAoqt7mCLoK5KDtdU+h2zoswLJyoMglIZedSXEojSz
         cISHQ7KWmFrjuHoIdODLgGdemeem7P65IYpg4tQsApXKXDwcl4YGGDNQXaOO424U4gve
         QLSyKmsGvd5s5x+yQo4RhWOMNucsP/wayG8HqREnjZWbx24NiouDl1mMmpBtvLjLCxnH
         g6Xmi6lBvz6JoHwdaCwJrsln0+urGrD4fGPD+z0M2+nshKofM30LXnF/c8/TYECxnaRi
         4BN0jXZ3yVqaRbhRbCL/Zfym+2B3cV9cGYtAvBh0gYgUVXG69WIGRiX0O8+GUQKm2gQ+
         di4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327886; x=1794932686;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5Rnh7B5SwAkMtwkddcYgTa/ycQfIe0CQGHW3qw4hcE=;
        b=ENMPyLuvEehVMNzrUn3xiHxxIRHQZgZis2rC+5dZt/gIw+iCU1KKKOWWq/kgwwO+FX
         80zy0RAY1q6ZZRRIsmk4kKF2nhfKjyQUQqhBCkVtw4XTI1i5116BozQBlgPtWBv8+igW
         qgVY3Ce3nvjRthzdG3EdWpIweuZFxGo9XTewaPrqxEeJrPI49EIliTZijbihnue1DLU7
         Zu4fSp/OeFqU49yLYUIYytiDO6wAmI1mEvo3vmSwrD1gYTeMrgp7VTreMz0o77ZCpnwP
         UObBoDjlO5ZxFe8UW9p+uk/kn3cZJ1QzPh6TzCDYdkypofvOpRLYH0Em+/ZQV2zwcirS
         Taxw==
X-Forwarded-Encrypted: i=1; AL+hErGuU25d8np9xtwDtZ6oQD+33FBL74csSYtSDU+M/aSKHTB/34G1iYH+ekzjssHqMAGtfblJJ3JXj5Lgcsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z86slm9SNiG2LRo60RP5jdYEoPZTSIyoKFv8fVvSwfweRDG72sT
	LrcSNxBjZtaEK7GH/CmOlYawIbvwiF2XBkiz9ayeXjWY8scohZRREPBAUgYLC09bUU0=
X-Gm-Gg: AYBFou1UKQEj6+Ojes2u4hRVkYJHwZsFRi8Mrh5m0usL6Svkuz7seNCgypyITjmbVqd
	ThsMppyDJaFJKOD5TqN15k8INJvuNqryQXwr8abTRbqGXihHZjX3lCYu/pyAFkznzUDCorfVgvh
	MFiKU4dY8CD9YtqlXfSe2/Y5o7tXKUo+buLXS69h4yDH7RWmDBifcbQ3bUrXV7lYd2doiBqx1bv
	t7FVkOFp0Wdyx9+AlsvuTDCD/WbY5k+gODhvSuq8S1Xppa5OYboE9zcAo/kBPfGYe1jUq/bIzuI
	BivjQslnBNDnolaT/WBG9NVwV/JXcVadPNbbIU/95/edmVZsj6cTzMei8+tpNHw4KWQbBMxGWt7
	zZg8wGfqtOKin1N7ZMaB45bnaM8C3p5PnTQm5r3COtJNPM6iB5NMcL249zal7UNDoQys5740Tu/
	JmiceIv8pkPf4qefiaIFaR8tCMMPVqu0baFyvJSJZJhdZjz3pQ0Y6Cht9/GnEGEJgSueul2Hrad
	50z1F40Do2jJT3kokrLRzhpILdo9522Y+DtqslUHBX52NiEwfT9KbzDRN6C16d6/p2vacxY0jWG
	ffpssgTmMWeM/lKgw7MyolP3bXrTqxeci/dsRhRQC+V2me0RgegL1mXUc+3OIBr6UNjLPwwtI0b
	C7ZoxEvc=
X-Received: by 2002:a05:690c:4:b0:8b3:4911:2dbd with SMTP id 00721157ae682-8b392bd0b26mr15687467b3.54.1794327886162;
        Tue, 10 Nov 2026 08:24:46 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d9b17sm24654076d6.20.2026.11.10.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:24:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 7/7] mm: use VMA flag helpers in NUMA balancing
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
 mgorman@techsingularity.net, mingo@kernel.org, vschneid@redhat.com, 
 kprateek.nayak@amd.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, 
 kas@kernel.org, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
 ying.huang@linux.alibaba.com, matthew.brost@intel.com, byungchul@sk.com, 
 apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, hannes@cmpxchg.org, 
 osalvador@suse.de, raghavendra.kt@amd.com
In-Reply-To: <avM0EbXsE7WyIPJE@gremlin>
References: <20261110150446.2452975-1-gourry@gourry.net>
 <20261110150446.2452975-8-gourry@gourry.net> <avM0EbXsE7WyIPJE@gremlin>
Date: Tue, 10 Nov 2026 11:24:44 -0500
Message-Id: <179432788447.2062277.15377194638664380330.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-10 15:15 +0000, Lorenzo Stoakes (ARM) wrote:
> On Tue, Nov 10, 2026 at 10:04:46AM -0500, Gregory Price (Meta) wrote:
> > Use vma_test() instead of accessing vm_flags directly in the NUMA
> > balancing code touched by the preceding fixes. Keep the existing flag
> > predicates unchanged.
> >
> > No functional change intended.
> >
> > Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
> 
> What a legend! :P
> 
> > Link: https://lore.kernel.org/r/aq1FDhy00epXXtgd@gremlin
> > Assisted-by: LLM
> 
> This tag is no longer required, in fact I think checkpatch should moan about it
> now.
>

I cargo-culted it from prior revisions, feel free to drop it.

Cheers :]

-- 
~Gregory


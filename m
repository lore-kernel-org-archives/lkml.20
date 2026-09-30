Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D164C2265
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803189; cv=none; b=t3WtcFYOhS0PiYslhaZJaebqcoAY5B2ugCjn9p71jNDxzlkFa2p1vO86OgNYRdkfN43ibn3/7ByIuPkHmfLZyZOAt43DRkJWCqlFscRlotN7RjSGpnT5zzkwScosKyERQoIGeBrHC1W7XIwSUO0SZ2v894QtqOWPG+WqhHfNw6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803189; c=relaxed/simple;
	bh=BBhO0G7OoXNQM+zVscTVjnR1G6JPiQRL3Q3Anj3rXW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpKFHM7SuuTeMCDGxQSyhtPJjsi/39OcRXDCxI4CNhOATL5c6rLJRd8K3rQyDXfNsV97oXl4D0GaNRBDbtgHGmDH1t7fD83vLYdwsIYhrzp+4qUfyr1B/yrmfsMzPMwxD5nUsBm7X9XnI2M8qpxitUjK76/r6w//+E8cc4tcPM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJz1CNaN; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJz1CNaN"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso6147041eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803187; x=1791407987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MAbEBhhA+02vAwebLwEVLzW2I8Vxs7DEzXGvm+ATwY=;
        b=sJz1CNaNibzFaSSCV2MjrbPe3PzKfDZ5Yqv+MKKNZqFcJLRcNIcvwkOiOexdA6WFFV
         VIq03vWxo+R/ulpacGVbJDhQsbvNu3sezIz8tTLL2R2dP4woJTgK9TTd1LbGC3s0HwcP
         9J4AoaU23NFLEe3bnnl0Zbwk1tc/33q55s5RCwBmeCaH4005n2a7w90M3k8U0L8BEMvs
         Po8Dc7RaG1Y3kI7KHqx25G8vQc7nIy/ATZOS+drtW+7b8s+p0U3z52SsBFrH9KR04BlD
         dap0uPoXJPmwmo6ykpEM+Ak4nUQbdRyX7zkLFLCgkHmvyVlaYzaOTLtdRPp6G7xEcrll
         FiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803187; x=1791407987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MAbEBhhA+02vAwebLwEVLzW2I8Vxs7DEzXGvm+ATwY=;
        b=zs+ltY3hJXFtxcc8SEWIcCXzib0BwAKZLh04IKuJGwOPA9oeVhNbUkmmbZkmIM63nU
         2DkO1UdA6e9+gFBA5UuqBFgBmuosbSLIEMMN7K9MWljLDRD7t8LZ+BQD2OeipvZMcTp2
         bcM6zr1GLsEcDI7dDJWP2hsbGbQEwCtWBTCuQ463LYe9bAIPziTNjGvf87u26hZx34lE
         qzPdY1CNboU3vyY0556nXH0FIuWWF60E86ZYybZl3c015VisRgns9CLVMPh18mBfZuej
         OsrNoHADRe9gHQ40mHeov+XJUWitY5uvqTMQEvez5PXjaeWOmbbtMhU/1cAMs1ts+iBQ
         xUMQ==
X-Forwarded-Encrypted: i=1; AKwUvByMUkF33woB1AkLzQNhOa7yw+5OOH/BfMC32HkbCdWuhTZREZnzOtcnRyg09TkqL344+OLrgkuH9UloAkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLikq0ik85Ms3i68csEwzmZtOgIVLieCjuAueFw7JUKIVy7wBSx
	TwQV1iepnuZLTYfDXo+Ruysepavux7z764xCH8T/nZKIAG+4iC/gFagj
X-Gm-Gg: AYBFou3cMNvqQo9b2UN5rBNlv7ApaxbTq0ih4Cd3QtJfEXcfVWW6JxNXwnFDrSzpUoj
	fyLWIZYJ+dav5ylPmvjNHxr4+pBFX0lT8AD/vH7Z+Nq/U4W6ZA4a0ZOTlPIxxftir7VH6iZdfGr
	Bp61PLfSl1YnPJhKRGCxJPKxO652HE6FM9jugFizpUpzprgqnCcgPySuOtndDwgleojh7pFZy55
	mPQ9E/RIcYX+2P5qcnM8llr+R8udu2Of4bCRROsf5bchmJofdxD7hjRNgsalYyeyxbgUwpAk49J
	kKqTofuwpP09bxI627Or0c8mWMu1galKV8m3rHhCN2p18/9xBqg3gkDWGKeoA4/896N7ZVx7cZ4
	eU59eeLhFlHu9KwCm6tmv7g8okKTPxvNROVTqmPtGBsfYuKK8/+6XUjcUP21iFI2Sk0o6wkGjUU
	OWkCjEM5BeQleHva7hLGqEBYQo80cZd8KLT8cqftje5rOCX+8aRafy3PjRshQahDChvEgbp5ccL
	uDYv8WAi82l7YC7FMlV7G5mpp5EE9MqiKDdeg==
X-Received: by 2002:a05:7300:2143:b0:340:e422:fd3d with SMTP id 5a478bee46e88-34cdbad6906mr4380425eec.17.1790803186822;
        Wed, 30 Sep 2026 14:19:46 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c44:2e39:63b8:ea3c:fa28:7091? ([2401:4900:1c44:2e39:63b8:ea3c:fa28:7091])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db31623b6sm1443764eec.7.2026.09.30.14.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 14:19:46 -0700 (PDT)
Message-ID: <512dd1d8-67cc-44b7-9442-0fbbab111680@gmail.com>
Date: Thu, 1 Oct 2026 02:48:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] openrisc: Add support for KProbes
To: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org
Cc: tytso@mit.edu, wangruikang@iscas.ac.cn, namcao@linutronix.de,
 pjw@kernel.org, kees@kernel.org, linux-openrisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20260407185650.79816-2-sahilcdq0@gmail.com>
 <20260930203129.51048-1-sahilcdq0@gmail.com>
Content-Language: en-US
From: Sahil <sahilcdq0@gmail.com>
In-Reply-To: <20260930203129.51048-1-sahilcdq0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 2:01 AM, Sahil Siddiq wrote:
> Hi,
> 
> Apologies for the delay. This is v2 of the patch series to add KProbe
> support for OpenRISC.
> 
> The series also adds support for Kretprobes (which depends on the rethook
> framework [1]). Kretprobes are fired on function return.
> 
> [...]
> 
> I have also made changes based on the review comments I received for
> v1 [5] including several of Sachiko's comments [6]. I chose not to make
> changes in a few places. I'll send emails as a reply to this thread
> explaining my reasoning inline.
>
> [...]
> 
> Sahil Siddiq (4):
>    openrisc: Add utilities and clean up simulation of instructions
>    openrisc: Add KProbes
>    openrisc: Add unit tests for KProbes on branch instructions
>    openrisc: Add Kretprobes
> 
> [...]> 


Sorry, I forgot to post a summary of the differences between v2 and v1:

Commit #1:
- arch/openrisc/include/asm/cpuinfo.h: Introduce "delay_slot" static key
- arch/openrisc/include/asm/insn-def.h:
   - Use macros instead of union
   - Use better names for macros
   - Use genmask() for masks
- arch/openrisc/kernel/insn.c:
   - Use macros instead of magic values
   - (simulate_pc): Update PC
   - (simulate_branch): Handle rb=r9 in l.jalr simulation
- arch/openrisc/kernel/setup.c: Use "delay slot" static key
- arch/openrisc/kernel/traps.c: Use macros instead of magic values

Commit #2:
- arch/openrisc/include/asm/kprobes.h:
   - (struct prev_kprobe): Add restore_pc
   - (struct kprobe_ctlblk): Move restore_pc from global "struct arch_specific_insn"
- arch/openrisc/kernel/kprobes.c:
   - Use macros instead of magic values
   - Use "get_kernel_nofault" instead of directly dereferencing address
   - (insns_need_simulation): Use "daley slot" static key
   - (arch_prepare_kprobe): Prevent KProbe insertion if instruction in delay slot also requires simulation
   - (save_previous_kprobe): Use "restore_pc"
   - (restore_previous_kprobe): Likewise
   - (post_kprobe_handler): Don't re-enable preemption if KProbe is nested
   - (setup_singlestep): Use "restore_pc"
   - (reenter_kprobe): Return false in case of unrecoverable KProbe
   - (kprobe_singlestep_handler): Enable interrupt in pt_regs->sr
   - (kprobe_fault_handler): Likewise

Commit #3/#4: Introduced in v2 of the series

Thanks,
Sahil

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243350;
	b=fhfuEjI6uj2vvb3Inob8lXr1CX/TnA1epINGS9CFDaGDWvNf4qQELYCC1ehZIFr8LvLQ
	 HhkhKoRf/UbErPHX2TSDnU4kIhYXVftK2vmj8ucXotahkogfPYlum96q/Q136edxiNpPz
	 GpfAmQvgP/7OblhkVNGVXjrst1QxbSrKw9KKcjZHNMMDQvKvocNMq9CrTun/TVSxRf15W
	 yhQjo0gWT3ZCZ8BKnut+rDAN/Xgmb1meFdArK196zZEHDqyC/fwQeWg6OD/hGnBYURSWJ
	 VNrBdm3MEXq98DUsGXFheDmPVXoWPQC7UzqBRYp0ke69XpXRZr5yTKOB1B5x1/qHv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gss31mgV+cGN+69enUxP1T341vOXKyOAhd/zEcsb0zM=;
	b=2XR9nNXlbOrwFCked6/y5s7eNaVWquIVogYHHXrhXGVsQ9JQ1/+xmhmLquYjamb0QGkp
	 taS0d/7UkZWvvlbnD44jXau7jO1nUO3izxzSe7IWy2nXawPLWB4Ek4xY8yGCwTNLPNHUy
	 M6E18jk8QanT0lCv2Byc8UmO1AoLY/zEiz4tMCThGbySKYi47cY5T/SCqrqMJy1v775WP
	 u3isMbsDSah07S9jGDB2WvR+1kpkYnDXsuitnXSgyVOroN4I/dtNhnb5CB/j6uYidTGDb
	 e6//L9e6C5sLnBIyuVoKWFUVqLNHIWO8U+GSj250sTWNDeHewdmaAXLXeFVJCxndYsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LF0pTH5M;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8360A380D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D8360A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LF0pTH5M
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c1d337d8so801992f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243348; x=1794848148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gss31mgV+cGN+69enUxP1T341vOXKyOAhd/zEcsb0zM=;
        b=LF0pTH5MtHZUssmM0hY1idxAEadmZvkP5i2ILCxjV97WX6MxX4ki5xYAl0nsgsPVCx
         M8Wcf8BtwCU97sCdlyEeODvo7ygDsOwCRGIrqShNpWvNHOEeNO/3LxueVUtrPLm5ilB2
         HumBMaBP/Mr16VgvxbHcV0uI20fbYT4EsUJutOuylk7fydQkI7ki1j8oz991dAHhLfqt
         Iz6VJwljDj8TlKdsCwx519yQdqH1MLUq+LIUeYXxzGvupiLllp4OljBTaQ+BNqrC3QUn
         UZV5tdPGvK3KYDaaxdcXWgBaBmqBFOr5kRRG4HaHsDJaTLuAHFMYdWPN/oNDPXzWk7xC
         1MuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243348; x=1794848148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gss31mgV+cGN+69enUxP1T341vOXKyOAhd/zEcsb0zM=;
        b=JN9SkytKKAZppYpJ9KV1i2hRldbreRXt2hoHhKlkQ3dBr1zUgnhqLAYFQOQD+/4O/8
         EN6nMY+1frXFAHfSs+EU4B+NY/XcEceKag88Ub8gVoywnpESOZ5yUzv9L29MN9Ow9h2T
         ABXvL/0jcbC+o5iFAGhHzE1nppuLvU7hE2W/bj7YI7dKPriPVoB+k1aLy9YWg9kHVfCw
         1UXgaCyyb/wCtxTykrpU3niLzzlfQUDCoKe7cJE6YVMfQZo8pVjlbSoz+j3RdPNCwtMH
         PimiR4T9TS8ESWWcQW5ku5UtDqPC70rIJwLMMhwVGZjuAq8WjLhxonZ+es4a8/1/obK0
         2LJw==
X-Forwarded-Encrypted: i=1; AL+hErGVAsO2/voeKAd6UyGPeHdbIl8n7cZl1kjkR+NP19wJlejT2+i+bUd33Qw8iU3uE2OUr57g5e3wvSUjNco=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OTBydp0nMvxKzCfJA0z/rxDZptM4FpKy7YcWH1UE2dPT4wqFP
	kXwgEnAp5mr0sbmkgF5lvesbJFqSg1Qx+yF3qs695S28SCoFOWI9SIvd
X-Gm-Gg: AYBFou16978Vp0xAs73eQDjZj7lQnLviOWKL15Zp26UMnixvbPMxydMHaG5NjWyIvQD
	WQZtQfPyK/+FW5htCR2dhZ7ly+W6e3EPk5epdX3x08haxaRLtNBpg/thq+3/PXQXdV5z+P3Qq/t
	4vxKGjdcW3ff2L6i25TVnpqzZ33iO6IR1im5vEv7zpjCgJnu5+WYCc9ETwKf1lnm61PCUC7S4fj
	NQP4zB71fBArudiFbKC5OV1KxHCUqxxF5CSOIxk9MeCHjgd4oIRWxtKr7n1GgQImOB2czqknl2z
	mh8awVScMBaa5hDB+FvC0y7W6ffj4URsxNZOZdXFbIGX676IKeiC7fyG38i30iPfL/ftja2vyMw
	dagMM9nwjQz8GiidwSKdWwQOjjVKNq6N1Vt2srwuoCOfjkC9DD1D0ScClD3yQQMKv9ocU9verUm
	rP5u2pJpk9Ez5wf0uXWkYp0N5muc/f45YSc9eMfEY8viz+lyts0PDnRUE244/rT9tNTW0ZmcOwj
	GaUDbww2Q1fxJ3dBbdnRNzPVLnUGSP1DesCTSgaKaVHS+wtSR6bf5oxANgvrRbXSFJXeir/jKfF
	iHqPQ52bdlu+XPauKClgEG2Vdq6nndkZEAKI+zN3ADc+84WIcuGOs5qJi1ZxpvdKokRm0cw50jo
	pFnU3yj4/UxYtwVwkrA2upV5enuSvA2CD5K19itrUhAUSauKB6RrrSBGp6IE=
X-Received: by 2002:a05:6000:40d9:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-4982b28aa00mr194854f8f.7.1794243348063;
        Mon, 09 Nov 2026 08:55:48 -0800 (PST)
Received: from fre3dom.speedport.ip (p200300e37f3ab7a362bccef433158012.dip0.t-ipconnect.de. [2003:e3:7f3a:b7a3:62bc:cef4:3315:8012])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4974b7645cesm4574346f8f.32.2026.11.09.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:47 -0800 (PST)
From: Javid Rzayev <rz.cavid@gmail.com>
To: ricardo.neri-calderon@linux.intel.com
Cc: darwi@linutronix.de,
	kprateek.nayak@amd.com,
	len.brown@intel.com,
	linux-kernel@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH RFC] x86/cacheinfo: Remove get_cache_id() due to ID collisions
Date: Mon,  9 Nov 2026 17:55:37 +0100
Message-ID: <20261109165537.6656-1-rz.cavid@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260319-rneri-x86-cacheinfoid-bug-v1-1-5875849dd0e5@linux.intel.com>
References: <20260319-rneri-x86-cacheinfoid-bug-v1-1-5875849dd0e5@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Mar 19, 2026 at 05:38:00AM -0700, Ricardo Neri wrote:
> calc_cache_topo_id() and get_cache_id() both compute cache IDs used to
> determine which CPUs share a cache. Intel processors use
> calc_cache_topo_id(), while Hygon and recent AMD processors use
> get_cache_id(). Intel processors use get_cache_id() as well, but only to
> populate /sys/devices/system/cpu/cpuN/cache/index*/id.

Hi Ricardo,

On Intel hybrid parts the bad IDs do not stay confined to
cache/index*/id: after CPU hotplug they leak into shared_cpu_list.

I hit the collision on Arrow Lake-S (Core Ultra 7 265, 8P+12E, no
SMT). Even without SMT, CPUID leaf 4 on the P-cores reports 2 threads
sharing L1, so get_cache_id() shifts P-core APIC IDs by 1 and E-core
APIC IDs by 0:

  CPU  type  APICID  L1 id (unpatched)
   4   P     0x30    0x18
   8   E     0x18    0x18   <- collides with CPU4
   5   P     0x38    0x1c
  10   E     0x1c    0x1c   <- collides with CPU5

When a CPU goes offline, cache_shared_cpu_map_remove() clears
cpu_map_populated. When it comes back online, the LLC is still valid,
so x86 populate_cache_leaves() is skipped and the generic
cache_shared_cpu_map_setup() rebuilds the maps by comparing ci->id.

On v7.4-rc2 (unpatched), right after boot L1 shared_cpu_list is
correct (cpu4: "4", cpu8: "8") and only the IDs collide. After
offlining and onlining cpu8 it becomes "4,8" for both CPUs, i.e. a
P-core and an E-core appear to share L1. On a distro 6.12 kernel,
after several suspend/resume cycles both pairs (4,8 and 5,10) were
wrong.

With this patch applied on v7.4-rc2, L1 IDs equal the APIC IDs and
are unique. Offlining/onlining cpu8 and cpu10 leaves all
shared_cpu_lists intact. L2 IDs change (e.g. 0x3 -> 0x18 for the
cluster of CPUs 8-11) but the shared_cpu_lists are unchanged.

It may be worth mentioning the hotplug effect in the changelog. Do you
plan to post a non-RFC version to the x86 maintainers?

Tested-by: Javid Rzayev <rz.cavid@gmail.com>

Thanks,
Javid

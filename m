Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558663;
	b=nxJ1omkEFXc7lxh1i9XIcsPRBxOfcCEd6dPtXYLzg4jcTiKBRvLhjlJCfyvklOxffso8
	 OtVZgPWDIFDNaY4kLJY+jj6cs8g4EI8PlLymK7eyyx11Lstpr4JJ8kVHvURqmAE/RHXb7
	 fykwma5L4D9dwkEXdbaRoIrrZTqYPBs3B3UuhycRzq4G7JTqcJEII8YbG9ZbeVYbuyQ/i
	 vPTYwS/JcdhDtMBIBFrp7MVRvLNPGUHdYLS6SvgiiYSGvSSFnlHgaWkMJEx2dTVdUedjx
	 179+mdh50P8Wiy7Q1kakABg6H6YLLU3DbkykGql9IG9jc6Piu86rC9eS7WAtapglclg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
	b=HaNyfIethnxeY7OHTIWmmVmJDabQ6Al0NFPO47UElFdK0bKyauY07O1LuRErHIc7EXZk
	 IU9tn/s4xeIKjhPbnQ3AcxrYbrDax2fCVlSimIzM7M9dlRZZKVpvyiG/vamO4BvMBZySi
	 pbzwBNzkhYll2af+SesyAIVtfCIlRJKSZcTlE5ThW3O59S5aSlonzeySW6GP98ZQ4xhJj
	 QKaHZEa6gr/LGaHQE+ECw9HPXCOQ56eKuSDpC4aEf1bAU9H3cyMvTRehJfw6zZr9MEHwM
	 k7f+f5OcILOtuz65TndCDd7+53GRy/Jo7aJr4uvRKPPwaJFRBodi1ya5kzE/mXmmtGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MgGXhDWw;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1157A606B1E3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1157A606B1E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MgGXhDWw
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6b22be970so210529b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794558662; x=1795163462; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
        b=MgGXhDWwYqVoGzJV7PFTcjwzcTdpBKMUvHY8QEaDnV7SRHamPhA1DJy6yUwDGoWa45
         LpTPTHlrE4OBDNbMZwPNXtMa/IjnTaGl3MVDBT2zN2/pYU/JzboTINCcQoG5UMULzy9K
         3luLrf2LbhZuVkGhsQ3PYQ1I16vTGZllMcdco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558662; x=1795163462;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
        b=pg6adGXrMc4SuHGeDUHLWBlmzYqa6pmfOCEcYbPBxgqxRJD57QejNQcVMRE9kkOsVP
         fa53NgPYd4+CB6gtZG4TokNJMZMYU3QWTsIvvmH3D7Awh/xR74ZWK3O9qJa1TsLZnFuR
         7pyZY9yYPAljUaO5Mp4YrPdfqz4k+mSxjJ1MDjko8AsMSwZ9qmP8Vs/0lWYz9Tw36SOa
         BGtMeuVsD+5me7sTzENEtCTHwjtU6CuletK+n03GPXo8BlhrMc2GR9Bv4LzCRcahcbGb
         jQdHbzpQ4Mda8elSUTASvsJrLY5g0td+V10ppecAOtgvOj7HNfb8+CW7/kFSgZGsDRR+
         b+eA==
X-Forwarded-Encrypted: i=1; AL+hErE9oFyA6Em6s5XAj7QD0Pd5c7HF+K2m8QDkmlXMC5ipMe6ztVUFuBWF+CUbGEF2WMXp8leTCUkOoHLDOd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z92LeK8hJBlckjLFJ07PF+Lp+Z92JxKf9oO7gLdI+OrQ0uwlZzh
	33zIgLqarw1QG2s8Qzdz3jvlfjwZcbipll5QnJEL6vwJYXwPzvIqBFmmd0ykmPD9irg=
X-Gm-Gg: AYBFou0bFZ6GnTYp4jLz3TNQTm41S9Ar7VST+uoHI/vNbdCmnZGG0N+t2CsftJQpdJ2
	fWeFGFsfsS9viYINqCbFNrVv7RroBPdE0n73a7RceqVuj4r+h9/LHKb4ADXbyHmlkicQf1DB8NC
	ymmlEw1ZsSZoU90F8v6AiyIy+/kRWwd72AqnDzQTQuzOjsTLJsY8RPhYfCqOarY4q8od5gCU3pN
	iWrx/XjEYSC5+Q4Wew6ColHl5KnN9WfIi/PvXc8FEI2u1QKKNLuKTTiSXUpYPp8GJ9wqkuhbvvJ
	Gef7bKr8hsH1bFuqWXm3q7TRAVhDH68aFXqhm/NHsehW0uBZeSP4WZgU2aZAE4hlJ7zYRp/tmVm
	8wDmdLo5IgxmhT5zkfYWECpMJtEApNcMTb08l+HX7bf4Nj90KjVyQLw8SVGdZROPGzHQHuLPPfD
	0v5yPSvwCbTWjxeoF/IW62GHb9XrRTURm9woGhceouxg2wtLSPl25NgL2V4Y7G80E1CI09BNM0o
	tq83OEIbYtw4KX0gqcKQdIgu1a8fTMZmoIL7GuUcdHhmHVOSbbSeZjnxGRvcEZGEMj19m5vHwyy
	JkHoBeX7I/DO0r8Gc5AhNnXIwqt2T9jq8lDYa8nFkbgjBbB1x2/esBQdo2/21EioLp9y5TpPYyD
	m6zc++npDaR0LblkFMVe2EY8QX+RfXm2+tF0PFPzqxlQ5aIMyFKALyaug43TeNekEwHbDXYjKEr
	an6sHVhvaoaMObjM3+uYIpcJV3Pq6JJ+yTtySdUXf/OvVr8n+4IxpBSg2QXB8=
X-Received: by 2002:a05:6a00:1a8d:b0:89e:a2cc:8263 with SMTP id d2e1a72fcca58-8beb21ce39emr2120292b3a.5.1794558662388;
        Fri, 13 Nov 2026 00:31:02 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcc9basm738703b3a.3.2026.11.13.00.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:31:01 -0800 (PST)
Date: Fri, 13 Nov 2026 00:30:59 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet monitoring
In-Reply-To: <179443886218.2329176.10742245280418377061.b4-review@b4>
References: <cover.1794383544.git.chris@chrisdown.name> <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name> <179443886218.2329176.10742245280418377061.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003059.056dd036a6546756@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pasha,

Pasha Tatashin writes:
>> The reservation varies with the kernel, memory size, NUMA layout and
>> command line. Our fleet collector needs the actual size from each host
>> so we can decide where to enable KHO and catch a kernel release that
>> takes those hosts over their bootmem budget.
>
>HM, that works for cold boot not for live update :-)

Yeah, that's true :-) A kernel we live update into just inherits the areas, so
we'd only see a release change the size once hosts cold boot into it. I'll say
that in the changelog in v2.

>> Today the collector would have to sum kho/out/bootmem_len in debugfs,
>> which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
>> to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma
>
>Is this a different bug?

I think so, yes. Bootmem pageblocks are MIGRATE_CMA, so their free pages are
counted in NR_FREE_CMA_PAGES, but totalcma_pages only counts the areas that
mm/cma.c knows about.

zone->cma_pages is a separate problem. It only gets bootmem added by
init_cma_reserved_pageblock() in kho_init(), and on a KHO boot we return before
we get there.

I can send patches for those separately if you agree that bootmem should be
counted in both. It wouldn't give us the bootmem size though, because CmaTotal
would still include any other CMA areas.

>I have some concerns about exposing this as a stable API. What if we get
>rid of bootmem or make it resizable? We only recently renamed it from
>scratch to bootmem, and we have been exploring for way to optimize it.
>
>I would keep this exposed under /sys/kernel/debug/kho/bootmem_size for
>now, and not worry about it being stable.

That's fair. I'll move it to /sys/kernel/debug/kho/bootmem_size in v2, and we
can look at sysfs again once bootmem has settled down.

>Keeping it together with the rest of KHO code would be better.

Will do, it'll go in kexec_handover_debugfs.c next to the other bootmem files.

The kho_incoming files in 6/9 are already in kexec_handover.c, but kexec_core.c
still adds the group to /sys/kernel/kexec. Is that ok, or would you rather KHO
set that up itself as well?

Thanks!

Chris

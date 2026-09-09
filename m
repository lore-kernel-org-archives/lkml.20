Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8EC5678EE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960652; cv=none; b=MZZZUA5I4+3Fi0x8Q9ECo49ksl2h7dFbrylxaNeRSP2zmOQa+cDFZYqrzDgxGM8OBfOpJ9d9RWtu52XzjqnGO8gZGw+8VC00KYFYLWyvWdsPrjE7ZYAwSvVpYmglLJmzyo57c7Kx0miLf56S7AcNY+52P6jwrRq2w3ufq2EYtxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960652; c=relaxed/simple;
	bh=9kaM9ocsc1ZqBHkd6itoHMxsLyIdWneW8aHZkndQQLc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSwCD0DBbpvj6n6DFq9iMBayEjEUB4cIru+UUQr/zg9+W/RgUPIXxPGvYqIhM8c6izaMyBh2nSVM5y8zexMoB24UnynNBjYhi8kWHTse7K3HIdOOzxoTAW7tWXbx6XP1lG10pvVKtLWlwmNmOP+woPnjVb/ekhhXCKkaXkYPUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQkYUltk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQkYUltk"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c28fde3bbd2so495766366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960649; x=1789565449; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF1cEFcgyVPOEPUq/61SXtv1bN/BnUewuuhHxkdbS5w=;
        b=YQkYUltkmtgr08DEum35qzjMvf70ayUSmznqgOZP7PAiT5R2cqEmDWiKe8zKI92FQZ
         xhU/xVUTFmuCkBltRCGXWll0URPIhZT1dy0zwkR0HIjorLZeYzKQTHahJAJ/uEQT7WOv
         D3q1sXfIwXwfPYK4TYMd4xPja6M02bgWrjOJFqbffDKn7tHRD7QUdOKJ5cCZ0zzfaA1/
         RFmcGb2HiA7Ij2altbOQoL6oABn4eWcHqX3Nkg0haOh6NRc+jz9pAxqNpfT/Jg/Cfurc
         gucj9qrsPD0rxQ7JNU7jbMw4JY6tmNnUkS0tL/fMCQDayNxYae0OoWRTwnWM7Y8aIXSP
         e/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960649; x=1789565449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fF1cEFcgyVPOEPUq/61SXtv1bN/BnUewuuhHxkdbS5w=;
        b=CxaYC0E7PMUVh6apU1Qurpu0c9skATGURSgiHJFK4DorjkuKM1d/eavY95J9MJHVPu
         fjhtBa5XaTdulpSmGko0rAVlOFWE1JnCWBlG34Xy9ZLmiJ3NfcG4RTmQVp8ga901VenL
         nj9cMC8dxHkYYYX8kON7FI6jB5eZSpNKkUixBCbBOIVcIEg4XiRuwWKDgUNLux3J9EEl
         N+uQuWmBd8fFxrDcAdm2nP+8QsK6eD00izy+QxI0qscxt+7ldddVmFntqcLLxxaujLxp
         8Q4m664Yk4f0Lm718W/T8U5LbOnW9WERw/KEz9A2WHB/4fuc8SVbWIb1Ww3hUUXmsy7Y
         PMqg==
X-Forwarded-Encrypted: i=1; AKwUvBx9lcL3ZX39g89wWMaXOXYAk2atR17R2Jhfzqvn7pWqrRk4kj27oxwx7GdjmBaYN6dfCSsSLvbzg/yIH5I=@vger.kernel.org
X-Gm-Message-State: AFuF++lwWwjgRaVoLQZndpLpKsPw97xSiFw6TEeQiP3ESzz6P0zoT6dm
	4aKlDr1S5A2NMUdbKarnI0TwUn4lPJriju/qOlqVNEGZsk1PpqYXqwiS
X-Gm-Gg: AYBFou05z31+cDm7NmmqX41oR1YUGyvV42nq6QIMDCWNokogImMWpYhSPjK1sjd37vM
	SfX15VF6ewJstV3I4CYH73xMJg2z0xvosgzJV9pK5P+O23Xp+vrRNGXhPktbTtLS72snVbnSm8R
	IKLI16WLEjYyo6sidz1QOIi8hNKilhMPfPQCxsmIarnZizDAZA7Oy4XPRrjrjVM4c/WYFm2C3M7
	wNpVTPX4jvXjOoNpsQGnD1VQZz7rSo2iDNdud3A/f4xEzqrTZBqn4IHqGLkWuFzvYArxRhYae/j
	e1VynqmBjZnK4YEdIt4etSPjgGiyPz4oBU3iliy7Ol16aD6wZU511UR1iTwLntXF3GFrUvX1fw4
	MUwSGvKFnKO/ns0NDd8hd+EIZycbE/1iiq00uMfU2aYR3CNFYKzSnbrFKAfYY13jG39rAx46my1
	As1dUfefD/gTYX0kTDInG9orWAqTLmfdAKkMAqSkU+cOv5gSja6/dzch8njIZ9saed8PoaIHGKq
	mKN
X-Received: by 2002:a17:906:4789:b0:c24:e0dc:8b66 with SMTP id a640c23a62f3a-c260c8dc700mr1541952166b.6.1788960648727;
        Wed, 09 Sep 2026 06:30:48 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm616338266b.18.2026.09.09.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:30:48 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:27:47 +0800
To: sashiko-reviews@lists.linux.dev
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	kexec@lists.infradead.org, Pratyush Yadav <pratyush@kernel.org>, 
	Dave Young <ruirui.yang@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Baoquan He <baoquan.he@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
Message-ID: <aqFeOaIxKNMKVOTM@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-2-coiby.xu@gmail.com>
 <20260909005311.B1E471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909005311.B1E471F00A3A@smtp.kernel.org>

On Wed, Sep 09, 2026 at 12:53:11AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
>New issues:
>- [High] Prematurely clearing `is_dm_key_reused` breaks the ARM64 kexec_file_load retry loop and defeats hotplug dm-crypt key reuse.

Thanks for catching this issue! I'll send a new version to address this
issue.

>
>Pre-existing issues:
>- [High] Mapping crash-reserved memory with `kmap_local_page()` causes out-of-bounds reads if dm-crypt keys exceed a single page.

x86 is not supported so I think this concern can be dismissed.

>--
>
>commit 9cf0538566bf6406e97a7f29629856abff44a5b0
>Author: Coiby Xu <coiby.xu@gmail.com>
>
>crash_dump: Fix potential double free and UAF of keys_header
>
>This commit addresses a potential double free and UAF of keys_header when
>loading dm-crypt keys for kdump. It establishes an invariant to free
>keys_header at the end of kexec_file_load unless reuse=true.
>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index b70f4df15a1ae..1a0ca54adc9a4 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -110,6 +110,7 @@ static void *image_load(struct kimage *image,
>>  		image->nr_segments -= 1;
>>  		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
>>  		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>> +		crash_dm_crypt_cleanup(image);
>
>[Severity: High]
>Does this call to crash_dm_crypt_cleanup() during a retry loop unintentionally
>free the keys_header buffer?
>
>Since crash_load_dm_crypt_keys() unconditionally clears the is_dm_key_reused
>flag before returning, any mid-retry cleanup performed here when segment
>placement fails will see the flag as false and wrongfully free the valid
>keys_header buffer.
>
>>  	}
>>
>>  	if (ret) {
>
>[ ... ]
>
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index c685497cd470e..f638fb4b8554c 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>> @@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
>
>[ ... ]
>
>> -static void get_keys_from_kdump_reserved_memory(void)
>> +static int get_keys_from_kdump_reserved_memory(void)
>>  {
>>  	struct keys_header *keys_header_loaded;
>> +	size_t keys_header_size;
>>
>> -	arch_kexec_unprotect_crashkres();
>> +	keys_header_size = get_keys_header_size(key_count);
>> +	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
>> +	if (!keys_header)
>> +		return -ENOMEM;
>>
>> +	arch_kexec_unprotect_crashkres();
>>  	keys_header_loaded = kmap_local_page(pfn_to_page(
>>  		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
>>
>> -	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
>> +	memcpy(keys_header, keys_header_loaded, keys_header_size);
>
>[Severity: High]
>This is a pre-existing issue, but does this copy read out of bounds?
>
>kmap_local_page() guarantees mapping exactly one physical page frame. If user
>configuration has enough dm-crypt keys (e.g., > 10 keys, where each struct is
>388 bytes), keys_header_size easily exceeds the 4KB page size.
>
>Copying beyond the single-page mapping will cause out-of-bounds reads and
>could trigger a kernel panic on systems with HIGHMEM or when
>CONFIG_DEBUG_KMAP_LOCAL is enabled. Could memremap() be used instead?
>
>>  	kunmap_local(keys_header_loaded);
>>  	arch_kexec_protect_crashkres();
>> +
>> +	return 0;
>>  }
>
>[ ... ]
>
>> @@ -441,18 +458,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	r = kexec_add_buffer(&kbuf);
>>  	if (r) {
>>  		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>> -		kvfree((void *)kbuf.buffer);
>> -		return r;
>> +		goto out;
>>  	}
>> +
>>  	image->dm_crypt_keys_addr = kbuf.mem;
>>  	image->dm_crypt_keys_sz = kbuf.bufsz;
>>  	kexec_dprintk(
>>  		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>>  		kbuf.bufsz, kbuf.memsz);
>>
>> +out:
>> +	is_dm_key_reused = false;
>
>[Severity: High]
>Does prematurely clearing is_dm_key_reused here destroy the state needed for
>the segment placement retry loop?
>
>On ARM64, if the first attempt at segment placement fails, the kexec load
>code retries the loop. Since the flag is unconditionally cleared here, the
>first iteration will clear it. When the retry cleanup executes in
>image_load(), it will see is_dm_key_reused == false, freeing the keys_header
>buffer and leaving subsequent retries without the required keys.
>
>>  	return r;
>>  }
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260909003657.1570544-1-coiby.xu@gmail.com?part=1

-- 
Best regards,
Coiby

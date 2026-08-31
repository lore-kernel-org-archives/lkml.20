Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94B24A6CD4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183908; cv=none; b=tPe1ehneF+4baHBlmE0tW8eUGvtez1bK54ZgSZA+/K75bZaaAlet1+1kNaKx7Dqr2kCYe0YM1Wyd/APvVhnVNx8uBBdxepVm3fmuzS3Dpd02Roys+AOYg4fX7AyzKyAXifqc9e/NXs+ISDieM1mNoDUGDhvbLmYbEuP3ibr1KwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183908; c=relaxed/simple;
	bh=szCww6DoIjOfiP4cVP0uz225CzBVGKmlwbKVVHem22g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT0r/AR7BCF8dZM6oy3XWT542ndAXybP0zCDckuWCplKHXbwhv1TfNtjnR2NlUZMbClqqsRUVc4tDWwc5usnDVk4TXAKQuTTj7PUp/NISTuPtiEFKcDiPsaRp+cMDh4pTGXjr1Zd3TJywI4kNJGnd67I+GyVfISJj7WQJHVF2Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G74eh3bg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G74eh3bg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39266382df6so2895739a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183905; x=1788788705; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeB+rbTGQuZxuhW3Jvl57BKDPYStEwcC60NnCSXea14=;
        b=G74eh3bgGDM7eciUEycfaZ4a/Sz6vKG9DJOweZJecI5y/vXktIfDN71Owb8g1EI39w
         5O+lKEYIFHaoYwMOdqfcjxljtA9OnkN8GlxnmYgnRPbBmOZZN2qF2ryO7hhNGkMLIEky
         aXSkllks0NVdpZMPB5KifHsnlsIb1Vdaa2D/ED9S43LTYe/DJUMIJmJdr4vLbuK0Drd1
         PR6j43gj13BXWINbYIYsb+tzThXz9HUoqrBkGNLvtHpArfIiGt44iuwX4dub51EuWLtY
         Q7a5KaYKZuQdlSptmI88/zbbr28vtyKMa86HYYbAmpc5X+voF0IBe8jOyOchmTSGbDG7
         ej8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183905; x=1788788705;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zeB+rbTGQuZxuhW3Jvl57BKDPYStEwcC60NnCSXea14=;
        b=W9YhGfUQj3D7k0pGWPW2v2JrZg2CniuzKQBo1EbnzKxNYOlMi6kmsRuLFntLz7O9X1
         EVz3v6oORpmN0DHw7FsnLqfUYuCoWR9p4T3HqRQwxfeZ0VKPCwL2K0DLv2FMbuiJQ9Kg
         G4Z6QkLIU9ojq6CmIjnCARvrgNTE+OdFLq7JTeuNgSImBqWq5ZQBw3k9QguXUivN5UK1
         zd7dVwpHtmXNst0tVkCGGNsNdmfl1wqQ78rq7ky3/fHKtXn5f0FMKxBeTUxKzYlR7Abv
         DjgdWVC62HAsOazph+5GItxj4brR5KYjw1tm2czwYfhNhPjcDjqxTcZZvF9U2KRf1BRX
         QFiA==
X-Forwarded-Encrypted: i=1; AKwUvBzxSy0qsTxLRLwqkXcOh/S/KuFupnd1Ni+ViX2Naon6Ygsk6nQcm6NSXJlyt2Dt6lYufv9WYHp4NauKN/g=@vger.kernel.org
X-Gm-Message-State: AFuF++khvKAcd0NFQIrh5U62gdRb66N4HS8HcDoNrz29Ju7cGRmlO0vo
	WyH1oilxlHslvxOHJo7Wz6t2n68U3yrG9OeV36UkLYf0H0ocDoEsNvw+
X-Gm-Gg: AYBFou0OQZ5/fcG2HkRO/NPyPB/H55rfprDGu1aMPBlphaMAPZztKxw/64g/AM6ggqp
	fjLTFDV6r9e52fC7Ooit1eQgWRpbW6oIdHK7m3oALv7HVXLHr8YbW7BnfupDeZWKFHF7AKph8Uy
	yzcILLP8/byTf+W7Q9Tyh5CEg8ntu9W4zKrZ+YlTFWipC7LiKsgpBIKf96U7mvYx+OOo82vvg8A
	PIb4VE+86tx2YGdsynEYZoQrDxRHv5CVj4w+PVTJjzbEIMeysTZxanz8IRAgIu7c5sIG9Bb6t6+
	icK4a9/yBWB0BesQbsKfagFRMrmSC4aPrxnB6WX45WFos3qWbwSMFIyGkDn4M0sggUt8+e/sd4e
	gbE65APZ84GTQ1Naq3svv+vQaSOVTmoZ6LRHqiIaNygsDFrTUM4w+O3u0fhoHfhoY9m7z+jDhGY
	CJOvowR897oluM+jDPdS7lpNFoZapsPjuY0pYOo5ST75woX3aE3o/bag==
X-Received: by 2002:a17:90b:55cc:b0:398:de86:5ff0 with SMTP id 98e67ed59e1d1-39907db4f3amr1229981a91.19.1788183904771;
        Mon, 31 Aug 2026 06:45:04 -0700 (PDT)
Received: from localhost ([45.112.44.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398aa3a9b54sm4848324a91.4.2026.08.31.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:45:04 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 31 Aug 2026 21:44:31 +0800
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>, 
	Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
Message-ID: <apWEBBMz6aFBeefa@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-2-coiby.xu@gmail.com>
 <76f634e3-9adb-4ae2-b2b0-a7e13a2f93c3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76f634e3-9adb-4ae2-b2b0-a7e13a2f93c3@huawei.com>

On Mon, Aug 31, 2026 at 03:39:35PM +0800, Jinjie Ruan wrote:
>
>
>在 2026/8/28 16:48, Coiby Xu 写道:
>> If kexec_add_buffer somehow fails, keys_header will be freed. Depending
>> on /sys/kernel/config/crash_dm_crypt_key/reuse, it will lead to the
>> following two problems if the kexec_file_load syscall is called again,
>>   1. Double free of keys_header if reuse=false
>>   2. UAF of keys_header if reuse=true
>>
>> To address these problems and also make it easier to reason about the
>> code, keep two invariants,
>>   1. keys_header will always be freed at the end of kexec_file_load
>>      syscall except during kdump image unloading for CPU/memory
>>      hot-plugging support
>>   2. There will always be valid keys_header if reuse=true
>>
>> Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
>> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  include/linux/kexec.h        |  6 ++++
>>  kernel/crash_dump_dm_crypt.c | 66 ++++++++++++++++++++++++++----------
>>  kernel/kexec_file.c          |  2 ++
>>  3 files changed, 56 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index 0af8ae4fdd08..0fa8bac04576 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -552,6 +552,12 @@ void set_kexec_sig_enforced(void);
>>  static inline void set_kexec_sig_enforced(void) {}
>>  #endif
>>
>> +#ifdef CONFIG_CRASH_DM_CRYPT
>> +void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image);
>> +#else
>> +static inline void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image) {}
>> +#endif
>> +
>>  #endif /* !defined(__ASSEBMLY__) */
>>
>>  #endif /* LINUX_KEXEC_H */
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index c685497cd470..4335b6cb1fc4 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>> @@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
>>  	return r;
>>  }
>>
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
>>  	kunmap_local(keys_header_loaded);
>>  	arch_kexec_protect_crashkres();
>> +
>> +	return 0;
>>  }
>>
>>  static int restore_dm_crypt_keys_to_thread_keyring(void)
>> @@ -286,17 +293,28 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
>>  static ssize_t config_keys_reuse_store(struct config_item *item,
>>  					   const char *page, size_t count)
>>  {
>> +	bool val;
>> +	int r;
>> +
>>  	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
>>  		kexec_dprintk(
>>  			"dm-crypt keys haven't be saved to crash-reserved memory\n");
>>  		return -EINVAL;
>>  	}
>>
>> -	if (kstrtobool(page, &is_dm_key_reused))
>> +	if (kstrtobool(page, &val) || !val)
>>  		return -EINVAL;
>>
>> -	if (is_dm_key_reused)
>> -		get_keys_from_kdump_reserved_memory();
>> +	if (is_dm_key_reused) {
>> +		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
>> +	} else {
>> +		r = get_keys_from_kdump_reserved_memory();
>> +		if (r) {
>> +			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
>> +			return r;
>> +		}
>> +		is_dm_key_reused = true;
>> +	}
>>
>>  	return count;
>>  }
>> @@ -369,9 +387,6 @@ static int build_keys_header(void)
>>  	struct config_key *key;
>>  	int i, r;
>>
>> -	if (keys_header != NULL)
>> -		kvfree(keys_header);
>> -
>>  	keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
>>  	if (!keys_header)
>>  		return -ENOMEM;
>> @@ -415,8 +430,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  		.top_down = false,
>>  		.random = true,
>>  	};
>> -	int r;
>> -
>> +	int r = 0;
>>
>>  	if (key_count <= 0) {
>>  		kexec_dprintk("No dm-crypt keys\n");
>> @@ -424,14 +438,15 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	}
>>
>>  	if (!is_dm_key_reused) {
>> -		image->dm_crypt_keys_addr = 0;
>>  		r = build_keys_header();
>> -		if (r) {
>> -			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
>> -			return r;
>> -		}
>> +		if (r)
>> +			goto out;
>>  	}
>>
>> +	/*
>> +	 * keys_header will be copied to reserver memory later and then be
>> +	 * cleaned up at the end of kexec_file_load syscall
>> +	 */
>>  	kbuf.buffer = keys_header;
>>  	kbuf.bufsz = get_keys_header_size(key_count);
>>
>> @@ -441,18 +456,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
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
>I think there's still a bug for arm64 here.
>
>When is_dm_key_reused set to true, the outer while loop prematurely
>clears the is_dm_key_reused flag at the end of
>crash_load_dm_crypt_keys() in the very first iteration.
>
>Consequently, subsequent re-entrant calls to crash_load_dm_crypt_keys()
>falsely perceive the keys as not reused, forcing a redundant execution
>of build_keys_header() which overwrites the global keys_header pointer;
>
>This induces a silent kernel memory leak.

Thanks for reviewing this patch and raising the concern! Unless I miss
something, I don't think the global keys_header will be overwritten
because kexec_file_post_load_cleanup_dm_crypt will called to free the
memory during the end of kexec_file_load syscall.

>
>92 >-------/*
> 93 >------- * The location of the kernel segment may make it impossible
>to satisfy
> 94 >------- * the other segment requirements, so we try repeatedly to
>find a
> 95 >------- * location that will work.
> 96 >------- */
> 97 >-------while ((ret = kexec_add_buffer(&kbuf)) == 0) {
> 98 >------->-------/* Try to load additional data */
> 99 >------->-------kernel_segment = &image->segment[kernel_segment_number];
>100 >------->-------ret = load_other_segments(image, kernel_segment->mem,
>101 >------->------->------->------->-------  kernel_segment->memsz, initrd,
>102 >------->------->------->------->-------  initrd_len, cmdline);
>103 >------->-------if (!ret)
>104 >------->------->-------break;
>105
>106 >------->-------/*
>107 >------->------- * We couldn't find space for the other segments;
>erase the
>108 >------->------- * kernel segment and try the next available hole.
>109 >------->------- */
>110 >------->-------image->nr_segments -= 1;
>111 >------->-------kbuf.buf_min = kernel_segment->mem +
>kernel_segment->memsz;
>112 >------->-------kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>113 >-------}

Btw, I assume the above text is not related to the discussion, right? 

[...]

-- 
Best regards,
Coiby

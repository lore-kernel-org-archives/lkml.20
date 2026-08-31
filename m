Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B854E56EA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183611; cv=none; b=A3DnQ+1KMf7IpeuWB+fU2+yEy6i8tIn9lrCs/YHqi1+U8W6YOd91Bb0A8LD3bNs8mI6RDHVcOrI1WCX4N+0LFnfs9HWP5C7Yx6wKRoCIQ0/CcY4b60ryL18qIilXGJBleZcnveISYQ3CF6hIc4IM10YqKSJDNbdgAQ39VebMFOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183611; c=relaxed/simple;
	bh=mmmPKuSpPwHBNH/xCCEbA7njtcSUDEIDK9G0l7l1u/o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCyPgxDEh6SchPkjKkjCL8p4r5hAw44+d5c0/xQfRpF03shzhlyPpI9Ns/397h9nnOw7cTlRRlOlzgKZL7O4BmM3hbFgHsMnMws816TglU+fmOcHD5MwVuujO2hV8ykGKInPCCKHwOhRph/pxx/+ocvwEgWxbGZyjIhqvwXUtpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKci2xt9; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKci2xt9"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2918341a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183609; x=1788788409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yd2Ar3RmTJ9F/ZDeMnk183eBg6DrdUsQr78JTCYkyuQ=;
        b=RKci2xt9nbFFLNaL5nuzPfD3+Frhy0WysCEZpz0tnGerLL8yrX0HJnLjXNtJW0n2HD
         l+vTmksAb6VKs7YNZ5qa+2t+tgeF50npS/Abg7zZhLHZjzffnfS2Mk/UDlNDY8hIY6RY
         OcXDK2AF2duCyIKULbKz2r832hWes88iv6jNjrJj8y1JclORiAMemcPIRUwbYGZYKrt4
         BRJFzYb8bK11PXSYsRPblGasaGQwRGauvT3Iq93IxuhnT7yyoxzG89PXvVllstvXStZu
         LdmGWJeDlhINagX049i4rx58SMjzZ84BQnp8nnOnaPYcsXlMTjGtMBc4UPYxxToGTlwK
         OmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183609; x=1788788409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yd2Ar3RmTJ9F/ZDeMnk183eBg6DrdUsQr78JTCYkyuQ=;
        b=F28f3PEqphuLkYIWdXt85/XbbGatq+5zL3nQP+mwtHhmw0A6bG+17N1tkYGfufoU88
         b/vFJAeqx+iuEbESJ2OfQ3SxLZU3ktf706Oi02MdCDbp506huepJIOvoKjoiqiDOUamr
         n9VB53q3Jql2EohG1bxFUQd20cKnhM354GLXx3X0MsAzLbuqwkjmk2b5DnXwfKasLyjt
         0hQ/0feDwUtONuxgnzRXZFHHDhYLvi/U304m00lFFsCTEhYrHykiDvEBF8s3nYoG3tyT
         GSzeTPwxWMurKJjUghxAguHknHZWMI5tsJLEZgkzva+Jto0Iy07WU7pAO0sCSjtfw08m
         nbeA==
X-Forwarded-Encrypted: i=1; AKwUvBwIVoQLSE4DZoUT43swXxm3RQRw+72jajkYq+GJHc3YbTfhYFHa11b/4hM5cMR+NMlwHiOoTmaGTnfFw24=@vger.kernel.org
X-Gm-Message-State: AFuF++nK7W0NDYki5icg5RKu8U3ydyJOugXS5t4eDzw+7s+1nTDQ5Rmi
	mVpCIO9zGPia1CYCx62AgPKjhlOsECjmAqvy7E8d4/Y3qxq7hS2o660xM8NMZjSlTJ2G3w==
X-Gm-Gg: AYBFou1Bun9UIIQTCqMEbXfg0Rqun48UUEy5cFGQxKjPszgL3JUI8W7Ey/t5Y6wLT51
	iLGT2uOk9NW800xiX5/oFlICw3fjIdA+P32+ib+IOlT++x5ZRJ3eBsrE3xaab/85SaRLJN6Fczp
	6gIKxdmx09YlCiIT5K29D+D6LaCMgwVUQ7hO2VcgVbwujAo3haiK1qMcvTH/ImsBjAQ2rwRSEwF
	8wHH+PgbEBiEaBFYQDGfzBoxkti8XlF6rdEVgFiArp8aNS9q+vnEVHI7xr/qh5uOwjeT+4DVaz3
	U2RUh2mCD8sNCP+ipImqZuC8jDu0uq9lMf6wCi7JlQpThxrnPbVp3+3gJ9uR18tbZP1776uufCg
	r7prk0q5y87B48O8WcmnGrbBfyJKmQSKTCz4HrZASy0rXicokLMPcMkO7mF7yG/kRYQnOJ4tb6g
	xEKrTus92c3xaYGE4iokgcmJB+PHXQNdGGSF0zstQAhZQElOrcMlLpDA==
X-Received: by 2002:a17:90b:164b:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-396d0c79e8amr39123637a91.0.1788183608423;
        Mon, 31 Aug 2026 06:40:08 -0700 (PDT)
Received: from localhost ([45.112.44.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm30280525eec.15.2026.08.31.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:40:07 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 31 Aug 2026 21:39:10 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v4 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
Message-ID: <apWDq7EZJhL41hdS@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-2-coiby.xu@gmail.com>
 <f8994152-7f77-4338-a496-aca67f85ca2a@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f8994152-7f77-4338-a496-aca67f85ca2a@linux.ibm.com>

On Sun, Aug 30, 2026 at 12:00:40PM +0530, Sourabh Jain wrote:
>Hello Coiby,
>
>On 28/08/26 14:18, Coiby Xu wrote:
>>If kexec_add_buffer somehow fails, keys_header will be freed. Depending
>>on /sys/kernel/config/crash_dm_crypt_key/reuse, it will lead to the
>>following two problems if the kexec_file_load syscall is called again,
>>   1. Double free of keys_header if reuse=false
>>   2. UAF of keys_header if reuse=true
>>
>>To address these problems and also make it easier to reason about the
>>code, keep two invariants,
>>   1. keys_header will always be freed at the end of kexec_file_load
>>      syscall except during kdump image unloading for CPU/memory
>>      hot-plugging support
>>   2. There will always be valid keys_header if reuse=true
>>
>>Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump reserved memory")
>>Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>>Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>---
>>  include/linux/kexec.h        |  6 ++++
>>  kernel/crash_dump_dm_crypt.c | 66 ++++++++++++++++++++++++++----------
>>  kernel/kexec_file.c          |  2 ++
>>  3 files changed, 56 insertions(+), 18 deletions(-)
>>
>>diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>>index 0af8ae4fdd08..0fa8bac04576 100644
>>--- a/include/linux/kexec.h
>>+++ b/include/linux/kexec.h
>>@@ -552,6 +552,12 @@ void set_kexec_sig_enforced(void);
>>  static inline void set_kexec_sig_enforced(void) {}
>>  #endif
>>+#ifdef CONFIG_CRASH_DM_CRYPT
>>+void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image);
>>+#else
>>+static inline void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image) {}
>>+#endif
>>+
>>  #endif /* !defined(__ASSEBMLY__) */
>>  #endif /* LINUX_KEXEC_H */
>>diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>>index c685497cd470..4335b6cb1fc4 100644
>>--- a/kernel/crash_dump_dm_crypt.c
>>+++ b/kernel/crash_dump_dm_crypt.c
>>@@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
>>  	return r;
>>  }
>>-static void get_keys_from_kdump_reserved_memory(void)
>>+static int get_keys_from_kdump_reserved_memory(void)
>>  {
>>  	struct keys_header *keys_header_loaded;
>>+	size_t keys_header_size;
>>-	arch_kexec_unprotect_crashkres();
>>+	keys_header_size = get_keys_header_size(key_count);
>>+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
>>+	if (!keys_header)
>>+		return -ENOMEM;
>>+	arch_kexec_unprotect_crashkres();
>>  	keys_header_loaded = kmap_local_page(pfn_to_page(
>>  		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
>>-	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
>>+	memcpy(keys_header, keys_header_loaded, keys_header_size);
>>  	kunmap_local(keys_header_loaded);
>>  	arch_kexec_protect_crashkres();
>>+
>>+	return 0;
>>  }
>>  static int restore_dm_crypt_keys_to_thread_keyring(void)
>>@@ -286,17 +293,28 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
>>  static ssize_t config_keys_reuse_store(struct config_item *item,
>>  					   const char *page, size_t count)
>>  {
>>+	bool val;
>>+	int r;
>>+
>>  	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
>>  		kexec_dprintk(
>>  			"dm-crypt keys haven't be saved to crash-reserved memory\n");
>>  		return -EINVAL;
>>  	}
>>-	if (kstrtobool(page, &is_dm_key_reused))
>>+	if (kstrtobool(page, &val) || !val)
>>  		return -EINVAL;
>>-	if (is_dm_key_reused)
>>-		get_keys_from_kdump_reserved_memory();
>>+	if (is_dm_key_reused) {
>>+		pr_info("Already got dm-crypt keys, please continue with kexec_file_load syscall\n");
>>+	} else {
>>+		r = get_keys_from_kdump_reserved_memory();
>>+		if (r) {
>>+			pr_warn("Failed to get dm-crypt keys from reserved memory\n");
>>+			return r;
>>+		}
>>+		is_dm_key_reused = true;
>>+	}
>>  	return count;
>>  }
>>@@ -369,9 +387,6 @@ static int build_keys_header(void)
>>  	struct config_key *key;
>>  	int i, r;
>>-	if (keys_header != NULL)
>>-		kvfree(keys_header);
>>-
>>  	keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
>>  	if (!keys_header)
>>  		return -ENOMEM;
>>@@ -415,8 +430,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  		.top_down = false,
>>  		.random = true,
>>  	};
>>-	int r;
>>-
>>+	int r = 0;
>>  	if (key_count <= 0) {
>>  		kexec_dprintk("No dm-crypt keys\n");
>>@@ -424,14 +438,15 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	}
>>  	if (!is_dm_key_reused) {
>>-		image->dm_crypt_keys_addr = 0;
>>  		r = build_keys_header();
>>-		if (r) {
>>-			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
>>-			return r;
>>-		}
>>+		if (r)
>>+			goto out;
>>  	}
>>+	/*
>>+	 * keys_header will be copied to reserver memory later and then be
>>+	 * cleaned up at the end of kexec_file_load syscall
>>+	 */
>>  	kbuf.buffer = keys_header;
>>  	kbuf.bufsz = get_keys_header_size(key_count);
>>@@ -441,18 +456,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	r = kexec_add_buffer(&kbuf);
>>  	if (r) {
>>  		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>>-		kvfree((void *)kbuf.buffer);
>>-		return r;
>>+		goto out;
>>  	}
>>+
>>  	image->dm_crypt_keys_addr = kbuf.mem;
>>  	image->dm_crypt_keys_sz = kbuf.bufsz;
>>  	kexec_dprintk(
>>  		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>>  		kbuf.bufsz, kbuf.memsz);
>>+out:
>>+	is_dm_key_reused = false;
>>  	return r;
>>  }
>>+void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>>+{
>>+	/*
>>+	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
>>+	 * keys_header from being cleaned up during unloading when
>>+	 * is_dm_key_reused=true
>>+	 */
>>+	if (!is_dm_key_reused) {
>>+		kfree_sensitive(keys_header);
>>+		keys_header = NULL;
>
>The below patch from Jinjie has proposed to free and reset the 
>keys_header in
>the below patch:
>
>https://lore.kernel.org/all/20260826092541.3905933-8-ruanjinjie@huawei.com/
>
>I suggest to Jinjie to consider dropping his patch and review this one 
>instead.
>
>I CCed you on the above patch series so feel free share you thoughts.

Thanks for pointing me to Jinjie's patch and making the suggestion!

>
>- Sourabh Jain
>
>>+	}
>>+}
>>+
>>  static int __init configfs_dmcrypt_keys_init(void)
>>  {
>>  	int ret;
>>diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>>index 59fb9d71e9d8..062f7e79016d 100644
>>--- a/kernel/kexec_file.c
>>+++ b/kernel/kexec_file.c
>>@@ -140,6 +140,8 @@ void kimage_file_post_load_cleanup(struct kimage *image)
>>  	kfree(image->image_loader_data);
>>  	image->image_loader_data = NULL;
>>+	kexec_file_post_load_cleanup_dm_crypt(image);
>>+
>>  	kexec_file_dbg_print = false;
>>  }
>

-- 
Best regards,
Coiby

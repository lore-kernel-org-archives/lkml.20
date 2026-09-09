Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5F3C465
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914107; cv=none; b=DjQ4aw7aIdOhqNaoU99n2ZYk5/uc/lBtP6oGhhvo/e2BmSyz2NQnYf2rM3vF1rWU6W+33gtvRXRljyeIrlsGZYzU0MBCOdUJffFErIpphpwmqzJSvbonueAhBxwfZ7AlDjtnMnKpCzg9fMPvSNIuodozbxoZ1Y95m+Fpum8Hd+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914107; c=relaxed/simple;
	bh=WzOyymmmYvdgD4GLtKIB7RXjwM968ee7NoAWw7cy3ZE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QA0wKsl2eMe+EXvanypIyxPTidfXqaWyXkkMFlPtssnr8/88gd0epfJp2PIPUIx4epHCegJMWr2VmE0ir24v9dXjVoGnFZlrxB31TeXhlLs/iVMMsmZ3SAw6gpNOZkQlWRkzTXwslNxpqsAdqIdnNhZ1Ii6EO9b3MNn+JGXpqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPPm4nKy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPPm4nKy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so467105a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914105; x=1789518905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEGP2cE8iQS2fH0kTojaUbqz8qtcGorsOVsNdP0l2Cc=;
        b=UPPm4nKy5hpCATnDGfwmf8ztFOm2wqqPwsCmX8upvbOSE4GPSe4lZ4qtCs065C5svq
         VXnFXWlqDBE3DIx1EZFGOdXo1wWVCzxN1gCGhyFFynY6gEsQBo0anbfCNp/EIXbXGZAP
         09kcF9UJr/gUkmqoLAnCalbAKk19Xt3z0/wQErLhWJkFRXcq850QRNv+qon9T7PQhp/e
         wKjER/d0cMIxl1dWXKTQ0q5LacHuLHYTGmVd2+0j6hVHeNd5CdCv9ji8/6Fu3rDrANNq
         b66V+exHVqz0NLmx5EMy23r5CWLBFhWRHDtUfamn6jFLPvDYKc0uIqgwQiUYzqleR6oG
         GKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914105; x=1789518905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEGP2cE8iQS2fH0kTojaUbqz8qtcGorsOVsNdP0l2Cc=;
        b=OB/Dp9lovmx5TGoyYYwgSR3B5bFN8OXA/Mz50qI7Q9eOkALk7CvaXwgd9MSTD8gcdv
         HHsfnEFYG5MMME5/oU8ByoYH2bUe8XlsJ5OAyx31PUsj2qoOlVCrSMmj9n81bCbR28/n
         njG+Y0VXkNnAyI+H2YJl0aEiYPgRVqmUuY7DGxhB5q6qIL3AWiuXXaCsmMlB749uBq2G
         uitDqjqXaw2+ApF8kjdkeCr5RwqDPGkRMpaeA8dSXeUgwOt06mTNqD/5zUx46tgqH1OF
         2elNWz6qoY5yv4dVs/MHI7p5aaqIWuRk/cliX8MUazDt8AwAXGEIgc75rvgfU5PIKTkT
         /FaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0gMaRwOcvYkWQGP48IeSg+bNvU4UOylnQ6mri15QngCdTtWbviMKQFqo2L2Vlk7YxTdIvfoSBoh6sayc=@vger.kernel.org
X-Gm-Message-State: AFuF++nfNi3KBw37BhGtWN8vDmY7ZpjUM2z0qlHDUyzX2uYgDlDQcUmx
	ypclrveBnPFC1yA98Kfs4RCJbRSqR6/3BIzIewZY0qgx33n1xNBGetJo
X-Gm-Gg: AYBFou0rc2P7Zn5iLR/c1gwo1AI3KDDfiTbRLG9m9EwCpR6NYMUh5RziZ+an4BPCX16
	k960xo9Qyr5JgRz2CqdYsxaIqcqvaUK7zvkOs6I310Jh+0D9mqyDMNuvmcpADPx51sLTsexZOAW
	GkPI+nfTcPNSfttrAqEXpnBBwUEuVmv7CVH9tf+LxgVSXS0oZJMpW1TVKkjl7X3S3kO/bYcQtUE
	yPOzjGh4J6EQD9G7ot9b6+8tnuSRWw/2ykD6LvNSInjITBY498sSQkJjBHye+oA10vLyr7+xYnO
	wt8zFRw5CU5b92M+DGdGdfmEzCPc9lSjBkBvoDCBcIMKjv69IjMnZySUKhbo6XdfEVbC4FJuwci
	seegg+GemYWlKwRn3LmG3HG6+9dQgYg462qcKd4gGJCIsCAq08QpbgDwJJJG0SALNn+k/Idnm9/
	CBOnDRLq2UnwHhfRqCmTFlxYnGikBpCpxYxRJU6uR1ZYuuawp/EhOew1WSycnzYQ==
X-Received: by 2002:a17:90a:d005:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39bac4571c4mr3556469a91.24.1788914104697;
        Tue, 08 Sep 2026 17:35:04 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm34649650a91.11.2026.09.08.17.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:35:03 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 08:31:57 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
Message-ID: <aqCZtP9WEhlWaLfh@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-2-coiby.xu@gmail.com>
 <30053e95-1f02-485c-9e92-19e688c5ed0c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <30053e95-1f02-485c-9e92-19e688c5ed0c@linux.ibm.com>

On Sun, Aug 30, 2026 at 12:37:32PM +0530, Sourabh Jain wrote:
>
>Nit: I feel 2/9 should be the first patch.

Thanks for the suggestion! I don't have enough experience to tell which
problem is more likely to happen. But [PATCH v4 2/9] will depend on
[PATCH v4 3/9] in next version to only acquire configfs mutex lock when
is_dm_key_reused=False.

>
>The changes on this patch looks good to me. Feel free to add:
>Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Thank for ack'ing the patch! I'll send a new version to address a memory
leak issue pointed out by Jinjie. I think the change is not trivial so
it's better to not add your Reviewed-by tag.

>
>- Sourabh Jain
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

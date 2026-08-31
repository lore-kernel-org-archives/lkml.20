Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B913A58598B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184210; cv=none; b=apbVj3PGJdN+rrRztEp6UnYdBA1xWJqUi3mLcHu0atYjuqkxm1aAp4b8LBxArAuF/IRSrdjiZlsSs8rHU9ePYoPt9yqgbcyocqwYQnwUQLQKPkhu2jhiqEN/RaKcpF3XBUCVA67kzL4nJFtjF0njGg+slNYHX4TuzLxIB1lkuKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184210; c=relaxed/simple;
	bh=qV/E0Evi/gbxfTQ7L8xHSZyilSK1WumEYKQlwcG6Zoo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUd2XW7ZB7UCvOhlwaWt491TORbua8i1pGB44/Lsi/WssVR8kr7eUkwhKtsu+Okv9JmRYh/0uFJMW4pLRc7dMl1NjmOkL+Kh4Crv69GqDQCvVRh7dkRJmidXT+7KTNsNAPjoSDt6dL1DD6xlT6Q8ixhXVAs6Znk4/ZIoccRDgRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBfUW+RI; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBfUW+RI"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39266382df6so2901047a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184208; x=1788789008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QGck5j6NKMY1JnPT10nWl78AbcbhkttqeTGSe2kPwRs=;
        b=PBfUW+RIN8UbgoQnhO8yMYSf2XmtfF2vHGOBVYhzqAp7N/PHTaelt2jmAqmrY/vwHf
         yMx2uV1N4fPTZikkFdg/yvEMV4gIs60c5O3oNJFS7xWIWqH9qsGmDJ7fCiAZUTNrJW7F
         vqqsJ6WVxqmK55hcZvaa3ABH9pZTXQvD2tpY18DX4EHCWSMW0g4sM69GjoSDeUh3LNTd
         bBOC195merRCrK7m4fBI3B9iWGynXamvCwMe3HJZNqx7Xl0b3z8feNW2joLHtdNuAZZw
         C80UAQQ7eZQ6liiNBPFGoDqQziNIjFNjiU4SHKSFsv/LHHehJi6Fb1qoLlObqFoz376u
         9MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184208; x=1788789008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGck5j6NKMY1JnPT10nWl78AbcbhkttqeTGSe2kPwRs=;
        b=TDTYASOfz7UlhzXu8A4FwJ03GktVhuVWD0/l14v0kZ7UZhwhAxR9f7cim6OE+gMwUZ
         Y3YQh17DGzZ3qE3ebD/qB77BIfnaiWAcmEwxVkycbqnXYyH3i+LVNOlbykL14cXgQ3J1
         MRIpae47enJcxbZFgdCFsNd4vuq/+IULIHWhD5ws1cqx+/Vt8HzNrCM402cHa9RbFMKN
         hi28hXTH5FocfOqS8v0en+ZnfUNbGWxvKIqJBm+FAxboy5QbISrMSkpYwhhAYS8AtPPQ
         cCNSzsWNZ6do3SubHSel7MCTdIEcwu5X2uSCZzqUH06P3H1ZMI46VjFoFAqg3ku61EDL
         uceA==
X-Forwarded-Encrypted: i=1; AKwUvBw6vJHey4C0A5JedZH4YddVJ3hIvuuLu4n+8QoMQUETpWiXo7qGIdhrWfD8SOqOOHFrn3Lv06I0XTlenFs=@vger.kernel.org
X-Gm-Message-State: AFuF++ns4p7JpOlKIc4w2EdB/W2gjnq++u2D1hOoGD8/yHnOgncXStRT
	bEELEs9lYlidjwNaNe+pO5zNE3L8tFFxZmYPQI2CG3QyB5i5oUL995f8
X-Gm-Gg: AYBFou0FKNf3LfNHjwQVrajEeJ8TkmswjrdRGA0jFDOSbbmwPTUSMQLryW91XyCmuJE
	uqzv6hYawg1CYSAKYceC7a55f/hHaV6J47ZoKemlegn4SlZ2AzShy0f2P1C+3LHnKRXd9Ayyoe8
	tSuPeZnyh8UJn8a0ZRCDMEEqMDEhPsiq4uaqMssob1bOjVn/YIUsMweV6uIN0R0RJ3fgXyVftf/
	Ycth5qvez1vgK+aBfFCf6SOe2GtXmcE/NlrvRqPmvEA4c9oWpoPRuJ89vVv1vACxYvwpFH1igm/
	CAdR1UTX/LHRw7SzzrTsJzI0EVhj9du73sFoycwT0IrR48d9wx9Izd4LkuX9f2CcLF+7mNHBr51
	c4J47JpqquYmUMaRHsLbu9gX+LFSzMiEIVi9FYxP7yS/EwS0R8zFy+4D7OvuJ7ybdy3eSJle0x0
	eBCFbKn20cK7RBRl25/g5prudB+d+CuMDeg05JjS5qapV/Vtm+EVkofA==
X-Received: by 2002:a17:90b:3c05:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-39907ab0955mr1271319a91.5.1788184205245;
        Mon, 31 Aug 2026 06:50:05 -0700 (PDT)
Received: from localhost ([45.112.44.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm33354998eec.0.2026.08.31.06.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:50:04 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 31 Aug 2026 21:45:41 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/9] crash_dump: Read the number of dm-crypt keys from
 reserved memory
Message-ID: <apWDnUNUZSkvYY38@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-4-coiby.xu@gmail.com>
 <859d4e5f-c491-4a0d-a7ea-0a16159f8059@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <859d4e5f-c491-4a0d-a7ea-0a16159f8059@linux.ibm.com>

On Sun, Aug 30, 2026 at 12:49:42PM +0530, Sourabh Jain wrote:
>
>
>On 28/08/26 14:18, Coiby Xu wrote:
>>In case user adds/deletes the keys by mistake, it's safer to read the
>>number of keys from reserved memory.
>>
>>Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>>Reported-and-Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>---
>>  kernel/crash_dump_dm_crypt.c | 36 +++++++++++++++++++++++-------------
>>  1 file changed, 23 insertions(+), 13 deletions(-)
>>
>>diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>>index 026c7de4ad85..0b9e09c60745 100644
>>--- a/kernel/crash_dump_dm_crypt.c
>>+++ b/kernel/crash_dump_dm_crypt.c
>>@@ -89,21 +89,31 @@ static int get_keys_from_kdump_reserved_memory(void)
>>  {
>>  	struct keys_header *keys_header_loaded;
>>  	size_t keys_header_size;
>>-
>>-	keys_header_size = get_keys_header_size(key_count);
>>-	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
>>-	if (!keys_header)
>>-		return -ENOMEM;
>>+	int r = 0;
>>  	arch_kexec_unprotect_crashkres();
>>  	keys_header_loaded = kmap_local_page(pfn_to_page(
>>  		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
>>+	if (keys_header_loaded->total_keys <= 0 ||
>>+	    keys_header_loaded->total_keys > KEY_NUM_MAX) {
>>+		pr_warn("keys_header saved to reserved memory may be corrupt\n");
>>+		r = -EINVAL;
>>+		goto kunmap;
>>+	}
>>+
>>+	keys_header_size = get_keys_header_size(keys_header_loaded->total_keys);
>>+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
>>+	if (!keys_header) {
>>+		r = -ENOMEM;
>>+		goto kunmap;
>>+	}
>>+
>>  	memcpy(keys_header, keys_header_loaded, keys_header_size);
>>+kunmap:
>>  	kunmap_local(keys_header_loaded);
>>  	arch_kexec_protect_crashkres();
>>-
>>-	return 0;
>>+	return r;
>>  }
>>  static int restore_dm_crypt_keys_to_thread_keyring(void)
>>@@ -447,12 +457,12 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	mutex_lock(&config_keys_subsys.su_mutex);
>>  	mutex_acquired = true;
>>-	if (key_count <= 0) {
>>-		kexec_dprintk("No dm-crypt keys\n");
>>-		return 0;
>>-	}
>>-
>>  	if (!is_dm_key_reused) {
>>+		if (key_count <= 0) {
>>+			kexec_dprintk("No dm-crypt keys\n");
>>+			return 0;
>>+		}
>>+
>
>Not directly related to this patch, but I have a query.
>
>Do we really need to take config_keys_subsys.su_mutex when keys are
>reused? If not, how about moving the acquisition and release of
>config_keys_subsys.su_mutex into build_keys_header()?

Good suggestion! I'll try to apply it to next version.

>
>
>- Sourabh Jain
>>  		r = build_keys_header();
>>  		if (r)
>>  			goto out;
>>@@ -463,7 +473,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	 * cleaned up at the end of kexec_file_load syscall
>>  	 */
>>  	kbuf.buffer = keys_header;
>>-	kbuf.bufsz = get_keys_header_size(key_count);
>>+	kbuf.bufsz = get_keys_header_size(keys_header->total_keys);
>>  	kbuf.memsz = kbuf.bufsz;
>>  	kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
>

-- 
Best regards,
Coiby

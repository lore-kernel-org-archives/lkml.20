Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49624CC262
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281090; cv=pass; b=cJ8pDHqqRttpT9VylKyXUzobTBDodpq/xRn+M7iN/a56AafKquZ32WWc4PWLsuBiSydeLPOlWGWEifX/x7yBF8EcWp9TQ9mfsit5yP/2uUL3avUCWNI5xtxyDfGUtT0RbYASPMUYtcnZcZPIv+PKkTtUyIar8kHyizhd0yQ/MWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281090; c=relaxed/simple;
	bh=WCw2gn45vII84Ocx/eT6cFc0z1dFWIpvLNO16qTGocA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1wecAE+02ANvs6I5GVFCPEXrLR8uHXMyWp3koT9/q2vJSm8O13M1gY3LrAhV5kT5FxV3ocWrpSmoE9MAD5+WRxoxOVQnVPSMkrGJFRAgNsiZGhEZpksjGF5T5FjNE05qRwUYW3lg3LZ3Hgp8i2vGsNv+cGVGBUf6ncgVS+2/Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wDivcwHP; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wDivcwHP"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd6so2197561cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281085; cv=none;
        d=google.com; s=arc-20260327;
        b=q+hYebIMv1tFzfk83v0MkwngwY6foar9F5qGzBAQxInFJ3MOwA/G9CIl+MyzP/nEGq
         a2EusryGNzmbHqXQk8L3W7xzvXJOcYaMjt9zpDkfzCN6TDhhiiS73HB0/HbyOEPcIg/C
         EFpNoq/k1fhpl+xpQgNpoh7eLNOueL+5EDkfoR7c/08NUOmSDw1I/o1pSUIVpqjCrLrB
         vXbMiA/wbZS8EK157+iYjC9G71nMyJZJuz3F03zc5jHkqHsUteWTXeC7KBcDoPMfw1KQ
         iOfnMMiw1xuPUv8Vk7wGrHl95EFG3RFh/mrEtd7WzoEgQEZATEZPRdPUXnqP97cDA33d
         T0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QBGVgj+tythBrBi/PqergSuSJVxrTXUmcS2GUJvv1eI=;
        fh=7c9BNCRJt08LUkKO2sIhuBWQEJf7FXkeq7HRulL5IKE=;
        b=WhokH/4dv6FQheA6Ah+jxKjORK1wUOwFIK3rC2tfWTyOyUkjus6jxIzpGiJW0VvAZf
         39etLTYD+y2NW0IH7vTKK673F2UrOByl76SA/YKVwX6zYe3Gwu43+MJimM0NBRb1C4vi
         a/eoHZHoMcC20Wr2O6hhtd3p7WMcafyDmS/MdJNl4o8tK/VfpyBSwp0Y8Ab9+SOi4wnZ
         AIuAJMb9PyJvT3/IdMA85kK96XLuPnhSYrT1MRxFsbpF6H13fx60iRlkkK1i/bk5cWpk
         nNnnYLCdW+74LdVWNh8CfpGTVYxCHInaAtshDo3QLmrkx4LWL86jqvJ/72iVsBJrYDGw
         30gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790281085; x=1790885885; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBGVgj+tythBrBi/PqergSuSJVxrTXUmcS2GUJvv1eI=;
        b=wDivcwHPGPOlde58g2OSXn4TN2lo24ZZMq0FUqlvYmE5qUKx4Iu1ecDl1uhHAtpqcx
         qhzIuyLp+FSAGRU6QeFvOcPNp6ya5HEO1hm2ntfNk7Bkh8DVk/4ZapA29UDOAuKk3Bip
         n1L8UYrf8X21RhIZktqoedu1ItF1NE+6y4fts4mcao7HWO8oG/HcboQssa5imUSuYZwn
         hxanAa4x4vElMoQCclcz+bx5epPaQJAiABFvjCXTF0oGAFSV1Nog7vATz86Z4vs3jjY8
         fch3WOBSHY7lR2NDqxjiHhXrjjrjtIHxKQfOSeASpdS1Hc+0JJipQegnUF6hQm8LMnWH
         z1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281085; x=1790885885;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBGVgj+tythBrBi/PqergSuSJVxrTXUmcS2GUJvv1eI=;
        b=0lP5IicvGWpn3Zjq7XQx13hnQz5cZZvNp5eVjooHZ61GF0mHr5Ooy6cxvkUDh4eGlw
         nNMia4ELb4MhGsCfoSo8N0Zbc51c5ZHp03wqLBMZ6JDRwwDgkLDo4xbKNUqbvUEHkfN7
         uvRAx9jR6/soJksdEV1RYckZNOIY/x+/nLIpE8xVEeENaZue/Iv3vpBqKFfFjB/dwN+E
         Q/f2sJdthAta9ONJQzyppLFqBITl0sb0iMPtROwifqn0ChSiEBhe6YADNudOJclaPXJ+
         AHZEPL/xnnhWWK+wiQajshNxtYLhRaK1unko4qnKC/XDG+h7k1P4ry32urdNmODPWuUU
         M5nA==
X-Forwarded-Encrypted: i=1; AKwUvByTqHpxx2bIKEjEXJ8fOJntICx7ucGhrkfCQf1qr3gB5v86kTKWmAC00+4BE8mLkhsjxVx1bEj39pm0Vg8=@vger.kernel.org
X-Gm-Message-State: AFuF++kRuQqJUZXbRD+ISSaGLbIZ3FHbJ0SGFY2YBD9+OsKf8RkF8A36
	76eYT/2GghDlC0hJAu6uWobPG84D8V0ZZCmKbTI8miIlnbpDlGfZUujduXUGxG3voJCHmhCpkxJ
	ewrhlJVrAgWq78fLRbEJw1LJQfgL97LR/NfDl0DRU
X-Gm-Gg: AYBFou16ydkFVA8tyLDdDFFwO3UxKFO8vXCMTzXImBQ4JQqV0b/qGzma0pUylQ/Ci7o
	JpjvKau12knPT8xrk0h2ymdsUUl4qbtuqTF3Y7cZ9C/jzsUBxReIqfGLB1I3IymV30twEerw1se
	l7dN0/hLwRdmfo+aZLwEnjbBwHbf8merA/UY8MrHoQUWp26bLylY8lXTFwJQmpx+m0pt0JRWl8J
	rO6h3kj3AxMLmFtOBRJnhzmvE+w+ecIsw24UK/Jj4HxctrewON0leTICOihdK02WE/s+K1kE4iA
	oSFmOa/ffUlPTehvNqIzStZeO/MO5ubbQ+invV6FlPyISscyVuoJY1WyB2nRrh8jbtfYpCERqei
	beSs4B4DGeXA6jQ2m7t1B0cBDqItLX5yL3AeLAi3k
X-Received: by 2002:a05:622a:1929:b0:530:39f3:6c97 with SMTP id
 d75a77b69052e-5330b5d9cabmr8005731cf.23.1790281084603; Thu, 24 Sep 2026
 13:18:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 13:18:03 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 13:18:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <arV4SS8FHwd6Qjs1@google.com>
References: <20260922001332.1121266-1-seanjc@google.com> <20260922001332.1121266-5-seanjc@google.com>
 <CAEvNRgH6w_a9+2rOr6r+47JqWc+-8cHq=c7r76nYG2i5deOxSg@mail.gmail.com> <arV4SS8FHwd6Qjs1@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 13:18:03 -0700
X-Gm-Features: AclHuK8uuzVx5nBkZDbrNNnKgfjVlHqa2a8lnAuZN2pbSVnhV_1XJvg71mB7VzU
Message-ID: <CAEvNRgGvCha=jc0TW9RcTN79xhM61kW-tjrGsy+MxUv1sE7cKQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] KVM: guest_memfd: Split bind() into
 prepare()+commit() phases
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>, 
	Dennis Tighe <dtighe@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index a13445c26d9d..d1e502d3246b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1003,73 +1003,61 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  	return __kvm_gmem_create(kvm, size, flags);
>  }
>
> -int kvm_gmem_prepare_memory_region(struct kvm *kvm, struct kvm_memory_slot *slot,
> -				   unsigned int fd, uoff_t offset)
> +int kvm_gmem_prepare_memory_region(struct kvm *kvm,
> +				   const struct kvm_memory_slot *old,
> +				   struct kvm_memory_slot *new,
> +				   enum kvm_mr_change change)
>  {
> -	uoff_t size = slot->npages << PAGE_SHIFT;
>  	struct gmem_file *f;
>  	struct inode *inode;
> -	struct file *file;
>
> +	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(new->gmem.pgoff));
>
> -	BUILD_BUG_ON(sizeof(gpa_t) != sizeof(offset));
> -	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
> -
> -	if (WARN_ON_ONCE(slot->flags & KVM_MEMSLOT_GMEM_ONLY))
> +	if (WARN_ON_ONCE(change != KVM_MR_CREATE))
>  		return -EINVAL;
>
> -	file = fget(fd);
> -	if (!file)
> -		return -EBADF;
> +	if (WARN_ON_ONCE(new->flags & KVM_MEMSLOT_GMEM_ONLY))
> +		return -EINVAL;
>
> -	if (file->f_op != &kvm_gmem_fops)
> -		goto err;
> +	if (new->gmem.file->f_op != &kvm_gmem_fops)
> +		return -EINVAL;
>
> -	f = file->private_data;
> +	f = new->gmem.file->private_data;
>  	if (f->kvm != kvm)
> -		goto err;
> +		return -EINVAL;
>
> -	inode = file_inode(file);
> +	inode = file_inode(new->gmem.file);
>
> -	if (!PAGE_ALIGNED(offset) || offset + size > i_size_read(inode))
> -		goto err;
> +	if (new->gmem.pgoff + new->npages  > i_size_read(inode) >> PAGE_SHIFT)
> +		return -EINVAL;
>
>  	/*
>  	 * memslots of flag KVM_MEM_GUEST_MEMFD are immutable to change, so
>  	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot

Just noticed, this comment needs to be updated for the new function name.

>  	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
>  	 */
> -	slot->gmem.file = file;
> -	slot->gmem.pgoff = offset >> PAGE_SHIFT;
>  	if (gmem_in_place_conversion || kvm_gmem_supports_mmap(inode))
> -		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> +		new->flags |= KVM_MEMSLOT_GMEM_ONLY;
>
> -	/*
> -	 * Gift the caller a reference to the file.  The reference will be
> -	 * dropped after bindings are established, or if installing the new
> -	 * memslot ultimately fails.
> -	 */
>  	return 0;
> -
> -err:
> -	fput(file);
> -	return -EINVAL;
>  }
>

Looks like const struct kvm_memory_slot *old is unused, though you
already told yourself that. :)

> -int kvm_gmem_commit_memory_region(struct kvm *kvm, struct kvm_memory_slot *slot)
> +int kvm_gmem_commit_memory_region(struct kvm *kvm, struct kvm_memory_slot *old,
> +				  struct kvm_memory_slot *new,
> +				  enum kvm_mr_change change)
>  {
> -	struct gmem_file *f = slot->gmem.file->private_data;
> -	struct inode *inode = file_inode(slot->gmem.file);
> +	struct gmem_file *f = new->gmem.file->private_data;
> +	struct inode *inode = file_inode(new->gmem.file);
>  	unsigned long start, end;
>  	int r;
>
> -	if (WARN_ON_ONCE(slot->gmem.file->f_op != &kvm_gmem_fops))
> +	if (WARN_ON_ONCE(new->gmem.file->f_op != &kvm_gmem_fops))
>  		return -EIO;
>
>  	filemap_invalidate_lock(inode->i_mapping);
>
> -	start = slot->gmem.pgoff;
> -	end = start + slot->npages;
> +	start = new->gmem.pgoff;
> +	end = start + new->npages;
>
>  	if (!xa_empty(&f->bindings) &&
>  	    xa_find(&f->bindings, &start, end - 1, XA_PRESENT)) {
> @@ -1077,7 +1065,7 @@ int kvm_gmem_commit_memory_region(struct kvm *kvm, struct kvm_memory_slot *slot)
>  		return -EEXIST;
>  	}
>
> -	r = xa_err(xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL));
> +	r = xa_err(xa_store_range(&f->bindings, start, end - 1, new, GFP_KERNEL));
>  	if (r)
>  		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
>
> diff --git a/virt/kvm/guest_memfd.h b/virt/kvm/guest_memfd.h
> index 01bd359d27e3..63723ffee0a5 100644
> --- a/virt/kvm/guest_memfd.h
> +++ b/virt/kvm/guest_memfd.h
> @@ -8,9 +8,13 @@
>  int kvm_gmem_init(struct module *module);
>  void kvm_gmem_exit(void);
>  int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
> -int kvm_gmem_prepare_memory_region(struct kvm *kvm, struct kvm_memory_slot *slot,
> -				   unsigned int fd, uoff_t offset);
> -int kvm_gmem_commit_memory_region(struct kvm *kvm, struct kvm_memory_slot *slot);
> +int kvm_gmem_prepare_memory_region(struct kvm *kvm,
> +				   const struct kvm_memory_slot *old,
> +				   struct kvm_memory_slot *new,
> +				   enum kvm_mr_change change);
> +int kvm_gmem_commit_memory_region(struct kvm *kvm, struct kvm_memory_slot *old,
> +				  struct kvm_memory_slot *new,
> +				  enum kvm_mr_change change);
>  void kvm_gmem_unbind(struct kvm_memory_slot *slot);
>  #else
>  static inline int kvm_gmem_init(struct module *module)
> @@ -20,15 +24,18 @@ static inline int kvm_gmem_init(struct module *module)
>  static inline void kvm_gmem_exit(void) {};
>
>  static inline int kvm_gmem_prepare_memory_region(struct kvm *kvm,
> -						 struct kvm_memory_slot *slot,
> -						 unsigned int fd, uoff_t offset)
> +						 const struct kvm_memory_slot *old,
> +						 struct kvm_memory_slot *new,
> +						 enum kvm_mr_change change)
>  {
>  	WARN_ON_ONCE(1);
>  	return -EIO;
>  }
>
>  static inline int kvm_gmem_commit_memory_region(struct kvm *kvm,
> -						struct kvm_memory_slot *slot)
> +						struct kvm_memory_slot *old,
> +						struct kvm_memory_slot *new,
> +						enum kvm_mr_change change)
>  {
>  	WARN_ON_ONCE(1);
>  	return -EIO;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 9fff2f4bf2f1..70d70042a9ce 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1681,6 +1681,12 @@ static int kvm_prepare_memory_region(struct kvm *kvm,
>  {
>  	int r;
>
> +	if (new && (new->flags & KVM_MEM_GUEST_MEMFD)) {
> +		r = kvm_gmem_prepare_memory_region(kvm, old, new, change);
> +		if (r)
> +			return r;
> +	}
> +
>  	/*
>  	 * If dirty logging is disabled, nullify the bitmap; the old bitmap
>  	 * will be freed on "commit".  If logging is enabled in both old and
> @@ -1952,8 +1958,8 @@ static int kvm_set_memslot(struct kvm *kvm,
>  	if (r)
>  		goto err;
>
> -	if (change == KVM_MR_CREATE && (new->flags & KVM_MEM_GUEST_MEMFD)) {
> -		r = kvm_gmem_commit_memory_region(kvm, new);
> +	if (new && (new->flags & KVM_MEM_GUEST_MEMFD)) {
> +		r = kvm_gmem_commit_memory_region(kvm, old, new, change);
>  		if (r) {
>  			kvm_arch_free_memslot(kvm, new);
>  			kvm_destroy_dirty_bitmap(new);
> @@ -2133,11 +2139,16 @@ static int kvm_set_memory_region(struct kvm *kvm,
>  	new->npages = npages;
>  	new->flags = mem->flags;
>  	new->userspace_addr = mem->userspace_addr;
> -	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD)) {
> -		r = kvm_gmem_prepare_memory_region(kvm, new, mem->guest_memfd,
> -						   mem->guest_memfd_offset);
> -		if (r)
> +	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
> +#ifdef CONFIG_KVM_GUEST_MEMFD
> +		new->gmem.file = fget(mem->guest_memfd);
> +		if (!new->gmem.file) {
> +			r = -EBADF;
>  			goto out;
> +		}
> +
> +		new->gmem.pgoff = mem->guest_memfd_offset >> PAGE_SHIFT;
> +#endif
>  	}
>
>  	r = kvm_set_memslot(kvm, old, new, change);
> @@ -2148,7 +2159,7 @@ static int kvm_set_memory_region(struct kvm *kvm,
>  	 * the file is closed before memslots are destroyed.
>  	 */
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> -	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD))
> +	if (new->gmem.file)
>  		fput(new->gmem.file);
>  #endif

And this LGTM too. Thanks!

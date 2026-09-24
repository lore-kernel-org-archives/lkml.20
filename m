Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602FF357D0C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268740; cv=pass; b=EFPfHaaTezsj10RuBB0EQ0jN3Pjpa0ZJAwRfdhYuDB1lyChMTOonkIznGxzX2vOvmmh1BTpDB9Ygd4QT6xVxZ9Sk8M/xxImQHwGUP/iaHlMvk1PuNBqz0rOhEf54X1S2Jfa6hyG24kJpgTZFk6kHPooScvLXObTmHZ6sgCcoR8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268740; c=relaxed/simple;
	bh=AViS3cDaP0HpgTLSMDzDsnGkbQ/9qjT7oXFe8Ol1+ZA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXdYykjg0B7Ykvl6s+IpIg9KkPY1qVStL1mXIfHxIAuM3VJsw4+2r87GOVH+GZF2+DpmeNa2fs3rVSuURq0lezCzil+ct7JQilHsJgLhzww5dwRETGAZ0bZIXm3FA9mHQfGbBmXJ+8IlDk4bpED5ZFs4aU/sJceqPPDEfDwg9l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qUcsfwbc; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qUcsfwbc"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91071ba92a8so719796d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790268737; cv=none;
        d=google.com; s=arc-20260327;
        b=JwoaBb5PWdhHCyM9IOqzR0E7pVTrsbJd0kS+inKG4NLw/sUKWrM/BiiZaTdirvv6QS
         XPwigq1y4vlt0kNXNDYNTsVU0hP/IUKWeg8nYLj2pHgs6ZBjcdHyF2GgVXxE5aUSU5dq
         +OmW7DV9Xji7H7nDlZwNWJtHzRqhP7iFC0CaKuVG34mI1z5SSWVPmJ/o7kGitIs7242v
         MmdSDNBT0fsEBoDc80b9SMaCB5J9AoiplSU6A/6Fw16HKcGiBfwo4HS/glfiYcLBZYFW
         mCTI21zGC8v3zeCUU5liqp2w8vXOqU5jo5Thgc62ugKr4Ynjqd5kO0ST6wq60pv5EMOP
         ctRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=4ZlqXzuHxCcJl9k4eaYi9L9cPYXoqaQPIB66Swf9mRc=;
        fh=9r2Z7lN5owZE1LIqRoFYIZELtVjzyAcXSZe9rcvv3l4=;
        b=iV5OJUtusqrB0urBFPFoQlToSLElQeY0LPzmEsm+qlupcZKXT+9amLSVc+VtBbaANr
         gdwanu5Qdp4PQx/M2igFSF24pHOdT2czqGRGf4iP3bWkQibQRGFBEykWOyLJuC1MYAUA
         KOdWGzJ9Xe0O+XV58K6E0EBlmx6zJV6SGfKCMCu9v+735fSG/mMei/hlk11HjHlj1pdz
         WEeHUfTd3Zk1TFXuuGmAHw/KyY3s7g631mm3sagjCipDxHmJsgRai8z32Nae2fHCpG3M
         739EL01xli7prV4stThSYItvTclrsBPZJvneHQvr2co8vN595Xjq9ujQHdPG4wi5jBR+
         Rq6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790268737; x=1790873537; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZlqXzuHxCcJl9k4eaYi9L9cPYXoqaQPIB66Swf9mRc=;
        b=qUcsfwbc8cOAbfEAaqgfTS5HU10yq8xKDzQDTzkHQOcDcPfeZQZbWY9zF2W8/Ao6ca
         Vkq/nBlS/BSal4xUFFUtFmMqBSVpfyKcWTd8MkiBljLIOzaqRby0H2x8ndo5g1scpkuq
         LHxBeX86aBpawuJCBk3AS3QSzPRpVa/cNYovZS8GBs8vg4occVbnxRbrPnr+Pqrj9Nk1
         7Bgtovuv5oSS4s43J28szIQsCwy4a08y9dG4P/4H91VIV1vRBmw8aCFOdWS6/6iZ9ieX
         qAGtV1pxmCnr824qyFKPxgaMMbG0I9WqWdG6ERQGZJ+0HM6UHMt9f3BQtiHqGebG4ydi
         eijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268737; x=1790873537;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZlqXzuHxCcJl9k4eaYi9L9cPYXoqaQPIB66Swf9mRc=;
        b=i2XkpXjvDb4a6/9DwQ0ipPZ95pRwZayoinh0yFe3QzDoJqtXBhSlwRtFjfCJoDNQFV
         O6ETpdPsIbUYVEOfsPIN1YBQyg3wVZqm3QbAWxENSr5V0LPRlP7BB5Y5iSLTLwrq2ahF
         USrzVzJDYBv1s0cUR3ECKLLvIcS+3XtTyhZkV7+MTtzMe4uDOQ9zWo8bX7rhQZUlbi21
         V1iFy9J0Q34nLpk9NWIJpszHbQp7elvSgZD2XmP/X7yW+pE1D6TDDgIBgSpTu42WHc0l
         AwjOWZXHezTNdAZrYaSmgGe0hPH/sIzyDDknj6Q5MrP0arTXt/BE/dUjYQ2mFbIhB5IM
         cqwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtw5CO6xe0XmdFNvGP91Frr4Y9JHwIgOTQZUz2ErM75UhhcQwbVsLYsRM6Scwxt6SyEg2o2OEyd9oZ1hU=@vger.kernel.org
X-Gm-Message-State: AFuF++lO2rbyBmO6eCvjaHnhlhf6wvsMSeAmn9TjC95F+bm9KUExdkzU
	JNjC8oPLKjlJjHU94JCEtUgZWeRURUsSQCY3w6HkTD8JmhpYvQBegd3HK3qqlVBpEuuEV8eEsl6
	Qs45wcLJMLLcJA0QC98mVqgyu06qn6Fxwujiu2EgO
X-Gm-Gg: AYBFou0GTw8gvige+xcUR8CJneqg5CBZduhPP65Ir8tv9LTz+ojwyVi8cUL8YnbyORR
	LLmOJTo1c+0PV06WXb6Jsot0uu7vq7tRjzbz5RXmSRaTQYZNGWhLWCOQLbDPoEUFHlujwbbnSax
	KFGgOJ0ykznF8WlmVwP3+vE1oAnqR3eRcysiL0i+S3mfBv7tb4LjJSfrgBlhXH5yT487bvjr/uL
	iF8md6SzL+rD6SLXs6qRUTj58k4U5w3HozzHbmv8sy+Oedgk2GjhkRLmiXPz4cFGwrd8XRX3jUY
	vSIjpNU/UzmqH6MUUrROwhJ8KaYcZ7UgKYW/2osZiZ33rcAils5fyc6B1P0UnZ1UNNvHHidcikU
	RlgXeE5jJhdF//AfXHjyidbRnKt0Pljey69t5ob7xaZTpvxlmdXWU
X-Received: by 2002:a05:6214:540c:b0:90e:8dcc:4e5 with SMTP id
 6a1803df08f44-91421d9a356mr31463286d6.28.1790268736377; Thu, 24 Sep 2026
 09:52:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 09:52:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 09:52:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260922001332.1121266-5-seanjc@google.com>
References: <20260922001332.1121266-1-seanjc@google.com> <20260922001332.1121266-5-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 09:52:15 -0700
X-Gm-Features: AclHuK-S8czjDohuP8fBc53zFCaM0f7cr5Pede82lIJDoX5JwsFzvNqiPJ3dl9U
Message-ID: <CAEvNRgH6w_a9+2rOr6r+47JqWc+-8cHq=c7r76nYG2i5deOxSg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] KVM: guest_memfd: Split bind() into
 prepare()+commit() phases
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> Split binding a memslot to a guest_memfd instance into prepare() and
> commit() phases so that KVM can separate preparing the memslot from binding
> the memslot to the gmem instance, i.e. from committing the memslot.  This
> will allow waiting to commit the memslot+gmem binding until the memslot is
> fully prepared, which is necessary as the memslot becomes reachable when
> the binding is created.
>
> As a bonus, drop the unwind-on-failure from the commit phase (other than
> nullifying the bindings), as the only reason bind() did the full unwind is
> because it technically didn't own the memslot, i.e. "needed" to leave
> memslot in the same state it started in.
>
> No functional change intended (the unwinding down on bind() failure was
> effectively dead code since KVM simply deletes the memslot on failure,
> i.e. there was nothing that could actually observe the unwind).
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/guest_memfd.c | 68 ++++++++++++++++++++++++------------------
>  virt/kvm/guest_memfd.h | 19 ++++++++----
>  virt/kvm/kvm_main.c    | 18 ++++++++++-
>  3 files changed, 70 insertions(+), 35 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index c094611f7c7a..80932f4ec4a3 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -641,15 +641,14 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  	return __kvm_gmem_create(kvm, size, flags);
>  }
>
> -int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> -		  unsigned int fd, uoff_t offset)
> +int kvm_gmem_prepare_memory_region(struct kvm *kvm, struct kvm_memory_slot *slot,
> +				   unsigned int fd, uoff_t offset)
>  {
>  	uoff_t size = slot->npages << PAGE_SHIFT;
> -	unsigned long start, end;
>  	struct gmem_file *f;
>  	struct inode *inode;
>  	struct file *file;
> -	int r = -EINVAL;
> +

An extra empty line was added here.

>
>  	BUILD_BUG_ON(sizeof(gpa_t) != sizeof(offset));
>  	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
> @@ -673,44 +672,55 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	if (!PAGE_ALIGNED(offset) || offset + size > i_size_read(inode))
>  		goto err;
>
> -	filemap_invalidate_lock(inode->i_mapping);
> -
> -	start = offset >> PAGE_SHIFT;
> -	end = start + slot->npages;
> -
> -	if (!xa_empty(&f->bindings) &&
> -	    xa_find(&f->bindings, &start, end - 1, XA_PRESENT)) {
> -		r = -EEXIST;
> -		filemap_invalidate_unlock(inode->i_mapping);
> -		goto err;
> -	}
> -
>  	/*
>  	 * memslots of flag KVM_MEM_GUEST_MEMFD are immutable to change, so
>  	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
>  	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
>  	 */
>  	WRITE_ONCE(slot->gmem.file, file);
> -	slot->gmem.pgoff = start;
> +	slot->gmem.pgoff = offset >> PAGE_SHIFT;
>  	if (kvm_gmem_supports_mmap(inode))
>  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
>
> -	r = xa_err(xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL));
> -	if (r) {
> -		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
> -		slot->gmem.file = NULL;
> -		slot->gmem.pgoff = 0;
> -		slot->flags &= ~KVM_MEMSLOT_GMEM_ONLY;
> -	}
> -	filemap_invalidate_unlock(inode->i_mapping);
> -
>  	/*
> -	 * Drop the reference to the file, even on success.  The file pins KVM,
> -	 * not the other way 'round.  Active bindings are invalidated if the
> -	 * file is closed before memslots are destroyed.
> +	 * Gift the caller a reference to the file.  The reference will be
> +	 * dropped after bindings are established, or if installing the new
> +	 * memslot ultimately fails.
>  	 */

prepare+commit is nice :)

Reviewed-by: Ackerley Tng <ackerleytng@google.com>


How about this instead:

1. Move the fget() in kvm_gmem_prepare_memory_region() into
   kvm_set_memory_region()
2. Move the comment about not taking a refcount into either prepare or
   commit (I think commit is better). Both prepare and commit are
   supposed to be called with a stable file. I think commit is the stage
   where people usually expect a reference transfer, but in this case
   there isn't a reference transfer. Perhaps like:

	/*
	 * No reference is taken on the file, because when the gmem file was
	 * created, it already pins KVM. Active bindings are invalidated if the
	 * file is closed before memslots are destroyed.
	 */

3. Always fput(file) if fget() happened in kvm_set_memory_region().

The gifting seems a bit asymmetric to me. For gmem bindings, always
getting a ref on the file and always dropping would be more
symmetric.

Now that there is a commit stage, explicitly not taking a ref
on the file in the committing stage is clearer imo.

If you'd like to stack the above refactoring as a patch after [5/6],
here's my suggestion:


From 64bc0e119ba87c3642147f2bbb97f98636ffb23c Mon Sep 17 00:00:00 2001
From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 24 Sep 2026 09:08:51 -0700
Subject: [PATCH] KVM: guest_memfd: Hold file reference across memslot
 preparation and commit

Refactor guest_memfd's prepare + commit functions so that the caller is
required to hold a refcounted file pointer throughout prepare and commit.

This allows symmetrically acquiring and releasing the file reference in
the caller without having to gift file references across helper
boundaries.

Document (actually move documentation) that guest_memfd bindings should
not pin the backing file to the commit stage, where a new reference is
usually expected.

No functional change intended.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 virt/kvm/guest_memfd.c | 28 +++++++++-------------------
 virt/kvm/guest_memfd.h |  4 ++--
 virt/kvm/kvm_main.c    | 29 ++++++++++++-----------------
 3 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 826d26036926a..4cd1425d6fc38 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -642,13 +642,11 @@ int kvm_gmem_create(struct kvm *kvm, struct
kvm_create_guest_memfd *args)
 }

 int kvm_gmem_prepare_memory_region(struct kvm *kvm, struct
kvm_memory_slot *slot,
-				   unsigned int fd, uoff_t offset)
+				   struct file *file, uoff_t offset)
 {
 	uoff_t size = slot->npages << PAGE_SHIFT;
 	struct gmem_file *f;
 	struct inode *inode;
-	struct file *file;
-

 	BUILD_BUG_ON(sizeof(gpa_t) != sizeof(offset));
 	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
@@ -656,21 +654,17 @@ int kvm_gmem_prepare_memory_region(struct kvm
*kvm, struct kvm_memory_slot *slot
 	if (WARN_ON_ONCE(slot->flags & KVM_MEMSLOT_GMEM_ONLY))
 		return -EINVAL;

-	file = fget(fd);
-	if (!file)
-		return -EBADF;
-
 	if (file->f_op != &kvm_gmem_fops)
-		goto err;
+		return -EINVAL;

 	f = file->private_data;
 	if (f->kvm != kvm)
-		goto err;
+		return -EINVAL;

 	inode = file_inode(file);

 	if (!PAGE_ALIGNED(offset) || offset + size > i_size_read(inode))
-		goto err;
+		return -EINVAL;

 	/*
 	 * memslots of flag KVM_MEM_GUEST_MEMFD are immutable to change, so
@@ -682,16 +676,7 @@ int kvm_gmem_prepare_memory_region(struct kvm
*kvm, struct kvm_memory_slot *slot
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;

-	/*
-	 * Gift the caller a reference to the file.  The reference will be
-	 * dropped after bindings are established, or if installing the new
-	 * memslot ultimately fails.
-	 */
 	return 0;
-
-err:
-	fput(file);
-	return -EINVAL;
 }

 int kvm_gmem_commit_memory_region(struct kvm *kvm, struct
kvm_memory_slot *slot)
@@ -715,6 +700,11 @@ int kvm_gmem_commit_memory_region(struct kvm
*kvm, struct kvm_memory_slot *slot)
 		return -EEXIST;
 	}

+	/*
+	 * No reference is taken on the file, because when the gmem file was
+	 * created, it already pins KVM. Active bindings are invalidated if the
+	 * file is closed before memslots are destroyed.
+	 */
 	r = xa_err(xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL));
 	if (r)
 		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
diff --git a/virt/kvm/guest_memfd.h b/virt/kvm/guest_memfd.h
index 01bd359d27e30..7e9d12e4531ff 100644
--- a/virt/kvm/guest_memfd.h
+++ b/virt/kvm/guest_memfd.h
@@ -9,7 +9,7 @@ int kvm_gmem_init(struct module *module);
 void kvm_gmem_exit(void);
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
 int kvm_gmem_prepare_memory_region(struct kvm *kvm, struct
kvm_memory_slot *slot,
-				   unsigned int fd, uoff_t offset);
+				   struct file *file, uoff_t offset);
 int kvm_gmem_commit_memory_region(struct kvm *kvm, struct
kvm_memory_slot *slot);
 void kvm_gmem_unbind(struct kvm_memory_slot *slot);
 #else
@@ -21,7 +21,7 @@ static inline void kvm_gmem_exit(void) {};

 static inline int kvm_gmem_prepare_memory_region(struct kvm *kvm,
 						 struct kvm_memory_slot *slot,
-						 unsigned int fd, uoff_t offset)
+						 struct file *file, uoff_t offset)
 {
 	WARN_ON_ONCE(1);
 	return -EIO;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 90461880ff854..e783d0ee4cf9d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2019,6 +2019,7 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	struct kvm_memslots *slots;
 	enum kvm_mr_change change;
 	unsigned long npages;
+	struct file *file = NULL;
 	gfn_t base_gfn;
 	int as_id, id;
 	int r;
@@ -2126,7 +2127,13 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
 	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD)) {
-		r = kvm_gmem_prepare_memory_region(kvm, new, mem->guest_memfd,
+		file = fget(mem->guest_memfd);
+		if (!file) {
+			r = -EBADF;
+			goto out;
+		}
+
+		r = kvm_gmem_prepare_memory_region(kvm, new, file,
 						   mem->guest_memfd_offset);
 		if (r)
 			goto out;
@@ -2134,23 +2141,11 @@ static int kvm_set_memory_region(struct kvm *kvm,

 	r = kvm_set_memslot(kvm, old, new, change);

-	/*
-	 * Drop the reference to the gmem file, even on success.  The file pins
-	 * KVM, not the other way 'round.  Active bindings are invalidated if
-	 * the file is closed before memslots are destroyed.
-	 */
-#ifdef CONFIG_KVM_GUEST_MEMFD
-	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD))
-		fput(new->gmem.file);
-#endif
-
-	if (r)
-		goto out;
-
-	return 0;
-
 out:
-	kfree(new);
+	if (file)
+		fput(file);
+	if (r)
+		kfree(new);
 	return r;
 }

-- 
2.56.0.rc1.310.g51773c2048-goog

> +	return 0;
> +
>  err:
>  	fput(file);
> +	return -EINVAL;
> +}
> +

If the refactor above is not preferred,

I think this part at the end

	if (r)
		goto out;

	return 0;

out:
	kfree(new);
	return r;


Could be something like

out:
	if (r)
		kfree(new);

	return r;


>
> [...snip...]
>

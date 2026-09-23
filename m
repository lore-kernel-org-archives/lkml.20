Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB0486436
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173568; cv=none; b=oTpIDZN60UPeLD5FvlnMz/nACr/nBG3UcnGDXrRxy575Y9EFmFTUoO1FmflXCg4sI7Gu2iZH4/n8WcuuNWpc4uikN2sW16orL+mN0zmR7zv/jXUujGHqCqh53VLITKX5Yk48Cu1VkcgwaI/sM3TAIIt2N/HtDPzuH+l3Ha7HMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173568; c=relaxed/simple;
	bh=1YTFLJwnMY0NKNS2OtCc9bXobP2dlQvVFJHEkPGHysQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hB4SFW4UhD7NHm3HM593gDAwdxqgffHsngSQUpnM3VQUF/s1q7j5NrzDnytvR2WNakMKk6QFB3dJtgLInXuN8WOlaawobNNo/ksWHjWS6OsLrAUrw39AgAgtNjS4mIbXKWBGYkN3ewEsJu5FMZJgeETjVLYWrA9vlIFUL5K8ZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DLSyJIvf; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DLSyJIvf"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so727183a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790173565; x=1790778365; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MsYvpeTZi0d6eNTQmjhnZBm0jq5CS+fPYDZgBnoyFk=;
        b=DLSyJIvf3f2HgLtPguwy5YTilbWMovyKFfSO6n33Ot3bIzeTaGLZP9vCAEXsAkKsGM
         W1lYBjmgkljWoQF75H807xy6E6/6O5YucviCeE+bmn+4MjfQADCEl6x86h1lgl0hZFLo
         iA0Hpg2F01DcItjd0Fj+RDbZ1nqs0RQk+0oO/9aoOt+mSJmCI+3JOT1dS8hEY88BcX6Y
         pVcFxzpnI/ToojeBZRDO9hpNx2BXWxO0vqAZSynHUWAmtNdwO/9rErALxJM07bmDG9fo
         klL7N031IAJj3IEBPVnPvJLEkSVysJO1GVr+fFSET0UJ7ARFuc08EhEcp+Ptij0YyT0i
         rYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173565; x=1790778365;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MsYvpeTZi0d6eNTQmjhnZBm0jq5CS+fPYDZgBnoyFk=;
        b=MSb7ObwijTPyvkAm0og8QbEBZ4Yjog+w8hEsXpUUoW9n60TCXZGPhE2+3DReF4fkg7
         VHq7U5jzTidJ5g5/l4b4hUsF2ZF4AS1vmp+z34bnoDPZkQ9RO5HDWLPtUsRKCXnpVPx/
         RpOuJjTNt+ZtkYOnleATuCxY7HkKOrA2RadkRFxNuS3vSEAC5Kf/gl91fxcoXX1Ospsh
         YUyh5In9dOeCLME+wYXzuyGDQ+ruR7i8VbqjB3IdbnQg5PfVydvW1WaS8/yg46cvB3F9
         YCQn1aoDlwT7OrA/7lbK/rwixnV9/MyJjzB3rFt3QiT4qpE++ezIWZqUcsydUy8DWgJZ
         1Ogw==
X-Forwarded-Encrypted: i=1; AKwUvBykxf+sKnqQrEb16O4blXqzEASkkEAPdyGgyUO3DMb3r12F85QRDaqWOt+jd3hpEhU0PvbaxzcK5cQqrIc=@vger.kernel.org
X-Gm-Message-State: AFuF++m7diljipeFTvWHNgmAPk1b7C5S52WDTmxMZHNIin6GX8XViUjr
	J88nFNtOT8CBShYNA2u2B1f8sKFxv38J1QwGTJcLN8lQbN5OpZ0RrpugAbnYZOLUqbFhNMTLwJf
	re2NLPA==
X-Received: from pjqh22.prod.google.com ([2002:a17:90a:a896:b0:3a0:7f0d:4e59])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3142:b0:39e:6a7e:ee1d
 with SMTP id 98e67ed59e1d1-3a07e654a0emr2647265a91.41.1790173565202; Wed, 23
 Sep 2026 07:26:05 -0700 (PDT)
Date: Wed, 23 Sep 2026 07:26:04 -0700
In-Reply-To: <arNa66B3tmJc7Kbd@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922001332.1121266-1-seanjc@google.com> <20260922001332.1121266-7-seanjc@google.com>
 <arJsKA8MkSdpQxNm@yzhao56-desk.sh.intel.com> <arKG2UnTWySdOAkc@google.com> <arNa66B3tmJc7Kbd@yzhao56-desk.sh.intel.com>
Message-ID: <arPhfHnMNbvthwGu@google.com>
Subject: Re: [PATCH v5 6/6] KVM: guest_memfd: Drop superfluous WRITE_ONCE()
 when binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>, 
	Dennis Tighe <dtighe@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, Yan Zhao wrote:
> On Tue, Sep 22, 2026 at 06:47:05AM -0700, Sean Christopherson wrote:
> > On Tue, Sep 22, 2026, Yan Zhao wrote:
> > > The WRITE_ONCE() in kvm_gmem_unbind() and kvm_gmem_release() are also invoked
> > > when the memslot is inactive and unreachable -- are they also superfluous?
> > 
> > The WRITE_ONCE() in release() is necessary, because the file could be freed/released
> > while it is still attached to a memslot.
> Ah, release() can occur on an active memslot, so WRITE_ONCE() is needed to 
> ensure the READ_ONCE() in get_file_active() works correctly.

Yep.

> > I _think_ the one in unbind() is now superfluous after 0ee2c883b62d ("KVM:
> > guest_memfd: take the invalidate lock when unbinding a dying file"), but that one
> > needs more analysis.
> Hmm, the line "CLASS(gmem_get_file, file)(slot)" in kvm_gmem_get_pfn() is not
> protected by the invalidate lock.

CLASS(gmem_get_file) can never be protected by the invalidate lock.  Or rather,
doing CLASS(gmem_get_file) while holding the invalidate lock is nonsensical,
because taking the lock requires a reference to the inode, and if you have a
(stable) reference to the inode, there's no reason to get a reference to a file.

> It should be superfluous even before commit 0ee2c883b62d, since "the caller is
> responsible for ensuring the slot is unreachable before unbinding" ?

Yes, I just haven't spent enough time thinking about it to be 100% confident :-)

> > > Do we need the READ_ONCE() in __kvm_gmem_get_pfn(), considering that other slot
> > > fields (e.g., slot->gmem.pgoff) are read without READ_ONCE()?
> > 
> > Yes, it's needed, because of the aforementioned release().  The other slot fields
> > are only ever modified when the slot is inactive, i.e. unreachable.  That's why
> > I think the unbind() WRITE_ONCE() is unnecessary; KVM should only unbind when the
> > slot is inactive.
> Maybe the READ_ONCE() in __kvm_gmem_get_pfn() is not necessary?
> When __kvm_gmem_get_pfn() is invoked, a file refcount must have been taken, so a
> concurent release() is not possible.

No?  KVM doesn't hold a reference to the file.  Oooh, you're not talking about a
long-term reference, you're talking about the reference acquired by kvm_gmem_get_file().

Oh, duh.  That READ_ONCE() is purely for a sanity check.

	struct file *slot_file = READ_ONCE(slot->gmem.file);

	...

	if (file != slot_file) {
		WARN_ON_ONCE(slot_file);
		return ERR_PTR(-EFAULT);
	}

So it's not strictly necessary, but since the entire point is to verify the slot
pointer hasn't been clobbered, we do want the READ_ONCE() to guarantee the check
is actually performed as intended.

But given that it should be impossible for release() to run concurrently (see
above), and should be impossible for kvm_gmem_unbind() to run on a live memslot,
then I'm pretty sure we can do this:

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index a13445c26d9d..1aeffb5bd2b0 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1130,14 +1130,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 					pgoff_t index, kvm_pfn_t *pfn,
 					int *max_order)
 {
-	struct file *slot_file = READ_ONCE(slot->gmem.file);
 	struct gmem_file *f = file->private_data;
 	struct folio *folio;
 
-	if (file != slot_file) {
-		WARN_ON_ONCE(slot_file);
+	if (WARN_ON_ONCE(file != READ_ONCE(slot->gmem.file)))
 		return ERR_PTR(-EFAULT);
-	}
 
 	if (xa_load(&f->bindings, index) != slot) {
 		WARN_ON_ONCE(xa_load(&f->bindings, index));

Or just drop the check entirely?   But I think it's worth keeping the check,
especially since __kvm_gmem_get_pfn() will run under the invalidate lock once
in-place conversion lands (see "KVM: guest_memfd: Introduce per-gmem attributes,
use to guard user mappings").  At that point, the check would actually provide
meaningful protection against KVM bugs.

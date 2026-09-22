Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E52E545DB9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086960; cv=none; b=DMRqcYYVgF1Q3HoNYjSlmWn7D9dPHlRZ83XYkONg9UrtWaCy77mZ3Mz+7sV44jlkP9E+sUcHH/CWo+Q9Z6Se0pbC1rqNCEzLIG8/Xov1E1wgp/bziwtTpo9nVJF5M0h7g6W+7rE65MXWlz2AT0t66uE/s3YtJE4hY7x5KOBvZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086960; c=relaxed/simple;
	bh=riuafCmkTkPBvgEasem6g/Rjz6oVl1IK9bQ68eKJ560=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XZSPw+GMAnZRAMG6TgZoTL3CSfmsnz4dUnRMkSoAFrjrLLWbY9F/WQgl+SRs0mBIz/OLJV5GnINLZSK1T5brxhpLjYdRNoouXPPZ6nTJ7mCMXlnowsk7xp3GvpaobIvaQ2HnL9KgosP5lnLknD/pltM9b/79xsFPQofHSv/XBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RJCxzK4w; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJCxzK4w"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7508680a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790086957; x=1790691757; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epWZK8RwacVhKdrC+bFLFuapKZC1iM5N0HUxIK8CzxI=;
        b=RJCxzK4wk72IPIJSi7Y3EL4b9ZKJ9nb6tW3ymM7XfSUzVthYGQS7XpDpflfFdU80zA
         duT7iFuRfJc5U1LjY5tLLvP1RnEqVbzcIBMnfuICZTRMX7CRozq1+veP7P8V+jYMawZy
         81Ty2eTeEmqg0a8QNmTImmkGbl7WdwwgksZSjeqqXc8oZ2OoszERjYQo30ln/G2MdzF8
         7LFAyDsTstcmYJmUHGEyDgxFogDzXIVrX7a0hTrABTTuNRKdTmTj8aTU18EA4PrjbmVb
         SGxIB7cyOZrK26clqxQ83LIRaZUakE2KKMRcwbW4wClcYH6LW9iu0oA/QzgWmpH9HrgG
         JU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086957; x=1790691757;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epWZK8RwacVhKdrC+bFLFuapKZC1iM5N0HUxIK8CzxI=;
        b=I14CRN79CCu9PwB1iXkkrhXnTFnHXyFbVP2QWCaiEXc1NqH391d/hgQQHx6RtjwGqd
         A+dkxY48DN6sSPCJFLc0cb0OxyNkuMtX+SAuoqxqxOO6g+LmIVdyPS4aZydGdyaTPt/J
         svG9EQ8IMSuvSnik+4xG3Mma8iBg+47xE3klflrG/5KuQTlsnoZdqw/COUOUVym0uFZq
         45EVftOrmvdwMSkkj6+SRLE8pYYqGaCKGrLoqPD6uy9ELLUTW0LF6RjqbWUBt88uD3FN
         epFyTgnY6NUgNlA58xe4Cv47Vs6VWQ1Hc7FzSZm0XLhx1EcAlYA0L3ijwHVCAmhEC7S5
         Ey/w==
X-Forwarded-Encrypted: i=1; AKwUvBwiZxFMu1yASopsve9EzeW3Y4cX4X0PkYZKOuPrBdSAKwH1c6rUbxroqh5jtB+hAftIVOwX0f8DHBVlyeM=@vger.kernel.org
X-Gm-Message-State: AFuF++nwVH+a1V9wifM7d0U7JXIaQrzb/6PqC9tqDBV19UX3Xv0yZ7Kg
	D9+kgHyNaV63195t8PSJm6zBqc8E/h2YUn18zhuJz9BRLAHyOKXeJKCTvhY6AYOII/sVEDAvwqj
	7TAlhxg==
X-Received: from pjqo20.prod.google.com ([2002:a17:90a:ac14:b0:3a0:3615:5d88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b42:b0:39e:6c69:7773
 with SMTP id 98e67ed59e1d1-3a073233f70mr1352174a91.28.1790086957097; Tue, 22
 Sep 2026 07:22:37 -0700 (PDT)
Date: Tue, 22 Sep 2026 07:22:36 -0700
In-Reply-To: <arH581gvxmSMPSKA@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826165647.769231-1-seanjc@google.com> <aq/XwK71uNfLvUux@yzhao56-desk.sh.intel.com>
 <arEzv8b2IMHYcHsZ@google.com> <arH581gvxmSMPSKA@yzhao56-desk.sh.intel.com>
Message-ID: <arKPLKedX4fs8Zef@google.com>
Subject: Re: [PATCH v2] KVM: guest_memfd: Elaborate on how release() vs.
 get_pfn() is safe against UAF
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 22, 2026, Yan Zhao wrote:
> On Mon, Sep 21, 2026 at 06:40:15AM -0700, Sean Christopherson wrote:
> > > > +	 * Note!  synchronize_srcu() is _not_ needed after nullifying memslot
> > > > +	 * bindings as slot->gmem.file cannot be set back to a non-null value
> > > > +	 * without the memslot first being deleted.  I.e. this relies on the
> > > > +	 * synchronize_srcu_expedited() in kvm_swap_active_memslots() to ensure
> > > > +	 * kvm_gmem_get_pfn() (which runs with kvm->srcu held for read) can't
> > > > +	 * grab a reference to slot->gmem.file even if the struct file object
> > > > +	 * is reallocated.
> Does "reallocated" here refer to the case (*) below?

Yes.  I'll clarify this with:

		 * is reallocated (for use as a different file).

> > > > +	 * file_ref_put() provides a full barrier, and __get_file_rcu() the
> > > > +	 * matching acquire barrier, to ensure that kvm_gmem_get_file() (via
> > > > +	 * __get_file_rcu()) sees refcount==0 or fails the "file reloaded"
> > > > +	 * check (file != NULL due to nullifying the file pointer here).
> > > > +	 *
> > > > +	 * Unlike most other users of get_file_rcu(), where callers don't care
> > > > +	 * if they race with a write, only that they have a reference to _a_
> > > > +	 * live file, kvm_gmem_get_pfn() needs to get the exact file that is
> > > > +	 * associated with the memslot.  Without the aforementioned SRCU
> > > > +	 * synchronization, the following could happen:
> > > > +	 *
> > > > +	 *  CPU0				CPU1
> > > > +	 *  kvm_gmem_get_pfn()
> > > > +	 *    f = X (from slot->gmem.file)
> > > > +	 *					kvm_gmem_release())
> > > > +	 *					  slot->gmem.file = NULL
> > > > +	 *
> > > > +	 *					kvm_set_memory_region()
> > > > +	 *					  slot deleted
> > > > +	 *
> > > > +	 *					kvm_set_memory_region()
> > > > +	 *					  slot created
> > > > +	 *					  slot->gmem.file = f (alloc the same object)
> Case (*):
> 
> I thought "reallocated" refers to this case, which get_file_active() cannot
> guarantee against.

Ya.

> > > > +	 *
> > > > +	 *  get_file_active()
> > > > +	 *    file = f
> > > > +	 *    file_reloaded = f
> > > > +	 *
> > > > +	 * <KVM does weird things with an old memslot+file>
> > > > +	 *
> > > > +	 * Obviously KVM would be broken in many places if the synchronization
> > > > +	 * were omitted, but it's important to note that get_file_active() does
> > > > +	 * NOT guarantee a reference to the correct file was obtained, only
> > > > +	 * that the file doesn't point at a reallocated object.
> > > reallocated -> reloaded?
> > 
> > No, "reallocated" is correct.  From the comment for SLAB_TYPESAFE_BY_RCU:
> > 
> >   * This delays freeing the SLAB page by a grace period, it does _NOT_
> >   * delay object freeing. This means that if you do kmem_cache_free()
> >   * that memory location is free to be reused at any time. Thus it may
> >   * be possible to see another object there in the same RCU grace period.
> >   *
> >   * This feature only ensures the memory location backing the object
> >   * stays valid, the trick to using this is relying on an independent
> >   * object validation pass. Something like:
> >   *
> >   * ::
> >   *
> >   *  begin:
> >   *   rcu_read_lock();
> >   *   obj = lockless_lookup(key);
> >   *   if (obj) {
> >   *     if (!try_get_ref(obj)) // might fail for free objects
> >   *       rcu_read_unlock();
> >   *       goto begin;
> >   *
> >   *     if (obj->key != key) { // not the object we expected
> >   *       put_ref(obj);
> >   *       rcu_read_unlock();
> >   *       goto begin;
> >   *     }
> >   *   }
> >   *  rcu_read_unlock();
> > 
> > The above pseudocode is what get_file_active() is doing; it verifies the found
> > file ("obj" above) is the correct file.  Specifically, from __get_file_rcu():
> > 
> > 	 * If the pointers don't match the file has been reallocated by
> > 	 * SLAB_TYPESAFE_BY_RCU.
> Yeah, I understand this is what you mean by "reallocated" :)
> However, I think case (*) above could also be considered a form of "reallocated".
> Would it make sense to rename "reallocated" to "reassigned" in case (*)?

Oooh, I see what you're getting at.  Yes, I agree, "reallocated" isn't the best
description here.  Hmm, but neither is "reloaded" or "reassigned", because it
doesn't fully guard against the pointer being reassigned, e.g. if the pointer is
reassigned before the the first load.

How about this?

	 * Obviously KVM would be broken in many places if the synchronization
	 * were omitted, but it's important to note that get_file_active() does
	 * NOT guarantee a reference to the "original" file was obtained, only
	 * that it grabbed a reference for the returned file, i.e. didn't grab
	 * a reference for file A, but then returned a pointer to file B.

And the whole thing as a diff:

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 9a112daa5df9..483998f0df58 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -312,7 +312,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 * synchronize_srcu_expedited() in kvm_swap_active_memslots() to ensure
 	 * kvm_gmem_get_pfn() (which runs with kvm->srcu held for read) can't
 	 * grab a reference to slot->gmem.file even if the struct file object
-	 * is reallocated.
+	 * is reallocated (for use as a different file).
 	 *
 	 * file_ref_put() provides a full barrier, and __get_file_rcu() the
 	 * matching acquire barrier, to ensure that kvm_gmem_get_file() (via
@@ -327,7 +327,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 *
 	 *  CPU0				CPU1
 	 *  kvm_gmem_get_pfn()
-	 *    f = X (from slot->gmem.file)
+	 *    slot->gmem.file == A
 	 *					kvm_gmem_release())
 	 *					  slot->gmem.file = NULL
 	 *
@@ -336,18 +336,19 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 *
 	 *					kvm_set_memory_region()
 	 *					  slot created
-	 *					  slot->gmem.file = f (alloc the same object)
+	 *					  slot->gmem.file = B (alloc the same object)
 	 *
 	 *  get_file_active()
-	 *    file = f
-	 *    file_reloaded = f
+	 *    file = B
+	 *    file_reloaded = B
 	 *
 	 * <KVM does weird things with an old memslot+file>
 	 *
 	 * Obviously KVM would be broken in many places if the synchronization
 	 * were omitted, but it's important to note that get_file_active() does
-	 * NOT guarantee a reference to the correct file was obtained, only
-	 * that the file doesn't point at a reallocated object.
+	 * NOT guarantee a reference to the "original" file was obtained, only
+	 * that it grabbed a reference for the returned file, i.e. didn't grab
+	 * a reference for file A, but then returned a pointer to file B.
 	 */
 	xa_for_each(&f->bindings, index, slot)
 		WRITE_ONCE(slot->gmem.file, NULL);

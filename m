Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5D41E5B88
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789334; cv=pass; b=PLUUPWXR+u1BYwo4h0uxf3Flv9RCXScaAc7ormuRW1rWxP0WY/pSKHmxnr2GxzAEpGjb0Q/9otSRGAQTnG5UtX7G/JnSpwolhIkwl1QyJ8IR5/rTnUUvRUzMZD0aOScRv1qGvzw+LQGdlbqX/tanC/Vr0J68isaPkrRzr6OYv5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789334; c=relaxed/simple;
	bh=6xPZGjm1Wu5mytRKkg/F0NHC7jcbm8cOuhKBGBc5leo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7eOvvqUZGOQgctxILWd809SscMJsYEox8aww2f+uMklx7U9o2EC1ZGMCQ1LofF4/1SomFk6GW0Q9nYeN3f55Zg5CB+dBTM9F1wjQLL3Q5GudHCUcezfAub8bq/0AvcxNjuYGbAtoMXceq1DtXSGsgBtmhtDJIc6vm7jWvbjnqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ABak3XHV; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ABak3XHV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5f95a879cso586a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787789331; cv=none;
        d=google.com; s=arc-20260327;
        b=Ha8TPnvSPE6Yhr6oBzHb9f6RodllybK5oP6xWEKLWKYafylYYgYPzuSO/GPivTBHBr
         N89W8YGoSc86anEiQVgVTHfjhh81uACVdK5/qFnYMK1ctK+2Lyn4jYBP9VuMuLOm+9MK
         KfD/E87Gijq/ijF5O1+LKpEdG7aROz5GoVlV1eaXCjt1jjbSrZvr4Eojyknd/0U5FZIl
         q3PqM4MnM0JRo5EYHZXEU3Zaj+B2OAmSGu0Et9ZdzYLpQh0FaG2IsN9MAOeadG5TeNKN
         s0YeRF9jpEd7CkVMcOXxU++dPdVj1mDekXe08Z+frqEsn4vmbpNkhTuFMMGHPXogb8od
         i17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ra61REZzO3eiF6dyZGE8JODsfglmTWsuzSdXYZS81DM=;
        fh=mLtecnOSuE6s+ayFawGdka7Pux6It8E7zbJ4OSCAA5Q=;
        b=F38mMGw6F79JjBHNh3QcJJaBYKs2Lwu2wo2KJXVAwcJMPUAR/yh4u+7Qg3ksZvI3Tn
         y+yH1MNjtIEqDDVc4Vvd6Tk9TVHgyV6XPVeZtVbp4Tj3G1py9HBMBr2t98h+X6Z/Ngkh
         4+NCH5iKTvwjrOq8b7xaWkImp8idQQADMgM9x7rtabN8KVRqbqFDMEtihbamtf1n2cv8
         aXFE75qEhVBMnKBEW4zI2SuRv20rQHIZ/rzE7j8GgwXrjTjGj1O0s7EIXIPnuY7Q1JNK
         C+G1qinnNWRAZvrCg4FmNpqYkk+AESkqw3lVKxOQzkTW6C1mrR5oKHs8bdCH96w+JBfC
         SWwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787789331; x=1788394131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ra61REZzO3eiF6dyZGE8JODsfglmTWsuzSdXYZS81DM=;
        b=ABak3XHVt1XxWCEGPMjurcYqtavQmFSmLs8posXVTVSnzV9sHEJRrqNxjS5S7T3P1J
         mh4kk8IGyear9g4A0mSIg39JPqD4wjKDf5TWb2yfcKHO9jKi8syK9Uy7OixxKWrwXYSo
         FrDqYrYNV4abDfN92AJjQZLD/HQitMLi/dUtDzQcwEm4onp7SKfoZ7K33C/TWtllAkf4
         HZhbFGhsIBe7Ota+X6YYevYxzc1TOiBf1WceDc62ZPyPbpHe0OI8WM9m1ZqT1FEE8hU0
         oYKIrj8t2EqENFFHBg2FP2i69ZtUMn1cUh6bzAljmZDErLU9kdqJt+dWSTi4Jc+PF/jy
         dsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789331; x=1788394131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ra61REZzO3eiF6dyZGE8JODsfglmTWsuzSdXYZS81DM=;
        b=T7xHbbH0sv7COcC0hdw6qCXlKnLH8nDZtkmmLcFUVEeHVyNM1sob78oPXvuZkcz73I
         gcDyWOAekP9mstfxtb7hQ2TmC/X3+OJ0QhYrhVkRghvFjfo4wg6JyuWn8I0qOwlstI4f
         Y6j2hjfvVLSvTEVu6jgrykSSjlR1xpJ2QmiPAjMjm9Bbg937ZtuqzxO3ry6tHvPXSGqB
         uvCsRxof/IeCRzcks/O8PyPJDn/H8qT8qZlrzM99L8nFimwAtD+DygwoNqobJTUi0C6v
         9qdKdAs66376BTv+RNdDQnFG8wQmeOUQ9VJhEFINaDJcHxc/w0909ZXFFzHS7Mu/5y1a
         jNaA==
X-Forwarded-Encrypted: i=1; AHgh+RphiS3onP7SFoGuCMcDv0nh5tKNqY13niu+xaidIa1Q7O2cN3uyR4ZTWTdVAvwQ7KkaOD7ImY4fq87ZvVc=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ6hsPb9DU9BbQviKOHwUE+kIF3t5xPfAVhGJVLESSEE3BrVlH
	3WouH6Q2Vt8NuslZhVYPa15M6OvjyZEj7aXPQPVMnppsI3N6vWD60JHl2EaaIJjVN0aiIpMJ8V7
	jRCqjWi/Jgal0mIcyJFRSUrZgJvkunPOnjlfGzzRI
X-Gm-Gg: AR+sD11dLc0Y+FCO7Z4XU5eeEGHM/hrKkgmesRIAggbho4zuCIpyM7I3Z7NIftFVwao
	SydBjQladNrDBDdGtMdCyKh3VVTZcAWK2VHwalA/HKgbxJ6XZG6SxWx7gGJFjZJYDI6b5ziMTBd
	1ZvaopkVD6nnM4dVKA6aYxtJSMAUisRrOFMUE4n9hL+AOQUGPcP0wg/hq7diwlfIyGTjiLRmpmc
	lnPTpLsLdKtj1WyAX2ZRf2H8lnEjSokSTIjAEJJkI9dh/lMpj22NvJiNEiMs3hBNqm57rITQCFM
	8W24FgubHiA1RRJ+JrtLGQXFvbcC75k9gy9TZ38/PQCb
X-Received: by 2002:aa7:d411:0:b0:69a:f1cf:4849 with SMTP id
 4fb4d7f45d1cf-6a5f5487f32mr22583a12.2.1787789331080; Wed, 26 Aug 2026
 17:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL1mVc0W0oirnpd-im6r+Vewo6yfsWuXQB7UecEenYnE4BOJ4A@mail.gmail.com>
 <ao9y-cJfL-F9K4gV@google.com>
In-Reply-To: <ao9y-cJfL-F9K4gV@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 26 Aug 2026 17:08:38 -0700
X-Gm-Features: AcwNN1UM6_sr5sLfgH6qx2xiVGRvK01i7COiWkE_ljyEU0K67uE-spEEemrVR7g
Message-ID: <CALMp9eTsb+sRbVODN7MKJFZVKPJsq=bNfmrzBzXYZDgxJHESxA@mail.gmail.com>
Subject: Re: x86/KVM: host reads guest IDT gates after VMexit on Cascade Lake
To: Sean Christopherson <seanjc@google.com>
Cc: Yaohui Hu <yhu@digitalocean.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:19=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> +Chao, who has helped with errata in the past
>
> On Wed, Aug 26, 2026, Yaohui Hu wrote:
> > Hi,
> >
> > We are chasing a host crash on Intel Cascade Lake that we believe is a
> > CPU defect, but the exposure changed sharply across a kernel upgrade
> > and we would like input on the kernel side.
> >
> > Symptom: nine hypervisor crashes over ~120 days, all the same shape.
> > On a KVM vCPU thread, shortly after a VM-exit, the host faults at an
> > address unmapped in the host, then faults again on every subsequent
> > exception delivery, recursing until the #DF stack is exhausted.
> >
> > The phantom handler addresses are not random. In one dump we located
> > the IDT they came from: it lives in the tmpfs-backed guest RAM of the
> > VM running on that CPU. The host read gate descriptors out of the
> > *guest's* IDT and tried to deliver host exceptions to guest handler
> > addresses. A second dump shows this in software rather than by
> > inference, with the oops registers caught in vmx_do_interrupt_irqoff()
> > having read a garbage gate from host_idt_base.
> >
> > Linux maps the IDT through the CPU-entry-area alias at a fixed
> > virtual address (0xfffffe0000000000) that KASLR never relocates, so a
> > Linux guest and a Linux host use the same address for their own IDTs.
> > With VPID enabled the guest's translation survives the VM-exit, and a
> > host access tagged VPID 0000H must not match the guest-tagged entry.
> > On these parts it appears to.
> >
> > Environment:
> >
> >   - Xeon, family 6 model 85 stepping 7 (Cascade Lake-SP), microcode
> >     0x05003901 (latest public for this stepping) on all nine hosts.
> >   - Two server vendors, three datacenters, VPID enabled.
> >   - 6.1.51 ran this fleet without such a crash; 6.12.51 produces
> >     them. Microcode and hardware are unchanged across the upgrade.
> >
> > There is a documented precedent for the failure class on a different
> > part: Arrow Lake erratum ARL029, "Incorrect Core TLB Entry May be
> > Retrieved Following VM Exit". Cascade Lake has no public equivalent.
> >
> > We diffed the relevant paths between the two versions. The gate read
> > in handle_external_interrupt_irqoff() is functionally identical, and
> > the TLB/VPID/EPT invalidation layer is byte-identical
> > (vmx_flush_tlb_*, allocate_vpid, vmx_vcpu_load_vmcs, and the
> > INVVPID/INVEPT sites), so we do not believe KVM changed its
> > invalidation behaviour. The one change we found that plausibly alters
> > exposure is 97e3d26b5e5f ("x86/mm: Randomize per-cpu entry area",
> > v6.2), which changes the paging topology of exactly this region. We
> > can see the effect in our builds, but we have no mechanism that
> > predicts its sign.
> >
> > Questions:
> >
> > 1. Has anyone seen this signature? A host faulting after VM-exit at
> >    an address that turns out to belong to a guest seems distinctive
> >    enough to be memorable.
>
It doesn't ring a bell, but I'm curious if it goes away with
hyperthreading disabled.

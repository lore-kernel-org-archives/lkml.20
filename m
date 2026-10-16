Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B330B514
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115396; cv=none; b=drFmfJtbYdYy0GqLaeFJLTIi9d37vWCaAqNWpFE/1wJMyeeqiT5n4pmVJp8lP4nNuBalvvNOtrnHklmDZlEpF5djYSEomPoJpj4PuBIIqnmxPi55EZlzr8fduxs5YqKYcArsrCzdxfJuXojScjr6HwGIXONAScmtzD85IUWBu8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115396; c=relaxed/simple;
	bh=Eqwb9cwDQQev6ft8+cembLEHTPbJBIkKYvHZIrXXN5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bonVVDYnmhAsukoMUCayBFxfxYAWii3nKE2/EwoYEXhLMdBOPTf0JmfqDm7G9hbFAL/mtzs84JC8jzcTnmFw/7hvmJmKo3ksaAa1JQLT4kBhMO9I+SDzYlpoQxP/hNBLgxaTqbcqN6w9PpWNHpg1VTq5cB5hmhhnAP60kstsVAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=my1JHfRW; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="my1JHfRW"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so7233744a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792115394; x=1792720194; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux01STCnGtDsKdixMlXVkH5njmEmFXWxx+GxqnnoxD4=;
        b=my1JHfRWj+EB8IK/26eLU+ZYBkHBj1DMvdVEUYurPj4bCJFC6XRB+E3xCFuXtjabgs
         VYZV71Q+cacQlRGib0n7l1cXSeQPRhwXQAZ8WxSXcgizr/hlPER4WvOcMuqgWJM7DG/5
         9nzHMECpV9wVI3SO0L/1dxwmJsqq8vKC14M6qQDnhyhqEF4M9tblppYbOqmFx5BbBAr/
         RVSH3S2sVTKqH8goHgwBoR3iFkDkszJFBnGflfll7kY30+QkP27CHQzwmbRRwnN16v07
         Jea9hen9Rhg0SqKHNDLBf5RP5LZtHRgswUu9pJF0cKE5i7yUTezuZpj4zpWtUbJmXh2Q
         8h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115394; x=1792720194;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux01STCnGtDsKdixMlXVkH5njmEmFXWxx+GxqnnoxD4=;
        b=ak1aBLd+bsZUomoPhxlDIFeMabrTdHkaFV0HiraeqDC/eMpfIOlPvetl97SkchAh0z
         GDRcWN1WfXLYV2WZk+GXdvazFXRDvz7NaHAWoD5ey40o404GzSkPq/MeA9QgMFjtO1+e
         lhbCth5w4RTSGi/o7ucStlW0J4AFc5J+03KtccdE4b+LnON4LaNPOeo5HctXhfvPLjTz
         sQNuH/lbdECBmKWK7B5RETX4NdA37HoZWqLtS78OOktOdKUKCQm+RRXNnuo886iNsto0
         RveoRy8zVN5XfcHp7XlHvJxAqfgnUJ6cyAtrWJin7+a6RPx3xwZgs7vv94D40MofMPeu
         jP/g==
X-Forwarded-Encrypted: i=1; AKwUvBzoNjy7BB+UWcgxfLrYxHkwlE692nE3o2BXTETUsRamOAgLKolzimEvFG6CqdtSkJZvAzPTNG+Czp4wY84=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcyaa/iv3aS9QxlEp+U0HUYliurQLF4/h1l3wQXiD/2ibD1fpN
	S/KbyfE9cr/8FyjEeUgyO864PLqGMHz4JmsdBn/oCWIgiggh1H5CyCSqs5NtUrNDqt1bvmM8d4r
	IjtTV9w==
X-Received: from pglk7-n1.prod.google.com ([2002:a05:6a02:6b87:10b0:cc7:cb66:8df9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5681:b0:3e0:f4a9:3615
 with SMTP id adf61e73a8af0-3e16beb288dmr17279273637.54.1792115393764; Thu, 15
 Oct 2026 18:49:53 -0700 (PDT)
Date: Thu, 15 Oct 2026 18:49:50 -0700
In-Reply-To: <cover.1791280439.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1791280439.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <179211526968.809012.4905747914183363587.b4-ty@b4>
Subject: Re: [PATCH v7 0/8] KVM: selftests: add powerpc support
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, 
	Anushree Mathur <anushree.mathur@linux.ibm.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 06 Oct 2026 15:58:34 +0530, Ritesh Harjani (IBM) wrote:
> Patch v5 -> v7:
> ================
> (Suggestions from Sean):
> 1. Added kvm_is_ppc_pseries_lpar() helper in kvm_util.h to avoid sprinkling
>    multiple #ifdef __powerpc64__ checks.
> 2. Enable all tests via TEST_GEN_PROGS_COMMON for powerpc
> 3. Enable hardware_disable_test and skip when running on powerpc pseries LPAR
>    (nested).
> 4. Re-arranged the fixes in appropriate order.
> 
> [...]

Applied to kvm-x86 ppc_selftests.  I swapped the order of 5 and 6 so that there
wouldn't ever be a window where the kvm_create_max_vcpus test could fail on LPAR
setups.  I also massaged the shortlog+changelog for 7 and 8, to explicitly call
state the tests are being enabled (saying only "skip on LPAR" suggests the tests
were already enabled, which they were not).

[1/8] KVM: selftests: Don't limit LE dirty-bitmap bitops to s390x
      https://github.com/kvm-x86/linux/commit/ab1d40006720
[2/8] KVM: selftests: Move memslot_perf_test off the 256M ELF load address
      https://github.com/kvm-x86/linux/commit/f51639c0ee7a
[3/8] KVM: selftests: Skip the max vCPU ID test when KVM_CAP_PPC_SMT is set
      https://github.com/kvm-x86/linux/commit/2bc2c4a8105f
[4/8] KVM: selftests: Add helper for checking if running on powerpc pseries LPAR
      https://github.com/kvm-x86/linux/commit/5527310b4d19
[5/8] KVM: selftests: Skip kvm_create_max_vcpus on powerpc pseries LPAR
      https://github.com/kvm-x86/linux/commit/9de211597e81
[6/8] KVM: PPC: selftests: add support for powerpc
      https://github.com/kvm-x86/linux/commit/1b53b581d4e8
[7/8] KVM: selftests: Enable access tracking perf test for PPC (with LPAR clause)
      https://github.com/kvm-x86/linux/commit/e5983ef19a6a
[8/8] KVM: selftests: Enable hardware disable test PPC (without pSeries LPAR)
      https://github.com/kvm-x86/linux/commit/23140d6e54ac

--
https://github.com/kvm-x86/linux/tree/next

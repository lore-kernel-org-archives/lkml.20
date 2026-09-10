Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB9314A60
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080647; cv=none; b=lMFlmAa54xdAzjK0BsaAZLhr5ZR/re3Y+RazwZhrfpeenhKkFSLWVSbFOGwufpov3S0Hgfsed2tSa7UXPnRs9LwXLGM94sGMFfUZT8rnf9sz6wr2xRg09ay/HuipE6frKqz2fC2OAetwty54sgkIEfqZvk5uKyIMqRej+Hh65Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080647; c=relaxed/simple;
	bh=C7V7Fqm2GnPpsjDlmS5uYNFCxnY5rCJDt1LyTBKpO3g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MyV6vYxWQFEz7Gjh3lWdqeQ/kiJdrlwhsI04z2OXhmgW4EvmFBDuV/6gV0y0EeDq6op3fk/HpWhVF9Wm/xRBJUyNjkTHEBCpcJE5Wcx+Rg8vzUxbuUPlGb1cz9jTnBf1iUCP0t1j9qE08Kl8ePeZEgPNreaD8CcSK/RyO6S2Kmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j0ojtgls; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j0ojtgls"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so399835a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789080646; x=1789685446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CLmrfb7NXI5qaK2erHQxMEAI4CCcSkomEkbhr63psE=;
        b=j0ojtgls/9PPsYtulsGV4ivUi9OrfG0+Fr0nGxs9tsgf9cuHoq/gso4s14eqwjYo0u
         GqC6GODLSQaltF+jLINYOyNU+c+VWGqCxwLyKBg40wbj0VCVkucDXAEDCXeevWFu7cZX
         pYiaG7Wim+z6xiGzXZULzBckkogSkvElVVrmYe0GHclgdZmMJFhFlkSGp1x78FP+KPV9
         DOdbV5tv1AucifDga/hH2fQevFFaCMdkBlp+mPo8ek2u6RJrPhcBPMN6ffNIWoMc0cj1
         81rPRGQ2W9ya6phlSutiLS27sTbZtoo5Z+2fxrb4WAZJt2bDbMG2ulUaqRMxUJRqlzBR
         lcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080646; x=1789685446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CLmrfb7NXI5qaK2erHQxMEAI4CCcSkomEkbhr63psE=;
        b=TStkOcO68XHUXaXChD9n8PoWVSnwtKbId7vKwT5EZxiiGc8X2Ve2uhMYuJgmtzslC2
         oO/xPAUAmI+11f/cGDPmLLWEHdgtUHF2AZv6OV2NdLkIDPqPk15ZCFaHzf+m6duvhQjD
         mb8d7KNTjBkjV2skrKHQCqOdQmXCUQzAN8aSWhMy9PPABAqUJ9jhZmAtqZmxFlkwjt9g
         TY3rcizhJUmg6azMSOCvNliwtHKTi4uo2HuXHL9xnNUqdeC20FdY5zjX9grwZCM7Hora
         zqM3ohilMQRrZf/LfydPd5EvW5lm/PfMIPrax3kky+8BLX5vRNDQeBnFwYHLRFbRu42K
         5pVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXxcNp6lDuhDJHwso+QFHaTC8ps2rnVLoCVIeOL0C1uOvrLqmpJ/uLZtp1P2hTLNj4O86VpQzXKPwUTIo=@vger.kernel.org
X-Gm-Message-State: AFuF++nWnxKDV9HcGXB1LBIZpBXhiPp3xym3ceE8D/4iV9VrCm4oETjF
	oJUqsJAPYP5uLcxLK2q0yL+0wCxnArj9fpguOLLZdN5RcoePQhaEb1z5Kn5zDa34DtDZEq1iSgO
	t8rdKkA==
X-Received: from pjqo12.prod.google.com ([2002:a17:90a:ac0c:b0:39b:9ef7:a6f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:574c:b0:38e:9045:babe
 with SMTP id 98e67ed59e1d1-39d9bd99cb7mr1730684a91.7.1789080645505; Thu, 10
 Sep 2026 15:50:45 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:50:44 -0700
In-Reply-To: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
Message-ID: <aqM0RIiLVqvwit-w@google.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
From: Sean Christopherson <seanjc@google.com>
To: Jacky Li <jackyli@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 10, 2026, Jacky Li wrote:
> Currently, snp_handle_(ext_)guest_req() returns -EIO when
> kvm_{read/write/clear}_guest() fails while accessing guest-provided
> buffers. Returning -EIO causes KVM_RUN to exit to userspace, likely
> killing the VM.
> 
> Fix this by returning GHCB_HV_RESP_MALFORMED_INPUT with sub-error code
> GHCB_ERR_INVALID_INPUT to the guest and resuming the vCPU.
> 
> Per the GHCB specification, guest-provided GPA buffers that cannot
> be accessed by the hypervisor (e.g. private pages) should be treated
> as guest input errors. Because kvm_{read/write/clear}_guest() only
> returns -EFAULT on failure, treating this failure as an invalid input
> aligns with the definition of -EFAULT ("Bad address").
> 
> Returning GHCB_ERR_INVALID_INPUT also matches existing SNP handling
> in KVM, which already returns this error code for unaligned or
> overlapping buffers. It also aligns with other hypercall implementations
> in KVM (e.g. Hyper-V returning INVALID_HYPERCALL_INPUT on
> kvm_read_guest() failures in kvm_hv_flush_tlb()).
> 
> Performing upfront validation (e.g. via kvm_mem_is_private()) is
> avoided because it is prone to TOCTOU races with concurrent Page State
> Changes.

When stating what a patch does (or doesn't) do, phrase everything as commands.
Passively describing the patch, as done above, is problematic as it's not clear
if the changelog is talking about what the patch itself is (not) doing, or if
it's talking about the side effects of the changes.  Whereas this:

  Don't try to validate guest-provide ahead of time, as such checks are prone
  to TOCTOU races, e.g. with Page State Changes, memslot updates, etc.

is more obviously talking about the patch.

> Fixes: 88caf544c930 ("KVM: SEV: Provide support for SNP_GUEST_REQUEST NAE event")
> Fixes: 74458e4859d8 ("KVM: SEV: Provide support for SNP_EXTENDED_GUEST_REQUEST NAE event")
> Signed-off-by: Jacky Li <jackyli@google.com>
> ---
>  arch/x86/kvm/svm/sev.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 5705723f1f41..d07562310519 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -4228,8 +4228,10 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
>  
>  	guard(mutex)(&sev->guest_req_mutex);
>  
> -	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE))
> -		return -EIO;
> +	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE)) {

I don't love that userspace VMM goofs will bleed into the guest, but on the other
hand, KVM already uses this pattern for Hyper-V hypercalls (and worse patterns
for KVM-defined PV features), and practically speaking this is better behavior
than returning -EIO.  So I'm good with this.

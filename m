Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB44DA9A5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009791; cv=none; b=S818YsxgmZ0WjK9Qn8udnNagSy0NwuigfaeBLmmUVFbAoAp3isA9Be/A1QSkmUjWDqu8TjFYUFB2Gi/NicE/a3dP57ss/Y6D7i5R3DqeYe9Y9iR0itYOEIjkQyZgUcGMXREcKTXfr0yrd9yFRvVvc8lzKOhhFTBzm395hyZz9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009791; c=relaxed/simple;
	bh=IchJVRnvveIxEK+oQyYR3jsZUwvxCFT6SBbUrbKr4DY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zmyaq655fovOCIg/TI0Q8KmedqzrS6EA7nwDJHD7pkOMN8mfiEgwC+lqNgg7gf2+AmV6IjTLS3e45ToqMeCKE/e5e/kVqL3FJfiUulFC0QyKiciRmG4yLWXz7gVHEvT9qG9SbqmH25CzpMj8iTY4/Ee6qAcxAX89H8vZx6KuifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XMofM9DR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XMofM9DR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790009789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=As7I/HbMfxtL9nsELV4HpSsq1JEhRRrzYwSEyLJqizM=;
	b=XMofM9DRgSHK95QIY7/QEczyeRfXLkTKosaFOc1UI0Ws0W8E8D6Z4kwBerNddK49bt9lU3
	cQIh8BaGFwf2yPuiPOVR2CCwWZLkbZIcQpUiwjFqEd/LQkxN3aGNtJZj214dwnSQP3MiCq
	cFKHdPDd2bbMddd0DRIH2qPY0v65/sQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-346-F2k4iL6jOheYbBBXHtQ1CA-1; Mon,
 21 Sep 2026 12:56:25 -0400
X-MC-Unique: F2k4iL6jOheYbBBXHtQ1CA-1
X-Mimecast-MFC-AGG-ID: F2k4iL6jOheYbBBXHtQ1CA_1790009784
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03CF018512EB;
	Mon, 21 Sep 2026 16:56:24 +0000 (UTC)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 887D81953945;
	Mon, 21 Sep 2026 16:56:21 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: nsaenz@amazon.com, snambakam@linux.microsoft.com
Subject: Re: [PATCH v3 00/28] KVM: x86: Introduce memory protection attributes
In-Reply-To: <20260918135030.171564-1-pbonzini@redhat.com>
References: <20260918135030.171564-1-pbonzini@redhat.com>
Date: Mon, 21 Sep 2026 18:56:18 +0200
Message-ID: <kupwlse5yrx.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Paolo Bonzini <pbonzini@redhat.com> writes:

> [cover letter copied from v2 - sorry for the very quick turnaround
> but it's pointless to ask for reviews with the issues reported by
> sashiko]
>
> This series introduces a mechanism to let userspace block read,
> write or execute access to individual GFNs via KVM's memory
> attribute mechanism, and have them reported via KVM_EXIT_MEMORY_FAULT.
> It is mostly the work of Nicolas Saenz Julienne, with my working
> consisting in reorganization, code cleanup, and using the recently
> revamped MMU code (ACC_* masks and kvm_page_format).
>
> KVM needs to check the attributes anytime KVM takes GPAs as input for any
> action initiated by the guest; if the memory attributes are incompatible
> with such action, it should be stopped.  This means that there are quite
> a lot of cases to handle.  While some families of functions can be
> handled in one step, there are simply many places that do memory access.
>
> Along the way, the patches fix some issues in the memory attributes code,
> that surfaced due to having more than one attribute.
>
> Paolo
>
> v2->v3 is just a bunch of sashiko fixes:
> - new patch "KVM: x86/hyperv: do not overwrite hc->ingpa for slow
>   SIGNAL_EVENT hypercall"

A nitpick: in a few places in this series you use 'slow Hyper-V
hypercall' term but TLFS never calls them that. It's kind of my fault I
guess as in aee738236dca I used in in the comment I've added (although,
in quotes to emphasize I'm making the term up). In TLFS, hypercalls are
either regular (using memory locations for in/out params) or 'fast'
(using registers, including XMM). I think we need to decide if we want
to adopt the 'slow' term and use it ever after of if we want to fall
back to a more conventional "non-fast"/"regular"/"" name. 

> - rewritten "KVM: apply nGPA->GPA translation to KVM_HC_CLOCK_PAIRING"
>   to handle cross-patch accesses
> - rewrite choice of KVM_FILTER_SHARED/KVM_FILTER_PRIVATE prior to
>   setting memory attributes; even though the previous version worked,
>   it relied on not having any attribute at all for has_private_mem VMs
> - fix WARN_ON_ONCE/WARN_ONCE confusion
> - fix loongarch compilation
> - new (not really satisfactory_ patch "KVM: Take memory protections into
>   account for __kvm_vcpu_map"
> - fix incorrect NOT in "KVM: x86/mmu: Do not prefetch sptes on gfns backed
>   by memory attributes"
> - do not use kvm_mmu_prepare_memory_fault_exit() for attribute exits on
>   PTEs
> - new patch "KVM: let kvm_arch_post_set_memory_attributes drop mmu_lock"
> - testcase fixes
>
> Anish Moorthy (1):
>   KVM: Define and communicate KVM_EXIT_MEMORY_FAULT RWX flags to
>     userspace
>
> Nicolas Saenz Julienne (12):
>   KVM: selftests: Take into account mixed memory fault flags
>   KVM: x86/mmu: Init memslot hugepage information for non-private_mem
>     VMs too
>   KVM: Introduce NR/NW/NX memory attributes
>   KVM: Include memory protections in result of gfn->hva conversion
>   KVM: Take memory protections into account for memory read/write/fetch
>   KVM: Encapsulate memattrs array into anonymous struct
>   KVM: Introduce a generation number for memory attributes
>   KVM: Take memory protections into account for accesses with cached
>     gfn->hva
>   KVM: pfncache: Fail to refresh if it contains memory protections
>   KVM: x86/mmu: Do not prefetch sptes on gfns backed by memory
>     attributes
>   KVM: x86/mmu: Take memory protection attributes into account during
>     faults
>   KVM: x86/mmu: Issue memory fault exit if walk failed due to memory
>     attribute
>
> Paolo Bonzini (18):
>   KVM: x86/hyperv: do not overwrite hc->ingpa for slow SIGNAL_EVENT
>     hypercall
>   KVM: selftests: Test address translation for Hyper-V direct L2
>     hypercalls
>   KVM: apply nGPA->GPA translation to KVM_HC_CLOCK_PAIRING
>   KVM: x86: Introduce memory fault on invalid hypercalls reads/writes
>   KVM: selftests: test hypercall memory fault exits
>   KVM: x86/mmu: intersect writability from __kvm_faultin_pfn with
>     fault->map_writable
>   KVM: x86/mmu: Extend map_writable to a full ACC_* mask
>   KVM: pass kvm == NULL case to kvm_arch_has_private_mem
>   KVM: adjust for presence of more than one attribute
>   KVM: Introduce kvm_fetch_guest_page() and use it for x86
>   KVM: Take memory protections into account for __kvm_vcpu_map
>   KVM: loongarch: do full validity check on the gfn-to-hva cache
>   KVM: Introduce kvm_check_gen()/kvm_memslots_check_gen()
>   KVM: let kvm_arch_post_set_memory_attributes drop mmu_lock
>   KVM: x86/mmu: Obsolete all roots if memattr contains gPTEs
>   KVM: x86: selftests: Introduce memory protection attributes test
>   KVM: x86: selftests: Introduce memory attributes PTE test
>   KVM: x86: selftests: Introduce memory attributes side-channel tests
>
>  Documentation/virt/kvm/api.rst                |  38 +-
>  arch/loongarch/kvm/vcpu.c                     |  12 +-
>  arch/x86/include/asm/kvm_host.h               |   4 +-
>  arch/x86/kvm/Kconfig                          |   4 +-
>  arch/x86/kvm/hyperv.c                         | 172 +++++--
>  arch/x86/kvm/mmu/mmu.c                        | 183 +++++--
>  arch/x86/kvm/mmu/mmu_internal.h               |  21 +-
>  arch/x86/kvm/mmu/mmutrace.h                   |  36 ++
>  arch/x86/kvm/mmu/paging_tmpl.h                |  25 +-
>  arch/x86/kvm/mmu/spte.c                       |  12 +-
>  arch/x86/kvm/mmu/spte.h                       |  13 +-
>  arch/x86/kvm/mmu/tdp_mmu.c                    |   2 +-
>  arch/x86/kvm/x86.c                            |  66 ++-
>  include/linux/kvm_host.h                      | 128 ++++-
>  include/linux/kvm_types.h                     |   6 +-
>  include/trace/events/kvm.h                    |  14 +-
>  include/uapi/linux/kvm.h                      |   7 +
>  tools/include/uapi/linux/kvm.h                |   3 +
>  tools/testing/selftests/kvm/Makefile.kvm      |   2 +
>  .../testing/selftests/kvm/include/kvm_util.h  |  32 +-
>  .../selftests/kvm/include/x86/processor.h     |   1 +
>  .../testing/selftests/kvm/lib/x86/processor.c |   5 +
>  .../testing/selftests/kvm/memory_attributes.c | 453 ++++++++++++++++++
>  tools/testing/selftests/kvm/x86/hcall_fault.c | 246 ++++++++++
>  .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  16 +-
>  .../selftests/kvm/x86/hyperv_svm_test.c       |  15 +-
>  .../selftests/kvm/x86/memory_attributes.c     | 415 ++++++++++++++++
>  .../kvm/x86/private_mem_kvm_exits_test.c      |   6 +-
>  virt/kvm/kvm_main.c                           | 271 +++++++++--
>  virt/kvm/pfncache.c                           |  30 +-
>  30 files changed, 2027 insertions(+), 211 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/memory_attributes.c
>  create mode 100644 tools/testing/selftests/kvm/x86/hcall_fault.c
>  create mode 100644 tools/testing/selftests/kvm/x86/memory_attributes.c

-- 
Vitaly


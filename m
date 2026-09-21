Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65247532E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985449; cv=none; b=YHZs+WFJiANZTeOu52NR4mfrFRVg/HKV8wT6IIeFTvZqIFadKm15mcWURYXEYf5x3JSyT5Czpqfe9hPgrIp2hpU3tBZwe9BLdHRcdVMWRZ7s/BLvNqXdCp4oT/NcYEewxGiXYNn9JwwZhJgmJGhu59BaqFHAQ5d2weoFyrXfVcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985449; c=relaxed/simple;
	bh=efhk7mFFNXI1SVVQ/c7UUNvyqci4sCOoEDlWhW54YUI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=I3Htg9br6oY21JhJiEqDLbQyvvQYgVS/t09e3jNWBKhwStWa8xfoid4rhICvJyW34xXZvjCgSqq2kCtvoVemIk2sMmgewRz0H2VgmLHpfhWuoeUi/gGgyTQPfg4bLbZVy/aY5Ye1RabSuq6NIF375VnYpmewDDq0Tema0oxEVcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYmrW08o; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYmrW08o"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so874639a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789985447; x=1790590247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uKqrC6Ho9ToHzDSsE7AHMIOBJD51IfvuuyaImn8yxEQ=;
        b=BYmrW08oqGC9tBVD4v9PzU22J5ZDEMkURCbPg7J004pmSs3kp74TZLcIYupS7jgnbh
         4SfJbKBEXobJrvf2ihPxve4cQBYcqQopgibD96DcMb1GHJI30+kc/fDp9pB5ERzeybEY
         9CmChmRm7Pt56t0xJAba4IbhlEGVov37p2SgG0EQ/ohbiXVfGtqrnf5GVoPorSUIehqH
         d9G4HQUNDal3MVtNxpcjgUA3/yE3hKDO59EZIxAqxEZcr2rF8z+RkU0BRN+W4x0bS28g
         5Khh5fg1x2JH61KJqmwswYrbrdPX7PM2EVhmdkLs54V/3aWSOZ1qL4URYVvCBmks6+Gs
         7L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789985447; x=1790590247;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKqrC6Ho9ToHzDSsE7AHMIOBJD51IfvuuyaImn8yxEQ=;
        b=pd9Tb/I059zbbPAgPVYEObteL5Vf3V1alFVxv5UYkibva8ods4BBY+C9/pCTPuUwzy
         pBkHkrTVdytnMEtfcqJI480lSDsHGNPa5mb3nGRh5komCPhXIp8meo8sk403w+wK9KRA
         twjOPxO1FLzo7FT+sokkCAspAzm4sH2BOM61blS1jIfHAlm+71Ti9KvDW6Vmn65JI17+
         hK/BkLV78L2f7zzmY6c//oKJ2TqeJHs6mtD+ysjksDUkH+cVnLGxgC2ckr25VwbqfPvL
         qlrp2TO9eEOAPktQymtHx+RiAakbCtkCpnZFwF50YYZfDByzR3ylySuT+mFcBqYuAVTe
         HuNw==
X-Forwarded-Encrypted: i=1; AKwUvBw+vXdS/FxSsu+IHC/m6nkwQgSsEISaJja5KmtD9+B2TY7yMX8jNCuxTlpHrPCYsDDswgb27asQlwWfMh4=@vger.kernel.org
X-Gm-Message-State: AFuF++nwYPHefb8cPxy7R97FCXA4WQKnMlHbF9H0QDfC9LSbqZF2yMMg
	PSU7VltalmVbm3nb/gFqNLfX7/AXO+OluWMCinYGV5xR1URWKQk6ZTzWC8BM6w==
X-Gm-Gg: AYBFou3YusRrtTg5+pQ9ltoFXd4Ls1nhGGzyhxvzuuHYudwMstMsNkIkLxHD3uUSefG
	/Bs6hWfgux1kuPcwHdgGeqh3OnroqunbT2O9MJLKCS3P54lxuq+H7Kp80psMa4Ek069xgJLsxYZ
	jTXt6F/+mf/gdn+jPOGauOVNxtL76x79bBDYEgRjn2rM+acHksiW1QbSdNDT7d3b6+ynYWn70ds
	HxOSnDrvLYvcxLBb8LUERVjZqqw4ne1EqbFB0cKVhQ5mFg4Fg3rDIHfFQHmBD+DmmRLPT6Q0ven
	KjaUmP4DqSyjmvrCNy3IJNqmjnOL+50vH3IV7AkbeW3UwbZjXmSLl4MenAquqIR2mGe/WT761XK
	5Kq3TuD/BO8D9iA+b1BVDfuBM0/yMpJrOFKrhu3Rm7KrzI3Dxjbg6YlRAtFtzwsezxdhGwZsrxB
	fb/w5kKVti6v+NDwpE4atVCViBBcweLZscMh263AgxaklA0aho47rmVbg6vC6R52EzdUT5Cnp9m
	TTi/O6a+ehEG6BghXTYo3+gEPFF5MU0vuUS8T4sjl23lo4JkYylTQ==
X-Received: by 2002:a17:90b:35c3:b0:3a0:2503:854d with SMTP id 98e67ed59e1d1-3a025038c48mr8347346a91.18.1789985446907;
        Mon, 21 Sep 2026 03:10:46 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e3f17288dsm11277799eec.29.2026.09.21.03.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:10:45 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Anushree Mathur <anushree.mathur2@ibm.com>, kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] KVM: selftests: add powerpc support
In-Reply-To: <edbbfb46-53c7-4fc2-b9ea-c0676479fc47@ibm.com>
Date: Mon, 21 Sep 2026 12:06:05 +0530
Message-ID: <5wzzkt62.ritesh.list@gmail.com>
References: <cover.1789097569.git.ritesh.list@gmail.com> <edbbfb46-53c7-4fc2-b9ea-c0676479fc47@ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Anushree Mathur <anushree.mathur2@ibm.com> writes:

> On 11/09/26 10:18 AM, Ritesh Harjani (IBM) wrote:
>> PATCH v3 -> PATCH v4:
>> ==================
>> - Rebased on top of Sean's new page allocator patch series v2 [1]
>>    This allowed to drop and patch-2 since it will now come from Sean's
>>    v2.
>> - Addressed review comments from Sean - squashed patches 6-10 in patch-1 of
>>    this.
>> - Dropped patch-5 to print vcpu_id when KVM_CREATE_VCPU ioctl fails.
>> - Added additional patch-3 to this series to allow dirty_log_test to run on all
>>    big-endian machines.
>>
>> [1]: https://lore.kernel.org/kvm/20260902164123.2546762-1-seanjc@google.com/
>> [v3]: https://lore.kernel.org/linuxppc-dev/2d2c46be7f051c7f1c645afaec67f57067d37a81.1781093720.git.ritesh.list@gmail.com/
>>
>> Testing updates:
>> ================
>> I have done some fair amount of testing of the selftests both on real HW and
>> using various combinations on qemu (powernv+LE (default), pseries+cap-nested-hv,
>> pseries+cap-nested-papr, powernv+BE). There were few powerpc kvm kernel fixes
>> which were identified as part of this work. I will send those patches separately
>> as those anyway needs to go in separately.
>>
>> <pasted snippet of cover letter from previous versions>
>> =======================================================
>>
>> Hi All,
>>
>> This series primarly adds KVM selftests support for powerpc (64-bit, BookS,
>> radix MMU).
>>
>> This patch series is originally Nick's work. I have mainly only rebased it on
>> the latest upstream tree. Since the rebase required few changes to all the four
>> patches (Patch 1-4), I have dropped the earlier Acked-by from Michael Ellerman.
>>
>> Since the last series was posted three years ago [1], I am resetting the version
>> to RFC. This rebase was done as part of a larger effort to improve the selftests
>> infrastructure for Linux on PowerPC tree. Thanks to Harsh and Maddy for their
>> help on this.
>>
>> Nicholas Piggin (1):
>>    KVM: PPC: selftests: add support for powerpc
>>
>> Ritesh Harjani (IBM) (2):
>>    KVM: PPC: selftests: powerpc enable kvm_create_max_vcpus test
>>    KVM: selftests: Use LE bitops for dirty bitmaps on all big-endian
>>      hosts
>>
>>   MAINTAINERS                                   |   2 +
>>   tools/testing/selftests/kvm/Makefile          |   2 +-
>>   tools/testing/selftests/kvm/Makefile.kvm      |  10 +
>>   tools/testing/selftests/kvm/dirty_log_test.c  |  12 +-
>>   .../testing/selftests/kvm/include/kvm_util.h  |   9 +
>>   .../selftests/kvm/include/powerpc/hcall.h     |  17 +
>>   .../kvm/include/powerpc/kvm_util_arch.h       |  22 +
>>   .../selftests/kvm/include/powerpc/ppc_asm.h   |  32 ++
>>   .../selftests/kvm/include/powerpc/processor.h |  39 ++
>>   .../selftests/kvm/include/powerpc/ucall.h     |  21 +
>>   .../selftests/kvm/kvm_create_max_vcpus.c      |   8 +-
>>   tools/testing/selftests/kvm/lib/guest_modes.c |  20 +-
>>   tools/testing/selftests/kvm/lib/kvm_util.c    |   8 +
>>   .../selftests/kvm/lib/powerpc/handlers.S      |  93 ++++
>>   .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
>>   .../selftests/kvm/lib/powerpc/processor.c     | 512 ++++++++++++++++++
>>   .../testing/selftests/kvm/lib/powerpc/ucall.c |  22 +
>>   17 files changed, 862 insertions(+), 12 deletions(-)
>>   create mode 100644 tools/testing/selftests/kvm/include/powerpc/hcall.h
>>   create mode 100644 tools/testing/selftests/kvm/include/powerpc/kvm_util_arch.h
>>   create mode 100644 tools/testing/selftests/kvm/include/powerpc/ppc_asm.h
>>   create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
>>   create mode 100644 tools/testing/selftests/kvm/include/powerpc/ucall.h
>>   create mode 100644 tools/testing/selftests/kvm/lib/powerpc/handlers.S
>>   create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.c
>>   create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
>>   create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
>>
>> --
>> 2.39.5
>>
> Hi Ritesh,
> Thanks for working on this enablement. I have tested kvm selftests after 

Thanks for testing this.

> applying this patch on top of Sean's patch as mentioned and even I 
> applied this patch for the kvm_create_max_vcpus issue as rc=-56 
> "https://lore.kernel.org/linuxppc-dev/cover.1789099725.git.ritesh.list@gmail.com/" 
> But still few tests got failed. Providing a summary below:
>
> System details where I tested this : PowerVM P11 (ppc64le) KVM enabled lpar!
>
> Test Results:
> =============
>
> PASS: demand_paging_test
> PASS: dirty_log_test (dirty-log mode, 4K + 64K pages, 32 iterations)
> PASS: guest_print_test
> PASS: kvm_binary_stats_test (4/4 subtests)
> PASS: kvm_page_table_test (4K + 64K pages)
> PASS: set_memory_region_test
> PASS: memslot_modification_stress_test (4K + 64K pages)
> PASS: memslot_perf_test
> PASS: dirty_log_perf_test (4K + 64K pages)
>
> SKIP: irqfd_test
>    - kvm_arch_has_default_irqchip() not yet implemented for PowerPC
>
> SKIP: vm_types_test
>    - KVM_CAP_VM_TYPES not supported on PowerPC
>

So far so good then.

> Failures seen for the following tests
>
> FAIL: kvm_create_max_vcpus
>    - RFC patch-3 partially helps: KVM_CAP_MAX_VCPU_ID correctly
>      capped from 16384 to 2048.
>    - But vCPU creation still fails with rc=-44 below the 2048 limit.
>    - dmesg: KVM: Create Guest vcpu hcall failed, rc=-44
>
> for the above test in dmesg I saw the following error everytime I ran 
> this test
>
> dmesg -w
> [ 2640.213798] KVM: Create Guest vcpu hcall failed, rc=-44
> [ 2923.048989] KVM: Create Guest hcall failed, rc=-44
> [ 3650.642771] KVM: Create Guest vcpu hcall failed, rc=-44
>
> FAIL: hardware_disable_test
>    - KVM_CREATE_VM fails with ENOMEM
>    - dmesg: KVM: Create Guest vcpu hcall failed, rc=-44
>    - Likely the same underlying hcall issue as kvm_create_max_vcpus.
>

In both above cases it looks like the hcall failed due to limited
resources. I looked at the spec and it seems, create vm hcall
(H_GUEST_CREATE) or create vcpu hcall (H_GUEST_CREATE_VCPU) can fail
with -44 (H_Not_Enough_Resources) error. This can happen because L0
(Power firmware) in our case can run with a limited/finite memory for
guest management, so if we are running out of space there, then it can
essentially return -44, which the L1 KVM considers as -ENOMEM to the
user.
i.e.
		case H_NOT_ENOUGH_RESOURCES:
		case H_ABORTED:
			return -ENOMEM;


So I am planning to add something like for all arches ...

_weak bool kvm_arch_vm_limited_resources(void)
{
       return false;
}

... and for powerpc we will decide if our host is the LPAR which
"mostly" means we will be running kvm on powervm.
(For now I am planning to use this dirty trick to make sure these
testcases are not reported as test failures).

bool kvm_arch_vm_limited_resources(void)
{
       return !access("/proc/device-tree/rtas/ibm,hypertas-functions", F_OK);
}


For kvm_create_max_vcpus I will break the loop when ENOMEM occurs and
for hardware_disable_test I will limit the number of iterations to a
very low value for now e.g. NUM_ITERATIONS_LIM=5 (since that test case
does few things asynchronously).


> FAIL: access_tracking_perf_test
>    - Too many idle pages (245385 out of 262144)
>    - errno=4 (Interrupted system call)
>    - page_idle tracking may not be fully supported on PowerPC yet.
>

hmm, looks like there are 2 issues here:
1. one seems to be testcase related: guest 4k pagesize v/s host 64K
   pagesize.
2. The issue reported when guest and host pagesize=64K is since we don't
   TLB invalidate during Reference bit update in L1 - I guess due to
   performance reasons. But for now I will make it warn only like how
   x86 does. Will add a todo in my list to revisit this later (I am
   currently anyways looking into related area, but I don't want to
   block the selftests changes for that). 

>
> I believe these issues might be real kernel issue. If you plan to send 
> fixed please feel free to add my Reported-by:
>
> Reported-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
>

Sure Thanks!

So mostly these failures were kvm on powervm or nested guest related.
It would be nice if you can also publish the results of running these
tests on PowerNV.

Meanwhile I will soon share a couple of fixes (or maybe v5) which should
fix the reported failures.

-ritesh

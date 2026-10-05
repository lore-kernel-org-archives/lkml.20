Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BF030F7FF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178313; cv=none; b=MoPOyHOaTYB5g9619e3SH3f8101iGfnPhMmRHDwvMAROLH1dp/dMTYeRe/akP0rQzZLshgLp2oUcVgslKw0ozITZCiLFP4AyNMVtu1Q12/rMbQZrwWCPvBizmOcaQzS6H9plpYa6h3mp0XCaqJ4iQ8uY/8rtV0sWoZXYYwqI0ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178313; c=relaxed/simple;
	bh=POxxjDSxZlHQfyZkrcAnx7XWj0an4MkT8ArD9j0Rkcg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=TS2p/gq/qWKd0Bni5/8wTmELRn5r+8u8m8Fs0zl9Iy+bLuq+0JGOKObQuas7GKBjEwq12VrukxWL4qCSl+PnfC/dOeA07IP+Z8z9aiPcuz5LieMvPRs6UpBD4R1uf3v26Eaf5EWSxFN5gKPtiXwDtlmeWnnNCkUd3wnOuT7DJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHxErgMp; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHxErgMp"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so1675302eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 22:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791178310; x=1791783110; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cIbXE6R67m8wmmcQnF+5IRKqUHaCj3Oi7gyWQv3055A=;
        b=tHxErgMp9X5jGre1UVi3mM0MUN0Rpc1PNllHJYmRU4hEXHbRLeozT1gqMTittgT31W
         x2sg52MuGMRThqItgnahcV6IQ0aqPViMwrS6EaYSaQrNNq/DeY1NyiwTxDZdiPeIDs8d
         8RmGfttr0gTc6sU2RVbhFmgxz143RfivFeGB+Izev0X4/aJ3rN3r9iMLSMBiJbW4BPSM
         UYxdCKYTcjMp+JqF+rlb354/0m3ieqn3bT8UuWBFQQlFC4dOHa5lmP3YoGkzC+aCjtEm
         VlNv0gEwLoBfi92LaETkFOE2f36zmw+4kuRp3tsJAIfdVdy73OJz/5LRVEgMYinMUA5E
         KS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791178310; x=1791783110;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIbXE6R67m8wmmcQnF+5IRKqUHaCj3Oi7gyWQv3055A=;
        b=aPzDgJXlDbNN9V/h7ke0m6KUgiRbjA8R6t6RFni7+xR2wML0KnX2uCygyrlRWowucX
         OBeh4j3ah/WhBxCZ+NGUFJA5ZfhkL/FtqfBmd2MCgoMhlyAIiqBi1x61sxcUCS8zVXLS
         D5XKGuh+jqW76VFif//5DFY+yQpy/R7EU2hhjXx0Tu+BxswY0rp4zsAyaPusDvB2Uuva
         ITJ+lfNz/I1QV94Bn6ChtXYVc3kPu3C+xeK6YBFTjVsYRVyjlZSM9JgVmquahWh5/q5v
         CEQEQGFVoPuecaMLu/dtz6O4i0f7upckV87z+dgkE5FrxAglkyznc2XmVGta/Y9K4Jb3
         358g==
X-Forwarded-Encrypted: i=1; AKwUvBym2blSDYo812GLLTNoJ0uMwX3f+Y3kBCHG/Wkv4OPe3qWQLba8B8KwCn1Z525hxEsxRxvcVsbABHV9t7E=@vger.kernel.org
X-Gm-Message-State: AFuF++kAWoT0Nm/ad3mQUorwrMCociW+9wjUZ4nNF3mD73Dxsblqxeql
	F0lyQ9dRLWm3jsk7L1S3XqQ0gyNhvxQbYoW/aVRrb/wCpy5IHPOEHJI4/dPnCQ==
X-Gm-Gg: AYBFou2pbD6BhIvgZ0Mt/SqhuNh/EC01KBQVLlFjG0MpRxmibXdw2Gf+jOq4Jh+NGB9
	eOz7C4xQpufNXl4Qb45Tt3ynqbV9bE5ZRhF2zKKoBEB0xyj+JJ3UZVVEoo0gzXnNSVxbNB2yveq
	N5aXvQp7X306ePvxcNBqtNMHbl4TA8sLQx/W/W1HGuXizMiNrbccA6/U1RuKEVSkC9/UpFe1/b1
	9qgJUB51k6zUQhyyCrPyzRRWZ0p/V51APTvYkcHhrYJBsB+uldBaP8uNj4kYuX5X43lv0UoOG++
	z5gv4bdB3z7rhvBnuuM49yRLuzHm2NQCGmgdzFXgUcaeEZ69yHgaycED/mgGJYnRFGeNOQIH9+J
	BAGEYhoTABTQqCGjSCPJqauxOt9Di94AlTRY1ag/g1FT4trmZBJozsqOq9Vjh4kkeeJ3AoYGcF1
	Nu7g8h7ck7ZMr4b+rYPNmsxgR+TZEjKc/PeXuVePtU6SmiObwUbphz2ILbyfIewVJrQ9mOJLiup
	XnhJVBhFftNp6HOUVQR8+yvIQ9Wh6T2bVH+Lk6zKFKKSwsAi91I7CmU5FL9xktn
X-Received: by 2002:a05:693c:69c5:b0:34c:45da:9b5 with SMTP id 5a478bee46e88-34f150c28c4mr12369259eec.20.1791178309882;
        Sun, 04 Oct 2026 22:31:49 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271612e9sm10257390eec.12.2026.10.04.22.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 22:31:49 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] KVM: selftests: add powerpc support
In-Reply-To: <asMN_TAX-1_J3jiP@google.com>
Date: Mon, 05 Oct 2026 09:55:36 +0530
Message-ID: <fqykkc3j.ritesh.list@gmail.com>
References: <cover.1790101179.git.ritesh.list@gmail.com> <pkxwkffc.ritesh.list@gmail.com> <asAydfQLscU6rXQL@google.com> <h5j3jn86.ritesh.list@gmail.com> <asMN_TAX-1_J3jiP@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


Hi Sean,

Sorry I didn't see this email before sending out v6.
I think we can ignore v6, once the discussion here is sorted - I can
share a v7.

Sean Christopherson <seanjc@google.com> writes:

> On Sat, Oct 03, 2026, Ritesh Harjani wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> Also note - I will open code the TEST_GEN_PROGS_COMMON and will skip the
>> kvm_create_max_vcpus
>
> Oh, right, kvm_create_max_vcpus is a common test.  Can userspace detect that it's
> running KVM-on-PowerVM (in a not completely unpleasant way)?  If so, an alternative
> would be to keep the KVM_CAP_PPC_SMT change in v6 (patch 2) as a prep patch (before
> adding PPC support to Makefile.kvm), and then add a
> TEST_REQUIRE(!kvm_is_on_ppc_powervm()) or whatever.
>

So stictly speaking there is no simple check like that - however, I
think we can skip the test when we are running on pseries LPAR (meaning
trying to run a nested guest). We already have the check
is_pseries_lpar() for access_tracking_perf_test. I think we can re-use
the same check here as well.

> I think I'd even prefer to take on an #ifdef (to scope it to PPC if necessary)
> over open coding TEST_GEN_PROGS_COMMON.

Sure, so will add this check for kvm_create_max_vcpus()

#ifdef __powerpc64__
       TEST_REQUIRE(!is_pseries_lpar());
#endif 


Actually I was thinking we may as well use the same check for now for
skipping hardware_disable_test on pseries. Because there also we suffer
from the same resource limitation. Let me know if that sounds ok to you
or do you want us to skip kvm_create_max_vcpus() only for now, since it
is part of TEST_GEN_PROGS_COMMON?

> LoongArch open coded its full test list
> for some reason, and in less than a year it has started missing out on new common
> tests.
>
>> (& maybe few others like vm_types_test) from that in v6.
>
> What's wrong with VM types test?  That one really should Just Work on all
> architectures.  It doesn't run on LoongArch, but I assume that's
> oversight?

So the test doesn't fail (it gets skipped). However this cap
"KVM_CAP_VM_TYPES" is only supported on x86 and since I was planning to
open code all common tests, hence I thought I may as well not add this
in the first place.


BTW, based on this discussion, I think I will re-arrange the patches in
the following order and send a v7. (The Makefile.kvm changes will only
get added after the main patch which adds powerpc support).

cfabdb049bd7 2026-10-05 [Ritesh Harjani (IBM)] (HEAD -> feat-ppc-kvm-selftests-new-sean-v7) KVM: selftests: Skip hardware_disable_test on pseries
2b51fab87b95 2026-09-22 [Ritesh Harjani (IBM)] KVM: PPC: selftests: Skip idle-page check when running nested on pseries LPAR
f5d1de1be4e9 2026-10-05 [Ritesh Harjani (IBM)] KVM: selftests: Skip kvm_create_max_vcpus on pseries
e45ba15cea25 2026-10-03 [Ritesh Harjani (IBM)] KVM: PPC: selftests: Add helper for checking if running nested
178c9bca0e20 2026-09-22 [Nicholas Piggin] KVM: PPC: selftests: add support for powerpc
22320662e776 2026-09-11 [Ritesh Harjani (IBM)] KVM: selftests: Fix kvm_create_max_vcpus test for powerpc
11b5712b213b 2026-09-22 [Ritesh Harjani (IBM)] KVM: selftests: Move memslot_perf_test off the 256M ELF load address
63c900860b5f 2026-09-22 [Ritesh Harjani (IBM)] KVM: selftests: Don't limit LE dirty-bitmap bitops to s390x


Please let me know if this sounds ok?

-ritesh


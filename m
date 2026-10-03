Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B3A202F71
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 06:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791007254; cv=none; b=DUYU1DuFWq0KrR7Z3/WTmKDpkPF7QjXpR391/xyblniwVyXuPLXav/OU45FlO3I99ZJ2Nf/QmaiMQ6Ec1rVwdqXFU1vb6LvRSg7M2xsyfBx9vly5DlTIO+AvbrcZYT/eIGX7c0CSt0vg7YISi6D7+G2GzJ7ETZOAfi682CaP3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791007254; c=relaxed/simple;
	bh=1697bVjmVRQYp3+PmPQ9GBr0rthUU0upfRdLG2/i3nk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=FoTCJfAQvqv6XrzLeAxIymoNVs+oWA6GnMCzeGxW4lTjyPnjqkPjeoToO78DjSNEcMy7D5yvx7lo+43PlCphKz0Ic7RAiEoNTs9NH5BdUF0iB+AbVJ3Q8Wb8Lg19NFVxQQgpMm961nV60bN7DFyxflXKEfTlC8LR//Ymh7f8D9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOOWQvLY; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOOWQvLY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso33708eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 23:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791007252; x=1791612052; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BHbeuwzJ3G6xnJ7FZ53NVkGVQtvmx37StvDtCuaGguo=;
        b=BOOWQvLYBb/Hcw96wx6zB4Mr6n2BkbIT86B7UQL/SNw07dNKjLrIeBqlFy5VAEnmt6
         ijtlG1Q/6TT76YrF121mdCLsF30CvI++O/BMf4fsFiyzMquSxlZwIB1umzYFBF4jzJrs
         b1XeuACQfLVBsoyGoZWQ3ut2puVPDg3r2x6w39v5g7yctASxcUDImt34BN9aNvoTDvV2
         SHPHjyL5yUCXy4StinXvWYz3y4UAT4WpFoKJCBQ+D2iKPp/LI1cB6rJehTGACU1mjPrH
         IMli9rNoSz+aqNpFQ3aM9p/jna+l+erZhxtU6Xi4gJiPvdfOzfUstsewTywdTW0Pto7P
         BVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791007252; x=1791612052;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHbeuwzJ3G6xnJ7FZ53NVkGVQtvmx37StvDtCuaGguo=;
        b=v8xumsAbUJMKjjoocDx/tz7fjDwMTDGpEEbHpedWNSwyyMMrhVAPBHmGXtX/13KgLZ
         wYpYEBb4OVrKBMAH5YbD4tFFZnYvtPT+gl8CvOj0+ZY+gjhhSVlI5iNuoH2N/rEhwDEs
         JNkvv/xWLrj5SuHmxGmJNV+nU2ocj3ZkTgSTBKg1E+DeaB9tSLzr5Lrh/P0g4KvLJbiW
         z7fK9U4tBH7ln1dZH1hukqrj2ZJiQV/xlX2/rMiv+/o3WCd5D30EIWoXqyjsZ5SwiDH3
         t6Cj1ej0pGgXQXK9hOtZRCKREMHTKN6EL72zDcTkUHXbIx2gy9nq1wnVRUbXFVop0HFG
         SKDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzae7KvJQ0f12DaExdD2wo/n62gUABEijYmskTWLytSyuUa8Bqrj3+0BMINNg9hBCeZrtUVZUxu9XLfGE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNiXP/Q6WhoXK1WZrkmogxAfzBfWM0GX5dDUs1q4ttBN3fQPzY
	oRcjewruQNQVAChhPxvux9dHaAmpqv6ycd5cphM+0PO6nasIlL0TMjKvrViGOw==
X-Gm-Gg: AYBFou3tbStvXyZtY/f/b4TKznoXAFNgxhh5cuE3TsgR961JyXNmVmwAHxukgHn1+6T
	Lw6FT4+JPYbAN4iic+u46U2+DxnBLNLFsMgVuv09NJn1GxxrzQHhUZiI49qflbh6l/CsPi2V+Uf
	T9aiVEgKyt/t15pmS5TlSa63wXuZpY6Pns2hFTVEfE9pvSgFmcXv8rNh7f0gaunfUWyCP5BJfv1
	C3KNRNyL9cPMPUnnFP3tR4UwJznn48EnIIcDAW1kaEdWgoY3DZZNXPzSqb6mAt2mmJCuKoL1Cy6
	oqPU98t3S/c1YsCnLRN1Lb3C2q2FzJ7981BSxZ2BemSl89lj/+6/wAxXuEAXeUSb0b66OQgL/TO
	pn2lft2SGpA85KuymS8+vUlDbCLQlqUlrKlbRvpspBZ05/33PwrAzEF0j6JoiaCBFDXCACdl3bD
	pdAdM+ITTdfzzy/djo2vcR3P7clsMvaLRHs8BO2hJR6b88s3lpOzqhWwv3j6jnKh5bWueckvPtY
	9m7cEL1JiGoMe9JFCjPHZh3xv4Dx0ReOGGRLuhtvhQQo0mCO6paHcA=
X-Received: by 2002:a05:7301:dd91:b0:34b:8ebd:e3b with SMTP id 5a478bee46e88-34f150d946bmr5245863eec.14.1791007251743;
        Fri, 02 Oct 2026 23:00:51 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm25349897eec.18.2026.10.02.23.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 23:00:50 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] KVM: selftests: Make kvm_create_max_vcpus tolerate ENOMEM
In-Reply-To: <asAtNhSQHDy_k0d_@google.com>
Date: Sat, 03 Oct 2026 11:15:20 +0530
Message-ID: <jynzjq1b.ritesh.list@gmail.com>
References: <cover.1790101179.git.ritesh.list@gmail.com> <25cdef9c45a1270dcad7e9c4140e56b6953eb27b.1790101179.git.ritesh.list@gmail.com> <asAtNhSQHDy_k0d_@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Sep 22, 2026, Ritesh Harjani (IBM) wrote:
>> diff --git a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
>> index 59ddc3757943..45a9d8b369b5 100644
>> --- a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
>> +++ b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
>> @@ -20,16 +20,29 @@
>>  void test_vcpu_creation(int first_vcpu_id, int num_vcpus)
>>  {
>>  	struct kvm_vm *vm;
>> -	int i;
>> +	struct kvm_vcpu *vcpu;
>> +	int i, created = 0;
>>  
>>  	pr_info("Testing creating %d vCPUs, with IDs %d...%d.\n",
>>  		num_vcpus, first_vcpu_id, first_vcpu_id + num_vcpus - 1);
>>  
>>  	vm = vm_create_barebones();
>>  
>> -	for (i = first_vcpu_id; i < first_vcpu_id + num_vcpus; i++)
>> -		/* This asserts that the vCPU was created. */
>> -		__vm_vcpu_add(vm, i);
>> +	for (i = first_vcpu_id; i < first_vcpu_id + num_vcpus; i++) {
>> +		vcpu = __vm_vcpu_try_add(vm, i);
>> +		if (vcpu) {
>> +			created++;
>> +			continue;
>> +		}
>
> Oof.  I dislike this, to put it very mildly.  Is this the KVM_CAP_PPC_SMT thing
> again, or something else?
>

No, this is not the SMT issue, where PowerPC encodes topology in the id,
so we cannot use the full MAX_VCPU_ID range without a valid SMT layout.
That problem we have fixed in Patch-2.

This is resource limitation on L0 Hypervisor for KVM-on-PowerVM
(nestedv2) case. On nestedv2, KVM_CREATE_VCPU is an hcall to the PowerVM
hypervisor (H_GUEST_CREATE_VCPU). Now MAX_VCPUS or the MAX_VCPU_ID are
the max vcpuid range limits, but that is not a promise. L0 can still run
out of guest management space, i.e. the hcall can fail with
H_Not_Enough_Resources error as per platform HCALL specification.
KVM maps this hcall's out of resource error to -ENOMEM.

> Assuming it's KVM_CAP_PPC_SMT, is there really no way userspace can pre-probe the
> "real" limit?  Or modify the test to enable KVM_CAP_PPC_SMT and do the proper
> striding?  Eating -ENOMEM is all kinds of gross, and I really don't want to add
> __vm_vcpu_try_add().

We already probed for max vcpu id range limit. I don't think userspace
can probe for anything else here. But let me think about this a bit and
get back. Maybe I can see if I can drop the helper.

-ritesh

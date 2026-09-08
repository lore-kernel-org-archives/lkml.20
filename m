Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176259B68D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890923; cv=pass; b=oIWBzInjZ03oiGJXMO7xvXGPDUo1ZMQpbQyU/vhkajDFmyCaAxgv/MOe9lGF3c6aRMFpSvVOnWEty6luxFw6bZPknqJHPE7l1jUl7LKXsWxcvFIRJD2T3XZJlmDSzP020uxJ+XB4EWnl1Lfx7Yi0x/3lGla+SyEyENEP1FkFfpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890923; c=relaxed/simple;
	bh=ctxwmMZG56iPJS4J71g6McGGkHju65sE/xDpcDOUvZM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AM8m2wtCNy+9u1VoIHI8JHquHTS+nJdMP3lAYB17Y4QTQMV8qaHY2Pewlhptxq7odzRKXusM8sLohuT0AbbhQmYxidhxZquXC7dRFKmeTf3RKxBJLvRCEVH7NseWOlzJ8DoVYNDPVntLlCCrtcWMyrpiOOhrWZSCCkIrcv6w8xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NtvV63uS; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NtvV63uS"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90e7fd978beso85287476d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788890920; cv=none;
        d=google.com; s=arc-20260327;
        b=JYIji0GbZOaDaM7CRtn/gLYMqqwDMWMg0aHvCclcq3TdKdLb2ko1p7TE3CwaA3ASkt
         g16j2SM3ZW1jJJFjwgFCFi7xLtelflv4jEKr9lKfUj/g74NkLwPWlHXC30+Tim+FVjVO
         6yOAae8Z4vfGTrRnR9ueNe65QJV69kchM8HK0r4Pz3CeH9cOM3fYklX+r9ciEGaCV2bz
         tx/QPfYS5CWqP5dNtAZcuUvyzoWcQZk5kxb9xs28yzpKX0IopiEf5Z3u9pJdc+bgY19M
         DHPh73P2VX55TXnEp6tXsz7p9wblnVhKS6oI5f+6zrOjFUgM7Mouqw88MVBU++mn1OGW
         dhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=XkkCs0H0gi8/nvDnbQ0GVT3d+JJdjCr4VH0ja1Y149M=;
        fh=HPaf7pgFZMnH30TRVqDgPLkZ1lTrNc65tRzD9pDmTOw=;
        b=GhjLeeAv2A6uODgJE8IZL8KJ9ZIj4qAJhkjquVi2+mrU9cnmKRguQArxxIJhuMPMK2
         6vLBIg7y7Nw1dVEx57g38fxGlphFh/wtMYxvqwfbaSQNU3ykYJJw4wtIPYNKJyLLlXfv
         FslcMAEsIXQ2mbxWJXYmvGcUZwVzeGaTD19/MlIIMrj/vFVIlmHOceT3dmXLpLZdi4yH
         88UIioCY08hiH5IxiTqwxFb7csXeKq8Dwd05Oz4VVQrmVx5eguq/BsOMUuyxEnUZ5HmU
         r4lV+nmXLWYkfrsS9OyPNZedEuLgVAiZESZz+ahMltvEqWNjUZ11zeEgBl50B4axUy+a
         3NxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788890920; x=1789495720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkkCs0H0gi8/nvDnbQ0GVT3d+JJdjCr4VH0ja1Y149M=;
        b=NtvV63uSxZbTe4MqYVxBGvDmGALPFsg4KI0EezFDE/xSmB7PKgJZdDzHTroZ25dMd0
         r8j9rikrAtywianuNUdNCozi4b4L5KDAQlHJ0yC1jXlUaQJ2HLEXVPLzQ9/tmyyw8/sK
         MQcKXTYgdmnn5Syts0/YkphryNVpGtoAqelPGl0nauMVB2HwScbht2lD5YV378y6DDZm
         bJ4bKIoswOpjKci+hw19nKfodHfweLVdrWM42lPaLL9vAyjBm72baTiqy9DDwxoC6Fxw
         u8eSeeWeCI99Od4tyKcphZ4QH7YLrbv42J4oNf4RW0jymm9gJKwVLrrNipVOZeyc4f2B
         pFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890920; x=1789495720;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkkCs0H0gi8/nvDnbQ0GVT3d+JJdjCr4VH0ja1Y149M=;
        b=rBhPXNJiUq5b22la/PE7AEuzjMoeX0flCh7IL0eMSSpEKa3sTmtpn1hMZ8UJWdozQ8
         gtCDUPDv5Y/AjszO3c+3FCYd1gHDHC5/8nkS0FYxUteJeIeWWQ8dZWyEd/P30j7+N+df
         vnxevDns6MnvZKTu/jy9OfHBbyTsGlRszzW8I3hT3V8/cLNMDtxDZg6D+hBVsJ3JQCYf
         apwIpfOM6LaBuHEc4JMq4Qo+EcgoSGN/PKeH7m9EHKEeA0inF1RL8WLhY0jGycE4LQYD
         JcOwpDOwxCdJBIUFFfMuJAg0xyLGo6N0gZKvlWmH24nsHE2ioMcDeAxMxxhb3HlPG7eR
         JLAw==
X-Forwarded-Encrypted: i=1; AKwUvByImVduhyctB42BVNVCG6XSCEvEbIuzjH0xtbxiID4qi+dnCxr543UIn5MotdKCOAw30OCnLI1oYcMb4ds=@vger.kernel.org
X-Gm-Message-State: AFuF++me2SkgQl5FQVDauAvTp67zObU/Ef81F38leeHcVXV41CUJDI4e
	Xq1Y5feC8l0vwxy4ZpHFVu3O0R86a4zsM3iHz7NlLsWFIFDmh/4GRIDXTnb0KjnYao6VqVH63b8
	D5QKMpQkjyzxWICH1YyEj3dcgArlXsDk8Zh84FXPh
X-Gm-Gg: AYBFou1eo8j6QvwmYpdCUZ4/byVJdKiafLQmN6CTxk5qmibkdVYI5dMhZoCK+uWzGAG
	8DEq+lbipDyPbjULyH+vViqAam+bhC4N72FiZqLIPz4iQmrLi7U30QSOYHna6vvvQBMxVgMIvly
	zEAstC9CyQpE5o6E8dHfqlgtIakbPZaYpX+vezwCNWEt5ABIxiBAjH5IYuHK6EfXfhwDTv5k0kq
	x3ASmyDUvSe0PDSonmfzGvK1Iw/OAxWTTav5pPCZF8zrY9krseZMdPzORIhXZ1JizNL33kDy9Jd
	rLznhuoL9WobP1BtCZ3sUtz7v564oqeiJ4J4AGdy33l2ePfdq27YfSMM0JJjrRJC4MOfOD8qQ2k
	5D2LTyF/gqxldTXwEJ9UaMrjMmrfiaWUJ
X-Received: by 2002:a05:6214:c26:b0:910:5235:14f9 with SMTP id
 6a1803df08f44-91052351570mr213426586d6.21.1788890918818; Tue, 08 Sep 2026
 11:08:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 11:08:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 11:08:36 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ap_Bpe7dZm_eWsJ2@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-3-15ad654a50db@google.com> <c8b7a800-58ed-4ef7-91bd-31da77763717@intel.com>
 <ap_Bpe7dZm_eWsJ2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 11:08:36 -0700
X-Gm-Features: AcwNN1VP_qB0f4TJcoKYWPiMzrCml_G_3zCXJ48132tpYvgvUSaM73PgQ25Ao6s
Message-ID: <CAEvNRgFHTAPYTVQ8a_PVdFLqQ8z07Uep2XhA9r_Ypw+D0WAC8w@mail.gmail.com>
Subject: Re: [PATCH v14 03/22] KVM: selftests: Initialize the TDX VM
To: Lisa Wang <wyihan@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> On Thu, Jul 23, 2026 at 04:44:08PM +0800, Xiaoyao Li wrote:
>> > + */
>> > +#define __tdx_vm_ioctl(vm, cmd, _flags, arg)				\
>>
>> sev uses the name __vm_sev_ioctl, I think we need to keep them consistent.
>
> While __vm_tdx_ioctl matches SEV, the TDX selftest follows a tdx_<scope>_*
> naming convention (1. TDX prefix, 2. Scope: VM or vCPU). I named it
> __tdx_vm_ioctl to keep the TDX codebase internally consistent.[1]
>
> Do you think we should align with SEV's naming convention instead of
> sticking with the internal TDX pattern?
>
> [1]: https://lore.kernel.org/kvm/489f3c7b-db03-43dc-bb64-910a0fcba31e@intel.com/
>

Given that __vm_sev_ioctl and __tdx_vm_ioctl aren't likely to appear
next to each other, I think it's better to have the tdx prefix earlier
to keep the TDX code consistent. To move things along, I think we could
continue as-is and not swap to align with sev.

(The sev functions actually look kind of inconsistent in sev.h, but
that's a discussion for another series.)

>> > +({									\
>> > +	u64 r;								\
>> > +									\
>> > +	union {								\
>> > +		struct kvm_tdx_cmd c;					\
>> > +		unsigned long raw;					\
>> > +	} tdx_cmd = { .c = {						\
>> > +		.id = (cmd),						\
>> > +		.flags = (u32)(_flags),					\
>> > +		.data = (u64)(arg),					\
>> > +	} };								\
>> > +									\
>> > +	r = __vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
>> > +	r ?: tdx_cmd.c.hw_error;					\
>>
>> I know it takes the same handling from __vm_sev_ioctl(). But I think the
>> handling for hw_error is not correct, at least for TDX (I didn't check for
>> SEV).
>>
>> the hw_error is the additional info, to tell the SEAMCALL return code, when
>> the IOCTL fails. KVM requires hw_error to be in the input, and KVM puts the
>> SEAMCALL return code into hw_error when the IOCTL fails due to SEAMCALL
>> failure. That means, when r == 0, the hw_error is always 0.
>>
>> I think we need to provide hw_error along with r to the caller so that
>> caller can print them together.
>
> I think the value of r is not important, because the ioctl failure
> is already captured in errno.
>
> We only need to fix the return values for SEV and TDX and have
> TEST_ASSERT_* print formatted error logs with errno and hw_error.
>
> - r ?: {tdx, sev}_cmd.c.hw_error;
> + r ? {tdx, sev}_cmd.c.hw_error : 0;
>

I didn't look in detail, perhaps Lisa could look into these:

+ What are the possible values of r? Is it always going to be 1 on
  error?
+ Is r always positive or negative?
+ Is tdx_cmd.c.hw_error always positive or negative? It's probably not
  one of the standard Linux errors, right?

Perhaps squashing hw_error together with a retval conflates the two.

In the lower-level __tdx_vm_ioctl() we could pass a hw_error and have
the macro set hw_error? That will allow the caller to print both.

>> > +})
>> > +
>> > +#define tdx_vm_ioctl(vm, cmd, flags, arg)				\
>> > +({									\
>> > +	u64 ret = __tdx_vm_ioctl(vm, cmd, flags, arg);			\
>> > +									\
>> > +	if (ret) {							\
>> > +		TEST_ASSERT(!ret,					\
>> > +			    "%s failed, rc: 0x%llx errno: %i (%s)",	\
>> > +			    #cmd, (unsigned long long)ret,		\
>> > +			    errno, strerror(errno));			\
>>
>> The if() looks silly. Why add it? And why change it from
>> __TEST_ASSERT_VM_VCPU_IOCTL() in the v13?
>>
>> Considering the suggestion of hw_error above, I think we need to introduce
>> the TEST_ASSERT_TDX_VM_VCPU_IOCTL() which accepts additional hw_error?
>
> The reason we could not use __TEST_ASSERT_VM_VCPU_IOCTL() directly[2] is
> because it formats ther return value as %i (32-bit), whereas
> __tdx_vm_ioctl might return a u64 hardware error code.
>
> I agree with your suggestion to introduce a new
> TEST_ASSERT_TDX_VM_VCPU_IOCTL() macro to print out u64 hardware error
> code properly.
>
> [2]: https://lore.kernel.org/all/a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com/
>

Is tdx_vm_ioctl() the only place where TEST_ASSERT_TDX_VM_VCPU_IOCTL()
is going to be used though? If so, maybe we should defer introducing
TEST_ASSERT_TDX_VM_VCPU_IOCTL() till later.

I think the issue with if (ret) is just that TEST_ASSERT(!ret) already
does that same check, and so we can drop the if (ret) part.

>> <snip>
>> > diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
>> > new file mode 100644
>> > index 000000000000..e1ffb67a106c
>> > --- /dev/null
>> > +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
>> > @@ -0,0 +1,120 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +
>> > +#include "processor.h"
>> > +#include "tdx/tdx_util.h"
>> > +
>> > +static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>>
>> make it const, is better.
>
> Thanks, noted.
>
>> > +	init_vm->attributes = attributes;
>>
>> Besides CPUID, it only allows attributes to be configure but leave XFAM as
>> 0. I think the changelog needs to explain why we need to configure
>> attributes.
>
> Thanks, noted.
>
>> The rest of the patch looks good to me.
>

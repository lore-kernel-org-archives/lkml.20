Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1711448F001
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909882; cv=pass; b=HyzGvp1CzuB4e9lu6QYcrRq7+xAIPtO4ssi6LIqNwFWpBluGQfon4PH5AjCkRgqcRyNFCCLRv2GesCmjLaMW6tMdwzHamzK+VqT61bEbvXPrPeVAoZy7NWUIe1P2e2dfI1RGZi2NrjUudDQbTDNKsFQKG1IP1ynFYgZMzSh86j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909882; c=relaxed/simple;
	bh=BUX/j6GF6XPucpJCZBKJcMPFmpJb+KNmwo1Z/5+yXsg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4p+uqv18aRPogKomqE+b3Kec4AZvsSBfJs+JsCA/fMSPeGiu2libyqm/oza87fgQuZCr7Qu0Fa8lkPsCQxPcqkh5rGuMTBUT9bwaMBBjKGZBaqaCj2MhEn04PFD+9zCiRI+jrghK2ZVnVsY6LM25/MNNZnFwGJH0Xdymbiwyoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iciIM+yf; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iciIM+yf"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so6739646d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788909880; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlosNeSrPGpsFU1Cp2R5JSL4A3r9vUtOCZljukiLnjTZWmhNiD/jcjGHyxtYRlG9tP
         d7aWNrArTMFbWFFewTr4b/W1nfF0ga+RDzgvjVQZdpd0TzoUoN2movdcdIWu2pWARn+0
         9jQvN4jBCe2tOHAw9MjVq99xpoz+Ls07h/B2WthL+b59FdxK5Wi/SwP4dZolHihyfQ0G
         CHtW0vlBXQ4GfphV+Hc3/gO609JNN6C1nb2DInuQO7B6bvZJxSF9STwyPeOnFbPUlL+Z
         +SCHZE3Rm3O7z9qnGh5RNQo9yX3JNaOWTNLjVMeC4YDABZT5fWWVyTO5p/KeOoWRv55h
         PQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        fh=YWKuuSE+O+swzaMv/BkOVHo+hOOvfsaFjQwAjgzKL1g=;
        b=HP9YMcXZLnIzZ9robH0dbAt+mHkF7GRK9XDYEtlzgaxImpaiNSeTC2t3iDskzhmsrH
         pkuwec7sn/iA8wMGPjkBkVYCDd0ixGE/66qZzcBiAgLhD3+cS1jDuZ9ipZI1rKDpbYQo
         AROPNhMvwLq3FaIpe850sHahxjEw+cK05fbziCvg9IM6Llw50v1bzt/Mju2iZaJw4FPv
         ssBXXUfyCa5hpdoZgKhDlNY/MALQjUT+95bnyKdTpXFxgF0tswkoviQIJONAMxFlRh8r
         DuhbwPKtHh6XyLbnadoJrJCrNwA57yuKoKJjSpoNH/riGK1d8aGVQa32OI/NCGed44F2
         zFww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788909880; x=1789514680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        b=iciIM+yfT1AHLW24zESpQnkRY48v0FlVHuK+O44tSw3v5Q8vshEESBTu6M/HGC+WzZ
         +utQ+MZF4vB2yVzggnhBIZi+dMZsVlXDucj6O4c1yMEYbaVzuHVXUyg6PMfobS0nf+c/
         cG4MiKp9YUskVAcj1Nkkn3N2l1svvSd7YbtfD4NXp+gvxuV7TwmWnQYn79yYUBshgTXe
         tO9c4oTY1JhkPa5m4jfXKWxaVbdGIi+m5TSCHeqziMqqYxl+R0NqBJd/OTjOXfCwqib/
         ie/Oc0k3pm3AIwgNbPb953Ho3ObLsb+FE6kGtvRlgoSs2iF+50QjsChG/Q5fxVVM75VW
         LiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909880; x=1789514680;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IN5QQmb/lTANWR/iwoSBOuy02Mh22swkqv8V9Ybn/0=;
        b=B4EIg/X7+4PSlzGsco3Zqdwl/AoqAzrF8KYfZ4dterxO7fosVFWI48iDSMvXigfq+4
         ZT6Wzt6oP0oXWOKaWXm/dU4+Se+hN45RPw0YmJNAkXd84cVN+f3deoaZl2KYZg1xGQAq
         M4qPeVv75SmP8vXsmElroKi+j7fHK6bdIMr+9gUZEX5JY5TjS1En0hKbWeyWERE0hjjM
         nb/xsmDeUofuzheOQJRFlFS3v8D9RRQxuehvo4I7VK9d1/1TpKgS6qi9NPTTNEL3P+EU
         ncHCLTjUyXJDriSoQvve+T5nkfzxNQaAV2/0AgnnNwVjuZ7MecpyfU3aeM7VmukYQA9h
         hUkA==
X-Forwarded-Encrypted: i=1; AKwUvBx2WXnSsduWoFBiYWb0zoK4LR8Ls/Cw8srl4zkPtGPgN2z7B9uxBfE4t4Rr6TQyKQfs2pkUWsLpukKK5bU=@vger.kernel.org
X-Gm-Message-State: AFuF++nVUguzR726/xHlTsxy0djAhtkT9rrCnYd3qhAJFLYugAHzMisT
	hByR3Wj48IvLp4Cr7Knnjem5RQ2k9XaFZMbVZyOm9xd0J0hF2HNtZA0CRYKWqsUm5nVZb+AGEuM
	6thB+oF/L0NhCFRhzUGQm4B+RQAcm4Ubn/Bc6pqM6
X-Gm-Gg: AYBFou0jllzCnKXAb/unQrYMFfO3DBysjc5+9beIUl7UpwXI+aFdiiyqkUDVEpaEWby
	vU64mX9UGFTCK+/Jt1A8P5zyY9UIfXPCeclLu52tThN0ox9momABjS0WdK8Jo+kFYqdAxfU3rqz
	35q+Tu1RYFQcKybkWoZG6o3fdTTAN2pISu3lYSnOLDSizpHPchBm/NibCHAL0XCjI/ZOmUMzlLV
	DD1HWlHZKvV8G2rHne1pBwg6txCiaKbEP7cJvqJKOEzw9hXc2vmGWXI1iVPHvKk37a/T5jEGNem
	C0kd7k1E6P3UlJYRguICjEuRxN56oCgtKoYw9nWeay4N2hRuMxIGO1Y4g/12TFCnegLAztzuRxk
	fsTya3AhiPtNiciSAwfgvp4v6oWNCVoQ=
X-Received: by 2002:a05:6214:4a09:b0:90e:7de2:d81f with SMTP id
 6a1803df08f44-9106b407918mr47732286d6.20.1788909879267; Tue, 08 Sep 2026
 16:24:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 16:24:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 16:24:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <0a08eab7-e093-46ef-97bc-531766cdbcf2@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-19-15ad654a50db@google.com> <0a08eab7-e093-46ef-97bc-531766cdbcf2@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 16:24:38 -0700
X-Gm-Features: AcwNN1UULNTPjF9-p9AmAvuYgtyt3ObShfxcFD10uTDSDoS21CnWX7JfXOpZMy0
Message-ID: <CAEvNRgHE-c09hdeLqkUfGdnrAUkENuSrdNqByXBYr3N=HSbB_A@mail.gmail.com>
Subject: Re: [PATCH v14 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
To: Xiaoyao Li <xiaoyao.li@intel.com>, Lisa Wang <wyihan@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/23/2026 7:13 AM, Lisa Wang wrote:
>> From: Sagi Shahar <sagis@google.com>
>>
>> Finalize TDX VM after creation to make it runnable.
>
> The changelog is too weak.
>

Some other points I can think of (Xiaoyao, please add on!):

+ Why was kvm_arch_vm_finalize_vcpus() was picked as the lifecycle hook
  in which to finalize the VM? (See comments from the earlier revision
  from Sean) What are the rejected alternatives?
+ Expand on "make it runnable": finalizing also performs measurements

Just confirming: Peter, you meant to add the () at the end of
kvm_arch_vm_finalize_vcpus in the commit subject, right?

>>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> ---
>>   tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
>> index 4b97a9a1bb5e..8319ae3d9fe6 100644
>> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
>> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
>> @@ -1489,6 +1489,12 @@ bool kvm_arch_has_default_irqchip(void)
>>   	return true;
>>   }
>>
>> +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
>> +{
>> +	if (is_tdx_vm(vm))
>> +		tdx_vm_finalize(vm);
>> +}
>> +
>>   void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
>>   		 const void *smi_handler, size_t handler_size)
>>   {
>>

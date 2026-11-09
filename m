Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254570;
	b=OrTgOmuRscOMICnfUrDDMupxrIae26P2TmxC51M0HZG36sbQhlJg5WEbJn1oiRei1L5y
	 vqiDtPe3i+1X+eoP9XVQiqKykwywVI59pZnn4hMy0OWH+pI4jx/Hvn46hLyCbmG8i9AN4
	 SwlxIxs6qeAB8OBwDYT5UQ+XXTaCttQkcPCeNlKK+ZV+LZcn0kMsZVhDwkpC7MZHHIAY5
	 Tc0bSNkhQtdR4eS8N8WOmDkrf2QPryJ12Q0kjy77l6jbjW7kU7sLlsXKRQiYne4zjbld1
	 ADv7TlR1QuwYuOZuJjUaER+uWfAGINydceuRpoudD5/q3bb6hPQVTc4AyYRetrOAQOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
	b=a9eWJnYC+QebZsBGrKm7z++26zbafJfb+RSyHBdCcvmrsmKYNj7IfDKp/QDpLS8Idk9g
	 bJu/ZbJbujkg9Zz/if7yEMJZ4hs4j9IZVM2PGueA2CgXyFJQX0n5cTyejI6juj4LmkGQ/
	 p3hnCQ7IOKia9ZJ79w705W7Gt7qTZ6kKw0Et/C2CcyJKlEXYKQLElU4o/5pwVSe9dOSyF
	 pt3QiHTvUe6CYo+AwLqxF5erzAYCrUwJfoRGKWDrAzlpf39hF09IPcRzxJSTOsEaIQZ0b
	 f1HCns76W4bduiivwZeQxoIE4/b6boWspK4YiFo4al99twAR8qhj2kfVy1g4IiEoKtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MDVfxjyH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69860A2601
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D69860A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MDVfxjyH
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99a5710ec0dso182086241.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254569; cv=none;
        d=google.com; s=arc-20260327;
        b=W1TBivVbVUfUOQ4e7BXRhAvkdACv8PBgHiHAUVDvixTiUKpvXunnLhM4h8OeulqGPA
         o1D29cBIlrUhyobFaMS9DykKdL8/sh6ljUOl4c36V15RVwAG7xVP1aTKOhCiYtStqdYe
         Pz3tgXq2xwfj6SdS9h2N0wpq8u5lPewsQq69GsPe+j6nYC3UpzGIARX8CTPOSK8v9+8b
         /zifWBJY0V8NiaAqfMcapzo2YMEmSqAVp2zMP03Z9r47xpaI485BEKqBwO0tCttYZ4aM
         Xhr0yk9KyJ90sAfGBaDIUfBIEW5J2T6aFRvkcztaJNRoZUjzVXaHnEASMyIMvyp2YURA
         YrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        fh=HxwztqFbJ7kkK7bUaTN4PIqm7cNZbKFcbf+h7A0mXnA=;
        b=NFTXK/HCXcn9a8jxscv4lYxOMYP2P1XT4VuS/qNLQbFBkIPJ3MF/luTacOoMmk3GGu
         /8uD2/3sB/PYJ7jwM5LN2l1tXSwCsC1M7uM1BYoOQyeLHQ5WIPRfM60AFPG/NVD80fcv
         ogZLV1e2ph5jK3AQq/XdCPqTtGqLVAeD8RtjWvWOyj68zKaLcvr2zcoVyMNy21mXRGka
         vyfOelh1DdGwm8DeKWpw4MJInYKfRHXYd4WZg/5lTVMoaC4/E1AxQpbyzmfj5VJ1bhUu
         oiVaWNwr9yuDTa3GzW3obilcNLT1lYUPGVafBE/rDpo180rLA7Ip5pJV0IqKrDScYJUg
         XQPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254569; x=1794859369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        b=MDVfxjyHJJz7nSVac0/MzxNYBAz0gz5mw1nMRucJC8aUp+/mnDPCU44ZxNDT4hUiYs
         0VO6PuphdsyMx+3xKWYiLk9jOaIwUsbGRkOu0zsaG5mQaDtr2x4nwdguACt/ZWzkD5Zw
         LwYq1XXvp3WJjCiZQPyddb1UADLTSJUEFAooPlzFkNi3lS9+RDyZZ7VAuQXH7AQvz1Of
         0ObyKgznWixBSZh4qMgT3j9WWstoilMA2gS6Kvgh4lHWmYaPSH2nkLlZVxbOEyXYahDe
         7Oxcnxorznvrl/eWoXpjXz8oZ/hixEvnUQqbctYoU7NfzmkCWSo36Kc0RM5K/Bh9cL+5
         qDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254569; x=1794859369;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        b=KWIY94IM1WJMBHG8lOePQiYJo9eLtht/EXFbcvxPHKxwNGJ2FgON9Nh+q0JgasCZlY
         o+uIBXFx1xcxsJ4McEsrcCULf89+RyuxNTQiHNLAdYqtGU8oNrginUZB07tYzd5Ktgin
         xbjkU0xxk3F6+A92GoVy2pw5cBHX3MPk4eiCSOSu7NKoyFYWCi/zfyO6JyzoIIeu4GVh
         3hhU6CD1j778a0d0hUdtUNa6Q/1RT3OofVPsBnI3+irB8ou8wchEt+lcNVd1d4+gBoi3
         FShPeUAYC/BhW31OoMtoJ1wbjf40NzuTOTyLG+pMvZmXJ17pD7ANwP8qqizW9EfM5lC7
         4isg==
X-Forwarded-Encrypted: i=1; AL+hErGsXyCMW9Br4ymj/Vl4RK6HNcl8oq0BqazzRe8GMM8YvmfenTAGhFQAAK/yf/TOzeFYMoMUn5+qM0iQJYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kopVWI0S/bMH3u+g3IciW6jHCXL2yhu987jfU2U5lzpoZCPJ4
	j3/Sme4bjy2yhPtukBnvrGoK1J/3dr5+5F8bPGq+CTi64/YkIvWB8PHcjJcpSwv7HyWbAjCAvYc
	V7WDivcnuxuO9w7nEnJ6cmTCvB/rTxJacwiupQud5
X-Gm-Gg: AYBFou15UewIUFEu5Qhgos7Q3mSqK+rOsUQyfT/f4I6M2tFEof001DiSS5B9J/GrKli
	4NrZ/AoSw/V9lKKjGR59KdYfQhHcB0JVnRvTkDwncTiPqNLtHhibsGXUdew84+lsskbFRRAgrgT
	Zkt4GesNK0IrTxn3FsMB2Rjfv+A9wzxTXAYJNA9PMe8y9UMl3QlCQXtRERwc9Nhwg+xW57bd+RP
	zMjLrKoxDVL/YSO6dPMFnJJ7qTXZy1ko9Tk4GzvUa78rKvt3jWV4X7VE5+oLXMtIfVRZ/Zjzr2c
	WL4TjsOpZqCl7ujWqQiohG/IAqEA6iVz712X/8OjGwEd0eoB9Dsrya5OV8nukjd/OYccDdcn9u7
	dVEVU7LHvs7rADxetI8YUjauqGyT6empIgdass22Ve3PpIWp9x6Frcyys72sni6y015ryduWjwJ
	FIvwnx+CowgJWI6dGnSQIuM5XN6VLnghYYYh1eSop0nNAe
X-Received: by 2002:a05:6122:218b:b0:5ea:b04a:cefd with SMTP id
 71dfb90a1353d-5ee0d0a58a3mr105598e0c.7.1794254568208; Mon, 09 Nov 2026
 12:02:48 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 12:02:47 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 12:02:47 -0800
X-Gm-Features: AclHuK93pizTTBvqPPHn8tyB102k3E6xp0ArgfRjiMFhvMMSdBvoYQSIxOQgtlQ
Message-ID: <CAEvNRgGQqdrcLcYbSbiXmFRAHwvGW5Ha_2NPWhMNs-qpnWhZCg@mail.gmail.com>
Subject: Re: [PATCH v16 16/20] KVM: selftests: Load private memory and
 finalize TDX VM in kvm_arch_vm_finalize_vcpus()
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Initialize TDX private memory and finalize the TDX VM after VM and VCPU
> creation.
>
> Hook tdx_load_private_memory() and tdx_vm_finalize() into
> kvm_arch_vm_finalize_vcpus() to avoid the need for every TDX selftest to
> manually load initial private memory and finalize the VM. While this
> prevents TDX selftests that use vm_create() helpers from customizing
> memory before it is locked, no current selftests require this.
>
> In TDX, finalization is a mandatory step to make the TD runnable. It
> also finalizes the MRTD of the VM's initial memory and state, locking
> them in for future attestation and preventing any further modifications.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> ---
>  tools/testing/selftests/kvm/lib/x86/processor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 11db6a3b0366..ee8a1715d844 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -1503,6 +1503,14 @@ bool kvm_arch_has_default_irqchip(void)
>  	return true;
>  }
>
> +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
> +{
> +	if (is_tdx_vm(vm)) {
> +		tdx_load_private_memory(vm);
> +		tdx_vm_finalize(vm);
> +	}
> +}
> +
>  void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
>  		 const void *smi_handler, size_t handler_size)
>  {
>
> --
> 2.56.0.455.g6c5a503b38-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

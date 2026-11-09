Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254189;
	b=Z0dUxq7zx6u3hUaCtu5OnOI/HGjP2q9syjcQHjvz14KS1bvkD/SW6hCT4VEEfDYbkeAS
	 yEPxm3OGiGnuF+JRLWm8//AUNBxsGMploGz++A2qYMMCQHMKMg9FKikAaJV9uOdlnpJGV
	 r7jyF3GEiDT2YNDUhOeSNzbQWS1BzC9VIuBUNHjlfv3D4pcAqpUbbOKsgpJjR2gYEMZIf
	 NvZd7dviNTqvUS9lGisMw8Q/3xND7lCuwcqMbdrDzm8S67veopDglxrX5Om1VoPu8xo1m
	 a4VDTPisOvVh8j4peyTgmvR0B8lhddYAwgA2QCbY0FVl9AblFZan7LKM/LqSXJNCLLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
	b=0GjKf4WZdsjEdHC/dweunhz1EtczpJLSMF9xi4Vz3ZnSVUSVBfV4bPbm5xrydxwbsSl4
	 MvVvrQLNEI3hFQHarfS3WUvQK3Yzca1V1YxWOMFTAYfA59hp7+7IH8e1c6TXT7acQymO2
	 kevJaJJMP2aASmmlt3sSCKFwO2hre4YPiZBaLEgedX+NI6JFc44WyRv9um76Pz2faJq+D
	 dOrcdiooNvpBAdcrt1rfh1mYJG3QmdgbHDHU4BVDX9RVL1iihZI/1Wn9s63IDPIknzpHW
	 w8sQkmGjoWFgZeVGP5096KAxKd71FtNc+670g6URmPvQjBQKIluWUc+8W5lW1jWpIKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WSBziwoS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7960D606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7960D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WSBziwoS
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so12080146d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254188; cv=none;
        d=google.com; s=arc-20260327;
        b=LTGs0G9zEw0Y+0Ila+t08rQ3NwC6E283bin0vU3+B0GFLMwLyrXiJi9ldfd2tPcINS
         iwhrTENO36s+ksEi8sTDO0kUTY0LZDlp2Fo0Y9mt8HF0GEso9eIozFCzSq5F3qgbgQ8P
         G1hMV0+fWB5KK++2hvN8jt0GDSLYjkBnwAPJQR4NVeXkHJ7tZbq0HcvRHsnUKkHcBJyf
         3pUkZOWB5sjm38tNkCgbExa6IYKk8DYsdyM50bfO5KU42rZACsP7CeDzRt0yyojI7rWf
         bDxA/qfQOdw3rismEzWtPh837oHaNVS2+5MYPQpEpBhvB4lbydfTil1h0oViKEMqq/6Y
         rLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        fh=yhwzTgiMegdjKmlHGOq+BvePOEuJPxhFE/4Y4/VOsDg=;
        b=El95hSUIGlI0JXDps9WI+/l2TRWbnQKIgcwiEKxVreMiEhjzDDK/KXBzYc0uiaRTDt
         7zSDu4LdiTPhiG8eRDjUfZRr0NW+cY+xo1vKMtxhY365GAcQRaDNjLxIVpka9Lpa2wYl
         g07qQZseNQkBILOVNr+Cl+RHmOlsGJHA24RkLVkO+nu3adorfPAYPaAqDkPU4vSjunLf
         t3UGPlAiN1rl9RqquTJ+WGUHgHwe+wsfcch7iMawXXRJ/VhyfMjmc4/kOEzRy8z2ff36
         NCXMmuajIgSQjVxeZiGWH10iwXgtFAWTku+hy9yTSGJbmQ8+NqtcXkCGGn+MUJeT80oo
         Ad5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254188; x=1794858988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        b=WSBziwoS8flyI5lQi9ahqDcBfOHtzvGVIpeip6fPNlY+Ge2i9VvGHvTk0SjAmMj6WY
         oy8dx9L6dC+9n99kVoiMoAcQJkha2qzfsdf6GmScQeX4Zt6VC4fMOxh+SuUz/Oovgi4T
         gPTNsc+sseOYkbHCKfQXFAl8Z/EBKmED1IBwpfFZeIhlON5MJwgCVmw0V5UkQ00ZKlR8
         xiiuDkZs+tv2LGVT+Fo9hBVASg8xUxoubEQcuuHQRwBD+UZ7YCtWrtU7vh77QHMZz3bo
         U8OowvQTEodhREy5dxVZh7swpTiUFcsF83upkmLtzweXaVRT2ZKpTzmLNh09nL4tt/2s
         2PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254188; x=1794858988;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        b=cZmemOo9Xd2MH4j7h4EvxoVDDVjj5IbluAtAvTH2wDxDh+Tc9s0X04hkzvq45YxSXG
         GL7pQsVWqXsKuW2I9ozW6/Kcnduauy77bgmVBUXG1Vm5UhI8b0w1T0yURE17234v2t+6
         z3tfNRvco7U20zFpLuz+NfsPw2GtfiqsLEF2GwR4vNy8TRbhnI8OpzmFGhCLavl5mmIC
         WkBDyKKelHb4Q4P8E/rSyi480UReAz2+V8my3w7wp/5L/OwDyoUO4apGivJyXbJMIkzS
         mSqoV+IH0dx1B5r9S60peYQrTDsi3CLZKbS3cE3qb/Yu1RFkTas5KlNuqE5NH+0oomek
         Couw==
X-Forwarded-Encrypted: i=1; AL+hErHE2H8mN/YESRmUFxzY4z76ZpS8pS2UyUzzNrsE+8mZ6p8yjcDFEoGdZ0YH5wfsYmfPXeP1TFLuSgxnDf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sIZxtshHHi8iQhU2It2KFqZSD7bhQMObNoZDhkP/frPEOVoyU
	ACE5DcuKKgNrbl9zAWocZ9zV6poFX0W3pHHC6y2h+lcMjQLIid8Rn6Gkxc3RDdnTiiQKGpImArb
	+4UfBTln1QJjD12zN5j+xFrjmOpMGINzkSkU11HnQ
X-Gm-Gg: AYBFou1OzN+Zoy6R/+E4fWfHyqwfeGJlvIPwPOupVKC+uSpP5ZjJGySGJk+o8VtdUKe
	guC+8ksqZ8trxKuCpgD3rzjy8IZTKIfnF+5GzJ5zlOpEroJwYL+4g+OcvWOo7f//UrgZU3XmfMW
	d4dF5plQGCqvoSIkYyNbjJPe4pCHGsrCruRK/083xDorLXybbUfGLFAHxidHTrK2aiz2p5N8qug
	2f7lmdGZhXmm7zJa66NJZvwNoySX/sVIFK5npK7/bDOV0zAbjey0c2/HA2Z7krdqPYcel6ta6KU
	u9MyFe73Npg4N0ItKjfEKyKmsVxVYLZsXBkJRlPtlU3JmOrXGd6DqFJsbPOCXkrQTPsfDRnuCB3
	wDus8GuSF9scHOcWo8tdHywQgT4YcihJHGbPzv0xfckqIHAuv6jUBiOMghd7E2Kww1Fv3/npyeI
	lCcUFEP4dIOXamAN2J+XdDWo8r1V/40T7iuoiy+hH048xo
X-Received: by 2002:a05:6214:1d21:b0:91e:9664:4e2b with SMTP id
 6a1803df08f44-91eef7a3c83mr11733606d6.7.1794254187357; Mon, 09 Nov 2026
 11:56:27 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:56:26 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:56:26 -0800
X-Gm-Features: AclHuK-1WjXMX68h1oPEz4A9GDozdAxxlHkeQ9giBYSNuXqnEZTuJ6BoJAHDbqQ
Message-ID: <CAEvNRgFTor8fZzRRMMv5cXvxu7NCiKEOpbh77HSHGEdRRbt9EA@mail.gmail.com>
Subject: Re: [PATCH v16 11/20] KVM: selftests: Require guest_memfd for TDX VMs
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

> Force guest_memfd for TDX VMs.
>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index d42e201eba76..b73a7bfe8531 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -494,7 +494,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
>  static bool is_guest_memfd_required(struct vm_shape shape)
>  {
>  #ifdef __x86_64__
> -	return shape.type == KVM_X86_SNP_VM;
> +	return shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM;
>  #else
>  	return false;
>  #endif
>
> --
> 2.56.0.455.g6c5a503b38-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

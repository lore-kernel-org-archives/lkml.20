Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793147632;
	b=a37bJX6v71qasGWV5w/5M694DA3zJ5GeknOZ4yEoMbxtgKOgaBFwEwqVq/Raj+8OE+zD
	 nogGF/C70M2frj0C48ObmIGpuLVIstZApmlBoO+SfCSWuluoiijOpya9nsoa/3CF3Wf0+
	 OMjG9qGtWnj7qPstQI+6w894QRxHOuxf88FBq7/9LyIsVEEbkSQAziMpCIQJR9qeUNzAc
	 1KKNbPC3IqWBfZmQ03F7OOVKOzV5ng61JIes/3SMR8FUQTDQwTTudrmyUgd3hsEQxzonS
	 hoX8ZSUcTGecLgkE6ATusXJEyHel87MlErv5PoyiE4u+iLBCE7gskLJMmw+Nohxj3kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a/g709wCzxTBAV5yLrw3H5BO2UbCvR/yueVUmZTiqJQ=;
	b=naYBgUtfAazQ9N0oPv4N4+fbS3bpogHe483uO1GoGcZIprlpbixaL9z2iqfLe8pmSKBW
	 aU8RCFj9EHbIx6cdV+RqxI+Rve4noWzNSMr06nlI8m5rkCTFj5RgCIyo0F2KUPcLMx5aD
	 mqs4DFaFgRLT3MRRW1E/3Fx0dfjK6KC0lJqp5/IK1eVtuu2fc5NeNqZxjpXjcYuosu7Cb
	 MxiY7MFYaLAYWNCoJ76btwn96M5cx6Ny2e2zEenHSF9o9CKy9mf1TYz7Zu/yWj+UO3EWE
	 B6jIYTG9ILpAe6EhTEnTlYnHahD6105BOPCBYvr0wZcjjJmALDKumChAUqA6DstrZpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NCVmBnRi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76577606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76577606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NCVmBnRi
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6f5a0893610so420195eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793147630; cv=none;
        d=google.com; s=arc-20260327;
        b=HuXPwRT4IJufLO+0N4K7xu+JauDCN8X5mpL+waVhr78ok1fPEsUghLyCeNAbrg8oL1
         BRsAcar3qwYW05X+Bgat1tt6d21ga2hxQaVDs9SjNJzmElDQ8FrSuNk81VxeQwP08G5T
         kmc4jdO0JeilaOSoPqaCRYwyDJAfJWwPUAd6L49H+xGDSMHFvKVsyd4VjFyPtPpOoRy2
         TGJ6sRO91WdSGaOP+guFYtgD1ixatecF4sCGGcmBbFLzCLXelSASD9G9a9Gfu/O03KL6
         4e7rucmRC3z7xi/jRNPKtvdrve0Y7N0P4XyI6OP3aq2RZwueDFwVSSj/a9VxwUf7Xvh+
         szlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/g709wCzxTBAV5yLrw3H5BO2UbCvR/yueVUmZTiqJQ=;
        fh=a3ZI28tKDR1geINdWjfLVZgpWHBsqYZVl0QwqHGtpZw=;
        b=kO6UOgimKeTM/Tfgb0x1x1XJhiIDqgaoswVp01wDQxmTVhb0l9TUGfG+tI7DJlegIH
         hv8zzxUT1jhw4CT2H3qF9WbxPMgqMWWmYsDfXNoG2UPSwKmszMFe30uxd9wH7bNLBY2k
         IkbF+ZQmkKfs9g40JyxZ127QYVOevmZSn9BgyB7dZEN5tzQU2QnXJAsn82wd4llPMVZA
         PtnfCS0Rn+Dd1yZxoP/0mngZJaWOqdYx/0gwLGQwJguV71gQbaDlChVcwSW1YSvSPa8J
         VGNuSiprm1BEPD3AF85rW98lWrJqnXp9gE3MkRAIihnVrAD+YsLAhKm0j/AnH2yRfK30
         8OFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793147630; x=1793752430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a/g709wCzxTBAV5yLrw3H5BO2UbCvR/yueVUmZTiqJQ=;
        b=NCVmBnRidhrFFMllAhawcqRAN0tNuE5Q7tarJMvVaxg7V4QXgiwrDW7ZGHbRKAeZFR
         r/8oNNpNXs5fKJZBPM29sjLjJBylIKHa9TOn3UyF9icqHdswHuoG16TyN3pvengXOjp9
         BRaHP39CZHtVTsLQ1a/2kqQ8NgQ7xyjTqVOtp73NTzEiKw8FyYtLtn5KsAVqNesudUnW
         YojsNnjXeAOeLcAoGsIXOKiEi2uO5dm8wFKYm+ZnzD7Dvn76DpWYwy/deZlRH+Laa3wx
         iRJLDvKB0dSeD7a5yltu+j2cHcaw6u7Ize6NA6Hzh/SESMdQGbTwUzVnlVdw6wZk9Q1E
         AC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147630; x=1793752430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/g709wCzxTBAV5yLrw3H5BO2UbCvR/yueVUmZTiqJQ=;
        b=s+njEU/smksWNrAX69M0LXLvdi81uUsh3P/iWwrzaDI9limvlTD8MamVwEHr3OZQQi
         448ASsRyPhfQnQm/rCsxI1aisTgEbIqqwb0Z9E4YkO8j6g7hGDPZ6uBl85X7tEOFQK1E
         9a/Kf7wDGY7pb0pnZ9opq/qXulL+NYNZh2Xm6XX0aJVXzKvN7qauLW6NUEBenXD88saT
         LZ8vROpVT6PGZHDQMJJRkDoS5QN673pmMlKEXph2Yx197CWVqXPkKu3qe/f5kMSgNfy2
         LcZfwksbbbDCi5pQ3hjj9njvwNIJaBQ4prUZVmMeDnevwk/2Q03dqQbrs4Z1UVfOHsCq
         ll6w==
X-Forwarded-Encrypted: i=1; AKwUvBxuS+N8Is+NZljwchYDlz00K5ecvT1ZUrBQRwzakSQBfgyg/D3eU+eZAyjDe/fL7VH99JiEPfjqXExUu2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmDUVM3EejnMjaVEik9KqbF5bDi2BkDg5XDW4HYkonIeroz9JB
	1+tEVOu3CLT4MZoGFHnxNLBsJzZllWpfTDJnJY1VDc6eszsfc/qf9DBY/8oc3G3uDeJNBFMXveI
	ty9bExpxVCN1YAXYwxoU46S+lyQUHlFSAhhpMksfR
X-Gm-Gg: AYBFou0A7eL5X1x3wI1wg37CABmMA3W/5+J3+etJA32qLqaB+wkddxzBBJV/IRDGCuJ
	pYbqZTIpEmjLr1tU7RjNNkw/wrMJYR1Nf7oFJhGv4uX/CwL783FYYUJJaLM2R9CyC3SjD9xGvav
	CFlq4raYgmG//mgq2t1sWKp+Gb+UvLZ5GiYDSfXUjVbaQ7O+ia1YrtEu8JwXkmPKB1ix1K02pr3
	E9apQodttH0cAvhuuuJbZMZMOQwAAk0s0yGHy/EG9gMcDuiQHucSlKdnoNsiWiemFJ/O98xVzNj
	sVtGBr/a0FJVHooGo0cLcyssTaVBvzSrbL+PvGsml5Is5KKQUsZCV8hszYbs5cRLu/MEOYIkKF/
	kOsOzFuhwIDHVGil7vvhtJCswutynN+pBFu1qg/d8+CJCrrXs45YUKmimkDRLz+mXcw7AoUZ5QQ
	B0tNkSbf6c4VRUsKKHiHkuxzzcNpyU+vwisUkIsrcRvztXrYqkUvKN6mKfNv3HQv5IkpiVpkGEN
	CW0EhSx
X-Received: by 2002:a05:6820:2207:b0:70a:4053:52ec with SMTP id
 006d021491bc7-713eb0544damr493322eaf.4.1793147629845; Tue, 27 Oct 2026
 17:33:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com> <20261027221209.1560865-11-seanjc@google.com>
In-Reply-To: <20261027221209.1560865-11-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 17:33:10 -0700
X-Gm-Features: AclHuK-F0YzeAsS0pikjvH3kUnFLPGjUCM-xAT7i-6P6IT1kD4-v_r0V8PDPxPE
Message-ID: <CADrL8HXMT8zBoB8ec2LP1UQWf1qn8qx8rqixvVpcsuO+Sb4p3g@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] KVM: VMX: Explicility free vmcs01, not the
 current VMCS, in vCPU free paths
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:12=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Explicitly free vmcs01 instead of the currently loaded VMCS when freeing =
a
> vCPU, as relying on loaded_vmcs to point at vmcb01 is unnecessarily risky
> and confusing.  E.g. during vCPU creation, the error path relies on setti=
ng
> loaded_vmcs and obfuscates that it should be impossible for vmcb02 to be
> allocated, let alone active.  Similarly, if KVM were buggy and left vmcb0=
2
> as the current vCPU when freeing a vCPU, operating on loaded_vmcs would h=
it
> a use-after-free *and* leak vmcs01.
>
> Because KVM isn't buggy, no functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  arch/x86/kvm/vmx/vmx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index d433cd846ac4..2ef1f634e7ec 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7515,7 +7515,7 @@ void vmx_vcpu_free(struct kvm_vcpu *vcpu)
>                 vmx_destroy_pml_buffer(vcpu);
>         free_vpid(vmx->vpid);
>         nested_vmx_free_vcpu(vcpu);
> -       free_loaded_vmcs(vmx->loaded_vmcs);
> +       free_loaded_vmcs(&vmx->vmcs01);
>         free_page((unsigned long)vmx->ve_info);
>
>         if (vmx_can_use_ipiv(vcpu))
> @@ -7614,7 +7614,7 @@ int vmx_vcpu_create(struct kvm_vcpu *vcpu)
>         return 0;
>
>  free_vmcs:
> -       free_loaded_vmcs(vmx->loaded_vmcs);
> +       free_loaded_vmcs(&vmx->vmcs01);
>  free_pml:
>         vmx_destroy_pml_buffer(vcpu);
>  free_vpid:
> --
> 2.56.0.307.g5fe7bd680c-goog
>

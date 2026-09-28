Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992C54704A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790554675; cv=none; b=i6gPLD1u6ozP9Awdy2QUv42KZd2IZoGuaHSiMi40H2tCAaDbBBXeOldHpIqhf6wH4eo0D7lu58UFd78N4Fy/gFPSkYdVdClyzz4d6h87khJGaEhI+3ohwJhJK2pVqZX3QlHbmydZwLx1JveXotz3kcBMyH+DudW9982R1rLxr0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790554675; c=relaxed/simple;
	bh=ifw+HzxZH0UaVzz+sFjUcHPMO+kHUsiZo7FPvHHz3Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egceK4bITGpWpPm9LuYRZ9KwVjuMtGQWrxkIAevi6O+ivgFLBUPuorJRikOtjSmrjv9UjnbCO5c6whYPUYNCoygM1aET257gVXsnW/tBgWKa/nYggQUjVPFssRug9ddOLmlMPlxeKLgS4n2FoxCuzqLWg1S1U5SoCZp1YJbJGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Edt9zwzD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oci1sAOc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Edt9zwzD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oci1sAOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790554672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=;
	b=Edt9zwzDAwiB21IXORgWwThCWVI3iBR9dQ9Qn3ma7Ylqh7B65RBQS+JH+Ec1M9EWjco1Ma
	gm3f+D5KcVoLfLL6fHVLtbfn3xQntrJDq9orvhK06OyiMrA0W1eNU7ye2T2UY4hNSzZZ3D
	RgXgRfoxjkN010kF3hxtUb+Nc21bKRg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-CmCyxoSpPJKIkzVeEwZoEw-1; Sun, 27 Sep 2026 20:17:51 -0400
X-MC-Unique: CmCyxoSpPJKIkzVeEwZoEw-1
X-Mimecast-MFC-AGG-ID: CmCyxoSpPJKIkzVeEwZoEw_1790554670
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-882a1e6099aso1083928b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790554670; x=1791159470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=;
        b=oci1sAOceaFHpy9p6m1BFAcjzRSgzmEJxyjuOUXsvwxeXCkX61mEYLAnpYOWssGAnb
         G4/BYMMJk38phZjYWpRKHS9vzS+RdDg51Z2nfD8dmf9OHRn4uT48crx6gx5qrcVAH7vl
         juuWQ53fpNzONnvKmnoqnKEXYZ0IVpCx2uukvPscGWVwyD7/MsNezxJv2QBaDqE+u3WH
         W06KaWCCnxvfCKyke8cDTMJHgum/uTf9nZXAjGDms/Ff0zgK5kUUqSzVDZ7FfIqrP1Os
         5FsoaM+pQefdz7ZILTX4iJVccGeAl2qzx/cxby7nJNgmzC+Hc39rBSZsMprmjJ4w6ZC1
         6mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790554670; x=1791159470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m73jnLSddTXID/zMijmWEgMqVn35akPc9oFGshsowE=;
        b=kkG4MonzcfVcg/u51OXjWOOrEAeBvRbpdO2rXKAPvEntEF664QRKQrUWEvlSqchqQz
         xAfHhxguzHQucQTjavR3yw2FIxq2tNceIxhEMg8jzsov4MGvUhpNv8OLY5+ht8lWerRa
         R+9kUMBVCd4rdV6JtToxV4Ey0kvnaWOEQ9jP025sQ0e1oiI7B6UGaxWj85ScH/7N4OcB
         kY/SjW9gBVnXmaDWBt924g7XL7YKBOJ7ta1pGnYuz8VLg2FMxpc4N76i5E8gdAIAo14Z
         xvc/WQYAH72nZ5yuzdAUQqpPrwkrIq5sCpfMOPIDa/wBNj05AJPO6k9wNS1zkAs+kwrQ
         B8Fw==
X-Forwarded-Encrypted: i=1; AKwUvBz0bHVA66BrT3op/YZGAV9GjltCLGgZAGquFq6joqY+Mvz/nnkWZdtgtxFaoAJdTGccWjkSR4RlLacOWOc=@vger.kernel.org
X-Gm-Message-State: AFuF++k6ppzJO84bjlzp499ZsOtUczrPJRVL9e+l81npMTqh9lNwptUb
	ekQ0vGHVEabDdS5aEBh+PtI0bU6uIzNvNUfNVGcvsfoauNHGUd/6Y/5kVwF/vuUr76PdJTZ9WBS
	OpqJWHq2HOnVp7Cz/WD26ZVA4ovC4mjcU68sqQSfe0G1k86j0L/P98cmQLTJBip98aBpZ2mu88Q
	==
X-Gm-Gg: AYBFou0iToKmV6AeMPavbg/xzD69yq3fqzhaTgz18BLxtN+VGrVUf2u0gXm5rKgYap2
	n7HeoySo7b+ujhJzhSYcj8/8gGVb+gOAM/JgBs4F5PZsogsmT4DVNmg98HFN6DRe4kL9FmynHCg
	rDzUAw65mQ7GvDQ10S91fAa2CLgAb54DbLDcUvaP+efSFVKR9VoD8Q9Dg089xBZNn6efbtqz5YB
	Z307ZIHqiVkjcgiYTk/B3GuQoFN2B0zXFhvMjWDTE2OuTEGFqQtklexDddkFDlAorpewx50vOu2
	Dmp1KB9uN+J/PZVHEc1JN8+xyJ1IILlsQFImZSBUJHhhh4dbp1MAG2sveURkFCVqsRChwTGB4LT
	K3uwmrXJ/CLQptroAfwsTk/rHugbN0R4JsqdGOm4U4Q==
X-Received: by 2002:a05:6a00:90a6:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87e9c06a4b9mr9378137b3a.53.1790554670286;
        Sun, 27 Sep 2026 17:17:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a6:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87e9c06a4b9mr9378123b3a.53.1790554669847;
        Sun, 27 Sep 2026 17:17:49 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-880951dbb8esm2754588b3a.24.2026.09.27.17.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 17:17:48 -0700 (PDT)
Message-ID: <ca399842-678a-4c82-81fb-2c66b95329bb@redhat.com>
Date: Mon, 28 Sep 2026 10:17:40 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/20] KVM: arm64: Reuse kvm_stage2_unmap_range in
 kvm_unmap_gfn_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-9-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-9-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> In preparation for adding VM specific backends for stage2 operation,
> switch to kvm_stage2_unmap_range() instead of __unmap_stage2_range()
> from the kvm_unmap_gfn_range(). Drop the bail out check for protected
> VMs and defer that to the one in kvm_stage2_unmap_range(). Later we
> would replace the logic in kvm_stage2_unmap_range() with VM specific
> backends.
> 
> No functional changes intended.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


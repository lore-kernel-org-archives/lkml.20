Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C03314D06
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558579; cv=none; b=G2NZ57OulCHgX5CqNpNS+sPtHKuUcDaLvQnTB5LyWjMadotN1OFP9hILiR2pOmGH+JkKhqQ4noB6Z88KIAf01zrY8/VwkBZagW20BEt57qFD5oK60K6l1m1sUDXUO0/9yfek4ZsltJCuyUpRRRcSgB86HFOrkLd4o70vy/hqjxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558579; c=relaxed/simple;
	bh=tzexRqC3K2iiEzwQnm+LnN1j4dKGRAhl6MlLFdP0ios=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yi8LP+MIAXU37JBIFgj+gmkTElmgfN46okaFEbbJ0QlsUPxah8DBlcqdXi0DCHIcNRWvY/u1u+feSZoFwKtUPW9QOfNzAPv9TNlZS8PjwxJvLWboA4xzqlCdPsYHy1dn5A9mQ46H0avTA427YdlBi5lghpb6SsGADGpVxNZzlcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCgtMyu3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ROcv60we; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCgtMyu3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ROcv60we"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYhWmKK3WxSPtzfylUKK2UiUNGYDraSdFFrlfHKnCEc=;
	b=QCgtMyu3UvY0lgmcdJXyMWElp36Jt8wA1lkz1z44yOgkNTZNLsO+ZWI3p4aMjYt1Nq9HZz
	DUJBHHLTSc5GgFcTlBQ4nbeyLyOdaPrz7R7/ojNthgALDqCKmwNOp+XA8znHWUkujcxC4g
	+T/FlZUXtNDKbjnz4QpSMgKuhD7aV+E=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-1zBHHl7YMji_dvgnhg_7eg-1; Sun, 27 Sep 2026 21:22:55 -0400
X-MC-Unique: 1zBHHl7YMji_dvgnhg_7eg-1
X-Mimecast-MFC-AGG-ID: 1zBHHl7YMji_dvgnhg_7eg_1790558575
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0ad137e87so3995017a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790558575; x=1791163375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYhWmKK3WxSPtzfylUKK2UiUNGYDraSdFFrlfHKnCEc=;
        b=ROcv60weYEeRIkyU6xq2j3y6bmVkpuJ+VrnyuhLxi6nfSbjGzlbxhgJi2BUqqk+anI
         v4cSF1FC56BdheeJE+uQHhb6/RrKRmPwMhyJ3uTSouatxwlF9whQTc9zqm6InAAtsdMC
         BEtQK+xeN4LHB4ARTfdhLqHfO7D9R4rUtFrmJ7ct43ijCGhBo8uuNCglrlDpUVqGUQj4
         QFWYDmVAj1w2o1nktd6duNBdL9HSlUn/nF1VymJWAhgWuFjDm0Xwd37J3FEAqqqB2pue
         l3oYLWZlve1b0+aXYK7R78g7r+hcLsu7WTeMHFSWgbSrv0V/FgRtbtZXQ+bPgfgKS35X
         g3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558575; x=1791163375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYhWmKK3WxSPtzfylUKK2UiUNGYDraSdFFrlfHKnCEc=;
        b=u4dIfzSdVjPD5QE5/xdTQsftnzgHTctKoPP8ooxqX8IXV+oIlmIBeOdydU/TVWKGnX
         u2SEARAZGNqrYHu6KwUCI41LFHr1++V8ACBiOXY0f4lmQd3SPMtFmkKj9Sy7GWGAoFmQ
         +F1YyuHxLqXd/ufb/qiiT+7Ff7qBpC8qmTFzc4vyEI5p3KbRdRF5tbpjlwnM+VRhuePD
         x0H5C+bwfaYK/MSFvc0tGCGiYMWSNuJwA8+31Zp3+9+hRfpn5APScQCFLngh/+X+jTG3
         hZUsrKsqi0nMc9UoH/FV0bmHJHH1AEULYMgusTXrZjhyAOvs6zXV5XTVZUUh+CDEbhfb
         a7gw==
X-Forwarded-Encrypted: i=1; AKwUvByQV+LoHw6G4nHnReA+kvtIU17FGOwlSEUloPI2vbB1eRBoe65KPQwtD6Em6krGYotlyTsDac4O6tVLgu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwyRnE6LI2yneohasDY1PpmTd/2qIBZIJZSx1avJGFznkgWliU
	idqaCgtjtreiHbC4ygfei6tqyxu/WuSNmbNC3SIAX+/XzKMAG8sF4BI3pEw2GHmyc/wwR9aN97j
	/ecy339nxINQVrMhDm6qXLY26wglyW74+bVfPnBTT3EmEFrWtx4CyJ3fYrH1GFfO52g==
X-Gm-Gg: AYBFou1D7JIBLNmHFbzeV1hZf9TE1o/nEnFgLd3jLPnB7lwNtf3vB4mcBJbW0p6jNsA
	GXyTfbLDoY5dsiDMlYMtN8SQmJpOCrO3cljfLZY+rRnKqojLuVtjZwoAt/mZm6c9ITnbkW3nUVF
	YohwtN3XZbuUKqndQ5tJrDu759RRNEgizv5EUYQW79HZFphDwlVYBSHHIkxnvMnXQlxS48L7omS
	iLU2jMTqd6+igA6rOBnrLQQ9YM4dky/kDpxcWVtzM6KDWMqb85VR3Dup0LGtaAqJZaVwr4Oil4G
	PUE0k1+p2yLHa+ySYRy0EBGsFb+DhLKndXlfzkqXC0WklzUHF8phtHRowv3GWKHTugzQOw7zoF3
	g/TFMFjT/Wo2RZhRVUNvVDdISUM7gPUjQvNDJZRG64g==
X-Received: by 2002:a17:90b:3c8e:b0:3a0:dec0:c0d2 with SMTP id 98e67ed59e1d1-3a0dec0d44cmr4614962a91.63.1790558574371;
        Sun, 27 Sep 2026 18:22:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8e:b0:3a0:dec0:c0d2 with SMTP id 98e67ed59e1d1-3a0dec0d44cmr4614925a91.63.1790558573861;
        Sun, 27 Sep 2026 18:22:53 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm24238968a91.12.2026.09.27.18.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:22:53 -0700 (PDT)
Message-ID: <e63e7972-f099-4e5f-a2cd-9b87b8d6220d@redhat.com>
Date: Mon, 28 Sep 2026 11:22:45 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 13/20] KVM: arm64: CCA: Add VCPU load/put for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-14-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-14-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> RMM controls the VCPU settings and most are hidden from the KVM, except
> for the VGIC and timer bits.
> 
> A later patch would add syncing the VCPU state into the Realm REC related
> SMC parameters.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 0e2ab5311e4d8..bcc274df2a915 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -795,6 +795,13 @@ static void pkvm_vcpu_load(struct kvm_vcpu *vcpu)
>   			  &vcpu->arch.vgic_cpu.vgic_v3);
>   }
>   
> +static void realm_vcpu_load(struct kvm_vcpu *vcpu)
> +{
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	vcpu_set_wfx_traps(vcpu);

vcpu_set_wfx_traps() is updating HCR_{TWE, TWI} field for vcpu->arch.hcr_el2.
Could you help to clarify those two fields need to be updated here? :-)

> +}
> +
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	vcpu->cpu = cpu;
> @@ -845,6 +852,12 @@ static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
>   	kvm_vcpu_pmu_restore_host(vcpu);
>   }
>   
> +static void realm_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +}
> +
>   void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   {
>   	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
> @@ -2202,6 +2215,11 @@ static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
>   	.vcpu_put = pkvm_vcpu_put,
>   };
>   
> +static const struct kvm_vcpu_ops realm_vcpu_ops = {
> +	.vcpu_load = realm_vcpu_load,
> +	.vcpu_put = realm_vcpu_put,
> +};
> +
>   #define KVM_VCPU_OPS(flavor, ops)		\
>   	[(flavor)] = (ops)
>   

Thanks,
Gavin


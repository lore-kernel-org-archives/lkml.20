Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7854707C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246568; cv=none; b=cQaFlQO2cPkS6NLWfcVsfmJ4G6LibCFfChDIsraGv000lSxlLuZRLm/80nmCwpr+wA3cVahgu0YaFEQX1vm0RyhSpslUwzxe+Q8DYmRUj/IwGrOu2DKPVbqGMtZJY51Osx80y35rZXtF/wckt35Dwd0oQwZ9k8FAL3oc/DAPT90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246568; c=relaxed/simple;
	bh=Ep/O91QiOVfVW8jwrv1LXJ3OUte/E8KeD2kAa4PCIvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LcA36CR9eXbqMtJq9nLD0WFpc1Dqnb9jp3tYtF/Ld6vVmaMg775QM4TPPZI5B5EY7Pvi0nFBRjeCPzmMMUzRxk9GXw7APqoqTgR7bizUP+n2j4xOlqOgflYRwT1HfG3Ht528XKPAIe5b/g8foBRMBw0gAlVhaKZvd6c8heHJr14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AQJUF82G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EzDKBA1r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AQJUF82G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EzDKBA1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791246565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=;
	b=AQJUF82G2TiIBhwYn1eHqyuZ2r4xWSakLfs4hAvLBk67Q5zMDUFim1uO5ZDItb1Ufopxre
	T70rmzao3OkFQezQybqeYqaShReeftXWgjsAfyH6BuRVnjJNoBYYnyQkvzPddMmyrYqinI
	7KDtl5btwSuaN+afNJGzw/FNs6tnHDo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-W7BhiM6qMd2bytXTjUXDuQ-1; Mon, 05 Oct 2026 20:29:24 -0400
X-MC-Unique: W7BhiM6qMd2bytXTjUXDuQ-1
X-Mimecast-MFC-AGG-ID: W7BhiM6qMd2bytXTjUXDuQ_1791246563
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so1224622a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791246563; x=1791851363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=;
        b=EzDKBA1rtzlCODexHfE4HD/8pfUG2ADlnAfgFHU3A832FWAxAzs6vIyD2hyhGZiDf2
         JLisALDqkp0HIWsZ7qEzmJkYfDeFqs7nOKOfzyy0qEMPexTHR2451UJUfkTz3XeM7L+i
         TPNGBtUXcoykerk81rebljwdb2cdb3epzbZwq8nNYsVB6bhg1KgRa79kEQR4CExzJIRm
         rmFGUnVQRJnqJsL8f1in172EQgVCoxiBsWJ//yCbXTe0A+KW/f1EJW1AbysQc8pl7JSP
         jqd5KbzTNLKFacb7nRzwO5neDiW4R+ShqZQxqCava08Lu3x+kyzcE6FqGF3pRE78+H94
         IgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246563; x=1791851363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=;
        b=wgyXzernC5/n+1QhqEtlLqH4b8xRp3miQn4H1/Fc7a1D3BHPDbzI6iym9pSamLAkjt
         dK8P0+LR9pVDnfehyRk4zqkChuhFsSOaH6zgXdjv3n3V6swMgCZhCMWVluhW+DwVdb2P
         K052kZTeyTogdrONClEt8OS8fYizu0/ye7D9EzPWrOPryDKnNgJrdINjMac06zV1Xg+Z
         Xow2ITbHHUFZmduAIpe4zNPN/c56dgLmSdoUpdXqnyeVSoPc5GggyDs0UNOQR6E+EKFa
         g/+FpAlKNsaxGm8m5Wc4DlG3aYQ/axhwr7Cyu86hyN0xeOZP0YsrohdiVPPk+PptKRaB
         LDWA==
X-Forwarded-Encrypted: i=1; AKwUvBylNfUwhIigYUOD2TH6Fv4zn+x9S7DfomNfHp2SgVjkoJb0sZmSpb1TdSRD3+9xcTJINknBahxZG6YroJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYISr7nzK+lc/W84Cqax9/D3bRDlTUZl+TAMoLcunI4g7uRyi5UD
	nhy3LIJbDlIf36OKD4epjodQ6bV6I784oHvmXiml7sTjyYlPv1QYXRVRjh0IRP6+kPObgLon/Gp
	dZ6h/C+WLNaf1bPy2nKfk5e8t4JhaNvU8jb2vpQ/KebxItl8FRd1JZ4tTOIsOVeNvlQ==
X-Gm-Gg: AYBFou0l2AHwyjFOgQL9ArjLCr2Ow6oYEQe9okhI6PcLiix9ZX4STe+LocPG60ETjOe
	ZoDYJJ0sbXnXfBB0+LNQMD+C/NPYDCyNHdWsrByHQ1Ze5VobexwsPsZ5oGCwrBsSBcrKmxASdzV
	vMWMKOvFHpncnBT2bVT5/Z74mFg0jlsEGn/ceFYp9K6JRgKkI8cE8E/abVIsPggzaGnMIu8uip3
	+p/mNbtfVbveUJw5SLs++z02cUlgs9plXFIqlKpocwp3BPS3FEfAWZirlD7Q7JMMHcn8iLNFekY
	gqwlHvHNRBovoWyOJEvAY99AiO2oDKzi4kwBEiHXRd88fC/XwFr98KhoADuSoQS7zWkqNof4yMI
	ZjjvaxaTdjQFxz80h+Mj5VqmYr0QQ/afHHPL2luTbjQ==
X-Received: by 2002:a17:90b:164d:b0:3a8:163b:b06b with SMTP id 98e67ed59e1d1-3a8163bb193mr3223727a91.57.1791246563179;
        Mon, 05 Oct 2026 17:29:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:3a8:163b:b06b with SMTP id 98e67ed59e1d1-3a8163bb193mr3223706a91.57.1791246562693;
        Mon, 05 Oct 2026 17:29:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533abe0asm1954324a91.1.2026.10.05.17.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:29:22 -0700 (PDT)
Message-ID: <9536a477-3d66-471b-b58a-b941e4a372fc@redhat.com>
Date: Tue, 6 Oct 2026 10:29:13 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 06/23] KVM: arm64: Don't call vcpu_set_pauth_traps for
 pKVM host
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-7-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-7-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> vcpu_set_pauth_traps() bails out and does nothing for pKVM hosts.
> Clean this up by moving the is_protected_kvm_enabled() check to the
> caller, in preparation for adding VM specific vcpu load/put callbacks.
> 
> While at it, do an early return if the vcpu doesn't have ptrauth.
> 
> No functional changes
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v19:
>   - New patch, since addition of this to the Refactoring patch makes it a bit
>     more bigger and harder to review
> ---
>   arch/arm64/kvm/arm.c | 52 +++++++++++++++++++++++---------------------
>   1 file changed, 27 insertions(+), 25 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


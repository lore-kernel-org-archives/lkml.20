Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457025616C7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116175; cv=none; b=CekZVbxceSo07yEm5118liLkakxKOnVWdgf5+kHV5TXcVTRNXJtpO0g+E+8NpANajnzlg7EOjq5UxV274CIKnEgOIlsgO8wgrmoecGRN5lj8FInNudGdu3Lc4mHnFDHOpknG7NBf7xGqMBJbu1eO5OMyxROzAGu0n+PQ3bORuvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116175; c=relaxed/simple;
	bh=RHQNmebjm5fLr1dV9L/YoNA7XquXexIl0yHVtAtTAXk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZs/66H/Y2NGiiL0tr26GLwG48lSvC8wLg2v8cxQmKo1oK/nkC35h3nIEB8AI9v9M1Kz8iukUA0rLz8DbRw86jp+KfdWowkoWtKbIii+Y9RLtYYrffdNOUXmzK7nz2XBM2or8f/wBAjyqbW3btISwd6MShnsmE2oKCzb/BEMY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6FIxJDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gt4MwZkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6FIxJDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gt4MwZkb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74uE1873608
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=; b=c6FIxJDzSdijI5PS
	sUyB8CJsU1gphs2rxSzit1qmionaLaYBBY1nMGxjoHQcTlAhStLkZQUwtO020Ybq
	krf3S02fGvuP56aEH8e2XoMnvafNwqF6Dq9Gd00NmkqJcTjYqTE6eh4qF1FrUj/3
	/u9IGtBP+VWMu5TyYAVp29uPG6suUK6CagJxGf/B0Xys4MowqJH7RVOL+BB7KvS+
	kVGpTxswAY5KUnV/vzi0hasGUtWm7cJipO4L75Ri1/wGSiuzMu8oCfWOXhqcX0xp
	f5rLquRaImhc3JAXWWxi1i9cFiX1IgSX0SIDOiJP+hN4GL2uT+kfU/tr6diVMFVp
	GZ2Zkg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4udv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:29:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32ab0911226so297588eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116165; x=1790720965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=;
        b=gt4MwZkbGlXbpkAlm6yWhVNSGr+t0ux2K1qNmYD+7IF/95/+/AmzLbsWkOQtaWpZan
         XJbjAPPZFlHUdXbHZG45+LFBpEZgQuxdgiYLJo6Qm8i0kFaO4QXLz7Y1a3jNxRHkNFIx
         k+snmNboEncl+kG0ZyC86R1xw/wgqk+Kgnmx2HQkzEOLYvYAV2TeRff80QW5FgcszKCY
         QXBDErvHyOR+R5t/hKrbbtHe/SpuHf2kPv7Bna+CqBn8PsBG9OFDziqR6iVTevM/9t2d
         x3uqksSqF5SF96YowpwjJEUVJTsWih0dAQT4cZekjmUTxElo7B+fvhqUEZqrrooPCd2Y
         GfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116165; x=1790720965;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=;
        b=XxLMQj5b8vt3s6PUxEPDd4AFnYbQN2+1jjDKGuIXhZNPlSgVViXM7DwOGRffQd7fE2
         DRQOno8iYXHuh6Kpx5705UwJFeLbHYLi4OoAHU2gsoQzOwBntFOixIeeIJL3MDhn5HTh
         RGT5odltjBcs7/m+YnSsgQk+lT3gFS2neenfYWJtyTm5mpYKafjZOOyUD8WoEIjmqU8e
         r89EZk0hzajYO5xf7aBs8NVnGn9TPwohftUFmT2V985+kC7zgtyI0utQt60QUN6e5NdB
         v8vT4a5LVzuzH/VJWhWwR2MUDe4F8yQ7KK+9AwDrwjYkxN5V4Bdbje7EmIWO3QSjRQZr
         +6Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwAsCiniAOZW7/XpEm1mya4zIxXvvr5NcV6frCon0rtMO7jsTGNgQvBpSotZ0WPJMDKLePlz/ETkNuoHbs=@vger.kernel.org
X-Gm-Message-State: AFuF++nQmwvjrdOhhGRWHWdDo8851NIJWmMHQEeDF4tAGav6MWDN3wg2
	jw0eH17v/n0UHSrGk78uDomg3D4Jtl20Hvd2wJEqDTV+hUJmUbJSs5A3vND2LXH7kL/L5CbthaW
	YNCsw8l34Uf0KVFGgU1jys8oyGkD+I5hgoe7nwbcO28co2fxQ71AZBZfnH22jfxz0AoI=
X-Gm-Gg: AYBFou1ja0WsMWAM8/q4SLu8gBJj+61EW4yW3yXcQv5kpRpAZk65C/+khSkyvgUBFfl
	rP+KN9Rl89LcRpGvPBZiYOvVNeoGUtjFqC09FuWELUqniU/F2LmD96otncSQ8FiDPyqLsc6sIvY
	JerAT4SPK28gOs9f+Bepbw0gYki3crOXFMocHWgxT187tnJ1fFWDGZI97WAR3BnJTBxWrWH4+0G
	76AVHq+EHbG/siUL+O7ZlhVdjXoczKt2gvwJ9XGFw/zwv4umyqnwiBCJW8LRnPybunadAwdPaVG
	TP7J455GDSkkdwsDdeHk1jy2XdHj6GskWHBsgwlZydMvXNlVWhElItFhIKyidCDMApBSZC2viKb
	NyJ1V66fZuxCMg3IiNCQvbKkg3K4IXe3WH+Eud5dxc9KC7/e4n1Mzlg==
X-Received: by 2002:a05:701b:4248:20b0:144:e259:b1f with SMTP id a92af1059eb24-144f8de7fafmr949938c88.13.1790116164894;
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4248:20b0:144:e259:b1f with SMTP id a92af1059eb24-144f8de7fafmr949922c88.13.1790116164404;
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98542c8sm1351499c88.8.2026.09.22.15.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:29:14 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2
 MMU operations
Message-ID: <20260922152914.00001221@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-10-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-10-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMiBTYWx0ZWRfX833OIIDbr6p3
 UyiAWO1dFt7UAbStR0k5P7WuTMl5FSCl9XqprzY/gHr7hakk3yONFPhzmW4L0fOCzbIVZ9Ea86D
 kZkUNchJSRBrHtGM47/ctQHP6HPUWu/C1QB40ORGbLjtfhuFxxHOoeuea4r8jgZyDidbr0z4I9J
 FG2/1ecJrfciCL3+jPSyIBoxrX0c46HiADzx9rRhzpYR96qHKmVAamWIwDlWC6Pwm/m4iEyF7UP
 cXut8fsCMgiEC7pG5OT48fHbWy/B8Juprpxo4YVMpbT8NfxUn02/a4Hhk2JtDBqkwQbwfkFY648
 3snfho+8Jkm/asqumu0rd0olP3By7qXTpiaGJGoMGnYYbvJwSktV62n67bPt+fFac4fzoZq1Neu
 l86Cs9UxQ8Fl906eWkeYp437WLIiJxfabMp2oBnbN1sjYcEnqx1O1nBpaBEN2FnC3qmZQecRnHS
 C141+tXiIoHBRzJ581w==
X-Proofpoint-GUID: WKye8CykszI2bIrofHxDkpQ1ED7OekhQ
X-Proofpoint-ORIG-GUID: WKye8CykszI2bIrofHxDkpQ1ED7OekhQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMiBTYWx0ZWRfX41zFMo/3rknM
 mUW/5sNuSjUlWeu4F9BOBwRT1x1NHvNHldfpO1dNVJ2fFSb6sUI4nGJ+4EThxNsgAQaS0UOjdA5
 mauB5IvTkF/6TLftPRj7Z18XiX9ie8c=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab30145 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-iJiB5zC6xgh5EJSZLsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220302

On Sun, 20 Sep 2026 22:28:34 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

A small suggestion inline that makes it explicit when there isn't
range operation and a full flush of tlb is needed.

I don't mind either way, but thought I'd mention it anyway in case
you hadn't already dismissed it.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 03f2017a7404a..d97a4a1bca23f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
>  
>  #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
>  

>  /**
>   * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>   * @kvm:	pointer to kvm structure.
> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>   */
>  int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>  {
> -	if (is_protected_kvm_enabled())
> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> -	else
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> -	return 0;
> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> +		return 1;

For consistency with other cases and because it looks nicer
blank line here.

> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
>  }
>  
> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> -				      gfn_t gfn, u64 nr_pages)
> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
> +					gfn_t gfn, u64 nr_pages)
> +{
> +	return pkvm_flush_remote_tlbs(kvm);

For the cases where there isn't a range call, perhaps you should just
not provide the op and have the wrapper fall back to
calling the 'flush all' variant if there is no range one available?

> +}



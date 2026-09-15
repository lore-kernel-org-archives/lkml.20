Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9BB43F8DE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476589; cv=none; b=Ob0AuAgKP67gEMTCWT5lgsZjHFrxYNLhd6LJjMsZW02BLXGV5gLKnWgpiNBb5xbrLf7sO6tT7VJaFHJws8vTVxp079ewX1X7QX5N6Mgyja/fKGrz26X9OwjOFl9hykEsB3tTEBNml0e/GGEXOgD4DZl1bIv+RH8O+Dpw05j6K6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476589; c=relaxed/simple;
	bh=ui4ICGb/kqsSx5sis20c9sxB7gn9IT8brWRsdIH3KRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBY+VJzFnyyu43psQUSLME8R8fZGjlmoNdSwsVNLOzzI7hffYdeJiaKOrnh1727iiVyB/2bo1GZaqJrQVSlKRLzfGw0YX0yAecBA2mkWSQFHg0+97DSFrUMPtzQIwuTetuaHq/Oapr/Bosvwm/Q2PUdjP0YorSn1ugQ2OmTevLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi9v+Eej; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi9v+Eej"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d942de6574so28230475ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476587; x=1790081387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=Qi9v+EejoaESJfqg0DxCAhJ+vzmv2U5tRMMcu5gUEzephwpDPIbHfDdqG7Vr2UADsy
         o+whucndZgFuG+nbe7gYKarCTPxZVsbYkj1Z0xcbpeqrBH8dzVWBuD53/JyVzLo7TTU5
         12Doywp/58/OFqaCDuBKwISw4mDFbiz/acitsXgVO2UidiuxTZTnmF0+rp/iJF6FogWz
         ZMOX7G5qkfi5fFQGsoCm2yU9wfYekV0yfMJ6fxtRkfCyb6+NdQXiYGOwCIlYZxkWSwH9
         jQd2iSaSOzzYjtdX8GVbsfUF/i36KXtnuCx61hR5SApsS2sYhbhPWPTeP34hC6zT3e4w
         KIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476587; x=1790081387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=XJrFVFC+MhKyG4P/K5YVHie2lMI8aE4RG8q0Qe5yRQ1KY2rXLPkAnp+m1MVBHum9Rt
         gscLhs3kNbn/HpfBKK57BfMO2y3zlin5YXK1kBLEJNZ7/S2zcph2lFpntFYIAqzMyV4C
         5nLgkfjZ6IssG7vXGc+yQexP+pZBC+Vhnb89FSnSxuExm56BOreSdANKc/dZqqgfcb9V
         cmN3yKIrCCHKSB+p3Gkd4IEyCPiUsri/frzQyPTRzqSuGxq5d+B0G06qLg2j8mBB2qAQ
         bZvwz4y8BzkFG0LjiQ5ocQNOBsWcdreugoQBK0DwWYA7RHRqOW4cnEKqBj+5i/WlPOpy
         Moyw==
X-Forwarded-Encrypted: i=1; AKwUvBy1EL2ZhfjGCWTNaccI4mzVaM6X6WWEyLx7OP5J5yVZNhtcMtn/s09y8NHdMAcAM1mXWIW95gwShslKo9E=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Nz1sA3I1tBYP7oGFN+QOG6moEF7IhKK+j1ojGEZAX0ye1DFO
	1GiJ0s5g2Fty4thsOa7t0QBMCuo/c52zf6DeBxxO5DiJdxAgHGMP+PpK
X-Gm-Gg: AYBFou25fayousMWDns9C9WbyDq2jW8H6odjfEUX8F/UayaJph74p7Ua5Ckm95dBBT8
	oEh35gyx+OdywZnF8lzlZw3QVjV1DjBPaFnv0ob+lir5jb1Y8A6tW/J+2rrKwJV/A8wMRUa8Boc
	W4vEPrqSk4X86fD+lzJ37dZq12JghYEJeBdvbggDgtgWwC42ID/W9gNWIMEjzIf/FCIRsqgjLcn
	0UV+pV8ibXZnW8Jd+7MFOhqFvJ3vFjL/EvOorWahqATxfu0u4tf23nkiJg9QX7Q+UPP6hee8fnQ
	OXY3s8ery7DqdmHIWnjfGcgqi5tUdRgnFt8DDwbQSGsfVi+ES89kQoKmBhM49mJugchegJGbsVy
	w7O71LKBoZ7wCzb+Ojwnh63SiGFoc9aeNNE/DNjCkv8qdMUq0Lcj/kx5MBwjsJ62keRcW9itWY6
	bWPPhEpjw1WiE9Oeey7r+J851AAACJEYSFJaRBt8TTMmRBkMyS+XswTC2SNRus5PO8ZkhTBdOcy
	EKLPBI=
X-Received: by 2002:a17:903:1a0b:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2dd6c7134b4mr167097285ad.17.1789476587316;
        Tue, 15 Sep 2026 05:49:47 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd6f8ebbdfsm26424855ad.38.2026.09.15.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:46 -0700 (PDT)
Message-ID: <86a09d26-2de8-4590-b135-31564e2c7049@gmail.com>
Date: Tue, 15 Sep 2026 20:49:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 baoquan.he@linux.dev, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-2-chenwandun1@gmail.com>
 <178936321614.3691424.10386784926753862087.b4-review@b4>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <178936321614.3691424.10386784926753862087.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/14/26 13:20, Mike Rapoport wrote:
> Hi,
> 
>> Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
>> with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
>> entry to flagname[]. As a result, memblock debugfs cannot report the
>> flag by name.
>>
>> Add the missing RSV_HUGETLB entry.
>>
>> Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
>> Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
> 
> Can you please send this as a separate patch, I'll pick it to the
> memblock tree.

A separate patch has been sent.
https://lore.kernel.org/lkml/20260915124641.2498280-1-chenwandun1@gmail.com/

Best regards,
Wandun
> 


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351C48986F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206798; cv=none; b=rCKTOdkKX0T2gtaXsYBrmMjUBXmg8yYIghLGXxcYwpLwsGKQ2qth73BW9P4DvapgmOih5mcbzGCIr9orShKHqbUXvMfQHxm/OS2ttDZOjkNxfIaZVY5OqtlcabI5x/wV4GkZWjE8rEtfCWi/DHiozxW9RxsQEXIRIZUS4iF5WfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206798; c=relaxed/simple;
	bh=ybpmuL2vYfyQDcAM/C2s5NUPCTLl2rgC9pKl9yGd0Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rr4+q5p2+9ygOp9/qTLvI2AZaMmWrhB2mKNETiIZOdCQ1wv4zOVMSMRYGhe3OWBuV1pRJK6RNjAA7ZQjVNbP3w1E9UgPmTyNRs/BK/nwt0bcD0RWjDEYQa6kFLTwJMJDYtZ/q1RX9B9zY7rPXwaPZuuwh3gpyjb4Zoe2CQAQDkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThrBDxLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HC7c4Ar/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThrBDxLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HC7c4Ar/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFP2P1726775
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 13:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JDSp49czoELykwuV0c41NKt0
	WWebvsAlOsdvzWqmJjk=; b=ThrBDxLZbRBxo/UjtYhkuhkuLg0Uh4kM0MKwjJLf
	xm/A9+6Gtj4iAmBrvNZ7C0nl/fpvVgXJqgwb8Tih9OAI9Unr3xok853TLmZvk1fC
	RqC+UFkVNzFSL94sjL+hWvJ4/k0wvj0HnBa8wlqgfbGwwssvNzvT8q/swStZ5RGH
	yU5ldsDeaiGZ0xBgVxrB9KqrbRUZkaXea2FKoDQOZCEMcV6Tem68A+3hX1uZBV0n
	qwfdZPP76FWkVuzPoZri5/v2KatI3rplDHKULtnfzi9lwDiDWFBxi33+HcxezSju
	A3ld06RpJWAiKHwYzVeq/6c0LYPp2l4rVSuQmCeKgqeZSw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs28a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:25:31 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67532014b2fso1934391d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791206731; x=1791811531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JDSp49czoELykwuV0c41NKt0WWebvsAlOsdvzWqmJjk=;
        b=HC7c4Ar/zNf0w4ySU7D1eYexgc/lSQgGxrgtgMypDL/nmeOcKddYuHMCxH+NMfq+5P
         7xOW/W33S7ydU5t2uQRJzUuWWhsOPGU1pDeu30tdIZqNl1GTV1AKUutSLw5noINqFkox
         hIJ8hpljW2cx8Zncsr/Me7VcnJj6F4sMxUrRxuHd9LOAHt5MDHoyV0RSGYkCdNSa6FRi
         A9dNbrTCiyN4+WswmSTIdb13FQoppNtH41queSKccSk1WPmHAtFshPSPLzDnJXbOCv22
         ybRCVsMgUnDEhMVCs/Env/VxEBsKxD90zvkX6SAgwxbVIQNMG1e39uwc9gQoPHN9sH73
         vfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206731; x=1791811531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDSp49czoELykwuV0c41NKt0WWebvsAlOsdvzWqmJjk=;
        b=LXHlnyqUZ1NmDR7k7pnYUC6XXHe0HhMTDraQxJSoPXdku/NvRGg75khcTyBWty8RPi
         Yl6tl0Ia+fb6CGWIpk1CXh/f7jzhmeZeP/Mssm0XHCL+3l/ulJqIW5OphaDr5PFqJSzH
         F8lbLWP72tbCTQROCW0UgSJwem5uVBnfs9TJP00dXz1HiNPPSEfHN3IC1DFFlIO9Fh/9
         /xIJJYGoDG30t2FsBvGW71ECjPdesrL0oGj88bmGr5ehtFlvQFKLvOeRuCQMkF3xnaam
         0950irelR5DuJItW1lUUV+eLswSAnhuwLYxCkNcxKF9fHg3daUYsoTCavG6fFtEu6huk
         +8pg==
X-Forwarded-Encrypted: i=1; AKwUvBygI0nUhirMm51S7T5U6jVqCwr4a4XLLdLXU2Vl9yxanbvvxTTu2JlTE7cb0aOf7gY5SvkQegTdOrMup9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZzW62n1DhRniw4E7n+rF5qQPW7dEf9zGbb9RweEAeEbpH8O4H
	ptJi9QI2H7ChbW1gUGM2wjV0gXurxus1/6+MU4bUiH6vlBJgGoPHklrso/7F4Sbp1dUNlFyyfHT
	cE/Z3x06M6WtpKKCfp+m4zxuF93zLI1u7YJUv4TZB2F49ACA5GLLYTP0R6ZDfRaBEwNk=
X-Gm-Gg: AYBFou3xQTfqp+JUmAJnMBi4OUGPxL6aa1wzkH1BlyZMpP6r02Xlhriv/unZpDzy23y
	De1uN2anwhsz/mFrkWsHel0rPIwnavMNZVNq10y8MVRfrSZLsxO+fI+pEWrl5OP8LB1OMdER86C
	B9HmoR/qk5PoqYSI/yXi836cL6d3UFe+b8HrfHH3egVVZaEQYSCVgLiHBQYvNZbzWs8+9btCX2x
	qGNcJa+udiJmaepI2WoSIMyLBa29UfiTlTw2/a+1JC+aL0xK9zMcuUaHu91IWlwcXf4Zl9kSIMb
	15V1bzWwFODPdKnIHerRUzbIT+4CJKI6nklzsTR0gQBdxxVy0qBAQaPmoNyTcgGVniSf0SI22Gn
	ig9Dtqvu7rVmpiY0HmseNywJxKA4=
X-Received: by 2002:a53:db4c:0:b0:675:68f4:67cc with SMTP id 956f58d0204a3-677ac165dddmr3375803d50.80.1791206730571;
        Mon, 05 Oct 2026 06:25:30 -0700 (PDT)
X-Received: by 2002:a53:db4c:0:b0:675:68f4:67cc with SMTP id 956f58d0204a3-677ac165dddmr3375750d50.80.1791206728277;
        Mon, 05 Oct 2026 06:25:28 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b4a383sm3109497d50.7.2026.10.05.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:25:27 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:25:23 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: Re: [RFC PATCH v3 01/14] iommu/riscv: Allocate MSI tables for
 second-stage domains
Message-ID: <dqo5xn7bz2wffbgolx76wryc7p7xsaygz2wrxhxvgnwekfpenu@tnu5uw4hauat>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
 <20260928143113.49838-2-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928143113.49838-2-andrew.jones@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wMeGpkUMGur7v5PHkuKe-hPtij-LPBWO
X-Proofpoint-GUID: wMeGpkUMGur7v5PHkuKe-hPtij-LPBWO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX9VCYhrCnBh23
 jQXREX1lAqwm3S0T8NzPlyMyvxf0MTl4R73pKH0u4krAWyxUhIp41O25R1zvWwJhaE1+/pDCg/i
 Tg+QNYPVfrdbF+AcBLcza2R9591a6Gg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MiBTYWx0ZWRfX20QWRVoGt4UY
 F+l935vKpUMOjHAD7mWV/7eeFmsnx+4t5x1wWq8sRef0P/GaRSbWCoCv7ELUvqiZ0MrNHq9QBk6
 wTLEkqaIVLc1i3NJd7+BtQKIZOOoF4j3bLSD6PQHlPC/EZS9pU0TB6G/1ThLVpEsz+hLikUFec6
 n0ZXE/epX1Pv11w29pJI8Efzo/CK0bZgBO9tn7mPcq6NMNk6a41ST5pUky+ubi1WIPVBn9yNhuh
 XkSIuzfKmd6WRqmX7z6shN85DS+++jafpW+5/hiNEsm1f+aVke+Qd3tn5n+d2Zlkg29W7XPjGcy
 +IJ6BENCoDgtut94f/dfo0BTZVhcojPe8IovgzSU4Sl0nv/Ezg+R8rJvakpSgWfrmJuWGB02W+P
 RDPUcmU5nz/tdyVsI62HL6dcp2rykuYxnnSoN6wgaljJ82CA/+c0tvl1rqjvFPh/agsQWHsI60K
 h8Ie4J2SoGtrIr3mBqw==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac3a54b cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WSAePdX2diYu_KTn0zcA:9 a=CjuIK1q_8ugA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050052

On Mon, Sep 28, 2026 at 04:31:00PM +0200, Andrew Jones wrote:
> IRQ bypass maps guest IMSIC addresses through a flat-mode MSI page
> table owned by the second-stage domain. Allocate the table lazily
> during device attachment when the attaching IOMMU supports MSI_FLAT,
> and free it when the domain is destroyed.
> 
> The required capacity depends on hypervisor support and VMM policy.
> Expose the runtime-writable riscv_iommu.nr_msi_ptes parameter to set the
> MSI table capacity of new second-stage domains. It defaults to 512
> entries (8 KiB), and zero disables MSI table allocation for new domains.
> Existing domains retain the capacity selected when they were created.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  drivers/iommu/riscv/iommu.c | 61 +++++++++++++++++++++++++++++++++++++
>  drivers/iommu/riscv/iommu.h |  7 +++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 0953aaf594cb..3bbb4d0d0a85 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -22,6 +22,8 @@
>  #include <linux/iopoll.h>
>  #include <linux/irqchip/riscv-imsic.h>
>  #include <linux/kernel.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/generic_pt/iommu.h>
>  
> @@ -30,6 +32,16 @@
>  #include "iommu-bits.h"
>  #include "iommu.h"
>  
> +#undef MODULE_PARAM_PREFIX
> +#define MODULE_PARAM_PREFIX "riscv_iommu."
> +
> +#define RISCV_IOMMU_DEFAULT_NR_MSI_PTES	512
> +
> +/* A zero value disables guest MSI table allocation. */
> +static unsigned int riscv_iommu_nr_msi_ptes = RISCV_IOMMU_DEFAULT_NR_MSI_PTES;
> +module_param_named(nr_msi_ptes, riscv_iommu_nr_msi_ptes, uint, 0644);
> +MODULE_PARM_DESC(nr_msi_ptes, "Number of PTEs for new second-stage domains (default: 512)");

I never liked the need for this parameter. I think I have a way to remove
it, ensure table size supports (and no more than supports) the guest's
IMSIC topology, and moves ownership of the MSI table to the hypervisor
(which, since the MSI table is only needed for VM's, is likely the better
owner). I'll experiment with that idea for the next version.

Thanks,
drew

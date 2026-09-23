Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C249CF3A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163667; cv=none; b=tLSDQ01Xl1ABcDCUFtRo0B9XH5/enGZK0SASAR1yRxVea6n3IrptK625nl8c6Pi9h8OqEvLwzGmx53SdO4XIvYvjetyTvDF4hgLzupdtnBGfg/QXt4n9mPOWFoLbpRhpUIn/4tZJazY17SNuzyJYztqhhiI7hxLxWk+RGUaCuhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163667; c=relaxed/simple;
	bh=ajL6f5/1RlB/VvJqhe4xL+NIeS0b7UDmyPv3vPbO+1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4MrjlkpHLWBHlhlPFgTdLweR5ZzpWZmjV4m3+0yzoE9XLZl1A3C4OPgkzn2bWgiRrxumfppf2JdquCYldvKeg9HYmKa9U5C2BFY73osieKwC1+51hiJN9JnbmRxEEIc3+Xrq3mMtcGp94dJU7L8qESzHxZs3Wnltd+A/e6RxdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=glMzn2Li; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="glMzn2Li"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8ZjZM1729651;
	Wed, 23 Sep 2026 11:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uQUtV0
	wLTAkW4ZihQIXr/8Gts2bFI7i5cS9f3FCFtPg=; b=glMzn2LizC+W3RHCzqqjfd
	VndhSWd/n2NW09LCNq3DSm5Hg2gdDfVGn0AO427IEUx50TnQNNnzvQGUjo18ekv0
	ZTB5VfvP9QG+ud9oO6XPSTN7q0DOGxPyzwXHx7m3jzHskCXdBs06ORn0ulcRdI+/
	zEecKscdc+7oVSrsuLAArbfwocpmyt7wkoalCi9eiC4iMh98qo189NhcaVa1D2+n
	NtZI3n5XIPtz5ohFKL7v/0sePQN8zmegLYg7bl7QC/DkeW4WHPd4+udvKDHxdT52
	rFA9dUQad19/s/hYZGtpvxKnqthoupZE4I0IApQTVjQpGfbC9DnHtygjD55RBR8w
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgqjdgr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 11:40:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N95gWD005711;
	Wed, 23 Sep 2026 11:40:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbu8rj94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 11:40:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68NBeU2e45416794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 11:40:30 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50CD520043;
	Wed, 23 Sep 2026 11:40:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C78D120040;
	Wed, 23 Sep 2026 11:40:27 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Sep 2026 11:40:27 +0000 (GMT)
Message-ID: <2d3a50a9-42c3-4f00-887e-56cf4a0bbe30@linux.ibm.com>
Date: Wed, 23 Sep 2026 17:10:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] vfio/spapr_tce: Normalize EEH IOA error injection
 addresses
To: Narayana Murty N <nnmlinux@linux.ibm.com>, mahesh@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
        oohall@gmail.com, npiggin@gmail.com, tpearson@raptorengineering.com,
        alex@shazbot.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        sbhat@linux.ibm.com, harshpb@linux.ibm.com
References: <20260831065441.48654-1-nnmlinux@linux.ibm.com>
 <20260831065441.48654-3-nnmlinux@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260831065441.48654-3-nnmlinux@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=G+OJgNk5 c=1 sm=1 tr=0 ts=6ab3bab3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=l3H96H2cUKNrCSvcW0EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NiBTYWx0ZWRfXxS6RZlHtPU12
 1IKpGSTX8eQldi8QrGYvRE/Bci1IZsyXHJHVTc2PDb0GFH4aBSJ1msPb7iGVAzEqZfOOwrmSsCJ
 WW660GqzFqL1yw8S0u2vghkfLWKb7jBm4A3/9vpQqOZZk+e45kjNc1CADG9P3BjjccP8uMsLEsE
 6vmLWwB3mcJWligVtWSh35ZcMHl9rP6iCQWCdamE0gchwI0sphyNMeUK9n5vFbPjGePTkkPpAX7
 wbjR5I1DVS4e2+QhJc4Kzr3PT+kvb7HvnMM4ftq7+BWuez9OtoiL8z7ZGIOC4IL1H1tvm5ydHm1
 +1XksrD4NmcMvR+0XtzOYS/mkKS8ZfFy6Uo6ISCFylLGR6eSmPPvVLvWJw5ELrUOr6G3Mlt79nK
 /lH3tnBEp7QG0w17rrEDvf631bOdUm+uR7xdXeixo77x4bwK2H1SsvW7MJmCToidVjq/8Lx+RGo
 VfyAzX98uyl96P/zMFA==
X-Proofpoint-ORIG-GUID: qI_qedNBfrEsZcQZ18wKcRJaU0cZqJFd
X-Proofpoint-GUID: _JSxy0piIMu9Nl45dY4ZoBgVQQ8WxT4v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NiBTYWx0ZWRfX9OYT2UYe3Kqt
 7spRObAabalkH03xOcGq/WLorXkLV28jes36u0UADLtHJdXoB7SrTLh2KcBPdEm10KLKWfoASCb
 GWD5kaf0xg6gE3XqY+tnQXvHgTxmxL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230046



On 31/08/26 12:24, Narayana Murty N wrote:
> VFIO_EEH_PE_INJECT_ERR receives a target address from userspace.  For
> userspace such as QEMU, this address may be derived from the host Linux
> BAR resource.  The platform EEH backends, however, expect the PCI/IOA
> bus address used by firmware error-injection interfaces.
>
> Normalize IOA/MMIO error-injection addresses in the sPAPR VFIO EEH
> ioctl path before dispatching to eeh_pe_inject_err().  If the supplied
> address is already a PCI bus BAR address it is left unchanged.  If it is
> a Linux resource address, translate it to the corresponding PCI bus
> address using the BAR-relative offset.
>
> Keep the helper local to VFIO so the address semantics of other
> in-kernel EEH callers are unchanged.  This provides common handling for
> both pseries and PowerNV backends.
>
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>   drivers/vfio/vfio_iommu_spapr_tce.c | 90 +++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
>
> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
> index 1c0eec228cc6..8a6cc856d7da 100644
> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
> @@ -774,6 +774,85 @@ static long tce_iommu_create_default_window(struct tce_container *container)
>   	return ret;
>   }
>   
> +static bool vfio_spapr_eeh_err_needs_addr_normalize(unsigned int type)
> +{
> +	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
> +		return false;
> +
> +	return true;
> +}

Do we really need this function? It is only used once.

> +
> +static int vfio_spapr_eeh_normalize_addr(struct eeh_pe *pe,
> +					 unsigned long addr,
> +					 unsigned long *normalized)
> +{
> +	struct pci_bus_region region;
> +	struct eeh_dev *edev, *tmp;
> +	struct pci_dev *pdev;
> +	struct resource *res;
> +	resource_size_t pci_start, pci_len;
> +	resource_size_t res_start, res_len;
> +	resource_size_t offset;
> +	int bar;
> +
> +	if (!pe || !normalized)
> +		return -EINVAL;
> +
> +	if (!addr) {
> +		*normalized = addr;
> +		return 0;
> +	}

This silently bypasses normalization for addr == 0. A comment on
why zero is exempted would be helpful.

> +
> +	eeh_pe_for_each_dev(pe, edev, tmp) {
> +		pdev = eeh_dev_to_pci_dev(edev);
> +		if (!pdev)
> +			continue;
> +
> +		for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> +			res = &pdev->resource[bar];

I'm not very familiar with this PCI resource regions, so quick question.
is pdev->resource[] limited to PCI_STD_NUM_BARS?

Also doesn't this need locking around the traversal? This dereferences
pdev->resource with no lock held, what stops hot-removal or BAR
reassignment racing this?

> +
> +			if (!resource_size(res))
> +				continue;
> +
> +			if (!(res->flags & (IORESOURCE_MEM | IORESOURCE_IO)))
> +				continue;
> +
> +			pcibios_resource_to_bus(pdev->bus, &region, res);
> +
> +			pci_start = region.start;
> +			pci_len = resource_size(res);
> +
> +			/*
> +			 * Case 1: userspace already supplied PCI/IOA
> +			 * bus address.
> +			 */
> +			if ((resource_size_t)addr >= pci_start &&
> +			    ((resource_size_t)addr - pci_start) < pci_len) {
> +				*normalized = addr;
> +				return 0;
> +			}
> +
> +			/*
> +			 * Case 2: userspace supplied Linux resource/CPU
> +			 * address Convert it back to PCI/IOA bus address
> +			 * before calling the platform EEH backend.
> +			 */
> +			res_start = res->start;
> +			res_len = resource_size(res);
> +
> +			if ((resource_size_t)addr >= res_start &&
> +			    ((resource_size_t)addr - res_start) < res_len) {
> +				offset = (resource_size_t)addr - res_start;
> +				*normalized = region.start + offset;
> +
> +				return 0;
> +			}
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
>   static long vfio_spapr_ioctl_eeh_pe_op(struct iommu_group *group,
>   				       unsigned long arg)
>   {
> @@ -818,6 +897,17 @@ static long vfio_spapr_ioctl_eeh_pe_op(struct iommu_group *group,
>   		if (copy_from_user(&op, (void __user *)arg, minsz))
>   			return -EFAULT;
>   
> +		if (vfio_spapr_eeh_err_needs_addr_normalize(op.err.type)) {

At this point eeh_pe_inject_err is still using eeh_pe_inject_mmio_error, 
so why to normalize the address in this patch itself? Isn't this is a 
good candidate for 4/5 patch?
> +			unsigned long normalized;
> +			long ret;
> +
> +			ret = vfio_spapr_eeh_normalize_addr(pe, op.err.addr, &normalized);
> +			if (ret)
> +				return ret;

We should have error/debug log to tell eeh is not going through.

> +
> +			op.err.addr = normalized;
> +		}
> +
>   		return eeh_pe_inject_err(pe, op.err.type, op.err.func,
>   					 op.err.addr, op.err.mask);
>   	default:


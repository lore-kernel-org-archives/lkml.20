Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879B3B47C4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160363; cv=none; b=QqBscFu4QoM88JyUgHNGgCz4XYVAOt6ddvVvgMSRHPkollwQX6SnWN/2j7JlrphUcqNARZlo7ETjwROiYk+z4zySyvzOOWxC07pcwlJFfLkuPxxmockgv+VmBXhiZTi7vNNxFjr0Yq08bHY1gwbTfWp2thcGQH8YBwQIKPzzxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160363; c=relaxed/simple;
	bh=dx2tUkNJF1I1Y6aQRmMcf9MR/rvI+7hcPI5j2FLD364=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXmz3wf6NuLu3Vt5njL3TxdYAEA1BZO04q7EXSvYw3bsv9iPNkx+7I5EmueAD64PMmkHsQHsrQYvqCYV2mOTCC4UMtf2tXtDPGfw2VePPeqeOlSSoTzAzrWvQseuuXqCTyOxamtiOHLa4onwbPg13bo9C1Fp/Ouz9TJzO8k+ICM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iFzvpHrh; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iFzvpHrh"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V537d71162898;
	Mon, 31 Aug 2026 07:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=AsRKlugXUM1TtrBKuxctJiiJs8mskm
	uBSHLm+YfQRR0=; b=iFzvpHrhWGGngF93dD29janyOA0qlsAXrqFKVz3bKWI9pT
	IvXLG2A+RIlkPzQ2WK86PHajCw3s7r9OfiheI3qq6/2Rri8g4PyCPsO8ED6NfY5z
	lYevFUCcsYrusN/fatA2CEIPmHg1CXo2zP0o8xNDMwNGbAg5ja9rozVXF02usCWM
	Oiv2S097z+8JL0rhAOptYT2xZLB2pvWadhoL+48EcyrF7HwJwlplNASEMFZynZ5o
	CqiuZ1X33Jsv1owIklTzjG5YBRlYVLY0bAADEpvXx2t48ss7YxcEAlXEr9wzHML4
	ndPJQJAVfabBaaPpYkgk/R8CWQCRkNZtDVkCaxJg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbmuhfwne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 07:12:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67V7BHij025239;
	Mon, 31 Aug 2026 07:12:28 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gc9rq4pnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 07:12:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67V7CQS736372916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 07:12:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35E862004F;
	Mon, 31 Aug 2026 07:12:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B19F520043;
	Mon, 31 Aug 2026 07:12:24 +0000 (GMT)
Received: from dhcp-9-123-15-208.bl1-in.ibm.com (unknown [9.123.15.208])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 31 Aug 2026 07:12:24 +0000 (GMT)
Date: Mon, 31 Aug 2026 12:42:21 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Gautam Menghani <Gautam.Menghani@ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/64s: Fix the vector number in comments for
 h_facility_unavailable
Message-ID: <apUpVYD6vGXV9gS-@dhcp-9-123-15-208.bl1-in.ibm.com>
References: <20260511080412.50722-1-Gautam.Menghani@ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511080412.50722-1-Gautam.Menghani@ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: axXQlXRbgGtOuC8bmfV8LTCOj052jHLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfX7oSYfQmbzF/e
 WA2K8qc+ZbZ7i6ur2vmWJfFcxKv6ik4fgp9hiAGZU7I7fUrkR8jaYr2wPCl1VZrkEHvE0hol038
 +qntk5FCvIn50NWS/vV5decOxAyFElM/sjlQRntd8RP1I4ruXp1oyFugwycJfbShbuQsM3bqLmI
 1PCif2/RJs/fi/zaARLdzRrbjC7GsLJ+Wfzoux/PVaYuup73FyoGXqFvg9J6JQ34Al9wZYa4Q3z
 2mo2Jqv//pEsVvT4OeRVVEAr3JZKQk0LmLtD70IW8Iznx/BhBpMG+34xQcRBzCLf4S07NdYlqAc
 V5EU+ke4ZOLj1s8YjCNgfmO3kwInujPtKexl6XaGhH+W6NS10DCrShs7KMWfmOukwk+kW8OmYnn
 CjFwOTnfW6qMGvI+VwWGC+xnE8Fk+xEeQmaroShoefKuAakhGZ3VXMGh3Vc+jWdt9ZoaEhQfijX
 um6wz/J3l13rYshr8vg==
X-Authority-Analysis: v=2.4 cv=Osl/DS/t c=1 sm=1 tr=0 ts=6a95295d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=KsF5BuLE4_TF5G8aTxwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1OSBTYWx0ZWRfXz+0R6zk7a6rh
 Ds6wBiaGVMMjLU8upS2AkxQAoU9eMgX9E7tx+7e+W3aBJlm7sFsXF0EzUErLJmerRwwm6uPNDDW
 tAilDwqDdKj+wJlWsVhANpZR7mXg3ag=
X-Proofpoint-ORIG-GUID: JKjcZaAYA5sr4EWRFw2dwwIxTJL0GRS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310059

On Mon, May 11, 2026 at 01:34:10PM +0530, Gautam Menghani wrote:
> From: Gautam Menghani <gautam@linux.ibm.com>
> 
> The comments explaining the h_facility_unavailable interrupt have mentioned
> the vector number as 0xf60 instead of 0xf80. Fix this typo.
> 
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b7229430ca94..2696fbbca3b6 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2498,7 +2498,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
>  
>  
>  /**
> - * Interrupt 0xf60 - Hypervisor Facility Unavailable Interrupt.
> + * Interrupt 0xf80 - Hypervisor Facility Unavailable Interrupt.
>   * This is a synchronous interrupt in response to
>   * executing an instruction without access to the facility that can only
>   * be resolved in HV mode (e.g., HFSCR).
> -- 
> 2.53.0
> 

@maddy looks like you've missed merging this.

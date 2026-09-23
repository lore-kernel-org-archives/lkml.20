Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCA542ED8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181291; cv=none; b=HCHhqnMf6KFEs4HT9iHdeXGwFiTLFC1OjgbXLwTBBIoZk/351s3pfz8UdL0KFQMYcI5Se4qE9q5W5+pjioQLfjok3ot5A3j04EomNIXOlCHF+BO+53xD9xldq0fTBaZ2S+zuo/DL0hXKHw5Nt646H3kCQzycSsXk42kUJV0OyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181291; c=relaxed/simple;
	bh=kgDsSQbr7da8IFbWQK538zmsUj06/QCBCRpfgbtijPg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bLl+XKu/MWsfwDUrMGrz+L/dWLdBiyHLcFNAyqTHzupQm8tVNrO05I0qo87zLHLfIacvQigSFgx+r9wnP6fo2usijDQ+QFbrU147kxuwQEw1vmMFDlUrhnZETU9ahDvVgBqoZgdA/7T98jJ5S0Wvlif1hPSxBezmhYvzk+hECHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByMAJO21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kv3g2EXS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByMAJO21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kv3g2EXS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTpco063808
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	syJmSg1jd2+OqFENPatOG6ZxGNllzRDnmvLVWXY/WFw=; b=ByMAJO21i0WkgepC
	qBLMYPmSBPFnmTAa6Ql/4NM35PeW+vJ1ZmXLA4Z+PcAcD3IcefYrryJfkp9RpQud
	nfLrdiR/V+ZX7jaC/2FTKvW4IOn8+ZD3s4SodQ3g+yTJAGDZdstDWYXuyDJD47TH
	EqjGNNbeREImoXWBHJKmPfKB6QLOX6fVQGf9sAXRvPQEE/1ZxC/TeBHB2eMbG8Dq
	cVy1kI5KTvitLZec/Qdn8q0mjSU4Be6kRbneE0Lz/dBj5TsflBz1NUvYQ6aDYd8i
	dvg194gDNqBINzt6srKx5t/SoakUcWwy0B3ENudjTRgMb8LUKb3MPgPuJuFTfRiF
	X7bATA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbgv1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so751544a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181279; x=1790786079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=syJmSg1jd2+OqFENPatOG6ZxGNllzRDnmvLVWXY/WFw=;
        b=Kv3g2EXSeOC6A3vQPaTK7MGHSkrhSa8e73un1vYFiC8XOxoYMylRKQqBicA3HIb1BN
         156V4LT6nH6Po2TeOUmE4mBUG0pCymArmikMXpiOg7Q2sNuCU1YZFpr4a1cC3q2/OptL
         8JEFwrxA6z/YH13W5WbMdP3Uiaal6lOyHMSdo4QWb4mH13T1T/tNjpe6WoQYjwVctPCS
         dNHIfCRr5z82gniEwSV7xaGAn7EJBsr+AtY0DygPYx6qTZS71kChiTiQaM61qL86AcMg
         lMa3PR7I/UjLDgVD0Rl4XgyFtO02HdoNoQGLQmahhHZ69slAkHQYYojcIenYRfTkrZZD
         RSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181279; x=1790786079;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syJmSg1jd2+OqFENPatOG6ZxGNllzRDnmvLVWXY/WFw=;
        b=LOTK+AEX9pHuzHnON8fIIpsEUka2wEKKv+ogrgRip8uoFPEMfQJG8IDdLEWG0mRV4f
         B+UByLl3u6mZae+VgyIYXRe4kCERKaDB6MyVfkX0XbRvV9bQA48DTVYaQC/vz4k8zkxs
         gkJsSx4q5b4/t5TQQc/82Ex7XX7MDGJFBytitw+AehdjjPbF5ixtSpb1zsdrHZspVwnv
         SS39u4CVyJc+a/xwvV6lJj9XREJ++vJjtMCVMKXZsZBNlR7Sgxa2rwg+KxZqYOwGHBU2
         AUBTILv9F6pxq/JfNKeydCz1WbWgL0AlJaJzZiXbCwXtP80nAkggM/eQ/pESTGMC+FH8
         uKWg==
X-Forwarded-Encrypted: i=1; AKwUvBxM3OEWGAB7qXRGfBFPaVpmJQUFyFArjj18KMs7uO8ukFKrzLcMBWpY0+hmZkSJ0H3ANlAeompB5ZFeIZA=@vger.kernel.org
X-Gm-Message-State: AFuF++lec4YwnLafroaBHEMAz8ecFDZq0sU3TTAUuZYrNdP2OVCyK4/G
	ccSiv+Im3ALrV1U+1j6V7AUe1S41G4Gt1JA59X1n8DkDD484afuO1OqPAfdHDEApL/jX70ttfcE
	P8KyO2d3ThAj0oXls7758gIiOG5uVmPw6A9uI6At/HIJ7h436L8DdIhGcrr5rXpzfJJDmyDDRv9
	k=
X-Gm-Gg: AYBFou1/ASevZvz5TmWZOhH2Y46NbuqGGPlhnaLmGiWufD3OprBXIp0s4lL9v7rlwYV
	4LXOiefn7NaX4WCgXAtrpAIw3WOAbKSdKPBrW4BfVqj5SxT/JqN5sFnCOB4Lcg+v4duUyz3oyyp
	fNNfWgF6rprJ1QDHQv46dEp5Tkme4CQiv73yILC004O3/s+7vSJMSasQcmCvsp2h2t+E1ExSxTY
	UFZ6jfAeP4i5+oA+ptAXWna7+v3OHJEumkhnyhgT760Li9TAnhP+16fXZ/f+gdhdHis7glqt7uQ
	HCgK2Vny2fHY50k4aHKHiNYhulmBo8mYativJLg2nrT7hMQ04ziIoatYumDP32sHaN83WDVJVlD
	VuyzeRdTbi1CNHdFwqfk1uX92S5pIioaC7Z2PnwUSbxfEL2axMbWUjMLbTpMu7MEr
X-Received: by 2002:a17:90b:2803:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3a07e53ff81mr2826998a91.24.1790181278461;
        Wed, 23 Sep 2026 09:34:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3a07e53ff81mr2826960a91.24.1790181277942;
        Wed, 23 Sep 2026 09:34:37 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f0915sm1427960a12.21.2026.09.23.09.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:37 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:34:33 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof =?UTF-8?Q?Wilczy?=
 =?UTF-8?Q?=C5=84ski?= <kwilczynski@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
 <robh@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Marek Vasut
 <marek.vasut+renesas@mailbox.org>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Will
 Deacon <will@kernel.org>,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] PCI: iproc: Use __free(device_node) in
 iproc_pcie_msi_enable()
Message-ID: <20260923093433.00006cab@oss.qualcomm.com>
In-Reply-To: <20260922210839.3765444-1-fuad.tabba@linux.dev>
References: <20260922210839.3765444-1-fuad.tabba@linux.dev>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX0yycYdEWfUO4
 0sLFJGXS0I6cx+gfSPG0qd6IOrFtOrGQHDU8b+7BIaALMpRypFLZiuYZPh1hNC+JaPtbGpwdr39
 LRLSraL9YIsxT/XElFTNPiQe5xpdC1Q=
X-Proofpoint-GUID: 7LVnNWJyNkd2-8yerKo9YYTeb8WJITfu
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3ff9f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8 a=lkVW872q3F1hLcTO0fsA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfXzkJINsmiK6LX
 O9i7ZaaKoGcPr3CjFQK2BT1+UhemHerrDNNtdu2t30lASLG28N70Er1P6xBSwczV20Op4LKL12T
 iMKgCRsJA2hJo6PPjmNYu2N+sRaQ6EYNAn45vWzFylWYbiZYTg0X8oTe922I9qM3TSNUYB08QUv
 Iv5I4ftaLPKXM6tqoU3r91ULmkiz2mbls24PMxwX/+6SwWavct8+6xMfVPHj6OY61RM0Dl0wqSj
 RVoCA+lD2JsvtS6lqQzw6kOmRwma0RXrgEOMtU2boozDHviDW9nVcwZEo7IgKvKdwjq6hRXRlh+
 EUJQ9M5ZT057VImDxx99ZK9+G2fFGFcVCyOeVtDSrsUyXc4H33dJY/EDi10X8iiLShVeG7Dyypn
 kArSyv6t1eGMf5c6dE8JoEnJpoIc9e6vmJwsyf3lInJFhvpRNA9HVZi1iDYUfNOctB+yF+qcvfd
 rIdMOh/hICDW4VlATOQ==
X-Proofpoint-ORIG-GUID: 7LVnNWJyNkd2-8yerKo9YYTeb8WJITfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On Tue, 22 Sep 2026 22:08:39 +0100
Fuad Tabba <fuad.tabba@linux.dev> wrote:

> Declare msi_node with __free(device_node) and drop the out_put_node
> label and its goto: the scoped cleanup puts the MSI controller node on
> every return, as the label did.
> 
> No functional change intended.
> 
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Link: https://lore.kernel.org/linux-pci/61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Hi Fuad,

See the guidance notes in cleanup.h.   Linus has stated a couple
of times that he really never wants to see = NULL pattern miles
from where it is allocated.  Best you can do here is shift
it down to immediately before of_msi_xlate(). It is fine to declare
variables with destructors like this inline (i.e. not at top of function).

Admittedly if the scope shown here had gone a few lines further this
would look less bad!


> ---
>  drivers/pci/controller/pcie-iproc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index afb3aa38ac6bb..b4f4e6e1d4b41 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1338,7 +1338,7 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
>  
>  static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
>  {
> -	struct device_node *msi_node = NULL;
> +	struct device_node *msi_node __free(device_node) = NULL;
>  	int ret;
>  
>  	/*
> @@ -1357,18 +1357,14 @@ static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
>  	if (pcie->need_msi_steer) {
>  		ret = iproc_pcie_msi_steer(pcie, msi_node);
>  		if (ret)
> -			goto out_put_node;
> +			return ret;
>  	}
>  
>  	/*
>  	 * If another MSI controller is being used, the call below should fail
>  	 * but that is okay
>  	 */
> -	ret = iproc_msi_init(pcie, msi_node);
> -
> -out_put_node:
> -	of_node_put(msi_node);
> -	return ret;
> +	return iproc_msi_init(pcie, msi_node);
>  }
>  
>  static void iproc_pcie_msi_disable(struct iproc_pcie *pcie)
> 
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780


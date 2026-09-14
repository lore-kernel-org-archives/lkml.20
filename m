Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBDF3A7593
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418922; cv=none; b=YQh44gnBqTsYf8llM9PhIo9U6rpGhUaN8IM+23/JvAf9XA/NWjYP2+VbQUJmyo0AlSAb7BcOeaPHBcJp5HabDApb1pGZpJj+gVZ7X8qCpI3sXZVoZv4bQfYSyZrsYgfAhob6oBwRlGcfsi6+Ua/kQ03ieGHLWCZEjs+H64E3b6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418922; c=relaxed/simple;
	bh=fqJvoQBoKqoOv6P+b9IQ9mjZppt5o7nFP7HzcFKNFRw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iMYfhyz+viy9iSkC8j/HqV1+rH+3fdBHDo7eQ4/k27kzXhSv7jfPx+vxHlq+DQ6MZVUkv43YdYGk3ys+HqRGABFR+clotjsp0zxgQxkV78ArpR20QNYmpIbkAn4W1vhof4mI7MyRcLOmv8i+40X7R72+Gwu91EdBrsUYOYfalS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfjqILKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a90w5Riy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfjqILKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a90w5Riy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYRQR1485179
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=; b=YfjqILKR54Hcu7Ag
	fnSJtdYq4XcDNViCQaRA9/je893O6NtKOZOlV5Hc10pnpWZvK8b5DldupNePKVhR
	6D/YwP0eIaaWOTL4X8R1jlV1aLRiwePlvvuLoHjbxjkqbvtv2GmAQxizwPCuS8RA
	JQ5SrvTdezavOG9dOYfGQ2HxX65GcMH2mbe9yGk1NpyZXDT3V/LlRySk0JJtgnT3
	+2l6YogzrnmqJ1RMaWrkI0irds/sZegCTxg0Y35a6OmO2jFiASRY3bjPawZnL/An
	bicjOpWu7lBhZkFxAZF9tH0dRLQNfhmUoIqKRJidebYXpxmobzm5YBwW4jfTh1+O
	aH0XXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kt8mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:48:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso5958225a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789418919; x=1790023719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=;
        b=a90w5Riy5pc7kgUGoUf6Yp6v26jC1FGwvkDrwy0kXulzN6P/CneRFd+AKrL7l8POLB
         qD2VOEwAOzIkU3ouyEaEvcyHKDWickvRmo9atOi6wZkjIPMwD7f+wvRfAfeqioTghpE2
         /1G/PDpu0AZzEBOnQcZGBHokHJmnp7XgcNKWDsoNPrN//j0+1brOcXmUj6A6hAqDii2J
         9gVksQHc+KjTtbILAwg5BjW8/mAjErhsFRxlekBo88VHaLcXY7xRDlpraqw0XuKKswPR
         fxtDZkb8tBFJ8e78Pps9J8Qp0bEzzPjf8bHrUhvzH8wu/Bjz5CWziNEBKiU//QeahvOh
         zm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418919; x=1790023719;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNbtU+fYM6Bse6/ahm7UnypPYDX2ByCgnI422mmbSzw=;
        b=D4agGjsrH9eXhIppGdgw7KRHvouUxmdqZdHbl/AZ4bJW4oWJ6lSLdoy5kdqcqBiidu
         YBPsDqF/zFGsnK5eVRJZCrqkpfLxFcL7TlNaiAh3evnPdJArEPTnzR+XMBjLMZ5946vm
         tYWL0hhWQJ+xUT69fCbSdCppYvRHIkZ+tZBq6LNRN9jgAVOKHyEgeQRT0Lbf0r2lYgM6
         3HpyVLOD4FW6Mhx2Q6fsbnUY8ENQ3UJFWkMVkZeBD0VEd2jPQcpFbo+YvhNfauIJ4Q8/
         5ERkC1w6gJDhhghCoHd3/pwqOAF9kjkirfb90y/1beba7gmusUbN5QDIQ9DwB8Yce1TY
         D/YQ==
X-Forwarded-Encrypted: i=1; AKwUvBybst3MxGi3124W3TIgbxkNZaBtQEio4SCh/ZsfJ0AbKvsvuNyNpsq9zz+sKUQ5LwAGxWg5zhyae/pV2qU=@vger.kernel.org
X-Gm-Message-State: AFuF++moJCWMB2jW8/MdVFypEyzOqhS3ZqeOsfiyhRaHQi0LC/nYbBxm
	wtk4s5KYVgOeIhg94y4h5riE8RiTc2eGi2frxxYYm7r3UzVx7qHWSTw64nhFPw1wSptJ4vwv3JD
	zrz12xLlzmkSRt1kuwpALCzEj5bQoGLZiaQ8lEkM++48U+2oJacf8NPFg/wPoP1jX31A=
X-Gm-Gg: AYBFou1NqTF2m435giiHUzNyyN/Uxkc0ZDT/aDU+YElY6gJwl3aoNVIanjO7T5nt719
	bOZ6T4E/brcIOPj8oYwH8WE70GdnFVcwaDtprIae8JMdBODHnUpJfzy9jxoqaqkbUdoqRATWptG
	gQnEegzlSdxhOGmefuY3TJWP9WE2DCQorLhUMFpJhf6hNngv20RHApS4Ie+/TaMakB4Ku4DwV+V
	BLcNFtBxPP4aoU6fF09WvXDh+wWIjp3s35HFV9ICPTGl3KvoA7tfjrTbBTcU9+ISVG4yrk3z1Ou
	A/hzBnYkZHL3yb+qZgrAojYq8khwPpY5RH1vS2VV5orUz+UouPAl63+0gKL8QGFodp3SYpK2bdS
	nu719epD/GFp8Z4/D41xDTfXPcj8=
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3db405679demr8759765637.19.1789418919016;
        Mon, 14 Sep 2026 13:48:39 -0700 (PDT)
X-Received: by 2002:a05:6300:6708:b0:3d3:ae40:51df with SMTP id adf61e73a8af0-3db405679demr8759688637.19.1789418918602;
        Mon, 14 Sep 2026 13:48:38 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm18430177eec.9.2026.09.14.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:48:38 -0700 (PDT)
Date: Mon, 14 Sep 2026 13:48:35 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <20260914134835.00001fb3@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-6-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-6-aneesh.kumar@kernel.org>
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
X-Proofpoint-ORIG-GUID: dxlu4jDPgb4Ab7i-n5m-W7GFRaJdqpj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfX6HXyCL+yyaSW
 ybB8C/NufhCgy60TYWDw2o1sy0JqX8K6aZWF2NyoKov6QpfuiHmgWUyZxvtEIo1d8IBjjYXrKtZ
 sJMeghLpsGh/aSHV9EWg5bEaQiZyVkQuz4UHLj/NVNaY204xBejWL99RWJuc/tsfB+uaRvOteHl
 QDzbH1U9k8oBIOq6dHl+b8BjbA60AQwq3+HoOjBS+b9dUhmGhbTnrzeTUAm4p5d5t4ZD31BXxM/
 LfVDYgTHvwaXQqAPimPb38Z8fd097e4qz78Jw24l8cXp0VVG2NoC1Ai6BoVhmOpMqUvuzhnfbc/
 bytHN/JBI0ApZ3CrSocRpGhaA6IkpH0m0rML6dk6DPQ70Xgagh+0u3Lvf2RhYLgi/iRnq0pvce/
 grQwOMCoJqY4TwykAThqT2KDnju9fiygP6PjjBlf528N6Ekbk9hA0TomJwew84l9nyKG3w83HQf
 MUiuMM0VetQy6wGIlpA==
X-Proofpoint-GUID: dxlu4jDPgb4Ab7i-n5m-W7GFRaJdqpj8
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa85da8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=WpFFXPemFeC_EDwlIHcA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI5NiBTYWx0ZWRfX+m7n9HOk2fsd
 CtnaOn9AQRbtRBdc4EuDVVWJKPA1BQ2aFhcVs3N1y/SwaRfLuVL6AXjJtRd8ImkIjSfzPSqWas8
 XgDks3u78Ng4ko+N4m8VcAnq1rRfNx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140296

On Mon, 14 Sep 2026 11:35:09 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.

Should probably mention the structure renames that you have in here.
I wasn't expecting to see anything other than build system changes and
a file rename.

Jonathan

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
>  drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>  rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => main.c} (97%)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
> index 69eeba08e98a..7564f4fcc4a4 100644
> --- a/drivers/virt/coco/arm-cca-guest/Makefile
> +++ b/drivers/virt/coco/arm-cca-guest/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
> +
> +arm-cca-guest-y += main.o
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/main.c
> similarity index 97%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/main.c
> index b741643d1364..80659f0885e9 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/main.c
> @@ -156,7 +156,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }
>  
> -static const struct tsm_report_ops arm_cca_tsm_ops = {
> +static const struct tsm_report_ops arm_cca_tsm_report_ops = {
>  	.name = KBUILD_MODNAME,
>  	.report_new = arm_cca_report_new,
>  };
> @@ -177,7 +177,7 @@ static int __init arm_cca_guest_init(void)
>  	if (!is_realm_world())
>  		return -ENODEV;
>  
> -	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
> +	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
>  	if (ret < 0)
>  		pr_err("Error %d registering with TSM\n", ret);
>  
> @@ -191,7 +191,7 @@ module_init(arm_cca_guest_init);
>   */
>  static void __exit arm_cca_guest_exit(void)
>  {
> -	tsm_report_unregister(&arm_cca_tsm_ops);
> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
>  }
>  module_exit(arm_cca_guest_exit);
>  


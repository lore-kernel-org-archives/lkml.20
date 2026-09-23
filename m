Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE87552939
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183433; cv=none; b=nZKV7A72DHwVGN6pOelpt8Dv68WNOlVF71etQE5xK9JzAHhCCPKKSkcEubY8h3XXtrPBFsnNZ/4oXjHTT0kVJepr2/XY+tSOCCqMhVpDyNHWyDc89WZ6/xvSH12nnTMUEbEY0gnaTV/yMreew7tCSga5i080f0DyxFE9TOFnAGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183433; c=relaxed/simple;
	bh=ESRk277loCDm0r6e3+GMsoT1BaCJq3wgvkENNhFNHFw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=boJE0PlwGTOlNL6I6o1mXiaQP3aQUmt17Sr32Jd9vrNbNII/umRbPs0d5O5NPIeVcK9W+DHl0fviu1LSR0cffDBgQCei7eOM7i1Kumxi0dpGBixrLvKItY0ti+FtCDvVBMBh8zsKU5Gj9FHisxSmM7KBi5RQkvvAKiglThxEWr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ft5VuPmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FThTXxHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ft5VuPmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FThTXxHW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTi9j3938167
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mhMgPy0NdyeMrRrzvm3C/TebfdiGs7bXMmAUtAocDI=; b=ft5VuPmYL51lxpZ0
	4GAQ3LMXuo4MZIC+nTmJG1iBYfzA6d3atgbfi8aG1C9GDd71+o7PQxn5O1uRiXQD
	oQD4dERlABtQlZY+XT1gmPmk+XPAJ4uWDdC/8+tgd9kpoaKFxStnlLzsGzJNThRa
	Z5vBx6+uEGv0uCl51DGJp3einpnNixtpQF2hEgNhGGjnuTHlduCy7G7S8HxGosIA
	f+xOvRlEs6QhYb3u5qEYeXUv9Oj1DXkPzClvvTDohofc4AibpkGwgi3AvqXUTzEF
	wnrbhTqOrlf4/NonzQGAjEMnQfqHV8k5g0ziTsgMDwqWypydk2N9PHDt/UTpV0Bv
	TZbI/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwma240-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:10:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so63489a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790183430; x=1790788230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9mhMgPy0NdyeMrRrzvm3C/TebfdiGs7bXMmAUtAocDI=;
        b=FThTXxHW0SHBY7mday4y8QPf1yKid82U8bj6LC+mi+TQvVWoavsNaZujWveYKmYWph
         hDqX+QYNIZPwRdv3hdQqQrmLYTdPoxmiTudw9fNAAeijxTs1E3Kd0/1rIBnqGyvq37x9
         P6r5AX826GADgJVv9Nmz3DiHj6tx4LmZF22/u6515Cs7xb/CsApWQCgSWUVB/4tgwgdL
         WGPnbljxxcuE84hCtDHSQFwlb6NfqLXbaeOKcOBZUGiGs0d5ukYITxDsjqvdFrf9nArn
         erzCx5M9Wbh1qUCiW+wmcN4pGPDVimV3YdisZPD/gi3Xw47r++cfG/ytcJeye67N2bNc
         E6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183430; x=1790788230;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhMgPy0NdyeMrRrzvm3C/TebfdiGs7bXMmAUtAocDI=;
        b=HuulRUqv8wIb5sQWiQFRF2pSRezaO0zPHuIt10HodgRt1Xcbk/NaiXuJ8TMrpDIrxW
         7BWlKwpPuBvvI5mODxAOIGBPGxOniI9QLTq8XWRWU2BL1mhsv+92UOGR5Nrl5H51Y5k6
         4xUkAwFTrFfHVjP+nWDMAPvaaApnnu/Jl8oVHIYZH4sQFTdl2+bqF12b/0VpSa26uZd4
         eOIxtUEYrII8q6FROolIhcjZ7avsiRB/eM7lL1FhyWM9DYQLurrUMY2USIX0TwtI9Z11
         H5Mo9VQ/Kaf4elaHAdTA/0FEINkn9pTufyBKEWNZkLaoO2b25i3fU7C8VoYgycH9SK9A
         zqEg==
X-Forwarded-Encrypted: i=1; AKwUvBzh44A7pQcJSs5n9Db3YJDbTUphYP3+l3IqhW0gJ006nhHYIxRvRyT1JArrkYgpeMesb0RL/juGnWtpjZg=@vger.kernel.org
X-Gm-Message-State: AFuF++kiKh1P97x3aryBujMRLBqp4+SB+Fu2Gmuo/bVvBJOsKS74AT4I
	oQXkzAF2jxmUTBfzPM9n9F+1KSsp8hYBhu8OT5p7qcSWfW36qQD93WYIo52c3pTuNfzy8O8LwrT
	t3vnq/dLaKIRNoyG0el2lbCvLXLZz/agrt+w1ClXW0PHqHn7teelRurRxGm89kFaM6Zs=
X-Gm-Gg: AYBFou3jvUIZX5l4fBOp5tLQvT+ZhdYPj13nm3W9bnz42vGWStBe7tZSkc1+6hDpZqH
	jNIQtdiX/l2oVeFEG+w8tNaVOIO86jxOjE7sdgrFAfrcEUV3YQb1e1Hd71yjTPZZZkcZU+xlBqz
	y6S7++/qaLMmSG/7REEA6ExbSYy4xo+ulH01UgbZa8r67U2gCXardSPBGZPmDCYkHKFgNKqd+sH
	t6pxuqPNdThCqrYo3NiwNpazxoLszxSlt5un4mFg3pMIqMtBF3N7brS0/2J5VCTZdjPGGK1sbgC
	TvdYtoJ1DlIcszZFuxRAEqGTBff4dm0rtxoeS2UZmA2UziI5Bc1IoYLX52ohMgQuc6NVaO7nikU
	GfqpSofLgKxryGwE9UjTAu0mL85Acl3TyuwyNVXqwitJ/d+BwJVWvsg==
X-Received: by 2002:a17:90b:4a0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a07308cedamr4172361a91.6.1790183430462;
        Wed, 23 Sep 2026 10:10:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:39e:16e3:44f7 with SMTP id 98e67ed59e1d1-3a07308cedamr4172334a91.6.1790183429947;
        Wed, 23 Sep 2026 10:10:29 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f409f96sm1480850a12.32.2026.09.23.10.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:10:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:10:26 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Radu Rendec <radu@rendec.net>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
Message-ID: <20260923101026.000034ea@oss.qualcomm.com>
In-Reply-To: <20260923165447.619477-1-oss.patchbox@gmail.com>
References: <20260923165447.619477-1-oss.patchbox@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXySoG62+UxK8+
 zhOr0Fum7ig3Hw8gYt+TmnotuwZMnP+HEqJ2pznubHXSpw63TTLC+v3Ub8meaFpfzpS4Q+inqxm
 Yd1CxkNKyxOssUyo7R3OOoby+3WXaAA=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab40807 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=4U-m-mCS_-ka2SPo4XkA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WmIiBB-uShoK3pTgX6WkzVLpuBbOhgFV
X-Proofpoint-ORIG-GUID: WmIiBB-uShoK3pTgX6WkzVLpuBbOhgFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX7Xv2TTVIPrrv
 GMO3+5N1V9eMBTiizZBQFW/BYvPQxUsR5IsZ4mCOEWF7fAcTqiZWRHo1w3phV9kW1hLd1D/I++n
 NkBEx6wlHiRItmd5MJf+AyTCh2Ixwwz0G1Ga7kkDNov8wWZm5DsRSjOJEMF56kCwVOM4VcVLBUg
 WHEcW1oAO21M/k8bd84HShHklweahen0l0aYOA5xQjgDfP2yxNgmRhCF/zuF1QZiJiHON5FQrDw
 gDHRJ79kbPNOLKzZuxseVwCHZitA1VUJycGiLErM42GtKcdlbC5SW+lIaW+t2+vQn6/rWE/GRHn
 /JNSG8Z25qzXjq4tPx+exqDxtH/wPih5jJnMdXMpkwG0y/2mlqz9NitDb8iT/EofvAqAN5SGFj0
 Mul8RHohslJbaz48k42bdgib63NbFNG/XyBwm7aYPnVf/DbeRdPrTbtQqWZl0MAsXG2OOhH37Et
 Z7l+3KLbTCSZ+hpWdwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068

On Wed, 23 Sep 2026 12:54:40 -0400
Yuho Choi <oss.patchbox@gmail.com> wrote:

> its_of_probe() walks the ITS nodes with of_find_matching_node(), which
> drops the reference on the previous node and returns the next one with
> its reference count raised.  The loops are balanced when they run to the
> end, but the three error returns (a failed its_reset_one(), a failed
> its_node_init() and a failed its_probe_one()) leave with the current
> node still referenced.
> 
> Drop it before returning.
> 
> Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
> Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

I only took a very quick look but why can't this use for_each_matching_node()

That doesn't solve your problem but it would be easy to add a for_each_matching_node_scoped()
in similar spirit to for_each_child_of_node_scoped() I think and that would give you a cleaner fix here.

There may well be other places such a macro would benefit. I just haven't looked!

Jonathan


> ---
> Compile-tested only (arm64 defconfig, W=1).
> 
>  drivers/irqchip/irq-gic-v3-its.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index e9807af23537..6361d20bd920 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5579,8 +5579,10 @@ static int __init its_of_probe(struct device_node *node)
>  			continue;
>  
>  		err = its_reset_one(&res);
> -		if (err)
> +		if (err) {
> +			of_node_put(np);
>  			return err;
> +		}
>  	}
>  
>  	for (np = of_find_matching_node(node, its_device_id); np;
> @@ -5602,12 +5604,15 @@ static int __init its_of_probe(struct device_node *node)
>  
>  
>  		its = its_node_init(&res, &np->fwnode, of_node_to_nid(np));
> -		if (!its)
> +		if (!its) {
> +			of_node_put(np);
>  			return -ENOMEM;
> +		}
>  
>  		err = its_probe_one(its);
>  		if (err)  {
>  			its_node_destroy(its);
> +			of_node_put(np);
>  			return err;
>  		}
>  	}
> 
> base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903022;
	b=g9/nkO6qCaHUHTnOmkcIUqdgbn6Ypbym5KViGfzIx0nv0Wf4oP5S4SNilAvZJ7Zoce7Z
	 qTVPNcX12KOGd2TJPYRN2X/HnaP9dtQyKxa0G+Hqz0qOBmdA4hY+gxKNb5/0TaFAmgzRY
	 ykSVPA4ufmxLR5BrF+yziJQbRQnqtQpAtVgwpjmdXmRLTBM3jBC/72X9U0WV+iaL8nCvt
	 rQasUYa7KgkxVA3gFn4YBuLTUFbuz+ShEcydgnmKM6BrUmbID6goyKAcb3Sx42oIQvXnO
	 EXHSI9Qr8QX+5qJOHeERmazobzP7V8v+OuQh0gAI7g+hWkMiWGTUyMzg7gRDAhodzWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
	b=wSxi0o4RlK5vNfWDNEB5HZHDg8c1USi45etTGsgIic9g8/QdGjzCNc+5BFPmhIY2fdAu
	 iNvSLb8nWQcCIL/xkM5wlagmBkhAATvCe602WqEr5if6or2lyznM3N9DAqrCvg8+IY9oh
	 oL4CIgkwbJoqVN3TcT+chkl/qJx8v2JEZoJkCDDg8bF09couwPYOTTxGLQO3GcFc1Hgsp
	 PRxNdlRp91q+1te+TnvzG+M82vK4zeFh7Fh5/rD/GLhOg7+DdYmyk+r+yr1rEmriPHkmc
	 NJujUemabMdRbpvDyNmjshAZgdphr+2Ivdad7dCLVl3P59CkVF2tjAP2sUqRjmW1ZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2TQsKck;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuGfjZBv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB95606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB95606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2TQsKck;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuGfjZBv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53S1d3458474
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ywfuAFd/K5ZUKJsJaSHr6Wq4
	7xa9wttISztoP/unkLc=; b=g2TQsKck7ce39yLpfcRic140Te0EI4E5oDBeqc0o
	Qq6yLaKkluY+RugReFLf/qwujhtvYwHFo+CcSDi/l9lMD5zG/J96rul2KlrwfhFN
	Pyo1CY9CWypdPP6c62Shfre8J4HpG7MuQTr1qliDwQ6XSEKEhiE5902MnFT0dXkj
	e9IcXZ4/i3Z99haFWuCaTPFKXMPnWwo6XfgxKF59sKC6vL5y0ynpwPp6Q6VATdHW
	dKXmctcbZ2WxM3RzZWOPVMtHiU4Pk+lVaBEfv0/9xwdsLd3ypo6GtmJyHA1tiQXT
	5chLK0zBmPV4LSz3SaOJ27EWl2aSGWNs+9DvatbEQ2gXmA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8mwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:10:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so6971042c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903019; x=1795507819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
        b=HuGfjZBvQwN7zBcq7zFNygWl+Q21UtxUWx+XEAnPl36L1EkapFRa326VTS7zZAFoGW
         Z/ZlXdZT+icBO4oE6o/Qavixnv4V5uA465XoEOg/YcqKCLWfL4/iAmANxw8zv05giCSe
         vbsVMaj6mT4ITk1EPnMOU7o9DBUZ9+zbsDo2kMjk4SeoEVEWuXs610RWST+boLEHX89x
         lChN1dCcSvAUDyu0xrihVMZCqLWbvYXNCW44XZJMJHbNzeP2RcUY9BfhrG3jpOlQn3oJ
         oVEo3KRSfADvfdpZ1DTit7xSE3uBqfgYzLGvAC85CoiRNwl42X0u2zeOt6r6y77g7MOf
         xVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903019; x=1795507819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
        b=ZGyIG3t+NJOl/vq9GhMv/8vEuMgFMO7S8WEzQvKGw4pA1aNLZ2foaZEio7ecK5QC1p
         RgLWgjfUgsbn8MT5dioEtMjzrmX+WzdU4INdb1wC+rTQmHUfPFfyTsjupc2nYREx+365
         f75JXZ2twNtjeHExcBDti/CQoWr2SA8s6U7WwJX8QkkeJ/n2K7T13IrI4so9q361Jfwx
         YLfsFf+raignNuM28dzARaxIzEJYd9xMuseGNN0Y6lJ7YBEvSdz7mU+Q8u7g8jDTsGyZ
         mRNbcXeYJZqaZM8C1SwIRmd8vtDPHu+igA5umTTCqhCf4zR5LZHv8eNRjpCiaHrs1tDB
         Ny/g==
X-Forwarded-Encrypted: i=1; AL+hErGVRo5bFWMPPNOda+LnTCjbGLSqR0t64BQnpxEukKQFLV8o0l3i3vE4XRHu4e7AtlTdvDwIw5BU+2YCkL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z82rTy4ZCCjhSayzMRrzpJA3gythAHHR3pr/LDkmunpWsqZ8I/Z
	aVf87ni5rI7eww/MnYMWaXuC5zIkZZ7y4GiKP6YSYr9DcTsd1gSrTJXgOQhFxdwaEFzfvXmikXo
	4CBg59wkB2IeMOhbshlQIVOxCUpAblNv3FIZIiTSvYznpxcHPyPW9gGXmcqImYA/vMmM=
X-Gm-Gg: AYBFou1YHknerm1Dbd1P1y1wAw8cuT0TT2R5Fa/gxhVZvJ8x+tnGNee5eEa0Wn4Cn5N
	mMs7VuyVFW7kJ6Ee996Az2PX8Br4ibNFGPQF2f3Y+HsXBGltDoX9fHbdkpLI2seOdZLSgxkE2HC
	VzrULDcRSNxHyLdjCjBjWqeTdJccudMGN8fDe0doBgpnsQvuG3IaUwFbcWKFkPbIvy9OhLmEIDo
	LgRC1/Rn5AbbIs6gOaCn5yBJAJjgCNSywbKV5g2XAEzZvrEBiP9QaPquYLRXfkfEEEG0u+Js4gI
	RYIYXEcxc6QG/px14uPeOKEu3AX8Q1IXtAzaJbQd/w01IcfujcU0mUFEA06ym6agyN3DdSkfNhi
	BRYUU+mIArIr5fBdXdBSdFZAVtJII5jL5CTdYxPtSnDcKBaTyudqmt6NXh14gIsPJ/aD3rAYMyg
	kW
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr9827924c88.18.1794903019160;
        Tue, 17 Nov 2026 00:10:19 -0800 (PST)
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr9827891c88.18.1794903018317;
        Tue, 17 Nov 2026 00:10:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm42451898c88.14.2026.11.17.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:10:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:40:11 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Message-ID: <20261117081011.jcuxog7ixwbfbyce@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nWyOdCIxcj69xnxGt622_MhO-nbF54zq
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc0bec cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VTWUisejw7g24Mmt_jYA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: nWyOdCIxcj69xnxGt622_MhO-nbF54zq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX1dYJSckXJrP4
 uK9HkQA3h+I2B2GVwHqhoz0RYlrQMcoxMSRMpQ+75nnac7li5WAn67yIw805wJBrfe5xN3ZlEZN
 cBRCuqjT3i+w/4sIahSWF+LeBjuEf9s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX7vWVyGMclrTP
 k1dNscPkyW9ozrIWQ57EkJydeLBQ3WWLPQDYqBCd+mvEl8M6BGG6Jy5gtjasVXDvMUqhIB2nTQG
 4K9+/3S6BQs7s67eDhtkin3wKKc6J7zEJYMqNU6o1aierdWmTd3F4aD5GnMS9XZhbs2XFgrTfCx
 OCOFY4KCrXaJm3/WtXQJ4wEX1KVUbjgil6geTlA3aAa0UWhdS9Ie9bnmjQF4/Yk6PPCMVMKK/hB
 j06QNo1rxnwIJA7xiUP5kav82ndFmMkancxB5xmB2Xr2WRhz/9wIT/ap9AAjaDzDDRT0dM2v2XB
 iEJK6Un8yB5r4f665GCFSNK+v6wL0d95Tr+hEPXNtvtS1C2Jchq60GivEsgzm/Bl4hRz9gu3HxZ
 WBd0dyZWKJdM3kuWqBzeW682p4NNz+/EsbOU7cta9JW5J+yAjDu9G5I8+4hw+1djsQagL1Z+4PP
 fonMZriCmoCM7C1m0+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170032

On Thu, Oct 15, 2026 at 11:25:51AM +0530, Anvesh Jain P wrote:
> Add coredump support for PAS remoteproc instances with a secondary
> processor by registering fixed dump segments for both primary and
> secondary carveouts at probe time and mapping them during collection.
> The attached-state path is for debug dump collection and does not
> provide operational device recovery.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++++++----
>  1 file changed, 91 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 0bce2f0d5b4a..374cafd04b62 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -117,6 +117,7 @@ struct qcom_pas {
>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>  
>  	void __iomem *mem_region;
> +	void __iomem *secondary_mem_region;
>  
>  	size_t mem_size;
>  	size_t dtb_mem_size;
> @@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
>  }
>  
> +static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
> +{
> +	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
> +}
> +
> +static int qcom_pas_register_dump_segments(struct rproc *rproc,
> +					   struct qcom_pas *pas)
> +{
> +	int ret;
> +
> +	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
> +	if (ret)
> +		return ret;

Why qcom_register_dump_segments() already does this ? why need to
add entire region ? please modify qcom_register_dump_segments()
according to your need.

> +
> +	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
> +					 pas->secondary_mem_size);
> +	if (ret)
> +		rproc_coredump_cleanup(rproc);
> +
> +	return ret;
> +}
> +
>  static void qcom_pas_minidump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -577,16 +600,38 @@ static int qcom_pas_stop(struct rproc *rproc)
>  static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> -	int offset;
> +	phys_addr_t base;
> +	void __iomem *region;
> +
> +	if (da >= pas->mem_reloc && len <= pas->mem_size &&
> +	    da - pas->mem_reloc <= pas->mem_size - len) {
> +		base = pas->mem_reloc;
> +		region = pas->mem_region;
> +	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
> +		   da - pas->mem_phys <= pas->mem_size - len) {
> +		base = pas->mem_phys;
> +		region = pas->mem_region;
> +	} else if (da >= pas->secondary_mem_reloc &&
> +		   len <= pas->secondary_mem_size &&
> +		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
> +		base = pas->secondary_mem_reloc;
> +		region = pas->secondary_mem_region;
> +	} else if (da >= pas->secondary_mem_phys &&
> +		   len <= pas->secondary_mem_size &&
> +		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
> +		base = pas->secondary_mem_phys;
> +		region = pas->secondary_mem_region;
> +	} else {
> +		return NULL;
> +	}
>  
> -	offset = da - pas->mem_reloc;
> -	if (offset < 0 || offset + len > pas->mem_size)
> +	if (!region)
>  		return NULL;
>  
>  	if (is_iomem)
>  		*is_iomem = true;
>  
> -	return (__force void *)pas->mem_region + offset;
> +	return (__force void *)region + (da - base);
>  }
>  
>  static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> @@ -598,10 +643,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  	size_t table_sz;
>  	int ret;
>  
> -	ret = qcom_register_dump_segments(rproc, fw);
> -	if (ret) {
> -		dev_err(pas->dev, "Error in registering dump segments\n");
> -		return ret;
> +	if (qcom_pas_has_secondary(pas)) {
> +		if (list_empty(&rproc->dump_segments)) {
> +			ret = qcom_pas_register_dump_segments(rproc, pas);
> +			if (ret) {
> +				dev_err(pas->dev,
> +					"failed to register dump segments: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +	} else {
> +		ret = qcom_register_dump_segments(rproc, fw);
> +		if (ret) {
> +			dev_err(pas->dev, "Error in registering dump segments\n");
> +			return ret;
> +		}
>  	}
>  
>  	if (!rproc->has_iommu)
> @@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
>  
> -	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
> +	if (!pas->mem_region)
> +		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>  	if (!pas->mem_region)
>  		return;
>  
> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
> +		pas->secondary_mem_region =
> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
> +		if (!pas->secondary_mem_region) {
> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
> +			return;
> +		}
> +	}
> +
>  	rproc_coredump(rproc);
> -	iounmap(pas->mem_region);

There was a region it was unmapped once done to avoid speculative fetch access.. we can't keep
it mapped all the time..


> -	pas->mem_region = NULL;
>  }
>  
>  static const struct rproc_ops qcom_pas_ops = {
> @@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	if (desc->early_boot)
>  		pas->rproc->state = RPROC_DETACHED;
>  
> +	if (qcom_pas_has_secondary(pas)) {
> +		ret = qcom_pas_register_dump_segments(rproc, pas);
> +		if (ret)
> +			goto remove_ssr_sysmon;
> +	}

For early boot, we don't even have support for the primary image
itself for the first crash as we did not load for its first boot
up. So, this is new and you don't have check why do we need it in
probe whether it is early booted subsystem or loaded by linux
Also, not sure if it is right to dump entire memory region.

> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> @@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	return 0;
>  
>  remove_ssr_sysmon:
> +	rproc_coredump_cleanup(rproc);
>  	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
>  	qcom_remove_sysmon_subdev(pas->sysmon);
>  deinit_remove_pdm_smd_glink:
> @@ -1169,6 +1240,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
>  		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
>  
>  	rproc_del(pas->rproc);
> +	rproc_coredump_cleanup(pas->rproc);
> +	if (pas->secondary_mem_region) {
> +		iounmap(pas->secondary_mem_region);
> +		pas->secondary_mem_region = NULL;
> +	}
> +	if (pas->mem_region) {
> +		iounmap(pas->mem_region);
> +		pas->mem_region = NULL;
> +	}
>  
>  	qcom_q6v5_deinit(&pas->q6v5);
>  	qcom_pas_unassign_memory_region(pas);
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

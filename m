Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB41F91F6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790209446; cv=none; b=oI7fHdfuf21Ri5wDNeGjSGEn1F7Weqhx3uM1GiktS1A+7egnyMluEIfTqRcBc5KjcmLQmSEyC3chbif5ZD+3NSc0YeOErTJ/9V1z0rxghRnajOHjV6rJj9sYjMPX3ZpPnxdY15Lr+y/iWTxpxrlGE/CsVc/vW26S4XzxAOcuYdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790209446; c=relaxed/simple;
	bh=dA5b9DgYqnKWZ96+NEGT2QcXL7eGGlV2tk+dlL0pSEo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kk+XOHEDEXBSvaknAK7yPUt9hmnSHHSxI5pJNnMAfHzP2QEbAYbk2Qgj0GiLq7zsE0HSTGx0JcBIrZZbdg0GwavROaoZzu/KrtT/wd+07vW6YBTxh7eGj9McD+xgDsHKWdcgCc9pqPDiojAQGn9gc6as3QKFTdmdyxZJq2oT1Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Df99SyPS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOC5g5KF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Df99SyPS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOC5g5KF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNEs8s4146082
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Tyzp3TUUJMkAC7YdMETGjFKVgB/863uq4a1hsZpUdw=; b=Df99SyPSXek8jGFW
	igSmiCG7+zuNtYLuFmoYMI/kJB/nyDnNpyPo2QoseN/bnZ3E4g20S8xdJYzF8bF/
	KaP8Af7K0f03iHjomwU9uhPkHmkDBlaN1aVoVzVk2yxbMDdNWc49lDqUmcBI1Aki
	5WM77mEfolaa3fQ7EPquKEghn9DqGBfx7qdpl01CX3fr8It5UQ6Ta+Y4fXOy6NYQ
	hejVBhXTXylq7Np30yFRgZhd6wFi7N2Hz/Usz+MAbcf9V9vMcFdr4dmJ1ER0K0JD
	rGYZGqJFx7aHtkrSUaYG+UguK8607TdtI08sypO5MGDi9/qUlJnvAPWDydjdrJ3m
	Upqgcg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr9085uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:24:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143580417b3so5395657c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790209444; x=1790814244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/Tyzp3TUUJMkAC7YdMETGjFKVgB/863uq4a1hsZpUdw=;
        b=AOC5g5KFSTPBzvRSTxVfWUMkHsSkf+YfeFXsBKV0byp6eioTufrwpT8A1pUqaFqi/A
         i5jPb+YMjMeUxFSl4MU1yzNbyR1vmfeOVnPGObegetuwI5I0Ph/J1z/ypQDvM8qZk+PL
         q7Q6MMb6LCKIpABFTtFXTKffOBdqSVTS7UgPV+LFbOzGSWOYwI7TkGdAP1UmXx6kcgmd
         dRKGiiGWJp+AMe0+dQDjW4EuTFenLdLoIS0JrDD7JR+9c8/DAFBQcT2SMytFmQ6BwYdp
         G1RkBrOjd4opRLHWrLHXCew3bkrb2cW7pSBX+rwjJYloHzwljCz7fiWVIEsPLSInTMnd
         4FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790209444; x=1790814244;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Tyzp3TUUJMkAC7YdMETGjFKVgB/863uq4a1hsZpUdw=;
        b=ISI8CP9DryDjQGuM09rVWhEuyYpwttFofTfUmY7WX8A41EqtgSLdAZjbnU17PNRnNj
         Ieti/smC81Qjc4bISA8CNKaR1TGzt+vOXV7bYFVDCo4MlTXpfn9I+qeFLrH45n23SpNx
         PVk4M1FDt49EA/zE7xoUUGxenS3ZoHep73Fj9LAYdAkQGsGOdXXRv17OvHhgeimVUXXA
         HvWVqY/RX24VFeW52ci6N3/M4sdPByVoGFeywR36siO3ysl+6tFcUPMh6MklO41A0Ted
         HIdiiLPUcoWge710AO2514eIt/J+4sYXUiV3UBfbvKIYHOTdXSi0r2bva6PsdtNPn2u4
         5BqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGCbHR/3nTNQagJ8n1YgN8kuuShO3Xfd3UMBVy+Y299b9ESB8oiSPlmvxV7d8R6ubZA41jHok+5PrM7BI=@vger.kernel.org
X-Gm-Message-State: AFuF++kWque9eFJIa0HSYtlJGYxnSq3ffLS+ZMjQYhRWavsiTTHPu9sh
	of+5NHSceclG9S6MMYPYGLbKzmcRl9nJdqtcPeRYFuUNdIsdIh4FPyOTgTvjS9C3vojbOrLF8fh
	m+9kyc3mP4vsCZLW0RVJ3zZJlCa6h/6mMi1bwpYNTsvOYOf1GO6gIS8YM2c3iG9sR/lE=
X-Gm-Gg: AYBFou39/csdEXy6qNgSqzNs08wXahlI610vH9gFa1dkHL8kl3PbgbzcadcIB0drrot
	+6MSuZNLxs795dLFB1WBLeUi2Ms2f7R+xaZexaesWTMdvgYGSsn9g0R++4wf/RGa8RgTNYo1c8L
	LFv5if7DZotx5J1wZ42Md7/X6fE70Ct1blIjX5kwfwqSo18uH2hSuD3oOArfCLF3EkEzPYCYpWb
	8hcAS3ima7BO5jYm53UOJNj77jrPAuWPrPAjsujfhhKbWKZhuKjHCM++O79PnfyqBUh4zg0OdTy
	JSyFm1FON5jRvqHAgDe6BgZqN1OqrUzFWtchPvTWg9afMkKhjqUhmBywaoAesXCcEwWiTtz1U9+
	SfbTqh4Qc0pQmXplTaEBerw5VyA7RvwCjJDKcbhzWsD3QSi6gEjtr9w==
X-Received: by 2002:a05:7022:5f04:b0:141:4a06:ad6f with SMTP id a92af1059eb24-14503f2ecd6mr574227c88.8.1790209443473;
        Wed, 23 Sep 2026 17:24:03 -0700 (PDT)
X-Received: by 2002:a05:7022:5f04:b0:141:4a06:ad6f with SMTP id a92af1059eb24-14503f2ecd6mr574212c88.8.1790209442885;
        Wed, 23 Sep 2026 17:24:02 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f988342asm8223708c88.11.2026.09.23.17.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:24:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:23:59 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Marek Vasut
 <marek.vasut+renesas@mailbox.org>,
        Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus
 Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will
 Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2] PCI: rcar-gen4: Fix device_node leak in
 rcar_gen4_pcie_host_msi_addr()
Message-ID: <20260923172359.00007ff3@oss.qualcomm.com>
In-Reply-To: <20260923180749.3906547-1-fuad.tabba@linux.dev>
References: <20260923180749.3906547-1-fuad.tabba@linux.dev>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAwMyBTYWx0ZWRfX8KLhKBMKfjsi
 7Xtc37kjhzl0zBHxUom3a/dA+0G+5h1OnhfXy/QPZwnalkcMzTl2Uc9dkvyTI9cFYnasjaI5lXU
 2D5e4rIokCmFc75FZKJcb5Hlm8Ev8Mg=
X-Proofpoint-GUID: DBX8V5QpS5pNB7-WXkmFg_p7m9T5t1hb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAwMyBTYWx0ZWRfXzAGfPR/wSY3/
 nAubSnsL0IoTvD+FlzBA9r4WMoc2zMQwcqM7I8yZL0i6htur5y52NM9rskgaJ/vlWJLoNL0Sfl3
 TEf7a2L0uVOip8FmYQP/iiuVjXHFmTsHzJ+vmvDe4JyeMXfVw88eIaD8jkGJdPYwoskONESCfEm
 ESdJXcpKEeBPwBG3I0rHicjVtYoWVIIdw2mxLkOkmjFh2Hg+XkxNKLQHvZxhGr5hLSqDq8xQFgS
 kq4rE4YLMhThIumbb5Q2Yd06YAMtUGkih/gQYa+2dCc+8YXIQqWPjVASDIIr9V7KmG6KyIpe3iO
 XYQ1X6Y+EDOTuYwE34Cx3dbZKsz+t1m3Z8J5zGz2fH6xqYsAxibvSlO0ddkzAEElGjiWe5GezJo
 kokuqNP4yS0iWq5l9vO7haTlfKjr+y0WTVnU9vGRZGdAlJdA6yFqT8tAL62JQpJyGlfrEQVtVdY
 0HzgfGCfDivfr9dmqDQ==
X-Proofpoint-ORIG-GUID: DBX8V5QpS5pNB7-WXkmFg_p7m9T5t1hb
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab46da4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=b3CbU_ItAAAA:8 a=hvwKxTCdC-HljeZmoW0A:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_08,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240003

On Wed, 23 Sep 2026 19:07:49 +0100
Fuad Tabba <fuad.tabba@linux.dev> wrote:

> rcar_gen4_pcie_host_msi_addr() calls of_msi_xlate() with *msi_np NULL,
> so it receives the MSI controller node with a reference held, and every
> return past the NULL check leaks that reference, the success path
> included. Declare msi_node with __free(device_node) so it's put on
> every return.
> 
> Fixes: 8d6af27c0a73 ("PCI: rcar-gen4: Configure AXIINTC if iMSI-RX is not used")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-pci/20260905213855.8D6671F00A3D@smtp.kernel.org/
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # Retronix R-Car V4H Sparrow Hawk
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
> 
> Notes:
>     Changes since v1:
>     - Declare msi_node immediately before of_msi_xlate() rather than at the
>       top of the function, as Jonathan asked on the iproc conversion [1].
>     - Kept Marek's Tested-by and Reviewed-by, since the generated code
>       differs only in the stack offsets of msi_node and res.
>     
>     [1] https://lore.kernel.org/all/20260923093433.00006cab@oss.qualcomm.com/
> 
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index fbe465a29068f..bb2fcfd6861ac 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -323,7 +323,6 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>  static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
>  {
>  	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> -	struct device_node *msi_node = NULL;
>  	struct device *dev = dw->dev;
>  	struct resource res;
>  	u64 addr;
> @@ -333,6 +332,7 @@ static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
>  	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
>  	 * to obtain the MSI node.
>  	 */
> +	struct device_node *msi_node __free(device_node) = NULL;
>  	of_msi_xlate(dev, &msi_node, 0);
>  	if (!msi_node)
>  		return -ENODEV;
> 
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780


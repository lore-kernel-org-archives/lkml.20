Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E534388D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160929; cv=none; b=LYeG7mig7WtcwaqpDnMCsL6FRAKlwAcM5kr4CCeUwatBi46+3v4x29cNcgp0M9EJBaQMkUdsQHXqLMwAiheqycCm8alFH2TO2RDx/xtkOwdk6xZ/6pbUTMfSRmwu03sfJVXc1MZnhybgZeLR69hCDgmlnciQkOfpZ9PBuxsPbg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160929; c=relaxed/simple;
	bh=wEWwyMc0T7Glz7xaHz5ir1knPQzXPDlng/UZQJWPPnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4inj6tMa13n3v0tHtUXZMqfeaesvrmQ/ITqAIF4STaX8TuGkPaZ8cKY4/A8KIFuR6bfm7TTDkZ/6xVC8HIhVO1xpJMDD/RrEZW9nup8OEYeLIlkslJ+xNXxvjEMLe8FmJbq0yDbja0sOcnfUDGzsuH5rYfbldWeXYfyYPsStD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/LBB79F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBKs2Ba2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/LBB79F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBKs2Ba2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6Qmt2494932
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0rmY6+I62XSWrX3zVFz46D1qgMcH3MIWCV0yy9Nt3U=; b=T/LBB79Fy33pT89n
	nV+TvA4KZMAJH/UJ5rahkinEew1pMHvSgTQMiy3XD88S11kOSQIQAmv6WdwBTO+n
	xoIIdWx/Pj4HZyG8V8z7ouuXY7rQM8N1TODaeBB/v+5QQkxFQiwbZhewi5kbCJZn
	UbP6b9eEyWsLlSGrp7g47WZQMGcT16JSyryudBhjUPSa3mNcMCICbzCM22hkCuVu
	qURtbLzYpc4QmvLFg7Mo9iZIpGkQizwMmFrksQnjccVAzAq0n9YljIZd/MbF1yww
	xu+WRJS1gN6+nfNNw8AU8DnCsitN3AAIr6hTvEJq4YI6FamDdrJcZfnKl+lAZ0By
	a9v2uA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8b1qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:28:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso17680411cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160927; x=1792765727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0rmY6+I62XSWrX3zVFz46D1qgMcH3MIWCV0yy9Nt3U=;
        b=aBKs2Ba22iz6B7ZkF6XcPT//dC441WYajOKCISDoDOYP8+T0hEbNnqdps+MUejo5tX
         BIpaIoQQKCNGxtAfCQYmxdIena34XSzYFOzauR72y6CdCTj6wSXPjpPGgURyu8BG2JB5
         /VoaAUG5ibkhJ8IcBJfT+PEiVuJijTs+TG/FmAmLRZUKmxxcTGv2u2SVqklQkmjHZbTS
         Qgb6wv+FvNKQTEg6gaxFXHZZwOzvAx6vpV13UeC9080cLFEJgXMwtg5MjiosxfCPoCoE
         WEVdaNTzCQgp6vz7i+MvStPKMLn0mqhMFxgO3KVprTopk/1nCtSAbUIB0f64NAtpat1B
         mibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160927; x=1792765727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0rmY6+I62XSWrX3zVFz46D1qgMcH3MIWCV0yy9Nt3U=;
        b=QAkJJfHPEjDzrvyMr4z2QZ0dg2nJd8b1lq0oD24ZodwHCRtKVVV2f/Z6Wup0j7MKxr
         LQIKpSvQAEuVZyP5N74GPR1b+lz3/5ONzlsdiiFQ0GuSJmkar7I2Bc9AgNQhSOPeop6Q
         6okXdIreZXOL53W+QJMJJzQlb+LbksyBdYzPRMrdbBKZmBd6slk7fMIVpFCASZ/0nzRp
         QQRrRnOFyHUGalkVSsgauFPZxU4cnNioBremmcMizL1Vs3az+QpoS8b5fXdIqLY01yDS
         6jiUZCdDeamUgcILdMkGIEjNYDnN78T2PxM9Ztf9YFPVsE6Pn97x7+ZddeITyZ3QmmG+
         tcWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK+kSZ6g2Oh8EYFtPKGnt6i5Lxm3eAxHyba80jP9e+/X2UJCFvQOTZmO87NM16Y/GZ5VDf1UjIhyoSURk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6VZLi710pT76Ifq7SRQUE87aJAz0jTiJY3HAko4GJeNY9p7g2
	xeXjBw2WCdNRfTuTaiItwVRlOAd333tp5BnMOfPkAHneNBr5qwbM5ob3NRvXFR7oX1lOcObs5RP
	ViHKPJhkZPHv4qc/2ZQ16u6j5B6uBYLQLne8izbZ9p6JOpIrb47QECvPh4HrfBCNn9JM=
X-Gm-Gg: AYBFou1DF9SuGGuC3YWDRsndgsRZO0xJTGrdu0itvg3yzjywlYxu6net9AKePZ4nHmo
	JvWurGaq9z4W/r2HBlObEgEZNvU0IpCg5SyXKcNShuGUcPhmy8d707ChvOoVxPnzejGRAFpK6pj
	YyOktP/tbwkuJqySe9ucO/f+E4kPGsI7yk1n6fBqOZnURa9eE589GwPDn9E/ociT5inqkEQmd2k
	cNIui2ZY48kbJ/pe0u+xElyn34I8Zz26BFT4+hin/8YekAxqshMo9Oxx6KiRRpwaTqG1z0lpJ0v
	blsYjdhvCptDfXeLP7pFIlXZLi5frVda2BwmFuIMRmHRdRYDqlTNzVtJYGcnPI+H6P+fmwf75XQ
	pFD6B+jEdhOF9RYY/QHoV5A==
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr3003885a.2.1792160926667;
        Fri, 16 Oct 2026 07:28:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr2989385a.2.1792160925614;
        Fri, 16 Oct 2026 07:28:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16e44f43sm5140781fa.8.2026.10.16.07.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:28:44 -0700 (PDT)
Message-ID: <8b657e3e-d38c-4cd5-8b21-254211a24869@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for audio
 PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfX9MivLqtWhEmN
 wBGY3W3sLeYw6BA7DN/GQx28uSMdhkIMxxA+trtp4ThFZw0v2HcTA9L6duzujAfy4Uq9kOMxTpv
 ytuJ5F6QLoNERVms3cE/tLtTG+hwHIY=
X-Proofpoint-ORIG-GUID: rBM-yc2wcWQrXe7v-ktGgP1j1ptjuCiq
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad2349f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mwt7irkxnfVBBxs0BpcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfXzhHoxX/VAOkQ
 sXpqeCP/pjU2Zp3BbG4esdfI51bU0bFyBuYNWk2MHoY3HVzRUh1RVzlDmYMf2ElpIEm9OK8Kjp1
 VZ9VbZu1u/xh0agFgqzp1KFnOn6eBJDkzAz2L7W9eKxFkKASuOzCyL78O9nnTTp4hgrWt51/cEA
 zlFkX1OGavqthG20kkjJg7LvlSkfCkRstj/kqtxruGMFXCMCX9XLQGkEPRFQPZAf2xxv+XL6Tbt
 MYoAF3dnnG3GiWDC+vOMcQszgUbwhi7TAdrdfLo243pLZQf6Lsxk8r9grs9vtC0wY23RtJofL55
 aj3zlS5GClaffwpmOQ4twmK6HLyZ8s0aB3+7/bPW0TlJB1ptOUeqHPZ3T+SrIxun2vpzIChZ9eT
 rwPfNhXDiRCpzoKcP20ykSS+neb8mahSe1ASy/rCm0dJqptQpwuwyvdLv4M/ZM6uayC5j72MZq+
 fLir0lrAY6n7xUoZOcA==
X-Proofpoint-GUID: rBM-yc2wcWQrXe7v-ktGgP1j1ptjuCiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160057

On 9/22/26 9:27 AM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 131fd2a16c54..f79f7679de02 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x0 0x1 0x0>;
> +			reusable;

-> no-map

Konrad

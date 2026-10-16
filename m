Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F1471D1E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144998; cv=none; b=nDqYxHCovLIZBAeDPdLNV6O2NsogiXE1lYXY+BYwAnIsc4eHDREB+mfSE7M+opguqnPWvBx25L8C1AfpMXW0kQTmMFZ58pnWwJzWHsVCgsuuH0Y4wOaGVpUbQG7YrDLp9LIqiW8LgH+dXFMdHo9Pu1VDhQplwqCmNm/0E+mmsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144998; c=relaxed/simple;
	bh=P7x50y2utm76U0n+hMlHkQ5LOab9FHOLiRJBxiQp1MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSrrcuTGNTHVl6su7I6FCeqEBf2fdKIU0M2PWrx2bRYsaQCjkfGu39HbyW6RidCR/zsgnNqfMJo2NN+zymNjia4/aohI1wXEGAdE14H6PgUIvDipQwV1XDU960Lj004tCPfneYK44rfSAwxiGWarYggUbLt3j2jUaS3ca7zKrWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oALA3otZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFlnW8yD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oALA3otZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFlnW8yD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lWkc2885550
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFbHLAE9BiJ1N0vyGL3ie1gpBbVjTxSTc+KSkAOv1XM=; b=oALA3otZmDAlZdx4
	8iiKqi2IGmCVYLfr8WUIKUQhfvfm/S62TJlLEvGuMQY56ktIXK3X59POI3RyHroN
	6mha4cdVlbf2tIWM1FoxKSPcXMuuiPDMRDmUgz5FUQRjqJ5YKxN47WQ8ERJD9Cl8
	QMAlyfiKlvlDC2JvNbi35AXI8GwIPnyHIf65bDoVpRAFl+/dr5TlPdPApiqJlCep
	iEbJ1+GY7T9SuZpV+giKV7fkJ5V9tb+g1uKg9dx9cw4EPdcEqaIQDHPNz7aVChKh
	oFuB7M/Fa55EKDudMwhL1BBYQVFPsD8yU60K71kguD3A+jZOGWVjQm4j5Ik/mMBm
	5wuthw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261sad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:03:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-17188d538c7so11455368c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144994; x=1792749794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFbHLAE9BiJ1N0vyGL3ie1gpBbVjTxSTc+KSkAOv1XM=;
        b=QFlnW8yDIfe/OGuRWxk9cYI2aN7Z+hOwizTRz2DQohOPF9L0122n1gwzZIeqFThfUE
         JyHFXj16dTi5xxCDY4DDwqbggkNd8M2Q5o2XK97V+Dm8G2nO8pxkCBhUtGschA6XYaoI
         l7yeJx86fCiBnVCpwq9tw8YHFSylFO/B1rKxvtWQJ4z3G70lBTPCQNQL1hk0n3KCfdac
         p5mcIbzTGLkhsDzB87LP5jPkV4nLqXjPPT6EZjUIrGJM1795mFhmalc9qQHQ51an0BEY
         dI91Ut/HkisjCMPJlOREmjnw67y18YdF2m3wwtG82IKoUdWo5JLll82x+HOrfX/4Wm0W
         23Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144994; x=1792749794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFbHLAE9BiJ1N0vyGL3ie1gpBbVjTxSTc+KSkAOv1XM=;
        b=pNL0V8Rp0BpNNvPNGEI0XIIC7kanMzKRt1LbVjO5SiovtWvNSlETobYkRGs+50TdqC
         oyiNunlJ/NR8hkQNtJgtv8tH/GW9WIwtnJcW8GmOAysEj4SVXA941F5bauv1qmq5P1XY
         P7C8zcHYEyTvrdkpVuXSXaEJzT9VJ4QEgiXA/EGAHKG5KeH2c4a0OC0lMTZ1cVPSs/KH
         HgCuIn+yIRzd+S8liFMRH2HN23TLlFL9/iPVBRXov1je9guaQTYhe/iE9ce5jBrP64d0
         WPK6iskbLIYLDeMV+lCmmzG/FBvOSCH25u2IFL5cVpe96PxXgY8N0wNUSnfP49/PFgt0
         GcEw==
X-Forwarded-Encrypted: i=1; AKwUvByTB65hWziiIOjp4q/hMYd36/E/+OGkTb+JbcxFWbTAHJt2MS0bjBvhpCiLFsU6RNbcE7ysV2M620HJx9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvQFN0LELDqF+jaUkk4j2JJN5VybqnZQyTmALF9/7ZLp8uHGf6
	sQUL6uREG+V1YCbN3ihd0Enkqj72GwMRaHmFsrPdH3PMX2mSE0ipyMifrvDXe2OjB42QeVtzUIq
	h5SwNWa09Lz+Bam8pn+f1z7fpnjPBPoIGpVEm9CIs77Ia9+cKrT47GrHT1GPPBXnf6fo=
X-Gm-Gg: AYBFou29V2Fcwb2lmvSjbDPrf6sJ6u2TVQ+TAAlj3NsjjOdcHcb5yMbfaWKsDYxt1cP
	DZI3NIgSrO2qBS06J/eWNd2cOP0MW2sFnnOik+hMo9LpKE/6stwBF6A2FzMBV+xzEoBsW8sc3Ok
	hts+xxFAlwDbGOs15LavfU/BtemVsdEgwTOvNwFHQlkKDdoVCbLYYtO8jX2cI9UQNwX/rF2lXn4
	xFrSl8neSWKxp6f+3NrbXSsxU9heqXzPPnomoDxYkkUqSv9FfaCrA9Jqm47IQ3JI/IR453Ku5ui
	6kdDGYDXpLD/VHoWJQouKyLCVy2CTID3Dti3FTGdM20FB1HnxKxpGpd5f8ZTY66/01VXuEGIGJa
	akviqnca9rhExafVTG0Z46WYBxq8e
X-Received: by 2002:a05:701b:451c:20b0:14a:5d07:9b with SMTP id a92af1059eb24-16a5ea5d851mr27453572c88.28.1792144993585;
        Fri, 16 Oct 2026 03:03:13 -0700 (PDT)
X-Received: by 2002:a05:701b:451c:20b0:14a:5d07:9b with SMTP id a92af1059eb24-16a5ea5d851mr27453539c88.28.1792144992946;
        Fri, 16 Oct 2026 03:03:12 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm6054155c88.6.2026.10.16.03.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:03:12 -0700 (PDT)
Message-ID: <9043efbb-7883-43cd-a09e-28fc5304457b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1f662 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vC5WxkcjHSV_sht6c60A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX5gN1CVoicPT7
 JpTgFemueTYwjkyChHAskn1J2bgKPn8bfSM7vwLE1hjo2fMg032/I02L985wR7pS+uHJDYKsRvq
 rkZZu0bB5CWOl81wtWAVzl8nGqfy+CGrceslQCseGcLKlkjYBYtcfPFmZ3VkGgZF9gsjZ3HxEK0
 MzK01H/Ol/o8bV6rJj0EngpyyXgJo5xGJ/esv0fcJWs2JNTFyOehq1/A90o17CKCOleEpKna+wH
 j4RcqfbFmtm3G/RB3HEGm+8NjMiw3qWgTon1Eej2Mir5dchAR4JT7NOud+84pjPsZIt1+dP7Kxl
 JwV+oTUZE8J+k7+mGBaydZMuQmE50Ujsk9NOfBOFSIT7Z2VJ6ApY4E5rygoooflAZk4mak0FgU3
 VHSUegTKG+6e9Jjn3VcPuYq5n2ph0Je+IWcuzKPlLBt2u1cIuyMIhUqTaX3aute4OrZk76jK567
 S/IJ2vVRu8MnSuvHSzA==
X-Proofpoint-ORIG-GUID: oq1AgD2GaL1c_mrP-QjtlVHuchF-rXsB
X-Proofpoint-GUID: oq1AgD2GaL1c_mrP-QjtlVHuchF-rXsB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX+cq7WXiVa7LI
 34jhVRwy9I0beiov26kGrF35mOuFrzbtgCZj84gYpQ8hwHkOfstGjZ7i3wmnJZ1Nvj5gNYxEKbm
 TkTvG5/bUSY2opdwBth4oCBvQGIh1TY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 16-10-2026 10:50, Abhinav Parihar wrote:
> Context bank 9 is reserved for secure use cases and must not be exposed
> as a FastRPC compute context bank for non-secure offloading.
>  
> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
can you add Fixes: tag as well?> Signed-off-by: Abhinav Parihar
<abhinav.parihar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 16 ----------------
>  arch/arm64/boot/dts/qcom/monaco.dtsi |  7 -------
separate the patch both different platforms, also please include other
applicable platforms in your next spin>  2 files changed, 23 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 695eae1b7256..5481dfb73454 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -7861,14 +7861,6 @@ compute-cb@8 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&apps_smmu 0x2149 0x04a0>,
> -							 <&apps_smmu 0x2189 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@11 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <11>;
> @@ -8000,14 +7992,6 @@ compute-cb@8 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&apps_smmu 0x2949 0x04a0>,
> -							 <&apps_smmu 0x2989 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@10 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <10>;
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index cfe39f923224..e73a735f2f13 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -7822,13 +7822,6 @@ compute-cb@8 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@9 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <9>;
> -						iommus = <&apps_smmu 0x19c9 0x0400>;
> -						dma-coherent;
> -					};
> -
>  					compute-cb@11 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <0xb>;


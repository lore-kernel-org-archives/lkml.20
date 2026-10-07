Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5039AD3B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370850; cv=none; b=Y93GtqZa8EbD/4L4MZ66s8i4YkobvtCu4tVNYUpdvup4fJoE6CJwhtZXy3bqYcc+EA+o+qMrbRmC2eJ+nWxq0MrcAIVJ9Yjon6g2x/5IW2vMjZMJIsFJlFpF9NNRXxV/mDvphXWFLa4q04oyA7yvxI6ykoZqT06QoUOsM8rGB5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370850; c=relaxed/simple;
	bh=VU/dQ6PyuT7ZXeA2t3pyo87RFBXHOriX+IpfI3AmWwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjitwFrOgASqKaIF3hF0erC0huEs7Rl5LoVxJDeWcPbNd9l9dTVyzhc9AupxQkZZJ9pidaWazQ9ekpGy9Z1OgSRfURrcRpXy5qKguqnMg7unSTWKpU2eMf7lN+3Nbi8FBSDeRIL0hi3FmtzWGXCag0Bc4A2CXSPPzip8fbwJhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oU1AcnTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKQmISN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oU1AcnTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKQmISN5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeTO3334685
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=; b=oU1AcnTuBUKPMdOX
	9jSWS530HrKrixtTyv3jinPa15dqNfDFg7UkF4MI8j56piw+vwI3Q1KmAw9K1Mxr
	WjsEdeiT1mCL0IH3bSTjABJ7mzknGXYBmCKEZ5HkYmg3bC4uXH2nTZyo/TlgspJJ
	SCyIvFNOdDcWsrRZjZ4WArTrfFZ2r9bNRA3xZFayD1ICpr8Yywi0QmJlg2qpVbf/
	v/iMMOtxB3Ar+XDIl2MCqkeMm2pgB8FCgD4QOQcDhnh61/Fhdzry/8RInu9jTrO7
	SycpXpktNObg3gZzDyBv92HTka/JRNjn20Lt9fQKDQg8mrft8HiBcD0ITOykMCFR
	JY0MWA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623q0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:00:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so4433683a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791370823; x=1791975623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=;
        b=XKQmISN5WHJTAQMWnYbWrkJW1hkK6ieHAeYTYp1N8hCaGDx6u5Bzk+rGQiFEZpj84d
         na62bJnBiiqL22tf1KKLe5IVDDpiDuHYjvvmzQSy8Plh/BL6heDgzxje0n2TWTPfmVes
         KP/IPjtG5hSRM+XEcH6MMv4XBTPAnBgOaNcV3SB9WQw7IinnZEypYbO+NdtvnAEoZD41
         Gj1fEAalgdK/rGLI5RfzfpWxaejOwraaKBCUP+wXoe69J+3CQmSryIfTgZKPWFsr3kQh
         5sqZY/hlt6hVZgevEOX+9TqXLYtBrvmY7i0f+dVBaEo8aCC1IbhdpSNtlrgEB+dTJRRh
         WHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370823; x=1791975623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=;
        b=0zAuSS6M9kltG2K4S5CPYjmpUvI4e13XCSTOo/ZaH0VLu/qtrwzTNVBtBRlXkU1EUH
         aq1YUXIxWbUsVvhG3t1qg1R5VhJCf/8QteuubBVmzrZRNvezR/wzUtmDyjFtS7ccPmLu
         ys3rAB2fFOTQ8CNcjlHx8dUMqnsCjUHTwPbCmrW5ABLunVI2srbxQ74Q11ZBaU4DytZE
         G6H6JaGiuu8i2ufuAE5S+wpqtbPOMe1eRcVnAdpD1nlc5E1izt0ro0ZWPvIuNjZRnHr4
         1qzxh/BqQzdGEZCAhRHl0EYwlemArV42HYzXFvzoBo0eXjH7Y8T2I0xzYtBSJCH3hgA9
         U33w==
X-Forwarded-Encrypted: i=1; AKwUvBz7X4BSdBtR2hUsvOPRITd56+ZPfzhHmWke4DziqIshCqF/dbJkfFwgSyZo5zv/6y8gl/eNo4qzkUBYepo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIVy+8fsB6+FIUmyAVvcijLKEQLcutbjDUEyksYHLaYYHpT/Q5
	4vo0BRCZUYbnzkMVNwOfN7h43SyuW9Xpqg4/Fx4DnqZALfFimKljbqMV9TpBQXf7N36SyVvaxa1
	KK/0NYC7pgcxqDngZMhpV5Wu0wn2Uu9GaFiTDnkEd0B9/mrVXCTdl4AGuEkJxPI8xTk8=
X-Gm-Gg: AYBFou1+DCp+X5ld7eC7Rp8ZxkN5D++UHW2jauTcP/hTDI5xBlfkHVbUePIbpQicXeM
	Hgs6rVvSx2PmvSQ54i8gn1bE4ODOb6vwbIXHc8ojCuvBBlW5U1ahWrKhjQy4TqFqNvPuEKWcHCM
	i/nX0nyywHkuH8jVPj/1hH5T3UXsBjrEEjOSCECy6UyPCISFiM6e+QJd49TFKn8Yx2qGkPimrfn
	cVUUofVIuBfNLwKUx4YT61msVjeBeMPP/NV1X/s45GfYwbDjH+Wyj6AM6JPQH7jKw1GLSwxDaVe
	9GpEBUOwSBYONdUgxhhviYhtWLipLmKNMPgP0tXy41JNKIYJYD/9HBmvDGiGv5UqjdmuFMvu9LR
	BpUE68K+5QX3hKb4O1iaJp2yWNMKpXvvgdhgVGufB
X-Received: by 2002:a17:90b:5887:b0:3a7:250:386e with SMTP id 98e67ed59e1d1-3a8a07404admr1701801a91.22.1791370821893;
        Wed, 07 Oct 2026 04:00:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a7:250:386e with SMTP id 98e67ed59e1d1-3a8a07404admr1701772a91.22.1791370821390;
        Wed, 07 Oct 2026 04:00:21 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d5ebesm1232959a12.12.2026.10.07.04.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:00:20 -0700 (PDT)
Message-ID: <297690cb-64d8-4e7d-9d97-66680f6a2b99@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-3-84cf4f861415@oss.qualcomm.com>
 <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TFkyq5X5UDpezdsGJCev-nOrOyW312IQ
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac62647 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SwwKY9vyf4oML-p5yksA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX0TPdYG1fCsOs
 +SskQh0AIrOTioPNizB/IicRIGElx3REYNl7nwzJE1o1Mb6kOBlQH6ZWCE29fNqNfi6PLJp9uam
 rdulCyfLFfYMxGrfyoTofbLk3k1D09U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX5EYE4Wxv+Odh
 uwMP1V0b3sM0aNolrDkc5sN8cT64bcoMRjUDPIMwe3HplNih32vkVeecDHMDoP5V9bSb8INGuDR
 Xmki1KmW54agUGjAEYY8sgs3N+1IIyPgl6NOtSe19YQFBNE40KWoM2qcpICsgpQD3zvMXEoxgPH
 OCTF5EJ+ItXnofcTC/b4CYMNQ2wMesoDgdIxMIjiDauc+7vcPfw4nHd2U5613ZIzj2DXGJRZ4zN
 S5aVvxekG+ENTavz08PmF6sQjtGUo61RCa07rKUAgWQJbH2CW48M6NeluaYaLZAM0MnGGEKdmmG
 lCY++Ir1AoK2t5PfcT3EDWZ+oF+J/QRTetGzL2w2XontSfVUak5oD9YlLmoZPtDLmFY9DxnCCoN
 fz0coAh2Q/qpoTt4tqJIkuzZzLjAVr8aAy+3Ru3irlSUlQHSVebs57C7QK1VI4yQf3Ar/IcyY4e
 P160abWJP7gJJsBlNhg==
X-Proofpoint-ORIG-GUID: TFkyq5X5UDpezdsGJCev-nOrOyW312IQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070043



On 10/7/2026 1:13 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 11:59:36AM +0530, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 122 insertions(+), 3 deletions(-)
>>
>> @@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
>>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>>  		};
>>  
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,glymur-qmp-ufs-phy";
>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 /* UFS and PCIE4 share the same clkref */
>> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
>> +
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
> 
> power-domains = <&gcc GCC_UFS_PHY_GDSC> ? Or is there
> GCC_UFS_MEM_PHY_GDSC, which is simply not described in gcc?
> 
> If there are none, it should be reflected in the DT bindings, together
> with the explanation in the commit message.
> 
Yes, Glymur SoC does not support UFS PHY GDSC. Sure, i will update the DT-bindings accordingly and include the explanation in the commit of next patch series.

>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
> 


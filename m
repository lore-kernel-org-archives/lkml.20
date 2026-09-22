Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9493C342D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078868; cv=none; b=RTqTq4C5Jf1fp+qbCNK1XBQNR8FHLrFk6jZIJ5OeiBegmG44UvIfSSP7jbfGCaD/V0Z9pl9EaSAn35vzRxJ0rFDWe4/qSJUrk/PxcMrgadubXoVEOgNwEWIlYjxKvjgLdNNXX+/3a0/1bk5kFBFMJYvsE16Gc5xAIzpcC0cAgKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078868; c=relaxed/simple;
	bh=TO/iZFkFwswzAF+yEhGFEaj1c8z776aBTq5j1ZXADlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEtrvh5g0tYXJAIg/WX62gd+42iTHLrpg+SfB0O5k/F11wfVI/vVqnJK29/cp5of6l2HmmjmvsN3FBgvAo6n9gdLnUJxo99BE9B1YFzDKgMkGKZJxtpGl6Qd0DHjfOKMmbo7QxPyabq42Wt6ty1frtxT//eZUW9uYsrjonirwEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SE4yMWaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xpg0+UFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SE4yMWaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xpg0+UFp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPYkV3671747
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=; b=SE4yMWaGoaYDcRFj
	PjnpZ6e2N5mqFRASOBsWaiLFxrmWzXfcIEV13ibp44euS3p5yh9dd095S9rtalMx
	SJdiaWrDgPKbEV3D2AMrD5YrTevCMbHDHtAM4oXnlVwv5DFuVrmgl7Fo6Jl/vQCG
	FySren71Rs2rUY9jtvzA5oKJDIBnyPgtFacWb+dBN7Podz0jrKgj0sUnIYy+3vDm
	knx8W7b8PjWzC4Uzz6Wz4Gd8FdrADbL46+B7v09hwAdBTGeHqhzAixpSQdrm5gA3
	O/3d2XFK631Utdf1gPjwzKjLgq/o+hmlb6r3U6LYPw8FFcGSUWOB3+zPXlvIEBTL
	A8Ejog==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt85sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:07:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5534813a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078864; x=1790683664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=;
        b=Xpg0+UFpN+oX0Gte/4R82IHf4vvFE0q0vwPjROuiT0/LC35FSyL11+/LgrkeJR/Wlp
         sH//Ywt2BaHr4hui09f9Q/W0PuuTZAUuSkxaeJmZ22g9Cr9jYlyEHU5+iemZ1gJ9hsFo
         UBCFoyB6uxIr3irABCerpbwpO+ragpeEmglp9I3lezGbNSFjNNn0//DbvPK8ebz6q+O2
         YuptTTgOCI+CMUKRqg+aEG2BV7oWYw2yHG00KTZYyJSN0iQjX80v1UBvrs05Xc1KiAhl
         SKEUYo6JIx0+n+COPZsPpqAbb3lw2eS/T/DUMNTY3STvZPR/Mwo4uyVieVRCjCRM1XRs
         f8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078864; x=1790683664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLEQt2ewQblpbzFMvdr6IfTSOQzmO1SxQA8MDwzNmvE=;
        b=wOEU94XX2+C8dxYY6jZfEYJeQ73w/Zov39F/rbHeeyeTdT89/oNwe3L/OyUk+R/UqP
         JxxlNAMULJlyXJ8qM+HD8YxuBAhYGFDAl8k7BDd9IsQWEqusY6dxsYd2iBioewMMDjMS
         S5u3KZhY2IdHEnCVsNm+JNHsM/mTpaD/4JrXZh2uz/t0DP4LMGHgB4/9qCbJ3pzGLeBm
         R5t/wImKooVbhMA5SwzzjwyQiUlnzAiftVrYVEwhXDjxFqdSdie59v8kK2S35hYYSAsu
         K1jrWOJ6NLS93v81xg2SPKcJsObogwY0sR0P08OaVzt+McPxPdAFzc4bw0RF40+Cg+Eo
         kIzA==
X-Forwarded-Encrypted: i=1; AKwUvBxKT1CF9fl2tusHHDl01AZEJzTtgBDwnc/eslAu4zHkvmgm/2fLu+nQC7/ZOtQS15jnNMn0Z3L5cz1JHtc=@vger.kernel.org
X-Gm-Message-State: AFuF++nojhVSy4K90wf6Rm6OYJDohpiPVSJsWRPhDwVOurSVUBqkvZyr
	SJZYUc288RbUCakxqYwwb3KZ+WPHYm3VFQoO+PepIR4epbuAJJRXw7Pd7FoPZRmOE1ytdpwcR0u
	/bft2bU4ql5wpE8/pAJMCmKn6s9DBYs7wAjPR3BU2ZkPM5GYBK98LM3MqwGBQTLDsv7E=
X-Gm-Gg: AYBFou2YDRKQPjS/BELPZ5u8BXaJSuC/WvPvQN27CevUcLmxRiPs6XJ9hXErHe2rAnJ
	gyF10B+n6gM5mxQZI3nXHM3kvxQ6Ih5o+GmL3DgcE0tLAFNES5SHy49JX183cm1Bx7EccOXcyZn
	uFSP57PJiDf6K8shyxwmekiYY3ed18IsQ/uR65D7oBUkQe53+5D2c7WbKDCKRXkb/BkWjxaKoEb
	ANy7jJk2IfdZsD+JZWzaKa7ewQGC05TG4SHGlaVtL77Q/VLFPp74ESRJn2FE9Xp5GtBVuuzoZlI
	vbRTs/aJSv1kskQ3XfVykHokW5zhcFoQOT5SsdI4pMC6nMfJQIV31dKtCNXkeCufLiXFf7+NAM6
	rb6MXQLKCRzSGGVsJMQAQEqs13n8=
X-Received: by 2002:a17:90b:2f43:b0:39e:4c7e:f03d with SMTP id 98e67ed59e1d1-3a073116f1emr982103a91.26.1790078864033;
        Tue, 22 Sep 2026 05:07:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2f43:b0:39e:4c7e:f03d with SMTP id 98e67ed59e1d1-3a073116f1emr982070a91.26.1790078863481;
        Tue, 22 Sep 2026 05:07:43 -0700 (PDT)
Received: from [10.219.57.63] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0715e9d5esm2483450a91.17.2026.09.22.05.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:07:43 -0700 (PDT)
Message-ID: <077cf4c6-9657-4e4e-b755-2f45a9fc67c6@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:37:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>
References: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
 <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <bc2c2121-0eef-467a-973e-019a9ba6a13b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 29ku1-hZdX2FhAVDkUVKnlq7PKBygFtB
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab26f90 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SYeg_LyZQ0ZiSJgYx_IA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NSBTYWx0ZWRfX4hf9p/hrod9E
 Rzuuz9uPnoGQ3jktk243IoL+Di1fWjtuqOOBbDbbC7AECdXIKXsCl1qaq3rc3SM4Ff+QRdCLAVM
 F2cCHVzq8JINKdbMtfXDI0pttsfA6VX1btUqSnRAw8CEgQDG+h74WsgSr9OCq1ksCynslXJZUNF
 3rRP3VhCkvW+Xvt/mRr8zb7nn5BxmmZh8a0UTnVZTsSlX7WD18PyzgiRBVb3WnlbDIfVyer/w+M
 OqQVgVB9Ohl6iTYmkmg1EPydR6TYJZQDuBIsC8lox6MdntOPcZf6qjYwUSrSc1qn2hoEKIPT7ce
 UFh6kI8elPnJMeZVadFzX6W35RJAKGZbAcxdyX91fTHwPsbPGCCu/RQ7rLhHiK+E14INxgruYHu
 nAji/ix8kZYYHnBIDiGAV4LxHClSr0T5UvAZhWsAZHF5M//OTxj8l9kpmNFUxO+ItS8wq+76VUD
 X2d7eyqQRe4m5cWDUmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NSBTYWx0ZWRfX3xh0Whavm2qB
 EgzvivguOtuxMRtx3cMm6PHx8P4448a7JyOo8KyLo3hfNQbi6FhdTa/N3XMtRegtVwbCFE8Uv+W
 dMyaYaW+eGhnVLv15O9Dx5/3ylncWGY=
X-Proofpoint-GUID: 29ku1-hZdX2FhAVDkUVKnlq7PKBygFtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220175

On 22-09-2026 14:31, Konrad Dybcio wrote:
> On 9/22/26 8:40 AM, Ekansh Gupta wrote:
>> The reg value of a compute-cb node must match the SID (the lower
>> nibble of its IOMMU stream ID) it is associated with. In the cdsp
>> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
>> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
>> 14, which don't match their SIDs and leads to SMMU translation errors.
>> Fix the reg values, and rename the nodes accordingly.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index de7c395d9c35..51fea666efac 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>>  
>>  					/* note: compute-cb@9 is secure */
>>  
>> -					compute-cb@10 {
>> +					compute-cb@12 {
> 
> The unit address is interpreted as hex
> 
> Konrad
Thanks for pointing this out, I followed other DT files for this. I'll
change this one to hex (@c, @d, @e) in next revision.

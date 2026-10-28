Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224780;
	b=XY8dZq2rEoJBHqOhAv11I6l0wZTxk+R9IaMAaLsuAOKGPO8xAWSDbYUjkKvpgCn5dKjP
	 Jk+P/1UpoIUI9fNzvqP2YT5ovoBOR8br46+AQ+eXsFq3KBKj+fVhJ0YwGjbinBkRMlAoK
	 /1V6J3DJnQodsDG0j2rbDjY2RgQ4Ch9EbD1eWI+YFUpy0liNJK25UZIUBXkYZhIR49edu
	 5DacFJSlfmVlH/kNbXx/4OUOz2ckqs1iV3TrMCzCnqq8oGewn+ORJtdWjEmYGYb1Pp5ok
	 ewDzQb1kvCvrmNoDdIuNyPTMyKwEFYuGnLqoEo1kl26Ier3/r8QsSJ+ZyVYVe5I92OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
	b=29TVOlZ+L2yauBHNCU5eYJ9iSLgRIQQbMcaS+xuC8b/s/YE5m7Vs2g8RiLcn20P43fec
	 RPC9SBJBORDgJl93XQetNbmLRmbrVVqCCq7XvmAtoZzEIczvarR2q0oEqVPX61Leg/UeU
	 XC8ueKgX8ayNvu70But/hXY/Zt2GUp1Y3ln7PTrFQQm0S063w+V+3OpWz3iYugCn8Zuvz
	 w0amnw0Xh9fTvroKWLaW6GGkEqM0n5+aGQ7QWg8oz2ZIObHR1Lkdt/2YOfs0T57XtBKNT
	 OplS9FBa7IFeUfyYx7IaGOnBcOS7xojVa5iRTfUaUtTOn2eZKgyCWFgW1WrZzwBpZXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F8160A2616
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F8160A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPNHB1898351
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=; b=Qzq94gNCm29yddEq
	2mnaoytNhDl9X6hqSkD4rl6cke3dTfYXobdfGBw1qXK5XPxuynjoFeOWI0LxuiZo
	Q1zqGflIzEd4iY8a1gmSJpFmjurp1IR6nylxCqKHlMucaP2mEW+PcX5GQ8apj27g
	HnR/B1ZSRZ3+vTs+/eWRttJhTolaZIzzZcnlh8lNDocQgH9S09QW3Kjiw67Sgi/K
	VZSzNZeDxmWhkkhyFHbqhZqqsOQAquJ5MXMlPj+WfQOb+LS24vE0a7SjE/BvKNhC
	rBQXDsbM75balqwCfmKjlEi5V+tSAo3iCGSNGS0mPBV46/lr3QRpN+yrK21NtJ2N
	UIL8Tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehjpey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:59:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so192085585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793224776; x=1793829576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=Pud78NrcNSED4MERVPeYoyd4YwNdGAFxjQWEmYZAiKWGBCh04kWTQbh+uQ5Wt4+EKl
         A0X3yC3XPSJvND8+4yLU2oQfyg63Cs78nwiwFFquBlWOVeEh2M+mBMg2PWYzSRvHs5eu
         yXQXtHd1VXj0H7+Tx8c2kLDgW1lszwuSY5rpyN5jybGmQy4gZSLIi3jGbAnTdJFlDcTE
         Q+Z9ZXpfN0gqqvg3iq1kYAnaTB0vhnrsPSulpGgPXfec4AxFDraIXoQCw/EFCJOTloOj
         vXNNT92jPSIhPaxudLEoO2HqR0ZNdbdd8kEttDJpEdT8Vlr8/DAE4pyKecwjGQHjZD1Z
         mF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224776; x=1793829576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=F1Xa2VN4deplQdNU6cS46NNcYh+AsX2OCcD9t2hj+20CAtMnsAhwx4mNiYQ8GkAbQ0
         kT8n+5cuDGv91EfXJ4HOdWEK32Mh/UFUn4/hZdTb+UK1SK8TytMCldza8+owvHDLJrz3
         JvpGNVpCZTUajY5wzOf7zzzJ6e9Hsz3rjhYipOC2FBYxoyJN4zGCSulrTmUdn/geT8TA
         e860bkGsHUqMvoavBRe6MRpSUBRYC0IvvMOSgRWK6SjWVZLGVznYigGh2CYmYJ3IsanB
         tAzJPvjSX5xG9BSGCudGWGTnCZVVvwKH4kbCWf75dPIQi5PMi4M/CyXbezkIoxUk0g2Z
         qv4w==
X-Forwarded-Encrypted: i=1; AKwUvBwTp1YdcRsCLrItXNvqkq8/PRoj/SUi70gNT87eEoADUjER4L9toCNQIxpFqvHcW1mI8SCo/OVAacQQlL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVtChfCag2Ceu/mRz6EY7+8nv/pgMWRGtinyVOER+g08fqsWkF
	6SzpQBA6sV82AAy8aL0UcXbDvqif2Yhb3ZOE+GooUbGJTsUy9AOTBJ3ewLJeZ7PBJ/ia5gXlHB2
	vLUgbvc+KcCNgoCIoOK7O1osSqAN5MJ6A/v+KvUDOil0xnyEM3hDAxxKb1nc/qugTuk4=
X-Gm-Gg: AYBFou0ZX2B4vZRSQpJsh42czp5+qSpIFNI1dgTMzCvCndEXpIOMbWBo69MvggwbiB4
	pn3ORzEzKe+57KdsJKmHf1qhbN4r1K5WIkSyTUxsYohm3uuqzhPRCVFBI4egwnlVhQU1MPILOBH
	6fLTVjtQt9Tsx/6lpP67FSD2pjV2ytF8WlcYXIon9fsMCRZSB+xl2yfpdq9srq+D63omXpfuOGi
	PenT8RqpemhHQmnbaYHxpSSCqhbcmAXbl4TrfZk/kv/wksNGUTJIwq7edBI4oqlEpsZ/b1B4rQS
	VaSOSVhRBScZTnCINMjR/FWx+PDoen7Lqfp35tmyS6roEvieM5Uf/KUCSAIK06eVPc/AJmfOB9A
	UYH4TB28kGaBwA3PLJ/Z2231QMqGJqYrvh0CUZPptwZFugBaQOAAW5dKpyMkEihfM2F2xy8+2+L
	A=
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592892285a.69.1793224775844;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592889485a.69.1793224775294;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa82516a45sm24352855e9.15.2026.10.28.14.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:59:34 -0700 (PDT)
Message-ID: <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 21:59:33 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
 <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfXxBrZjI07+jDR
 itemNg2xAYmBA7/RgbZkaRFh/VOPnNiCJHlivWtJ1naHGUgiWzAP1NFVZaPdroRxSc6VJZfjgnC
 VwVcdKBUo6YdQ4/jDk1DNNjas5nPU2sU86vvPwen4o0mr2PbDYSEVGL6Qqp/zdhLqHNOo9nvp7f
 2mbbVJT8QEuYW+c0W0QL7XBAzlGQf1CjNNCa/AyUBBgh6ceRCeOhjDgxnv4/l63j6FEhsjT+ufy
 z0D8AbvahwLDCzwCgnYy+1G2KPAs2Jd6Y4392YWUmU7WJ10lR4v6+5Oy6dF9XZxk9WASw0sXVDJ
 39H/Bk2/llILokyFNYh6O9cl1tUXUIvTF+vEVku9U34lCxjI6rm41XB9/1AWZang0AFARAWq3GB
 hHPMSq3+FyKpmDhZyKDELOKqBEq+L9J67vKeo7wEr6v5TYxcfi9SpD3O8fzim2CzdkfUIVgwffc
 B2CAlU2XEdvkwVAJ1xA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae2704a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qbwID_QRwwrUub8pYvkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VY0OHlgl6J3iIV9yZynalWJikdKmC9sj
X-Proofpoint-GUID: VY0OHlgl6J3iIV9yZynalWJikdKmC9sj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX9RJwMG4AYGzg
 6GqR+72NdcbMmGH1Zwxo4SzAxnDR4mOjKIbRSAlGOFAXJrqJETrmbLMl7vqEQpNhxM33c/xURPO
 epu6xUFFMnxvOoFCGUxxLdjkElsLtEA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280087

On 10/28/26 1:38 PM, Konrad Dybcio wrote:
> On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>
>> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
>> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
>> speaker protection. The speakers now expose two DAIs, so give them a
>> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 58158b51fe29..fddc76f59557 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -256,11 +256,26 @@ cpu {
>>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>>  			};
>>  
>> +			/*
>> +			 * WSA SPKR playback-side codec DAIs plus the WSA
>> +			 * speaker-protection VI capture-side DAIs on both
>> +			 * WSA (left) and WSA2 (right) buses. One MM1
>> +			 * playback open brings up both chains via the
>> +			 * machine driver's multi_direction_codecs flag;
>> +			 * the SP<->SP_VI control link in the tplg handles
>> +			 * the DSP-side pairing.
>> +			 */
> 
> I think this part belongs in the commit message instead
> 
Yep..
> Otherwise, do you think we could bind the speaker protection
> channels in the driver to avoid having to modify the DT?
> 
Nope, it has to be a codec-to-codec link that should come from dt,
giving more flexibility.

--srini
> Konrad


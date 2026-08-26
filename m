Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712623A6F05
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743763; cv=none; b=skLkCBQjjUcfQ33TzMjcSKBlXIxzgIZtjs53IDbjusQHWq5QgV4vyGhltpeLAWqwqF0HJqVul+RM9vCewoTodGE3EFngCaPoMJKULNXUOT2/ieudiRN5iScmB0AfFxCUu9DI2Wb1vgTPvKGrqw1jeFJ16Jr2epXnRw48RaIS5yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743763; c=relaxed/simple;
	bh=9igVRMmS4kNT0dlkUrlkf7C+0xdEBeIUo0HRGNka23k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezIRZxIytjsff6BXZrsGryQdQGrWx8hE70Jt4x8MtdPr1qAOGsQ1Y99WRxL/36yTG0C10zzZGlGr+b0a+d2dRx4XrzpyYwSnLlmdVzuvIQGuRy9OOetD8pj4jE67snS5gG4lY9016MfcVGgjOju3thIozGBPNjfcsUo0RmYWcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez7DJcss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxSWWGn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez7DJcss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxSWWGn9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGkxD647137
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiEFFiswgRxMj5BE8ZbhHboskz8MQgocxFXWXunFW1w=; b=ez7DJcss/qGstvmR
	KC8gMwfhxU99K0JiHODXnTeonRy+IC5p48YQtPe/91Zc8ezKNLtY5gcHwqkk1x48
	W31UO3dhS7ju51/4AOttjjm++NwloIIa9mzSgAib+VDpDtemquo7LLPO5wN9eWGm
	z0Ggs3haSxbXEjV+TKLlrRdKpRHMn8bphKVnH5K+xXTh0bmARYM+dldE+fQ80YZz
	A0tj7sLq1o1LDl77FTcBAra606sJgb+omSJcljVeQunAWFAnP74Ug8WcNi/eSRqi
	r2pfgJp9a4Elo2yqsUb6QMPt5/p03dCsfRX8I1mP9clB6/lzg2NG+ZqX0o9A22Vt
	1Ha/GQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mudye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:29:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso12166925ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743760; x=1788348560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiEFFiswgRxMj5BE8ZbhHboskz8MQgocxFXWXunFW1w=;
        b=kxSWWGn9DhvxJfKBPoSOc+D+IlXXl8qxLZGmxrrmzmVo12TQrbik8lhl522W9z2ckx
         DBUUdPH1n20KJvxDU4cGyoKNlYYDtVVOHSJ7vGhM2GL5sTHTPY9PSrq1FYngTwG8WgOi
         Ac4p4pz4IA2wt03migEWYy/mTtqiHU9NZhfHcyJ8TFydV1kC5923qrjxkOPBIKUlhLtu
         lRmbLZKYjAu45h9KpOErbB4EG0WXYRZgMRyUVmFb+fxJF1Eyu/EZjuPOkQ4WEjZee9Lm
         5yHz6g8zFbetSoBwygnxBbXtNhR5UA32OmKOTKFCSxbN/vUGsBPzyXyPoifWwHbc/jiq
         efsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743760; x=1788348560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiEFFiswgRxMj5BE8ZbhHboskz8MQgocxFXWXunFW1w=;
        b=i5lfyo44Obsndn77Boskgp/G5gbYG2MvVJEOBpxLGVtI2Whdl+1jqIkC3etDFEwnop
         pmIL3oG+FpQQcuz8oVZLUVd6X+sEPaQh5td70OH8K4wD5qbCVmihCxBHE6j7GUq79W6i
         50fteo95iLBnP/4oF3rfTwwukWFzxuWI0irsuh52R2SKJc3s78ECrM163m084/+ettH8
         NsmqdjwLkgO9N0iKpZDH0WpL5ax5YODdvIr70conI5PP2BU5pvwi2rIlbX1Y1898sWJ+
         ez5eoL8JiLXdZPbBBjlv4sY5PApVRWLuAoRDK4LAdFLQC3s2ehJCvOjBpxpL7yOxBegB
         D5yg==
X-Forwarded-Encrypted: i=1; AHgh+RoP+wLajgGbus67YMj6fBfXoKSiQy7yVjz3hQJdC9LCzar/W7qsghxF5aHyYFbHwiJkbZUovKZw/bLKnjY=@vger.kernel.org
X-Gm-Message-State: AFuF++khsRgovErCNKpxWD6r7urdEyZbfpQc2mbr82JMZ99suR1HpQwW
	2u8SakrGSk2b+E8dP/6scXgLpa6uHkjXviuvHymwiSxxoJvV3vneGY0NqPbS+1qMFuovnYdBSZF
	KsHauy/AmfLVMA0qJxBFplGkjEy3qjJc5vv9u2u7+VSPRMOT+yeCKZSvsnnsvmhqQ4Hk=
X-Gm-Gg: AR+sD13Xyxy6/hoTgBum//TFcNKuihcljraNZ78k5FcLsBqYwhiTejbox+gfqJJrkNc
	4Tq6/O2mrUfqHifWOAGi7Z/cxVvw/EKjtE9hC5h3rgAa+XXdsbXLo7ToNKupSk4dikAzlXTWzuz
	8DofWfE+r/MaGGAznEwVAQF9ikKkzK5M9ShkDn81K4B8TrlPXBYzq7p8wQtRq5eNea4y7kGm8rU
	krM6RKYSzFBys3s7dcpLZySsxN8ba5tAxleVCdi/X6XxDt5t5a367lgdC2bb/SH4KLDdUpXFnzC
	KiWfd2igRsFCiVK3aj2jO5JEa2zTc/q+jIw4B742fPU8AwOotn0+ZirIRXFm8IBCP4lPald9fYs
	qQpuqVvGxqKyn8ZfggntQD7LibZ1RpZU=
X-Received: by 2002:a17:903:32cd:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2d704ccd9f9mr65099625ad.1.1787743760434;
        Wed, 26 Aug 2026 04:29:20 -0700 (PDT)
X-Received: by 2002:a17:903:32cd:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2d704ccd9f9mr65099045ad.1.1787743759994;
        Wed, 26 Aug 2026 04:29:19 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9f555sm6477885ad.40.2026.08.26.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:29:19 -0700 (PDT)
Message-ID: <4bb2ff3f-8047-4212-b845-62ba87142a22@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:59:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
 <72be72cc-57c0-4b17-ae7d-0b28752bc708@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <72be72cc-57c0-4b17-ae7d-0b28752bc708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX2bgPag+SF+Nt
 hhtisFuwwmeh2s98tUC7vQpkqVHl4YlOC3GwmalK9JFpEm2AKe7wr9sovlqY6G5DfoQOCOYzNmx
 9e3wdzLDeFGeNr7OsNLIg0c92BlNHds=
X-Proofpoint-ORIG-GUID: gyTEQhVjCmdZYuRlC_8Zg3JTcA-PFwaZ
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8ece11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z39qGPvTphHJc2tveQQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX9bTQwaXjgGsG
 Mfx7/hef1VPz1FGO+dNHAe2RrPns9W/4r9qX2nEEIVkXB0m3f6e6T1DpD+Ag5CpyO5zQqpH4+IN
 HhKPjKkb8BasZc4r2ebIY3OyXaa5dfCRo30g751bx9eoohgwqsDy+zpR1WMSubK6F7eJch/jOW4
 qVbOc861ufzuIO0hbmrigfTeobFvlRqHpMM+h/HJew2a9UYGHi1b4DVDW8xO/CC1gCYxooTrHqO
 kViL2qAyDATAmnlF/WtBKoDpbdAM9ALZvMoWlv2xL/rDZ6Z6PhBN7ciFr/7IPJg5MrBOmBOXr2h
 u12nxxJhsoua/v+Zm73ygU4EuOqgUG56vdxw2HI+61UQUqsIYoROcBSd7JVjQSoI7aOyvt/Psk8
 0qrKW/h/06hpKzX3+T1CKHbm+EdgXpC2aJUnWkp6rPZqpU41qg6MQetAeemVhW0po/y9XUad6cZ
 TLV57nKGEK6cxPV+gvg==
X-Proofpoint-GUID: gyTEQhVjCmdZYuRlC_8Zg3JTcA-PFwaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260095



On 8/26/2026 2:41 PM, Konrad Dybcio wrote:
> On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
>> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
>> required SPI and TPM nodes.
>>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> index 6eb4184f7642..9f3a880e95e6 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -12,3 +12,13 @@ &qupv3_0 {
>>   &uart0 {
>>   	status = "okay";
>>   };
>> +
>> +&spi5 {
> Please keep the alphabetical order of node references

Noted. This will be corrected in an upcoming patch.

>
> Konrad


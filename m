Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236238;
	b=2U50d0reM519msUcW0+/aemdmzTvXiIx2c+CjIH8Rgv4unxUTOqPVfI53k/aQQvGbJzh
	 jQ+YfhY4CaVd7fTv3Yp8blNZur0IVRFLlX9XuOShVuN27YIhVd5j0Yutcwwqrk2LDXtnG
	 pOR9jjddUdlvFqW4OSfELDZ6KWYgZjbDO4kuioLi7tQYObEs4Ni36ub3U6gyrHn+6vWma
	 FUeucdjzIBj7D3YInXug2c/yInEAO0Qu5/aN0MU5qKe2G/Kf+H4BmxggyVRzFDhWewk+f
	 M6b2Z49fjNY57leysUiPzJLN8/pxnI+UkvLdGtvEACKeqSXWoezX3RCyNSyfKfDoONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
	b=iFVCNpMuULlgU6DqQTsY5AR8blaXoHHrscxBVVVNtYaRqvF5nB26ZhsuWFarL1a6T6JF
	 tt1ujPkvqdyrFb52xr1vew0t3TFgktgeOyO4WHmzbuwDZn7gVMVgrusAhc9sUPFHQtM/u
	 8D0yporCIJhmCivFbn2PArM4VFukmE9mVmTCO+7Q3MYd/2t/cKd4NE1ULIAk/ua1GXXVq
	 AwaqVVNEi/mkCopkyXPpN0EHga4mJPkxqWuwdHWXc/FsUfkBq7YqI7HZtqL3LWWeZ8C+L
	 JKkuOGM4SOjtAu32ieKeGEAzj2ZGjQG9BVhiKnd9i8nkGjMvfwNM9wHR97ChqX51gKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AA9606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AA9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEu7h336383
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=; b=BFq8BqgOWHBy7rpY
	XytFy+kA7CtV9qJKCSEga+ah0ixp5++GUYK/Mw4xX4A6B7vTvjicuz1jHZ0Mwadd
	NvL7ttkZhTk9Z2ZtAu9LBI25Pft4BOzMZ+Ka44GAShWBXDDJqTpGFX9suhX5E5gG
	zd+oqa0khh4OtC9oyEhOq/i0JZbJDKDktcYzu35upbxiACBlDFxd6M8WrXGvIcxC
	RXl/fqlDEgZF3dIo+mAdgm7N5WtcbSOBg2Uw8uf4HKJv3t1reSSvWnO2QrU8uF4q
	tYK8rpMBE8ihUW5asCWoglo/6hzzrU+1VOANKRt6JWa4Y0alAXyMzwCl3C9QADxd
	li5v2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rt1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:57:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so22112185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236236; x=1794841036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=DpR+dvKUW3JpQG5mLvQ1D9BxUA1zVmYGjI0vs/YntxA0L1Cme0fcVElNOyucUsO2kT
         DcAIJF78JCcmQKWIDKrgy9BF2K4tBJpC7dhUJ2qU7Ct03k0BvajPd9duUYHS8lpwXIqD
         lNpGjUbgLwjN8lcH05fz5Jp+Rsfm/Umd1MGwNm54ANmAaCzJz/di1sKve4DucAS550El
         bX1YLV3H2OonyowT7GbVKJWHrgSVIFON5Y+ZxXTWCswEtV+S9M+Pbx/XSp8ryGGV3ixR
         kbWDo0onJ7csX3UnCQ8ey0hz5alrS3FHG7pfdZ4OCwbaWMUrhTCD3bxO6tjmjQTwgbHy
         /FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236236; x=1794841036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=2pToc4LT4hXnSVLfbAXWIZxdz5XbAHSNw8orbxZCuOPlCZfr0J/nvdx/QZnRFjpx0P
         8SJNTJNtXOK9VsRG/Jc5h16kS6et1RCMGsZ44SVvwXXM4dMPIOw+pXPf/L5BTBlJkGRJ
         oMQoH36q2uheHxIVzdy+U90prOIUFNjVJrUW3CBXJxGQha89iolDKWVZQwZHMLHPpM/O
         jmRTfZXHQm5FDHfHxSdXiKR2OtCAZYtVfggpAH27We89Ifzl3GsXG0tZm4/efhb3mOvl
         o+CTQAnshw1rDs8mKEoBrRPMJ1nsuUQuvoMYZnBZIpWM8EzaoQD9m68vfdDLfHlAGto0
         Itog==
X-Forwarded-Encrypted: i=1; AL+hErHn9tAR+x1wB5jGG8iFxBwRAEqWIwT/pGHqVonFUCc0DkNtskIvVawID5JvVH+uL5QChs2cOFSa4Vjwk2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z96btuvEVj/qSUPSEyeViiohZVOaagJz0elXejCi+K+Gr7YdamP
	nLzOurzJmEMEKMC5KsNCL995q7oC5bZ90U0C+sd0yGgU5L6TQZGFDyNfCQGuV2Th9DSLJ6kbxdG
	SkO2LnTkNsLZit2MQR6+ZNq4RL7h/lR9kS2M5SZgUMG1t5KlIhUnQTbSlit3xcaRIq1o=
X-Gm-Gg: AYBFou3+UqwQycdaGaH9ifSgjMiKiWXxTJsNV4ontl3xUjs13/jeYAtjoHLctq05g+S
	INV3K5j35QIr9a08pQ1COu9e/K7bEqh3J+Ic/9z8jxaW3uExTK9weeMvZdoR073MalgW1L3BO2J
	v04ZCP0JSpVHN+yRx+wJFKOk4XpSizbna6jkQRd92e6N6ghiEc3ha68vohaHFFIycbx+sBPWfd4
	Nq1vWUddXYNQRIOMW118IctYZrOZ7glipnIVKGC5J4yAhWl34J0pG5lGPTPfD5Nr5WXlPAJ+tAu
	3gBRRmtD2nezM2jrbulH7XkFGeKakAG7I6ijw5OWO0KYsfrT8WMVj6aRzY23Cq43Q0EbhQseBPm
	lVQPTgr98pNuLU8JzXS6eloD5hwhvRqUAP0l3CoQA+afHMqGaRAUrs4VCNjVY8IHaMRY63Q==
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643352085a.6.1794236236337;
        Mon, 09 Nov 2026 06:57:16 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643346785a.6.1794236235768;
        Mon, 09 Nov 2026 06:57:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f943fasm178778066b.16.2026.11.09.06.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:57:14 -0800 (PST)
Message-ID: <cc6e877d-0d54-422e-b9e8-1cf8b8dbceb4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:57:12 +0100
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
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <mail@fhannenheim.net>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
 <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
 <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX8QVSk1y9oZMP
 4aitbwFuxBTAbVOlkU/2fLigcfxyH4aqTUXhMxoHa809LoHBTBKZKrxxbWUSr3PNmoNw3mr/2ee
 L8D5VdtuteWqouwxHL0nUMM4bGMBG4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfXyX8Rhhu+3Xk7
 ilsIc0tOkikr4JOhn60SpZr28IdnNtazrYxq63agg7AryWMFZcXs50lunodHAdMve+heKA7bl8P
 2kFn6fuL/ehilN7rprlM3rby8t5d8fyICl9E28+jMp/BBfaerx38RAw1VNY5rxW7iXvjpOMQZgZ
 i7fr/VgQ6Nx7KAxLfEZKcmFmEvDyzlTYozQ1H7kQr41/YwkIkg/EOyVzFPDGdR8rTRTcYwbA9RU
 KOM39cHqG7aKeaQ8iKjtsAaSXHTg3pfm8GukiL5H7lRjCbsMSpqs4a3eKeXvybQv6BymQdpgGqj
 FVp5J4P0TJ6f/U02JF6SHkrvGGnc4yXpHgOfRr6EYwk62ly/O1FK43+QAeJrmEFMRnNRnz2aASn
 FNsdTqUqxO7Am+aEMjSgLUpm5XhEsxVQLSjCIBok8PQlu9VCqU1zUdAaILf5iUuFD2RzzssDNwC
 +OeRVoZMXtg2gX51y0g==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1df4d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=MDqjLbU1OJPnQEr_jJMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: yOB0CXmmOSu8gsKo7kAgcdzKWCXNjJyN
X-Proofpoint-GUID: yOB0CXmmOSu8gsKo7kAgcdzKWCXNjJyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059

On 11/9/26 3:53 PM, Frieder Hannenheim wrote:
> On Mon Nov 9, 2026 at 12:08 PM CET, Konrad Dybcio wrote:
>> On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
>>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
>>>
>>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>>
>>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>
>> [...]
>>
>>> +&i2c2 {
>>> +	status = "okay";
>>> +
>>> +	pm8008: pmic@8 {
>>> +		compatible = "qcom,pm8008";
>>
>> No PM8008 on the other phone?
> 
> There's 4 phones in total: 8 (instantnoodle), 8 Pro (instantnoodlep), 8T (kebab)
> and 9R (lemonades). The OnePlus 8 doesn't have a PM8008. Should I define
> this in -common? It would need to be disabled when a dts for the OnePlus 8 is
> submitted.

Okay, I thought there were only two. Do the remaining two feature
this PMIC? Generally we try to do a lowest common denominator in
-common, whatever that ends up being


>>> +		reg = <0x8>;
>>> +
>>> +		interrupt-parent = <&tlmm>;
>>> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
>>
>> interrupts-extended = <&tlmm 112 IRQ..>
> 
> May I ask why? According to the docs interrupts-extended is only useful with
> multiple interrupt parents which is not the case here. Or just for brevity?

Yep just to be concise

>>
>> [...]
>>
>>> +&vreg_f {
>>> +	status = "disabled";
>>> +};
>>
>> I think it may be cleaner to move the definition to the other
>> phone's DT (are there just 2, or more?)
>>
>> Konrad
> 
> The f block is used on the 8 and 8 Pro I believe. So I think it's best to keep
> it this way.

Thinking about it again, I'm a little surprised there would be variance
between them. Can you do

`cat /sys/kernel/debug/qcom_socinfo/pmic_model_array`

?

Konrad

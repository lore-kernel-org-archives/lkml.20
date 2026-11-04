Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831996;
	b=SrgLQKIBvqdppo0C7voBx/ytIeaGpqaYyy2HR6m6p3p+8nm1P/5s0LvGYvOz5q50QI1j
	 f5yj4wFSe6T5J7Nt4pCCyAz4/QfyPsxAXM8WrolfIzxZ0MOXrrC5tho+O4x8jEl3IP6dQ
	 nKbH7zQUixgfKIImQlVPq5jHXKRNtFE+JuShkSIP5lDpQ+R+hJkA1dxr5q8vTK0i+nmWj
	 2gF4/9mXDwleTU630vnnHhEHjTsCA0u8RGjyIExfqZ7IPrHmCxUcOHje6ZP4EVOwlCzbS
	 ja7JH+BsGysD87JMEY2ZRhcqACM5LpPPEbbsZ8p+yp5yFeHAZuFiJHFV5Sx2m9TM5QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
	b=p0YZ+mPQ1w9ISRPAi/9mG/T8Suhqovp7CFk95UWGIJjLv72m+DmRFZiCiFN7E95WZmXz
	 ePMh2JGQgwhgILDGhoJpBq9P+40HGaGSzh1fq2vkwJrJujYUjU9PnNypijt49EYQk1sG2
	 2OOOeUFWt3Z77pkUf64r/tVdAoEygdsj3xIBYvZQ5EmRohWLfON1maesEtgxcfG2HvOzF
	 LcrtcLZx0wmWNlPFGsUPR6ud7Xv7+WkRya9cSd1y3jQ6UGQbJxub9rthWmV8hCy0xIUYQ
	 fM+ymj2uBfEGo1qNUwG52s3vPI9g6EWOkc6GTPZL+YvFEO3YhsgXoUsuZUxy1RJZSDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDEmr3Um;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekyrhJLD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44385606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44385606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDEmr3Um;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekyrhJLD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4LuUnS3272803
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 22:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=; b=aDEmr3UmzEamOC+A
	xPEzrZZTgcNgdzsecmhH1CcBswhJqo4oektlcz6lO1H+BUCx//LpLnBC1jbPf2g6
	bfe0uNlQfrLEpRIIHcHRylCJ2cu77HNQkvhu5//NagvpcLduczchdIGRrZ5QFeFD
	VuYDU7lJtSRng8un1Yqwa4F4pY/SC4u/rXgrQrwXZb2ivGFqgbKhMvESs9j533F0
	NO+r0hUyhySwb+4RLPhVmPfPuJ91NW1h7keHYE2v5maUsAWjmisuokFVmKAd0FSY
	j2XPl3QIgXoRTvAB72hXjIOXL4jld6pxHV+m9o8bfIy9czFDqgGiNl6YbdXRgiyQ
	P0LLUQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnj0pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:39:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so492322eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793831995; x=1794436795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
        b=ekyrhJLDv8sR0xdDH7/SGhzlnPA2MUfr8obiK/sFVlNhtglTkYtycIOTHn/aS92/CP
         qIlJaEMhwNaCP6Ccuz/OU/pSGvM0ByzT6P8o1XEP8VgoZR6NO8rMAEPm1e3yOehL0QI7
         1NtLpkQ9vSLLADYlSyZCf6cLPJnKG9lqZnOgaeMBRSdZDp1KxBNqqBaFdFLWlF/TeM8a
         /FyMxmXtzza/oVOCzZrc4FPTORC3m21ACg8tLal7Edx+07edVSKJq/ozROWllnaE9mou
         jU01qTBzYxafU1v7iNuWUP5eS4XULklG9b7S+grWvOqMQRc9vUiARfVylEfkw41tpFz4
         JvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831995; x=1794436795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
        b=nwsL5o1qYNnHRyTlBF2udc/eeRBJ1fUYvnRl2FlReTUotcAqGnD5yvoFH+yNEqP1MZ
         EHbI9P7QdzU60X4B+bks/5eXV2GeYNV7nIuDHfUboGOLU/+iF9Xt4/OsK4R5OGBMdSj0
         86v7tItttYLK31YG4Lxf6J65N9dFv7W6lE+sbXU1Gn6/83LO6bNKoNjETeHBr+Uac5R0
         tXcV+b11Cq3NghLcgigHUnWD5kLHguL4GiCLbC1Bb+lufPgdYAd0mWc02Wzm/IQ6yNLG
         RRqugCneR9wj3wrVmub+7Dn5TuBfM03+3ejDaHJA7bZ7QYAzrXQG18KZaVBUtN0epRh5
         8K7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfgr34rTZmKQ1FKXrdJdNiQuIfYbKSX8RA59H53dvBb6C0nyKNM4tqY1YQPHGZnnEvRhYZCvFqFq9gEYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lFzHerTtdpXyoeiUrQowsqYKr8Fp5EhKTs7Z2cS2uBe75i7JJ
	9O4uab5byB2UepT9hX/lFVnb4dVuJfEeShjBtomZISAu/NQRsweg90voz74cDRGHZynLbR+MZVE
	exSgdiuX9Lb/yD6HwkvhUQ76m+iyOvWF5xgiJiMj1tlNKad92xsE5trhoDHpFPFNko8M=
X-Gm-Gg: AYBFou1nfyB885SpEGqCuoFNLEhelZXHNAGjMDmqZkgeu1dkhdal2sU+Pxw+jXIqR6D
	jm4EerUjuYiYMV778O/zKPkFQhkRDIJe/Hvsi/cGCT3GpjldZmN1rK0ipCfhhLht5a7Wrl0Q506
	6xZ4FTMb0+peS1YE6pw/LAFNrEJeXLgbCQA6BlpZLoEGBlwnKs1dm3Ui5J1IbmP+zjmNJzVhs2A
	fW1gLqXGkdTqvMV+h3zMlJlH6wYtCpi2TZos9cTubI/ZFUhg45YU07dNGF3LmmJuYMl3SV/7bEo
	sqGPopqvNu09JLXC775PBzcNN+o4cmQt1LPfmy9e689DN5Qm6rg7PAhIp0b0K7TCKBkkNQwkEX3
	L4DTKum7HurjnQUf05zxT6J21ZHQgQj4Va78qOxXb/ZJPPWiFIJfhrKYu4fUIfmJOoZjYwS9LhC
	5/0aDUCkryW5Vt9zhSsa3XNMp7YBM7Dg==
X-Received: by 2002:a05:7022:ec4:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1ac5c369adfmr28168205c88.12.1793831994586;
        Wed, 04 Nov 2026 14:39:54 -0800 (PST)
X-Received: by 2002:a05:7022:ec4:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1ac5c369adfmr28168157c88.12.1793831993985;
        Wed, 04 Nov 2026 14:39:53 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm10405125eec.1.2026.11.04.14.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:39:53 -0800 (PST)
Message-ID: <8c0c9459-5cb6-4280-816c-9aaceffe1df8@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:39:52 -0800
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
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom: Add common qcom,csi2-phy
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
 <20261103214105.3605181-2-anusha.nandi@oss.qualcomm.com>
 <f319ba87-5569-4323-ae4c-3f9f34a9a3c1@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <f319ba87-5569-4323-ae4c-3f9f34a9a3c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX2SOp/9E6qM9P
 6Qke0ydYJI9B/h3NkB+UYWlOmK05GBpfOhylgqJSze0vf9qVm79INRaczfdJeFEY52eg9/Sd8Gt
 o2PsOGi/tJRpxXpbGkhB7C30B8ganDMsMONRTbrufhdyVndI2Z3hCI1QuCm89vEYdYrK+TlMjhn
 qbnBeC0mQXjnx/ewdHcQ3+hWbr1NBaq1IEAB0e5xSOQsIHnuhwtXWwmwRy2CqTT/3IzezGRnO4e
 iI/+sY3WQIfjzhwUzYtP3nFzzKYaA8Aj5KzFgoMFns4hR1nPQddMAzbBHheXQL9tfeLDIfRr5dv
 bOVPStqY3j7ZebKkRzCB3PXeCNstD+lLD/xsHWSrdu9mFA6Y9acelZ64xscn/X2AvTZtYx7Mwl9
 YOMNrlqpSYGdk8mSdLGhcKZjEhOwyqHXA9ClEE1M05un0a1gFww9PJ+4BjI9LnNT4p8QII3n+8s
 Gs95qP5u54x5rkIpGOw==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aebb43b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FDZwB5iHBSRriBojFeMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: OgUGnjf99YhsGH2ljYXVlfIlBgEP0SLx
X-Proofpoint-GUID: OgUGnjf99YhsGH2ljYXVlfIlBgEP0SLx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX81JIiBEdGRWQ
 l8hDjVu5Fz6hw3Ab1DFAj7LP193MGI/CSYbxe0KURU6aevn7zMmkiElwQt/3ZcofHgsSL4tpizG
 2spKKIEGHzWb50zlt4bn+VPEwxhblnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040089

Hi Krzysztof,

Thank you for your comments.
I will upload a proper v2 patch with the lore links attached and
comments addressed.

Regards,
Anusha

On 11/3/2026 11:05 PM, Krzysztof Kozlowski wrote:
> On 03/11/2026 22:41, Anusha Arun Nandi wrote:
>> SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
>> devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
>> clocks, single "top" power-domain, vdda-phy/vdda-pll supplies).
>>
>> Describe all three with a single qcom,csi2-phy.yaml and a compatible
>> oneOf, rather than one standalone schema per SoC. QCS8300 is further
>> required to be paired with a qcom,sa8775p-csi2-phy fallback
>> compatible, the same way other Qualcomm bindings express full
>> hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
>> this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
>> match entry rather than carrying a duplicate one.
>>
>> qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
>> (3 clocks, 3 power-domains, different supply names, DPHY split-mode
>> support) and is left untouched.
>>
>> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> 
> How is it possible? There was no such patch, this is basically v1.
> 
> If this is v2, please provide changelog and lore links pointing to the
> review.
> 
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 
> Best regards,
> Krzysztof


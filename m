Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661366;
	b=NBG+jYvg22c9LIa39i4d8IiwGvbvxgHDS4TB4M0oya7IK5UYAMkQRj1uas37YpqTM/3+
	 f+Yrjc9wAZmipbh1IWjQ6qBlnTKDlMGv3ykntsYRn7yXPWOnC7Y2SQsibfyB+ad0gjxJq
	 upa51gfzykFRpIFF79726LtuB2lDq9M0o3zlUZfQc1+6FLs4fqBxJwFagkOIjRw9AMmIv
	 LANL9KJ+EoacQgfZr+KJENgi5w4ofDDh03hFHlpVmALJq7e4Vn1O5TfleovLXvf69gabs
	 04yAjava/Aqgal681NjTjttPBjleGD0Me+jo7H65Spe8Dq2jfUxV2yl1V57Gv8nczzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
	b=SxVfzHe9wkj18CBpizqbPYx6VqkNpSGLos8mSBeWIQI0apg0deOtSBnuQfexyHEN5RKp
	 EmwJpQr7Z1cZvKUKTJ2zoJTf6DBn0Dbga1mFYj23vK7RdVvHQzeJb97g69cdToGalqfoD
	 NCpk6L3c9LD1ku8rstnNzJmlOvXzVGWpX0+QVL9XaJ8Lq5zYT94DQCL8V3XCxJ1sbqAHe
	 RXxKrsqPNck/aqgr2fRZled+nQKWLi2g6Vf4WggIKvZT7tJJ/c145IqnvX2yxU3+3BCuV
	 8flaXtmDFvCulXOhz09fpSOK+N6Hpxot026by4lVSlHUiWYHOrG79y6oHf8IDv0yl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA01606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA01606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70KND2174683
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=; b=aLcrDXCUR1JjXUR6
	pH3vOrOhX9wQJyVTB6yLshBTnlXqgYdWRavOFu08uBmsxajGWGgVWzjWTyUMHSyI
	eiUdK+lTmjUbkBuqYavMS+21sJ22tqqJ26m87E6NXlU2QC2f291Evo6cvJmzQdEn
	Prg//kZBCb8KxrqZHHM1s5/10emrzAlJ6ygkkZgrpx0O5nEygAFW6VjhmawptLPA
	3yETgMyGeTxSloGyYPbJFUFEVD74gwxaAK8MErOatvvRx9UACM+Q1vJSMFZV+oDH
	5PdALBGOrBn0j86PCB3d4A84LzzWKpVGVqZdVJF15NgD5MbReHcPFjIBit3xkp9S
	3D6Cgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahpxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:29:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so44200685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661364; x=1793266164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=GF9pzvUWBASRRa8LqGY4AL7HJbkl/4i/uB2T8V7Xmhs1iqEtX9xmif0is2P/AMWmdo
         yIqfj2aoUYX8Iec+WSTht4k5sHIXnk/p2Yh0a3Tgzo9Jl0L2ttOH6WCxyX0UOmXvLnhw
         nq9sJ8JMW1Qhk3L08YinGecumKHkwE24kBA50opjeBEAMUa0RNG30TsZhunejc63h6pH
         sEDBap+5RI8kbCvoyMrvwB4ymcCiHMrLeo20D/CBoZV9onQwxYK2NUsOW7TCIsT/0f4V
         jg7JCfoTDKJkUbGP+AIBF7u6+xKOUNg56Y864rFKpa70YoVBCmHPQ750s4jmQJgg+PSR
         pwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661364; x=1793266164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=k+13dfVAIXRopHustemAToef6w0dtK6bgHARZH4mpyOLVSLm1CIFOA74Ys9/K6I36V
         92hU7zxAsNUPv8zr7ngpuU9QZDSk8VemGK8Dk3HnsDnXWMix3Qtw/MDblkbZpRX3H5OZ
         7gvPTINLRsSnF7eqplwdkVJOf9ujT+ituSwnPeLX31RO03+9MBoIIQNN3YwJzoHkTTga
         SLdBS+WEuBvUrIUrVLaNJUJiZ19hyH++ekCHTt2FxJJ3K15roxEAn1mVGwJGS7Hlr8si
         H/wU9JNsn6CvvLpFCzzUbzlvVPCiyn80due047CN+J+CDvl0tFUChF7+ewslDWo77Rng
         N08Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDcE1VwgmAF262OFHespU/5Gik4O/sF6dKbLlFwDs6+fqfxWmcCA05llylnqJcmT4b977rZ0eALujthK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo6LXAub1HnQSLVYKACRVsIIZJdgwiWuGx4vdanX80yYR3Zfn5
	+4DdnIgE8IVPKfw3nqEsCGkOpcI9wUbuT0KBD2NZL4TUQiItkxIwyxqFriURLDPOzMTv12W5dcC
	c+jnctuHCA3cBscciFWO2Xa9Wae8RXVZxZlECTZxjfBSmp3ROhd8SS7Ahbz2qw6iB0hk=
X-Gm-Gg: AYBFou10iQ6eok5oYZiSijAotlZfrbuzqYV41WhZ3PSYtbb1ib011KskM+tEh0RWXNr
	wmGZBZaaukuXTpWY21FfygM7NSqAHoCSnfexEEMGXYuZLMNu52cJbcCiowOV731dk0OsUp9e4WH
	yXadRwzMwgb68BmBTzmwfLcEsiIzKL0K0i5+4ru9IXh5F8p8oOaFmuZ8th79oUlUeQcqJxppAF5
	3rUFteSkSTIAU0z/ZhMslJOcQe/EWfXjIwjjTtNqPJiZXDkCW9Sus1cwc1a7kpJR2QHC/mBebx9
	CsmuZbZFIGU3JHfp8XDrpYVlJORQH8no9DinpdkqIOO4XhA7tcQkdmi05O9mSl9CaXhz+ER7URR
	YMgQjUGEmN1OVCINe9BjmhA==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994611385a.3.1792661363762;
        Thu, 22 Oct 2026 02:29:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994607785a.3.1792661362985;
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm87380366b.7.2026.10.22.02.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Message-ID: <bed18f22-ee37-450f-8b56-d3f21b85c3cc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:29:18 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
 <3bb9a390-3b5e-4321-a25f-77e4f5c88f9a@oss.qualcomm.com>
 <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jeUH8tCSatAscel6s6cdBNgEi3eD8mye
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX0uTTiikKDtU4
 43EpeSypcLnD1OktEeOAHR1RrQumogbZ7DFPr4DpqrXschi2Zvv3gcvS45KVizzfUMsuKh65/fH
 6y4/mK5nWAn4X/snnbPmz7UOBX9tFZA=
X-Proofpoint-ORIG-GUID: jeUH8tCSatAscel6s6cdBNgEi3eD8mye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/ix1pSKaT2w/
 i/GeXGTeoL8k3d7fSNqod4wB9MvLbkXf0cX+F+figZbHJfufQa2Kv9qewocfKanGNDyOM54Jvud
 2ZkSboJWF5hxlg6llrzZ2Kj5NRC7lE8GSQ9qgl4xATxiqn+TS3TuNhtwrer+yyPFZQFqEXU5s25
 mG2E66r4YCsXItRrH1dKdmODi+Iv/xVEDwdchkKccJufz10s3pod4z/PmLYIPipNEAKOIb40Os3
 9r4tzPrT0pGfxyxVMQV5VJQO/+M4zMM0VyRTVdiOEFWblEKVgSBeZ80MJjEgCNOSta7WWAd3il8
 Wwj+ogUlYLWHTHxGBfAGPTXBz7brYgziOnkks5NW9wYHHwPMJfm5UzDNfRPP4pG03j+q2KP9yr8
 s61KuCyiGwPMNIULvo/ies6CHg8iBhgSwg1q6o+4kQVrwm4AMvVa3fC9PZ8t7tUTLnH0oCxTn7R
 NNsIZIYiXXXEdp7vwKA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d774 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=XKtpnFXEKgIDAPG5UdAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220037

On 10/20/26 11:11 AM, Xilin Wu wrote:
> On 10/20/2026 4:27 PM, Konrad Dybcio wrote:
>> On 10/9/26 9:55 AM, Xilin Wu wrote:
>>> Add initial device tree support for the Radxa Dragon Q8B,
>>> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
>>> SC8280XP platform.

[...]

>>> +/* M-key Gen3 x4 */
>>> +&pcie2a {
>>> +    /* Place ECAM and BAR space above 4 GiB to accommodate large BARs. */
>>> +    reg = <0x0 0x01c20000 0x0 0x3000>,
>>> +          <0x0 0x3c000000 0x0 0xf1d>,
>>> +          <0x0 0x3c000f20 0x0 0xa8>,
>>> +          <0x0 0x3c001000 0x0 0x1000>,
>>> +          <0x5 0x00000000 0x0 0x10000000>, /* ECAM config */
>>> +          <0x0 0x01c23000 0x0 0x1000>;
>>> +
>>> +    ranges = /* IO (1 MiB) */
>>> +         <0x01000000 0x0 0x00000000 0x0 0x3c200000 0x0 0x100000>,
>>> +         /* 32-bit non-prefetchable memory (256 MiB) */
>>> +         <0x02000000 0x0 0x40000000 0x5 0x10000000 0x0 0x10000000>,
>>> +         /* 64-bit non-prefetchable memory (3.5 GiB) */
>>> +         <0x03000000 0x5 0x20000000 0x5 0x20000000 0x0 0xe0000000>;
>>
>> Please drop this change on the board side, this is SoC-specific.
>> Likewise for the other ports.
>>
> 
> Ack. Do you think this change can be applied to SoC DTSI?

Yes. I'm not sure about the extended ECAM thing because we seem to have
never moved forward with enabling that (oversight?) but in general:

PCIeN	|	base	|	sz	|
-----------------------------------------
pcie4	| 0x4_0000_0000	| 1024 MiB
pcie3b	| 0x4_4000_0000	| 1024 MiB
pcie3a	| 0x4_8000_0000	| 1024 MiB
pcie2b	| 0x4_c000_0000	| 1024 MiB
pcie2a	| 0x5_0000_0000	| 4096 MiB


>>> +&sdc2 {
>>> +    pinctrl-0 = <&sdc2_default_state>;
>>> +    pinctrl-1 = <&sdc2_sleep_state>;
>>> +    pinctrl-names = "default", "sleep";
>>> +
>>> +    full-pwr-cycle;
>>
>> Hm, is that something that comes from the controller itself? Should
>> we advertise it on other SoCs too?
>>
> 
> It is observed that the boot firmware can leave an inserted SD card in a state that makes the first Linux enumeration fall back to 50 MHz high-speed mode. This property allows the MMC core to fully cycle the controllable card supply after voltage selection so UHS-I voltage switching succeeds reliably.

Got it, maybe let's add a comment

Konrad

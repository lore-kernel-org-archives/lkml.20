Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AD755C307
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959800; cv=none; b=imdRZ34534MXmTqMaTfGPWzY/x7MSvVZKAbzB898puq5lpfJOu0Bgs9hHuXHzfDg6R0NgPKxGQzZeTXcONdCTId3sPxk5OVoTTez2c3HTdYJ9VzCcIFNsUWhpIRK28VUaQtb4cMDhp6c0sYFtFCWEEbUW6lo6pjnwvp4g394ILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959800; c=relaxed/simple;
	bh=iXyqVSWvmcW331rAsdNhFo+83AVBlrw5mw/55ZewwM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiYRkqadBtJIf+m17fIjNl3ROI63lj+728/tOm0dUgifV7GzPyBscu1+flWeIOtK+YGhiquuZOnpTvBjw0DdmNLJR+CZ51n5P2+VDhVySp20kJARyqFkRvRaMk2I7MjuxQgsZC/3nxqZsMNverFT+eCmdTOMffyqY667L2jVvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsFEBh9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RybqNIPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsFEBh9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RybqNIPq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoXFl2698594
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=; b=JsFEBh9t1JX/nXmN
	5VuC1+yMKMrqmIlfarexpHaROym84F9Dsg7+UelBOay5JJFkHbgArMeHxhRvGiNF
	phK/vdWXHnPRHW5kZi0cAovhgqNi0zIktY160VDTLV1iz6zLI9027ewPhncNQ49i
	tVwiC+EufIqHQNx2oL+9eZdOyEpqcJtFz37kGUWpVAlpkasGWYWejMzMYIyZ4n2+
	0tPJIeCx+YRgbPYQDRr270x/qwC0VHfIIuulf3ewVKv2+UYRm2ntMxGCL+CPN5ff
	8Mf1cBTHFDTPlwiLWXYTv2vIs6Pz1CYlGYSeSOhV+G5zRxC3+4orlOMTDAOVl9c5
	FJ5Yww==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0adw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:16:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c665139c92so144417e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959796; x=1789564596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=RybqNIPqhuBqGZOEXP4WRBIIyF3ifrib03AEt78stYtw7KQJ6580gYPg1ZpWMV6UDq
         DdOXC1/iHsSQye+F1zgt9Ss8ENNOYoSyf+jIT9J5RQSskw5aW8KrQBGEEtseqpf5NCeC
         LvB9F/3wKSiLbUuEutX33AMz46w/lxTeSxQgmiYdX8SWsBIV20GPv8N6tgd+IySNu1RU
         FAv0TwkqTJc40LkQEIcmREaM5c5KNBl8y3JCJHp80KS/jJKgXXhgeuKuRWieN+dn2Kh3
         v0FtlhRV1OtUpYeGP0/kNh6LmUFirIdmtt6sEYxIHjJ6Mu+UaPa+sqeIpgOLtkQQbxeq
         XOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959796; x=1789564596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=o8saFw8jfL2k3nKkTmdrvL28dfzdoz1DlSYOXQpp3RRyngXfAbMi1EilSmZWdAIoc0
         M15YUc2IZ8QZWG7kzf8KH9c+CaJjNbaNI3apI2CVXgmK/Eorlaary/tNyfK62iMLB+EV
         lXoGfex3jdI3DCKhM3iZ5noBYSsVW110QExuByycFG626GxqVuwAcXNCYt5f9WnoskfR
         +UoB2Un2HyZDdZXnP/PLKOGM5+848kvVGLUfUCuvlk58+y+Jh5ti3xAC9ig84EBBecAC
         /NEG7D556LN/5KRg2K9tU3Ak3ELat2rFyZwyzziFHytHrOgWvYvIe9uy6XDn3lzaAVkh
         sZyg==
X-Forwarded-Encrypted: i=1; AKwUvByVRGHsP1EyIcsFsRuQGxP76kUErC4FSzqVuAsWwn86994TP85NBZutH1q9vU9lSOt6IIgvobX1KfH5m6w=@vger.kernel.org
X-Gm-Message-State: AFuF++mEXK6A21I/23MX1Zrh8/qdHdfoT6ELYMellxoJ+xm6r+iCB2Ht
	J1wPX+Hvz1qFWRunyTQaWc74V82OFnxcifJI0o/rkJsHtG0XGn3VNM3rz8XpMUIXMnbxIYf8EV2
	lfOZsdSq5gd5drUTdlf8BVmPf67hSREW7dCrUIYSSqiVWicjMTZoWoRLFMS6YGcsfOfk=
X-Gm-Gg: AYBFou3mkXFckfvqvHlxABxX6IISTgHzgDrTzc9HkqKRVaB2WdrIXqzI9Zl1sqGpJEF
	194DaXi/k88dw3/jLcIUn12YTXscmr048m4+M6u5+6RCGh44MP21pPd0tUdmMHAVAcy2U9Hy618
	IuiGIVu7SfrxY1iCbJJaH00MhB5kjaJ/HoF5VGJRvGh1ZujhhRQxhNKzGDZAQHKCZjdF1tdtjrQ
	zC2kBiFpi1Plb/vLjiO0nib8M7rDVk4B6u37zKpRKVtYqkQhERO0A0LQ2ExXQzoHUY2MKPM3EAH
	RVQYy+XCmsuIWFzMF0TVbrU1izIvd4fqay+UTuKhFlC14ChUO75DwJSZy8NMvkxurZY4TrO5iTg
	zLX0JzWtIs1vWSr6JeGpfUg==
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4812494e0c.2.1788959795491;
        Wed, 09 Sep 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4812434e0c.2.1788959794996;
        Wed, 09 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74d55a4absm3280227e87.50.2026.09.09.06.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <062d0fc6-dcae-4636-ae95-c8144317f0ff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
To: David Heidelberg <david@ixit.cz>, Paul Sajna
 <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
 <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX4BDxz+QIOq+b
 dg420ju5KzY6NSFEhHjxB/lIPKXa/5y8NxnF2al0iOA8otA8422dbzBkulIoryieDr31rgowIIv
 kgNCweeTZuysaMr4M3dpkIxF+11H0Fd0QKX0p7+wf7z3W5zGKPuRW/KTvWXFofaCHYoQjyHpe+2
 HmDH2ZwEIFOVva9hjXCl88Q0pB2Bs9wn9z541PAJgksnarKYHEYXZKgcE0SPFYuUTnqUmGlqDGz
 ABp5lks7n3xhE1VNv7I/IzUfktu8S4zGkGKnq4f9jLW6DDU7g699uLnS0tWfT64MVAG5gPvFjWS
 8IS3shoOF+0n9fy9ApP418W+Dm+Cm+HxMAgle+fXO/Yf8eq7I4zaiYzRMHVjifOK25mneXitf0K
 iyX6C3XYd251FLsNroUQd/ZZNxT+mTAz2uicp+aZDpF6nCPrrJ5i/qbowtXU3TimCy4iwzxmNh8
 nLKCcHchvrasFl/yhcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfXz9ZcDtYMLprN
 sDYkkvaKjHX33zxgGtmpbo/q7r9383GOHQyM2r3zbxKi0PLzBzOfYYBhtOkBqT8/vtU7ZwxNJEA
 LfOr5M0iWhUA9WQKmaEeb8sgx59Xev0=
X-Proofpoint-GUID: R_cvr2LJGh4eypxA2f06GgU0AVMLrQqm
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa15c34 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=DKkjQw_Nfd4kA1BEE-cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: R_cvr2LJGh4eypxA2f06GgU0AVMLrQqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090149

On 9/6/26 11:32 PM, David Heidelberg wrote:
> On 06/09/2026 23:11, Paul Sajna wrote:
>> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
>>
>> Downstream dtsi for reference:
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---

[...]

>> +    nfc_default: nfc-default-state {
>> +        pins = "gpio12", "gpio62", "gpio63", "gpio116";
> 
> here the verbosity may not be bad (device-tree functions as documentation too)
> gpio116 is associated with eSE NFC part (just guessing, but... it worked before, so), and generally the pn547 doesn't need it at all to work.
> 
> TBH not sure if there or what consensus is here about this. The eSE needs it, but we don't have the driver thus also no integration with NFC part.

The eSE driver would still be acting on the NFC node, right?

Konrad

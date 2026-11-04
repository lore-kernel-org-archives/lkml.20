Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781458;
	b=n3JSfSMmKLQaABdiE7cskdfTdY4hJj4G3QE4DwOI/axUV00bu9yRv481WKYcKMnOtGD6
	 ymFeFyXZZ6O6bkLVxgRjUqRw3tMTOp/xCtqum/qGu0SfjpMeJGmpGuocL/JwDOzwN1Hd/
	 XsNxP4tBr8xE3pb4N7moYxqt6POT80GrWZaHOAGh37v/SikBpd4W8Yrx+RYmWLcMv6n3L
	 4XLcWehxvHgF2TL92KV12tEONzgVGqcwW+8ZdtjbCZpzruEBoXLhxA7/yr8MuiARd+RH9
	 mf/Aa6MRTh9AMtTiVVmSDod85OAyWMg9Sf0wZ59c1KfKdvPiQAmNkC6aS4yxTpL0syQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781458;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
	b=GZ9jP3Fqv/KFp5KIgNpCEltUR9Q84z58V94y3FS9U0JjkM6GlLXytU5bLEXB3BhDk1rv
	 wdfN4vYv5n5FSWQEq/HrbF3JzMJJqz/W2LE1hMO+ku+vjsnMsgGWH++tWNVWAvHFpWSeY
	 FK0JpSTQiPbNNEPmFGei2FyPxs3eHXi5bNDD8e3Kd3XS1NxwbZ18a0P7SAL8o3l9rw9lG
	 J33iFDPbRAIjKO/DLG/0azsjujJtgFMeYJqFPaiOWjSUZPrCp4/BDiqO7DR09T/CaHYjF
	 mg88qeKooFqW5+1prQHUn0EmEn+wkys3eZChq2C9qDFNPJ9XP0+LrgVLKcgjSkzJMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5741606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5741606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48Kf2P1263960
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=; b=ZklL7L7ZCWzQ2sZv
	tFpS+HVTme9ImWkasA4By92hM/ckOxk1UZQ8dB8KKqny2rV56YPm02nuXkapFpa0
	/93w5AX3YB6/kSHOCKGY5PMWQinMs4bkaFtqyLBeykadLqLEb+0GHIvAN4/XKl42
	7maxi98XZ4EyhRQc+FU78lpXJr//wyijsjg8MJ2trwdY8N9o3d5RJ8rKw/TUYhfN
	touLwV6tCFBe12u0myVNKQR2g1hIOMZBpyE5Jhu+leDxLqJSWcbAdFm6J4ihWtLx
	HZNV3xfDGU9p6alhIBG+iplWJVDNRx9hMh7P4NMH+uGiFC9OmsYdeEKEshaHsiR1
	+N0GzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubkngt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:37:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso1236241cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781451; x=1794386251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=SR0beHqpbclrsxfec93AMxzw9QKXVpjS1WpzP218AT5Xj97T0x+G+ypmj3Va7cZ1kf
         ZLgqtCK+apakHbojRjXVq2AdVQ2eZy7YnfL/XyyJQgEuFkAup5HZKe65T+KaGMi58ouo
         oOKVe0XBEKHuo27jOimkkcS8+vrv65ABsmRNyDDkKvbygb8MxlxCmm1viHvgIpu06TxX
         y7kvH0OjSsDp5pt9StUfaYprediGs5fDEwf/z1pXcr8wXRbKfAOrCMsjL7VkeDGaLKFg
         u78OhaU+74FfVgF90IIg7vwee8Eu5cKIx7yh8L+o3K6cTCktIvl/+/0c/YHa4cIJ2SV+
         K0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781451; x=1794386251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=Z4ZZWdjlVgWoCtPU9Uw2fasCUWX1vScsy/J7/ovJMrr+ZwFqdIdj23qPycRftTO8q0
         ULCH+Ozqnq6vJWL95qzzIAvzj/0+UecjTE28TpWP4bM0bABcVamE1puKlm3b8xJAdeVK
         vrGIvty1/0lAFaopdDabhk8cmQTAj2qc4o0e3TYMxvvnNRDYQtPlrxnXgojcPvkIO3mA
         I6TPkDd4Hinaw3EYy8NZe/5P2fh752emWe2fdlqx+wO84FLqyHja5ARijP034CLd08Pc
         WVcuqjAlRuFqjbNdjm7u0GvfzvJhwFWvoGPlHo6I3g3jyJvS7Xm7ojJl13F45peE+uay
         pnjg==
X-Forwarded-Encrypted: i=1; AKwUvBzHl7U2E2eYL7QfsUGgMATGd/8ogTj75NpNOvYkVv4IiqGEY6RM2XBETFFx1T2owaYwtndjdF+N2BIAK9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DbSUbUrXV+S2tQz8mQhMVZI331em4uVpCeFigoR00oLsdpZw/
	cZnx/f5+HYuh0Xt0bCgoEmgVM/+NUvUT/Qh5jjJgM6siqpoPPRem07m4WLSZrbhGBNKvTmeFIub
	APRt3afsedRmVOj+A1C1OfjmuxbMWsgtsUHtsMqVH3e9Dr0iEqtm1g3Ox2au3z7hyiJI=
X-Gm-Gg: AYBFou1TN/AtliQpkZJJz+x72hrukc6px6aPB4zFFh/fA3BRZfZ+YOtm7z/QshCRlat
	ZcTDI5NTn59SLpHRl654Ro7EwW+5Mq9I2/o9bxDtfo+cog/+cJ3LQk82sHDKCmVRtiWrp8EGMNg
	0COH/OcjL/9Y6B7kaLUYBiwfZ9MB78hxZvEjQ4dF9JBESB7OdF5S2iEuBOkpSPAHKVA7AAx4VyX
	uwClulf92ns+J4Hy5fnoyzdTgLE4lWBvd8QU2ZiF4cAbofBRVB5CjPVAgjMqt5itGP6w9aTVrpa
	xtwSlLhl4Ow7aScD57bm+9RemPxupt9XCjqtd445vm+ulHnS6DURYzhiahjsKwXe3sJH1lD7V8Q
	KvU4cVMjR2jt00QGU6MSHgTDcHyQXyIT7OrhQShl5bsHLaegdc2UNLTEyz2+FuBQut6f4
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481150785a.0.1793781451213;
        Wed, 04 Nov 2026 00:37:31 -0800 (PST)
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481148285a.0.1793781450641;
        Wed, 04 Nov 2026 00:37:30 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm538339a12.5.2026.11.04.00.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:37:29 -0800 (PST)
Message-ID: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:37:27 +0100
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
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aursRfQRr0AOL1Oi@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX7AcPF3u4by0J
 MIIZO7sytrsnjoQ2pfUIPjVpSh6pMD1ADlDMFYT/9x0I2hCAeNih9BqOJ3/4kDsZFpnFM7JFqH6
 FBN+mZSemBmlLV264Addc5JtWAIVNbE=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeaeecb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=iGHA9ds3AAAA:8 a=dNOK39mv2ItteVrz7R4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: j2kKU2JiLmj2x5CMp7f08eyJF_VrkLie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX9YXN7L4t/pm2
 tmiS6ldd5tTw3odC7QgD69K+xUFHZRgZGd/eVyS1oH7MblxKUPvoPMtNUvYejeYSg39LUj4xT8s
 c1XeAS632H8tRmb9jj8ufM0li4xwXFlkg/iDWYg6569X1UKlvJymJ2kpUhPeretdG0/MjQwbCq4
 +KxRdICz7WPEjbsgRFZFgpwVsEHPyMLGdKPfKYAH9PUXKJ+1IxN3kJYrjAY6bVxTfrK8xHpgIui
 pTljeks50xXNdrQjtfDA49SQvSIR+fBemV4oJp0d9MpumY6DF3Lwkhr0EX2ObGJm/9fF0otBm5E
 GOseMKp1GvUDy8eDAP4rMYUjXpiygE14rtl5zIkF16GE8H0f41LNzfQVZpZQxW3bG/1qH2w1L4o
 ZxPvdt/Yz9CEUREFyKBsvKbRW6JgloEUn29eQ0gP8wOSkLFxAyomMeKSGIGGYlU6UMavh59JWoi
 YBVdm4OO/Xem590w2zA==
X-Proofpoint-ORIG-GUID: j2kKU2JiLmj2x5CMp7f08eyJF_VrkLie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034

On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> yocto kernel maintainer Bruce)

[...]

> With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> in arm64 builds:
> 
> LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> 
> In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> get applied in the final .config etc and one of the checks is for dependency loops which now
> fails with 7.4-rc1, full log below[2].
> 
> To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> now can exists in the kernel tree.
> 
> Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> loop to and from LEDS_CLASS?

https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481996;
	b=hygOMiAkBgGZgRy69VZbe89FrwlK15fZJCLreTaydMCg/ARzIDieUo/q7mxqRWDfNxSw
	 kPAN0n5NFmUYfmnhzuV5SpUwghEGRRg02TAQF5FyFtH38eQHttlofAHIuuKPE/olNmDqI
	 pVBbZNz9mMwAr6slrSxnIYsC+6o2m2oryGkcTjzRlKniB9z4k3rPi/1XMdCUv4MOdPS/K
	 vemDpq3crpcUhhdUqSdXL8Vf2yF1Oo3GXUr8TMAQnoKHF5915h241cY8AM6vSJ5FShZXc
	 QycY0DE/n/qyX3M+M2hs+cIAU0EUVp9S/AA9EbqNt4zPe1GBBWZdcg8kb3Tj2ABiDcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
	b=RKMUSfhny/06FH97+MXQDofjf3VN49as0ZFaezIglzvf1auRFct+HIxVXUZ8oxpwjeyj
	 hecm9O93ApwYmneLtKanNGMBnatz+QwAlWGhCsbAy1rL7HMCZ74TTU8ibk74dU/ayLXKt
	 djZBKPDi9HbRz+9yXLXCct/PiTZZSfyzGNuaypGcMwoT+Ke1/UEd59z59WaEXHbELXtXT
	 NpxCuZdjUkJdtw7y9p35FCNL7v1ZYJu12bj/xdTJwquhWos6ueLdkuK4w63x7LYSiJF4d
	 zbBf8nfDCQmljsxJQjJe7qvTkqGizZ/tfUHQZXAc43RqKnoJdmA/3+IOZ9Ak03b1C/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yn5gVibB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332F606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B332F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yn5gVibB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIjI4031740
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=; b=lC0XPaJz05GRIrQW
	n1H9FHcfsHzwjpXJJAkuLznQ3BULE/Oxb1MfCFyTfZmlmoLWt8gFqxe/NXJY2Zf5
	j38d8UJqo7WhAax3DnSIv+ltq7sA/D9++ecjqKF4u+ZIxqSOmkwlrq+piF/RfViD
	PTFLxopqD3Pqp+GoZwTJK5SuFwqzNfNhCgBujZxwiqBbHNJ/WGhf+0wX2JMKWcon
	FSsgEm1mYTmw3XcA4pguyo1eWHJlVKhlKdVA1Tv8sebX+dBoDfOoea5u54bYQYJB
	ipeoAagYLEoBsVavwAXGGI5yKpyH4YWyilEtgYvVCdcePYrWsoZ5hvpte0baZHmY
	EXeVkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9d28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso56149285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481994; x=1793086794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=Yn5gVibBEkzPNoBwL3/U+gk1g2SsoHN3gl5Qb148uJ59U69B5UMsZj05dASOiSoJsY
         E0vJjRWlEeAr+d2mhApY/wiGijsTDhHTc+NV4yGASHfAXtZsNKDYQVMB0efIKEn9GXv8
         p22WZUa7gz0yrD5iCclp03JlAZweY4wlulBTxSYMVYRuLIqIZe9tq/Tj0150OZOGmHJO
         Kygm7iV/r+S4T+GYS1XkUJ6W9XS/wu6n9FuHITwhUoiT0yWALI4A6qhB4p6VjVV6g3kz
         lI19Ib7ZkU9lCgWuliZProu8WpV/OkVscCSWn4m1YnPuzBPrrS/yVahL6ObxCZxgATfg
         05yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481994; x=1793086794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=idpT/S3eLG8c3NzNP5P1W6ARwx7eub+A/k7rxPEY84R4P0M82rjmi4CKCG0QPMIE/K
         dG/mRJ1/UfWqroExO0wddiUgEa+YZlBF7WAt6yoTvEFBiFbcjkoEGrEPUDvlWfSxP8tR
         B7WbT1YJ3Wkg7aqBgtpUQpP3lgCt3GkrHtPDba19KqHA+Dap8T4FylS+fbvy32sPvogk
         9cIPeU2L0vk5isYQdLvLfZKUknlUZUMa3VHttgivu3Im14iIZsPhzmcVhubEriO2kxmu
         7NL23ne4xO1qRvodkhTie+ufSRThmO4wYsx0MMqlR+90p9zjik5+hkyQropGEZpcmyl7
         TNwg==
X-Forwarded-Encrypted: i=1; AKwUvByjgUbhRn865bJZPxNhOzaSJf94SRl3DAzTpGn0XXqYyFAu0nZYdCXPrwGqPYUyivWsMY2nymdeKujfwUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJegtEYq1COTWp4kIJoZtqaZIAHhTOjHi1w/IJuEeI4Woflspht
	VCrhiSjqZOXcpmf84vfV2H/+iV556N0w5e7KEk+F0uAIhCCVGogC71owgB7EknPeTAfhsgFW9tR
	omUpLo2x+B9N1fxTKPaUJAgzBcoGkmpoOrAZpVzW8ajpogTp0EILLVkWhN8Ia5dowO24=
X-Gm-Gg: AYBFou0b8n/dh+BucUnAJUErlVRjwKxqGnpO9pxVlJdCL6sOum+G+Qy+dWrYKhdxxOR
	8HpoJB+Cr/eoHkXQAMfc0mY3sOsBgVbKbccq1m4WgXnXG9uGJnM7v16CQKh0qnHDDpn0f+imEdu
	+UYsTN8m1u/Njjeqx7NygUdrSMMaQ6dcbCAOG3aoN+WDVmFM0mxO4zkYh+eEXjxWJpvAwS03xKa
	UWmYM71I9OUW4gBes71N6HNJS+HTfmy04fjups+n5oBjDru9pRSnSVhMgtR0XYIlxYXe0HUrPID
	0T5+Vg8P5VP2VdRUF0Wvcz1pBu3DfOTKDp7jILBNH8r5/XBnEkhfayCJ03KB7yIjrH2gVWF3JvH
	CTFbzhHmRujiCVJ9PQR4Ivw==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772976985a.6.1792481994012;
        Tue, 20 Oct 2026 00:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772975485a.6.1792481993572;
        Tue, 20 Oct 2026 00:39:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm4978138a12.13.2026.10.20.00.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:39:50 -0700 (PDT)
Message-ID: <491df02f-c122-4349-ad6e-c27987290f73@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:39:48 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ixsAD2LOD6v4EtxxHZnLI6bPr8q6IXze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX80uh1Xrywqcq
 dIZMjKT0xRA1T0n1t6TykCFpEI8f2CDEmr0D4FsVSCRBgm4aj6J+9BAkxrIg4f0n8C17+ZlU5MS
 BwhuT2anu80x6r2rr7JO/7bGUyMHx6rVU4HVgPXZL95mqCPjJc4nxfx2mij8zJzcIFl/5BCv/u5
 IEVF76EBxFBlLx8SXEimndwb+icwDiztG4RMCLe4VaekrHv640GEHg0RUnPlnV0xOocjOh04/52
 OXMGSK5bGxm/oss57Hs1gD++Lsek84aX5YVpx7NMnrQr7lqINli/BA0/ZZtHFAvhau6PI6u19Fc
 piabgkZyk9nEpOxOtNdAQYqFZ1XP0xbMi3E+f/Pcg3+a0ThgPWfpQ+50iDwZ9em5z44s5scG8mw
 5H9hu7WpNvblvicA0Z5L6HUswr5InvmhVntVeNSkWLmyGr9xnc/gb3LznNfGVv4KSiB6Vp0adI+
 3Jd1X3sQ1yQjcgdLYXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX9FZZPHZvlLZR
 syBuloe2DXvSqYJcuMrrESTU3crnTEj7/TAYYvyu3IvKyW4T5aRhaL4H6wNUua2NHWg+mNjv8Es
 9H1R1UwT4uCmsdUoOoKNCRh2SzUMwCk=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71aca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0dpjz_nAn25EwL7gGyMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ixsAD2LOD6v4EtxxHZnLI6bPr8q6IXze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

On 10/12/26 11:45 AM, Akash Kumar wrote:
> This series adds support for the Cypress cypd6129/cypd6229 dual
> Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
> handle usb-role-switch, and wires up the corresponding DT nodes.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---

[...]

> +&usb_2 {
> +	dr_mode = "otg";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port>;
> +		};
> +	};
> +};

Do not redefine existing nodes. Do:

&usb_2_dwc3_hs {
	remote-endpoint = ..
};

instead.

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655236;
	b=Y9mjXE8yQeHDtNISw5IcCjuY1A8i2ND2zZRmE2wKs/nTowXwrSFYvH2OHgf+4UkBFnCP
	 xanbhuiy53NoYj0VFv+H6kLN8ozaLI+W4i6doEoUGmv0Cip0AVinPdIXWHMyySVKTZt4Y
	 qo8CPcw9ixDN6OHdbCcHY5iWdJEUwkkOQlZb1AcmO9WyJMfz5BOuowt+dFonC/nGvixky
	 v8/Vo3Dg1vv3vOdkVvisqVQOCVIsRW5sxDrFAxKUP5JvD6PUCJibqQm46qg6tGXn7Tu9W
	 evBBU4r+wJL851aKROf87rU3WCXZCWRh8l6tWTo7LgHpTZTbdBGj2AyNo2vd/aE89jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=;
	b=LM/uwEckZ3qJ0rWyvDZmLkR1VqYOdhMOx1sd9ARlqu9TMi5P4EBtH+wf8BJtwEJS44sS
	 Z8alldaenRkBa0kAIZkBlVvgfb1bYMR49SDmuhecmMNhGbX4kJyZk0QOilAltLmYb+t5R
	 C848VHbM13hFyewWkJmymg5go5ZWbTtfmpRwg5v0gTV/7HxfIv+D1PCYPQGe9P/yWqi8d
	 NvDwbQkGWIx73L80Xbgy4QNJGEh23+9WdPi4vmEVL6hJ7XOAQlnj48x92EWHTqdpPbxIX
	 ftUpc8oDAMD2DjwjFECnR4ceglp1k37q0L03GMzqHR1xWlncYqgXshP68nm9AoZ3b1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgKS0lJl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evfGega1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F43606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F43606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgKS0lJl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evfGega1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Pxl2971590
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=; b=SgKS0lJlKQqiBAZj
	GY7B+4+vQ1XIAXlPskPDYp/gKq9YuaFSHb0Nn0Z1mGwpgl1mdy/HpeNumCzh9COE
	zuXugRZ6TIgXdepyH2vPSW03+ZwswgVkiAOmpovD0L6sWSKIgnpERp/mdFK2xmUA
	K2uw3ax7JbXoBbzpIR0QMUp16Rc+yJ1P5mTUxYV6245MLAunvUVZilvUCyPdtUJU
	iEB4f0+J7uXegrf+SdA4zldhsNlt44sB1O/zCjXeqfT4IHE/4CkU7qnvQS35KvJA
	jEloCQyu/wgXAz9KwcbpJ3Ry0+CcEIebKRxI9H/3stvHVfrMBbLRUbEDZBF/x/L9
	awqGCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2nkyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:47:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530cd3dff25so2465681cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655234; x=1793260034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=;
        b=evfGega1zJRsuP6b/r9lPkhKvRF0SHzibAGGqVuAEWjvpWU6lUz/BfvZ9B4KJFnfWy
         e2cawJR7vybHg/LazvJJhZXVnXpDvRa96jE8TsXYowOXHMrVe6apcbWSN2feDeF41ePF
         ofPYMeCLkmurnu0HvdAyePEJ8TdKpAyhPKm6K/2E8fD8ouxg6OpoluA0qFHI/gWlFBTQ
         SWuzBUf/tVs3bAXuEVzRPVi/0UFzvrJ29VfdP+j+RlDhe262uJ7pmhDwZuYJYLEIFKhQ
         pWIoeuWQW7dpfUdog8UmCCQstswwuNtPawzmlNrRIDQetGuUVsDrfIoc+ZF3Tpd6Kkd4
         Ph7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655234; x=1793260034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7UAW1KFyOtoF4BRFTDjluqDlRf6MeW5wwF+NAAgNHA=;
        b=1CifmSwQE2ZA7qynnnG0T7el++eNSTgr/7UJBVa7ZxY8bvoDNnpyFsUwSGb4Pwfz0m
         y3ldwyZXEjL5zMPsM+HjaGrBB2QoViJFJXgPF9ybhqpSlXy97c9f0p1VWvRtVAonBqLy
         6jb8E42K2PBFy7V7qBIIEMw9/a95CP+IIMDXZ7PS0J7clv5fEIQFaD3AVA4Y2egsvKgH
         rgSU9DjJgK1szqU8iT/jQYpfeAmB5J4ePZ0KSdJK94sjRwXZj3vatatGjY/0x1Gmmdm7
         O28HC0/6wNmnclcjU5PH/MwkOvRYf4VDR/EJUFoAWoRrmZKgY3kHcpRg7H+8twJ8gMGu
         mmZg==
X-Forwarded-Encrypted: i=1; AKwUvBwrSv5gz5EVHkUOeKvuB5QEN4eUT/BsN2jQhRS2iX0F8K/vUSWmEFT74RI+y4k1i6lzVrB6TrSfLoQGWtk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ062msslUlZRBW7hsj5GXjDNlaW9Cz7kMtZwT+mAiFXJMGWdwo
	OhUGcs4E1eb2uZLX0vael8NOrKf7Pt99uavbCrXcy8I313QO0an0amPQBWBHMdIJ30GsLwpSQo8
	2uTEe3P/Q5sA6BLuq4/yf3DjNFGqu2RPTsOe+LWCO/aEVd4tiZCXz723nGJpVZUqvIrw=
X-Gm-Gg: AYBFou3grgLI67ktvn/THgsaWVDn3RasLMaqag25SPG+Psjr4fwHI7A5Oos+0FQ1pOE
	paglLSBlieq+Vf4YCYXsUiSukpkYTmQ5ZAOx01PFVQyj7mD++lp3++LyqPbuAmAR0Mr1LSKGxoD
	cEcPOUkbSAJ+Okdrhl2AH/z8oT+sUJ4cOVQyLCLH/lj8T4/JwNC2LAtA+U1uQ9op822e0QWm+8i
	0vTKivGyLUa5QuLXMr/85l044VQWCF+o8a20DtoiVY7w27on40UIK/L6EVB8OuWQMEVIPo5pBSY
	OJPN9wNL0NAlUsomq9iiuYziZQeEOLhKOxdNh8diVW5qaCQkdspgZKWdbxsSqlZ1FJbL+/ev+9C
	0TjzLNcF1+cYAxpxwqQ16xA==
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr61217491cf.1.1792655233871;
        Thu, 22 Oct 2026 00:47:13 -0700 (PDT)
X-Received: by 2002:a05:622a:a884:b0:531:2663:2cd with SMTP id d75a77b69052e-536a75ce176mr61217241cf.1.1792655233443;
        Thu, 22 Oct 2026 00:47:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50bc9csm81543566b.15.2026.10.22.00.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:47:12 -0700 (PDT)
Message-ID: <601fa952-3639-4154-96de-aa09cf5f692e@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:47:10 +0200
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
Subject: Re: [PATCH 3/5] firmware: qcom: Add an TEE bus based ICE back-end
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX9tCpHuTcm778
 h7omz+Uuf63+KClpVMQq17hDVO8+2SMcI4Y4zhW8ewxrVyL3jI2aGO6r6zcunggaVRb9XuMYqWM
 6S7aExoC+b2iHK7Pnz6FuojVW3ZnZKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX7+dIRmCsS6d0
 /8MqArqxorZItU8ICwRmZwPuESXwBk4GnDRUXeck1inaIXMAtOpjQTniJzsvLv42H1L2KzTik3F
 flQLm7I5JAC2XGMucai448wIWXVr3C5bZkLfJiaQSj7EDiUbUMhhWsVFLZfK9r3HZqbg0fLif94
 hBivpsM7tY4hsEjkRRyRmp6hUSobSddUMWHUmmG52qjkmnMbHuCyJnpbdLgBnNt+w4UpF5DdIRp
 PwzP0yy65IEUtU3ir5H1jxhnRYO4zJAPS2ax0Yb+xF76tH0rwk312/05CfKxfuiBVyDpGCcAdPa
 RcUEFn6S50pe8chazbrhFxXqY01YXtU8Tk1AeN3v3g/rc3Vrgy6puGq1zDrs5CgTt1P/9lcgt3Q
 ti8IS1UN8y8VAVYh29CeiOJSWn2DnsEyumj0AsHYe2ix+3uCuzSzLmsw2NYrmTRPkfL+J37kMu0
 Jhvok3NoJbvFcZ44V8w==
X-Proofpoint-ORIG-GUID: XmKMgt22HDRVhN-ed-a-20VUtZdb3kVq
X-Proofpoint-GUID: XmKMgt22HDRVhN-ed-a-20VUtZdb3kVq
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad9bf82 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7ix8c-dH36osfZYG5LQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220030

On 10/21/26 5:43 PM, Harshal Dev wrote:
> Add support for a TEE client driver which forwards calls from the Inline
> Crypto Engine (ICE) service (invoked by the ICE driver) to the OPTEE ICE
> Psuedo-TA.

LLM says: typo: "Psuedo"; s/an TEE bus/a TEE bus

> The ICE PTA supports both ICE Legacy and Standard modes. In Standard mode
> Hardware Key Manager v1 is supported.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

[...]

> +config QCOM_ICE_TEE
> +       tristate
> +       select QCOM_ICE_SERVICE
> +       depends on TEE
> +       depends on !CPU_BIG_ENDIAN
> +       default m if ARCH_QCOM
> +       help
> +         Enable the generic Inline Crypto Engine (ICE) firmware service TEE
> +         implementation as a backend.

LLM says: please use tabs here

Konrad

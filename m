Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8D4AB1AB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155337; cv=none; b=cCSWTED8QAFUl5gTbCFIE3Hy0BHAWCFnXhs2GAIuoHueIYO5xUAlUC+9W3wWMFEj8PlFYrNyv9htRGrUeo47YPoeqwitdmew5OVdaPxkDqwaewDToCKTxTHaRlvLGeaATPIfj404gTgHUPs2i+MAPeon7WoD05WXJ9c9x5C/GRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155337; c=relaxed/simple;
	bh=wYA6+QG4gqtKsAXq1l8c19NwZl8PIpQBydrd2KKUXEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7RZW/kQ2V+c1tCXM9qpgzF0OnQz5KPKWdnaii2Hf1nkLvw+ARjMD4ixW0q1KqtWF34s8eZ+ecyv+TxvNIP8YTY0dRzSRCzyNu3ZVHiUiNyXQzYPKLeaqbfWLZVPZXW3m15EmcN8r/+ZAFIpugo2wkMVzgh00xBTRF+0ZJfYR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPrvZbRD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDtpoK39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPrvZbRD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDtpoK39"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAvHOi1503918
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3YW7DvRD8yt6RfBklKs77Vve2cfD+JOKZ+SXC0k2aI=; b=JPrvZbRDIGXb6JGz
	3WVyb/mnYH58OAhTU6zQwLuA6QX1Wa17NYSkB1FpCmwmyxTZ0QWoYZuonkKkDHy/
	kVRL4lh0jb9HZ3R0rABNIaPC/U4qu05pgRI6BzPiqbocG2sZbKWcUOhaAtTDzeU9
	cAfLGGwVg5WKtlQqt2zY3nye0S0esCmHLzuzLCfmVePfMVbwkANyWKO2fUiBh1NK
	pRSIJybFladMyQmV4VFD5VeNrWY2PstZ0KPL6shcfe5wxzf+1Lh9Fsypda795xrz
	K7khOwhtYdCJoYz0xZ5jReywFH8np1rxz/5vBI0bKHEx287xXp2qGLoAIY5AuQdO
	WVB2tw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8ccc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:55:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso3662452eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155334; x=1792760134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3YW7DvRD8yt6RfBklKs77Vve2cfD+JOKZ+SXC0k2aI=;
        b=BDtpoK392QazckPtxBK8H9Kw0iyqcwKMOiKLWhc0wT2rOEiVdb+AvA9+EtV6QoGGFg
         cnJ5YCeMfQa+1+xhh1oQIkM1SJsyygAiQQAfDdq9TZRoKiyStUx+IDvx0XGytlqu4qz6
         MZW8y0odHQp6cLPIzLfzIEXlZZvi+4157a88ItKbkz4fj12WVrtMfzA+SkS+jXPd8IbB
         X4IBb5NlRn1PUq/c8Ui4nTeIsQ6i2IqGVJXo5071n4m8QXm6lalCMMAlyuXkJs+D0tr5
         UVKKzky+0Z2dTAoJGdif8t4ZlO0owiEntMCmSI6R6GdNMeDl2Ut7FQnEb4Q24I4O/sSB
         CZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155334; x=1792760134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3YW7DvRD8yt6RfBklKs77Vve2cfD+JOKZ+SXC0k2aI=;
        b=aEixXyNmyzY2XooMT3PyCgleMay5YXSICY0dncdNRUSJASe9ui29n8oM5IOAWyTCr6
         Yk9GxWNuLXHx35gsdXhkYusHfxt01ABSL0AoshLOiEskw0uweckNnV8CXVjh0FcbRy0c
         GPvgIH+IbZ32jrEGaLHqo68INoggLlkZ/9L3Xu49Xh5pQX89uRj3Hv5dfLElZwxGx0FD
         GE3UKHblp9XEj2o6ohXln0hgWC8RaCz8+y+jjCtIEIEI+IJYSUFAdfR10K5MwK8cj/7D
         itJe83B5BiCzIvF+d+V+rj3a8kSKEBg2iTZ5hzfyCl8gj8keW+UdO5Xx/o2/UjPJRBzk
         LM2A==
X-Forwarded-Encrypted: i=1; AKwUvBw04zrvWppHnVBQ+BTWKnJxOGef8/gLkVsmWBXOLE+295zr6CXLMK27gCNeP4OVnZJdtkdOp7dhnCHdXOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXljwEZIbySbOhA1C7+eyO+ZOLaBalM9OSjSVr/CKFierxXs0M
	6uRYOpBiXK0ybtA+LnWLLjHNoybp0ERyvmLjKOIrrZAiJxW9kH4oGJvdPKsymknqxVlhCEY/v5+
	9d9/VhsEg3RZf8fJ85qMkeJENeCX0P+gQ1xl8UAIJIyJc2yrinv7xsCLQ0y2L06uc29o=
X-Gm-Gg: AYBFou2Akr9I//w91lKF8X01wEEvNrS4W0zi/UFgaXrUCmdVlZbUPwqOKp0lNRw1nGp
	5aGHevM2ENAHevvyV4BHylLEtlF0yCSwHfbpTnrona67/1o8rL7cadtlY/zDqW5K0jhaMWRgwnf
	4qCVNLW3MDoVGZSBrtDpHlh2Fyj++gaqIlV02cFjhpNE1rMQ6ltpelnw6754ymj/dR8CzCsaIdN
	cCpruDDlJ9pY8TbnxheRgkuMgfoYtKMTG++pI1AlHkwsOSxMxkoP7s/t81Irqq1ZaNJ94+2TLIz
	iIS8Tuuesfh+cTvzwe/Fr9lX1EX0G7HwErD71Ldw+Ecv7ZkQwIVclm/IdRYbxXy/r9f+RxpiA8C
	291EibOC3pPC2PPkOgik9h8Af487+kw==
X-Received: by 2002:a05:7300:e9d6:10b0:359:bdc8:c9d5 with SMTP id 5a478bee46e88-359bdd83104mr26473251eec.21.1792155333569;
        Fri, 16 Oct 2026 05:55:33 -0700 (PDT)
X-Received: by 2002:a05:7300:e9d6:10b0:359:bdc8:c9d5 with SMTP id 5a478bee46e88-359bdd83104mr26473199eec.21.1792155332766;
        Fri, 16 Oct 2026 05:55:32 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm13434921eec.24.2026.10.16.05.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:55:32 -0700 (PDT)
Message-ID: <796d1de8-9c1c-426b-93f7-eeb417390f66@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:25:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] tee: Export uuidv5 generation for TEE backends
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-4-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-4-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iVaDaBmS7RfWeE2alfPJ2XDcXkaThBwa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXykomHzkif5eU
 OPJaywC0/bQoMaFYDXRUvOucLJhesjXmHi6rVkMzFZyhCFltXmIPd0pGjkbJMeiHZ5koOk6R6zt
 FtmnJrHoBxr8EK4uZtkXKf528CbA2wk=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad21ec6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wUKrATpdGnaYG2FsxpQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: iVaDaBmS7RfWeE2alfPJ2XDcXkaThBwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX2Rk0EpnllBh+
 4CG6a686qHuo0hK5tW77UOQReNfccfPh3N8tOYx2dtALliutiLGwtk1hrP9/z7f+AOyHLMADz26
 VWEGXSr966QgepfKrzMjY3TyzDDbJlRn5yOy+NsylTHre92CS4hywMtXgqM+rjAyCl0Zio9U9/C
 1KJ+8SrRYUaiPimZ3ti63v1d1RZDTfhnuRdNdwWCW0DB6Fqa61r9MjY/PmyYMYSN5FvyonJwy0Z
 Ey6pKwJr4vGhYJpsjPKZro2uChZS3VP5XMdKuskAR+Vd9SnmK+cLVQriZ6Wcou7gPP2xlGbiMjH
 KMl7tLpKwIKBDb/Vug07uzIGZZbgTk5xWDNA7VefHubCNdtDy+MPxvOABOvNunjIvzya3eRPLuf
 ruKCygWzOICQzzfM80WejjZnss+VzvWdjHM9RXfaN8KPSkXWCYHtVkVBmU8wtNiPuckI5Rn9WvI
 p8qNDSro6ag+Bx0sH1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> Export the uuidv5() function defined in the TEE core to all TEE backends.
> This enables the TEE backend drivers to generate a UUID for identifying
> and registering their secure services on the TEE bus.
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353175;
	b=NoPpULrzGO9NXAOdl+y6cZt9g0YrUGGp4Hc92x4rB1Ot8wniHrkKtoWbbWXtvLD9hTjy
	 055IpT1s6o1EctyfEr3xCzvvk77UGN0kNU9pGiH23ZHrueAG50tLUXNnYbWN+F/vhJW3z
	 umyjt0iMXIqZBAtT4y4lo6mfYrQFShQ+lrIV3A4kL2aUiDXKjok3tlgGkAXIvq4lX+l1a
	 jFiVprfIww5l/6VOPklzcVdx2yIJikhLnoyMBOsN2XQgNfDc9yAMxBeM1py77+IEawbI8
	 xSNmdNHghrjOUIen8dd33zUdfFYHKbpXvcGZL9uAnVEdIeF0NMsUCXlJgK5SDquLNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
	b=QlQ0MlxAnHtUXcv0s6PnxwqyeTehHcDlCUXg6cscGfhtB1l9Cl4Ha0wni2vWJ/hd52Ci
	 n2F4Fkj+Zz2PbWOkIC+SsqeIRpym/7g5ikoJw7yl9VNVZlvuVvI2fyVe6wjBQSqtB9MzW
	 g1WS3EzXms77f/ws/g7fGzuy3gJm910fkkUsOyRcHlLvUeV2DTdKGU09uJCkbR7/khoMs
	 aazx4HevQvYikJYPnEkk6WQ5KpTgkeB5Zqp+gQvq1CpxUHtqPonuf1oE6Btu4wraX2hOW
	 jOvbvY1vAYp7SdCBtcKuISL5NSGW2Mp7Kuuz5nJGG4Z3zcLJz/Yu1CMnSjpQoALV8mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWrRr6lY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjljdw6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D07606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D07606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RWrRr6lY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAjljdw6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Exmb1761704
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=; b=RWrRr6lYaahDYwc8
	dAeWhIyeIqJ7u+wgKrKjWW6fuVo9f7ZInfVbLhyITDORMvlGYrDA8qlrtACNtD7E
	yz8s7iqTzpgzT9l4lLabTxPJDQEPvcBapWbbDNyum5yyYyKcgAqFGpYfQmJMltCB
	HlamSbXS3xEZfvZN3vq1eaQwCAGderXDodph7sv7SMPLmz0vmGr62Y69ymAOyvNI
	BbQ4uc4xxntHkNwHwqHjClnDjbRFsNr7B6XiFlV+FP0XjAjk/GHRQRv45isNXdO6
	oziz65z93uMBjG0tWdIbK4v7NXti646wbPVG7ad5MXPjYlZbEfhxZGXIMfvwDoLX
	/qKUfg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa7u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:39:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so1149785eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353173; x=1793957973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
        b=FAjljdw6WbdGz8JKKFfBRpsr75CTlX0xKXVcU5HMRIoTony/Srp/0fFnQZStf+TGVH
         digwhqOE9NtbQFblET/bMGVzuXeS1g8TDHC48FlWcbZw6mCHA05KgK56GLKX+Bx78b7q
         wyeVtzOAsOlcy5eieG6d0IKGtL3xBRVPQhaJIviBtlgW+TPP+ZKL8YK0AB1dWYnte3ei
         +BxlzghV4rlecUPLb5RFNOhQvWRZLX4VIdTBZUfrrObINASJ8392veKNNWf8BLak/yoL
         +dUTDZXzhXnImTK7ndKdsj3kM+DJ3zPhHsLZXib+SmZfisZQnJLDgxsX+scTcWV1mVst
         Q+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353173; x=1793957973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urtOggJbUkGw4tpoKTxZdedqljv1BLA2Q2uuz8oB09k=;
        b=xRZ+/3CNlTErhpDGLvj2xLtZR+epnrKnVtlour7EJfJTNfRo0Z01/OxvxJZy8sX0ov
         Unc8Qn56Rr+QV0RSmHLDFRnvNhQL5+mc/XwArt62tu/S4IlEuXd8vURxM+N/pbFHAqg8
         oO2C99idLPjUiqve+xQd2Sc1eS+0yKNVBuc7WHopdZqOp5mEXyorIVv1uI8RMHc2NhEO
         l84YnMLN3Zi1qPzFe92xPU4DIIfhnz5zXSCvCQAklN80VQFiA4LR2Ke5y4EpsfUcHYoU
         enaEmJhs3nwlF4shhO7VS9ecqNFMyMl5tXf0uHAw/fTcKup379gGRuYpO/X20/f72LV1
         P0Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwuhjv3cQGL1zzRsh4chgt9PSiKRIir2X9QlDX6QS+I0h/KxgA+fuyIIXaWYzWXv3E44AWcu7rw58n87nc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsN9gL4+qc6X29JKRxJGDL8jyUMPc7MbR7YuFVQfBTZ4LOhKus
	2cVgpodUyCPjOr8HfaYGMMrqc2Tby68BKyvLhUzYvaX5+po+QzQn0YWI8aF8Yz7tYIbIU3fY4fh
	rdIyN46EM6HZK1rstjsGBWlEDaGnkCnnx3XFXbrrHlfaaCPQN4r5qyHz2kXPrPkiaCrc=
X-Gm-Gg: AYBFou0MXTmZXOH5wt02LgrROEZcFSwK0mZdWO+ZX2H/LGSalnFqaMNQehsQhQLxYWl
	pjQOe3RDCIIvFRYMLDm7t+8t/O3VIOp+vs6vc1UXlv+S+C7EXzDF5VMc/La6jqpGTJ44+tLKZyE
	64onXhssOcS92rKAfDgf2/ZA+nlgnS7twmXFmWAJ922SSo9SVH3Fw4EP8LNF8GAGrgsMC0HOkNb
	n9UA6yVc7hy0rK3+VdS2x899d2kHFCk+h1QHXTCCS8JlUnBPZiz59DBVcUDNuyuOSjh7jXZmrhU
	RpK0D2LBPfUQdpcXCGMn/xRo+Kq/IgxtqQNHEg3wPWMUgFcBSuwQVeXpUD5TYKfwwRO6+Vv1r/1
	lpknhpTUXN+yGPrkLVGcPAXXuoCpOas4s9vbQOR8bmk40Zmr2X+oMyJjUZVgSfJ4uF6kHoLyWr8
	BODCIZ
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr2925511eec.38.1793353173386;
        Fri, 30 Oct 2026 02:39:33 -0700 (PDT)
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr2925463eec.38.1793353172638;
        Fri, 30 Oct 2026 02:39:32 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm5716667eec.28.2026.10.30.02.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:39:32 -0700 (PDT)
Message-ID: <2e26e864-1f17-48b1-b84d-17057e7a343f@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:09:26 +0530
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
Subject: Re: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
 <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
 <20261009-space-crane-of-prosperity-bba4d7@quoll>
 <1276435d-7102-42f7-ad92-84c61aed6d2c@oss.qualcomm.com>
 <30044b8e-cd81-4798-991c-dd2e7ca6d502@kernel.org>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <30044b8e-cd81-4798-991c-dd2e7ca6d502@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX+eMVKOQf5IXn
 RTUQ0qe1D9PemkSm1krHkTz/SFnLeiAh8QkUNYAYergS4onqZEKrkox6XZytwUgueq5RmdvY/HV
 lcyUjAG+4ZrHOHTJmE0rwdBoZmsGPKejp8rna4ubdB5gpbK3xf0+ghZNA3Df3l8MwgitLwt+xTL
 /ACZ20E+iauNZoUS1FdFnBcONHF2WlXBLC5WOqPnkfjRUbraAHiPJGgb4+RYH3q4veJdO0YQSB5
 +DX5CiGoZ1+i6M3onsQUuc+TWKKrYFfiodsgHMX82G6S/F8axZPH9F1wd2FV04MPD+BtXmrEAck
 Eg4Sy44Q3N5rgh/+JOVAvxA9nIb08zXm54xCFT1jmzBd69xwHyVgOK2InEVub4YwwzhST861/fm
 bdxcNkpDTYzkwRIfg95H3LXOLcjbQOZkUP+eClf/KN3rWrCgYLzc7NNf3Fuo/xD49YGtK/F741C
 l2IA9Rtrfs8Xst/rh4Q==
X-Proofpoint-GUID: TGqPFpAD43lGV4RARX7tqR8J0xL8Cedx
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae465d6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=iXeEQ78Lhshhe8WC178A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: TGqPFpAD43lGV4RARX7tqR8J0xL8Cedx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX0M40mjCOjtip
 H3l02fTKNpn9wYAXQJFUzM1NHl2GyNxyRfIdI2qpAQyTngdErgTFusYuYNuADL4lyJ6bTBhXYPK
 K4jHHvVPothPNqWxlT9b4emhKjJHP1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038



On 10/27/2026 7:57 PM, Krzysztof Kozlowski wrote:
> On 27/10/2026 14:12, Vinayak Katoch wrote:
>>>>
>>>> Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
>>>> allow platforms that require 64-bit values in iommu-ranges to pass
>>>> binding validation.
>>>
>>> Which platforms are these?
>>>
>>
>> Kaanapali onwards, I'll update it in the commit message.
> 
> Then why all of them are changed... anyway, you responded two weeks
> after comments, so that's only fair if we also review in two weeks time.
> 
> Best regards,
> Krzysztof

Agreed, relaxing the cells for all compatibles was too broad, and sorry
for the late reply.

In the next version, I will add conditions so that the 2/2 layout is
accepted only for Kaanapali onwards, and plain "qcom,fastrpc" stays at
1/0. I will also update the commit message and add the new example.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024594;
	b=3iKmAlsiwqVI/30/pspERUFsx1+NfaGm/v63F4MrNicJIM9QFScjCAC4pTx8JKk+SL7u
	 9P7vFPDsVTrjmLtZGmsMECxJB/PFMug49nyAJ7Xi9SKQPcPqqRmwNEtNG5J4y818sGWlW
	 fu9pwD2WBZZA8Q66UQzGmO61Va4EJ2Ajw/eV/mimbr95YCHeDNOyLR8dVyJ+HwaBzlfQW
	 LWWegHtLTT3J5YZ+zIseHdb+cdtAV4zfEOjbXAMDbV3IUOUU6DXoyIR2Qh7eJFwEk+C4u
	 Tx6hHUBJdZU+j0aNo5+/43JnW/2O0bRd2RSlcg07m7DbaHJKdCSEXZ/H/lxCXMOmfxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
	b=d7tWE5bo0ZUvtFW5SJur/5XM5Ax5rfzFfp/8WhmzIjmRFflZZJj8LWbqB2fHi3Et9gQ2
	 9X0gNz1iuou5YjJKEQlyWefqstEA0QNne9xkPes55Cz0OuxPG5ZI0Fpph1o9dEQUsg7EV
	 BdjG2TFh3f07wQAgtapu/Yug6vKqCJ52r2/gtU63iaVzngiryZdZXcjBGnPZ5v/kl86UT
	 nM02UdFjoC8AuXawSfPh/BR6kc0oegoKej3/L4m1IVnlC7z5EE6OtwlZoCGIkK4V/N7vh
	 QQfD0kCnzPzSeJ7FgMXJ1w4ZL8azPsE6y+ltxNO6enUzUDdLDWRwL+Hc9k7s95EB8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0zH+rPM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvtL0J0G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D438606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D438606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0zH+rPM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvtL0J0G
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYrY1547988
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=; b=D0zH+rPMcrb+kex9
	RMk7N6WejxHJypspAeFfRqfzDj1NLB01Qr4+Zx9JPOrOboDGUal2SLVIpYxHC5ee
	OCrvD07eqCRvhNfaWxuUnieEPmq+VFBe9FRqxpN45wYODryXF284Kf01kLpBN9eq
	uAWvf8Gl/XzfglHllNpwf6hBux+OhZIDHDh5vFq0RgeQxlyC3+tSg8b2NUgB9xJr
	ziYJHtzx8lJyajv6XiZAOVy8UTEmzULjsEVkbunqRy02ctMejz/kpOZgXHlCnHhe
	h9NyxmJ3zxBr4VtxFimFoPaSL2ria2jTmlsJaMMEzmL4o8PsQP3Et1Dt198B6mnu
	x4sXCQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstudn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:23:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ead2112f11so89475e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793024591; x=1793629391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
        b=NvtL0J0GZ3DCwpRijq+GpXmHH7YM1UUlUhX+Wwc09arHzquApQNgLnYpoGqB19kKWf
         hIfNOUjSgakyTJnUH4plJ4y3sf3TFKsEnci61QNj5ikP8hu8jK8WNOJpvHYxLUOtQG8Z
         HlJ67cBbypuI9EzFjqa8RjOADybJF1Xz02RPnQnbDZ2Q63Q/UkV3W9Y9QDfoTrEF2zaU
         1fRhIajOHvLGOhjK/8BnPM9Qgst2qsva09jAVRwMj6AWxiZMOEEaE32dkn8LtPz6MnGY
         Vm9JKG8viILrzZPVqiwQhtV/FXcB4j2r7dNbP4jHI90vAk+V+knMYmH2w/N2s67H24oV
         E31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024591; x=1793629391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
        b=fFvH6/yb7sBAM9c/DCVk+Meby7mEP/pbPIxRSR8x7h6nsulepkT+3yusfv6g5NhA78
         I/fq45qneaCXX3PKfzWNG1EbSf2JlZaD24B7xzazfRtrj9MKx0kq6/l4cOf0YedbW9tc
         bwrY2QnjIvm8EpzOSxDiysz1h7wz8ghV2YIh9+8JJtzSq7dMv+bwtDcSyOlfxO6/nWEG
         gXLM73pdU0a1KVgS7xeVxsnMelLxFN8E79qx0X89C9mcxP/O12zBH5ijO+F+PViP3C2V
         L2bjiMHmFHPF/ZJd7hfw5pZRzDejUsCvYUZrUUQaUVltW2jF4dydQIkYHzCrtJlo0rd+
         0QNA==
X-Forwarded-Encrypted: i=1; AKwUvBz5L1frLy8VfvXi2MorjD8Y5GqYOw3St8/ZahnTpW+CI8BMgUdrWEZyNBf2w19QLdiELabsJte3oWkkp/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHMOvCpQqhoIk1iOigpIZpU809ZqNx86mD1Y80Bt53RGh6xAcH
	h6EfY7VKp7SVL9VzIyRXiKEBgp7Jo/UBycGb7fG0ZlMcDiM29+GKTKMiFcebKcPBJ0VpVS3MWKk
	EZ8/rM7b+eGgCweenMJ1NgZK7CbMUOp003dl7oyFLUKZJB1eAcR+CtfcLCdVvNHIN1HE=
X-Gm-Gg: AYBFou1zzdcV3eGIWDcZa7p6pDmywyXxNugwIkmMQiU4XSQZiS28dZEgwP6N6V6KyJ7
	0ek8AcDusUNdtOhecuen558oUm9y9vbLNTAUrnjIzmODdN+8+0D4kskxO4a+gbF4t8nXfAr2nVP
	YLeoiDg1yn+HQgF88d6SMCV3ERc9FSAPWrZ5VHb1a7Ndv/R20DbLxP/x8kj/E8jXg1y4WVEwLsE
	ajbNfxvLoyV6W/75EnaG/Ka1BPul4o4xsQW6imCXTlTAxFmIuQ3LUQBG7o449W5527/FHApMGyj
	11ziKF6yq1f7ljUGWWSB0eDXlZOmX0yjldxAwOwd/1xs8Aa/YaueGcdaYl3lYXFPh+tg/vNmmWS
	9nOgA6NfgWhQkYZDPw2tmBQ==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2115552e0c.3.1793024591129;
        Mon, 26 Oct 2026 07:23:11 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2115521e0c.3.1793024590603;
        Mon, 26 Oct 2026 07:23:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b47sm326826866b.40.2026.10.26.07.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:23:09 -0700 (PDT)
Message-ID: <23131f02-0df2-4875-a409-b9c9340d0dd7@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:23:06 +0100
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
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
 <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfXyRztF66H5wCC
 jIZ1aSEYObrVqCn7UG2/pBXLCg2RaF7Oy5Whwn6P6VSXS4lAQF/fA75AE73Pi7hugdsMo+RtiMB
 ccr9uSmWjGmqnY/yjXMts3405AI5Cj4=
X-Proofpoint-GUID: T817QxNKRlxr9RCBmCFAtBghT-GyyAGM
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf6250 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rqGjVLSmFW5gv3Cq8oYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: T817QxNKRlxr9RCBmCFAtBghT-GyyAGM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX9dU2qOKoNK33
 y3fqo3mCzBogh7G0OmirY89bx5OB41wS//AtLtbghExWBgvCVe0L2cQ2Zva5AWEJ6Qzt5lydNb7
 ic5GFGxxRtOhdYuooWN3g7X/0K2g8XUu0fvug9VLzHl/aSi3FulKJfWP7xndb/P9Sl/uuWxE+dr
 4XvKCObnGxq8Kqm2iFU/7BxNYGuVpA44Rk6xkFp8TX+0SlBoDSpEhI49vBa0ogGeGWGi7oYOT1j
 /srf80vzGRjSgIkI/i6OF9TRDBSQA9xG7FCI5Kv8fiinfvUWzRy5pEXfa+Q6NX4sIzSbLYmcloI
 QW4ITKIfJtif5p/7qRtvOWLmd9VQUUSnVrqvfn/sQpOfOUVGmWCiV8SnF2Dik/exNo6L1AvQLG/
 4mW84lZgTLcNmHtgCjyjvkpjVqGOCMPNX/QNA2usBogCFa9R7usmblwOvzHqHs/arvO0SuzBzST
 +KOMf9djylFENrGfZZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260057

On 10/17/26 3:16 AM, Elson Serrao wrote:
> 
> 
> On 10/15/2026 7:43 AM, Konrad Dybcio wrote:
>> On 9/29/26 11:35 PM, Elson Serrao wrote:
>>> The EUD hardware can support multiple High-Speed USB paths, each connected
>>> to different USB controllers. The current implementation uses a single
>>> chip-level role switch, which cannot properly handle multi-path
>>> configurations where each path needs independent role management. Since
>>> EUD is physically present between the USB connector and the controller,
>>> it should also relay the role change requests from the connector.
>>>
>>> Restructure the driver to support per-path role switches and remove the
>>> chip-level role switch. Additionally, as EUD need not modify the USB
>>> role upon enabling, remove the unnecessary role switch call from
>>> enable_eud().
>>>
>>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>
>>
>> [...]
>>
>>> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>>> +	if (!sw) {
>>> +		of_node_put(controller_node);
>>> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
>>> +				     "Failed to get controller role switch for path %d\n",
>>> +				     path_num);
>>> +	}
>>
>> This will always probe defer on a fixed-role controller, we should patch
>> dwc3 to always register a roleswitch
>>
> You mean for fixed-role controllers where an explicit `dr_mode` is not
> provided in DT and the fixed mode is derived from the HW capabilities?
> For explicit `dr_mode=host/peripheral` cases we bail out earlier and
> never reach this path.
> 
> The EUD databook does not explicitly mention fixed-role controllers,
> so I was assuming all DWC3 controllers relevant to EUD are DR-capable
> and register a role switch.
> 
> I can see how a no-op role switch would address this case. Would it be
> reasonable to handle that as a follow-up improvement for controllers
> that resolve to a fixed role at runtime, rather than as part of this
> series?

I think so. Generally true-non-dual-role controllers (i.e. by HW
limitation, not through DT/firmware configuration) are probably
unlikely to ever be hooked up to EUD.

Konrad

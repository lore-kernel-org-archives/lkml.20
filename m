Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710793;
	b=CXoXOm9hJPGFX+VvFHKD9d2XXpZXCAx9gs3UHANyh6IQXdVMLM701sD88ERrf8ux9HX8
	 w9w+i82dFF1mLFQm6/WrRi/9htDjm+2+H28asjxp2fnxMFCwcXFJLC7ghknvZ5oBEH4Xx
	 lYa88MN9pRYPHGwvXwPUrnm4SK6bbUvRufODGmuWO+WSeN0kb+PDKUSxnGhxOfmwHuN0e
	 T8ZcFHQ07Ly9owwATm5gS2wpJzOSgAdT9IHi9ZfERvpYNra+3YnMNPbRdzVXkY9p6HEmF
	 /IULdO5xU45ZeoJxF2uCA/3dJCcKBPCyyLP989wGfic8qa7U4+5l8YdftrrHYOlUlNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710793;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=;
	b=Qg5Yiza9Bd2t14Chbsf9o9BG1J6ryHSBDuw8ZRmuqPArU2oI41QlloXIzhYZDEKlhqhi
	 83S41M8+XA7BjBEHos4qj9IqpxSAeElPIOSxhiuTQkeaSK6iOT5Zmb+oAiN70YdMvvUvJ
	 pmBKcFHzXazcR8Oyswz0kWyvmUGjGHY9bxOJtEFXUrqEbp4cR+0gP/cv2eBSZ5eWWKTsC
	 cpySsawECjrEnmJ5ptF0a+GYFFQeOqaW2wePDJj2drIbffNKN2T/bjmAEGkFDH/Nt4fNc
	 XqOZrBcfZjeykmGcGoB2F6RzRQzluz2cqjPkGsrQgcSesg0G8eXpA8lwogEiJwJszWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cifd2DW9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hd//VtE4";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00AA606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00AA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cifd2DW9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hd//VtE4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClQ3c2547078
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=; b=Cifd2DW9St/UFgNQ
	f7Ka0TUklCWbXbcaM6XCRFMpgwe3Xt24TUE9+UkUYZ3zKGkOlGaqPV0L+WmT6Bxb
	XgmE01LgcNVFO/N8a7avOTgT1Jp7Jd/4RzCiJTPvlpAidzrbCtulvVu3hRC4Cqhd
	lFmb88NawrH23WzW4Te3IEILGPlLu7r91449nJDJylO50yNeKpdfRXbBc7L3mLZ+
	Z21nM1Y7fNLHR7W2DWC1MGtCKIFUokZoNhLuQHrzJAj2A1GLR7B72Ih15EvOy5GZ
	+psPFHqxhV4HqX1KivXtqz3Zsq4A2yKrmFGr2EUSZ/URVY/IAoF83Rq+BZiUXMmi
	JWt2Sw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3thd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:59:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb362d1f5eso43422335ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793710791; x=1794315591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=;
        b=hd//VtE4JdsLOUqQvm8vBXQwGO14B7/9FoEO7DiZ8snqHtEGG4rmVrFioQ3CxhL3WG
         phzquTkv3otLfCJ13TxXIWXn1IHeWngkvsS1YfdWW6goBK5K0MD9R0Y8wOFqAeQKF5KG
         rxtEo1T824UZzEATVm3ZkTFkboz1tGIcH7HxUyK7JO5DcdOx+Wyw7hejF8G6er2wht/i
         UddAl2dIc87tvfg7oOoX53neyJAShKVDq6MK/+U7hcCVKp5v4jAkWQ8cWsiWku8gdir4
         PMwrDKkf7cKUkTYkVdcmIPoPXVYQvY2RovqWUuYhvFIt6B0g3nVvCjryuCrvh15jqF63
         1O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710791; x=1794315591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzDjr58ySN7ynEFuax05LT2YdSXHMlQCQifLPO++jM4=;
        b=Uhf9p+KvjaXK0+SIu8pEHlKJSLnMlJsFZLA4Zd2ypYC+U9S5KgDCIAnf99pYBGik9i
         IQUrlVrH/oE1JasOGQd7oNipE3PdYwuwxzedB5zrxuwVuS9a8B7dW0y7FnIad5CJNS1R
         fU4y2/F3hfsMNAb7GvhIb/CRXLjeMUQH+Tqa86mhtgkT5H/pLuISixHL88YIq4nn+TwV
         7rbwhs70Lw7kOpq7cRte3TEgoNslwhUMIk1u+v2yL91uKlM8CA2HAwf8S0KiXB3HxLAO
         Yahy7B8VJmitIjjwoQUQwl9wtWhJ0h4ROaRlJoMBatEl1Rnf6QzHQRjPVIDmpjKwyHD4
         V9CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi3Ezun7Uii2PBMCEEEWcXZOWT5VlTjWvvct5ssGgNeAAwpJDRjGB/6tQ/N9PlSGgMwwar3cHAaypk4+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VTV611ecbkSggUvQ4Fc9Ug85iELyRjopjzd1wuxZ29/Fx9X3s
	I0XE1uITgZxXdY8DP0DxyXBPAdPcjM4CQ8sLk8CeCYXUALLcCBOeH/Ler78raPuZAlBDcbBc766
	F1UeNvkRSeyzmGe06R3nBdw1/WmVoJJa24qpf6tp5EYdqHGgRI8ShLPBMtsAacZ6CxLs=
X-Gm-Gg: AYBFou1BK+1J2UiCoargnUKXrNsMQfBRLR5oTjCp2oYoUoUMK/sOpl2D/2uDuP8Mn3i
	WhEOkA+bv3liEIOrryxbRxFSegLuvrQyEUM581GSII7hs36YEea7NVJOHnUIJHUw59dxOQovYSB
	x//rru+BwBXnToK7I66xtkwC39FOq1r3LE+z9EVnx31pZcLSgL5LdvzisdlPrwfGFNPEOlfenpC
	D7JFe7T6A0HvgeWXpxxnvLKiAdh4Tp1efTv7wTGsf80+J5YB8sC+G2/dk4t0zi6VmQQYgBVAoiS
	Veuhf9wwNbUG7SnRSih3zIgT5pSfmEqBJPFfFjI4uiBGi4EemxPsiYTmKj0kW85tdvHlkxCnnys
	5ahJaSb5XUl8gI17aUUV/RmFFywPKG0QXLd6AMK9bp45jzr1ZyAomYuDao0bSZbFFcGrNFsknki
	Grs+dX/uW7D3wBrOw0gWBpbLeI66xREAj1ALVmuJy0dWT5d+D28dc5o7N155LDOQ==
X-Received: by 2002:a17:903:13d0:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2eb36504ec5mr131117555ad.50.1793710790635;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
X-Received: by 2002:a17:903:13d0:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2eb36504ec5mr131117335ad.50.1793710790114;
        Tue, 03 Nov 2026 04:59:50 -0800 (PST)
Received: from [10.50.44.6] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928f933sm40414795ad.58.2026.11.03.04.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:59:49 -0800 (PST)
Message-ID: <72d9d2db-5cee-457f-ab03-0d166a84a49c@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:29:45 +0530
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
Subject: Re: [PATCH] arm_mpam: avoid hour-long timeout on invalid ACPI table
 entry
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261102112748.3458012-1-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261102112748.3458012-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tcCz7E3HHYqTu_5FrHorV33HVvI7Qygh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfXwoRis48Nn8C9
 oNrQQd0G8vYZS6ik/fOJiGKmveyuPMlRg+8Fyn4t2vn7OYj5qyxPjtuk+/mUKcNkB0wWS009u7l
 00AUV/klKhQUCBdUKvBFFLt9ZXru+Av8i/z9O6f22cMzxuxd4w6+IIQFqE5xSMWd7d83YzrQnBX
 s1+SNGK9xHNW2s5wRDdBuRL0DGfazTdamxmjTMR1YOvlHJoQK22Ud/BpZ0WU8r9Lt/GaYDnF/AN
 hPfafBdQG8gwx+TQh7abMyWPD7gM7HSSQ8IhHzRvmrNIbITXD5gLH+u/K1LHbrRQv3bCS9GXqws
 M01tOoFa1oh+5X7OA7L1iB0KdFbq/WniM6DIp2teqMW8oTXz+MH5RcdiyJtVfSOzWX4Rf2kGL1/
 zTsrq23+mcGJ1RiSmfnjR/4jkuVR3id9WQItmUKjgtbkDI2eeybzkUop/R4uRW1+4nvCn2ShOd1
 7k62sfRrPmu5/2kNJAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MSBTYWx0ZWRfXz831o7JA8V6U
 qaADzRLv0eZ70CuajqYpY+EQtE6l5nCO8MoLp175TTAYP3Q5ZmiiS/Al4t7f40oz7L4wQ0t0pe2
 yH4AIRzK0Upv8yuD5L4NzUdgFyHt8UY=
X-Proofpoint-GUID: tcCz7E3HHYqTu_5FrHorV33HVvI7Qygh
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9dac7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=xQjQ7c2AriHHlxExpPEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030051

Hi Andre,

On 11/2/2026 4:57 PM, Andre Przywara wrote:
> The ACPI PCCT table contains a "nominal latency" field for the expected
> maximum time it takes to handle a command in the PCC mailbox.
> The generic ACPI code reads this value, but leaves the handling to the
> protocol users.
> 
> For MPAM-Fb based MSC signalling, we use a value derived from that number
> as the mailbox timeout. However if the ACPI table leaves this entry at 0,
> the mailbox timeout code interprets this as "forever", and waits for one
> hour.
> 
> Avoid that lengthy timeout and just add one microsecond to the read value,
> to come up with a non-zero result in any case.
> 
> Found by Sashiko.
> 
> Fixes: cb351e3f304b ("arm_mpam: detect and enable MPAM-Fb PCC support")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71e..fb596ed19a648 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -102,9 +102,9 @@ static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
>   	/*
>   	 * Timeout based on the "nominal latency" in us, from the
>   	 * PCC ACPI table. tx_tout is in ms.
> -	 * Add some margin here to be on the safe side.
> +	 * Add some margin here to be on the safe side, and avoid using 0.
>   	 */
> -	cur->pcc_cl.tx_tout = DIV_ROUND_UP(cur->pcc_chan->latency * 5, 1000);
> +	cur->pcc_cl.tx_tout = DIV_ROUND_UP((cur->pcc_chan->latency + 1) * 5, 1000);

Would an explicit floor, e.g max(DIV_ROUND_UP(latency * 5, 1000), 
MPAM_PCC_MIN_TIMEOUT_MS), with a comment, be better than "+ 1"? It also 
avoids the side effect on non-zero. Just a suggestion.>
>   	mutex_init(&cur->pcc_chan_lock);
>   
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

Best Regards,
Srivathsa

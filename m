Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507277;
	b=srnqiQUaU01gWgxh61vRq72jezxAMZv65GQgp66u+0dJ/XxR9EkyoClCqj+NXDsg002C
	 H0+azdUQpf45JXrqdleleWjDlieie3EJq08Vvsm2FEYghKQ+uPZpmdKBOwIrX7LuoxRMg
	 5SP/pelbux1AT/862zrl4ursgDOK8I7VsRgC/4XO9qN9jT57xj5NpvGbJ1Xa+CIEBvfjd
	 b6y1+D3PynMa/P0wwRkfQJqIbq2Um4v52VYsjfIhG2u+l0sTkhjooUsH4b6rhBLixsVLe
	 uaFsvu4epKBUHX/xbDG1h4+o3bMVNTvqh8+hZD7OglmXZQ9JxP5SJjpS5IGz/nna9Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=;
	b=b5SQSHCsUSWDDvw/HbVgzodzmAhRyzvl2D6ToaoOU6eUf5sk/VsilBxJvufj/HpUQRW8
	 /UUZoj0CDWiJp2BLbS5zQaXX4sQmmGNxjFIQ4mTM6mcG7vCu62vEZCqa/qc+wosXdVNnV
	 Hg5/0xDjx/8HYBCgU1l7oeNlExAZ/y+Kke7IDrwPSwrTuDbbBvwm3yRgFli9TgXAAMt+H
	 5UelZ3bOaoKVNwfHy6UvSCTx6w9khA1n+dO1HH7+W+Uwz1uldRG9qdQdCZbJzwSQgHP9Z
	 qHFlFKMfifHLs36RwnQ56hX9dFMwVRKgP++endrUWqWF373ObaSqcQ8HaUuZJsRXZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MkucNR58;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnPYDpYo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73996606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73996606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MkucNR58;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnPYDpYo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAA8u702626
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=; b=MkucNR58bymGLymL
	X0wFDVy5PY6mD1Fyeq8owHTKM85oymAAQ6rgUbrrcIKx5wfNNcl0Wyr851ioQ8M6
	UCzaXEl4M5nI8mgbfXJP77wVWTBGVJlIlAE3y6Ymz1dpT4fF8t+rftUW05QtNkq7
	J6JqvPJn09nix92Ea2q4SgAQ1vs+1g3CcJg+xq5eSFTv0EInB5P6yiphYQl1uyw4
	9LUkbYGW8DtFJz8QIN6QFRWxuvvy8CKm0RNZglXFVrPpbQTGkT2zGiLLtdPfhj0U
	PviKDx4u2Lf3BOlq5mQ4RTgSI4Pyty7W0ZvliVJi8ekdkPt7fzA+/9w6+xaNkV3i
	beiZPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stwer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:41:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so59406085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792507276; x=1793112076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=;
        b=AnPYDpYonEI/vZl+9zM4s0CoDTtBy3JiNKBU0KnTYE++gHt5xXraUsfwbSYJ4bVYTN
         gmmrcoIH7VoPA4dYH9VCdfZMGAmBqW7fZNYBPsH4ta6iPorH0ow9F5y7WgI9FxP5R2MN
         2S45SWbcwjVFDBGGpL5RHl/VIFiSgWsg9JQTR0fcI/baLHMHc+E6rvj0Mp02esPhOsyR
         KdfQE1xlfZnA/SVOMm90iiKbJV9f1v1wFoBA8vUh+5pIobe7wN/tTcmrINdC/1HLynco
         6EhpIu3WBjrrcwq0WK8mIwpswV+nOd1qG6lE2XzZKY0T/DBV5uIqpJh887oyqpy67lse
         TaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507276; x=1793112076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4aoTvaWwUMwy50VJh27ZiJbEOO22PDQ4jEs7HBeRt0=;
        b=iVt+I0uoMDYE+eObWUT+Zc3ntxt6gmYbrOqhnvI/LFicBKeQ5/rwO0RF0G1ain/yq2
         U9v5FqgALfJasoiiunRGs5Rlk5MrLGgalV7nNB00CFz61X/d4xxkPibAl7Srhj64BzDu
         PwYnIu2eZ3TnERrF+2yQweNI0U+bL0hsq7sCyOKEmCsZi3+9RJjqb2OnTcqC4rcJRG2a
         +GqX0PuZ3JnxXOLmjryRsxk+33MOfC8YGOM3yquJBtmBaNuEcif0QTCZPx8vYjbO59JE
         V6qVTT7H9jO1yMjgpyzWFRusD/VPe1q68pnV9yufOTgS9C/KVczz73z933d5M/VirSh0
         L6gw==
X-Forwarded-Encrypted: i=1; AKwUvByHrUonl4lnkwAXseh+law0cIJQ9xcSFeAYNyH40ulWwpFvu8Koj+f/kPygatAtHEmB56qg4o2YnV2PUqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZg74s37Gg2kjV7xxVpZHSOddfRu6oK5/3jdUz4yALFqHXET3i
	eBj0zFkcVww9oB3xRBvoD6/HxVDTCAYnbT3NtqBnlw59YBliKHrYpAL9zk1po39p6xMY4LCzvc0
	gFZRHAONVyDrKs1hRHRE5RqyElV2g/aM8n7EyxjNvt3/KOJMBFrspUz53EOqUZTxH0g4=
X-Gm-Gg: AYBFou3EutMg2RKXfM1Z5dH6dn0ruFRMrFZaav7t9Jiv91KwFoFSDxyscgYTdQeBCLZ
	9v/ko9DQIsuLoEijH6fn2bL5yKl/6g1U8/0YpgNOhjPHVULjHId1qNdoLwi7qzwdKH5/i9BZzOQ
	jXhjr488hhkRpE54yXealRV9WiiaLAWNpKR5lKy93iLX7GjadybJB61get4LONsj4lqjiTg4kFa
	6OUeK/54uqP/eqXld9Gobinvkfozb+oA9aUYSXnLmeKRzx5WFEr4U8VPDsu2mCje47mTSWuq28t
	WmeFnO/v/CuzSpo7zAZX8O/fVoIG+VJB6DTO4rD16SOxeRCzo4Ehym6upnFRGSenoux939XGB8W
	aE5XaPmtMrhMayn+XdB4QuA==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1920605185a.6.1792507275514;
        Tue, 20 Oct 2026 07:41:15 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1920600285a.6.1792507274885;
        Tue, 20 Oct 2026 07:41:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm468162866b.64.2026.10.20.07.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:41:13 -0700 (PDT)
Message-ID: <8be959d7-cae1-4f1a-8247-67381a6dc811@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:41:11 +0200
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
Subject: Re: [PATCH v4 4/4] usb: dwc3: Notify XHCI core of tunneled status
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
References: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
 <20260929-topic-dwc3_tunneling_state-v4-4-63e296346d57@oss.qualcomm.com>
 <asBMw-j0fxVLVW5Q@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <asBMw-j0fxVLVW5Q@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX0rUm6G0cN2ow
 JSnfHQpGmP1IuR/SpGYJOfpypncZ3uwjZHfTZbfeJUhYNHFkNLwbZs6hwEjMqqlfkpHu7OWzPhd
 sSsrrNnaZd9wyWuYVGdLkzwKfoLM2oCBA33MoWW+6OyLOVCfaqUy7LRWfryyrwzRr/ZTxVqqcGi
 QxGipKKVhdLuqrV/SaXEDNi3Hf1oIK60xnWNE97068BNxUnxOHgDM9JGNnDxAJnfL/NYnBnribH
 3BY0SdjFcXKKjZCy8UqTCI4RD7yWDivaVS0eDV9yryLc2oO26hWyfLy/CJOsf1jJ5ZncgfSPbog
 ArLlMJo7YT2tu96UDBZxY0QEaaFZhUueQ7kEfRmvmNZEUKxbu55H7Ua9VpzUpcgW33rQH+pd2UP
 Fl1UbOYe9AE+yOGd7ctkbc336fjXefgQPB/CuEr2AEAAY1J/aopW8I2ZjeHgtJ9TGtNv7OJX475
 ai+oaNj4rnczX2stepw==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad77d8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ORxTflC89JRLnpgA4MQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: x_Hmz2hgOoMYpQf6XEzWt4tS757SMEIE
X-Proofpoint-ORIG-GUID: x_Hmz2hgOoMYpQf6XEzWt4tS757SMEIE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfXwmg9Am1uXAcD
 +YxZoQw60TAIzRo6rO4lW1aJUu/SMZ+wXn9T6DPCtiMJwYXo7Td04Qvm3sNA+EOctf/M67Fnz4N
 3+nVAyiPYm2/2Pb+MeWbp6F+52BL8fE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200058

On 10/3/26 3:23 AM, Thinh Nguyen wrote:
> On Tue, Sep 29, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on the USB core to create device links
>> for tunneled ports, so that the USB3 controller is only kept
>> runtime-resumed for the duration of the tunneling. This depends on
>> first knowing whether a connection is tunneled or native.
>>
>> Add the logic to handle that for DWC3 controllers.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +	/* Not all DWC3 instances have CIO HW, trust the platform firmware */
>> +	if (!device_property_present(dwc->dev, "usb4-host-interface"))
> 
> Can we pass this as a dwc3 property from your glue driver instead,
> inferred from the compatible string? (ie. add dwc->has_cio)

We have both CIO and non-CIO hosts with the exact same compatible
strings on the SoCs that support it :/

Ack to other comments. If we need to wait for this dt property,
would you be open to getting patches 1-3 merged in meantime?

Or maybe we can lean on the fact that there exist dwc3+ACPI devices
that could consume this property too and sneak by ;)

Konrad

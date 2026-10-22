Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658913;
	b=ZWF/dZ679aSO48HNky7d14A+4BjI9mhZEDm1hzBNvzaOUnrvfKTaE69+bKaY1eJfqRlx
	 TWxzcGcIJdyzEh1DVbEhIX06Adk+FKI15FgNBKLZineHbgM4ay600Tj2dqnS/9KjFPXFg
	 eoq/b3USoO317qaWThx0tJtF2pgpOrJpxe4mOYAGwDAD2o8wZxyfPmcakOp0fKKO3Rylk
	 qqKmawAiL8n4stO1Gl3/MvVFPUv/KboHTMKZthVnsaSLAuiRyyDw4Mr8gfNqPY0nBNlIk
	 bNMWNmfPP2oNehQJf2RdzlelJYyIUhjJo6sgzs05gkW4LgnbQrAoVCD4Y9GV2c350Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
	b=1ae2NItDrvxcJBIpZQeNnkSInAZeKbG/1KOH1fAbSwXXTd+gPr7BHnnhMpzuziJSCfyD
	 9nC2NGcOKocvNfyGleFQ9ZOMSOtBf/xip0tz0sFVpqvR+n0qCTWzILltfJZUIrHOFqSp6
	 UqxonFYcP85Cw0InAijuUWm/5w9jlaC5TBCW6rKgYwGV6J8BM+I1CvccElt89gSP8jFU5
	 lgWquvGx/Q4CD6hbtQDc1VTwVQgN9vQtNqrdVcOADM7PCNOT1RQ13HCYfGryUmiB4G2Qo
	 p0Qyk0Uq8w6lqf6M0ivTQEpmyAstA2Lg9d8wl00Pymy+4lBcMM6K2MxKo9xMy2sCzeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p6/nqHTy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/8wCf3b";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6/nqHTy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/8wCf3b
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LoVr3194783
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=; b=p6/nqHTyTSge8Dta
	ZRaXq8pxp3zcrMGT5X0QOnFUwKpm3biAb35EU1p4K9nnD8ZZ05tHDk+wPVtawE8N
	/raXYwJZ/fes3xVKZBitY+i+WgbQ1+zyBL3dbYKX59sj7J9ahCFuHW8pvOnWPR5Q
	9E1LEts4dL3ueW1dOWSs3vgDUm5k3s/0k+F+5XPfsWgqyE7Pc5JYzNHnMrP6hcI5
	5ldG/ndh5SGr05Ov6cpVe9f/GuZYnenDcR51EO0UBsy+QylwachadI4KFXQhSnwd
	6by8V6HYYjCLyC1EWivrhp1E0TDUqn9bQz25EnpI1XRWEDEwC9SY25M8UmrwshHA
	mE83iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq04nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:48:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so43495785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658912; x=1793263712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
        b=Z/8wCf3bwruwQec6NVDnaT39u1qyAY3MybAijFbmGRMsJXfMKcP1uvtKyIs6EiPJOi
         D7Rd0U4T8A7nWlnshR/A0wAizoy7hwI9v5PXPGhqykqusB9iDdQNFKQ+MNiC9lWnXCqn
         6sZWERDEPsBMhyBX6EbwVcNbrUkILC/5gsyVWw9PGAyVdRjarhcdTRnk+Sp293yVpJze
         Hpjaa+MUbfmCGjTYlYDpN5GLH61gF1esBFL+mTbLFvz6iRrFSi2l5ff1DdWn4gJ/qJMf
         YeNdIOFjIU1B0QSRSLZCcVXP3GkrLNVzWTEYhhehfV6uodjvXU9gUduJDvei4LhL2D9c
         SYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658912; x=1793263712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7q0H8KEViNqxu+d6KEkQZ8iZ/omnBgdIgoA9TlObtU=;
        b=CgeLmaSUDUYqz9D/O6H7vOKTt+wIiNaA1RKijaUq8inBN004aw29YjWV9Cjz1My3I0
         Y6w2wwmO0pOCq9PEvWtNa2VoWL8yTlW/thT0wz5dEDRyHZOOzfv5q0BdzGuMJKopCWR8
         zpWyWQZVQWyGL/317L0ipMb7uuN5h4ooZvrzd+9mNO0y3chZsMWG57jFgLnqFf9D6Uvo
         eNe6uYYxAZCau+nWPu6HebZCrX3ekvBD0H+pLUAPER2Gn8FmbhLDbIAVJwCRCcbNx93/
         HUksUbQRIFPc2r1X/O1U+iWuFDINXyEhu3zXPlXBUHtmAwL6xJYr+tnkWxQCyFrgWwVF
         vqPA==
X-Forwarded-Encrypted: i=1; AKwUvBwr2vnRkgqpEzrqrPVd9ltT/PTkRMUeXHuhY2DeDLBZNHGBWLdXHNzOFa614ggHkTzya0WZv9kpVPiIYvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYICbxGj9I0ienxMlT8/3EmaH6D/r7n4pgDibcbrutGdWgOs7NnV
	40UsgI4iJ1Cl2r6OXpIczsYH0e+cHtocDWtYCad42LffwCIEfE90TsKv7z68HbX8gBhNvumwe2z
	0woPSYgFHJgibuYejcBaHRWd7cleoLo6v4XdU+ntpprMzGEYCmPIY4DJNR4fXZc3RtQe/m9E6z+
	s=
X-Gm-Gg: AYBFou2TcKKZJUItJJf200/3Blp7mbS2NHBGQO9CuaWUhIXvMFCneeP12p914tiuKzE
	dbAX9pqF1ndoZZsg6gG0ulmacke/n/EtuyUbg2YhiLdeUreYnOlCoBQZhEogLc9VjMyJ0C+PTz7
	4EP3+VeOn7FHpdDhyvqo4xYy/Co96zgwE07B0o7lmX+JtubehpggG+pdwfL8mhbKG4znYfl/nkM
	lYYGVVjVXlAta8lPYIIAApwW7YXJYWFv1TSIZrtPEViLY2Pt3Vk1T+kWKRTfo7hsONdevOtfMVo
	XfovKtRO4Qw7zpkH/WpaTJwwXEwPdfR0QWGABt5U3Kb3IlFwtuyPZ4k84ADxl/+5Qp2JnU/yTrl
	Gkq9fW8hpHuzTGJT6BZRXjQ==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1006939485a.6.1792658911788;
        Thu, 22 Oct 2026 01:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1006937785a.6.1792658911385;
        Thu, 22 Oct 2026 01:48:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1ef356sm83697866b.9.2026.10.22.01.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:48:30 -0700 (PDT)
Message-ID: <b27add9e-9398-422e-b7c8-de11afebca4d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:48:27 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
 <40657da7-b823-403b-a5d1-ae384db7f3a8@oss.qualcomm.com>
 <6890be00-889f-4dc8-b532-bbbc1f55c844@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6890be00-889f-4dc8-b532-bbbc1f55c844@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wqa3ep7y64O5xvOKgr0R5X8ERDfGC40y
X-Proofpoint-ORIG-GUID: Wqa3ep7y64O5xvOKgr0R5X8ERDfGC40y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXwBxeuMCRCMTY
 2wxrwMLRMYQRUwrCFMh+tvYQYYOJnWsvwT0EHF6ivWJECG61HCLAl6/qRyeg4CTEwQ/s2RlUxLG
 z8uppIecWZ1sRg65Mgy3pbf6gNYfN9U=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9cde0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=XdfhtzbLNWwZdSUk0-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX+0BubsyfQl21
 cK/L6tCFZLcYNmlsmVnP2niyw62+wZ+qkNgv9w57NySLEua06hWUPORmhDyCDfCB+GvGpRY4Nka
 ixuehUWiLzFwxXuKeA47Sc/PED5hMc+BACUmbE2A1zvLzb14DtXdYCfYTXQllMVXaEeuOx4Gtk2
 TwE87E7aQXvIg1Hu/SnCpu2aiQqMOmbvGdd3jh2YJn0rnwLs4DIjnZF2wFGZw3j2GQUH/K2eYMr
 8f0VN1h7OgYh9fixPv7oIeiRDgA12zfPdSMmCa41zBkDFJdI9Ds6W7g4br5SIVZWJLz6sbfVeQO
 cvrnqeY+2FvRNHJxwbm7l9+dZNnWk1uIu9DTaqH199xRX77CvXkicQx/Xe+Q7gT2xJhNKSSHTbE
 T1yyIkkRTg0QfSe5q7SeF34URKUg+7dwSk541xc7CnrGmhfjw9Bh776mAp/vqZ95h2aEd7dU5cC
 Qxue7Lz10r3tuX2hQbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

On 10/21/26 7:16 AM, Vishnu Santhosh wrote:
> 
> On 15-10-2026 02:52 pm, Konrad Dybcio wrote:
>> On 9/20/26 5:28 AM, Vishnu Santhosh wrote:
>>> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
>>> to provide modem data channels on Shikra.
>>>
>>> Reserve a 256 KiB restricted DMA pool and reference it from both the
>>> BAM-DMUX and BAM DMA nodes. Set qcom,vmid to NAV so the BAM-DMUX driver
>>> can grant the modem access to the complete pool before requesting the DMA
>>> channels.
>> [...]
>>
>>> +    smsm {
>>> +        compatible = "qcom,smsm";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        mboxes = <0>, <&apcs_glb 13>;
>> Why is there a "null" reference?
> 
> Each mboxes entry is the outgoing doorbell for the SMSM host with the
> same index. Index 0 is the apps processor itself (apps@0), which has no
> doorbell, so <0> keeps the modem doorbell at index 1. msm8916.dtsi uses
> the same layout.

Got it, thanks

Konrad

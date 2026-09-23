Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B2F414429
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153560; cv=none; b=IeLSD/CB3kErBwjMKj74rj3+sRlKv/to0jQtaX42WsC+eP1BZkxc5FCS9z+zbbDOZlBV0VNeZPtd2lVGx/ZmGHw2aDl+qlXs5CJfb0ZwZt9H+jJ7pbnh+X3aVOH+Q0brLesU6GXPievsHd/FgheObQv9ZsXeFxSTBw3LMTnC0d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153560; c=relaxed/simple;
	bh=PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdsxuFdSKxyvje7ABRfoR0kn3qGT+AZ569bn2vQZsnkF0Exqf1fUA/v+wBjyns/jFmA4EMVxbMr9YqR6ZHKCX4eGBSXwHK1w/HsTrFl3GJZjUlBTR/Kw97byWo+/HRp4igfvRDzrrt2eLVdg6Wkvv2RySJcmYDHGIPZ9PbPiJG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1yXQXZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/oEQip1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1yXQXZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/oEQip1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JcwX1387457
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=; b=D1yXQXZWi905ULVL
	vPltoe3VMdIlemBudUlnlMJ5AztG22PkcN1QTcuLm9BZXiVVVzpmtEg8jy3IJkdy
	KK2gslkctFmg+sLnvKIr9nuOb56TuBdZoVwPzzN9LjQuXdYdawey3T32MMXa1NXh
	/jXKvPkXaYZil5YUQ8fufDYgbGP36eWwgvOifq+/UIKnsKxWtfEOukRyeHmFdfED
	RPTXw8g3qhsXtIw4OxPLjZ5VoSAFMMcePZH5kkVTkrsyrJUWpTAtl7nnKHA8cIRQ
	v/y7AiqNPvEc7m9alyr1gIdS7pR/YJNotK0i7MDWspxD1Bgg7w57/oI1kpxWSH+W
	AHerpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma2yqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:52:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf3eeb42cso20474085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153552; x=1790758352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=;
        b=L/oEQip1IjS0u5oUWJpw7R7omKRCdXKys4Ij1zE5DZQXt4Mmx+8KvN04sf+nwveJai
         SltcnFJT3Q0I4tlzwkijdCGB6Qjdx4m2zw46EpK+orbN24Kpnqz0qk/OyRmrI5hNUEB3
         azRam49oJASiAE0wdNCHLtv6VBJchrqWwxBAu9d+DnIJfjbj0Tuw5tI/PoK4N0VkeXOP
         ffXe7xWxDBJd5NuG30euzqv1KnueP/2suOL+yE11m8cts6qb+zuZtMJsLP8uO2qybEzh
         FPTFu2vVzhvWagZOlHdEzp8LvL2wNK/lcWphRQstO7f55h+1Kp24s0lAuTw1UNF94lX3
         9xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153552; x=1790758352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLWW2hnEf6IevrdZ7b8dtjyCj2TTYWxcRo+NjhzeynE=;
        b=ISTuUkUB4++i6vzCjiGDhLN+Slw9kMVmXRs2UmGRKZ5lVOnOr+79+tcKik3pAG8bVc
         CFM3zGXbPJ7q7yM9aS22jkv0r0oOb1xLsdA2E7+UD+tUBS3vU/vd4WYgPjjTxLhfAFzB
         X8lmliGrpV6a9o/0rKGFD04LKDTho538ZH/ZsEDod0cbY4BMB6505YjzX2YKxZ8f03sQ
         ZnoASGJ3kNVyDsNLn6Wpd0sEpI6wMnIRWWHtjzM9919PsGwaUOVK+GMiwYhp7mpmS61F
         398RX/b+9Q7Yw/eWKDtswn5pHu/JL2p/zrOoGvvzk6HrtgKJFFSimz+o2I0PLnOQ815D
         HzCw==
X-Forwarded-Encrypted: i=1; AKwUvBw1oV34iiWMp3z+l58GA0n8U7QQf2sOEVEPNA/2zETjj5dSr+L5fheprwH1YhXBn/PKFd+QEI+9yYAKM/k=@vger.kernel.org
X-Gm-Message-State: AFuF++n0YHAGGhjlXaTQ6l6UCXS1aDWWQDUWw6cnZM3F6DWBlJ1PCzTn
	2/1jw96qIcKbVBmIwxxR1i9MuCrInMpB6HgjAOmqIoPpd9g4hME2CghRW+R3+e8dSmbzSHleXXi
	BUa/Yg7zfOThVvgQ2qDzWPLqd6JM8Od8iEfMWVrFhYQRF2Fdg5z3jIIdUmogynoS+3vk=
X-Gm-Gg: AYBFou3AHF0LFudVq9PIPFkkVSeGttwL0XYYtlse/Dv3vQPHUqmwTEoTzEBqPHOqRAG
	lhL0yvC/GTOVFLDanFkNzvLu0mwU1a39H+BwmVsbXPltLSPr/42i+aAPSg27IwVHqQuWF98fcXk
	Rtlo9LAClpMcPfrZXL03qJt8cIMxfKpOm7VIJGSrdUuEV4cw9dbv7qt08Q7gi0XnfV2NRulcbAv
	c//kBXpk+vcpIBJN9k8+dmswPWXXXsGGFCViu/buLy9IndFm81eX/4399KNEclVuOaC+Cuz0GD9
	ZNc2AyxXnrt7tBujmLmN94FEXHN1p6gmceK7uFBNEHVYeTXq7652fmkp4hyRXzpPodUuatDbNoP
	jt12ahwM+YBeCRUwzw8+nGA==
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr256690285a.2.1790153552429;
        Wed, 23 Sep 2026 01:52:32 -0700 (PDT)
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr256688885a.2.1790153552106;
        Wed, 23 Sep 2026 01:52:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c604fsm73371366b.13.2026.09.23.01.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:52:31 -0700 (PDT)
Message-ID: <cacaa28b-28ef-4f69-b002-2757aac2a50b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: fix endian annotations of BCM aux
 data
To: Rosen Penev <rosenp@gmail.com>, linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260922182711.25176-1-rosenp@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922182711.25176-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0d0JVd3CTRjEVdklnvBUvx8leW9oaUbk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX4OTbDj6kDoT2
 /DA0ftjy9afmtTygL3fWKCege8TlNyguq47cam0sv+6Z4u3zVaOGlTfiGPoLfMDj51JnDO92ewj
 FyOof6Ef85OppCxWxfOZdRJfG58fJ+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX/epi/ngQQHpi
 4HYV6W+3OCERl5vTxBv0BKSUvmm1np+65kvbsRzfCzGN/sQWBlzOzsd8AJENVdJhBaoQFd/NABj
 V7BpgnEURo+Elo6T+bZ1/0BaNauK1ZcoITB4jxl6fl5hD5oIPQ7jfNMmtPxvn6oDwGzfvWKRKZb
 Wa4YKVYozxPP2ZmqgMRe/YPK0Yk0/uJ07rjZXMGPD/gEYUnQRH7issvrmSyicOv5guzCSmYcDxE
 wGgzagxbT88sGbDRusK1d4OSlYZY8nedh1VRUDH+VVF/SwEvin3Dr+Wb2LkPUup7JZ3cudaVWYb
 lhBrEq17pj4QADTjcMC7COLScX6x5tuDxXZfU7KQHT1EXH5yyXURaocO3TQ1wqzAvpKGhjxGMpH
 QCLRmRQV8t5a8tx/zwVyfoY9/WUjPBaUwzDD9wf51xoiYZ/6oDeh3nbTUQHpRb/rq10X5zPowZZ
 gk9QA2b8LRuzhzSdyJA==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab39351 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=kBXQb9JHnCtroGRzBYQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0d0JVd3CTRjEVdklnvBUvx8leW9oaUbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On 9/22/26 8:27 PM, Rosen Penev wrote:
> struct qcom_icc_bcm::aux_data stores the values parsed from the command
> db, converted to native byte order, but is typed as the raw little-endian
> struct bcm_db. Sparse therefore complains when the converted values are
> assigned to the __le32/__le16 fields and when those restricted fields
> are used in bandwidth calculations.

This should be fixed by using cpu_to_leXX()/leXX_to_cpu() when
accessing these fields instead

Konrad

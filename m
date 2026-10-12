Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49184361675
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789357; cv=none; b=oHh5rRRRvPPAVh3d4IssevcUylPn3pq/by3nC4ZyHGMoaLP/f5+iRqZW2j812pqVxRjgUtaithG5xotgeSbDlfdl1hMf0DWbPN2mNt71NdWmk29dcZP5M2UsWjfLIhy4U3H8wop1EdgahY9h2f0zGPTF/NMORHlJ7k9/WUYpM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789357; c=relaxed/simple;
	bh=Hd+BN6RDJN6bk1MufXlNzSJch755k2WEFTJLN4wFdKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DemhqDeIZa+ofgZVvy2ZCQtaTzVoRQx1sV4A87Gzhi+AfirNqmoHPYD42KlpdEYsV+dkHCAUwdE+64bi28keiv9PKXLFuYh/gyPkn9qEiiFhZMO8zLi9kelk++rTgxGJQch4otp0g06a7xeYZ5REqWtUNizsfNufCEI2xtECvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJyoUWJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0T/8PA8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJyoUWJn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0T/8PA8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PUL91786870
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=; b=WJyoUWJnVa80v1H6
	EOaC9TlLKjEtG9ZG3YRlYXMTcTdcU4ysz/tK9Q9XJ11FGo/cVHXjHb4WI6Z+fqej
	uSkC+9VwCsWPgKYs+3bay4Tc0b84YWQmPYtphL1CxqpdcBD5hvddCo6CI/30YP0r
	gGzAwcTWlx/tL5LLf/5szP7x3MJWbll/kkziPrz31C1f60Zcx+fnVCLEnAGhDJf/
	4VNR8clDPXC0X3IZMyE0dDKghB6g7hOYG9+ns95CLW27JTmRQoS4BPtjeavjaUS6
	A0V0EPXONjCRVPfMxAPRBZWr1AtIRtDrdFQY2UvBfxkORtMmNOTLpmqWh/c+GOJG
	OmKWdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rfjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:15:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5352eb4510cso2608051cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789354; x=1792394154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=;
        b=G0T/8PA88bV/4HHHhSiBKask51Qt+xEKT+cUcns+55Etv3lEBpNKe8pnPy1NM+EJqS
         Ggntt9UmjWK2cBPXXVrJ30paDFTAjusVWAtvDGS0zYjNhWhs5+MEl7vFOkTEEX89k7Ye
         pDcgJkiOrzUnhu0LGLAWK9dg4Yck5QgfIwTlaUFNicl3CR77OZ4kp21RG4psoWwOROyb
         xtuLhn1/XY/NH3vRFfKRvUmsmKtuCc/oCJy5NQtOapj2nlz0+K2R5CGl5Nb4/oUaqE5y
         79gwEGnfY5Q17yTOXJPmfthmmY44+s4LF8XI9UczOHrsAZQrUFSWmHUrKKPQEhVYRmBc
         /HBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789354; x=1792394154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=;
        b=OYHnOy14eOvM7+/Ih1yQECnLC1NX6zivQI80vp0oBdcXn4sY0GbRdaJpo8Ep0W97F2
         zQauVZxAUboiZhxT+z1XeDuII6f7tdnY4U2vtx7hKvmTW6KP7FwmqFMBxExOtpemIGIP
         y5aNPoLOzmkEJ6yY+anCHMRmiAUcJ8CAJhtTa/lv7FKmAMhFNPJYNw9TQauEBi9qI63W
         8tsRaTzynYcAoQ+YF5zsoaiK/MPCLPAg0qFVT7dd6NwuFXJKOXXtx8hOzJgnra75trmY
         4aPyYZGmoK0csrB3vmf5eh2pVJ2EFy34Ez1CdydAuEgGya8I0gXctm7Iwms/qpmKBti8
         CwOw==
X-Forwarded-Encrypted: i=1; AKwUvBwDYGMgk2dylW4yM3M2Wxa7wFWllKEYWyowpvKXtv9u0wa1/iztSZTAFuHabWqJQcoYT7eUcV+BAmZhzE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh9Bl58aTLXqCexPRUg59R2RnqBFprmRaxqEhtgmhWY0JtaDyA
	Pib8k8YD4a73yF1VqkQXzcLWujx5LCmE563Z4OlQfX4hdVBrjGaaORJYWnh2U5fDDMV/Lq5+yAP
	6pF4KI7OzgBd2ptvrq9UYOTNEWestSyuZHkYYyXXf/p0FaOadQx1Q2f7AV52O5ex0F3I=
X-Gm-Gg: AYBFou3IDR9Ye7LvwKAmfvKv9/BK267j+MKvNCM2OmLfvqTWqyWfUMm2X7T3ipnqIom
	3uUAW05Px0067MuPYNpVpHwNOcCeSyobJ3OZI0XbOc4XKeuUhHU0svbCTKxE4ND+/UwSFWNAi+u
	baIdl4hbsPXlHl9hCKK0rVTg/Mig9A+X/8wuzYwqVTTly7LV+fWMlyLmb1VJUWMZ9gpdswKMs0W
	Y1W0dMT54XJVnkLpgVJnmJoEtA/NA7dR0tzafAejMukcba8LSw9xDBfH6JTYbGBlItCjpNbrl6Z
	sXW9meOaH3qxbhIz+CBc4HYPinwaUkX7J2wytV79zuFk2FGyE6pisXZifGoek6pdCS/XdehEpRl
	S1JiidjTaGq0+napvvQG6uQ==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr1612193085a.3.1791789354456;
        Mon, 12 Oct 2026 00:15:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr1612190985a.3.1791789354033;
        Mon, 12 Oct 2026 00:15:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3382b8953asm199591466b.21.2026.10.12.00.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:15:52 -0700 (PDT)
Message-ID: <8ff749b8-2ed2-4ccd-9f7d-e7bca7aeb38b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:15:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface Pro 11
To: Dale Whinham <daleyo@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004165132.4313-1-franzelfranzel@gmail.com>
 <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
 <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8R8Qn8y4QeC41qzhoawzHfIw2xBWFF-t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX88EntrUmhot8
 EZlO9QgWq/XJjMxXM/wyrDINY1prSWFSxAIuG7i1MYZVTOo42kOpO51dDNJXsuTfkcGPxHH48NF
 w+0lN1UZLCuK2O8WjLQ6GSTzNKhwKy0=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc892b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p15cCi0eOIm9mb8E23UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8R8Qn8y4QeC41qzhoawzHfIw2xBWFF-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX3XzC9FjZYcQC
 Pnn4JdWGyhPS4SoD0uRmCGA4EntXUlIRlBFYrVoU9+IGv3Dqf5521YFOpd6mnX5Na3D5mKZEJwR
 0S+ygKDHXJhblVzyNDRI+9zl3uZpmFZQ7beMhsm5RuhRdbZEzfLjoQmrNI2mNpy0IxWOpAOQ+P7
 r0HJz5QRPY9SFtcdp/aQgFlAhLU5+AWXkN1KLvPi7W5iFnPNl/oL1REkLKjFe/yszQYgXnc8grA
 1ws+xk36/fu3NZpxURPtO1fmfqDL6VHt1If0yrw+1dFFpINGxCOHB8+xqk80wqriikm4qsDrhDn
 0hDmFkxczjNm/+DRCteQnRB3sVRq84rcadOUehjBXnrVJ791Ujs7Sy6rOPDNjrwSImv28QX9YFP
 2sBjIasejKbdzmiQdl7Yz5s2eCh1bnvPTTaf2dpS0Amb72bWkA4MHIMTFVy9BClmNiI9qyXJeHt
 Hv+uTu5obk1f0rYsGag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120028

On 10/5/26 6:50 PM, Dale Whinham wrote:
> On Mon, 5 Oct 2026 at 14:37, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>> my preference would to to break this out into a separate table-driven function
>> so that if other devices have this issue they would just need to add to the table.
> 
> Indeed, as far as I know Microsoft Surface Laptop 7 (aka. Romulus) is
> also affected by this issue.

I can confirm

Konrad

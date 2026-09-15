Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C763B3895
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449799; cv=none; b=rXVe1fX0BMHzHM25kEAGbv8uk26u9oH08Bk3eBfAuFe9O04bF4RVnJW8w6ZaGxZtRauiWnC5KzFwI0IUQK3gwnDOMG2x8V0GSZHItbES7Dn3Y/59zl6vqi+8YOcuejFwlY7O6oLt8sVRqGlDgAHZg/QA6SQY1dAtFtyVZ7hyajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449799; c=relaxed/simple;
	bh=tI4DS4Edvy3z9i1bmkDFio0fZbfcmUH+lpsjB7VpXlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEzlXVEbZEaNpdOLHb/sBJAS668zkdMJKaSJsU247KUN813MX0hyGHgZKuP/tLUzL34ywB9APitnvMyhlNNBdxx9jvn4UMibv9iG35pr44ZBoAYnGMb917fLvDgt2G6as0h6zrIlEny+Ej3VTLzeiZsnMAuxXoTChQ8o1ZvrIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLxnoxmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0UlH1ui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLxnoxmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0UlH1ui"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2ndkY2823145
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahgAtWxFRwy6cq9ng7VxTyalhlNA7iHoeeWQVniYX/M=; b=FLxnoxmxl1XZ9BBw
	QGUKqn7DwFY+nscNlV5bzxzE5NYptx/u/ZetxDR/DgLEXefEfoq4lElggx52WT0W
	WzYRzr5x+bWp0cGDSYDzLWPNYrXpq3VXboGjrFcYsWps9HwrJC2upheBRjYPVRwi
	oinwl4uZMM1Rne54+hldIo+E36rnd2Fj6r6YFrLRlHKz0d5LBh6nQHufFmGuLNi6
	A/qxihasUaHfrc8tHFRMAAtvbk0T4GPrt1893cotV7QMPVwx/H+TLo69Zw2m+e4+
	58YPcFlU51DoJP+0tzZLgA/3hm0OsSWPL+KgM8eolcsLYQweqqNPja/0kep5/f9r
	1ncUsw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5vghe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:23:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5480239a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789449791; x=1790054591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahgAtWxFRwy6cq9ng7VxTyalhlNA7iHoeeWQVniYX/M=;
        b=K0UlH1uijS38bLbCVGbSC6qJ9Kr3n0BggORQZn3VHX1aLZyj/ovgW1sGcd4SezUC2u
         FuwKV4tEpeZ7U3ob3h/QQuId2XVrL/W6S/0uxn21CXra0Xg7WgMK0wKH802X1bfjwaS8
         b14w9MOCqx1HYVG6CcPAfQw1wG2S8M1QNy47yFWeMUQjp4GJ3U9SA2FqtaYyFoIMgwX7
         rqzhdGAWtQAbkzde3IGUGDb0bKwfI6PEGewB+lm5ba/2/PqcFzuTpo95QyTeUHyEirAx
         wZWocQnGk5HCIISPQtCd9ae41fffBEVrPsIBJvtFxirR7phoMxCD8DcjLoDtEm1JloS3
         L29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449791; x=1790054591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahgAtWxFRwy6cq9ng7VxTyalhlNA7iHoeeWQVniYX/M=;
        b=ypGOymL8CU/LzxqfqrEdeeMMNYRGRw5/od/B1BWuX9nGULKPzI4XUIWQ6x9wDEpT1k
         4qkeJyC7D2Cb1IgFI/lursRMmJYitGDw0lwq2XuUoLu4q61njUOruuVKFCRZZS8tjDUF
         Z2In6C+Qv2DQTChhiGuFWxeZA5/JKKskVLpfIunIckE9fc6EbgOTIvDz5+8gSZOgBUtp
         FRIhdL12q7RtHRWrGFeQS7rxbPSm4Dfi4AOd9oT2rnNYPIHRu+tU6DoBCxKO99szF3H9
         +7ASkjzGHgegjH86kxGuMM4v6Yv4ucmpMfVpb4HptOnK61RwIp2kl6G3YElHkodNe+Lu
         9QrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGpk9eZqO/MYOLGbBBB9202q8UNcwMfURmcWhPi5WOzWwSvrSJzRxT7sWqAocN996PgPNenycBZwZDHhY=@vger.kernel.org
X-Gm-Message-State: AFuF++kYJQiMKheFVyEmxEZ8EDH2Unn8xo7xb1LwXQS900BLOTl70o4u
	V/dwrZtbLFQavhWCBfN9FEOXtzfVVBJotsf6NPCzX1SB3pmPc8e0DFAkY5mQvZcu0AWdlqCsuE0
	mt9WHD6TTWmlTOMSbHhMqEyfHvoovKxHanNnAaNmzB9wk9NnacYan9/ReLT3r2ijmqq8=
X-Gm-Gg: AYBFou0azc5jwl/RLyFhlhWiEyQEsIXaezfKHUmX3S95SjhRJlKck0m3idVfntoO/pg
	gs4drn8o7T9rEjLl1YG7GEK7B4kGG87uKoAaxs2CwKo+EnfXJHdGV+w3XXkCLA9SkKKCDWk2ZxP
	uigO4vhRIiVn9ohY8S0DY/A60b8dK8tEDTnSdAphkk2uxUzMCfrTwJ81APHqghouhCGksO/Avwt
	GYWgRwvv5Bd/T9EN1mckaLsr+BKiy+apKuvW4bBVEpYWLIa8PNff7Y53KfB6ylTgGV7WR9k4Nfn
	UDnuDfbeKTPWKvMP7/StLG1T8FJVX1uPkpG/9X7sUUx7OM2DPVp68NvGrAyDfsvOM8zr+2tsflM
	xwjFdlmYmde3xZjmrgGuqIIP4uqiDCzYL
X-Received: by 2002:a05:6a20:728e:b0:3d3:aec2:4dc8 with SMTP id adf61e73a8af0-3db4059257dmr12375133637.20.1789449791117;
        Mon, 14 Sep 2026 22:23:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:728e:b0:3d3:aec2:4dc8 with SMTP id adf61e73a8af0-3db4059257dmr12375051637.20.1789449790628;
        Mon, 14 Sep 2026 22:23:10 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf015csm33549798eec.4.2026.09.14.22.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 22:23:10 -0700 (PDT)
Message-ID: <3e28ec09-4378-4cd7-b786-ddee520db5eb@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:53:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-1-b0a82721c547@oss.qualcomm.com>
 <20260910-neat-goat-of-prosperity-eeecaf@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260910-neat-goat-of-prosperity-eeecaf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3NCBTYWx0ZWRfXwSR2NZmTBJ+L
 tPaZhHwcd22eEnm5/XMWoALCXv1P3hUMbTZM3PLIoKKR6S1/VWlcpVp9T5kDXtOLQqASzcRTBvJ
 RDviRoq5bIzImwuCfccdn3yfZ2YCFlc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3NCBTYWx0ZWRfXzC/KRVOYfKHv
 WrvnJ3zAkMq9kFaLfWPAW5+tHfG4n9neCL/MNrleKA3QgJjrAQatCdJ7xs1Jo5O2+/7lgVazpco
 2Why3pR5YFlJdMkemXjStsmOu2Vvzu8Hyb0hrkH+o/RE0ATWKR/fDd+EMOawmo7XUYo9xnHUl0Q
 vnL56JhD2DvfjXuV5iUpxUCkJfMyeSKZ/s3gA0CeziRGaNGDbx3NscfBQssZ4VYM/YCQUOnJGyA
 lX9heQ3BXhUWcGneMJYxfcdhmKYM2euTSIGo0HqfNYYn1PucggbPZwg0MRNLlGFcs46XvxeH+mh
 ycgAZid9FZLl6muTrRmIaL86zY43HxU6qh8bhKEaX25LpLdwbpY+SJaEnGWC6f2r8AHrT4uGirQ
 Snw0SJGQyEKfCJRjhPa5gF40mQY7VF3O873+Ujfm/7vZQvTNU46eZDkE0YhduSBOA78flkDv5p5
 z2koeIZtwPjOxFXY1Qw==
X-Proofpoint-GUID: u9m6D0b7z_sb0HC915xDYCe0cX8dQcIn
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa8d640 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bnyAZr9--xUIB8vRdWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: u9m6D0b7z_sb0HC915xDYCe0cX8dQcIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150074



On 9/10/2026 3:33 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 05:18:16PM +0530, Krishna Chaitanya Chundru wrote:
>> +  vdda-phy-a-supply: true
>> +
>> +  vdda-phy-b-supply: true
>> +
>> +  vdda-phy-c-supply: true
>> +
>> +  vdda-phy-d-supply: true
>> +
>> +  vdda-pll-a-supply: true
>> +
>> +  vdda-pll-b-supply: true
>> +
>> +  vdda-pll-c-supply: true
>> +
>> +  vdda-pll-d-supply: true
>> +
>> +  qcom,link-mode:
>> +    description: |
>> +      Reference to the TCSR syscon and the offset of the
>> +      TCSR_PCIE_LINK_CONFIG_MODE register.
>> +        0 (QMP_PCIE_NORD_MODE_X16)        — all ports ganged as x16
>> +        1 (QMP_PCIE_NORD_MODE_X8_X8)      — x8 (port A) + x8 (port B+C+D)
>> +        2 (QMP_PCIE_NORD_MODE_X8_X4_X4)   — x8 (A) + x4 (B) + x4 (C+D)
>> +        3 (QMP_PCIE_NORD_MODE_X8_X4_X2_X2)— x8 (A) + x4 (B) + x2 (C) + x2 (D)
> What does this mean? The phy working mode is defined by phy-cells
> argument, so what are these numbers above?
I wasn't clear on the description of phy-cells properly, we need phy-cells to
be 1, so
that controller nodes can reference phy with index indicating which port of
phy being used.

I will update the description in next series.

The TCSR register is the real value programmed by TZ to tell which mode we are
currently
operating.

- Krishna Chaitanya.
>
> Best regards,
> Krzysztof
>


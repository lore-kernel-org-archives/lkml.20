Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19145FFA4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982116; cv=none; b=M2bs9Ctx9fHDOuDZcXjHrTzvGSLg575CrtUZhMQmuj1fKUdGaFvskUJYnBiUjY91YGSd3ZvN5q4kSwdeAvSNocSpF7f5FyKFma1rKyR7xKbLlnxVHu96ur0AsZHwQHg9BBVMEDCJ7ssx5l0Ih8oixYO0URIqXfDZfaj9qEd7Sp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982116; c=relaxed/simple;
	bh=NgDlzEiS0NbsIJziEpI4M8ZIVcA7puykB/WP9m+iYJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paoNM/KQ44f3VzGtQfdQqHJafcpwsAzUjKz4oN09ULThnDRfZ7PGQS640lbIbOnsVTiGOumb7B2Hy+LrnG4ntkQ6fa5SBV94bc+SEzwCHMft60iwDkOfullwuBc/5iAbnd+vQXeZANWrzS31W/kBQ9jaJOZ8XpG5+t8hFHc57iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6lpFupq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7MNTzK3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6lpFupq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7MNTzK3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7EHbK759259
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLhLHWDFh1O3xJfyugwviPWr18h9lNQNghkpTPHNp/Q=; b=C6lpFupq6eIsTgEz
	AxaRqx2vny38HtwLqcSsrou+mjtaqfEjUp0xWzC9aaW/IpSQca9A9qILrN58now4
	1zLyh7b1uHQYhE9Jz7SoKuVerVoFSAV1sDZzDXfQKXWXaxRqbRY82344EoWVf+Mh
	MSjWb2Q0saRNuaqYm2c+lrjcJb1JGvJyjVsBp4utM+TAsPpmIwoh7KPkQGvXaKM5
	lB0oNFFp1Y1onyo1TObIjHY215VwRD/x6s0dxKuTSi36lVNAwzFgFOZW6UfYcYfm
	U1W2uN4wuFU585zhiPoV5qWLwDgumc76OUUkSqyG2nDlOU7dr/amn8Z0cgdq6yJu
	eWLscg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118ft4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:15:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd188e16a2so31354475ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982113; x=1790586913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLhLHWDFh1O3xJfyugwviPWr18h9lNQNghkpTPHNp/Q=;
        b=Q7MNTzK3piy8+CxthyjW7w+BCYa9dDcd8wlDM94m39xDi5+f6oGBJ6zE1TA2ZGbird
         kHoFiz4wCSxRCejNKiJHCU7bS2mJW/VQG2UYdv67D/fCB5FEN3GsYo1ixtctIZ2SvmCO
         1pAr+ANw0e5kolDe24PRjYSw6kA1LsAHNfyiwOC8Vy4aMFJdVFlH7hM2UZD12qeWF53M
         YxeuDf14gOgMSA/UoMt2ed4voKiNCcZKUYMV0ryTOYWjGOhHHS6ZDDC+B7cumpKMSvRM
         xmzJJPC1OPSO3W5fb83cEAiY+0/1Nv9c59fjmySueFJEaiBArJxwy0XtsTa2Lcp0+jgN
         9zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982113; x=1790586913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLhLHWDFh1O3xJfyugwviPWr18h9lNQNghkpTPHNp/Q=;
        b=hwilxWOUz9O0+YgBixJli5ocJXLzBzigSghpzs+svraAcS2okubNkcDgtT1Xgjvgr+
         fjkA2fMNWTKY0caoTVSwlb6V9D5RWTnUh7qfWro0c+HK2y1PN2/69swj+uLE+2lzeL5E
         Bn+wujjHPe4Q3m3SPP5HbEPeLkL9t21GamyODHUZAWdYOhtQjtaQT3rsSohBksyccun7
         ipjdArg7YYWLv2CTRK86dyrD4f9HSQBnl+nWFmA1eXxZxUGtZ+WL4WBo1ouFzOiJs/ac
         mJ8O76cLgaOSwqpuSFDrv7Xiv/4rsmTbR8i1cSeizAGDx/4QOJr5V/PnJ/dNJypd9E/G
         HH/g==
X-Forwarded-Encrypted: i=1; AKwUvBwFUQ5afJ3ku9qj0BkhoSAbCHU5SQBrNbWCJ9wbmjMPM5knO9h3oZ4CAGh6++WjydrW3Ix1XzZBTQUNM+o=@vger.kernel.org
X-Gm-Message-State: AFuF++nFM1p5sOZH5+o1SUzv3kPODQHsqeiidDHShRw7a7hCTarHuJua
	opUN4EI7ydu36qYg3C6hZM5qzlxqhe08Fz5xRA+p+Z3qQHMAJw+hRmOsXoADubz+5hMeXdxv5S6
	1a9gE12U4cpBzMvgRh7M8vcydlsCOh3Q+FDaXxMgHO9kbXOOyVYowzNT5jWx7nwiRhjc=
X-Gm-Gg: AYBFou1rF0ugmvfRjMSXjH/TEcJYEGAmMVEvepk7X5EftDZcH6hzeFCRxsr0Ffe5LAv
	R+tnCsWiQJ29bmYOw/MTMyCTQ4EkD7sp5zPGkIiv1x1Xy/vkoFVC548NGXmWJz5QoV6y2wONYPX
	8godMMwu46XX+wcwtSI22xNWnkwX/4EAX/8QD/adYCSwvJCzfM0eOMnj/Nh2kMoCGHSff3xC/TH
	shawDoIh0fDFkFgQa3qfvhXD8L/qA65dFARIB0ZM87TJVxMTzH+J2cATqYEKVhbDn3e7NOIDhPk
	jh6Vu0EqVvLPL/sUl6dyB11/dwrcmYmMyBmYJqNvMc5Ts90NrXomD4nU2VOEawDibzMurx7axu1
	COrBce7kQwsMA257HQc1WzLzd79R6OH126VmAvOb+QFnh
X-Received: by 2002:a17:903:468e:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2ddc1005f8cmr91844565ad.56.1789982112831;
        Mon, 21 Sep 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a17:903:468e:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2ddc1005f8cmr91843865ad.56.1789982111982;
        Mon, 21 Sep 2026 02:15:11 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311ad4esm17917215eec.5.2026.09.21.02.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:15:11 -0700 (PDT)
Message-ID: <65d9422c-d691-4b5f-b1f3-c2ae5ba5cfc8@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:45:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qcom-qmp-pcie: Split phy_ops into
 init/exit/reset/power_on
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
 <20260915-align_pcie_init_sequence_0916-v1-4-0b2195836f30@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260915-align_pcie_init_sequence_0916-v1-4-0b2195836f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rGfK_4IrRksY5VUAt8mAyo9kc3a5PRFE
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab0f5a1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DFGctsAPzAe98lL7n_0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX4g14ImY9uJ5X
 ONy6yZqGFtbQ/CRjzEXbNVdLk+LlWOiS/LfFq3UDH4VN6S1GXPj42CUhhLk0qLBVNIQ+miATANi
 N4bZBhZVuwP08n5U7NNtVz4DnFhx72dnGxMIQ5mTV2S2rtBF1vCK2RxVez29WNm7nYrIeWrMSzq
 d4uRCLJnyPcDFifiJvrQZGNteoDP9eP1YXPtF9UeiS5vPDlfMlffPsZ7M4JMUqGY/HPNZwn610f
 7X9YYFL2/+DUaftIr4xGH+PlJYByauCf0aBpXwe2+s6Cyw2RnY/fsWFpNv7P/FiV7sozXk0e2iV
 CxBxS1JgCSXaJr98PVygc37W4/X7Q44vmb07WpR3R1h0vBULb2ROEY6r08rzcTG/XCx7Ccx9Uo5
 f30HARb+opvDV/QF1z5BP6VQFvlPilmReRvGJoR3pFTUSUlWAHVkwvjZyM4anOw1qGr8Z+d40FS
 4+ODext1vW7oRKF6H+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX7B9Hc1o771gg
 9Jmya6gznIaJiGfuZo9iWWS76ML91SGjr2rcKVt9OBQBrzcpVD2jjxRGXe3gniQvVAfhJmfzHNm
 3n1GlJpWNCtcuquWGf3qCjl2+pF5M/E=
X-Proofpoint-ORIG-GUID: rGfK_4IrRksY5VUAt8mAyo9kc3a5PRFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210131


On 9/16/2026 11:34 AM, Qiang Yu wrote:
> The controller now calls phy_init() from
> qcom_pcie_host_init()/qcom_pcie_enable_resources() and phy_reset()
> from inside its own core reset assert/deassert, so the PHY's reset
> toggles alongside the controller's core reset as HPG requires.
> Making that actually happen here needs phy_ops::init and
> phy_ops::reset implemented, and phy_ops::power_on adjusted to match.
> Split the combined phy_ops::power_on/power_off into
> phy_ops::init/exit/reset/power_on to do that.
>
> phy_ops::init enables regulators and all clocks (pipe clock first)
> and determines skip_init/skip_reset. phy_ops::reset toggles the
> reset that skip_init picked. Register-table programming used to run
> while the no-CSR reset was still asserted; now it runs afterwards,
> in phy_ops::power_on.
>
> Adds skip_reset to struct qmp_pcie so phy_ops::reset and
> phy_ops::power_on share the value phy_ops::init determined instead
> of re-reading PCS registers.
>
> Signed-off-by: Qiang Yu<qiang.yu@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 184 ++++++++++++++-----------------
>   1 file changed, 80 insertions(+), 104 deletions(-)

Verified the PCIe enumeration in IPQ9574 and IPQ5424 and it works fine. So,

Tested-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com> #IPQ9574-RDP433, IPQ5424-RDP466



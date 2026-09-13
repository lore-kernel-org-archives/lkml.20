Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECA536604B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313112; cv=none; b=qYHkqoW8ekH91qNrPhXzEYVNb4XY2ypWjuqzx27Gtt9jX2SIlqZfQXc0BnsSnu4vOO5yDq7qCu6kvZJsDe9tOfF9rSPDm01GzBcdjiO6zGfd6KIhFhOsJcfoUEKWDXWmwC43FLKe10UwiSCpHf1h1pqeoqZEylS9gmYjFKOlwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313112; c=relaxed/simple;
	bh=ld4R1jneXBW1hGoO0VRUWX/Y4qVOEP+XupoaDss+ItI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vg9/OOWv5GJfkRlzgJ35v4cLLYFBzWKgQPtmojEtKV0zGEfBR3wVoKkS/mshORp7jlCVgU+nJhwxw2h4ZEUnQx5qR4DCBlIiMxDSGrsJrlo/1IaQSqPZuQZaFih1EMz0zdd2x8hQJ/DbeAfp+HEaXlG6riKECgO20Z2XRAjwh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UClpXggN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfSCuwFm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UClpXggN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfSCuwFm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE01bS1951281
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=; b=UClpXggNDGnUoju4
	8s7pg2DMW+aMyZIUBvoIm3xqhEDNuIZ4G7sd4CZmdYMnHd9zDSUsG5sjzuWrZDYg
	qcVEOykNpnfBaM7ZnrgJiKY4L2LJZCYnSRsf7WlQ/j0Qy1Mq+Li9c58BMLT5crGK
	p24eMVk9QrUCvPcDchUlxN5jCfOie3h0kC2kYxMJblMD7ubKLtio4iDmTlsw66xg
	cyLXq+/xwyLLBs+OnBgqkVROVXdGzl0r8tcDDDGFaQ0xLcMvAt9PNDekthiXMMql
	YhphqN8MA4xiN0Yy9MKDIVHK6ojMwvU5xHfOmCySmeQzZyAhh/cX9+QiEU3mjX0F
	jwC9Vw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d3jaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:25:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so3569731a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789313103; x=1789917903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=kfSCuwFmeAoDKRa2E6ut27zPUILuazd2eQSuCF56wpXRAas+N5VntdtbODwIkYSVCQ
         t6qhgXGPivLu50pzNGM65Ka5q4TVtCpG8a4cCiiCvW/yO/d2MTPFXT7KU4Qd+ocr6E0H
         PEI6ZRG+mRNIKRE4HwSE3wKhJVt5rvAH3fv9OkADUvuG6dR/ewdEF9bgzXYnCsQz4vIU
         mNiq4WUWxmq/NgeI5oIj8uuO2zwTYNyo8pmPb1n1fVcqJ6Bbq40zdQpdAArhX1PtYetD
         zz2v0JFSCZ/VcA8xurDuX0gYtjSeIq3bcTkPJkPWf/OIjC20LL4ymj1GIAyRV9iQ6xGM
         amQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313103; x=1789917903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=fkrC9cgLxlOy2J8diLs3mk5NI5z3+xfI6isCkvGB+NqUfA2PEyz4LWxsIcb0rAiAdA
         pbP7kd73VrBApUrczXGMtCtzAGKHwD8W5rwLtlTnQPGl5fYtBE7N119KQc1kBsTVzLE+
         3dx0PosFUUt4CRC1rkS7nhNbsfWjWVApHzJW2SFQGjs8ddVI3ZvPjJyus3BWjywS/K+M
         RNYrLquLz7Ral7+G21fEKPMlK5HjUyd5rZ4bi0cFdhkgifD/LtNT3hQ+OSmdp/CKdAw7
         5KuzGdPIceyli3QR+pxCp2hXNspHSqec5qxur5tBcEaiLTx6ZJneJE3GoWTzUiWGwc7H
         K8aA==
X-Forwarded-Encrypted: i=1; AKwUvByi79sjvjbuatpgq7HrIhgoo2ojRon/0kmfdSNRSdCeAxaksYH6DO04kKi2BVYrLrjx7gpPKjFWz9/ipC4=@vger.kernel.org
X-Gm-Message-State: AFuF++nAgtD1SXSPxVKk9XxHErkZQMqh7pubyPOQji7A3pjAAGsQFE27
	0z7ksW1SjtzDk5C+mv/OazbCDjZ8bP60OFhiRFSsAh5cjWhK0tDbSGkmHmhQ8LWhOYA9w7eGf/K
	58uq9FUmYUDTUCciekSHMMgHb2o8530C5a/+o3elq2JcmX/54RZ+wywL/C+2cenYXaDM=
X-Gm-Gg: AYBFou2OzGapf23P7bjUrNdevEiVdoipr7zZY8tmVqRXJ/lO3kBH6Qejv9ylkl7KfMQ
	dl76mGw2avLYxdLz3psMRksedhoPRDRHrkwlBpUSL7OCd3bRQoo6ODE/cmOnLyPDMiTcrlVib4c
	OVqbD96rwMehJCPwW9L/TItKjmDdL7OCc2n4Zb1aebi8d4cNkjMd1DmbLJM5h+5QnvoJ9a/bsm/
	PJXCSwEZSYOAyxP5ljVVEmTDDrOcZn0aW2Yvyuv/52qXOKpXs2/QDxUhsGS6ybWNkroKjIIjSO+
	5FM9ARRTuVoIMASh7r0AeNaxBwwI15VIp9M7sGOf2KflyMkx4KLFUKdmQFRuOTRJEArANxWL8A0
	KN7pNGWr/UcSf0mK+Ow7qU5Q4z49G7bDU99M=
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011595637.17.1789313103232;
        Sun, 13 Sep 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011548637.17.1789313102860;
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.232.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm19916161eec.13.2026.09.13.08.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Message-ID: <9345454b-4e31-4224-980c-0066c912252b@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:54:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
 <20260803140222.GA3188037-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803140222.GA3188037-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfXwzSq88ysKdhm
 U1psjK1xHJnjcMzOvJ+lDchMNPvYnBuX4+ji9w7141ObKOswZ+OlM4bKd0ehmB9XFhGLMY4Y6Nd
 apnCiIei70Ww/5G7WalnZqXCmR7K8kU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfX7snXPY00/qGU
 Rrp+FXJMZGWioUOcZy0QdFL21WwwjlcookzkvhNSafPI/Op4ych/6zFfX5uJoPUaf1jWO3p34xL
 /LY2+2LksP01CbIMRH14mcr2lx2bIAwBhgvxQbAhX+Xngb1Wm/TZDzSRP0VPmcQ0ZQPFIqrWY3R
 o86GxSddLFjeETPOJoyyTUHs+vihiF99YvTkSRSLN2pWEkETFM4kIVqJRBALLMwfELWTgKI1pHa
 zK5ERMHVgNeahnN2Drk7eIZUCJfrVTXZfT2ath82tYQ45PZzRWZL//EUNICcRlVkl9AOljbwaXQ
 mozBL/ohR8pbzjvbISIMlkvNu4K7rtDFbuwg9JHUi7hnaFPnAj5zwYgL/iCLzcb7cqs2Yvi1X4E
 3f63UaId0LAHVuXSGvtXGqvDY6tKmVLknw+i9mNKQFUAeN7uRFZNMaR7gUFtz7IqNv1aPNH+X7p
 vkay0l9/aqwDjHzSfeg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa6c04f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ExSUBmHX20r5BGnuCy1yUw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=q4JZvQwPHRNDhfj5UpAA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: MhUPy_5bjS5FqF2oPVf7arNd0MEJw4WO
X-Proofpoint-GUID: MhUPy_5bjS5FqF2oPVf7arNd0MEJw4WO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130220



On 8/3/2026 7:32 PM, Rob Herring wrote:
> On Mon, Aug 03, 2026 at 03:13:36PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.

[snip..]

>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
> 
> SYSTEM_RESET2 was introduced in PSCI 1.1...

just wanted to check on this.
we have a max of arm,psci-1.0 defined in compatible.
SYSTEM_RESET2 is already being used in some cases with "arm,psci-1.0".
how should this be handled here?

thanks,
Shivendra

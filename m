Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C06130D41C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357662; cv=none; b=SNsdbEvkyrjXqPcEXb7chWiQ3Pom9Vqa8YKCNsCTEjkrupX5tLntkkNn0aDlzfciJY6QhV+XdXc8H7Q4/IP+KTaHExJABx+gfroQBpIfG6j9klkjE++Ai1T0bbxB2yFN89pIg9yUDPXsBoCkLYqDPPYyCnAo1PUEwqMbhIOcXro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357662; c=relaxed/simple;
	bh=QUkRyik0eCsHwhKR92w2rKBKeVOBb88SlZpwkoQ4hVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtFOoowBc8jxcN0xuRbFJDxzLUhOxVyDJRxDIdxg/KG/rLZa0n6z6rdxOBY5M6aI+UXNAnGBqWp8ct7GbQpAIaUuEjJOTL2QC9LdUkQVRpHhtmR782HsadRORExPgzYI+LwDsukXnqyzuXHJpga5sPed3Avne0K9nEM09exaQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6UPllYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A231ia58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6UPllYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A231ia58"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR7lA2654050
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 14:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=; b=X6UPllYQVZ75nQg7
	FgVy6ihKj0pXCki3rg5EpsLZf8hzJplK5uJGwSV9XZH87Vac+CZYSAqknKwbbBGu
	WFwX3zQPTQ/rhODAUNRT/e5KXycMsmt+Qu0KppysOZS4pjJD5alKw3lbwqS2o4ek
	P9v7Xmg3G3fL+vg0hxYdqn0O6g3nADuO20B9N5ogvqOL7PriePm9pQfw79TFe0ke
	igVSArPRK8GzpcvY1KHg8N/jNA/3UEyEGnIajHcB+dcKZvi3ajDw2sUvKwHg1eNp
	nBIXNirX4rEJUPfrDUDYft2gUP+n7Qbi8QXdbXXISODvUSLyC7oWnplLiRQzzrIh
	CnXBfQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whjunp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:01:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cbaa9bef2so19176241.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357659; x=1788962459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=;
        b=A231ia589eBiDiZDlZbHK90ih8N7heIaMzuOCytn0DUBDdMRLrKz8csDZrv7s7J+5c
         wDLll+RMIhc6jYDSBvQyHMrKhXFCjOjd8ZvTIJMU77A2vX1F+SXu6JBCQkPdPmk31U+t
         dbZUl4c6vxqH0jttADC2dASWagXF1mxn+KLRY+7pP7BZG9SKnlHlQsszaukZvmIDJm+k
         aCy4PWX7epax83Str7F30qX3pQVPgOUShNvEu6yfuNTH6jWQpUrTXpG4MCCcPZaDx5fX
         rWvg/R+rBuV4f2fGIP+3gx8eGwTzW7oZmmlvGO0yaaJHXhgIseyzwZDJ7uPe3gunsQXj
         XESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357659; x=1788962459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=;
        b=O+MY90VEcMicIWITuU1xR6xpxnwxrJEo7knMVYXMD8ySTUttlJdtSzjSDCupIvr2jp
         LRfB8dea4dwgIhMdNi3fPmEiMrNx4U8fCchKX6bgJTdo+v5rExy8ovcgGk+PehPQI8mO
         Z3DpWe9ReQKla5z1gVGAPC2G3apnYFunBEMgmKLDsWr40ROj55L7mvdPvMuOzOmlG69r
         Nk1xnicC7aPKGf16tcDZ9ANUau+TZxfqD94XsTdiBFR4n1VM6mfqiofojRcbuwxnFUvt
         dbKj/Xl14TwOQzFTbNcS19A3Y0PdusfCBcP1uM1cbCbGW2XE0C146o5ADc+cEpxjf8/b
         PoEg==
X-Forwarded-Encrypted: i=1; AKwUvBw6upk4yH+jbCk41wRgRzSs3U0tvomObJnAzZQjDQlvbdQrd847DJw9Qxt3qiq7qo7ppQv7TzAXwrb+xmg=@vger.kernel.org
X-Gm-Message-State: AFuF++nKOow2XuhLn7UnpmIjJIp8Xua7FGBYb1qx2EMghdudjRDHn42V
	/aW7mWdO9SOMKI1gOI/IK8zfBDGfDLfXR83vCdDH84yaHlntIrfo4bjX8nnUPYpDFejUuVt18xr
	ZaeJLusUMgMDvjyFpYqMeL7FTYaIbImJHjTNn7CXzhcSs2Ucs9Wh94oDny0HETc4/qaY=
X-Gm-Gg: AYBFou2FlWRQPKQL3jeksE6sAE7NeFD4+XWFs1NgEDzeD+pjc+xMGJBvkS6M39TtMYy
	0/kOWoYOOq2len7HEOODQZvwkumPYNtX0QKG36US2l4+swflbOYtbYrS7dRWuFn3WKRxjc7p1g+
	BaZ9GyE5/qKoj+PahIjpeHK6memZ5JQ2dr7xl4DyVcCP/ftXzbfZ11cCXCRwJrS21J3pnIeA1Wh
	thsllexjfo25PMf3GyZilAni5P777n6dx5idJK/NlPxsM9uIRpRLrDgYviV7AvOubYY4YcJAOFs
	PBSVYo5PTiKswNsbz/d3cvQBnkudatK7EXo9OPu4pq+yzo+YeYNp0TBP/JAbRAiv597DUtHGB8X
	nvFSCXr7o31ip6Cd7/maTIg==
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr641454137.0.1788357659442;
        Wed, 02 Sep 2026 07:00:59 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr641231137.0.1788357656711;
        Wed, 02 Sep 2026 07:00:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b25e6dsm599815e87.34.2026.09.02.07.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:00:55 -0700 (PDT)
Message-ID: <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:00:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a982c1c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AhoN2pN4Pgw2UKRmVskA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: BQEDac2RFvDAQm6qeO8QM3JvXXSIU2qB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX71X2avWVtmRV
 yp4P3vOt2sembHo7y7MtY3xlNsXTMlePFCx/D9bGzIimFWB2SY0O3c85e8r3ZgNYEkAbJlOu/DC
 PI4CYT9/Im9pc31MgLgdpfK02WK7GCqSqDwVIeGOYR1LCYhQOq81tcT7p3dOPraduWTourvT//f
 tnenT6+rz5fxrXyH9I1naV0SMyekQ8rzQisZ1w1uBqgLAMXj3Rk580bWBPnAv7uXZTff4PVbuZI
 nBgEgopJJZessSWOZuWY3MPGqCovu1pnPFaZefvxfOLcucdT8rzLBm/pc3TgV/WFFwPs2uxDvj6
 zSI6H8KA6kJM7/dTq63rsWqzlzKLlKZCbWQU7iZfP4X4qmjQxvy8bbv0AtU89dne5IfE4cbUrPO
 Sa9IWXwO97CFzVq6HJg0hHh4tLPH7Wxmz/3a2EE6gDJ4UGwF9m1ecs5UXkzVngh1MP4yYXVZFgv
 oiyUYRFbrzLQYsNJT4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX7Lrm0LvR5axe
 qxOd2H6zQ2OC7awENZVysIfQclmIqi+ZMLOTM3F+O8w9ui9M2zJkQ0XljKZn5voiKGGw4Y3YwoD
 yP3VtwId87oQMtljFa35Y2ZqyCSXGBE=
X-Proofpoint-GUID: BQEDac2RFvDAQm6qeO8QM3JvXXSIU2qB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020123

On 8/31/26 5:21 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.

[...]

> +		vreg_l7a_1p2: ldo7 {
> +			regulator-name = "vreg_l7a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;

You mark _a lot_ of regulators as always- and boot-on - is that
necessary for all of them?

[...]

> +	/* PMIC H - "UPMH" satellite (CD90-73961-1) - SID 0x7, Bus E0 */

leftover?

[...]

> +	/* PMIC I - "UPMI" satellite (CD90-73961-1) - SID 0x8, Bus E0 */

likewise, a couple times

[...]

> +		vreg_s2i_gfx0: smps2 {
> +			regulator-name = "vreg_s2i_gfx0";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7i_mm: smps7 {
> +			regulator-name = "vreg_s7i_mm";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;

Are these actually exposed as regulators and not RPMHPDs?

Konrad

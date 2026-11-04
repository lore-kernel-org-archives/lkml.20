Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779478;
	b=Ebc0nT+rE0bSZpZpVfw5g6LThVvAzk+CZiYglZAo4ZWin0Btedihv+GRCM7vNbdl2udO
	 iWHFmPyle4CU/iTlAjt/ompCxIgMOKSbJ6r+ljDe6U+Y/VWvGraNW5T08izxznmMbDKLc
	 AhJT44Jz5DuOrDtMWAonfDUO4AktIm4f8tlI4s3Gatp70EOv1f+HLKm7absAi0Hi2l37+
	 ZdK3kFmBfMEWutChmYcWWGrg+4CQnEQr1gEInEg50ZatLo2kjmdu7tqmsL50Z7uSnGUaJ
	 rElOlPIgLHdJThD0MxmXxd7czS9mpxzTm0+54i69fuwhuQipQaBjz8wdXU0XsYy1OYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
	b=phTDsWWQlKwUgyihehJ40cRv+t1WHDBG8O70NlGWd4yuIctZcNwrdq4J3s3CKQmeMhsS
	 +ZQU2cCPehgwfckNa7KB6SNHy4Y6gtpBuzcgC2l5t6hZHXb2r9OvrEaXjdDpQEpGR/CQt
	 r3ToEFEc4UiMhQk1pfADGY2emGpJD5IFR9ehKU/eOJwhnr98iROL9YTuC4R5gbOUt821I
	 zo4JRXnEiSMwZxz0WtA8eQHmir0txIc782qncshuGyIhZMjMWYOCzYTFor+TkqjLsHkZp
	 ow5a6uMSfp6GmRVcAqxaBfxsuOEGC9Vj1ZAqmIWPKjlLhUEs28eXtWB+7o1WcYMwGHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AxxaHJX8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ApqN1Um3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F5606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550F5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AxxaHJX8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ApqN1Um3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46qF6j3458455
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=; b=AxxaHJX8hPHCHxOm
	A6nQm1Hh82MA5pNzS324eYzPdp56/BTXy791bYQ5OQFtj/0pGbat+ALqfYo/3XTq
	MQTy9nMlhJAleEox8MSGY25eUsufnCcSoirk/kYY8oF8O0BCn32SN30kds9kvDBE
	GdmF0ONvcSkcTM/eG0CzBIPbmWLpQ8L66rooZyV6afKNHNond6XwSXgbxhSQtIj8
	lNcsbnpy9GrAeWLY7t2JGsQQF+N7wKduxRwdv1qHqN/l7o36twJHweVlHYiu8/tZ
	wtw2gunKpblTaiOyUZAbsHweercRs9CJIf0v1GD2s9J56LQQEN/cMEWZwARyDfY1
	YB6zTQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bv1t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:04:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso11330137.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779476; x=1794384276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
        b=ApqN1Um35PpiYT4827hlwR+RgLOSgmQjvuTrzHiDjhZffFBBoJ3hOOqSpHOEMXBo+E
         bLog0wYvGuk6eZ0hoJF51k8yfFeaMijGITCjl98m2vl5a2XccEm1SfNhgc+MN8zIQU0i
         mH0Jx8MKIlX345aCY9iN+1jR1s8vQ01iMLSYwUkrYgRRNNSj1Yd0d7ijK/K0WT7KsV/D
         NOobQxHjUH8rzBnmUgy4t4Ry+SSzs1GWr6D3ODvxn846k3x4k4VP44YZZIG2ezOkRIVI
         Xaf5FRi58uepG6TdaDWDdjdIhn8n2xQZY4YPn1b5LliTele9FdXd0HYa1mzRQ7C0dzmX
         a+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779476; x=1794384276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
        b=oNej85YyaFD7W5x8TH0Iw9aHIT75Os74aWAwjau1n57DasZuWS3+VYO7ml4rvtqwo+
         JRfQ5K5T6WWAFhsyP5nkJBCDMAz7U5CdnQSJns3bPJGA4+aFK7JfZaVJ5zvJwFpqdvu+
         fSweNLzJ+nmRsIRG2lzbQJEwqifHJwqckwKgebclLyUNq1AsV4m/a75cfETWCnMlQu5b
         QYPFf8NHPQNbxAKrPkh0HMztE/TGh41Gfl55dHnq8Z4KWZkZf026xX6kOYgXuI8mvyQ7
         ai9A4Wu5lDNqMLJ4Y5x1w7fuadZGgYYiQ483f+TEuq9s8uCLXWinl3aX9rOdBoUUSTNZ
         5Vhg==
X-Forwarded-Encrypted: i=1; AKwUvBx4sZjwgISrT3GP+HLfohC9k7wFXAvQbPE7i5iS9REyfDJXMqFTJLqleGb7sqsoIO6mj8ybe5WEzVtn6+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/letWaL0H1bAE5Xm0Pe4Hqk8vFAMmzc3bHdqoGWPyhpnKwd/c5
	bpCEm2v2poc0eS+wSX/4jtfvnux3ziEqe9U2athLy7szJ6H+Uk1uk6ApXMDAY1pOnmEK4g31f5B
	L1w17ltKERqmsPwkAiMDCc0nJpcnVSHnnAMAKRIb2rfSUYwJQurZkhBPd+di3eR3nJPM=
X-Gm-Gg: AYBFou0MaN6BfJEshm5tMGuMtxPMSdk5zUvZ9nLuPmucZgwE6x4C/9Mjt5AJlejQ6os
	LFiiEiQHV/X+ATma77WhnDfra34AC6D9BkqoImLaqza0q0c4J+Ot1TvyNwXpq/mLcuR9bn6i24L
	I3KnaqwHQnue1W0XAP1Dhc9s3H4h8obwXlCOts9s51IU42iffPVKTcyBr6eAKoInGBbtjmFh/w2
	MouaRbzBfu+JNZdME2UlKjhSxB/uPDk5MZggQjJISQlJY4ma8EezIdk1hU9AcB6IwS8daSPG7XN
	o1S/ggsnUKob6VK+1Wu3xlVMphQMWrBSkK5O4kFPFT6elZq+3lDrxXBmvt3hJ8pcEQ+KwLGIGRo
	vob3csi1eH9R0puVRqGH+KFvfeb7DxJFPnTF1XdQ5R9L+uooOBMLXkzcotvv8YJW+hla9
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr6037628137.2.1793779476519;
        Wed, 04 Nov 2026 00:04:36 -0800 (PST)
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr6037622137.2.1793779475937;
        Wed, 04 Nov 2026 00:04:35 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4467a7sm43308266b.42.2026.11.04.00.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:04:34 -0800 (PST)
Message-ID: <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:04:33 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX2JS+t/R3DXco
 INzFJ0ne30XWMsl/ATW3S9HDM8ZGwPODUVLc0l6WK18LWuxnESI5YJxhxqde3mUWf5APyEV/4Cn
 5ad6ITMl71pA7fP4EWDEdxG3lV3qPkY=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aeae715 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lNFNs5cjDqv29Spi1AsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: VTB6s9PvM9gsmlO5BTn7j61HKyY7bICW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX0PzKtr34Pzve
 3VSdd9YEs63g3BNV/yFHqiGI53GfMMFPLCnwBhM9zKilphVE3wux7bjPAsH5wdFgNOnJ+TM0NGs
 HZsowzkOPLbR5b+sut80ch+wVFqiN1jv5962I5F1c1KPK0OypVI2aib0+ZLXkT+QSfagzF5WliP
 1Cbh6Vok+9iZFr+xRyPoKswYyIGDVdi4XE1RvHJBv/tlkxeXjkf6LrhO17F6FAuKmRDlAXvoapk
 dSL/NCbiZmb1vJaEpQ9/NH4csvzvd3QL41+8SbAtHtC2naPDVOJScWkr3f9twHjlJ1Jc2z2RLB/
 mY7LHSJoiSFuXR61S85p5rESQeLdK7OFVE+nu5ob1+KyQN13ZI/bso4/Q/zksmTlUQN7zCoLZy6
 sYck0DirFBCrdrMe+KuPDPgFQpTsVRTYKw6dQCLBbdGykxHzGwuq8wFBWKBTOvz2ROiqtP6YZH3
 Xw1OtJNOEKR0EzfmshA==
X-Proofpoint-GUID: VTB6s9PvM9gsmlO5BTn7j61HKyY7bICW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040032

On 11/4/26 8:59 AM, Shawn Guo wrote:
> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
>> On 11/1/26 9:04 AM, Shawn Guo wrote:
>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>
>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
>>> and DMA queues.
>>>
>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +	phys = <&serdes0>;
>>> +	phy-names = "serdes";
>>
>> I believe this holds for both GearVM and embedded, so you can move
>> it to the common DTSI
> 
> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> PLL/RX/TX programming driven by an SCMI perf domain whose level is
> the link speed.

Right, but I meant the assignment to the EMACs specifically

Konrad

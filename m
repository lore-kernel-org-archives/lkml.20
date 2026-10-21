Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578771;
	b=yvuic3KPlQw3HQ4W8PEsmFl5O1HcO3TCed7WP5P3DoVltBumqZUsvYQLwYuXha1Kq5GP
	 UL/oTAQYmK63tKmBUfy0VDZmwwvaz2aUo3f3YFiJ6wxeT3rW+pwRqpts32IErDQRq+E1o
	 Td9Xp37xrBfK4tX3biIiGONIB2m4fNOskkOdl3bR2dpbbSGIJ+nYGML/8o31S7XEDq+U6
	 DGGyRTEt/P0K1R8zR/Hbo0TjZsdU9maQLETGscbF5kWbmJd7s9IcvVCYPITN61FBgn1Wi
	 9qJGZkrby8Zkrc3v8s6PpUsILpIYydEd7v6fYatSr1xp+WQU915/OCXuSv3BMnof3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
	b=m7Kca8K3d5A0flOi5Vvv/4OtwqHa1Xc6B1qszrq05chy0Jad+GiYQZ4FUlc94pc2Eb2f
	 Je3vgtHSUbcwE08wWQhEszX8RMe8C0ec4M2YjZJ26v44EHREhz9zNWXjjoVwDtuTpgdcH
	 L8iuAnDGiwHF4czaRMHQUiFaAJwNHF40sIZ+xqmwd5OThuvpibaumh2fRZTgVTF4LQYRV
	 FQs4XcaV7i3cf9F7o7/tgufnMQr1wzH5nR3pA7QO5X4RkK6hSfi/YPIYb1njM+7SpQ29T
	 1Vdg3HIIYmIFysB9UFcXE8AdEu1z53UuWmZRTNiekev3uLqirXNsI3ZXpyM1jewpb4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+Do3Tvz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CcYiz/xE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5063606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5063606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+Do3Tvz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcYiz/xE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5ll53449744
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=; b=J+Do3TvzRelo31wG
	CSr1OmhSqWh/F+mnq2lljzRjUJBo+QLUwOcYHmOKO1+d8QewmJIkURQt6WcQZNO8
	pSOPqI6aZx1XLJZNQ8mmNTIQgfyf61vLsIjRtpL6WklgQQ49P2Scy56Elvldss8T
	DbAUeWWsNxKQ5JVS4gfHBxffUZrHah9cgq8uDafvCIQYQ4ZEAyxnpAIU9d4Fsao7
	yKIeqEoPHSGSVi1A8JlhNdM/4kFXoVZQy0BIY//Bg9/huurKwx6CqUEXqNmBo862
	Lz8RFPvi1YiDoD46lykzngEClSoojubMSEx4wyVVUY9egnYVW1vJ2PXcgKWYyU5+
	Tq0bnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9b9tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:32:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso16713985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578769; x=1793183569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
        b=CcYiz/xE4UWL6WMi6+A3sb0rwRrZqNsqMRNqKPDPW5tY0MK0X0f6N33XqIcHts1KPz
         mqWLCyJ9Wlva4Z3pN0kc1yxiIJTJPGr33ZYfiCCyQtowBZeaihFjyKUcLmmd7tL1vwgF
         OisKcE4lMAWHC6kR6MBM5hzAybn7fLTncRHbO1gRKrmxhTKQWYcmMFFKbqfIFAfh4ZPi
         H8FgLJjY52bY4GdrecPJZGqcWlLGDGJPJO9OD4it7xHCg+QNYnVub/xNw784hR42TW09
         M2dKFEMo8yJ7v394JbkdrRH4aAx6LTiQOoyZPE/0vf/1S9pAp/v1nLXwD3xRYrdzD/2x
         ntog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578769; x=1793183569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
        b=OnqDcLqX9UOnH+EI+eB/t7kvdohU71KLaVF3pTIpmB5lG57teYhsZ31tjRk44rLhZB
         8QQVu/NUIfK7KaVHAsYCwa+phXCiNKFVpk2GU2VchSCl/7pnzQqrWlQk7lEYflo4X82h
         PYCE0LAXdT/iZN0yElDkmXPGiPhdgWr2BcwLehzhwNxZqWLNqNWtwe1q1VmzstkDYixY
         S2KLH3KxaVQqSUxK3Gf51pL1Rt1AHN07dv6iFJ6AbzyuSTJPSgTgA+3Ic0mljp/hUg/1
         xTwSHT8K62uZvg9/eyURzg8QxevbMNAOqHG+mkrUzjHf11LO6/e3zAtusIsFuuHkPj4o
         oC+g==
X-Forwarded-Encrypted: i=1; AKwUvBzM4xLYt3+v9SmMYTiG+dy6j/miHUvwMtjonBscYnn83BZoSL3Zew46d+aR0k9V6mSdwczBLsL+28cX/84=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqc6++IzPshF++1Fs/hJLv+2VCyUO5CgSFP8MYpImnWUw5zPKm
	iGS6zMZkRIGG74iEBB24nmK4YYbto5Xi1pdZ/BcL/h3PsHZbXXVNEpL0T6Fe4LXEHjvqSVtPDGJ
	kTTxoVERZRIdcFj0TbfwupMPK+BV3j8bXDNiVbIL3ZezUax7YU91QzHde1EGpog6+bEs=
X-Gm-Gg: AYBFou16zwC+8fdhIscWqAngMty0Y/IuEzrJxpoS4LQMFObYD4P7WMAOAeKpZTRxdwG
	eSIwyDUrAQTbWh+U+ozM7K7mFw3k/QJ5dWBwoVw2Dt4dhkz4V2ZJYO/j9R5FKMBUEx2Duf8+DIb
	Y/DToSXApMrDNmnG1FSjpy73cLxnfcJf16T1Y1fqNtu8+zz36gNPoUXz5vxOaNIwhve51NqnjhR
	FVZklEsSZ8rHv5axCJw8b+TQud0mUVMruJMJyr0C4gvrpEHlgKroWXPK6usloU++ciT2lda24Gx
	i4pIYFYSlfpaYaDdzUm3R/DzoQhVGxp7yKXcHpwg2KZu0443c88Lgljr9Q9O2eUE2cP3CV0lPh2
	vGOcwBLiLzUbPLBOOQlZcvw==
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr410245585a.4.1792578768848;
        Wed, 21 Oct 2026 03:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr410242285a.4.1792578768327;
        Wed, 21 Oct 2026 03:32:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4031306f7sm671030a12.25.2026.10.21.03.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:32:47 -0700 (PDT)
Message-ID: <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:32:45 +0200
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
Subject: Re: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
 <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX5ugcVqK7zXFM
 da+YBthJBw39fBde6pHCT9ju22BSrTxN111puUwZmRwq1DV4D4bK9JmCcbJFGbf9ym5sncjoi9Z
 UFmDtkhqB7Nx2pi/Uel3cA217cPBF6U=
X-Proofpoint-GUID: 0QiInuv6LCACHlFsbg1nYOVCekO9zYcL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfXyLui+m9izHUC
 Wds4IkGvw7AndLEvWwfjJZyjdwgT2w3qFffmLnGAFBB+uAfXZo3gYOL0VxWrXWopF/prOiI3h7S
 u3hVLh7nYk8WdMevuI5B6oLdVpXJLy4+ZawhWN5Wo6hNIybLmyXPesKQv/H3kfYfeeel5fB1DYT
 GBLifVWgfF169B6yzRvkoknqdZopdLJ1Wp+Vz3YBeyrtkCJXRgltMeHYFeGqsikbrEhVJq4ILow
 AeP8IMwpwhvanv+kwhU8un6vP6F4ULuQxCYYAYK1CjMpNRxlIMWBWWD9UK7oTAL4tvup6/RDNfL
 vpMOVgT00DPs3NxAZAxamepQzJlqwPa1uUfDYjuCxVjifInmuOtmq9AX4P2LqLKBQq32rLZlvDO
 I5FZ9mTuTP6zKkGXD0Kc9HOssLww0J1bMFc3GB8YuZEvOhmMvoNA/TZ+bElhCfHRdIqOgRGgYfQ
 H2Vsn6dSeKC6VLBHRbQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad894d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=ApGinhq3U5Fw_ERVFb8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0QiInuv6LCACHlFsbg1nYOVCekO9zYcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

On 10/16/26 5:53 PM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the Warsaw board identity, reference clocks, PM8550/PMK8550
> devices, key wiring and inherited debug UART route. Describe the board
> from the SoC and PMIC includes instead of inheriting all MTP devices.

[...]

> +	model = "Xiaomi Warsaw";

Google suggests that's "REDMI K90 Ultra", we usually put marketing
names in the model field

[...]

> +&qupv3_1 {
> +	status = "okay";
> +};
> +
> +&uart7 {
> +	status = "okay";
> +};

This node (and apps_rsc below) is out of alphabetical sorting order,
please touch that up:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +
> +&tlmm {
> +	/* GPIOs reserved by the Warsaw firmware. */
> +	gpio-reserved-ranges = <36 4>, <48 4>, <74 1>;

Do we know what they correspond do? It's commongly NFC eSE, FP
scanner etc. If you do, please add a comment like the one in
glymur-crd.dtsi

[...]

> +&spmi_bus {
> +	#address-cells = <2>;
> +	#size-cells = <0>;
> +
> +	pmic@7 {

#include "pmih0108-kaanapali.dtsi" instead

[...]

> +&usb {
> +	phys = <&usb_hsphy>;
> +	phy-names = "usb2-phy";
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status = "okay";

No SuperSpeed / DP altmode on this one?

Konrad

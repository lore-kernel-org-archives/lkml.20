Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027087;
	b=uCtntZmrtXf3FixTsjdQf+aapIo52+SNyD0Ew4JkdLyKZ35A2iOjSbwYA6gdrpv9+D9S
	 nBgdpRkg9h2nZdYfGK7FICUP8vp3CqTvRTJTGVv2xzqy4kOkP3Ch38ZKVs545QCRnLE+Q
	 t0PCHUi7ijNfsEFaJsa4dHFLlUrz+u+QZ8HHoBVEZ6i612UDC6U26/XNz2M+MwpJaW+ef
	 IozEKlvLahdH516pvLTGBadUo+37C8/sTF3nkA6S2HW3fiiloNYGnNZfI9rZTE0rFXFMY
	 /rZOypz0ihmqUwNIjoSbyCnIXSzBl3PmWsYuI+7FgSRnWMaJZPY3V9iOE8zzURFOklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
	b=dtGWNscL8njyOtwGAofEPcMXHM5dWjdHsOH+XlfkTYyKab0Ljop1k6z8ww80SvOpFaoU
	 O+tJSwABLm8uHqMnf/1DWswP8VYmNSHjmNgWYu+m3AYKnCplGFrg/GMMlRWUYtK9USdJF
	 hjqlsO6TvArpjNgy8p7bHeyO5uewDKKVRroe3AH7Vre/HWSKuHB8gvvwzENe9IFNHmOzH
	 PVgBExBsvFDWaSvJZutEBdZ5+fvkLxpYqoRaGINmMePJH8aRAVXMQxwtltH9txwXRzfbQ
	 2/+lKsmJswORZyFKgBAI35xdf5bj6l+zwCJn9vp/pmv11j9oyiTvHGen8wVIVtec/sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hi3CS/w0";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CAE606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CAE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQCM+Rmp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hi3CS/w0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvfsF4167994
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=; b=MQCM+Rmp+OZKHlj/
	ciKNByeD1VCOEeHm/cod6l/pyvN2YTQHAFlhorvZqwiKHrUqvJkCMMcy5+8NzsJe
	dMMeh21KUtXzbdhwyWnjSTWfoqDqaz+ua+npTwqYYVPbVaR4wcuIPmXxaV+Z0Soj
	7bvziDtshD6feN3rD3xS4cQSlN466v/4zq9C1aaPSG7sL5YezH66fQWFD4B1SgW2
	ANjibawOqc4WYIMXjujy6A1t0z72lzPVBkAtQJQnbGl+/fMMAOcyHF6r9cpgBhJE
	oDxNwtLwXz3Hw58HMTyQswM9SIaYHH9TunVE28H5F6B9VDmUJRw/Q2bHUg0ZM1dv
	zrVBdQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf14f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:45 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-555eaa3ff0dso601498b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027085; x=1793631885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=hi3CS/w0VZhpnvpAzVfNK1wzX0z9QvpV8ZWs51pe3ru7ISKFgRpjPHnnoGHumVU6qr
         f5DOUQt00G4rL0bQe/BEXfvgBFAzug/jtsdCOuYpn+lRZyDSeX69OnetF74gB/0AGby+
         Su3o4a4D7xdrMifOcemeeE/7vPf6hs2cWiDdXTrNugPCICgLLWn0BQxJNodWyEz6KItf
         UpkItjM+H52+K3Hnm6ZZJrSIkbG1ZnCWArtwtseSLBifS8j02eVJVPVJgNW7vi10dQ/l
         UiGUBjCFqpV4OSARb8Sydc8r3QEVh/B62xeJ31LO0ZsZW1t6OzIkXvrDfjCIjhMyEt/C
         jQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027085; x=1793631885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etnV3nBisIEN4CK2x4XO1LJb3qrvWzkEtTmrYybBqqo=;
        b=0F2vnJE8zPml7Sa8K6N+VlgLHtg9QCNTgyfZfeJtHDEIhu352KIOdsfdS1j1h0bNSU
         hoaJczkx50c3S6cUJGzpeCJZRZVTuBypgSzhzVi/wLKX176fijPnBji8tdvLGHwym4Sm
         AWg/sP2Lg87Kxm1Mnb4w97TfLXZZr3p1t0R0HyFD/C8R8t98K0OyEAZOwZt3FjAojCG+
         1QqE1KarkBcViDajY75MmZXy+zPfuZv1QpQkzUemIYpuYxUaI37K9Gql5+KFtIKo+JUh
         amq3jjdH6GAG/7VFP8eBvhAYn2MdF/BAGDtjbz+nicBhqsGVMs2dIzxfraqS39+o/RCp
         mqVA==
X-Forwarded-Encrypted: i=1; AKwUvBy9fbQ7K7Ss0IRukXs5yBUsyVuQbIBujYHqNtSYKVCRbaZuENsxLBMgxVWEPq93PuHRfjzHjjdOqokyqCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrWs4O9quXTuSCa6LyxITu6YhRrJ8K0RizuqznioepUByp27Yg
	8Ae9Mi8OJER9roLK5d0k87c+2RFUpOXWbg3++NCCAGCk+NeZeTVN6+h3uwqoZj8EJgSnh2TUHoI
	PL6rIoSk9DUq4v1Dfa0NATq5PYx9Vzb2mvhsOxq/jg/0lHFz+KX18/3l3Upze6QFXyss=
X-Gm-Gg: AYBFou23t0/MtHaOPFUDjIQWLGoqqxb0Qy/n0XWhkHc/tA9kHeKN/PMiqaemZVL/StW
	yU9TyHlj4BtBkncSRjR955nJa2IJXcDO1PEbtgYyjwx+Ucm2cMLs0OVVVMiqc+jxmQWvvLilYnL
	1NHnmj7eBYqVOUOU8A/5F7ThrqQG2FSHRi8jIcitI6zOWMJ9W4wfccPO17KYDQ+ZupJJsKqDkkW
	lt8YjXWfYmCDyD7EO7nhvn6dFOiJ3PLPBgzQzpRS4xd/NJbrHsM0BCXID1PUi7dzxeaBHLyTb9T
	5idfvofJhFaV7GqKpLNd9rCZtUZeXakJ3uZBYvStzpD0wI3F6cO1hESs3Pe6ixzxCePlwAvwynS
	ATeWjkiTK0/OdPRMpZJhGbA==
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808456b6e.0.1793027084516;
        Mon, 26 Oct 2026 08:04:44 -0700 (PDT)
X-Received: by 2002:a05:6808:30a6:b0:549:e9e3:9460 with SMTP id 5614622812f47-55bffd26cf3mr6808389b6e.0.1793027083999;
        Mon, 26 Oct 2026 08:04:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e70asm3844350a12.9.2026.10.26.08.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
Message-ID: <2d4e66f6-7187-4642-9371-4385a46bbfed@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:04:38 +0100
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
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org
References: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
 <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-msm8952-initial-support-v5-7-1857074992ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX7co4kR8GHg4X
 vBpC1jcbdlUo3Gtz0znr15Hd2Cr4Td5bb3gmdvM0a3O2+2AfIVlb4K+K64Vvvk+2JVNTg5BD2cp
 VAQcihfpmrvBgxnxblVjGOnyOG9G9SY=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf6c0d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NCdQflJRAAAA:20 a=OuZLqq7tAAAA:8 a=CrGEZSrvnsKXYSFoqd0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=efpaJB4zofY2dbm2aIRb:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: n4Kbt9jqaPsgjergYAp6r4XOM5E3YE7C
X-Proofpoint-ORIG-GUID: n4Kbt9jqaPsgjergYAp6r4XOM5E3YE7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX2KWR1iQNsKeN
 DLu1+wPTmTqJCZA5hdDuMV4z/1Mb2gBU7+Ni8HDuhO6nggjchWQ/WrA1ofiF1oQO1bXThOhzcpP
 0jv6jn+RgKcTFehxrHtPP6q9Rhy4N71M7qiNCBbLGbWdHqA1PMIkyKKN1aeJqaUJNT37DE/tPEu
 yj8PSiuCCwYtccllQAHBxoUMOXelh5YLqUhF/ZH5R44kM4TC+GQ8CXVO3TOJV767qReDP70tTSG
 VoJz1YYLh59zB2N15wvsvQyqMPwrI4DfVWC+H975S0FHDRMF2LIf/qqhUMbHO0VpT0vcZYkWmGZ
 Hsf0WJ0hv7dy3e3XqnR43Dd3OcDyEwbnloPe7BD6ENp4x5u6AegSPXPF54uqPh5SO4DdBHuTjuF
 8XZc1rw2EKrPFNgZAJkmIzyFAkESQ3YPJBSqCiefTfsOSKRf5tEtmBGtcVmz4lke5K2E0rVeb+o
 +kcE3+JkIrBuCidBtrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260059

On 10/11/26 6:51 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add General Mobile Shamrock (GM 5 Plus). Shamrock is designed
> similar to L9300. Downstream reference is [1].
> 
> [1] https://github.com/Asderdd/android_kernel_generalmobile_shamrock/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8952-l9300.dtsi
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

[...]

> +/ {
> +	model = "General Mobile GM 5 Plus";
> +	compatible = "generalmobile,shamrock", "qcom,msm8952";
> +	chassis-type = "handset";
> +	qcom,msm-id = <QCOM_ID_MSM8952 0x0>;
> +	qcom,board-id = <QCOM_BOARD_ID_QRD 1>;
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
> +		serial0 = &blsp1_uart2;

You need to enable this console if you want to use it (stdout-path
also points to it)

Konrad

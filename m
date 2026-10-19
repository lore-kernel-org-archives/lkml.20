Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02199498922
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405564; cv=none; b=t7XNnioghQ4EhHD8L4sdVvAxgEu69EuTvCWTnX+r4dyqH8XFNTBB1X33T9EgdXCPrUO9IPUQyEtnL0qm7pH9i/lToc5brZ/5STGCsSK34/wyX1xvBxJ7RiNNrsRn8LGMVN/gvKA8H5wYMN98Q1OznLVkzBw87sM0xMQTA0RvnHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405564; c=relaxed/simple;
	bh=7iANtpwwx27y2DvF7f+rRXOAxzX/QoIXEDSEYxaBEHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksX5bLEl+AyQ/pxSbfa0LwiyNOuaAnVMeTrsHjSr/YYUR0Uyjbhxfx4ONan9roTA8CYVLphxpMYHWvtMDQetETdjVv/cSEtfdtdZCIyxPcwXN+z2T+gyShu3tPMYRYT7lNaPkd9gUlcVUtDM//wTLtqdUHErvOp1ne3sWipaGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4nt+keM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvHm7Kn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4nt+keM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvHm7Kn2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1Xc2042000
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvDUo5SG8D2D8txystjgjVrXxJ57+a3ovSYH1tkYEIo=; b=k4nt+keM1Tio0GGi
	M7Wg8A3+spysZMBtVeo4ig64WWaGUoNXCqhoiboa/aaBhy04hxLmgKtPQUWvQ45w
	wqMssGQvPMgWO/eT6nEevgUor41evnS+Exp29ouMNgLp7LiDRsJIE742wdGuTzuy
	2BDvZrjqC2SRHLhLJJ783jKvqyF/U6f4dOa/akJbQbtqRC2NeQxuS7ciXHIdQ41y
	y7l/PkDerq9VwF+CRB+FRvIY6HlaxwmHo9069PQ1GzzLnozZnS1eJevyDQjZWZE4
	Y0k4J4dC+W702fhG0Sm5bKRzRG4LBPjAEevSthCcOHkKDjgPXzLTFBZy9pP0xDpH
	C0D/eA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur290g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so20052285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405561; x=1793010361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvDUo5SG8D2D8txystjgjVrXxJ57+a3ovSYH1tkYEIo=;
        b=KvHm7Kn2Eg0UvdcWb4RdvRlnmuGO0linhya3fN5+bOhstSz6bMNs3F5KySJYgBD+32
         rOLjZrFZkICXz2Iyw9XoIu0ujnBjfH/Z0qE1PKfbbU00w7Wj4vqpDpbnzWVUuxSOs/F4
         chhp1xb3z8qEa43oRQhRGz2AtTMBQ4M6a5/6YKtcvMHWGpu3SGvzaIzP3x39dHMLr932
         Lk+iOmc46CmdFmoKb3S9Ve4hImV5zVBYb1fQN3piHNk3otSpLKPKafDmAOvxB7pfOLXJ
         hYTgorLl+BVSklVSDy9XeqfWHbsySyNr9JOemC9aqQ853o9A7tk8mhJLRarwZKseCmVk
         OsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405561; x=1793010361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvDUo5SG8D2D8txystjgjVrXxJ57+a3ovSYH1tkYEIo=;
        b=VpHkFKTZ8IwADjb2rwIQtpLKD+RQN+0pqZray5kZH5DaByDhgGKax262IBQ0rPWykW
         +b5q/8wlwex2dnT25/gTGot0v4j78NpugM/Zxna9+Ic2vmTQlq3HpuVlHpfPKfp6Ihhx
         qhkIAq/v1MBMCr3kQkbyResbGfHm6/i7W3nlOWyl6QvfN60oXBSBPEa3Y2hWXT5g4Hne
         bMPZgbYgdtcYWd1gH7z0qwirFXY6xjb/UFwIXY0Pbic10mmKFYSnuXpwDJD+0G8PQSwA
         Qpvjd360woKdR7E2cIGLrEITd+tm78vWjLyUr8pVC2JE4HX5r+sFJ9TT4oi5GTn/w0jf
         1Bnw==
X-Forwarded-Encrypted: i=1; AKwUvByoHUF2TYq6oCV/L8oFGLZmnDoPY8NeNROELpbsef5UmK/uJcmhN3EbyxccUDTAWo5ulTz/4QEmf+zAYYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1CXTBXVZpOxxbDxZqMpl8RZl5Kd3D75MvosBCiQvITt7slUdB
	/RYIX/9g7E2qzjvM5JBzdNJN+LQKTb/o/30McSgFRT0/zthfP7OOQbz02Aq03+kEyNtwW2a3MwM
	iEF2MiUQY/xRQOGEx2oYVpCP/JkCISCoPmafJe9cBA8A1OLQ0p9VTwDdDuW5QeikP1b0Xdpw+lp
	k=
X-Gm-Gg: AYBFou1Wa4Tv+okTRZP9NUmPbOOpQf9vcJNgQPV2eSH+385i+AXJJ/mRU/LUpKt/BA5
	U5BR7n0hKbtcb4NYzeIVYN8hOteNdwB19SKdd4wfcYfN//PDILEAsdoaj52w4XSn19fscvw/ce/
	pdzg2u90PD1w8U2eaFTXTidW3l79MQhfuu/F/ebU4sFQn4gnUKhwxmgklahWrBY4qrTeRz4/b6u
	lkucZuLiNEq6qFDs/rcQvwbkq4k49mP9AemScDWv23HlCaxdYWrOmkJmjC2WMispjAAPZqscWL5
	Qmp23vHsHFM3RwUTaZuYJ390+d5Jdm+TBSjm4a1/zvIbwdfNhC5ykFLqdmdQ7uE6cNaQJk/ugut
	BQeGEQpJJgDbava4ymrmcSQ==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1373206785a.0.1792405561302;
        Mon, 19 Oct 2026 03:26:01 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1373202885a.0.1792405560807;
        Mon, 19 Oct 2026 03:26:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm343612566b.42.2026.10.19.03.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:26:00 -0700 (PDT)
Message-ID: <4ca6842d-766b-4ac8-9fd0-df514104b382@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-denali: Add missing pinctrl for
 eDP HPD
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Haipeng Lin <jimmie.lin@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX3+q0QYII78Oj
 wG1/8h2ktIzy1an/7lfkRtrd5XJOE5VpOL7aNDjHS9+nF316dErMsxq4sC3pBORoYhVzMFjqU/p
 6Z2O37za5G/i8uDt2LpgAh/vruO3aBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX9Zpvq6nfDPHr
 1yrH+VYaEOBCYMAJx+O/XgtsV3Afq1pXVrewU/f6CdksirUkdmRsDuCI4sC/zygXbxDxh1nPzH8
 +NwGcYdpys90YyogjHVPepgpiPcJnf/g3KNgpBS+isgxzhjVrrOHsfRRtWcDwLuIJ9jNJia9Crq
 S7oGKDgC46DikVe0MfYM0eFSvZDuJlQG9xIW6B1U6LkLWC2qRfM/dnJljVN2szOL98XemIrwDZR
 y+MLJIkWpiRKJBvUmQpF4b2rhtujpQS8SzYsHS6lObPTImIjc/TNBbJpnsTbzy+d660KwtP4Cjm
 bG9p3ydo3Wosn8pw5Iiqf87tdXDhKs40BR1Sah2cGqv+2tSF5OeBGmZDbG6wnez3LfE6/xvikrb
 BJNZtoSC0TMWg/jA/JUBdaz9FzM/7V3gNPqgru18fD35fSexx0DhMqPpv8ODPcmWOIs5ukq/Ziy
 x9qgSmlQrchyNFyN9IQ==
X-Proofpoint-ORIG-GUID: 1hV1GF4qMyQI81BhxGIwLzuP9BcoVgis
X-Proofpoint-GUID: 1hV1GF4qMyQI81BhxGIwLzuP9BcoVgis
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5f039 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4IbvtdBO-GTxqnRxzRkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 10/17/26 7:52 PM, Dale Whinham wrote:
> The Windows ACPI muxes gpio119 to edp0_hot for both panels. Describe
> it rather than relying on UEFI.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

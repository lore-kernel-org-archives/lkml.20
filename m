Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105344;
	b=Ro/wgUoFraYK8YtLBZzoz7E7oJrVuM+I3VKgJbymu5IIwPjC+M8ipJrRYLO3lIxM0ULJ
	 6I0xe0GYzpyUdYAh/9IbIi4ZKOo69mDDwrXqAYVdp1XJBtpYSrTxqofP0hUHWG3ah1NUB
	 nBuUhONRGkBf7yhcvDIfj75WHLvx8D480iw1dQF3mr7cpHa0N3QEqt90lYCqkLbgPH/Cv
	 ieo0VFpGrXHeczovq9apSJquJlfYzsgCmO8DoNbQ34OMZOKZxhUN+MgndU0ZOK8r2rnku
	 lRpRKX/e14WiizGMf0cvDoMAYqvUVARSFWDEnDdDRk803CRsU9yOxF2PkIF6Dy6TZEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=;
	b=aJ/oYzHJkkDRKG9rIKUiZMPGdXTXN2tJfemdN+3SCTDMIeSx1FgbhWMKjSk4SmkfsKh7
	 Ru50qo8+ftO++PAssG26xUp/pYcrO3qc3eDTa9aTkPzEjG1bssJOq96ZJy54s7MVHHeZ9
	 njbApCpoUhZniwuXC6Vm0+ly77Fn96TKNOQgFBE+hsYLNEa3vAB/AX+f6RAYNX9XBlLHP
	 rA5RcXQBVa1yFwVADZMvFaGaqURfewoIqdTaD5pWucOiRW0nZKW+svSs54CshKEFWtSs4
	 udCKtzGdcfNu6wQWTr/Au2BLn/438qf8pfYxxa3m0SZtVaEPQtmZlqgGVJYnyMbi2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKqd7z7l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBh3cAHd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863DA606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKqd7z7l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBh3cAHd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBkV3011968
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=; b=jKqd7z7lNAPprlQX
	mu3s0vG8zOh5qYNYfgKH7+bQsRS/2HpxFPN/qGEcUFn0lKf5piWURBxu9AQNous0
	LZ4xHzXgnx0aMoVIbfcSoPBttNHNugjSJUAzHu4Qgq/w/mB8pjmOaCufba3EPD9m
	PlfiNZ8FaZ4FRUgyLcwsFiGAk1oRePuSGeCd9VhAQpC+0EIxX1fH8nMf0kTRrv1F
	hFqIn4tCnstj0ZrZIOBvBMrcfHpCuXtuHNtrllADsJV3T6Kevqi6L8Yq8GjhAmJr
	9CxcJqFmprPEoop4f42iWG7KYsueL/QhYaNx8OLE+YywsnwaQ4DBidh5lfAF1yuq
	0jXC1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3db2hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:48:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e832c03576so77339105ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105338; x=1793710138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=;
        b=TBh3cAHdnTagZSh+/3AkLCCEERcBTHPQR6YFjeSDPTw5IyVowHySazw+hEElQHOpyD
         MEYuznrbSd17QVkOGq+xz9dZ0Omhqz4wlLP6lOm55U0ZQffFF0WpEZc3Io44E1HVRsEi
         yVDH3JLV0SYD5Mile9ogDFV+fkYxt891IhbI2aOorlvLAZXMx3UL8GbGsGU0/pOL2t4G
         7mmwF/MbtOIgkJrTGhtIM0sTNf7xJnAl4+gRdeFVQJbphVlR6GXAGsVXEdyNBvNdFujT
         QW3Qr88qbq17DGg6kDeap5Zpn+EBz6YC9gwcXWV3Yy23pUh0EFi8XF1g77lpQZoNoolD
         12cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105338; x=1793710138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzbrDyWSnOGElL5DcmC6jxVWyGgYuRbYeFCqB4uIPsI=;
        b=2XaKJ3AFyymTTWtcm9/fg0AR1xNU8SeQZV8Joq5X96cqOyTHD29JrVS/bBhiK/B15/
         Wva28kmlVOyS+duE5NErZ4THJno1VAcSngyFdrTKYomyx13mG1NqJy0rxYosTYB/I8K1
         7uabxUOxSvWPj0d0ezY5prieDQnPsUfinLpWCIiDWN7ZoPmIS6scQbOR74/DKMPMXoUl
         YNIslgMXKlJRNQxBjrztY2Csa6E/cJ9A//EAf7aVNulkSsSbNc/PKnXl6tumnOVOPIpy
         Bx0XrR63QqqIO+Ia8C+VRcdQ8MXdU1DMKGSDhZ5Jvjocq+M+7KKJrqidR1Sg4qzO57dY
         wH0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTIP2J5UPP8g90CmhPVhRnfx1O35Ynh3tBsLuKEyURRokG6F5EN2/B3eJp43LR6I/AzJEzneAmmbx23+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoIAc+ywv8gxgHd+qALvpRQx1hAF3baXVU4bJ9/S0WvJcp7tiL
	xyDXyQktB/oRkJl0c2691kKBB6ZRf+WSujygG7iGBCwkowS4RZZleH/SdyU8r8ppc72tLRKqjr6
	qpBbL5GFhHCTlnL4Yer3oec/Z+V15tNQKwnsWIBsGJAh1BtW2HIVTTYsKbtJxLDJtTVw=
X-Gm-Gg: AYBFou2WxdwxvklVjZACv7aZTQx1GZg61zXFj++rXmDq5f8XcCGPaehr1ByAcTnCBBt
	zuHnVae05FLMt+vYp5pquzLyAwfghyq7THdX1JS2Ec10F/tBIaBmio4JxmFF1opxJ+dDt8m4hBf
	TQIpb0jO1AcJepEGCOTv3iFaYsWg1LL3rfHLXThcjOtYIozFZYszvZNede+omO7EMDDVdwPYzpp
	ze8PS1z4xdVRfMTY8XXak0z8dzBt2lx8B1mSDCpmauj1Gg/yu5OuRweiuN9HxWKk11XHmE76Hcf
	ge8l4G5fQHFKEooDFdV+K0BdrVDkR8StsPqVez30J/oefw6SnDJFoULUAGE3nCf87v3Jhp2E31U
	mbgDAepsZTz3beH9PJYkXnkqMWrp07XPaHgYYZrBqE/CvUgSJs0C1HnT5OT9Hgu2M2bUYjO0ie+
	n/1lnqBA==
X-Received: by 2002:a17:902:ffcf:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ea9c68a7f2mr78521535ad.27.1793105338039;
        Tue, 27 Oct 2026 05:48:58 -0700 (PDT)
X-Received: by 2002:a17:902:ffcf:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ea9c68a7f2mr78521345ad.27.1793105337603;
        Tue, 27 Oct 2026 05:48:57 -0700 (PDT)
Received: from [10.218.10.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6455a00sm9086305ad.2.2026.10.27.05.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:48:57 -0700 (PDT)
Message-ID: <b1097812-c7e8-4c02-9fbe-f95890425917@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:18:50 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
 <2e928aaf-0659-4bc2-b6f7-e2a0a5e8d3f1@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <2e928aaf-0659-4bc2-b6f7-e2a0a5e8d3f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX05Iyiv5FkmdQ
 MvvI77mBMUvoCT+CELfGaLRsjygQj7Eo1YZVPplt2D7HQXvL4/L3Q+qoY92/TK8Qng5S8uIPYbE
 pDUS5uUplIP4pKpHu8eXURCU83bpeWY=
X-Proofpoint-GUID: 0KWO1z2anagOADlT9ymXtJL4GCRIMGfi
X-Proofpoint-ORIG-GUID: 0KWO1z2anagOADlT9ymXtJL4GCRIMGfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX8lm0Lsp+rA1a
 BmLz6nh+UciS2n8Y2kBGYwXzRv0fXFYE7KgoE+UEnETIgtXoKGAwnF+crlL2xlfN7M/FLGiEkOg
 2Gce955lWpnifE4tOOT4dfofvdXSseupBoWQMvvb8G8VRJcSY80rIgQcLC+kOTo6bUOW4x435Ae
 AaUAyMGkiiim4YMjRXf+EL+QnBuDvh3v+sQ64eWaNQSf7wpSVoODgt/66tEjygKonZZ2pi8GRis
 aGSEx9SzaNmsMOloCPL7Hx2IkaIZxqZTlBnUbzzcIDfRCS6Akj8UeSbrr37iLzP01kHRwvZO4K9
 vO7jvM6MsPpCR8y0rvNXnWxpV+fgHYslwGMMj2FykFteec/Et/nJoUN7iLsYoTlLm7zw1MxZ8Aa
 s2BXz90D/GAqgr1rmuoW3n0lG+CHs0HiGoFEN4vu9YC6clYM3lI12KyQyAtxxB8R4wkP2MDduCR
 ZLdKY0ALDbfp78NOMWw==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae09dba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=XweFwc6cyJz2eRbsTccA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050



On 10/26/2026 6:19 PM, Konrad Dybcio wrote:
> On 10/25/26 2:43 PM, Viken Dadhaniya wrote:
>> Short SPI transfers are sensitive to the bandwidth available on the QUP
>> core interconnect path. An insufficient vote delays Serial Engine
>> register and FIFO accesses, increasing command-dispatch latency.
>>
>> Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
>> source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
>> peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
>> payload throughput by approximately 38%.
>>
>> Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
>> controller and its frequent short SPI transfers. Other QUP/SPI instances
>> do not require this vote, so avoid raising their interconnect bandwidth
>> unnecessarily.
> 
> You can solve the general problem OR you can do what this and
> create more work down the line. What if I connect a MCP2518FD
> on SPI4? SPI5? SPI6?
> 
> Konrad

I understand the concern about supporting this on other SPI instances.
Moving the MCP2518FD would require a board wiring change and corresponding
DT updates, which could include its bandwidth requirement. On RB3Gen2,
it is connected to SPI3, so this patch scopes the vote to that instance.
Other tested SPI clients do not have KPI issues, which is why I kept
this change specific to the current board configuration.

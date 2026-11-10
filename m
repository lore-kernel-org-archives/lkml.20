Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314544;
	b=gKxl5Xa/MSMbtpIMgt0MlrnuJDeDYgOFlO4iiLi+Md6HJqH//EmS5p/jpJi+XreQq9Gr
	 MjidZ5oAsnBvBWEgIgx0i8ad247WWEwvQlcNGexs10wJxgog0ITVuuYFoQiV3B7/YZ1KA
	 M29DmUg6nq0popnN6KCO7jL6rveUuBtEiF8j0H0A+PQuvSh6zsUHY+qYdHTU8cXUn26Nd
	 SmYXjGZaRlLLs5VVOBg1Sc/2PNiB4lD6MMmvtfuSa5NkyDx8Bp6voKyhqjaKxyBN4Aw2m
	 hMmFqK7ai/qosa3mPEqNdciZ+IxPaYPYsQ7vklAnI9Oopx9LKDhfi2qm7z4e+WL7VjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
	b=HfaTcb8N/8TZhMEeJLy0TASSP9Ej+Nn7pVoi/vIPthQkRPqpNth/sWr5I7sBEAgE6089
	 AGFvCknbXwXbXkyTDpAlwxZgWHz9MJch4OLqXnhQDGBBBV6iRf0DH/Bjs4ifSwz5PmJ+c
	 5kZTz0oA9L1wPZSFjqoSBpGvVaxG1pjNtd6Ja2EUD9XDv2z/UI46t0LNLdYTsfxMg/Q9d
	 wv99vlen1qeECyVGx9QQ+UbTDTr69MbV377ScNwNblTfblivOsnA0ZkxKC2UwNGZwM6lJ
	 SIX6y4O5+QVBaRZwxHFDfpOyCuR8NRq5oAMTtMoq94YiTn6WVbMpjgkCw2hiUWXK9iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfOkZ+eH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8D6sfUo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24A606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB24A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfOkZ+eH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8D6sfUo
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA2t03196043
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=; b=dfOkZ+eHCzjaObQa
	arqogdPgi6Sicmsw8s9UW74t1KaD3DEI8mGFbx26JErUorxPHUzWEhLVmrhGkgKc
	SnSkCuZ10nJaQ4jut8xSzy6qwkEpRGQxeVOqvTow4lgJu2h9f6w1fSaC8VDskXE1
	qekFaTr8/B4uo8/SSpYz3kcMzuum5Do0ar6cP+F1xDH3Sgz+EFIJbW4gprKmP3LV
	+1Q45fBRG5pzz9b0q0Sq3NiN8WO2w8BLQ9n70oc38FEvFGghOVciXjt4RrrXPRp/
	0rQ7TPy1mnCzCz5lIpbISeh+1TfLVm9bVfSGxzmDkFQn8Olvqg9vBn6RwBRcb1yu
	TQh88w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crsp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:42:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso43003185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794314542; x=1794919342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=W8D6sfUo2bQIKg5aF2sklGz63ow/C+u8Ml3CTAfn/IeTp79/hEBR8Dfiw01hBr3CvA
         FNWcHluRpUzItXLMtYPonKIeYe9OjSPx7xlrkwermzAF5l82iJ8xSgbeZ0+Yr4EbBh2f
         EKtKa9O4bu6YbqNEli6/IHUFOC8D9dRjeAWMqLmiz8yyeO2s//f10mXlg5LHuB13OHAR
         rPn6OTP8dIRgVegLe+C4049aLMvQjCFIQTXpcUYUdGn/bVNAgt/oHYkAGfTcZ7HDyxHX
         C1ORwljjeOhTYzLwbZM9MiTA8SLfZaRFYsOExiRY2ryIiLMyOn2JygktvRxJNTzbywaZ
         zKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314542; x=1794919342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MatU70aFGzUpefEfOY9ZfVcRCCMiI8u0W7ROj7FQCKI=;
        b=EDoNPCdrIy3ptNUHXNroYPXGFjznwAFFkAMbK9gpA0Ef4ZQFsMcpeRAMBoPewBTgZh
         uy7qM0hDwiiZwl7q7V41NuAk5kVI9reL74AJR+ciNojju3Sleg+5v40hz7PpmpJfSssd
         WENbirMG5HqWoJlwVD+iNUy+xoQOnOhODBTChb273csqSZKvWaV3/T8fxwIf44af8WMi
         go4NqaU/mwEwq88YFq57qLHteYVjILsGLT7I7dvbkycXxyxhTBDVg/Ux5R+PZJfu1zsn
         gvVGc6kPPthVzK06S0af278GX6Z5usg22RVJ2OTiQzT/Rdmw6ECVYAYOWlvy9F5jDjvS
         lmcw==
X-Forwarded-Encrypted: i=1; AL+hErGNia31ZMANfvnWs3h3I/0BhAa+Mq7dT8YojGIVF2SsiW5SBer1yvc8wCNnwuEcOr0e16Kyo+x4biftlks=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Z0/i81dM25z75wiuvMpbCQ7JLyArbrDBHanQLkYAGF98T3k+
	fdPqBqvvrCDssiIZcNHwPLsEdSnz8yaZBzuC23mKDtCqhsnYH5o5nWTZ5m1LyNxB0TWvROifOYc
	H68DelgdpT/SD1U9qu3N9eonju0XbEh7sgBewqvzyL74ulfce3DLikzHtGR+gGnW95DA=
X-Gm-Gg: AYBFou2yqUCrlfrvPRE0nhRUxSxayyaBV7vIY24/LnKz7LvqdMS9Vm1d04grRkUQd7m
	o8WdzCdEesehRHRvj9M5IokZVNnUx1xvWnvGUs335dPYJcVJnYhrgC7OrkGO9Ihw1jQc/fK+C0g
	RBPLVVzGwHK36pOuMHkIV4hw5oBMadxNXaWdew28GwCEz9iqa2SI3LIIE0Z/jiRfDPjEBNxgkjk
	hDVwEnECdKCuhgzOVwZFGoMRjw4XHrJihQbaqpMI+/LoYKY5EfUFQZRKkuCOGMegvggsKnYfo58
	jSBuFvhwBM/XxydihBHpJfeVKOAWLM4YjYDEqNtfuzWipuwGU+1DGRv7RdOYAPJWMP+mOclbsjC
	G9om/TaIU1CpjxV4NXk/AyITprJUghNoTWDh9eIcr4ARIPnYqVhfOJ3F6/7Gq1wO/Xuuh+7M=
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351994585a.4.1794314542069;
        Tue, 10 Nov 2026 04:42:22 -0800 (PST)
X-Received: by 2002:a05:620a:a2d5:20b0:945:cfbe:816e with SMTP id af79cd13be357-9479f3d6b39mr351991585a.4.1794314541623;
        Tue, 10 Nov 2026 04:42:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a66b9sm103217466b.9.2026.11.10.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:42:20 -0800 (PST)
Message-ID: <7fb5ae20-c4f3-4aad-8d7a-a37a6ad15fb7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:42:18 +0100
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
Subject: Re: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, Sven Peter <sven@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D9V5OqjR_IhIFap7LEbsCHsMUulxYA-I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX7P4J7QUaqn31
 addV6+2DYYROeCEMKP7yed7QoljQDRSO/iIlfWjXypLsgzghA66fjfoDRTicjpRt3kFtRghp94P
 RGHhQTNQuxwWj+/VrvV1DtzYflU9q4Y=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af3112e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e4OhxiAmdoAHhBioD_AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: D9V5OqjR_IhIFap7LEbsCHsMUulxYA-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MCBTYWx0ZWRfX6dolIc3AgmEx
 Rflyv5WBCh38p4SgT5Ppo6oJzvYtE2dnG6zY6En2SrItxari/Hi1MwMEbtK7pgja7BrYSiuVefY
 p47eNuKu0HWcyo35SEd3Z9y7a5joET9f1BYsLpi92qymFlo/BE9dzHU+y2QB3Mj6tb4bXhTXw+3
 ZxCUcH2h+pW0qY7XeS7s4v5I2MdaF2uWaA1RkyoEuVsa9cUhlDIobr/IP9b4ojo4vzM5CxBXwvm
 tx9ROBtdmz7Zgb07PIUYWbF+taIUqusV+opuAtSsg0Z5u23+uXAdmkcXu4Qc6yzTcOpEwN3qiqa
 PP4KsNwvv9hjJ2isEsGZ/+Rh7mBFbjuhYDxcx5/zEjw5BlJerWsSxnxbfs6FLsbd9xRYWDqJMrk
 baEfXKPVpBWEw4BjfS7JhIfiYFyV1ZoyFwRkgyvtD+8uzDmX9/EhS8I0t25ANmrfTyaAwFQm0Zv
 oyYPJHc8rryl5hfJeDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100050

On 11/10/26 12:48 PM, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI support and allowing PCIe
> and platform NHI drivers to be built as separate modules atop the
> Thunderbolt core framework, several NHI functions and structures will
> need to be exported.
> 
> Currently, several of these functions lack standard subsystem prefixes,
> risking namespace pollution or collisions across the flat kernel symbol
> namespace:
> 
> - ring_msix() lacks any subsystem prefix and diverges from all other
>   exported ring functions in the driver, which use the "tb_ring_" prefix.
> - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
>   prefix used across the Thunderbolt public interface (such as struct
>   tb_nhi and struct tb_nhi_ops).
> - nhi_msi() is named after PCI MSI, even though the ISR simply schedules
>   the interrupt work and can serve as a generic ISR for non-PCIe platform
>   controllers as well.
> 
> Rename these functions and symbols to conform to Thunderbolt subsystem
> naming conventions before exporting them:
> 
> - ring_msix       -> tb_ring_msix

Maybe nhi_ instead? `tb` is used for the software connection manager-
related functions

Konrad

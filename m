Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231498;
	b=e8p9yHT2TRN4y8OwVgSQbvWsOv5rkGe9+JOeoq9M9eM+zETZx1dLwZlbLJHQZxHwSz5V
	 8lReyUS0Bew59l2gC4w4tq91ySQafLOW+nHxZkd5NgI5EqAOGmJJikslEe8a75Z4n+7OU
	 v+ZWZrFFl/5u+wSNFO7PrJzMRXePItGxd776Hrl519Jw9QivfLkwPfgJcgT+AydNzaOFv
	 Azfk778IBauRtxum8Pw9Jq6jhusUYrrCI7uK4NaiIQ5BXkDpMdSPsNUCehxMUaFwIY74F
	 +vZk/WC8fx7QEXyW/pLDEtLxjYyHSku2W5YSYQ5WiEYZhRdTduVtovzLYPmwL/jnBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=;
	b=bI30S3ISweijELfqHNWy7FtfhFvTnC2W0g+osB/XejGHpO7CdAfT1nbXU3c+wxoCGU+J
	 loR6gQsoky1BmJLymH4iiTjUCoGYyz8RQ2plq3uzA0r0NzisvwnTb3n41XT7yYW3UD0hx
	 B7UrzA4gdOLrNYXNSIw6b3doHIsuLSrmkpTM5RkclYZqDnWkM9jDMPJY1whNqip+Vgs7P
	 HBsIErzWo8S1dCRQez8ZBpWtgaUJx0sr0GYIuapl5SVA8ot1Z1Gmqz3/x8danqu+A98jE
	 W3Ol6dRcZGdXbZLET44LCBM/yU3ER12iIsIaHKb2cUzYu12KYEa12es0jEsHNWX+U4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bwlicMj/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSGfZmA6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9822C606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9822C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwlicMj/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSGfZmA6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF9vf359237
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=; b=bwlicMj/2YBlnHoZ
	1Xmensz5q/+lmIIm5wQUr2+54155guGT8o4G/p55XGJtuejazP4vR7mwWLkQGYp3
	eJHVpS/YepBJvBb3VRKfKJIJ7cTnhhKu6hhI/xkXCbkKj1VBvHACZwoRmDDKjAua
	AWHouNMFdJkglHupEyN7TibakT5sjH2OTpyzVQFIM3r1MdiJF/CJVidtAyG9AGxh
	Kujk71Yp+oxZBIbahhNJdpWNUhMUk5iMuvMgvWBqQD5eSzU1Pff86L/uQSikpevT
	XQ7nA6Y+7ptv7zcFDiWCVPn8HDre8rsNw4wThlSPNYhmV++WirCQgXDee0NwDpED
	TJL4YA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2hv1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:38:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so28442e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231495; x=1794836295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=;
        b=TSGfZmA6y76x+ltmex6o0Ndx+5jxqAPHCR9vun/c7iySSzQzuxeM6b+iAJv8OWFtJn
         xTLq8AyERbAddP68IxKc7ofI9ffZ+tHG+RHu2LfB+BbN7ofMQbxI33JxRmmoNP65ICrS
         NhzvMdTarkUyU/HJHurQiBbNbB3rYEOtNysTdMFwrJlDXYRkguFgVs5vaj4KUlh7iob4
         UoMwCpL6zGdCwlIbcGE+Zx5T92Z4CiooPIH9YlRfqWu/AqGCTrrPgIMgLu4ywdDd+rJA
         g6F+vG93qihOIh7nBHxtIEAUZNNi7wJxC/4FcF6FFVcUx5Jf8TkxAXlLY9xpvMoNUchy
         2doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231495; x=1794836295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9yf0pWezKAH9/ruPl8hDWgVQ5poWLQ5Tg6+XvGk1vg=;
        b=kpPCsCiKnad5p4JpIfeMMj+7dUh0+17/g7nEi2V7lqfi102yNTEwlQvTfsbU+kk2bt
         80QoShN1sWDWW/aIT3rIvWH8PcOiBtV4NmuidFvEXkurPKQCBhumICvjXh3xkpf1Zvne
         uL2xlvjlXaCP0wLfm6CI+au0yLmaUpc6khAZOsQLV/bwO9F1GnfMmLyFahLiBo5HgBoH
         0BSDtWMKE32h9Kvh9XpxpQXUMTCPH665MLOoo1CAOT8k2Dq65a3uleYgJa7PIHieKL5Y
         ML1TcKeXc5ny/V56SU+Sju/MtFwhzMBouGBw4WFxEx62hLbj3VNiO8IKyNiAoboQiLSQ
         wj+g==
X-Forwarded-Encrypted: i=1; AL+hErEdl+2HwSyS4AMUZcupmjIc+cFMaEe5/bIM4XL3nF/9OQkjBYKuFoD5o7Rp/O1VCibTiTZydg0AKqPORg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z91wZ3TeFyLA/HUEgESfcGb87Pk469RBFGyvIGA42iPS2O6q2fU
	10fXsZdELEmMxfHUX7rRcYaN+E1rz3RLWHVqts+Y4geIf/O8Uhpdea/ZhEgb+GoIhYxHWJE5P+c
	rlblR5ed8PLKcEouPUMNScGqP36N25eDRFAQloAYwAFu2w4XkMWeZi+OhJ90DhO0yr18=
X-Gm-Gg: AYBFou26/SBV2kknOYhTMkS/2P+Fos16/MLYk3VIF2yjnVwNtYqDMA5EGhSP2M6GmMQ
	yCltf78NO9ZyXHPk70Xa9CNTFe1YvDaTpdWn7GQ5kzDK7Lte2g/7OmIWSa+GCjrCnaLyp2htcap
	jZTmuxCyqukVevhAbLHv944RSpYDAL/1OGm7m+jtDeLmgNsg/e7v/o2ljA7JyK1RYbVhV1W3f2v
	1cTNtJmNg7Jl+aFzWDJS8er8ZgsJUUz7SnoU9byzKNwZ7ywRrf33EmrvhJvVaGyBOMnk07YtLO4
	PYxlLyHZLVxhYvd3WxTNsO8OQQFujm8ujeNWNARvGSFnqTYAOqRCVkO+qBHdQY5bHFDDggdhIk3
	mCTOusOyFbf4uytmzW2oAv0+ZPsZvZ4tZHzI7f9gsQGL6SqnNsJX/r/iX1HfmfU2hCtNoBg==
X-Received: by 2002:a05:6122:2c2e:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ece7149335mr927565e0c.1.1794231495657;
        Mon, 09 Nov 2026 05:38:15 -0800 (PST)
X-Received: by 2002:a05:6122:2c2e:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5ece7149335mr927556e0c.1.1794231495103;
        Mon, 09 Nov 2026 05:38:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a5a460asm166802566b.60.2026.11.09.05.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:38:14 -0800 (PST)
Message-ID: <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:38:10 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Fix
 LDO voltages
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1ccc8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M1jp7Co84lAIlnRm40QA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX51jUmHZamguX
 bxrl119gH4VjB7/4G2e9HD53VP02JPuebmSK9AERcPaOtSvsGmQDWNwmGhI37QXX3FRiQ0AP8s6
 7pWo+LvWnabpORr02BN+tDeOjJGBlevv+YmBJUN+bg8bDbM1oRtuB7/E1re11oVAw3OG59NvVMe
 MvkrWraoF+flyQwflkFHPN/Q+IvWiSVAAvLV4pszg4UejJkwmSNAeHVUd+z32b86ut9v83EMC0w
 U4o516axEmBPvSeRGuqh7DEUVmystUKu3AJSDFcsjQlII52zDQmPmdNLEOMOUe/hnpDgl5Sg/Pe
 sjYfRzeZlQJNgwy0HO44szUcdiuq9VDYWLryv9dCk1axjjrq+FJ//qL3uiJ90e5v7UfYAR3dZCZ
 7z0OF+odEcJn/0N6fWjmLhYp7qw0jXLoyIWVBMtqpA5I9MZ/twsqyUn+Gl72QbOJ6gr0Jm6hM6R
 Bq+Mnss/9d268Qik0IA==
X-Proofpoint-GUID: wBhiSAE3DcbwrxODJkqoakiRMkloMDQV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfXyJNB09nR+J3v
 aTY9QwjLDqc/kh6rRzYp/a8s4Eo5pLp2gFyMGgmuyG9Myt2b+ClBqOz/3bqXpgSG4cgVkllRCb0
 DQ6R2OSw8PXGYM1kiWrHoVQmuyLcp44=
X-Proofpoint-ORIG-GUID: wBhiSAE3DcbwrxODJkqoakiRMkloMDQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090054

On 11/8/26 10:01 PM, Abel Vesa wrote:
> Several LDO voltages do not match what the firmware votes for the
> consumers of these rails (the PMICVREGVOTE entries in the ACPI tables)
> nor the schematics:
> 
>   L1C E1: 0.832V -> 0.912V (PCIe4/PCIe6 PHYs)
>   L2C E1: 1.144V -> 1.2V
>   L4C E1: 0.72V  -> 0.912V (eUSB2 PHY of the third USB controller)
>   L1F E1: 0.88V  -> 0.904V
>   L2F E1: 0.904V -> 0.88V  (the L1F and L2F E1 values were swapped)
>   L2H E0: 0.832V -> 0.88V  (HS and multiport USB PHYs)
>   L7B E0: 2.79V  -> 3.072V (eUSB2 repeaters)
> 
> Fix them and rename the labels to match.
> 
> Fixes: 300f5c59beb2 ("arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Merging the power grid consolidation will fix these too and I'm
hoping Bjorn is eyeing that one, as I would really hate having to
rebase it..

Konrad

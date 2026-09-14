Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1F3D75B5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383682; cv=none; b=SnKWO41GoH3ImRaxfD5b77Z1ZsZXK8STI7u+zwB5q6cPfqurWJHMZoQbLY7aKLXqnBCJpSrHAaC+SiqmUxIL4ArmcoM7yaWvC76jAhR6c8I0MJ8gF5MkvtSpnvoSq5L7qpiIBiHzMSezkq6GmI3D+zpVeC1KWaDzLopGXvfCt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383682; c=relaxed/simple;
	bh=ZJyzsVWVEEqFSNNRHg2APKF6gHo90SoKotCklyECCZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmIJbHy9VqqC5wNsNRl6u7x16QHzTZPD92WYvxMBHTcf3/qBBywUuJTPN+K3Bbpo8CKX+ZxMUxfs12MHxHfoH/EbiPBOSIwasR6Yn1Saoncj30zVglXev8ilxy6mCJtkzECh6+JqMi6vmmrwykUEsL4Ti34uxq+ugrL9gAsqEHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBhnZ+uc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqfVFtIJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBhnZ+uc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqfVFtIJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlvQq3860361
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=; b=PBhnZ+ucqsmLJ0qM
	dmfo6L5Sn3v7yK1ZtRPfKszNftHbvX31lKuq1iArXQwxPTzLNXb+27nZkqz13mXj
	Fm+G91NSulQm4IuywQIogOdp3f8Wpaic800pGaeB9THR8qAhEr//3Rya3rGWDakq
	hHbhNrwhBTctAaNoRivSuzZDHA9Qk9RShR4AAvVnn1FMEHrDyrV0BaPi23mL6Xcc
	hTkqmp2Fz7+CmkcPmdHta2gTX8h9lcNiGoZ4Rps4X29NGwZ3AxIrT5NNCPpDqH80
	/Nsbbc86Z7pPsUG8F7lxVsoUcZBgyufiwaXzqdWU62QJBphiRl4JawepVPSXv5/5
	Cl9BiA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0nk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8328eb979so102552e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383676; x=1789988476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=;
        b=YqfVFtIJWp6LlQI6c6dy9w6P6m4AnJRgR6ffvBvmr23JCD0eLf/R1RkD0Xu2O1YejY
         pBlQe+/1lgV/+0uO6uzONeB0vZJTLMfWhj7vA9Io4ag56LU0wwySO6bZiOXkCtkRWiKB
         rFWPk0Y5/Q/YBc+pste4giqgZbOvc1wg0OwC9ig3ytnrKXSCAyriLKuunkE6Sswm/TRa
         5LHbrvqvCo6+vQag1rCH0sLEnf5Ljy5eh9UfIrIM9DRXX+JqKR1FxiWp+JS1uXYz42fO
         KzHG7HTYFfON+CQx1qbooEZdQkiq3FJdPAU8sA4oGRKU7nkBvClKCPFqPm8rk+qngpFm
         RQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383676; x=1789988476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=;
        b=VwHsHdx4m0l/L58MEVJTPCCqp7C+FyVmRHusBQyWFbyEjpvJLR3SUzE+Q3njdPicuI
         Q8BLAUEVOJs9i4f6IslUB0jL2MjFFaegvO7ZcOCVhtF0iZ1BKghQcmdOaW9VUI5bCog4
         adP1qew8/dZIq0v+WZ0bQb/hnKKSbaAR7X9hqc9SaZnQIHRCRMZhnh3itDIz2upC1mZ0
         AhCroj93rIXPosUEaTC9NPUYON4mdA8iPVeV1CZVrM7yQJ/fN9pxj/Eoo5NkWugJXtLx
         zH62BZqnnYbwAJBLwuGVj4uXjjqplpQgeNFmCmfKtuo11fxtPZJiu+/frT3awALvFiZb
         tnMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy4gIQWC8iY6tQKdKU3tKXbBvBQbBmnKtp/PWb4/gOBTgqC2x6LU3ZP8Ipb+i9et5+hhs3qLoTYYrejd0=@vger.kernel.org
X-Gm-Message-State: AFuF++ly8cALTm2ZTjABrs5TxBoFqJaeDAk4cWVB2uBTxNEqIoQst9gU
	wB5rZ8VgNIXSgHKDW0FtVCB/o28RDj23msVlV5FIUbNHHwSJV2XlBvg8UaGR74GzXNMwtPzPZfC
	apVwz5ZTwXzsxdgIZ/jq8JOd0LZykfBCa02zWamgNpw6LN2+R5O1lYKa5doaYdnXw9u0=
X-Gm-Gg: AYBFou08CnSqQ82nw5SMO2tU1AsxD39PzT6GtfOMk4wyf1U2xc4AiJ2nm6p2qKDKJGH
	rVxB+s74BqSrkj6TqbWMufOo73Pe1snspQzaGqWW0RZmHNEKg6PZ21I7PM/p9+Hh94qwkmRKmc3
	1adRvCySBN/zX7tKOZpMML06yqJ777kaYaOybaDjJWDvKAmhTQ0D1U4n49xAJsLVMdx/C0Fhnoh
	E0K8cKGkdtZ+ju7tpjmRg0I0bexXUCcJmbyVNAFVPgtDnBp00eu3KiM4/jddy94JElWVIe2Ldqd
	WXwUy1Ius/ar5ALro/qd0i/SeesHOyCk48+u4eutGkiyjcO8QAaPF8KHUOZ1zAbAq4uAbGwKSxz
	bWaU6t1LajkuXrWEwQLqVWw==
X-Received: by 2002:a05:6123:420a:20b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c9818b534emr247942e0c.0.1789383671695;
        Mon, 14 Sep 2026 04:01:11 -0700 (PDT)
X-Received: by 2002:a05:6123:420a:20b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c9818b534emr247910e0c.0.1789383671322;
        Mon, 14 Sep 2026 04:01:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58314fasm3968386a12.3.2026.09.14.04.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:10 -0700 (PDT)
Message-ID: <cd69cd0b-99c9-4f79-8704-ee84a6a14dce@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/34] arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7PZ3YnCBUxzuWy8NyV5ho7dhE8O4ZwPr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX73BqeTs9C31V
 Lj1OeJY7/dvNZ34Go1lqxl+OPRlZdSTTC9hNOGDTYJP5PhZEQ/QO5ENEMjga65QLcnx28zb4X0D
 scvnPYjZDEpQyiwmJljTKaivb9pM/RA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX8/YQGC8RS5mA
 +iuFGMa3g1iXbwDu98q9xiWCsVN2Mle6laRNkFz6eUS/z1eNC5qC2NwmJ1cnzIkKhm6MX5gIbXw
 tltqG3S8AtgrvIv1JiHmO7UhG5yvcoFGKn7ZDwvCsScjzKf7SkxmELGnPbUDg9GCIT5FKvRgvEH
 9a5Tdn2mFGFdDLFMVhM+sdw8STCtuRTEnZ0NdFYgh1hqZmnLT+TJidlNNsulq0EkoRF+WN9EybW
 ydPRk28ZKdJ6jU3i6D8KUn0uiIlj3EECJ9b8FwywS7vGR7qaxIvWlzlR5I9aKgIt/Y9ipHqXs/X
 TjDz7b/BoaxEfFGZqq66bBR5U4I7xzBisePBIB6KLREflPQhx4lSkO4QfbqBga0PCkZOdG7qKZA
 tavz38rQkHeD1Cs6W+/dSqdWSSk68tC2Qrsf9sULDVlVONO1+hjeKCiZ6zFqeZEZDEJqiBY7WUF
 LxCDVpl9Y0Ng8MBavCQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d3fd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 7PZ3YnCBUxzuWy8NyV5ho7dhE8O4ZwPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys, phy-names, and perst-gpios from the controller to
> pcie0_port0, adding a label to this node to allow board-level
> overrides, and renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

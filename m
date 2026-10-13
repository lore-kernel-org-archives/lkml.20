Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868D7397944
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881678; cv=none; b=ZFZO1aOtmnZf5Tlit9UrYlPYBFsWsiOsJ8EEt2zPMwTxRumGpXA6L0mtgukw2oZtEG4gkqnSfV22dKu8MQFq9SYM8Kuw16BcvOJ7T96MHkvXxK2Z+sPYzpYFBi1qsTx/OsRxzUGcHrYDlgnxNHDDe9W9bNkD2+Nh6EYStH0PeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881678; c=relaxed/simple;
	bh=RRf0QNgtNhxs+QIpsqcDuxMucwHO76f+rh6FFGEKfZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+EC995QEOiMWxvAoBHDyG06klJUQjKccvR8TOokeSNKPkQXo20+ELBkDP7Zc2HREMQ8BoUUiaO5WgFF5QnLQ735i9hRdB6Xroe6yzfcYRyAKzF/tEk/3pDksaXV8qROcBQm1EjH5ozStMVlNxPjchZw4Z03jQ6ldw7FMrDgItE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQFw8Fw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cR/fMFNK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQFw8Fw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cR/fMFNK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45rOC173254
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7f2hNXCavRHTd0MsRhfBFPNTvN4Mh7PPmelvArEONJ8=; b=jQFw8Fw7Ma/RCxZc
	9cASf6SF6yXQruiLVtJvjcjJourUetkScclTHVlo51gLdP3t0tpW96OnM2du2pwJ
	xJez3lWwdoG2vJUdVx+sO1xBzDiAZPF4eUaVe865752JzJ5owkL7iBRTih3Y6lry
	R/Mg2ru2c2GoqL0IQbIQsQ87zKLfEkGWR9Y8RZJPtKgTnvE+Ch9NgB5Lry59xw8d
	okwPYTS2BsGbFWYbbJqE9zyB/c+xnk4jIxofjA4d6oIolTx2dG9nkSZCEi4ZJ674
	klrPchZ315kCsAz3lOdAHdDomuKPfwLchCkpMuPlfZBHh0ayPR8PhJT+veY8xmv9
	XaFzTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqs3ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:54:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so623675585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881676; x=1792486476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7f2hNXCavRHTd0MsRhfBFPNTvN4Mh7PPmelvArEONJ8=;
        b=cR/fMFNKVqBMAp6LjH/lRkK/qkOSG7aeAS7N++VgqbR6+ICvNcHTPKEMNKpvfWNIGY
         322JT+yDK4+POsJOiFCVQwDUY+7saArG9RPuJYS9Zjrwy7FX6x55ShCnz9Sk5uytMlcn
         z/md4ekcwA4vltddUU49zSuuPAO6PdNc/a+s7zJe+ARFhlFxNj8NL8uCCV8gPFnscTID
         ZfX6fTnxG4i9mx951T0BblEctJFvLgg/xqVroZKoPzy6O58H/jdgDtl1uLs3QmeJxSry
         wQ7e98y9kaUU0RpOdkJw39b5eqVaxA+XN14jHz+jQpE4kCzWxAbAoaDsC5nzTVNOZMvg
         zNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881676; x=1792486476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7f2hNXCavRHTd0MsRhfBFPNTvN4Mh7PPmelvArEONJ8=;
        b=YbUu02JeDrG2WjcPvDhM0NGjE46p2s37qsMMQTaH13WgA8HG7Sm8eWfVALI2o2owPC
         b3SVaSAVul4/ZSM0xwQDo2XMoqU9geGDoVSEc2igL3XZTW1P03hHos8gteDDMXkVO6Hi
         +yP7JdP9Ei6n43+CpnjwM59O/yd830tHl8MK5lVveW4D07zIoM7EvNJIEH7X4sxpNQEc
         3zuMi5Qx9T8oLhcIJVsIf1N48FJYtbp9xVly+wu53rsCadk6Y9vl9LtYLtGLRcEL7zh3
         m2He0YgP+LZpiSu+MMyR5OLmBt97AJSL4DUpk3sjRPSIiKvJG8mMj9XWs5GAjiycIKgB
         Wgjg==
X-Forwarded-Encrypted: i=1; AKwUvBw7JQedxUxHQDnZsLwv+iws33QHId1WSpbQT5ZPYAN6x4sZU2WqPmP5MwroWZsbRwyjTTBMeH+7ecPEBts=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp0shBhn80aOc1tAKPXRyUirTlZTOl1SN7E/PUe0yNanTIjnnL
	F7PHxL0dAxuosCKrvT5FE0qcMY+ezUZpoIIpMWRQ9vBJeXx+5YJ0irIVpbZyjVgPORQN6BtqXU3
	InHPa1O0UGaY81h/LrfvfWL5FTfhzUrehYbSbGr9eCToGNIV6V4d/BwCzAzbKbF0bdyQ=
X-Gm-Gg: AYBFou3YH8iEytEDcZ2wPmBTBgPqY5rXHBSObD0ylYahCvwINb08yUOlGrgqIBtvc0H
	Gu/C0i7MqC+0ClFSLVu+6iqB1Q1qofcBMdcNy3h2FdSb8hZ0MJ3m3QzyloduEdGesExzZlqV/8g
	cg3nqg4KMOt6k7LFmfUgDk5QQZGRYzxfU48h1pm7M9+9pHU6k+EpwOzqn7LsTThYP2iUEgl1wbL
	bArijIWf4+GFsXMceoE1HYKwVUpwiUODShKTHWH/x5zfIqDkD/m0fXh/8YkhO+YnDaLgCsy7YQC
	Uh3slcZVgm/ADZynMcazWNZtKljdQgYX47OkNIrtXzwfpIB+5ER3fQMBJngm8ejKaZfTsNPQ1hP
	dhKNTNrNTvUtcr817V7W6AY9MwuQ4/hx9BbgSEwp5wIhezj6WCFFiwssECgHbHw==
X-Received: by 2002:a05:620a:19a2:b0:934:ab73:ac53 with SMTP id af79cd13be357-93ebcc1186emr1872340485a.0.1791881675682;
        Tue, 13 Oct 2026 01:54:35 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:934:ab73:ac53 with SMTP id af79cd13be357-93ebcc1186emr1872336085a.0.1791881675017;
        Tue, 13 Oct 2026 01:54:35 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm554068365e9.8.2026.10.13.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:54:34 -0700 (PDT)
Message-ID: <46521411-fd68-4ead-a487-f2277a1d1d8c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add Initial Support For MSM8952, Add General
 Mobile Shamrock
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
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ll5gCCKhDMAzg69TLCwseXkkzBASCw3i
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdf1cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=OuZLqq7tAAAA:8 a=H-LwI_JyRwchcv6U7CIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfXybTZ1uzivUKO
 gohiymw3FBD9glB9QP+GboClf84AHtbmcILkzsceK9N0FnvjkZhvgtMofFOUd6EULYFzYPI6hEU
 EkGEPfByekywPlLEzAvxIcE0hoVCZxY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX1vQHfVCh9NME
 MeBL9NX29PNvKUfPcr5NoI0Jz+JW8Ucl70UCYT2phCh1uInCC4XKDvNX3nLuw9UhQ/udB5PrL8k
 DLm0hHpKcbEp85gRlh42hZo38vuIzC0LgwkqTi0s5HrjFkLyTixvoCIDv7zOTDcQlFotbP2ZrpA
 GFKkfsv09JKiv3HylB39tYGmCK+l3A3GInbZ5mCcQMx/X9s8esyGyjxxKqxZr2yB+aYdjxkl6Iq
 gKLUna8foCtItL8Pt+EwGv2Xvigtp5NnrX1yeGeaDgAxegSZKfqfG1Y83H/opggFeMIE8+6iZzj
 eqKo990Sn1SpvqKmwsQ1MFNCYIZI9vnbTwmu6/1OcTbFGBdpPM8juqrIIh9NROQ4EOo7DQIeb1v
 AfqIe02qpBN3+tIJsA567zM+1lXvzKs+fOBejQZ++xYv1S1lcx0/e4gaQZlFAHJgfrEaRKTMS/S
 9Jkdan9Ku8qdlNDdD9g==
X-Proofpoint-ORIG-GUID: Ll5gCCKhDMAzg69TLCwseXkkzBASCw3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035

On 10/11/26 18:51, Muzaffer Kadir via B4 Relay wrote:
> MSM8952 is a SoC with 8 core cpu and Adreno 405 gpu.
> 
> Ported without uart connection. ramoops and usb
> mainly used to debug.
> USB is not enabled in this series because it
> depends on the not yet upstreamed (and not developed by me)
> pmi8950_smbcharger.
> 
> General Mobile shamrock display panel driver
> is generated using MSM8916's mdss dsi panel
> driver generator and tested with it. I didn't
> include it.
> 
> Pinctrl driver was submitted and merged here:
> https://lore.kernel.org/all/20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org/
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Applied, patch 3 & 4

Thanks


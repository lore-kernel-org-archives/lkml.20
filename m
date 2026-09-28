Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF93F7892
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585631; cv=none; b=VWmuQXetxjLjf73l+k6i9ZUjA0mhb24J0NEeZ047s2gW51rzBx4prieowNzlyBmjGIbIN3unHljf7O7uxQZAXBFKgDnta7Iu7VHEz0TdFMjOIy8gnBKEcAvqKwPK3FL8kxuz3+PJfvKCxp2G+JFZHemvj/ibkxRB6YtiVAOFojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585631; c=relaxed/simple;
	bh=F7U42UvQzWZFhuElxJY3mKvQI8WKyTugGwUqiN91t+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JN0H+kpPwl8AhGjzOtzbu9t0LHw0Gxmg8xVisrLOVp964nCHJhMir26hcIS+hI3V4sPUFJe9v+gqwPldWuPguXDEWpiWcOa8xb5jKVhWwYzb8KM/b0t0Q1kEBr75MSIyCrW2+IXeWMi6v6WmnsG5HUI5mX9NiLcoHA26/7OUTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ewoIFBj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wnx7VlcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewoIFBj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wnx7VlcG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xMG21010224
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dFzPDIqo25LVzunszNk3v3FTUxTHzronweZdB6wdjOo=; b=ewoIFBj1T5TXjqnn
	lkx8AbSPk2gGJhe5irTuJE7BHvPLHJbrlbJrQx/1IJ4dLHfZS9ND1OMqtRSM2bkE
	yVakiWGp9QphCsCSlLlSJgJg7ws7uvAced/Ps59Pz6QgxzmANUf+EZtlXXSgzvk+
	qQqNQkYqH80seIpdknJJj3rv5tpGgFoiSbDrf2V/06Vww4vRFZK0QL0jB9FMH9lY
	4ibwuKTTWALmzvf1GE9M3Svga/k4UAeyil7sQzX+oWUGnhlhHYmZ2XYFRbAquQJ1
	GMZUvfp005hEoDnBpMVYou2KfG2J953g3dGWMyQ8YWpoUq8PAGCtgbVQlFWYELgq
	Jw+gyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s0qtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:53:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4382993a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585629; x=1791190429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFzPDIqo25LVzunszNk3v3FTUxTHzronweZdB6wdjOo=;
        b=Wnx7VlcGRIsCARrx9DTucYPRees2a72EUVNjfZEUzgt7IxNoY3EkHrSQaG+jFu3zvc
         RarC6SYjADqIFZkWLWv3QyZ7ypAbrTDQkspdxJegnO6Dl7brsB+nNNlaOXh5quQeF+zl
         1fpS4RhIWsBXs4BOcjZcPDtUbtPp6+AqaaT1Y6qHrOJ+DJiBBG8Sazk4och7cQPyUEuh
         Q4cSYXmEXb7KoHfcFhU8dgOFvUTGlKZUXqhy3eM4rWuYLgB6mRJqr3unRvnn5KeRUrbm
         TpvPaYnc+W2Qyt3qO0kgI0PKswGcDoChhZWbLYHOm9jkh1isdx/XlL04S6rcbsS1S/tK
         QfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585629; x=1791190429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFzPDIqo25LVzunszNk3v3FTUxTHzronweZdB6wdjOo=;
        b=aZzs8ggF20mjE1sV8oeG11+iPBEq7pxG8bajGGfH5xo2j6yw93IxhklrO+Y9IhZBjf
         EjWvHj3GKNbR3iSeS9Vpszz75hL7zeqcn54MRfdIg/NNAzwjOmsQ3qatl5Dx7FSQlyVb
         vpGPpsGUtrBHdp7oQGIUTV+h8bkPlZAI7A3HkmRCawM+kTDyeRGbeDrloh7uzXQ1t5m4
         vT721T4KF338JrVi6xY0BqQ7JcsZE1oU/ACftoUlWF6CpfHIOz+nMZUlyuq/AB5rs0am
         IyaYBQeVA2RHkCxbsEo/BcyCWFgaItS8Q0cjDE3MGWwIyH92fTl2DSVUs3IuoxcMU51d
         jVxg==
X-Forwarded-Encrypted: i=1; AKwUvByr3BUH7HxOJVqz/TqZ41BJOO3uSXOiessqkSqAUq8E/KnNldHdhK6XmRNErI8kmKuDoLkDeThUh3moDaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXWXDNYJLd+Yzpa5fHwL+BF6J9hZTC+vccTbxSIBOwfGCGdiC5
	FcaDTzvITW7KZmd8vYQaS4g5E/7CpsbXq1AgkQueSMrbY0KahGVMoLszhKj3p5GFzhS61tMe5Fa
	xkH97yDYJ19WBLB3yQk+At5r9hfWF5TDg48XVMZJ5Tuferszrt+TxQ0CTVQqDbKrDUSY=
X-Gm-Gg: AYBFou2qpz4z9AgBvzjT+wmYW/eCx6EcTLulc81xiNeO0u2/H7uZAC+NkYjFhoBUwkN
	xgCxBiDafL6DPdEDlFEb8UMydErlKYFefwV3N2NSbeXH83hOAJoKAtpUs8BxnR2x+atSKK6lTWT
	lFZUN1R1C0lzk5XOQGYyh5uUv1nwwiQPFcWW5WlbX+90qdRGgpCwnc9MRzKujY2dYxOCVF0gBiX
	6z6reMO8aO6KUZEwEPnQkaIQJnZ3HC3VK8tyrRWJYxW7ohGhDukXrLYDYuz5M1B88qfALD/RE5V
	TIqTsZawoV64wl2X6SMaNB7cdI81UK9taBRKccGWAQH4OveYgReN0HzS9ZfL/X1Wnw23Gu5XoRQ
	iM8ZEObPvY8fjqnZ2Cr8Z5N/HLqJbJA==
X-Received: by 2002:a17:90b:52cd:b0:39e:6c69:9b8b with SMTP id 98e67ed59e1d1-3a099231f90mr9701494a91.48.1790585628789;
        Mon, 28 Sep 2026 01:53:48 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:39e:6c69:9b8b with SMTP id 98e67ed59e1d1-3a099231f90mr9701484a91.48.1790585628348;
        Mon, 28 Sep 2026 01:53:48 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm20093428a91.0.2026.09.28.01.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:53:47 -0700 (PDT)
Message-ID: <e550cf6a-f21d-44a5-abcc-a14ed290268c@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:23:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX8cDj0uX5i9ui
 iuJ7wv1yvmmGfpTxUK28PwHUJID4xTJcxNl+tOJgZ9ELrs2JsQvrpk0N74iqdvpqMLXhYchdM9Q
 VZ9TIX8lJY0aaPTf1mR8NZFronc2dNG3dYmbnosLeqgHJqYWjl53i1dacKl+RIFE19gzw8vs0cm
 zfZX4VaWUfEv3NwfimQFGxvjFAykbU3OUbocNLXM2bMsBcO07dLkrt3lDt2QpOBBGHXIR7FsLUh
 pba0nvuzY7Emgq6GaF9iddR8jYXTYX7zoS5FnrxoDD/UqXUHmDPu6j4rNoraGrnBDzQkeMYsQM5
 963Xg07jFf9EbvXU++bimOitX1IE3W0ZZfCQ9tD5Cdev1SQltn9K2Z4oHl2ZOfEfSvaKXvo1IhY
 TLUc6/BPejRZy/ZdWppqqPOeaeBrPVcI1LtarKZVeROHdb3Zv2RsAwuLiZbX77ISOQ2cazEKJuA
 kyevH2qhqZfH88sr0zA==
X-Proofpoint-ORIG-GUID: cxuDBTnDT6gKb8MKQ0RrbTpVHC72kkui
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX+kayEejiMGMB
 epwKJixVlD6+s12vCnz2epSqsZBCLIWA3RKx9QSjbl0S5Y5/Il/+JliujzvSgPP5vEu1h4r73cq
 eL3sU6KPgLpip8bRTh5XGnJszVtmXjg=
X-Proofpoint-GUID: cxuDBTnDT6gKb8MKQ0RrbTpVHC72kkui
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba2b1d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tyUXrCcEVTDm3v3Bg6kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280035

On 22-07-2026 12:29, Harshal Dev wrote:
> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> Replay Protected Memory Block (RPMB) which is only accessible by the
> Qualcomm Trusted Execution Environment (QTEE).
> 
> For Qualcomm platforms without emulated RPMB support, specifically
> platforms where RPMB is not located within SPI-NOR storage and instead
> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
> a callback request from the UEFI Secure Application to the RPMB service
> running in user-space (within the QTEE supplicant [1]).
> 
> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
> QSEECOM based uefisecapp) does not support callback requests. And on
> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
> QSEECOM interface fail due to lack of support within Qualcomm TEE.
> On these platforms, a TEE based uefisecapp client driver is required to:
> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
> 2. Ensure persistence of non-volatile EFI variables via writes through
> the RPMB service hosted in the QTEE supplicant.
> 
> This series introduces such a uefisecapp TEE client driver for the
> aforementioned Qualcomm platforms which installs efi-var operations _if_
> the QCOMTEE driver registers support for an object-IPC based uefisecapp
> service on the TEE bus during its probe. Only new QTEE firmware versions
> available at [2] provide this support.
> 
> Thus, QCOMTEE now maintains a static list of always-available object-IPC
> based secure services exposed by QTEE. These services are implemented either
> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
> usually loaded by the bootloader. The uefisecapp TA is an example of a
> preloaded TA loaded by UEFI. A static list is required since QTEE does not
> yet expose any way to dynamically query and enumerate the services exposed by
> it.
> 
> To facilitate object-IPC interactions from the kernel-space, this
> series also introduces a tee_client_object_invoke_func() to allow
> invocation of TEE objects similar to the existing tee_client_invoke_func()
> API exported by the TEE subsystem which allows invocation of TEE functions.
> Some suporting changes are also introduced to track and handle operations
> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
> driver.
> 
> Finally and as previously mentioned, access to the object-IPC based uefisecapp
> service is restricted on older QTEE firmware versions. A new QTEE firmware
> release must be picked up from QArtifactory [2] for all upstream supported
> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
> driver.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

+Jarkko too.

Hi Dmitry, Amirreza and Jens,
Can we have alignment on patches 1-5 of this series?
Please note, 1-5 are needed for tpm_qcom series[1] merger and since tpm
series is reviewed so checking if we can proceed with 1-5 atleast and
keep patch 6/6 discussion separate?

[1]
https://lore.kernel.org/lkml/20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com/

-- 
Regards
Kuldeep


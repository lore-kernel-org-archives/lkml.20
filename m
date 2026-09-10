Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CF0330D29
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024286; cv=pass; b=aQRs+ZWwUihfregIbrGBY/gqtuMskKU9ZyOkGgT5jANweENJL7sB4/XOmbPjc0Pg1M4zALm9yW8Hp8otKHpB5c4aYxYTaVFc1HKh28Bjfbf+QOQtiKChMiZgaf+vZC6Dz7gSm4zxMlg9FzHmpUwadruiLB5LtY6qLspqb0tOJWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024286; c=relaxed/simple;
	bh=IE7I7VDhYo0gcnWqMTBTWczlzaHH4n4GnuvfYzS9las=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkkSqswO1Q83TIahVMjiIqHQjGi7KupcuGcoiTBFTX6ljMLUZXtglMhw1Ik6he4mEh9XWGo0IRs6bL5HICPZC9r2FeeD5EqNYGUP6MRBk+m13q/6USHjm8HAKg4QIQ2Kj4nPYSKcPU0k6Oi3AA5mpcltxKaRv5ajaSJKIfsJxws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMU0vD9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T381WuJo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMU0vD9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T381WuJo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GsYp3520309
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=; b=NMU0vD9QYCqz7Kaq
	sfKMCQHP1p550Gj1xDn13LdJvw/Vt59oX0tgJqTJFXK/VMHc0Lkvsxb/LZEqXAom
	bB2PyuTQZlndRdMXVUj+7GczFRRqhQDb3ixRv1UlCws3NS9ufy+BXV0MzUlvdYzt
	Ylx8OBwRBZ2wBm2uv08w+kVE6pjWkbZeStGDSLGsJU8vpTJBFX2bY3a4Kzf9z9Gd
	byeu8Jv9dEoow04yKl3CzEh+jPpblbvFd5XRXlWZCGqi+qrPiinXR9FiozheUE3D
	GONvETAIDnZi2grvDNIveRzFj5py27OeB8sTPmazllaUlVf791LVKROlazdBIVTa
	w7wxzw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfjn5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:11:23 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67114f59883so977345d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024283; cv=none;
        d=google.com; s=arc-20260327;
        b=E4tFeieUmbPuGfg1jplf1VMz4MHfpvjF+s/CNHYcIzw/xmk6RXMO9gspd7XjATq5ys
         YXDuENuZZUUSjxISC1PaseC0WuaXG41/J77IpLs8nHPDHFCNHwNifZFg1QpTK9xiTSPj
         JbWgKWGal3bLmxPUlyeG/+i6JLbKr4QwQf6lBcL8iH9DocmKa0o7fmZyBlywN4YehFw1
         CCJNxFfpwyVX2GpL3eKy6N76st81CDVSGU8UQohfcY3McsOsSL5LSvT7Tfh1eLZqpvUV
         tm9ZQPycNF8Dhh9U/0ULia0mBahMq/kpQRF7BVmAZhs3zN5qD05T/ycyy4igqi8+mWEd
         KlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        fh=AYGqyqWFeUA1UXFjo6Dzsn3oPJ+kVFNd179XU6+8og8=;
        b=Y9Hq+5d3hEy40dWbyIe82r5NwoZeb4WkZIQqkAoyUcDB3hQEZSWYG42AFdxs+4d2IW
         UoypkIgTAqslFDDKANI04XaBsfJxRQ+DsWxyZ55u4OjkJT7QylzLUsPvRaTLILCL2wYP
         b6R4Hsq0/hfrA7MneCgRRDqesPCWk9vbgq3sXg4VznHd8pM1954W9UsSk+SAAIipBd/E
         SyXsYmcG4XEHp1/p4ph+xstXEvWtbS8ACqC/4gNJ4Ij1AObmjUb6x7C/C0z6u6PQQa7G
         CELId2W4llWnD3S+rQhWwAg3aAevr+tqr0GEqoxzuHylG9rc6tbuBh+ZdCeHu8aI5QNp
         qMcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789024283; x=1789629083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        b=T381WuJoc7WERUnFOAXhojgSNlIBLAG4WMk6Lbg6vbCuRTcGYWfE2s1JicxcIuaWl4
         06wMmdRiD60ZjJKIqevGq13SIec01C5soHSbL8FcfSIm0FQqI6bnfsr/lLLK85h6hXUD
         TWljsKigIKFk6i/GLFsQTR9SibXtLpoIAxdqEWX1IW1AdW3c02qrYyjNH91XR6K3oSmI
         CFbkc7BSOvkkt5+53dLmAE9z744dXeQkAjLcfOQ4myljufZv/rwaBaIuWCdgX0PP15fD
         rTUvHGeNUKDDDuZyqH35q2M8KJ9hbKLYl2Qw15EFYzFGQz9J+qhIvWPsIb3ICWf2cbUD
         9Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024283; x=1789629083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQpBs+odCBgTDhFlVtMnY7R7uOtDQAidNcb/DTFOxkY=;
        b=KRwVXDvWXFWOFBiaaPNViWEUZpFfg36kTS5aUbvoA+EintOFaZIdRFJ5HWtc9S6IgX
         vzqFZKHixGwdOyXN7fZjCRtRkhHuYAr4D8eXyDI49qs+SXyFe6QyJbT7NQnbebww1p0S
         92d85Wg0z2R1EKAU25B4qZezH5AjfEKwu67ju32kUcBEZlqqWzAFeXSoX2qfDA48fE+u
         v4D5LxjDM5/Ep5D3oh16cyeohhbXvZqtknOjcEe1bdWDpZwgb4EMSur7+U+Pq0a1/I5N
         iQAqBBpd2/9GKxl5Kc8zdWfQvpEr4wnARSNp3NR8vJhm4rxz3H/9pyzVPHAjS9Xyp9lT
         Hj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGUkIaYxjo6knFk1ahKcCt+3lZu6ow62TaQZ7ONuHx5jeA81FR1ZBSK4owq6u7VNCVD1JbEdYvKL7b+XM=@vger.kernel.org
X-Gm-Message-State: AFuF++nGGu5DrFe2IDPBA/13TcNKecf9wbB6LmgUrNilb6R1eA2NYmxE
	Uf2/1ikCq6ATaWHgZBkbl9TNmopQfXT4wCdThzCVFS54632vEHoeVvkH3hJHjj13nrahjOTBB+I
	s44suPzMbCF26SPlE7Hq/GKHi1Ibm6fiFp7/WmhTlaT3BfyrpJLsfUVy1LwcHcUUJH1sKoSgJAG
	cspMEHL3mXc4gXN0EO3yxZGeImqJAihiOoP1OqHjkBxQ==
X-Gm-Gg: AYBFou0tTzSyMxG7CcuwaGOUFK8+6q5n+wm7iHsmDJaQbPkFh24b237i1ZWd0F/AdoW
	c+U39fIY90BET7pHXzVhHjdKgeaTZ/zcxLlxRgZxPyHO5YT2e/vFpGMMjbxSl0eCfszq8BC+EzM
	W83l0U92qRZ5NAYLXbwFFgweMhOHyuxSuLtjjp/lExALbiHF+5ajkXQBAfvw==
X-Received: by 2002:a05:690e:d41:b0:66f:a1e3:9c77 with SMTP id 956f58d0204a3-66fb58f831emr13555597d50.2.1789024283207;
        Thu, 10 Sep 2026 00:11:23 -0700 (PDT)
X-Received: by 2002:a05:690e:d41:b0:66f:a1e3:9c77 with SMTP id
 956f58d0204a3-66fb58f831emr13555588d50.2.1789024282836; Thu, 10 Sep 2026
 00:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com> <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260713160754.1250988-3-mukesh.ojha@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:41:11 +0530
X-Gm-Features: AcwNN1UuJZypSHdyHXzQ4_kU6RGI9Uveem3lDvNPyuz26jeLuRfYKMB_4uImEoo
Message-ID: <CAGptzHOWVAvzp8QXXnjfJ=Z9Hkfqh9ekpcZbPxm7CdMSkR1kWg@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3NyBTYWx0ZWRfX3VtP3OZMQRTM
 fTN5Rb/KFm/z2nJNqqEvC/MZlq6kgVPw5loCYemfvs+95OznLRxl/tklV6FMaiAhKrgdFTnAk6x
 qXTcBy4qnCTNnSVqAnwh1BMU7UaN/Hg=
X-Proofpoint-ORIG-GUID: dwSCTvKcs-TGVcq7ZLVtP93XxyNNnXqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3NyBTYWx0ZWRfX7eKvNfpbPmNe
 Mq2pDAfCxBfzVBE1cS19KnYSphvUqBYR4jlVPac22t1ChSTdBvKYG/lAa3erPcCmBqA93isfmT4
 cMq4VR0NYWTaY/CkE2XxAnWVsNwHoAMbwtuH8xyQ0dEhdmRVLqmjwOkPIKvaAFziTc0AH98hZgu
 Q1EL3A9qWZWAixUl8ny3A/cG86D7yt9aWOd84d80bkJC96WhKfYyp9n8NLA22kVTP1+d4DAZqNQ
 FLOE+oGPgntO3v6UE7uky/n82rdByPaVj+xrjJLrLf5fSYXgXRNh4SdHYsRAsY8OdFgYs698Hmu
 pLl5EaYXtz07OOnr4R87l9iCMmnjGEerkq1ELecc+qPtaJseQcqwzzxZ/2ET02Taw5Kl7dy/JEy
 HAPvI4Ho1p1a9ioFJZiOS91iAflnx3dSfKcyBj33Q7Tu3MAdYh20aumYEIPlYN4yrZc02AVIoN+
 SqGpMwrOWN1Bb/gsRGA==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2581b cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=jaA2rcG_eHD-4mjPCPoA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: dwSCTvKcs-TGVcq7ZLVtP93XxyNNnXqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100077

Hey Folks,

On Mon, Jul 13, 2026 at 9:38=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on these devices [1].
>
> When running under Gunyah, remote processor firmware IOMMU streams are
> controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> Linux running at EL2. Describe the firmware streams for each
> remote processor in an EL2 overlay.
>
> Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
> devices to produce a -el2.dtb alongside the standard dtb. Modem and
> media subsystems are not yet supported due to missing dependencies.
> The GPU zap shader is disabled. In EL2 mode the kernel owns the
> hardware watchdog, so it is enabled here. The wifi-firmware child
> node describes the IOMMU stream for the WCN6750 firmware; the &wifi
> node itself is left untouched so that platforms without WiFi are
> unaffected by the overlay.
>
> [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boo=
t-developer-touchpoints.html#uefi
>
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 39 ++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
>

Any updates on this patch if this can be picked up for the next merge windo=
w?

-Sumit

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 1c857bd7991b..22076579a50f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -164,7 +164,11 @@ purwa-iot-evk-el2-dtbs     :=3D purwa-iot-evk.dtb x1=
-el2.dtbo
>
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D purwa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-fairphone-fp5.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp.dtb
> +qcm6490-idp-el2-dtbs :=3D qcm6490-idp.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp-el2.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-particle-tachyon.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs404-evb-1000.dtb
> @@ -176,12 +180,20 @@ qcs615-ride-el2-dtbs :=3D qcs615-ride.dtb talos-el2=
.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs615-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs :=3D qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-el2.dtb
>
>  qcs6490-rb3gen2-vision-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs6490-r=
b3gen2-vision-mezzanine.dtbo
>  qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D qcs6490-rb3gen2.dtb qcs64=
90-rb3gen2-industrial-mezzanine.dtbo
>
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-industrial-mezzanine=
.dtb
> +qcs6490-rb3gen2-industrial-mezzanine-el2-dtbs :=3D qcs6490-rb3gen2-indus=
trial-mezzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-industrial-mezzanine=
-el2.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-vision-mezzanine.dtb
> +qcs6490-rb3gen2-vision-mezzanine-el2-dtbs :=3D qcs6490-rb3gen2-vision-me=
zzanine.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-rb3gen2-vision-mezzanine-el2=
.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-thundercomm-minipc-g1iot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs6490-thundercomm-rubikpi3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs8300-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/d=
ts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..8daf7f02fd75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +       status =3D "disabled";
> +};
> +
> +&remoteproc_adsp {
> +       iommus =3D <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +       iommus =3D <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_mpss {
> +       status =3D "disabled";
> +};
> +
> +&venus {
> +       status =3D "disabled";
> +};
> +
> +&watchdog {
> +       status =3D "okay";
> +};
> +
> +&wifi {
> +       wifi-firmware {
> +               iommus =3D <&apps_smmu 0x1c02 0x1>;
> +       };
> +};
> --
> 2.53.0
>

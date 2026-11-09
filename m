Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794223448;
	b=x8FWsSqpQUiOCI023a+mCN0CppD3rH5Qxf5xO0wVjMWBABf350a7tYil3RYsmAsK/XpN
	 3C8AkyCKFrP9xSMWgTJ3du2PlWY7J2TiMV4pWRkmDsIiay0/eAu7Ie4rW2JqeUI3XoRqr
	 ZNMrEaRtnM1UB72GzERs1oRErOiM1WKdnjMngXcJIns5gElLA+iYqWR/KzP70WvDElR2Y
	 PcH9qg5A3bZHcrVZfniwjJl/l4uyD4AMLsfYroDl1mpUU+rBO5qxZRWfKot58L1v6d7bq
	 BdhPQj0YsX6P+7wKD4Qyn74Qk88KKJHD7y+m2vr7p2vZSz9v+7/jXD50OKHkLaYD5lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
	b=kJtUKxAdqb/kAqzoiH6dOrT6ScgRfvJLpSxtOdYqMwVyfUEkwWtWEKZpIoBATY8c72iM
	 nYzqSqg3P1FRSlaUkfCfuyrVwhBE00HYiiIHsYrE/k7hU/Ir0dguhLGSWwa7vg2/mjdeA
	 H0sxiwOEyBE++4NvMSBaydS71QnwD+JYHdJKdWBtqRDtMAsKPv6zy1G+HoQU3MYLOVPH6
	 wfBT3k8Y6LIV6/3shYY0/6yqmgCgCWc38ub4afXtrB2Yo34S+jyBqnviP8aJ7XsRMKLWa
	 3gcdg/Orqf73wIDzPSK4fJr8Wf1PIRgOcCRdUaJpToTMEspAFrX8XJ9cOSQP11jh2nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwTWnkiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CElQu+Ci;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C2606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D25C2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwTWnkiQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CElQu+Ci
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9B3VOZ3937013
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 11:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=; b=NwTWnkiQVksAE+LU
	l7m6spD1oZV4uW7PzTNwXLg+dM1Wq8aANLKsuxPXlkuVe/RUowEv3I4fbV+6CQPx
	XO/pGMRvXSzZ/ncZNK8mgmDQ9v1ATkBHoWEfyZKKeaJNi+iEztf1320dzWGp/lXf
	/gw+0zSF3rKsa+xGn5YFNFKEV79BNgyg6NWnEK869iB7stX7qZq7pyB0slRv8z46
	ZugPxesDo+iyoasdDUAoawji2Z/GDpwfEbD0LB/MDbQRmhVWbfdBpLR/ynjvON5H
	hPsLI5nF8B20TDjyFx646qvuc1e+go5LfLcFPeCSKTFCGuIVz8IRnN1vMsqV4p5+
	dsp/Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydg2vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:24:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso179291985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794223446; cv=none;
        d=google.com; s=arc-20260327;
        b=ET7kYHUA1QaLyMswT6wy9dJ1N5UwZmmy59VYuhZlQtgDgqiY8hZiJbNfjAs6BW/Twk
         eLIuIVn+vAFQ4HbFHcsHNJmHAN0OGmLhR3eb2J+fScvwcsVv7CMTBCEv7Zre8rC8ZkZA
         6v0pgfYP6zVHRpu4OCijt5U5nSYcfa1dQMRGTbXabVm3SeG0XFu5Zg/1F0NJVk8CDlu5
         Owfam8V0mQSV97zo/V/zMJ2aT6p1rC4fm5gkV6j2In2x3n4bQ1/E69nbjWbtgGAVzcbN
         rma/9RP6CIHm6s55gKfpd0rkKfqYbrm02ZCVDwIc+2uWQgbjJQpM9uMoPfucbkk2boPf
         2MZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
        fh=urViO7DUDFmn5ANcd7aYD8uKF87hMvFSXzWUsI9HsgY=;
        b=kjgKhgJMFQW8vQnqT+D2sf94cP8Ang/BI67ULBF+Kq0SyeNo2JNCsLi7Hgp9XzLJ/4
         ocAz0VeWteKM9aqvBnjGvgj4WrLprlrsGxJgPlnqBV8VRMikwGN+UUBgGLHkHFDMbKr0
         Zp4TU6NJUQa84x/ErqBwCKLCbgcW5FYT2HEypE74S7iklLHd/Ft6gG9Pg71kzOn1JKDn
         tQly8VX5d5/vWXaaoNM+gH9YVgA0Y1pHl4ehrTLRr2uxowD0CmroO8X1su/F0MCN7JMU
         wgwLwtPXq4nTvmZK+eY9NvtY9ObS3kkdRQkc0/YpJbKS3XDc9TIrXM8TcZk4r+auQd0S
         rnWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794223446; x=1794828246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
        b=CElQu+CiZtP7SxU77ARgHITSwcgrOO/7ZqaVRmnh/INOtLfvX9/KV/uXkok/6Y0+RJ
         ioh3mOJQJaiCJ81hmRB3IHxxerJ7ReL4R6hQTdVo4E5XMgs5h3oxt/iJ4b2jMWPBpZ7E
         fBIHjtCz7v/hjmbBdp5LsfrfkxnQccbkTFnvpNJdGdGINMbX7FleskrX2WAaSGls6y+D
         JpQlDThquNliw1SP07NNWamAo3kyzYvVibUA9HJp5n3Ax5BeYxQp7UbKZJZoVwvQC2ZT
         xzgueeHzQWSFkCgtwwAL4aVKN8DfQQ4o9KP4dgt7Wv3+g9t4J0Q7gZ+UIKp8NIDVMf8f
         R1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223446; x=1794828246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
        b=F4ptH6wcC467gFnhwlFaWiFVgMnFASyVK10KPTRi3DcpXlKPixpYJzlvssilVS2Qrm
         gF5UjRk2gFpOyjSfzF1hxLKtR6K0NpZ7Fab3El1hI41aRdfM/gxpI5vCGBBFIOD7cxEZ
         riHtyj3KP5bqH0ideOCyclqJ/e+m6o5xFXfThIzPIiHFn3f2Ze/C+62c4IomrvJQnuXZ
         Pen1SSmba1HZr/iIBBZ42eO36r0D+BlZ2zkrlbkd8e0VTu4XNTc/QNyhK+OaeAXt8RYE
         OJLSPHG5mG+sNkk1Xgw3q66Pq/uW4DzszhAEksW8ITYS98g48dOcNQeoqzq9ZzVd9+9G
         0tGg==
X-Forwarded-Encrypted: i=1; AL+hErElJkwPKWr/K00k3RJU+r4bjtzll/at0Gur6noqKd2dqbX86JmQU489PGW/mjzWUsIob2NEPKTioFeAWhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/U/H1mRiuEq0qmwtwxixdfgnkVpZYI2bvRJyJ1Lk/SRZiUSBF
	xk9BpGyfKgcBg1nsh9avCriRNpzvjhhL7AaepmVj2AUkKj1Z1S9TaLfzoabdplNOYZjIINHNtDA
	dzjpIIPWm0BAcsltgS6PQwpDsdkdPPTJDw8LLRF0Pjya80uGYspZGopA6L+gYPkRRDIntZ1oUTc
	dTz69R/qHTOeK5zFLC5h2RXDTwevEPnPeRT9/D9iWDKg==
X-Gm-Gg: AYBFou2bXtrIX0pv3FQn3EPwoa0BbUOa4nJrUT4CoSupfQwPzl1hfV8npnpWxNlQM2r
	hzWxlabewy7r/gFKkj7rTpmQYzAXtxUtHp38kP9/RJ3i9C3KlqYxuJQHd2ozE0GuH3ApwlEMums
	d2VORrfHKXhjdkTVEbMki2ww4s9+KPyKvk3gcMr8a8jjc9cl0LuBtPBEr38cs9u2ib3qhBffhPU
	bPE7fbUgoYAab1bfRbOPded++YUkOpIv58/oG3XgGMAO6W35EDP+05aXygl+LPkdKR/IZA2DVo=
X-Received: by 2002:a05:620a:372c:b0:93e:c12c:f127 with SMTP id af79cd13be357-947842cc3d0mr531329885a.83.1794223445799;
        Mon, 09 Nov 2026 03:24:05 -0800 (PST)
X-Received: by 2002:a05:620a:372c:b0:93e:c12c:f127 with SMTP id
 af79cd13be357-947842cc3d0mr531326585a.83.1794223445161; Mon, 09 Nov 2026
 03:24:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109110352.1621-1-xing1989093@163.com>
In-Reply-To: <20261109110352.1621-1-xing1989093@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:23:54 +0100
X-Gm-Features: AclHuK-bsTnV534e2o8b2uaFEnn9XDo3taFcRNRvoIpbZtuKvB31nYQ4Wmbg9tg
Message-ID: <CAFEp6-1TrCaeP8DtHvUFnPYQw5+B=gRa2=ogjqCC+fKy9AXbKw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: xing1989093@163.com
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NSBTYWx0ZWRfX7GFOBH+JCs7S
 W9C/aPBlBrgKAUfFuMB+IRIJ+DSjrhBZFFWfFlzoPhOmWgg3Zs+govAe3zleol+PZpLcMX1tbpQ
 yKQE0iB1ncojsLbnNqks5xZGkosVdQw=
X-Proofpoint-GUID: ftdeh-zXSW6VKs94cUCs6o_wDCByfXVN
X-Proofpoint-ORIG-GUID: ftdeh-zXSW6VKs94cUCs6o_wDCByfXVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NSBTYWx0ZWRfX7BDZ9e61+giG
 FyvYSaKXuG64ynIj10ubaRaMNXjtauX2C+Xf3JyPWYC70U+9qTohpaosHBM9y3xZvAIUIn03tG0
 6CtzZ0+VmS8kQRQUzc0i6ANeUoeq/LWRI7LfxCjOwb6IL9utEBSriIPJeAu/8PfI/mpQ6euB1zI
 Np0aO0yOxkrXypdf2q8U5GVTRkiI0LixnMZ89cYUNEleL4xWGBbk6kgQEPqMf7FdqvQmWZcYlKk
 pGjWiu2BLMi2FOLqjN5Q6i+zoYD8LxZKDB8003hGxPV3dLSnDMB215brYvxcihz6OBy8Rexvx4O
 2GxRk1V797RkMd1AVA7wwcHHWYToNN2i2WyCACnRcFNbN2jxRXdGXsGbuYIjhA7HIyzvc1XsJig
 QsJtoUSoL2/wW9XZ2ZvvlwVQ2aK4BeNhV7GY6vQGxn6ivGtu3ij5ji8rstNMZkaDc+gU6y0zBQD
 41W/pQjYvHEJG01T9oA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1ad56 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Byx-y9mGAAAA:8 a=KKAkSRfTAAAA:8
 a=Ok8h7geywy7ULKIwiTUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090045

On Mon, Nov 9, 2026 at 12:05=E2=80=AFPM <xing1989093@163.com> wrote:
>
> From: Hongxing Xu <xing1989093@163.com>
>
> Writing the MHI SOC_RESET register is a device internal soft reset: it
> only asks the modem to restart itself, so it is useless once the device
> has stopped servicing MHI. A platform level device reset (PLDR) power
> cycles the module at board level through an ACPI method instead and does
> not depend on any device state, which is why vendor drivers keep it as
> the reset of last resort.
>
> The out-of-tree MediaTek PCI driver does exactly that. Add the same
> capability to mhi_pci_generic so that such boards can be supported
> without a vendor driver. The method name is board specific, MediaTek
> firmware uses the vendor scoped "MRST._RST" while others may expose the
> standard "_RST", so it comes from struct mhi_pci_dev_info rather than
> being fixed in the reset path.

Since mhi_pci_dev_info describes device-specific rather than
board/host-specific properties, the same MHI/PCIe device could be
reset through ACPI on one host and not on another, depending on the
platform it is connected to.

> A NULL name keeps the generic SoC reset,
> the same way fw and edl express "not supported".
>
> pci_save_state()/pci_restore_state() are not used around the ACPI call
> because they clobber dev->saved_config_space, which mhi_pci_reset_done()
> needs; pci_reset_function() recurses back through reset_prepare();
> pci_dev_acpi_reset() is not exported to modules. The call is skipped
> when oops_in_progress is set, since acpi_evaluate_object() allocates
> memory and takes ACPICA locks; that leaves the panic path a no-op rather
> than a fallback, as a device needing this method cannot use the register
> write anyway.
>
> CONFIG_MHI_PCI_GENERIC does not depend on CONFIG_ACPI, so the path is
> compiled out on such builds.
>
> Signed-off-by: Hongxing Xu <xing1989093@163.com>
> ---
>  Documentation/ABI/stable/sysfs-bus-mhi |  4 ++
>  drivers/bus/mhi/host/pci_generic.c     | 66 ++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+)
>
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/s=
table/sysfs-bus-mhi
> index 8b9698f..064bf6b 100644
> --- a/Documentation/ABI/stable/sysfs-bus-mhi
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -29,6 +29,10 @@ Description: Initiates a SoC reset on the MHI controll=
er.  A SoC reset is
>                  This can be useful as a method of recovery if the device=
 is
>                  non-responsive, or as a means of loading new firmware as=
 a
>                  system administration task.
> +                Devices that advertise an ACPI reset method (for example=
 the
> +                MediaTek modems using "MRST._RST") are reset at board le=
vel
> +                through that method instead, which power cycles the modu=
le
> +                rather than asking it to restart itself.
>
>  What:           /sys/bus/mhi/devices/.../trigger_edl
>  Date:           April 2024
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a38..4e84e10 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -8,12 +8,14 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/mhi.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/printk.h>
>  #include <linux/timer.h>
>  #include <linux/workqueue.h>
>
> @@ -39,6 +41,9 @@
>   * @fw: firmware path (if any)
>   * @edl: emergency download mode firmware path (if any)
>   * @edl_trigger: capable of triggering EDL mode in the device (if suppor=
ted)
> + * @acpi_reset_method: name of the ACPI method that resets the
> + *                   device at board level, such as "MRST._RST".
> + *                   NULL when the device cannot be reset through ACPI.
>   * @bar_num: PCI base address register to use for MHI MMIO register spac=
e
>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
>   * @vf_dma_data_width: DMA transfer word size for VF's (optional)
> @@ -55,6 +60,7 @@ struct mhi_pci_dev_info {
>         const char *fw;
>         const char *edl;
>         bool edl_trigger;
> +       const char *acpi_reset_method;

And your patch series does not define any device with this property set.

>         unsigned int bar_num;
>         unsigned int dma_data_width;
>         unsigned int vf_dma_data_width;
> @@ -1111,6 +1117,7 @@ enum mhi_pci_device_status {
>  struct mhi_pci_device {
>         struct mhi_controller mhi_cntrl;
>         struct pci_saved_state *pci_state;
> +       const char *acpi_reset_method;
>         struct work_struct recovery_work;
>         struct timer_list health_check_timer;
>         unsigned long status;
> @@ -1180,6 +1187,49 @@ static bool mhi_pci_is_alive(struct mhi_controller=
 *mhi_cntrl)
>         return true;
>  }
>
> +static inline struct mhi_pci_device *
> +to_mhi_pci_device(struct mhi_controller *mhi_cntrl)
> +{
> +       return container_of(mhi_cntrl, struct mhi_pci_device, mhi_cntrl);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static void mhi_pci_acpi_reset(struct mhi_controller *mhi_cntrl)
> +{
> +       struct mhi_pci_device *mhi_pdev =3D to_mhi_pci_device(mhi_cntrl);
> +       struct pci_dev *pdev =3D to_pci_dev(mhi_cntrl->cntrl_dev);
> +       const char *method =3D mhi_pdev->acpi_reset_method;
> +       acpi_handle handle =3D ACPI_HANDLE(&pdev->dev);
> +       u32 saved[16];
> +       acpi_status status;
> +       unsigned int i;
> +
> +       /*
> +        * acpi_evaluate_object() allocates memory and takes ACPICA locks=
,
> +        * neither of which is safe once a panic is underway. mhi_soc_res=
et()
> +        * is reachable from __mhi_download_rddm_in_panic().
> +        */
> +       if (oops_in_progress)
> +               return;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(saved); i++)
> +               pci_read_config_dword(pdev, i * 4, &saved[i]);
> +
> +       status =3D acpi_evaluate_object(handle, (char *)method, NULL, NUL=
L);
> +       if (ACPI_FAILURE(status))
> +               dev_err(&pdev->dev, "failed to execute %s: %s\n", method,
> +                       acpi_format_exception(status));
> +
> +       for (i =3D 0; i < ARRAY_SIZE(saved); i++)
> +               pci_write_config_dword(pdev, i * 4, saved[i]);
> +}
> +#endif
> +
>  static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>                          unsigned int bar_num, u64 dma_mask)
>  {
> @@ -1435,6 +1485,22 @@ static int mhi_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
>         if (info->edl_trigger)
>                 mhi_cntrl->edl_trigger =3D mhi_pci_generic_edl_trigger;
>
> +#ifdef CONFIG_ACPI
> +       if (info->acpi_reset_method) {
> +               acpi_handle handle =3D ACPI_HANDLE(&pdev->dev);
> +
> +               if (handle &&
> +                   acpi_has_method(handle, (char *)info->acpi_reset_meth=
od)) {
> +                       mhi_pdev->acpi_reset_method =3D info->acpi_reset_=
method;

Wouldn't it be better to maintain a list of supported reset methods
and iterate through them, selecting the first available one, from the
most generic approach to the most platform-specific?

> +                       mhi_cntrl->reset =3D mhi_pci_acpi_reset;
> +               } else {
> +                       dev_warn(&pdev->dev,
> +                                "ACPI %s not found, keeping SoC reset\n"=
,
> +                                info->acpi_reset_method);
> +               }
> +       }
> +#endif
> +
>         if (info->sideband_wake) {
>                 mhi_cntrl->wake_get =3D mhi_pci_wake_get_nop;
>                 mhi_cntrl->wake_put =3D mhi_pci_wake_put_nop;
>
>

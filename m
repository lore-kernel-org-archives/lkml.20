Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ADD49158F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994785; cv=pass; b=DuvOR0RJSCBgNvEu4gUshK/uKNXe+DIscQZhXrNv4lPRgEiKfNEIQyaRNx/lbQEK8IAY/RabQb93z8/6iMWdRIY27xQNWXhZQBeHFc2A9GB4WwiPbNXTvSuWBIZsU7zGKIkyn+xK1zy/sYGC65OG8lRg5KbZapjVwdknRWH65s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994785; c=relaxed/simple;
	bh=zhes51yOam9nrMY50t2XhGSjaWOq58zdOVkwQ6/JTTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcwFbFT9OCM6uyAqZCJmcrlNzNcvoSsemXvX9+D2g72mjqHaLcwHL/5ctz4+VVbz4pybtUgnEhTdk+DQK4YqBuuOJeVv9WYYBM6xErNN57xwydUUI0Ez7mwE9p3PCV/8jcSFGvn2/Iaff1rmasYWsoXBK56ju9KSLJE4S8+88xM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDV/uRKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOEseVby; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDV/uRKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOEseVby"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe0vP1414001
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=; b=FDV/uRKtPIY5Te0O
	/bQLtP7WCvqplyZdNh/yoW+2tP/GxJRj2pu/B6Bsl0tycX9TtwpAkZ2N0+iOYQKl
	JoIpLSfJsY+e7FBiFpYhQMo6g3XgQhIwE1nJh3JJb9MfQWsyWEC67O1f35xHuyZX
	z9qj1VvujtNw6wroAqLSizpGFKgzMfc5UYFj9zFzgjqJMMEnIgx1EYa5V6PwjB2a
	eidrXvUd6D9+bsRQYXBngget4ljibpHdqFk+dqh8Azy7g4c/vHo0NXQIrO3go1Ax
	kN0Go5GB7uylS/SACc7SzmeISBCOdGJhbq82oCS0UvZ4gOSftSsIEswUdfChrIa7
	CyqGeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d18hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:46:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so9377a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789994781; cv=none;
        d=google.com; s=arc-20260327;
        b=Hc9sXxxt/2W/y/6Szw9OyI42LqLB1Uh9D8fYz9k72CT8W3A1zmGHQQGAgi1xuOXmhG
         jiMeEENQToM23XseS4L753KAJ62+2hqK3zUUhO5ROQrSJNSlwm8HSFRtr3HaiWB9KIFP
         x14kQyt/IWseKzbsQBL5M3+eMxSFpy4lcPWpjZU8OG46Ti5ajOL+I49hZFiUcHgWJk/y
         GZZnWTJVDKLZBU7+XMu2k0EdJBBUY+efEBnlXZQoIeNnsds1rnC0p/su61GHcaaE3MJ4
         kinVQGoJTayMmUJSCaed7Rb13ZjT4n2R5BllPshsbW3x1YbEM9wtrwAZChpT4dc/Y2nb
         tBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        fh=Fzk7GN8hftFDhMPu9l7MBfYETUP7PqDJcIwURG7IgmQ=;
        b=dJsZK1NBa/tzrbeJ82wbt2+V5qQxw6m9Of8MAcmstISrOpR/SAUoL0IO9cdtAZJaXE
         ga4bcP90KG1bHu5kFGfJBQWi3xq8zsZ11R8em+AYiaCzgKOjAeo3dF6jyMeGSyLDy8f7
         uyBJc5iuuYlGwAo0YSUDxG20aYhdz2SrriuZ8YLMoB4aik4EaNjV8V/MRUrkbccG0YxQ
         ou21tY26xphIEbrhBcNJ+bh+4RMmPl8FUHPM5iNveoDEv/fggXWT2nZVn9BT58Fd0are
         ovwYzBU7m2yJ32j3BS1woMFwJqALB3Cysf7wv5MoONLIiZp4CN6i1q6rhxq1MohxCp2Z
         u9ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994781; x=1790599581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        b=GOEseVbyfZNt7wUgeRrqbxA/hDoOilk0zGgdb4pVahg5gGMpTFbVBkQ6JnWUH5UWu1
         VNZlH/kN/7KlOGMuMYeXHyt5RtR8eCUIPeiH/ddXTJuDxLFp7HIwzvXIdh8limPRjw/O
         njsFnBsRrSuW8CdY0UFknGapmraoPh3gDSuwtf25yY64LUzAxFNMz13V5ENSmpMOSTjh
         HFaXqeEBR3DMtwSJFvhT1Qh+k+kvQREycV3d4YcqmWEohMitjkZ+eMpLUiezdbK0sN+y
         +85YR0UTnfdkbW2N82ZeyA/QysuwSlbh9defJMIRL1ebAngAcwJDjar4r1HeWKtPFRlN
         OEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994781; x=1790599581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGEBVkSl804Lbjet5Iqv9xkjaomkmKa7knvOOohRepM=;
        b=18HRckDa105ozc7ozMbNbCf4T9kD3i+X4S8hd2wuPP6PDWT8SaxU97ISaywgiwrBHX
         eA+PPagwYa0OvXXoSElPZrvMq/OwGL224ze9RwXGiRx0D3xF1OzmVF8ZzNXdIfAcbh+U
         DjJHMbGoaf3B3zKVAaXxn/XYrtlPvhC8PrK31/p5qYDN4Zmgq1gHqjNL08W4j7kGSZLa
         +kWF/q9UY9bXV7Z/bTGtBM2kZMOzmna0TbC3ox7Hd0ysRm0TGTQDVdbD3022vgYfUA18
         nnCUlN1086U0kkp6008GdQckTxIdFCeph6LmmJH3YkT/b54NlEUEuJOi8anKBv771AYs
         NhIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB+BfFvYZeTmz7ynJyngRl4sl8GMT9Cs6NT9iCGzZxRXomc9Z5HUkRAM5LSCf3eXV34AZkcA9SlqoDke0=@vger.kernel.org
X-Gm-Message-State: AFuF++kdDLu+nDvj+tysRpSgzf1nRiWIz0RPnuQaX5kqjpWyptaU0yt7
	YE5pzI2YBSL4mDPIXFo4cECX5VLdlXh6+QF0UGWBRGm90r3m+O32zz8nRwhp3D6k/bC5MT/PL6f
	vcS8tsGf0eEKj/6TG8ESr2pq/F31Mv2fabTSOPjVY2/EFqyxgmdhQZpYkDKDJPZVMy98jTSnTI5
	0SduaIKZ+hb6Adi2LR+WMa2+/v1QMG46/mgjtmpabqUw==
X-Gm-Gg: AYBFou35LVYfShIgtAQSdHPHnC7g0Om/jidnr9XlnA+r3Utu1tigwrpCrdwe7TVZN73
	wC0OhK76hcD2pY8Uy6kHarZruQ6Vf7yvQn6Hunoe1esM6xgAnvH3KBJsXgBD75acoS0pYPmaFIF
	8v5mlpuk+whkIYKQZTZ5NQgTJ4NFMbEUun9XJydcyp4SqqCjz3TqTiazqw5Q==
X-Received: by 2002:a05:6a21:6f87:b0:3dd:a197:edea with SMTP id adf61e73a8af0-3dda197f85emr11235058637.57.1789994780986;
        Mon, 21 Sep 2026 05:46:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f87:b0:3dd:a197:edea with SMTP id
 adf61e73a8af0-3dda197f85emr11235017637.57.1789994780421; Mon, 21 Sep 2026
 05:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915104328.45901-1-gahing@gahingwoo.com>
In-Reply-To: <20260915104328.45901-1-gahing@gahingwoo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:46:07 +0200
X-Gm-Features: AcwNN1X9mUUfG00OJyVIt6nOyuDWy2ZSHbWKT6BOlwyDwHXMMZbGC4tmToAM-O4
Message-ID: <CAPx+jO8EixqfXmrD8zkMkJe_B+2AATo=YNFJraAdE_O9X4KM-w@mail.gmail.com>
Subject: Re: [PATCH v13 00/14] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
        p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com,
        royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
        sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
        u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
        diederik@cknow-tech.com, alchark@flipper.net,
        dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 7DCu7r6-1TF4_yAzz7gqeNDRsmNRKTSz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NSBTYWx0ZWRfX7djCiIkbdIZV
 Ss8JuZrPjCO/Lc2Xh6M+zQW0P0Qychta2H6YV4kU7TQoY/bxRLJF0OhvMPGVAdY+kGmbJUfe3t2
 cFIg60ug2PfbYn//bLefSFdkabmhYzM=
X-Proofpoint-GUID: 7DCu7r6-1TF4_yAzz7gqeNDRsmNRKTSz
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab1271d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=9GNsruGHAAAA:8 a=uuLM8HNXhctW1a4qv2gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=gf-oSkQAjqHFJRp-GQfY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NSBTYWx0ZWRfX4PswwIq4VpM8
 KXLMqohsvoRKJqqRfyMrwZgJHYjLCfyeFu8xjtpKPxjFPOloI/hD1M35xijgD1bRY01/p88MyV1
 tvDhrjkiwf9mU5XaSwwqmixe+/s6FUowe8/fKuAPa8R9rnCe4DJIXooTqo0wWblSZoGMiXNx5d1
 cBbd+bxHGn7PZXY5JyW3A4gmNIf/0Dip0jxbTilITsUY/Q9xj8Ud8pamnfAoiBHrjTZ1pguVRYu
 HC367NU2GwkquuCZY+q5IB0g9dakdykjTzaeA1350FVur8xgZ2wh+v5hIL2hG9DX6QoHt1I2waZ
 Jk4MAiGlOMF3c+8fRXwaW0DiBvTYXTInN+cU9Gn7NtsM5U+05/L2qtEEVC576cd1qZa2hC1za/n
 MJ8U2D8G2Sj7tYdW7X3IVC+s5HA40jq80qnFuSiYhdCFP3VeG7HvHNA2YFC19r8sqK+Ao7+52Tc
 ag5mGX7IIma7qiJVrhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210185

On Tue, Sep 15, 2026 at 12:43=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> =
wrote:
>
> This adds the RK3576 NPU to accel/rocket, which today supports RK3588
> only. The RK3576 carries two cores of the same RKNN block, wired up
> differently. Two extra convolution buffer clocks, two power domains per
> core, one reset where the RK3588 has two, no NPU SRAM rail, and a
> PC_TASK_CON that packs the task number into sixteen bits, not twelve.
>

[...]

> Igor Paunovic (1):
>   accel/rocket: request the core clocks by name
>
> Jiaxing Hu (13):
>   accel/rocket: take the completion register writes under job_lock
>   accel/rocket: wait for a running IRQ handler before resetting a core
>   accel/rocket: let the core suspend after a reset
>   accel/rocket: factor the completion tail out of the IRQ handler
>   dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
>   dt-bindings: power: rockchip: allow resets in a power domain node
>   dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
>   pmdomain: rockchip: add optional per-domain power-on settle delay
>   pmdomain: rockchip: cycle optional power-domain resets on power-on
>   accel/rocket: select the per-core clock and reset counts from match
>     data
>   accel/rocket: add RK3576 NPU (RKNN) support
>   arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
>   arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
>
>  .../bindings/iommu/rockchip,iommu.yaml        |  28 ++++
>  .../npu/rockchip,rk3588-rknn-core.yaml        |  47 +++++-
>  .../power/rockchip,power-controller.yaml      |   8 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      |  22 +++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  86 +++++++++-
>  drivers/accel/rocket/rocket_core.c            |  32 +++-
>  drivers/accel/rocket/rocket_core.h            |  11 +-
>  drivers/accel/rocket/rocket_device.c          |   7 +-
>  drivers/accel/rocket/rocket_drv.c             |  42 ++++-
>  drivers/accel/rocket/rocket_drv.h             |   2 +
>  drivers/accel/rocket/rocket_job.c             | 151 +++++++++++++++---
>  drivers/pmdomain/rockchip/pm-domains.c        |  83 +++++++---
>  12 files changed, 456 insertions(+), 63 deletions(-)
>
>
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> --
> 2.43.0
>

I assume it's fine for me to pick up patch7, 9 and 10 from this series
and funnel them via my pmdomain tree. If not, please let me know!

Kind regards
Uffe

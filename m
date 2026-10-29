Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283452;
	b=CH1Em98O9p8hntldtFQyzrej/5XRviesZLxCnDviv6TdWjU9/SLpkb/tJxAuEQ3lQV0V
	 id1DLqk8NZKxeBjecyoMmjryqOjwKYbtHYUhI3jc2aruy8uiTeQWsp4AmbW7YBoZJbPHL
	 sqWEtCXp5ViTU15yVbfdAXLbIrvn9OCKYtWzAmJCrrJjq9DJvP+eD7jLv+tANq2Gj/jdI
	 3gxDyAWhWRVESlTYyU+Qo6xP2YpvXN0gd4vgMT/n0wAc0DTPTwrjYspRbR/rz3gB91wgi
	 AD3xKdHBPObfpTAnoBdb3RNH0hgxo/j05MH5MmYmjtkCaEUHAZv5BQYUxhcnHFZzbIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
	b=mxgFOTxxULeNgIqwSdd097Q5PdfSf5xPM8pTxp4euxp98RnSryyR6KQ8SggplSKUFTV7
	 hK3mvqeqmPM/VjXNWfIrqdFXpLTX3LjFBgq7L3HH9SpySwCQEYRFOTXV6t/u0wVHGo67u
	 /EdFrYfLoomRGYI4hTIQFMYIUPUD/37cOn8V3+eikFwtwcZRRZwZEbchpERuPnd5Xo99u
	 sM6dQbL7yfBRDgEoDkV61kUv4o8COOLrHK2ygwhWm4yAoembq+GCaP8sUXUwcBecGX4Nn
	 ozc2LR3HRdiwvayEjvAJIfK/qrzb9j4PX6Nx0vVVyx6aJ+RzbcBgpoeGz4rXLlp+Erw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQtlFtN3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Sw/b8bTs";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2D6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQtlFtN3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sw/b8bTs
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCePhJ3215086
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=; b=MQtlFtN3Sm1zrKcl
	CXdHmjk1+4i2GVB87eTjCAk2iZ8XgI1ju1LAU9fXlFhNV3lr/9IrVHRJwAFbmdkm
	Yz7HoDbI3x23yjz2RH8Y3Buc3UnPlD7fF/Ua3OZYZE3Q6G3I1mAxGmbI3ZOnuBy3
	eia7RL+aIosfPaxgTMXhqvIFStyY4pkAGFJOMM+U+SSBGWn6HtliMKf4PNqmhyFe
	fnPaDJzPbHlf5JWHqENY1GquhwD1AiQPuMErzzn7/YMg0dl8MXa+Cy/mnjFjGFeV
	QKy32Fe913pIGO8sJQKEwvtopj3vAplKqWNOyhSRzxFOIwTfa+59EEnBiURPWoSJ
	S55T+A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5sa3a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:17:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so2520014a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793283449; cv=none;
        d=google.com; s=arc-20260327;
        b=FSTFZlvphJRb5htghLjx0hEKwzFWOGKpjrUJ3CvVEprFU+Ok9v2sO6WZGvp7XLQECk
         el+c50Xi7qGOoTJGLD22ojLSAIiFrs1EOAUIR5JAG7KrEM9a/qactdEszPy5y6Pu91+9
         fLExJk0h8DjGqpCQZ1M+33cz9ph3r4TIWk2/NAXw5wq1j4NU/xhWA4C3WCcmpPCxYXPq
         +sNeHAzMp2UHAEDcTYWQ78DshW5meNeasSB69ALdPRcOMhlbA6p9IKc8N125RUosdnhh
         ckH2U/JGJSyE8G6sDle6mdFAHWtQWoHrX3ls3c/im6D9vLnMxPoo0tUPES7qSqB4DW4C
         rZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
        fh=4ct88WeL/BxaXJn43w0Y8DOxnmHmSxNnOIaqRcV4JEQ=;
        b=o3TJmENS2QYi78unKg+F909fB07brvkejEEBKCHdmM926daTtgCFIshGM5MgO8fuWj
         yroZ7vlMtC6kc3lvBYXdeO94qnRyKC2YvFng+AgrkheSHbHOFJ4JSMnNTn6HAbcaUUsO
         lxAfVoZUCZc/g2bNICu0Iaa4IjjUoe/m+M5PB9paU2/ahL24SAkyy2JtCHzXVTGcYEb8
         uft7KdmcCYWPrgKPKB4V9Jps3uBoWA8ND/lBsV4lNVB0PPxff4ZVDuUXV+qi/2biQDEa
         3LlrYIQfNPrn1WTHyAc1nMaYcOodgRny8bwPebq9dxhmFOXAQ72HwLjrX7moAe3dDVv7
         1bPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793283449; x=1793888249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
        b=Sw/b8bTsQfxu/z+k24fBLGT07MMd7ACMJvRejrPM90Mr1uFqvVz16CsrSostXfY+eU
         iQZoq1Al076DAAb7Sv2WGFUUs5Sb+06UlXNNplNwuSV0RZ+avbRAKFBf0wZtrGaJPcuF
         jOL0yqyzDsgIkuQE3RuZMnpg5D3gWVYOxC4DelV3Fw9VbzUNdiKUSTi3pCxPAhau1IYg
         8COh687ecHXdvwQjXKfcfydzNMOJacKDJUV77XStTrqUobbXTaTjmAt9KHshYCIOFr/M
         kp99KYBINixmPgc+5RcfQ07HADZYh2J/S+fN/rATga7TVck/wS0LMmtXsUsxUJft4KM9
         V1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283449; x=1793888249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XePhe4mIyzoHuWMx1ZSPHH7Ab0CP3siwIwYmV+A8biQ=;
        b=CEYwzZkrrTH0Lbmqh72IpwYmp+gw/vB5XF2tSv8QwUO77+4P3PDSgVIbahtzWUL2la
         a0p4/uW1dZt/caztXK9/+TuX2m85Ac0BwlC1UyRL7V/H0T1qK2u3UgFWjSdOkA1+DwUk
         Op1rRIojsDot6CfLVQta3U/pMKGbFX1ujat4I+D9IRKcCWTV3lpzBLA6/DEsLMLNjqff
         bdGXWG/5qa0YW2oX8wXNTa6fqWiKmABhmDn6HbUY5bk7YHVzayi2/e0npw7QetCYBxT8
         yPIbBrAKRx9FyLbvvo16AUM/OOnAe3EFK5Wwq9Re8IR/ZUrhqbttbAjA7Af0FjMKTBEt
         egJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHvSukseojteu5sVceSzcQBUEQtfhbZZTyg84eSmoS/QAS1P0FmxMfmFkOMyzcr5cV38k5JmeAYSH0EZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiPtb5F+LdcbUxAYcgoS16FFuEDA61eiQI81yVxYXH7m4etRpT
	lqi55E9ecV9LuY37dTnpmgfC4/SA+QNw2+H70wBYu54ryvOM2ekpY9uQIxG3JeMujKoizvtqc2Z
	Z3p42ANyBwkc2D4Fe+S+WcAmyM0BRiPO/rwg0/X4P90aF1BPyAvHdeUIApQ34CB9J0Kd178w7xp
	FYNbapMobuJAM8xx6zteaN7gHcLox5t4t2B2T2loyhgw==
X-Gm-Gg: AYBFou3jNPDCuISft5YSs0MCILePyFjDs6bWGeTiku+1QpqN8lVsbY5pSkDX02bi2Ok
	Hd5b2Q15OTWfWk7OG4EcNFYzH51kXU2wAFfRnUeg4YuqpTdqWxZdtd0EkJetG4a24iyxn0L0iVl
	/1UK4NT435UNafIpD3u2OSTEUO13bsGHvIGyJpq4jUdlJS9nan9H7uG5yLkA==
X-Received: by 2002:a05:6a20:6a0d:b0:3e3:1013:4665 with SMTP id adf61e73a8af0-3e90234d9cfmr5486415637.48.1793283448642;
        Thu, 29 Oct 2026 07:17:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0d:b0:3e3:1013:4665 with SMTP id
 adf61e73a8af0-3e90234d9cfmr5486382637.48.1793283448152; Thu, 29 Oct 2026
 07:17:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
In-Reply-To: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 15:17:15 +0100
X-Gm-Features: AclHuK-yG8GjI7p3wdC6k_i_FEVr3l0Mml-BhNjxuIZOPYfSt36zwQfp3z00yhg
Message-ID: <CAPx+jO_ywfJUAGs6Zo8yJyTpqui=qN-T9qqWN2hKCyeegAeF=A@mail.gmail.com>
Subject: Re: [PATCH 0/3] ICE: Enable runtime PM support
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1NSBTYWx0ZWRfX6sZ3YEcZCfYa
 o34+t7BdSXTrLrslZcXlQDx1KLchDVfQbk8jEYcgyA0WSxhBhjYQ6LADfU03gmcqbj0M0CP6Wfn
 Y27pcGzay4sceheaf5USKLLEXCCtToskZGGPV+bqCUvJCmWib1FQqX1Ge/tyQw/+32yYj7D1u2e
 YM9nbWIw3X02VZxGppEIPvYoddiTtK6r+K7gLF2VCNPohQvfcXlXfxTSH4R9fkfts8TSkNqhH3+
 FjCZq2JB3s/abWkmH/BGIbE4qP7ixBKcR6hR++nGd1W4WGOrmVEbbJ0cAJpMyRaPeyFHEXZpl5b
 bMBHi9u8FpW4CgVcfyhCzIYPfeN3qSCZ5y1J7O/9Dlny+gcGI7om7PDCKLSgv7yHAdr9mgrB8VC
 5uyrcCyGyoHGiY8Wf8ZMVvCwibENOZ8h9YUNCxG6ZacqCikbFxkFXAx4XNvsTYH4v34jdXxrJmF
 QcCB6yl8P5u2LlU443w==
X-Proofpoint-ORIG-GUID: Ct5wMYpQYuFm0Lqzx58id4-3gqFNJ63r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1NSBTYWx0ZWRfX9GsAqaa8Fbww
 PtXZt5Zz4m2zhJZe5vibowpddOrGQF6SdekjyLuWJ71/CMRfDICCx6Vn1OfLQk4bTDisSBYVx39
 g2n7WGCE5BJ/EObu4gKxbSHTYyhYV6c=
X-Proofpoint-GUID: Ct5wMYpQYuFm0Lqzx58id4-3gqFNJ63r
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae35579 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=MNM1_axOnic6cDGTpHIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290055

On Thu, Oct 22, 2026 at 11:52=E2=80=AFAM Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> wrote:
>
> This series fixes ICE clock lifetime handling when ICE is modeled as a
> standalone device and referenced by storage controllers through
> qcom,ice.
>
> Currently, ICE driver enables clocks during probe and keeps them
> prepared after probe completes. This keeps the ICE clock voted even when
> the storage controller is idle. Add runtime PM support to the ICE driver
> so the standalone ICE device can enable clocks for probe-time register
> access, then disable them and remain suspended while idle.
>
> While enabling runtime PM in ice exposed couple of sequence bugs in
> storage drivers(ufs and sdhci-msm) as any key programming call used to
> go ice and never complaint as ice-clocks were always on.
> Example, unclocked register access happened from ufs/mmc in
> qcom_ice_program_key().
>
> qcom_ice_writel(ice, 0x0, QCOM_ICE_REG_CRYPTOCFG(slot));
>
> Fixing this issue require ice instance at early ufs/emmc probe so that
> correct sequence is established and ice is ready to accept key program
> calls from blk-crypto or any explicit storage operation.
>
> Merge strategy:
> Patch 1/3 and 2/3 are storage driver fixes and should be available
> before patch 3/3 lands otherwise will result in bootup crash.

Then it's perhaps better to send patch1 and patch2 first to get them
landed as fixes and for stable kernels, then when that is done, please
resubmit patch3 separately.

Kind regards
Uffe

>
> Validation:
> Tested on shikra-evk, kodiak rb3-gen2 and sm8750-mtp.
>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
> Kuldeep Singh (3):
>       mmc: sdhci-msm: Enable ICE before enabling crypto support
>       ufs: ufs-qcom: Enable ICE before enabling crypto support
>       soc: qcom: ice: Add runtime PM support
>
>  drivers/mmc/host/sdhci-msm.c |  21 ++-----
>  drivers/soc/qcom/ice.c       | 139 ++++++++++++++++++++++++++++++++++++-=
------
>  drivers/ufs/host/ufs-qcom.c  |  29 ++++++---
>  3 files changed, 142 insertions(+), 47 deletions(-)
> ---
> base-commit: 9a482184d910775cf648863148944945b74e2815
> change-id: 20261022-qcom_ice_pm_enable-3c5d21b99e42
>
> Best regards,
> --
> Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>

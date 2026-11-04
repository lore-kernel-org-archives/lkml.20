Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793825461;
	b=Vtes92CA1/KQBe2JevcK8BgU3njR1+rEp/C/nfUhGcApLUgepzN97VYCk+ZPymLBxWdv
	 CQVUSosRTn6D1JYp3CCnAgJ2Z7iGe6gQ2ZS1FLC9vA5AVbHvW4gDqr/Hj5zpsH3/TuvOP
	 qAAkONCrjgsreGYOczWZHrCdfbQNOKtgR6M8dPnTpdv84fapXZ/r5NvAAKE6Saytzq56v
	 tt7tFOQhmz94s9KVAmyXfkcQUEqImUL2V/c1zFIpMUQNi+4giK9MSteXi7s4qiIg/LuGM
	 CcAeUZYOYWZK4YzQcFUQVayjQ3C2Yk4ntQW8KvoBTX963S6IayQ1dNi9kUFiDGQ41ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
	b=HxzfbBEC8kNkUMT7DdGCFgL7fZl4OZVDQgahh8UTHmho1EZsLa08o5ZaKJQ8atXu56TK
	 DuPo5n8EAgMkHFx36bTPZ+8snKmPAp6ok7iathuxFPRFSS88bESPTNgaFF7VC0hYYckIA
	 aBOawNMbJm0GfEYJe+/MnVq4HM1HlV0/gALnfuuh0CTK2991RM+fPKBEk52/C4IqfxnFS
	 uGE5qZgz7gdxeYvFVzdkfgUza3RrpbT3r1aZ2LHUJlk4ku8Dj/WS47lJikNwn17YnGJ2M
	 i+374gjOLPWH31i/7iqqBg7uFxALNzRQas3mAgWfuIfWTAKftgYWRD2q6fT53AsE5vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FPLzKSct;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpWlJfa9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD719606C597
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD719606C597
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FPLzKSct;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpWlJfa9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjKIL2244434
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 20:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=; b=FPLzKSct3sUcfTZ8
	0xnibdGxfA2+0iv9nFEMefGkAQ/b8bDmVmsSuTwhZQVDFRXpDYGmTpMDNdGcOnf3
	3H8tTOSbkj8Hdkb1kZdLWOINxKTHijahCufgv9hkFMv7qRht+ht0FkQRQcfkkfaX
	eEcBNnCmxZ957XwzlvGcZMocunCuUOe3RZ4zyR6x1KX31ZO6zI9Gxq84urR/zx6p
	DLb7Tx8z0/stK69+/y6VIqTpX3r6XBfCVW5LnRk6bQojqOZ7gdKJ5JFq97/RxGep
	fCTXhFUSAR7TC45bZeDndgBvZSApG1ryXInJMbT6BIeYzihVrh4/QMRzlxJBShRF
	a0eKRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyjc13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:50:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943e8ff02d0so126860585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793825459; cv=none;
        d=google.com; s=arc-20260327;
        b=cZzvVAd2oxJ2p6V3nLrqO6BY335iTjb1vb1gqQaFkXl5iGqwiyCOgN08aYulhGDhFi
         0ZEQQgeTcrueEfFouPhAiVlX7FZa47g0GHZJag4KtekhxFWGwXtkRtxpRMyf/+lHmJw3
         E+zU8a5lKiMQLQzgWJIDJy+4vxS5D5+gErSVNDHPeGAtvOYM6XjSNJnmGt3IPAZx0nG0
         W8r2+HasaXzbmIcgUgVhwJ+t8cWbtn26T9vBgHoh+qo7c6Id17OPKQRujEvqCsdj9ZD5
         2cAdVgESi0JrfJiFSmcv/a5W20+mR1K61ZVmC8ozW0FyGTuQHfgIyZ3cEn9Ih9CklQc1
         rxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
        fh=SbjfxhkFSco7/k+8A2sWiovomeFcv018JOlNXb+2uB4=;
        b=HHIvhLyLhPQJz0c06aQvBvw3cr5O4iDdxlmDvye1JxYJ9ttUR5soGuwZaK6aBW6iAM
         ZGhKAfF3IZ8TnQTg1Hc2oz0n2xU6buEjfcx45db2WHOZ9gnU0X9qoV9ZHPeM6EeMVIMe
         4a1XsLzxDIWNB+wb1YDzWuknhertddyXDXCoJdMLJa6BoiqD5HD2XqVg3FvY/yy0VH6G
         DlcTOu6E3JL8alxgYQhcmq9nk6gSoRTNso862rOQabYdKwKYCYLSPL50SevS9otxou/f
         dDlcAwAyGRhOpn7Pt2iMY81xtkK/yI7mSvHLQdDtYOnYX87cP4c6Is+X9Ii/vkDcvUcy
         mJ2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793825459; x=1794430259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
        b=KpWlJfa91E9oH2uLWXhGgcxztqpHeAUHj7rXFbOQHNJr7IxU8tbDBVH3lMmH7HWxw3
         d41BDai6xOR9xgqlWFcekrM89XpWNMFK3brcTCzFIij56q2VFwFTfhysc+6CCBPfMv4e
         qUnMNKypYF6rRqJXkilBdisRn30xVUzZIkVV6L3ThOgzvESV3+3aKGgoS1fcQ+4nH9te
         bVRSH5qAD4zuOx42QSCS4bg4GTyanwrv/EgL7Fu49gbCCLrj2o0mnCiUSWW5a0QV2Nim
         nFVaAHLze/YW9iPXinVgGIKf5zqwBpkKt0PjOH+zXvWgIwTKkCaxQ+ubPQbbfs5CpGYz
         rTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825459; x=1794430259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
        b=LF+CNpdSKxT9stoIRuqrqW6n8OdaWZoSTnD4vzvIUTQQYowUef+5n8SWoZx2sHTttR
         ehvrFkMfjrLVJEkK4+W7fPJlgaM8vVLu9YNgpOWZQePFjT6n7pmXjl6+lEPqOOJ06Thf
         RphK7cr0NMHM8LhV6W8RiGd/pMIK+EFOx7lRregLBsa98pGByhxDP1cU9q5AOpjhb7I+
         icpIcOJgOcgXiYAdWM99zK7uakSEA3djPlvK2mktAr4AnvOunolYYPKuMWQoT5SyXYlS
         gDWgUTUkYHhRVhUQATU3tLiOiUZk9xN5ohaX/tM53cmrrJGbheA17LuFTOrLYLZv6+on
         yLcg==
X-Forwarded-Encrypted: i=1; AKwUvBwqACB5K2XGLWEb96LW9Zv17dpVjSuJskvBJ/9nZ3Q6Px0GR8sXm3Bb4o0bIHT9lJ6TgIW4O36B9/pyp+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZLK/p74yPlF/u59pqngxJEtn6pWlQL4oGNklRYAgB+Wq2WLHy
	3KRmyosIvDHPiUyUmY5TjmD4OiHlemX9qaBX2FFJZW/pAU5Da5XqGzFVAPqZqi0UxGEWCIfRK5g
	uKIqUSFvZ76tt1kpGtALKyKv4hCOkLoYM92wQh8Dn88j99gJrF2qRpSWi+qM71g6H2iBEnit1Qi
	7FDDshx4/xO39wHvQPF0oUw0Ic/JpIGsQfH2svZ9E9HlOcZPyCsH0X
X-Gm-Gg: AYBFou3DDeMtqQyzZ4L/P67CNWe8pMCebEsnRno7VXeLTQER/y+PQ2umBDh6DfrGHz7
	MRXPGTVBtPfMUqOE4B6WR81vKLQjOzlmindagGpb0tcxkIfeDYQkV4/VzYWxHJirwgC28D7ITsQ
	sSQlsD25fsShnQtHrRolfhxOE4gKr87e8qbfOr5d53He79xtw7TtcRS11FtzXJFQAhvVB2mZXqf
	cfH8vVehcMkXetcojYIaF9PtTj4F7fwV0TU9VVTVi+QidWQFm4gtyoagKpkZsFiyoCpCaQXVI4=
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr2806223785a.56.1793825458724;
        Wed, 04 Nov 2026 12:50:58 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id
 af79cd13be357-9442174fc9emr2806217785a.56.1793825457949; Wed, 04 Nov 2026
 12:50:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br> <20261104202313.72494-2-allan@fatecpompeia.edu.br>
In-Reply-To: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:50:47 +0100
X-Gm-Features: AclHuK_Rxl7cbdoRg_QDod4L7B3ML4GWx5ddvnZ9Bihe2VqguDfQzrrRuv7GEjQ
Message-ID: <CAFEp6-0aVDpJUcBc1TD7NXjszKcb_LUEm92mZCKc0dL2dqnzdQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there
 is no IOMMU
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb9ab3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=HVCkNrGJQQosrJJkAP4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4MyBTYWx0ZWRfX5hnooBsNOJAl
 Bwss8a6KVLMH+Knq6uvjYch2bjxInF/b7oduD6P8/LKMpiiujewtOJhvvHpqI8AAMN9D6LHWqvp
 81x0p5S4MUgEdfvUPh2b5W/MRsG0mpldtEmqYnHYsZHiFue56emV86jT/slc0wMXVyYyWWMm0+X
 YDnqu1j77xlMqLW5mb9dj5Pc2XbpO/a0rOnBQ4lo+ctnp9nKnPRxgPE9+Np4cFfy4XhpZMJzBUM
 CULYks1UdjSFR5q9UHmVBbbWDERAjYy7CIGHWI79rW9IkncfZ3NiJlIiy7hC83FdSVMsa4eXkpa
 OlQDy/Nzu6BqHdbRp38uiXkm5KsIfYQ+PV6j6FYLY+mawCW/Xsdd0eliukkgWrbh1wXKvPPfxdp
 iUEFesYlCPTN+802LApcIc8KZM+NHGQZoa0DLDXcL5JwXIDn4x3R0hatuiKQRX03plnKjJW/icf
 OQk6EypoAcwWs2SAKgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4MyBTYWx0ZWRfX9Bv79b3kPVCf
 DII4NPM06dyg+0XAI3dcRy4PxRqT6B+I1nDSDF90rhllXvKqqXUSmS3PXW/WndxzbC33Ttd46ZN
 5vZwUfBGKPyfcJf/1KcLrXrf+o5fNMo=
X-Proofpoint-ORIG-GUID: 7bKP0SR8yguoiUzW8PWd6AAapPVyVbbd
X-Proofpoint-GUID: 7bKP0SR8yguoiUzW8PWd6AAapPVyVbbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040083

On Wed, Nov 4, 2026 at 9:23=E2=80=AFPM Allan Siriani <allan@fatecpompeia.ed=
u.br> wrote:
>
> The VFE write masters are programmed with a single base address per plane
> and then write the whole plane from there. video_buf_init() takes that
> address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole buffer is mapped
> as one contiguous range in the device address space.
>
> That holds when the CAMSS is behind an IOMMU, but not on SoCs where it is
> not, such as MSM8226: there vb2_dma_sg allocates scattered pages, the
> write master runs past the first segment and the frame lands in memory
> that belongs to someone else, which quickly brings the system down.
>
> When the CAMSS device is not IOMMU mapped, use vb2_dma_contig instead,
> which allocates physically contiguous (CMA) buffers and checks that
> imported USERPTR/DMABUF buffers are contiguous. Keep vb2_dma_sg when ther=
e
> is an IOMMU, but refuse a buffer whose DMA segments are not contiguous
> instead of handing a partial mapping to the hardware.
>
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
> ---
>  drivers/media/platform/qcom/camss/Kconfig     |  1 +
>  .../media/platform/qcom/camss/camss-video.c   | 64 +++++++++++++++++--
>  2 files changed, 58 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c94..3d3555b55 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_CAMSS
>         depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select VIDEO_V4L2_SUBDEV_API
> +       select VIDEOBUF2_DMA_CONTIG
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
>         select GENERIC_PHY
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f1..2c15546c8 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -7,12 +7,14 @@
>   * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2015-2018 Linaro Ltd.
>   */
> +#include <linux/device.h>
>  #include <linux/slab.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
> +#include <media/videobuf2-dma-contig.h>
>  #include <media/videobuf2-dma-sg.h>
>
>  #include "camss-video.h"
> @@ -146,6 +148,48 @@ static int video_queue_setup(struct vb2_queue *q,
>         return 0;
>  }
>
> +/*
> + * The VFE write masters take a single base address per plane and write =
the
> + * whole plane from there, so every plane must be contiguous in the devi=
ce
> + * address space. Without an IOMMU the buffers come from vb2_dma_contig,=
 which
> + * guarantees that. With an IOMMU the scatterlist mapping may still be s=
plit
> + * in several DMA segments (max_seg_size): accept it only when the segme=
nts
> + * follow each other in the IOVA space.
> + */
> +static int video_buf_plane_addr(struct camss_video *video,
> +                               struct vb2_buffer *vb, unsigned int plane=
,
> +                               dma_addr_t *addr)
> +{
> +       struct scatterlist *sg;
> +       struct sg_table *sgt;
> +       dma_addr_t next;
> +       unsigned int i;
> +
> +       if (video->vb2_q.mem_ops =3D=3D &vb2_dma_contig_memops) {
> +               *addr =3D vb2_dma_contig_plane_dma_addr(vb, plane);
> +               return 0;
> +       }
> +
> +       sgt =3D vb2_dma_sg_plane_desc(vb, plane);
> +       if (!sgt || !sgt->nents)
> +               return -EFAULT;
> +
> +       next =3D sg_dma_address(sgt->sgl);
> +       for_each_sgtable_dma_sg(sgt, sg, i) {
> +               if (sg_dma_address(sg) !=3D next) {
> +                       dev_err(video->camss->dev,
> +                               "Plane %u is not contiguous in DMA space\=
n",
> +                               plane);
> +                       return -EINVAL;
> +               }
> +               next +=3D sg_dma_len(sg);
> +       }
> +
> +       *addr =3D sg_dma_address(sgt->sgl);
> +
> +       return 0;
> +}
> +
>  static int video_buf_init(struct vb2_buffer *vb)
>  {
>         struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> @@ -154,15 +198,13 @@ static int video_buf_init(struct vb2_buffer *vb)
>                                                    vb);
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
> -       struct sg_table *sgt;
>         unsigned int i;
> +       int ret;
>
>         for (i =3D 0; i < format->num_planes; i++) {
> -               sgt =3D vb2_dma_sg_plane_desc(vb, i);
> -               if (!sgt)
> -                       return -EFAULT;
> -
> -               buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> +               ret =3D video_buf_plane_addr(video, vb, i, &buffer->addr[=
i]);
> +               if (ret < 0)
> +                       return ret;
>         }
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> @@ -699,7 +741,15 @@ int msm_video_register(struct camss_video *video, st=
ruct v4l2_device *v4l2_dev,
>
>         q =3D &video->vb2_q;
>         q->drv_priv =3D video;
> -       q->mem_ops =3D &vb2_dma_sg_memops;
> +       /*
> +        * Without an IOMMU a scatter-gather buffer is physically scatter=
ed and
> +        * the write masters, which only take a base address, would run p=
ast
> +        * its first segment. Use physically contiguous (CMA) buffers ins=
tead.
> +        */
> +       if (device_iommu_mapped(video->camss->dev))
> +               q->mem_ops =3D &vb2_dma_sg_memops;
> +       else
> +               q->mem_ops =3D &vb2_dma_contig_memops;

So I think we should simply use vb2_dma_contig_memops in all cases. We
don't appear to support scatter-gather buffers properly anyway as we
only program a single address per plane and neither the driver nor the
hardware handles multiple DMA segments. We've likely been lucky so far
because the DMA mapping ended up as a single segment, or as contiguous
DMA segments...

>         q->ops =3D &msm_video_vb2_q_ops;
>         q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>         q->io_modes =3D VB2_DMABUF | VB2_MMAP | VB2_READ;
> --
> 2.43.0
>

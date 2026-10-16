Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626344C658
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160217; cv=pass; b=GomHEoMkhyZVPxAQBnoIDmh6FOSGeKZuZF2tUPMYbZeELSkaFdxKNneDn9FbWmJAyY5atgYLkImFYoBN0VLzEirKtQM2nA9+YAQX5a1AF6DCPAvF1me9MXNoFzcENL8uJd7HycelA+1y3ZL1a6sO/HiYcXPooUdt2VxpbJNz4hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160217; c=relaxed/simple;
	bh=3klzoEwdmDgtgiYwzPd8wX2mLz847+bsOmduGxrInEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2lzzut6GAmOJXGh6jYUHk2l5LM2gNu2dCPYsnCtEbyduPdKCpGGB2BGsbBmgvJ4n09uJ+a705I/L60yJT01c1qmZ3wvQZnAlNtUTNSJRjlgX9Ch72H+nxSNR3zESLSZqqOOHoQJAoCbUvkKb7vyaFWeKzyQATVg7NZJI8SecMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1Emuyl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsbLXz5W; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1Emuyl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsbLXz5W"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5wo0997076
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=; b=C1Emuyl7VV7tQeNc
	hflvsy3osABsc1JcCpGtvp/8KkQ2E1QkhM55GeINa6zhov/PzeC9viOB4XXMbp2N
	LHYkVkncQvai5JxENQ34qE5oZdulmWh7c0bWLmwgmJGvriaikRtQh22YDmnpp7oJ
	Vl2lYuuTbN0St4Mn5VWEgxWQiT3wKUKKKTmZIWsvxSya5o/fiVAjyJL1NO6W3VIc
	Zgv9MPwu3BpzWZdiD1bK7ILsnuc6ZrwR+1t6vi6EHc5f09Aft2o2J2LhuGpU3/KC
	UZeI4Xtksf4EaxMOUTvih9xsZxgiBQaf4jf2KmnllgfX0WwGxYwKawBZ+vvbFQLg
	KZvjQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjta7fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:16:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso204758685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792160214; cv=none;
        d=google.com; s=arc-20260327;
        b=pn2bXv+MoAQtd04rIoKNUNCnHEFyf4i5H8R88XI4G5B1GRCHfv/Q+rhh4R2BJz493v
         zQTKqVYmRtpZzmUse4K1cWYOnjCYGaVB13A9ZAcrxbIJdzvPgPktkHVpzJjwRthLz2ul
         KdR9kwFzOcJJ2pez/0sP3kk/VRpOn8DbHqndS4fJ4qg/RNMCDbs6yz+Flu0mehwTG7rG
         WVtj9DPRwiBwYu34xgEJeB23xPBqaq/UUgS7beps4JlLGtDiufwwg5UMTfZs4ntO4Iqf
         SArLVPMbbHUNw7dnQHNEqlug99XhhYiCZMwUqA0LpYhgOuWQYMYSgmSk0bdBQoXPi8/6
         yG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=;
        fh=cK7Bz4xR7s6rKAwsBi5YE3MVLag7s/fIO7FKosxfndI=;
        b=mRMc8LgbMmI06pyDotjA2yXuYmkFtliUsJKt40Ha242QCrvqo2rY+ZMuAkVrR3dZtp
         tXyWkzJHfhUhWVpb2Nxt4JmUIm0RmqwfMnMSjNcDYzCCGO23GnUA04svhxENGm5CKWDK
         5ueJRbDDK+MqX4rhum4ze00LnfXXOXbhRB/LCI6/V9XjGCckam+ifai2qoQTFTA3MWMi
         jwMixj5GMVo9RsOnK7f9k+t97DPGWz6Zry8HjYGrhMTVCl8UDvLVS2WApokS/YYJma3E
         bBlqVWY878qQ5q7fa7QuoKzzuru454DDi4yvoIeI59Q4idXlSRX8qbsvS7OqtC2ug6JG
         Tu8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160214; x=1792765014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=;
        b=HsbLXz5W48nM5B6KI8wiKRqTnh0g4ER7oMBqf4uH/uJLd1fFYoBKwwnsr7jk+nDWYI
         DrSw4yu79AY+pgAZ1Dt1TY+82a9MJS4l/J4rJPkbTuwg0KW0fQi7sp0AiT3yoSSkcFBn
         YLaPDTKxXUMRswtX4y2aeS1OAwskaifPU/kxxTqVsbbtXrdXHcOPWwf4tffpuVByOsB7
         D7vmQxhJ0JJpaB8gWrCOUEbYrCLx1OUpfldUXUY0RR+ULdR8NBAvI1120B2NaNNDEe2k
         3zSOeZZhRoeGIVvpeo/9Vk5CFiecA4pIEoOpT39wbHmK3Z5uLP0Jkt/5HgBH2wuXKSIS
         zoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160214; x=1792765014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=;
        b=WccS+zyi9ZsVz+CxRcyP7iGP4p6VtqICoGvU+BLal8wg+vxTr0622k+85G1jh+ucFg
         PW1VV24w4TzuWzYgevxGxaCRvNSHmvM+arG/JVutAHaViVHcqc/lcUIdpQHBP+PRt2O2
         6cRQcgrsRldQwmokQG047Kt38qjtvN+ygMqBwdnOKlv2L9wtfsE6BNryorG8OaGG5DfA
         cQhRqbk6YJjeykvS4Cth16wTreRGVmgoNy6A9p2A1OcgAQ6ALUL5oQ0j5Kyh4Fi1Yusb
         Wm93XDwoc+ixCRmWtq9sTRdql+AQ/FBrl/oIN+/gX+49samZcfM5i9Ptl+7Sl+Jufflx
         aG8A==
X-Forwarded-Encrypted: i=1; AKwUvBzRjD/sQaC7I7X3cqONY410OHuboLnDtaPdMhqUUzGZSt1K8JlCdsupzD6gOPrv+FLB38JRd46zlHN7dms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWiv1YjPIlkyLv2Ccr6ngPCQu/c5KqBKcfmdaE8ysPB2XgtF0c
	dT9VG4kYV41QPsWOoVX1IRtaohyQPul0x7KEZHjQxE0n6MD8xo6didtt1JXFQyS83RdA+5i8/A7
	Bnikve8WBNcuh1liLhwj6G+KCIyQXnPc5wA156ylbZuOTHnPNETzM3PzmGzbHeqeSk0gNe+U16X
	zRVSfvPdQLJ7GWICscWsrKB3aLqpets94uAKWFtWc4zQ==
X-Gm-Gg: AYBFou1PltArtEyxGaOGQQOL0N05BXfdboZJHtDZdh3WlD+igEDICK4SNQH5bACwDxX
	0/X9WOD03G+Ay9ayxr6kyW56hfgXeE4fvGdQ38QZA1lLS+PH1Pn601GylTlFCVmf5frKKfULP0J
	gJs5ZcsuDD8rD1NO7GpRrpTXi/2srE4aJbz3E/t+SjX+vKq6VlszV/WSoyIgRTcdwhBz/F0GH9P
	SRxr1LU34oLZ/2uDREZp/Dbs3ZZpcVaPN2ODB+2Y6Ts4oEyJgaGv3fxLPp6E1HQsCi5u6x9RQce
X-Received: by 2002:a05:620a:2550:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f17d83913mr539582885a.10.1792160214043;
        Fri, 16 Oct 2026 07:16:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2550:b0:93e:6481:c8e0 with SMTP id
 af79cd13be357-93f17d83913mr539577085a.10.1792160213520; Fri, 16 Oct 2026
 07:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com> <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
In-Reply-To: <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:16:42 +0200
X-Gm-Features: AclHuK99Hd_HGOMZN5f2R6Kx3faR2NTk9mAbjl7PJ4fmgQ6YLOcNMULcCIH6CbM
Message-ID: <CAFEp6-3RN2e3-wjLoyjQfLEE4GnjhC-9SJiz4FW6GdBKewZTNg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/4] phy: Add MIPI C-PHY mode and configuration options
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8hh+Y1xj2OYR
 R7iLJP6Y1nnlPFI/57rXSYsCh1KR21tVFABh5BUxCPUQZTbzLPRTgHZLXKPMiktB4VyFmLOTttp
 6VuS41VfsMrtQ5I056lrWS+k5cn/BSiuU+7nIKk2bfQwlao5CNYNNAj4uxn1kI4nWyJcij5RFcp
 +bTt3NmyQajcCtRh7PX6eXvjxR22whetWf9iC+/gVs5gWjal85ZMWaaBYjjlB+ELvaRysGgUS/5
 5TkkpqxL3D2wBhTHVxLbfGz74Jab7ZDsY+HmOhAzf0kPgmf/hUX53kQ7A9ze+RnpCk5m6FekYog
 Ad2K5KVZ73zH9iLe6akJDIByJUaIRMuTVrz5JC0xx6ScVrNIaGDBIT6TOsEFq6uuTJG5knjWP1i
 6ip/WKiRe7TRQkmHlL5lQsMZPWN5NNyN0ieXwnMYv2/0g0F73l9M9yCiKB38dYftVqaCfULPloS
 MbJZvwd3UgZHvDJLerQ==
X-Proofpoint-ORIG-GUID: -YZ6b8gZmoCUgR1XSo8Q-35ZVlckKIrk
X-Proofpoint-GUID: -YZ6b8gZmoCUgR1XSo8Q-35ZVlckKIrk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8oo/bzAxfk4E
 iKiz0eMXLvPviu4drG4zqy6oYHG5i3o7XZVOxFxFzgeSpu6MxypvGX1WLh17etp+JFIwWf04RjS
 kg/9eaE1b32gArWKvsQ7EaOLEZmjeTI=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad231d7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Tql0FWbOqO6HYHnYiHkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

On Fri, Oct 16, 2026 at 12:57=E2=80=AFPM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> The generic PHY framework has a mode and configuration options for MIPI
> D-PHY but none for C-PHY, so a CSI-2 receiver has no way to ask a PHY
> that does both for C-PHY. Add PHY_MODE_MIPI_CPHY and struct
> phy_configure_opts_mipi_cphy. The options are the two values a receiver
> knows: the symbol rate on each trio and the number of trios.
>
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  include/linux/phy/phy-mipi-cphy.h | 27 +++++++++++++++++++++++++++
>  include/linux/phy/phy.h           |  5 +++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mi=
pi-cphy.h
> new file mode 100644
> index 000000000..ef6af61de
> --- /dev/null
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __PHY_MIPI_CPHY_H_
> +#define __PHY_MIPI_CPHY_H_
> +
> +/**
> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * MIPI C-PHY phy.
> + */
> +struct phy_configure_opts_mipi_cphy {
> +       /**
> +        * @symbol_rate:
> +        *
> +        * Symbol rate on each trio, in symbols per second.
> +        */
> +       unsigned long long      symbol_rate;
> +
> +       /**
> +        * @trios:
> +        *
> +        * Number of active trios.
> +        */
> +       unsigned char           trios;
> +};
> +
> +#endif /* __PHY_MIPI_CPHY_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index c480d6cb4..f12337834 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -19,6 +19,7 @@
>  #include <linux/phy/phy-dp.h>
>  #include <linux/phy/phy-hdmi.h>
>  #include <linux/phy/phy-lvds.h>
> +#include <linux/phy/phy-mipi-cphy.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  #include <linux/phy/phy-thunderbolt.h>
>
> @@ -42,6 +43,7 @@ enum phy_mode {
>         PHY_MODE_PCIE,
>         PHY_MODE_ETHERNET,
>         PHY_MODE_MIPI_DPHY,
> +       PHY_MODE_MIPI_CPHY,
>         PHY_MODE_SATA,
>         PHY_MODE_LVDS,
>         PHY_MODE_DP,
> @@ -69,6 +71,8 @@ union phy_notify {
>   *
>   * @mipi_dphy: Configuration set applicable for phys supporting
>   *             the MIPI_DPHY phy mode.
> + * @mipi_cphy: Configuration set applicable for phys supporting
> + *             the MIPI_CPHY phy mode.
>   * @dp:                Configuration set applicable for phys supporting
>   *             the DisplayPort protocol.
>   * @lvds:      Configuration set applicable for phys supporting
> @@ -78,6 +82,7 @@ union phy_notify {
>   */
>  union phy_configure_opts {
>         struct phy_configure_opts_mipi_dphy     mipi_dphy;
> +       struct phy_configure_opts_mipi_cphy     mipi_cphy;
>         struct phy_configure_opts_dp            dp;
>         struct phy_configure_opts_lvds          lvds;
>         struct phy_configure_opts_hdmi          hdmi;
>
> --
> 2.53.0
>
>

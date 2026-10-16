Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162442589D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142704; cv=pass; b=U8elBFrgEC+Azzt3nFf70bQCTHT58XmB7PbyiKvRMJBBhDiIOJqVLJiykSRd3i5UaZdxm6Qze5OputEzj4F3hkYpICJP0YvE4c6RgK2qC7ZIc3zDO+jyeMwa4twehXfYqy3wmp2X/UTwMX5ZHicUZshMAkobLHD5nrgkZY3wYXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142704; c=relaxed/simple;
	bh=cZ0g1QHy33tqktTNojuGxJHnpB/JfMGacXKXYC6XWjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnhAqUKGjs8yA8IXjh99BkIFZ4LsljbYcZdO2QxmlHkcRqcMENiuRcnzhXJ0szFjAhb7XqAshUpjxJOcUckI9Q/OS8J9rldVGR7bOQkCp6qMzpTATJbzM7fs/RymWXBrSCqNgDaGW2Kh4RKNXxV/H1pwxGZF/1y+DTdjLUJ/7bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnQoSHIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNBlMVH/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnQoSHIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNBlMVH/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lWxT2815470
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=; b=SnQoSHINw964US21
	OVW2Sy0HL7V50xhigmfopOh401MJBi1vKG3DCffiZ2LD7R6Db35S2kQXo1otQp2o
	9hB5f2WYeY3BxSMEa5TwHY9up79W832vaVyccyROngTWNmrY1XPQkPjSXkXtgcKW
	2+J6nrO0D5uMZocIeA3lKLkW/GPnf17PAZZQMsF4MfTzPsJ8RMeSsZZWmFeO0a7o
	ETjN/PfavaWb6MRs1hurHRgoowXZ1ACZuvbghDvWx4fUjl6+Sui+z4y4xzowuyRy
	oxNqBrZtb9VYRS9NiwtBbhNeiqIyQ7SsYRLLhWzTkJFHFcqqz67rt190vxbfBPzs
	t+QmAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11vum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:25:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so1382608385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142702; cv=none;
        d=google.com; s=arc-20260327;
        b=JaSiQFM8a06VOHsynrswvrPXth+GY44qHOIMP3UIwA5D5UEm46j2grweFyKn6/mHsA
         +bC24osIr6RB4sPgEIgCHRp4F+3bvVAFB9s3a2JF/JqjPJRiDZtkKwDsHEvuUImyrAJE
         MEaXwVEuyfJJYVar1o8+lw/25RwdVZnnJJULPs2J6wNiD8X0R/w9tnJOd+qSExk5Iglo
         RNZ5yp9LLCJjzgkAX7ZSFlhsIY5NxZ8KZSVSgtc4+O2cVtJLo7ohd2v/JltBh7U/bFu3
         g1ISAdWXVowvGpiC+YH4DtxC5fY+kBjtE2TiLU3Vd89cRz5V4AmY0kYyjbwsWy0P8hNv
         egVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=;
        fh=raiy0Cf1S2xksQSs+q49aCq15J3QjuthcYiBljSf0Z8=;
        b=K/IkuRP5UL8LsnFuo9vchIgUo/XKL4ePS6ilY3zBep7OCdfoxjC5aaW/GA4nyBEutN
         EwlZPrrW7zNQfBZRGhYCHhxCFYE894sw5izmzdaclWrc1CGDveKl1nmf7938KsCAlwaW
         uuXJHKIcFE4iC9N9PaRPw3gcFfLns0e8avLJxEW+vFdlvsfXjgFgcjKxuRNpzG/LZkci
         CbgBdpsHZ6+3LXyU4CALrqLB/ix5z2bYvZYvfZ4Gdk0AhhIHaauoqsFL1H32YKn8Loxy
         Qq/rTFKzJ9IChzLEEUUmSuyWSUUMSyOCxpMtxYKzJYQq0Y7TO+CAhXfGum7zdCeCNcU9
         Vdtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142702; x=1792747502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=;
        b=bNBlMVH/J4wpVGjBxTxTPdzZkxsNXB0tSRDyRK3+85VSkWCPGnMQtZ2Ajos+bop6WC
         FFZ9zNozUzRhWHB8QmfgWFsh+76uLnDshjvkMEwCN6oIFSvOyL/7XC7/v1b+wJunUp9P
         1LwxXr8jCwCKxA/IFI9s0fnn432HkHGYJJ5B/F1/YdvlqyHVBAtvaodUFbIczpvkA2gU
         tgh079k6P8h7Wog7XoAy6wwUOmhgA5XcZ98w2VGJh4KAy9wMeWyDmn13ZiUZEZtaMWV3
         q3POlaLx+of75IaH8A87LdjM8RIeewSHoB621Vm9TD5+37EsGoSQWp7WSDNu5eJIg5Dy
         tqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142702; x=1792747502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=;
        b=jYLfy4d+Rh5ZPdUEBfn9ZSWWvZa9fbWZnGW+OkAvS8jA03aZd2r7I9Oj8wD12/dcKi
         2KVwTC3NtBxZmZnS8nEMl9hUXGyGRbP2KHafN/7aoWko/ubVAkygCS/WqFcRQI6wQlWQ
         NvJBtNyq5Dp60k+NkXc03zTEYN4yFwMWUXMU2yj7kKJRFTQV3L7hW8010Rdu5RXr7TgO
         jHa9L3NiEV5xhekZH/TRg529twh+1gcbuZmvhhvgXRLklLwZwWLUBhKRd6ksBoqO2wqR
         4R5peVVtMDQKKPXdszUW8C9TdTRJMmTJt3nitcXnxka9Dmm5AuIdA1W1ob3sJmBtF5e9
         SWCA==
X-Forwarded-Encrypted: i=1; AKwUvBwoV9arfqMa4U2nhxSQ7rurMRQWA0FULDEo3JCx4lstVIxVMrZLiSTAFDNtyV9rnyGDd5S37cfEUmu0m4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEk0O/WnoE9YtlhnxwQd0ODGAAddM1iAOwDKHsp6vgmSfRXSnF
	1frKoT8U+X7WgIB7R7azoekhJwS/+n7WCgzcVPmBhuM6WmufpiSof6+Paw1vby0NxDdHlCEwQHx
	XH3qPm9FThiSkASpUwFR11Vm43xrJP5XpEEhu+rq0WH/Fic8UFm8VC0lx4rIZIx/9au1o6p6dnq
	dcaZrDYj+Y4RwwRFIXbD9ajO4S3CSqFcOoPtNLWgndIw==
X-Gm-Gg: AYBFou084LBL66hkXhZWkIH8z83Re3vvP5ANhngDVHfQqEUfHFWqBk1lQDwfNfnXJNE
	tyv5zcdh+6QwcafMKPNhlpf6M+GIIK5c1mG990/It/b9tlU2jZoAbSrpG8taIIer1dodSgZKnas
	xeYi6iQg8BoqZ7KjYkBHaE2VPGTSolx28BrSvzjaIyTMdpBUxHNTCJc8kZeYdKXZa0ADjTEs3y2
	gDwc995GK8fw2mEo6u46uihV4Pj6KjJVgrUTUqgQVAfZlFdc0ez7X/oVJR5+6+dtfkPp5vozpVk
X-Received: by 2002:a05:620a:27cb:b0:93e:dcb4:c73e with SMTP id af79cd13be357-93edcb4cd6emr2647967485a.5.1792142701869;
        Fri, 16 Oct 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:27cb:b0:93e:dcb4:c73e with SMTP id
 af79cd13be357-93edcb4cd6emr2647964685a.5.1792142701369; Fri, 16 Oct 2026
 02:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:24:49 +0200
X-Gm-Features: AclHuK8qYB9tixXQ7z206A9ZSBusHJPBuW_pxlm9dxF7pbKhpd-u_hOovixXQ8E
Message-ID: <CAFEp6-3N1gBZzQ7peHZ5gPt58dv_Xb4SVwoacQuij_Of1ObE+w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] phy: Add MIPI C-PHY mode and configuration options
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: c_XNcb439A2MENK54pGtfT3YF6mrcDcE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX1LDwsbpko8sl
 zrnpiIaKQzcrTQL0qCCzrr1dpZ00NxM6H9c8BxhENSXqHhI0UdhLzwxzEL3lTAlMSMGZ3HrHg+7
 6dMjZEcnYWxBnaOwgvbrux4FdJkSyKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX1tL9h1CQC5gE
 jGH2+kCw4UX9kKB/Elg8XGKzU9ymA1glrngcfHlp3xfIPXZpolxKT1xEwqos5Rq/1w87eYHavDY
 ZRz4i3yLu5aiIk+Psgo2rdkmz2cBNBtzEZnEyMnpZpF56YO1g5GgpNP2asOyaoD2SMJATZCzdVE
 nZSr57XCWj3Onj7ZKXsbTgRMCFKX3kz0PxBIyTmKNwIOlBgPV1/K4lFSgH+fGNUfxqE95Uja2lF
 3Y8WRucbFcjR0Qd5ZoGWwlUSqEa7XfXFqK3qbHRK/sP48KWmMufWazMdGGUn7mjQxNvrr/yYyB6
 V9wsROyxSRTSMTtjaWoPepUH8lDr8tJ+wr5328RlRviFiNN6dMkYGUbqJ+2ew7SmpqMu01KvN3K
 n3JYshW6nttH7upjuvSf2GxA/GL6FceLgdHdm0hhImAfHHYhlRDLg6hepGF6clNdaHiJadiStdR
 6pokpzA2makY+57/3lA==
X-Proofpoint-GUID: c_XNcb439A2MENK54pGtfT3YF6mrcDcE
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1ed6f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=veGBgP7MCKqIqI38Ms8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160037

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
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
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>  include/linux/phy/phy-mipi-cphy.h | 27 +++++++++++++++++++++++++++
>  include/linux/phy/phy.h           |  5 +++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mi=
pi-cphy.h
> new file mode 100644
> index 000000000..e3f0a8257
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
> +       unsigned long           symbol_rate;
> +
> +       /**
> +        * @lanes:
> +        *
> +        * Number of active trios.
> +        */
> +       unsigned char           lanes;

So, wouldn't 'trios' be a more accurate and specific name for this variable=
?

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

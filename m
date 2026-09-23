Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F5271456
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165728; cv=pass; b=bI+/MNO1VM6psT+WSp9jG0CltayI9sGI00Y7P8oXwN1mfrQ5lcgFhqQD2qGHPNlt9BnbuPlHLMMG2J8XeELoWpc0+J6SFfzdZYsPkVv32VdepeeDUeBHURFKOoxImKcm/th15vKQK2/K1mlQvThD/yRloa0axM2SjC9dmjH4bfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165728; c=relaxed/simple;
	bh=d9LZcickXFLWLLIsYy2cdluHvFFTFr7ZSmT4GmRoZnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gb+d1PgNouDuvAPQ+GXOgQiiCni8mvAtBBB4fKWDu1UXXjsOFoWMAAsoL1n4TqENb37Et9s4M9pFQlFZf8cytlrxBf1PrqQcYsChTejsrNJowjeY/8mZG3HR9YxcmkV2nNEWV4zhlnC66hEedNKlw2WAEVHBCYKrPA2z3oE+cf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maPiW759; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1edauYG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maPiW759";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1edauYG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTpV2466529
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=; b=maPiW759OLPqwFnm
	rgKFC2fZdUAWP+Ph+dcaVvKLIbdMUF6nH6PNJ12PrxUR5gGzTjBKq961SGsumfcV
	3vc8ep4kZG/Nd/5KfofJhZ4iXDaySDasw++0GxYZdW8FQAvyBuFw2wCo+i66h+tV
	dS58l1OfoZf0JaHQC/sorWCffZIRVrdYLZmLhqyT9V/Ql1XzLnyXYWrlIE0Eh+Wb
	8aB07/9Yk6UPT5TXlpbg5If3AgP6Wr2w77KzF89c06/fXDrgMAyhxBLR+vH/WwhE
	rYQPcLW7m3SibC6vAuYm8nMIjQxetSio/sr4MDE4VH9WR3lvUzudeaAJuYDaSAts
	UwcLyg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3x46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso10021765ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165722; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/RJpmsy8Ca1rPrGu3VmgToSImNRNQpW5ugXKiekT8QQzpGIT9oozhS694R7xh/otj
         IdhjYZti11pwBVLdI1LY7bc8v7sduNffDU+BhlvMRB9qwDqZhG1VMSt0KNhiOQsFnJgq
         f3s5IhVFGuf6Kp3tmLiKJnfpQ05uWlsljMiAg7hDTkF1DF2YdJk+kyf99YEJzbxPa0RZ
         5yVA76AW2F50NG8DHrlqd8VyceQGVQ6vUfCMN6rrj4yAqviJf8iGuDoOo0s/F82Zge3p
         z7VL9/V5d6kLYjet8wD/xJ2BAfXWfSIz/mh7yWhd+b1R2sMI0WwikUpHjjY8bP+HwEeL
         EW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        fh=+voVExGqnyNwuUV972nBR5AzcuAVlQie9HcAG/t+1x0=;
        b=GMxiI7QPAbYnph5tq/vCmuMrD6v4AKvQQ+TD/CC5+ellc175NYYvOVESZx4EFQEoLO
         PZOLHkcbVP9xQ3XH3kLM0coVa3iQZscjmh7UMJcKlVlc/7gO3KI66XsXh6YmD7E7+NkF
         rRLOf/BCk+kX4T6FaiLLuEpP/CLN8duQQ3q5gRXvRO0rjUsIyLSEiEt6z7zzEmWalFVT
         RdRXwll+VW9jmwOswxkA1RLKH5Uu1yry4w9KziA5HB8dkkqRiI9ODPKv6yxAINU+g3J+
         iMOcEavwfv11QFWTLMWX9lufEfiRW3oAGrcCNRIOu8/2IQfEJ8FHdQ09CnFju+qgtp2S
         CS5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165722; x=1790770522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        b=A1edauYGdFWARak1hd9xHkul6+ETbDfW//ulMrE8fCpo5vorgV4VXUBgx+Ygk/QSyY
         mnRQnzIcOiGkyhZur47aW1SynUnUfpKNLFMUlqBIW/UNm/C+40hsvBh4GFA0DadOy833
         Ka5PW+NKHn7sMbVU0KT9EmAcciCXo5SpCHIKEbf86dPK/UjBRZDeDgv84IiUnx4PgQgM
         8hhDCMCU1BCOT7b5HDX2EoEXys05rSzWLRgvw4PzT7k94L57O5WXpu81Ir3+8TyUHP29
         H1eBaXEuMfIkRHH/iIubFPJmxRzo7Y0nT6os73lZKCjNnSgZvm9ApU3iKp+RFmI0keA3
         8cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165722; x=1790770522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        b=GVuZuU7smEMUuMKwZte3JGDQX8F+lr9bmNlGlHbbHOQisFYdpl7kI0asaJpatWJrkF
         QJnO3elCdkcn4cGpqOzuORPC5FMrQLp5pRyFxXB7cuIP99rGyeuWnWTUqM1vGP7Os9G2
         gspfzgzx5FKaZeiT64DylCpWsUrfKlMrMwLUkpSHYR/hGE0yY5zxiWJrgDC11mil3WSo
         AiCLSkcN+U6qRt0GN0Ul5LJF9jguCbPfL2ctG6ZzpAv5RJjuIJYl8BUsLVD34RD/g1q0
         GrMp2g8+2QoXfE0Xksa71fYs+XxBp500X+lRTZTxGW6BXa/NjaiLZML8//sCXjBWA288
         8Tdg==
X-Forwarded-Encrypted: i=1; AKwUvBwHt0LNhswFHHwTUQvUYNKGifRcPq05EjrNK0WK9OTUOXhVEhqC+hhXLFkHGjuR6qZmvTRG8RE9w5BE8oU=@vger.kernel.org
X-Gm-Message-State: AFuF++n0kQnIl4UcbjBjRCbgQSMTLA39pTqazWYJRF3fcfXffmKKd1rK
	lkDBk7WheOC5Ja5vmEztU1y2mAsOXi6Ar/q7dROpiYgonTVtMAiup55TxeKD96hBss0LJQWeI3B
	2/NZUxJbX81McffJyTkfSY1DVJe4ahGuh164SMzRCHqQKKr6pTtxPSdZrvpdRTRelNwedISV3WG
	nLCrwgKyYjuByHxwjt4jmvg6O2QE/GeAzfdO5IXfvLtw==
X-Gm-Gg: AYBFou1v6zYhowPsKecZaWNKxwLsmHACKht4qY11G5WqTnJncy1RNInIBVP1ezocWBY
	lV5w7n2fCaomHOJMMrvEuHZkgBIqWZJNE+vfnhrnGXo3RamK9p5KCl59FTJkP1zQfTn/Ma9Zw/i
	/B3UM/n6br7IBifvgZ9j4G4P62Mx8aFaL1Zdw98bm7BkJdpukSLqLTuUeUaibGklEF1DF4
X-Received: by 2002:a17:902:d592:b0:2dd:c0ff:e728 with SMTP id d9443c01a7336-2df69de4665mr19057465ad.58.1790165722092;
        Wed, 23 Sep 2026 05:15:22 -0700 (PDT)
X-Received: by 2002:a17:902:d592:b0:2dd:c0ff:e728 with SMTP id
 d9443c01a7336-2df69de4665mr19055275ad.58.1790165716824; Wed, 23 Sep 2026
 05:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
In-Reply-To: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:15:04 +0200
X-Gm-Features: AcwNN1UBYWIvEZGdzMW9jD4AZ2JktIkSu9xe9i_PSGoqpxzPUfaA-MSKhDFG4Xg
Message-ID: <CAPx+jO_kZp5tRknB6xB5v3Prv=xLU0x=H8VBy9uTdarGHmxgoQ@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx8m-blk-ctrl: Serialize power on/off
 across sibling domains
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhou Peng <eagle.zhou@nxp.com>, Xiahong Bao <xiahong.bao@nxp.com>,
        Ming Zhou <ming.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GkrK64cLvYyKiQTpJpohtYqfSTCPbv1q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX/zbzH5fkMNb6
 IyCFCBogS1ZnoCjHHKWS2YxBuFXOH35jWGLTrEnhVXk5likoGuSZ2BQbox7vRCQ3A2Z/q8E3/IB
 35YHdjCInfg/DWlfx2oegF6qXPiec3c=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c2db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=L-I4Vr5n3LcoRG0ZONIA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: GkrK64cLvYyKiQTpJpohtYqfSTCPbv1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX9N0CSozwZzC1
 6/rjRUIvGGOJZ12LVbkNh6q/SviZo1HcyxViKOOY2aARdUfrDDdn+L4IVE8wcgTnZ4q3yOgufdY
 oYdpwm4RQ/8AAgKToXVB1DMhczLkg0Lf6/E2ZeKCe6aKzioXd5PkWxtqgisHjyOQd2fe6qzNAt3
 uKtofPUiUuMD5W1SFEhnULoYt4b8g5fCjQAZhp7xETEl/COPxHCSah3kkyniY6R8qYD38vT7Fkr
 wZ9gDxtBngZpG7f9raEeKfjLK3kaaFOOxgybv9o8U2HB/O5X8vyxWVYukjHTVIN+0Wb5AxDpQoH
 Rtk0TEgN/4wSha8d768gcYSAyP7EebV7nqDDBe+V+F6sLXhC9Y06Scd44fi1+JREPbYMbT6aL6G
 QP81K62QWfvPdFFEiC0nQJfIjOJG9N4Wpsv+DqqM6jXeDZVFy+KjLXNGZNCsAJOrKUpYU1NtbbS
 q+Qp3W15aeW6lY3Ip3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Mon, Sep 21, 2026 at 12:03=E2=80=AFPM Ming Qian <ming.qian@oss.nxp.com> =
wrote:
>
> On i.MX8MP the VPU blk-ctrl exposes G1, G2 and VC8000E as three separate
> genpds, each serialized only by its own genpd lock, so their power_on and
> power_off callbacks can run concurrently on SMP.
>
> The sequences are not independent: they share the VPUMIX bus domain, the
> VPU_NOC and the ADB400 handshake. On power up the GPC cannot ack-verify
> the ADB400 handshake - the ack only completes once blk-ctrl sets the bus
> clk-en bit - so it just waits a fixed delay instead of polling hskack. A
> sibling transition landing inside another domain's reset window disturbs
> that shared clock and handshake timing, the victim's reset does not take
> effect, and its block registers read back all zeros: the decoder times
> out or the encoder fails its format check.
>
> Serialize the blk-ctrl reset sequence with a per-blk-ctrl mutex; the
> driver deliberately avoids a genpd hierarchy, so the genpd core gives no
> cross-sibling serialization.

I recall I had a closer look at the code and the DTSes, trying to
understand why we need to avoid using a hierarchical power-domain
layout, while in fact there is one.

>
> Fixes: a1a5f15f7f6c ("soc: imx: imx8m-blk-ctrl: add i.MX8MP VPU blk ctrl"=
)
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

As the fix is simple this time, I have applied it for fixes and added
a stable tag, thanks!

Long term wise, I am wondering if we should try to move to a proper
genpd parent/child domain configuration instead.

Kind regards
Uffe


> ---
> Problem:
> On i.MX8MP, running the VC8000E encoder and the G1/G2 decoders
> concurrently rarely and non-deterministically leaves a VPU stuck in
> reset: its block registers read back all zeros. A decoder then times out
> or the encoder fails its format check.
>
> Root cause:
> The VPU blk-ctrl exposes G1, G2 and VC8000E as three separate genpds,
> serialized only by the per-genpd lock, so on SMP their power_on/power_off
> callbacks can run concurrently. The sequences share the VPUMIX bus
> domain, the VPU_NOC and the ADB400 handshake. On power up the GPC does
> not ack-verify the ADB400 handshake - the ack only completes once
> blk-ctrl sets the bus clk-en bit - so it just waits a fixed delay. A
> sibling transition landing inside another domain's reset window disturbs
> that shared clock and handshake timing, the victim's reset fails to take
> effect, and its block is left in reset with registers reading zero.
>
> Fix:
> Serialize the blk-ctrl reset sequence with a per-blk-ctrl mutex, so a
> sibling domain cannot run its sequence while another is inside its reset
> window. The driver deliberately avoids a genpd hierarchy, so the genpd
> core provides no cross-sibling serialization.
>
> Test:
> i.MX8MP, Android 6.18 kernel, concurrent H.264 decode and encode. Without
> this patch the failure reproduces within one to two hours. With it the
> same test ran overnight, over 14 hours, without a single occurrence.
> ---
> Changes in v3:
> - Go back to guard(mutex) in power_on()/power_off(): the goto chain only
>   jumps forward to do tear-down work, so it does not break scope-based
>   cleanup (Frank Li).
> - Link to v2: https://patch.msgid.link/20260917-imx8mp-blk-ctrl-v2-1-81d2=
9e907a5d@oss.nxp.com
>
> Changes in v2:
> - Replace guard(mutex) with explicit mutex_lock()/mutex_unlock():
>   power_on() already unwinds errors with goto, and cleanup.h asks not to
>   mix goto and scope-based cleanup in one function (sashiko-bot).
> - Shorten the commit message to the essentials and move the detailed
>   hardware analysis into this cover letter (Frank Li).
> - Link to v1: https://patch.msgid.link/20260915-imx8mp-blk-ctrl-v1-1-b3b4=
e6e7e676@oss.nxp.com
>
> To: Ulf Hansson <ulfh@kernel.org>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-pm@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 479789009c7f..f8105e87ea3c 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -15,6 +15,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/clk.h>
> +#include <linux/mutex.h>
>
>  #include <dt-bindings/power/imx8mm-power.h>
>  #include <dt-bindings/power/imx8mn-power.h>
> @@ -34,6 +35,12 @@ struct imx8m_blk_ctrl {
>         struct regmap *regmap;
>         struct imx8m_blk_ctrl_domain *domains;
>         struct genpd_onecell_data onecell_data;
> +       /*
> +        * Serializes the blk-ctrl reset/clock sequence across sibling do=
mains;
> +        * their transitions interact through the shared VPUMIX bus domai=
n,
> +        * VPU_NOC and the not-ack-verified ADB400 handshake (ERR050531).
> +        */
> +       struct mutex power_lock;
>  };
>
>  struct imx8m_blk_ctrl_domain_data {
> @@ -98,6 +105,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_d=
omain *genpd)
>         struct imx8m_blk_ctrl *bc =3D domain->bc;
>         int ret;
>
> +       guard(mutex)(&bc->power_lock);
> +
>         /* make sure bus domain is awake */
>         ret =3D pm_runtime_get_sync(bc->bus_power_dev);
>         if (ret < 0) {
> @@ -164,6 +173,8 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm=
_domain *genpd)
>         const struct imx8m_blk_ctrl_domain_data *data =3D domain->data;
>         struct imx8m_blk_ctrl *bc =3D domain->bc;
>
> +       guard(mutex)(&bc->power_lock);
> +
>         /* put devices into reset and disable clocks */
>         if (data->mipi_phy_rst_mask)
>                 regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->m=
ipi_phy_rst_mask);
> @@ -202,6 +213,10 @@ static int imx8m_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>
>         bc->dev =3D dev;
>
> +       ret =3D devm_mutex_init(dev, &bc->power_lock);
> +       if (ret)
> +               return ret;
> +
>         bc_data =3D of_device_get_match_data(dev);
>
>         base =3D devm_platform_ioremap_resource(pdev, 0);
>
> ---
> base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> change-id: 20260911-imx8mp-blk-ctrl-c46f26783073
>

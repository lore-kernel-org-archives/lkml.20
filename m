Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B945C6E5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581503; cv=pass; b=Oiju0HMAlEFzHHAYzZ3ZtRBLO936l4m/gN/pQrPtszjyBkLpls9OIDHzodZnE8svvudUBtGMqbWyh7FBTiXlGJae3rsFQ0V92klos7+hbFyJXxX1N6BSvfLna4SbaNbJSKBDOSBKHqiqywsK7QyZKcwXAoVkTSIxa33cpOUx3Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581503; c=relaxed/simple;
	bh=z3ybSAR1RjROS95ZfYl1NwdkXJlLsMqx88ERYy2/t7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enStACQ0qRKFsEubAUqnEiNRvowttje/NJTbKhEKkEdHNNCV1DfpmpbJOuuqY2J1pYhgXnUylNpQTXC/39LXnhiZATYv249nDph8MCSU+oNDjsgBNY8LHrLUX5RGVTzC1pzcQ8w/jC/3YT5ys5qXYvNXj8yyH8e/kyj9kMzgscM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5BHuuqh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7T6MKLq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5BHuuqh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7T6MKLq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1BFmR3455989
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=; b=b5BHuuqhcM20EM2n
	ku7gDdVRDCAb+tfFj5VxCvzQy2VU5wkqPcGwZvycuHLvx1LTnQusCtvIGzPPCAdb
	3OhVyiWfpEeyE239gtCV1VLFwJsw0Tj63L0cb7XRj71c/sVPHm3sLLBr/LdyOJmm
	4JOK9u+oXcqLpRrdOFldpF0GJdxo5UiypTDq2ddDLk/koT/KLn9BAfDND18ivLzl
	GaIE5KHfQ1FtmaVGIhJ5uLyaf3lDG7+894VYlKUwfWOf6D7THxUQW+MBvmkBZL/C
	PsdtdUOwrxU7Ea81oBq+J+x+7PrS9gWOwZcRqMQ9ApF9nuPpFt93JZGTimOkj+eZ
	4Guqlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq12pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:45:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c6a0d2122so231557185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790581500; cv=none;
        d=google.com; s=arc-20260327;
        b=HtIb3eZV2xolNv9JgdUsvDNH9c/He9GbHohYU14dDbP2z+4LgxiKGV4izzVPlCNiCt
         g3g2K90RoztjuQzr6fIXvcU2BiBzxb+Nagp9kBUD9HHr/mLCeLjnDO7uLADMBTGJYH4D
         k10Ss17pR3xTJQCTXftkozjPu/sTTrzQKLlHMYVcyJCRfF1I3xSGsj5ZjQU5t/h2GWsb
         I0EUiNOOQFP/ST/dHiABXJ4I0D8bryWvJTJCVWOm7sVZ38ITZasxvS8dXfzfB4PrfVmP
         0OYki6CY8We+eCCCcPbg0Ss7kqq8/aaKwds7hLjN16LPBf1gn9O3LUKUbHx5ABHH6Rtp
         31Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=;
        fh=IeA2LpYd+egEly6ivn8cDaPFTX93PyoY5VPjqogNXlo=;
        b=beoO4QCZ9eHXVuuinQVMxtqUE2bAMqw/F0aMNbzy2fAQ4+UA27w8HNBBMTcGr0uvP9
         cTagKiiHTnR75GD8cZBC4aTN9nbvVlRlG5bgmawJ5Jaq9t6d9Q5MRX8gNYXXWuGop3pe
         cid+e+jEhDCYAADHDnKJLr4Y4s15nFv2zlTikgVDWhUaYsOW1h9D+IYLlEk33S0Dj3fk
         ICjnNeacESrItwVEuDk4UYBbvT1wM1dVW0hD5gwPfj137d+XjUX8wWfQgE08kAJzLXYn
         Is4WaIQJXwqGGavKAaf0fRArPws4KHLwIaDcpA0qwHyVFs5pYv/M/O4GNkuuhwg2jqOE
         Ebsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790581500; x=1791186300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=;
        b=a7T6MKLqHzBkSBybRG9NgpOx30qrjRH/fxn0br0r01c86wmWbWXxvaHTXj6joLaIZp
         oUUEsPAStMdQl8C1iK/RLCGca2kE3bxA61qE3Ko+kgfhcgbxysRqfyR04Vnc0ne/q7W5
         eHocHzvDA8EhWbjP1NdL1umJeWcOSi9jOj512iDSGhI0LFML4XwhX4WfaipCPrRbSnK7
         39T+fo9CnmZTq09e2JaY5zb/cO6V/tLfRTMj2Afk7x6vFRaDJVa9mI10riMzOuPIHCvH
         ir0AOpwyILJvyPND4UkYNmVds8rQTSCvLwdxq1Rl6BvRPpp3HTNQQ6F7vzlgUYLFgJBz
         zbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581500; x=1791186300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pQDLIqnV6XgFwKsN9XBt/C95TIkcGyXx3vKiWOmjWU=;
        b=vgPfRdQXoiLQwUxUT2ZJF6eKf3S89Lv88rSVnF55iYj15xYGVak+mJdlwL/0Tb4vsW
         E2aPPH3y5wbazpI68xNwIHXBsrsYq3WkAXrbUUHOkULSo1PPf2nkruwh9sl/aPhRXZjO
         mjdFh1RSD7x8YHuH1m3HCT3CmGPGkopUq9JT2EpH+U+5UGA0MM3Np/y7lzYHQo5cTNem
         3mjVSt15yirxkGFxQXYr2y0Qk5HVz0ueykXUDSra5QS+4trhZriTplxwB/72THkinZNE
         Mlhun0rRsgg4yd1BYNLUBG6JveeZAMSaHvIelsmtkLPiZuP0My0G2kjlNXeqRayZ8DvU
         xGXw==
X-Forwarded-Encrypted: i=1; AKwUvBzKZUbICPpS/kRtyeZt0iF2jC+4U2fWliV0GYKQPt/yY6ia6VurggO72kHxZiGB2n0CFqcXHkTu1wCKXkg=@vger.kernel.org
X-Gm-Message-State: AFuF++mg+1rGPL6qgQKtrvpRJTDnuAK251mtMYX5eAzq7c8wRl9EZxdH
	1S7E0nWKOTf7+aKliPhOECjYxVIz5uDpCpLCDD+PUrWadqCdRIkiZKutlwNVDHkIK+bpXIsenKa
	pmSOgWMU15Bdk5CcDg1bjc1nAyxpupvhqUNQHMsYJHpYLuU6V2VHhYWgGebvgXgKtQl5GtbrfSc
	vn4vVxKEY56Z2PBHYD67uFtSjR6zrE8yUaZ7Nj+vRbCA==
X-Gm-Gg: AYBFou3/HmgbhL2sIDR9mOQKy9I1kZi7FKDIk3qE/gRN+BJBeNTcVlY7l/P/goppstN
	g8/FLVPQ/WFtNjZCXF1+mGJhYRIMOUrtVba3h7QKKmW29jOe/EW/fySc6Zi9myUZ+MC1lOadiWY
	wAM3GJ/F677/YfZn6tbGRzCsAElhY5e5s5esUlLCVTTxuJ+ymy+wiGwptgubY5nFtlhxDj0kc2G
	J/2DwtW1/dsY04NZF3J3JTG3OZfPr9aWbi4p9Vejtz8KwF9RM4rZ6RbLq68q471j+jL5K6PeJw=
X-Received: by 2002:a05:620a:294b:b0:93b:d79e:18ff with SMTP id af79cd13be357-93c43d4ba9bmr1984538285a.66.1790581499986;
        Mon, 28 Sep 2026 00:44:59 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:93b:d79e:18ff with SMTP id
 af79cd13be357-93c43d4ba9bmr1984535485a.66.1790581499390; Mon, 28 Sep 2026
 00:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-2-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-2-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:44:48 +0200
X-Gm-Features: AclHuK9hApuGcqb2TgGBOk9URRTgJaOtK73cfFe5VrQ6E5rTeeTWYHLjrX2X1us
Message-ID: <CAFEp6-1bzpToGqNuEVbJx7A6L150viJ21L+arYRss-3OwKeEmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] media: qcom: camss: vfe-17x: Fix write master
 buffer done being dropped
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 2FHOtJ_9XHhxXEqaujtmyw-1vBCHIqRC
X-Proofpoint-GUID: 2FHOtJ_9XHhxXEqaujtmyw-1vBCHIqRC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMCBTYWx0ZWRfX0bti6xTQND+/
 zJ73hoCZrE4P81nGybv7DVLgnEQ9aDfJ5z2rkkf8BSq87b3E74SFjvMw+PADw5BCGjCLGQUzoDQ
 FqVvq/vsm1mIfPJrcOJ/wgdytxRsfZE=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba1afd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=9UK9mVl4XDNobURrqqEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMCBTYWx0ZWRfX7k6XGFP9COS7
 bCmQBUkboz65EmzRAhTr2y6f5r5xlVMHTJod6FIxWeVrnPh+zYWGtaaDejmMP9nDvSOMlWYlA6b
 1AcItFyOSlwCZoJO3UQmWMF+6b3nCrReYggsoIxJpSz8n5YFbnyClRM7bG/9NaKv0UiGgAt3DIR
 gwmugk/tmLLUm64PvncPXxsu8GdvzPY8BXeB1s/qI7GRPfdGBa5zB69xsUnpjCwPIqXMbEgv6P/
 LRGBfmH8Kr1FRWHQnDxUGKQbwHehpEaCw8VKOZZAdZM8pKgsQVNRiLIlFnHAhU0ZlNo3UED+zMw
 Scb6/N/evR8rv8g6UWAZ9xMG8+lsfVjCXhsHZTVmxKIXNPpAdwJ/Ic/HBdpidkg/NPD1iQ9yFoP
 qFPkTyeAlxWI+VKGbXwZgISrHCvHMolB9no0JpSnDNtcUu5BF2/nfmL3A0umRITNYz0fXtjwexa
 UgDc+B5ZgQvHo8bbkYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280030

On Mon, Sep 28, 2026 at 8:43=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> The VFE 17x interrupt handler reads and clears the bus status
> registers on every interrupt, but only acts on the per write master
> BUF_DONE bits when bit 9 of IRQ_STATUS_0 is set as well. Bit 9 is the
> ping-pong flag of image master 1. It has nothing to do with the other
> write masters, and it is not guaranteed to be set in the same
> interrupt in which a write master reports a completed buffer.
>
> The bus status is read-to-clear. When a buffer done arrives while bit
> 9 is not set, the handler clears the status and never calls
> wm_done() for it. The buffer stays queued in the driver and the video
> node never receives that frame.
>
> With one RDI streaming this is rare. With two RDIs streaming on the
> same VFE, for instance two virtual channels demultiplexed by the CSID,
> the interrupt rate doubles and one of the two lines loses buffer done
> events continuously.
>
> Act on the bus status alone, as the other gen2 VFE handlers do.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index e5ee7e717b..c011f64f63 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -364,9 +364,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>                         vfe->isr_ops.comp_done(vfe, i);
>
>         for (wm =3D 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
> -               if (status0 & BIT(9))
> -                       if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DON=
E(wm))
> -                               vfe->isr_ops.wm_done(vfe, wm);
> +               if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
> +                       vfe->isr_ops.wm_done(vfe, wm);
>
>         return IRQ_HANDLED;
>  }
> --
> 2.43.0
>

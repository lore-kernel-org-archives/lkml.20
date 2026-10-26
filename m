Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025362;
	b=WmuaX+vjmf3YX9/TtQj7bfw2mT8H5geqxwk1rfVjddEG3GOEx4mTDfDFp9elZprSC4Rc
	 YrF+mCCH/VZNTOAHsfxkglpe+16IeCa9kS1oTjXvelwI3keDSkeJruCqlCPM4uSEl2Y7O
	 CSwbkd1wDTS8BU61ixxJQjuc679KUk1UbY88sRnHYITpgEziANFuvQ6pfaogIVwtq3Wn3
	 5eVw6ZRf+z/pr7GKe2/Pfh095s6jYuBQlkv6gDflOKIJRwQeqeyeVN53Ngxpo1n1UECE2
	 D8oi+o56ZvfvPkH6xT0AP6NtCaylhXspI4TAtM00YdPon5KKucK0c4A4fEqgj20UViA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
	b=f6oyf50bQ3/6UqNdMPib4+MHtkm6aJoKvG+qORYPHUEBHhJVQqbcVsRCKT3/ojROiNbF
	 oHAvSwrBj1QVXKRCk2uiPltrh/PWHoiGUzWJjCkah/TQobKFC5SZY/UnoLa4BpIfo0Njl
	 GbhE00LpLIkHswa8K1Noin8JRXPVzHfhkucraYH+8eLQ2SoedHKSxwI4VJuKZVCijQQ70
	 oVI5UWPr0/ucP9XAlC0lplMFx3aODWPsUZF99auoLL8FRhTUJRcemevYCiYeIAIdBG4Ce
	 fhXsjoLbGolgWlYe1hcgTyiuiENGA7tNrgcysy1naag6k/vNfzT5p3Cg6PnfJR6hNxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EHGtbtwJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CkAXmMK/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AFC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1AFC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EHGtbtwJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkAXmMK/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsmDx2168521
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=; b=EHGtbtwJtHX656L0
	VCwtg6AIMWk2kc4VhCpy8BWuEiOX4eTg833nYFQPfNAS0e1Hm32ueIZH3vikGd/S
	W0DQPIwix96napKYa+NEzFqVbi0QvIRnGtHR0vIs1O8X3fDf2tDIsgmTPbruSBiT
	7OCgWwybDzHuZIfN3hNKCX9jp8miV7Wyz8tTAX2FrMp73u109AmcLa6QYtqZR6pz
	7njnIOiAJurQ5/eXVE/LXxqZi+DNqIRXWjfztmTEdhzGVBSbnKh/NZZgQrDDhZoV
	AwwhDjvfRY5+ktep083DpFvUAXFsnYomOZdC/jkAsou5Jq+B9sJ0UPAYcI0d7xSG
	zXRc1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u617vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:36:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso734493685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025360; cv=none;
        d=google.com; s=arc-20260327;
        b=YZrBmZ/Hdozt9rkXbL/5yzH0paJjK625K1k7OtsEJDTUJVgUHGK5VczA494Q7u4n6Q
         SowIOUGu37r/jr5lEchIpyBXAze8FsuXpamdXfVZWu7o8lBUeVGIAVvjniJs66Ln5xx5
         ZJmwLy8iByQmTiIe2gK1olzVL6Su0ZWCCZf1QRRjfeX104dn0Q/rZSfvVYC06rJAB76c
         w3uRfDqv+gTBwJWghmlLkT7zRDNP6JZ28IkRX0xhL5Sy77U8kNS1nKkLyoOedsmmLWIj
         19BatzWok0FZXqOyjCEyaSHm2hwdevQJFOJ9s1x4ZxQpb1QdAzoMSyz+IiI1B9YnuY2B
         Kp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        fh=aHd141ZzGq4x+4Zt1Itth+aWKMdhtTMXVXVk5eAtD58=;
        b=TQ+QXwpCD/NFIixBP+pKitfqdfUnoNNdZPGG+yDreUouipLe0A6f/xqPZlasHkguQp
         oE7t9ssiB3OltCcQl0EukMgCeEMSPCIJGskOG/Y/l0t3/0PqJFmOQjBoZFaNjkQdUh2i
         XljUjYpL2Om4VtjLl3lg9+QFCInxcBVoGgAjpcijYi72Ix0GT8PCU3gByag6BX202DXV
         rPkVdekXtfL6YOwQnFEgc/3t3AjiOk4dunN123JfFdWXynNhe4JnKqE0NfpyPbhndfCD
         0hIA8ed2QwrV0C8fYka4v8SqN3zPVjt9OW0AXowCSR139v4nr+4t7/vrkrCHF/1TnM4m
         /FAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025360; x=1793630160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        b=CkAXmMK/gDoEX2QkKcjbi86v9b25SoBtQ+PnErD6dSQ1iFKJNypYKQa/uU1hgPYmu3
         iFVZ9CgVpzGd6a6+Vh5x+cCJBGnVaNXZc7EmCykRznOMZf4+97zU4jlCplAAos54BDD/
         JmUBN0t7C0VLUqdV+vYdMg2A/2oxdmO4WScc8Vpws3wzUw9+SWPrHou542u6cLKKnOwf
         hwtUd3hFcQKa787D2cEfzmOee7cjxs2BjoFP+eW3SaAq7eQMfCiYtyIHVMn27SCad53/
         hsgRndS30VYXm26qtRO56dGJbL25fXn8CvrlHij5mY+S3XOLhtDQnHAkDdie8Rb7xRqm
         l5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025360; x=1793630160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        b=LEwmsycrKvjn7xMCKCmTyiWc9otKjZAxXneJFIFCxHrESAZt9WX9MyfLcA5hjmKTdw
         JyWv/Q9uYl24VUcn/Ct8PDLViXeUBKzhBZpWapA2ZGsFFaFtOUv0dBs5KQKz1VD0A/th
         Jrwu2QbwnzvRneHUkAjVxm6gNZOr+HWATeJGKo32XOCVjIZIsYZMC7Itfl2Qc2MOq6RN
         QWeERZsQiblnHVeuMBRI8GmAXRGjl0bg4XnNXUg3psDCR3dNeiMp7aDRYTZI5PlegUg1
         CktosXwfoecwOUy31yFfEW8zdAAI9P6iT/EyBmv8UolETGYOjSClH9/JpHFwohzxXQQZ
         xZzw==
X-Forwarded-Encrypted: i=1; AKwUvBy4b6qfyLY0e+7Uic8FcFH8oHSYUNyVC7DLC4e4a9P1UPVJ7mG+SSXQq+NeLuex6w892YGuqm4PUc7gZOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOYKsyKe3sUuCafnNG3rV153M28HpZ8tb34VIAzTJ42KyRpO3k
	x6i+Er0Z0WpVBaExJZAGwv24THGufkk2RJBhFrPpclk+21DuF+byZb96QggKWvbPg1CipP6zVQu
	4wViZ6hM6NglKK2Rkf+d5quC0CEgWnAtnTEir9eLJ2pFLdnMlMNjX7IrTWjdEhO2tmCLVwmoLa2
	pbSH58YLNbCZHrqN+68U6p86x2BWhcJ95Sqtp7px01Xg==
X-Gm-Gg: AYBFou0y6MVg7GaxnZ+wp8dqE2o7D3tM+Tdk+HHhssvZWs/v0WXZdDOe4g0+tEYVUUr
	aMgWpug/m6hdcEgWtzx/lYABb6cBX1wrCeGKv14TdYXeCdMsTqxbccssbF+oiTJ8rLyXJcsCFhg
	v0tj8hJ+/C5Dv825AxcWkfoFWYnM9/l2Oo2EVqa8P4/kkpMy+Yax21AZcjxIqUbQdarlaezZTDu
	7im7A1h5Scw9PvfsnHblnPVHuoP3/YNt2ZWN6WyI4rYc+ScT5Y329EQXEPo+XYyoKp0ELnfB2rt
X-Received: by 2002:a05:620a:40cb:b0:93e:c12c:f11b with SMTP id af79cd13be357-940ef94ce57mr983804085a.71.1793025359791;
        Mon, 26 Oct 2026 07:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:40cb:b0:93e:c12c:f11b with SMTP id
 af79cd13be357-940ef94ce57mr983798485a.71.1793025359283; Mon, 26 Oct 2026
 07:35:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:35:48 +0100
X-Gm-Features: AclHuK-WgnrBpFbnFE8ORrtoTXmqjFg3GlSY6-dUL4UNW227jGN0ErEq6Mww1OE
Message-ID: <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: dVix8p3ofidbQh_M9XJARRPI8nKdTeHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX/wMp8FaCj66e
 d7m2PZ+z2LPtPOMHQ0AOdEL2sKqfE0MWSQBjf/x7QLfSEUJDXkC/3sVJayS5hG/kek2res+ZcsZ
 7+ewrAiO4a964DGX8JwhO4o0aKc5WDjY2QhlVQJg66S1QdFo6ocJKOGW9IVqKcVxjQ7crk7Vi0b
 vfwavFlEf48yw0vCmgo6w6nJGqJdA9gTAd7q7Bnq21aWjL0wNfkUrDmg1T3rZs3qUEV4HG+NHrt
 C4Va3+1VAEG+YGp8G1HByIwIVN68X798OEiaJm36S4tibi7xE75JmAgq+CZiMvaRxvXNIRLHNF8
 TQWwso2m0/OAimGc4ggZ+ZS36NVMqVOI7GvEoVETDvTpvOW7lxcYVRxniJHHeTgbOue+zi+EJrU
 TQTa7qw6eSCN2W51wi4ox/s0UrKIQTE3gCzeSWsPE/jThuQ1M5Fq7IsoPC2DmJ7+1pwJqdUl7Uf
 tj6OCjCU8j7qhvNZ6Cg==
X-Proofpoint-ORIG-GUID: dVix8p3ofidbQh_M9XJARRPI8nKdTeHC
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf6551 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=cFAwxtyTOyGjYM3jHOcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX0QuW6g1nbZDX
 6YusNMbDaggbiyS/AUr8cbzeYVif05V9qA47d9J31kOKcrBrHh6vd3eQ3xvIlOp3s0rdwDU6b/a
 9+aWvDOKJ0vn0NUR2ByCoSdM99x8Iw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260058

On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Clocks of different VFEs can be fed by one clock source, and each VFE
> sets such a source to the rate it needs. A VFE started later at a lower
> rate then lowers the source under a VFE that is still running.
>
> For example, on SM8250 the two VFE Lite share one core clock source,
> which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
> 0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
> on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
> Lite 0.
>
> Request the VFE clock rates as minimums with clk_set_rate_range(), so
> that a shared clock runs at the highest minimum of its running VFEs.
> On power off the VFE drops its minimum and sets the clock to its lowest
> listed rate within the remaining minimums.
>
> Rate ranges are enabled through the vfe_clock_ranges resource flag, so
> far only on SM8250.

Why? I think it would make sense to use it unconditionally.

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 45 +++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss.c     |  1 +
>  drivers/media/platform/qcom/camss/camss.h     |  1 +
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 359b5942df89..30504e614e4b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1016,7 +1016,10 @@ static int vfe_set_clock_rates(struct vfe_device *=
vfe)
>                                 return -EINVAL;
>                         }
>
> -                       ret =3D clk_set_rate(clock->clk, rate);
> +                       if (vfe->camss->res->vfe_clock_ranges)
> +                               ret =3D clk_set_rate_range(clock->clk, cl=
ock->freq[j], ULONG_MAX);
> +                       else
> +                               ret =3D clk_set_rate(clock->clk, rate);
>                         if (ret < 0) {
>                                 dev_err(dev, "clk set rate failed: %d\n",=
 ret);
>                                 return ret;
> @@ -1060,6 +1063,37 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>         return 0;
>  }
>
> +/*
> + * vfe_release_clock_rates - Release the minimum clock rates of VFE modu=
le
> + * @vfe: VFE device
> + *
> + * Drop the minimum rate requested by the VFE from each of its clocks an=
d set
> + * the clock to its lowest level, or to the highest minimum rate still
> + * requested by the other users of the clock.
> + */
> +static void vfe_release_clock_rates(struct vfe_device *vfe)
> +{
> +       int i;
> +
> +       if (!vfe->camss->res->vfe_clock_ranges)
> +               return;
> +
> +       for (i =3D 0; i < vfe->nclocks; i++) {
> +               struct camss_clock *clock =3D &vfe->clock[i];
> +               long rate;
> +
> +               if (!vfe_match_clock_names(vfe, clock) || !vfe_check_cloc=
k_levels(clock))
> +                       continue;
> +
> +               clk_drop_range(clock->clk);
> +
> +               /* Round first, so that the rate respects the other users=
' ranges */
> +               rate =3D clk_round_rate(clock->clk, clock->freq[0]);
> +               if (rate > 0)
> +                       clk_set_rate(clock->clk, rate);
> +       }
> +}
> +
>  /*
>   * vfe_get - Power up and reset VFE module
>   * @vfe: VFE Device
> @@ -1083,12 +1117,12 @@ int vfe_get(struct vfe_device *vfe)
>
>                 ret =3D vfe_set_clock_rates(vfe);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D camss_enable_clocks(vfe->nclocks, vfe->clock,
>                                           vfe->camss->dev);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D vfe_reset(vfe);
>                 if (ret < 0)
> @@ -1113,7 +1147,9 @@ int vfe_get(struct vfe_device *vfe)
>  error_reset:
>         camss_disable_clocks(vfe->nclocks, vfe->clock);
>
> -error_pm_runtime_get:
> +error_release_rates:
> +       vfe_release_clock_rates(vfe);
> +
>         pm_runtime_put_sync(vfe->camss->dev);
>  error_domain_off:
>         vfe->res->hw_ops->pm_domain_off(vfe);
> @@ -1141,6 +1177,7 @@ void vfe_put(struct vfe_device *vfe)
>                         vfe->res->hw_ops->vfe_halt(vfe);
>                 }
>                 camss_disable_clocks(vfe->nclocks, vfe->clock);
> +               vfe_release_clock_rates(vfe);
>                 pm_runtime_put_sync(vfe->camss->dev);
>                 vfe->res->hw_ops->pm_domain_off(vfe);
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7fe12049b78a..80eab898611d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5736,6 +5736,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_8250),
>         .csid_num =3D ARRAY_SIZE(csid_res_8250),
>         .vfe_num =3D ARRAY_SIZE(vfe_res_8250),
> +       .vfe_clock_ranges =3D true,
>  };
>
>  static const struct camss_resources sc8280xp_resources =3D {
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0..bffff5b6bfbe 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -120,6 +120,7 @@ struct camss_resources {
>         const unsigned int tpg_num;
>         const unsigned int csid_num;
>         const unsigned int vfe_num;
> +       const bool vfe_clock_ranges;
>  };
>
>  struct camss {
> --
> 2.34.1
>

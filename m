Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA6511E60
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650728; cv=pass; b=EcJ1A7obRtnpBotA/L9qGJ1oCxG9iosLWCaTjuWaMqj9E/40FcS0COoXbIpR+CxJN7ifQtW3ZsKgTO76Ew4ZjWCblssaV+ETEC+b4IFLXcz3wTH5G5r0N6nppoGwY6TP/ML2r2cmC5w/DIYtXOfNbLRPMI7KyQIKvxKC5bJTpxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650728; c=relaxed/simple;
	bh=KcU0NhCjCM0mTgG0KIsg4O4+gBDvImg9fuTZ2t1JmwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIwp1ns+cAp4b0qKzPZB4yTJgo+NNK4Ho+2u3EHbwInyiJjAQw0AOrMw7G8eLJfhD+KrRKV9F6ucE4TRsyl0B9D0cpKdgPtZecCiOS4ct3b6d18Z5HeNreMezJCw86IAkmNWAxwy4sAZT/9/g62rMUndhnQKgyctu+ie4wOQsKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGe2dJxP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKeReIff; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGe2dJxP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKeReIff"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrAU1863444
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFT0Sm/+O+Qr/46avyREHDePIozflXgT+OQM6AD0D9w=; b=mGe2dJxP1fub/WPy
	LkjkjsAgh31AM75u4LElgySZX8+GcqUQtc69khI06zA24WpuMwPEy5AIbiLbdGNR
	Vh0ujUMvlDI5cJaCfsk0WF+BalNcSzZH+zP9AHDj0gXupUxd76kJtz/b0Im5rjQh
	6d36r+QG3iVlUtDqVaqeuwGu2uYWdrSqDp8G0jzkaEVbO1h25xPVQSqa15lRrxSY
	TkGNgvy+OAid2HSGYfcHH3MdwP62yi74iZMAb44iHWcTLjpxsttqHBB/PQrqATol
	8ZeNnMNEYogGZPKbJJMObrk0jFC8GkN1vGEZu+HZF+Tr5fUHQNqSJmrcsH9EG79A
	vEefXQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6avc1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:12:00 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso1132602b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789650719; cv=none;
        d=google.com; s=arc-20260327;
        b=ET6pgiC1YnlzgdVSv5USqqKoHMGCmFzg40Zfs0llGDtLI3gDxDehKKqU7uQeBcmAfr
         3XU0H/vRenlOThrLvZwayHNOugw8rTRWMhQ1f/u7yb+hcEbOfMacyyJzLtsAF3oO8G/0
         22pZSjaxKpCR2oiF3rjBHUiekjuyW0s0GgfZVUvzcfck7RhLynBiDg0S45whr4B5doX1
         46/8PvNCO43934aBV8vRU7VhSr+6EkRD0SngaBhs8Z77XYjKT8kNezf062IQ2DzJtahm
         Ckvirc6EErMetUVoK1ZVr8cWrrp9Yx4IWzSnHicSQiE7PrCi96xT3lFr5BH9Bcjgpw2H
         6OdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZFT0Sm/+O+Qr/46avyREHDePIozflXgT+OQM6AD0D9w=;
        fh=7UZUpI/8YuJg3HvsYMaojP7nPwZWMBgSTRAX5Gqxxm0=;
        b=IkUDKYgUcgRvq2mlSOa9kXs+Paa8UgOt1OL77Rw/i7G0fVWNNFmKdSfGNVZbtyHlcy
         Tu6C8XU25DjnHxXevPyrIFE6LWb9ZRbo9rvrSyZkStKeUvyMOijU60fztDrm1YV0CZir
         HxvgWfTdXqHrzmJBGPxSWT96wnGWckU+XIhH+xWAjCvPBuA6SUpa9cfX9Fy90aR3nPiC
         6nWWp2tTrmI9oGnXBwAbD7VMu7cKAjSBZXs8ex/hfIsUZ9YzeTROB8LktriSvTp5rgAo
         T2OrslhUO+RhavXrzmC+uofj3arzZNgOWBzUsiZkKWW5QJ3RGIqQEbVb+INoFJ+hlAiA
         javA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650719; x=1790255519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFT0Sm/+O+Qr/46avyREHDePIozflXgT+OQM6AD0D9w=;
        b=VKeReIffWG4Qt1Hx7zwn+Laxx5flc2s8LeEDKlhtmG74nq6+45dOapVWyPsgPTofBZ
         eA6jJjA01aemdSsvKPK3QEKBAcq9NRXHBjjoRjGThp+IXiuq44JnDdCWbZe57Arbl1S6
         KKCpImb8ERrMsWPe9oAzDl1TEjkVX9/2C7EAqDWphhVZOMn7AHKOVATiZwunUQTKIJ43
         EjXOQLBOqWjNi+loLSfHUVRlkHxj/Rps5+ALEIUzEp51X/ki20+kv3HV/TDBxczDR1+Y
         ovv7Ue9Eoso49DeQV5v5pwxAd4RUulk62wqj71454FUFgJ8cHH6/mhfvxO/182aeW4b+
         kRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650719; x=1790255519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFT0Sm/+O+Qr/46avyREHDePIozflXgT+OQM6AD0D9w=;
        b=G1dKLqzihe9Y0Lp0DxLD0CRJivJVSv1Se/lyYrjf8erFznQMECrCtQ6A8P3JL0IxFL
         HnpjgfTtP2PHgsz8ktorCLUXrs/6loH9CKo2A2t31UmAoJ4ovYn+ioiAX2X78cC7glgM
         c8I22tU6X5dhUbOiIjlVfSpV8nQ5Mu82lzQWRSecUlrSjLxu0jZd0ksh9+C65BiHC/s3
         3MTAT2qgVdig5XTvbdAkJ+8/Gt6QQqrkxWKwyzmkbtgW+FVCFapNoL7aAR9P4bm8drG5
         wsfoKyy5rxIuE/6GTByN2+vn2izLt0Z10NtNmUmJ5/WVuWoOP5ktAoue1rfOd/3DAM75
         K27A==
X-Forwarded-Encrypted: i=1; AKwUvBwXeR+i9q1O28eyvKNxPSF05ql+9H7z9oBySRPbRmHDouVGZLb0AhzV+vuDdGtt7820tMx/ESVMTgzJpGo=@vger.kernel.org
X-Gm-Message-State: AFuF++kiH7EaLp3y6FjlhQMnzNSMyyZtOF5/9Oy7/GT71FXHyhVrSo1a
	XCoSJ+2XRDQxFVU3Q5BfK6eiXMK/a0xQziwfYlL48yIY+oULtYiLVR0n53hfShuOtHIqZDiVfkT
	auSNuQ4m36N3XbjNgCcuUBr1EOfAWeemy60ou1VSt0afj3+sUOTa31ua7cwhuq32wi3GXwU8ZvS
	gQBHKbIwv8chgF7UDivpucW544ll7s8A/qyj6dSbiYJg==
X-Gm-Gg: AYBFou1lHkAU4UYwS0QtGHvHkBmiaoYrZ0VyW9nVGslnVORcMCR5up21Dazmb67+IS9
	l4CWFfwPwEY00AXH2Uk8TUllh/aHucSsF3JyDWpz50pfbv9MgfKfBnilCQgEaCaB/EplQkdDb6m
	ThUaUMQAeReM6F6Suv/DugJcle5I+7nrDq1zJVqybnqeD+vPEUAv3tisPc7o+Pp5Zela/z75Sgc
	FJy2rJmf6e/YpRXFaPgOD+TfYsftIYzytvVe+/htyh73C9o5OYsKo+wZrZijKUDw/NqqqN53Q==
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79a with SMTP id 5614622812f47-4cbf21ce30cmr1379131b6e.34.1789650719614;
        Thu, 17 Sep 2026 06:11:59 -0700 (PDT)
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79a with SMTP id
 5614622812f47-4cbf21ce30cmr1379100b6e.34.1789650719177; Thu, 17 Sep 2026
 06:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917120810.2150534-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917120810.2150534-1-vulab@iscas.ac.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:11:46 +0200
X-Gm-Features: AcwNN1Vv-ei9g1d-xezvG0sj8-CUlz2SjT2lgneKNLOHWe_wBi9qStJQdwrc8YY
Message-ID: <CAFEp6-1sjie=psDi+uzfN14GXiRPOg1FTTbEdkSgejCg8qNweg@mail.gmail.com>
Subject: Re: [PATCH] wifi: wcn36xx: Fix tx-rings-empty state leak in platform_get_resources()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andersson@kernel.org, kvalo@qca.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: VauITSkUPmluftD7Nv09pjokjE6qCRP9
X-Proofpoint-ORIG-GUID: VauITSkUPmluftD7Nv09pjokjE6qCRP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NSBTYWx0ZWRfX5Z9Gb/uWsQ8y
 oi/CM5cupFVz45KcLRRdcbRBIeeB9WW/2r+kUxW/oGoFJqch5qneulZnLDvXbkI5Z+7wnjqXtPQ
 S4CGn/A+AnLodB64tUvw1/ezDzkmloEnJQRHgFoMqPLdMGPXDVJwX38zsxcbeUt2XSBwYcXWi4y
 i2bySmV5aghqBTcSiDM957haNZlN+yA+4p4GLs71hBlHCfhOILaZecxI6piQfcuDoLS4cnmXigU
 JqJ3EVtET7vyXfDPvr/hdnKipXcoiLiD1AqyqMew4lDBYDhyd/l3kGCHChmk230NlNfAkyTA2hB
 xIg0gsmhODP6UFvcUEblEHY8MGNgVIQoA+PwU2VjVe4xNj0xsG5E1dgYI/I4dKdtZrgVPCX4C2K
 NhSm0kNe0z2nApjNTZS2HxBc1JsdAVrmHbKAm9iTeZoBdq9bXNG+Ql+OmQ1dsEB1OuL6WotxHIk
 m8jHPNOkuOBRKNwqO3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NSBTYWx0ZWRfX4CDgvghpoQyJ
 2mdSlYduB/4S6oCdiK89HYfrttdrFs0tOZsu30AeAWRPc86XSxm0heFZ4MGpAnwxA0Uc5NHT03z
 YoJskWeoDrkkeiEzFmxu/puZi3KqxfE=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabe720 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=WtPzXf8rR9-QfVEoJm0A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170185

On Thu, Sep 17, 2026 at 2:08=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> wcn36xx_platform_get_resources() gets the "tx-rings-empty" smem state,
> which holds a reference, but only the wcn36xx_remove() path releases it.
> The reference is leaked on all the error paths taken when the mmio node
> cannot be parsed or the CCU or DXE memory cannot be mapped. Release it in
> the common cleanup label.
>
> Fixes: f303a9311065 ("wcn36xx: Transition driver to SMD client")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index f34d64464f64..a55861e65481 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1555,6 +1555,7 @@ static int wcn36xx_platform_get_resources(struct wc=
n36xx *wcn,
>  put_mmio_node:
>         of_node_put(mmio_node);
>         qcom_smem_state_put(wcn->tx_enable_state);
> +       qcom_smem_state_put(wcn->tx_rings_empty_state);

Look like you depend on another patch you submitted separately? Please
keep them in the same series.

>         return ret;
>  }
>
> --
> 2.34.1
>

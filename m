Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5724BB27D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056345; cv=pass; b=okYVKzPrGy/izjk3PCJVLroi7bYtlAjNmgZRzoFYUXqdctDnNuL0tPiifScw/kxMwV6xUUU9CgvGySjJ2jp3mAk2KenPoZzGkq9OZKfMoovmWvU4iqihXo1hCkYvcrJy+Usf4zqF1No0ArqWk2oKQ56H5UY2G1P2+iouLIxTxUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056345; c=relaxed/simple;
	bh=aBy1wp1XDgJgk2FDHwx8cZ27pYMc6ljfdd5t3tcQcWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOWAAdrR3qX7exmr3kyL+cDwRcDz2r17HZbOveAFKEhzgEIi2WwjD2Y7pr4mbhKmOy3zCOrwEI0BJ59cufSedbAGXSMA4FUhGdtPHNXPd2IWsvOikVtYQV/I/tYPlfHgQA2g43UIw4AawQW8mpT9+pKQasnR5wzUNVcEalhBegc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gd997f9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UlNXqFhx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gd997f9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlNXqFhx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4Har1326007
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=; b=Gd997f9xtHHwFcNK
	ESk2kaXCnE7PChuTUrYr3RcjIX5qulDIXd4042yQkQPv1PGEwzcf4NA5C2PjqDKA
	VU3c2x4mX1MZps4wbENVRTO7f5e73qqF4n+DcNaPhVVa2yBz8Z3zUTWcaQz2pFX/
	nR7j0xtubkEu1bj7WgORXBC+VyHc4yB+oEcEar016FyeMnDmf0eap5bv0vcfVXKe
	i4bgE3dNGVaRICb7KrQboVxsHlaDfeCBtVBWblzTuqWg45qxwjQgJdlfn5HMeA+/
	kXENZlnTL2OJh2Fu0sVgwWT9PtgfUiqNLmN3+6WTyXVG6hOxx0ZxK9N340jzBB99
	w4MYSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts0qx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso724115a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056343; cv=none;
        d=google.com; s=arc-20260327;
        b=MyFXShZWVIaICU9Q9NQHE5lNMsPs4oEND27Sxpu/Il3LaylaJPc5fHWhWsJcrDhz0O
         t3kqdtWeNC0pHTChpqlazqayIcRgiXHrmSODkk+LawNg1Zxeqf88hD3SE92bLHtG26+K
         vjWYmES/Mid0h3VXdHkP9iWTTmE/XC+vkSVzc5wp6wqKj49FNoXM/aZFim0LyjVw2tRN
         1JrDrk+NypOeJRqp5NWKbzwBuX6/pvM+wZvhT0PpYR3uZopX1TMaFK9cByK0a9eQSL8k
         2qOz4BEh70sdWZ2GxyMPPmWi1ZBffC/JZF35/820yPVkDLXZ72EkiKqfGYYs0Vsy1zUb
         ItmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        fh=zwpKBMT9mVcOxZKGZNjrmgd/B/mJn9Pu3uPfZzGdAkc=;
        b=WS220+5/yGY6X64xZDK8/IK8lOewDtZ+OzcwqcWocI26AdYUN1T4Hj1zlvKsYfIodf
         ToB+bEM71Zlz/aIOIDnrUdiJjRvBrMRxu0FFs0pPIYgWoIcRNo1Rdp6ZzeAxZRAjIerg
         mDLIu+2io48RpF1Ve+lZLNCaSBcqpCkCMAnWiuVdVntEM40FXd+e2VzIVmXHwnT3RSNi
         bjH6OyRCZlyieq4h9vxgsBnqnqgjBTvmXp+bGql51btoKjLjhp45+Eb3Xfljho/MuAYV
         ohHBKZb6KL1IZzNOvRLbh+6aGqLysPBgGbEwS0Q7LG4T1foucg5njJHxV4CfIfBPheHA
         XiVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056343; x=1789661143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        b=UlNXqFhxUHKhCqL4fNI3V7Jxr9f/1utmGP5GVMQUxT5DOCvVdAJDcE6iygBEP0AUd2
         2A8Oe0wmcWub7HfgE3hLGN2D9iJQ7UQ5GH7xn0rk3/tVheJylvNV8apmJl6zFN7irIF3
         8DiKcP8efCA41qKvks1e3QbGIMIp0S5uzckn2rggK5bm+Vis28oM3hvUV2dAMEpngETS
         uk/m56K1eYoIH7MUV26MKEPuLbjuZT10SHBXlKHPLjGbP1IZDIbQXMHgielIeaLdlVZE
         cWAyUBrw5UNGkBoSdjFkeM1IM50kdgVMl1UoK5E3n2vj5tVwcThOvAFGPloGHvDkqUAx
         O9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056343; x=1789661143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykIn558nnliWxTOhlMDf93gMzJ8uiyjVSOWxZFwsTe4=;
        b=AwlWJvcWDUdKpUdH3SVKr5c+bhlKVQ1Jc1egX26Y1Pq6NfrAyQFROgABMOBt5rxihs
         6EkeSYuRWutnhfeReNOTEu+sJRRFQ2lCL8K3OJ+HUwGsMH27ZPIMyU3BTzr1YTcxNluy
         fMGyr1NsdEH9meZJ7WRE8NwJSrlyW6EMfXDKybiKARh4BsNdrmhJyKozfoHVnex/5gls
         qnd8sRR+fJNwu12tsCInAE9MhfVfjpAvkULMjGOoV4m21FuAbKM8fk8bl4PD+nY3/Xoj
         iInNbKe+L5qYm3WHVwMAGrN2AZGcJdySIAIBUPLTz6AAePM09j1Znf837+9Yg3WKHlC7
         z53A==
X-Forwarded-Encrypted: i=1; AKwUvBx9hAPMtMLzGhTPjgprRdeS7TD1gLtUHZDqbKd6/EIJcLlNsfriDm4+/yojIcn+xpX5/+np8sFS+ldIxrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNX6TS9fbB+KykOHKaJTmfEp853srJKquHItNpOdMRtZx+Kr1Z
	hRw4vxELdE2z1b+GX6RE66KUd/0uyvlGSxMCoiNUQfKEXXpe91S/NDtMtrJ4DmUFl3tk9kZSLu4
	cd47nayXuS1q0idENayRy3K9JjsPzQdZ01N0o03F00HMfJINTXIh7V+ZZLL9BV+hy5aSaltBROH
	XiP/IHpRTdlcGrSDAbzVFpp0UhN/XQ2K/pwvGpq2UHB9FmqQ/OTA==
X-Gm-Gg: AYBFou1H322X2+kxPajb5sabm1PknY8+Xafo1VzWeJ+4kkpB5ZNcBkBep4HzCW2SjF5
	YNZ1LeMPQqDA3g1xpm254mXzVx71DBls2ApeNCIVoTw8AMS09jJfmgWc6VNQwTY9MZ8FdvG+GwU
	G10qnpdCUlclunWQ/RqrLYlt/7v5zdc6Qqn9iMZ0ZFMuUjYKZPZ27T2vraXA==
X-Received: by 2002:a17:90a:e18c:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39d709e6ec9mr13852689a91.1.1789056342601;
        Thu, 10 Sep 2026 09:05:42 -0700 (PDT)
X-Received: by 2002:a17:90a:e18c:b0:398:c16e:69d3 with SMTP id
 98e67ed59e1d1-39d709e6ec9mr13852578a91.1.1789056341947; Thu, 10 Sep 2026
 09:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825083702.3931016-1-nitin.rawat@oss.qualcomm.com>
In-Reply-To: <20260825083702.3931016-1-nitin.rawat@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:31 +0200
X-Gm-Features: AcwNN1WvbHnGQHe_mStODRAHYsWnHQkMBnMABj4Ua6z5LYWNHvR9yk0WKmoWbIw
Message-ID: <CAPx+jO-mQ_zFdpUGZR5FJYNdJuJ6EUyRU3-uO5zmTPdjH+S3+g@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: mmc: sdhci-msm: Document the Maili compatible
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, ulfh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa2d557 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=bLxP500Z3OXyVcFfUPAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: mfilOIqsycl8yiUBBWAdNvRjSodXMxXL
X-Proofpoint-ORIG-GUID: mfilOIqsycl8yiUBBWAdNvRjSodXMxXL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfXxd2ITAW+T1Ad
 K6wipVCUBTqihIR8rfOvg6mAKuNw3mN5e0smWioJUlm3yOlfyWBFEcyvUFcTJ/EdN7bFRum/wqZ
 WcffgZqhiGPa7e8QBwIFbBB1DqulbGc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX5cgaPTuD0C1I
 NkvR3Kj2V4wxh/4dGBkcJrE/DkwTh9g6Au4v+LRBrx19ONgC+eYA22+ru+X9xleyfbM8a6v8KNq
 jMaV/T1pAv+M0Hpr0oIFi/gzhRWKvrwIU2/tw+8Wj9GRyljoUjQwzuAm8zyX1ZtTstZ1qxfHUcZ
 UxMJk4/dwSI2cXhOik9cSgki0Cmow7Wlbj4U/+22H97hlKvYFOK+IFF44BGc0+MHsOxO/f6njQj
 yoDKRzGMawSiIMZvFgPag2dX1+osPoQncBDHMu76IQbEP6McmByjmxPLVKBYkfRpVk9CNrhKm/+
 n/bO+wNREAc19AMIrfGFCJ2/YYpm+fdQ5Vjsvd2RJOZXgcDxpe2DTaG1G8GwiChiiweJl1OXyhb
 ogOPKpQP3aKlPFuoEfPdIWjyLp7VxJz1ITElU8eehYbkhY0Rt6aIQmUxRDPV2kI/aLvEwXRsIZ5
 zKNt+A7bBzHlK0ph8Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100195

On Tue, Aug 25, 2026 at 10:37=E2=80=AFAM Nitin Rawat
<nitin.rawat@oss.qualcomm.com> wrote:
>
> Document the compatible for SDHCI on Qualcomm Maili SoC.
>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> --
> Changes from V1:
> 1. Added Reviewed-by tag from Jingyi Wang
> --
>  Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index b3fcc1673c10..69bd44e65ad7 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -47,6 +47,7 @@ properties:
>                - qcom,ipq9574-sdhci
>                - qcom,ipq9650-sdhci
>                - qcom,kaanapali-sdhci
> +              - qcom,maili-sdhci
>                - qcom,milos-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
> --
> 2.34.1
>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793780292;
	b=X3MVVjMY8/tQdtMhm/xRLfY27SwD5c/9tqYtmP7aMwxCPI9kTiRarPVBd7lUBjBXTkGW
	 tN5N+39UyKqxMGOAIgvGFlcB2IHeX2aRTV5gjxzJlSemuD8uplBNnXE1Vkzw/Kj0PvNMV
	 zgbaSptxuckPmzxQYgs1WE/poNZxsVo1uxOTJ1ahEVrSSbxZWX43cWrL66dRm3fkT/1dK
	 bNvND1rg+e98LbLwORDIJIkeJR1HXlv0k9JnHeBPsStz/ppU8tcDhAR8y2InbOx/jIZOc
	 ptotO0RJ5ECwTCwGzg6w67SOTlpnOiz2hwQQ3Ul879zWxZrnSFojnXjSKYm3peBIoYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
	b=pzA/EpWpuzdm1G4+jApIzWPYzvqhbGT/SuXi8anyBj5STMqcAcnTjg/cpwIvJMww+WMm
	 pbWbKMY64o4YEGgy076cwwMN+o77mcj80f4uhbkOICQWgexEsSJ41mTOsyPyV14K0Bq7c
	 V/hC+wZM/67jdTYNZtEByKcyncLY2k8OMQKh96cPUqrLjBRdhJAE7VUqpbAFw1QgZMA/N
	 IVU5oA/AUdeLXceGMYB61xkXzR7F7wnkm7191LLJ2UOAblCkt4hX6Q4eKiLjnr1AXD4gb
	 JN6xoktHs9dICZrOaej3WzDB2zWvIHgqwLPfqoey2oX1BXe9dMh42jI/uvc5NUodWLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5u3hIUd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BhKbR0mE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D1606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC6D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5u3hIUd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BhKbR0mE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43OrdW267289
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=; b=n5u3hIUdh9tyMmgH
	EBPfvo35b0YoB8wAK5FR8KfCGDl/1s6Waa+0+99NNkvFaWCNxYp2v+DSfZMjZsF4
	2wIg61Gcd/vmtuotHs7DLyxJI2dVLetHtsY9rNBVBqfZ3JsHRwnDsgSvdSrGF8Z5
	slBxw2XaXu0VHco37of47Zg6KRpP+SQuZpNtklRuV8qrJwW+ctwXBpcj1MYJE2js
	RlLygiZGofsJd7Wt88P7Z6RkZVEACtSQ5NpNWN25/kPMliC5aWdeJdGayFVLjX4K
	1BgjxVOlMrCEwkCnMnD0FjrSa9yNSZJCcTxrj5qPwkYqFPhDuexmW7UycmfU60DQ
	OgpSLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg926a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:18:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533928ef33aso4613031cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:18:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793780290; cv=none;
        d=google.com; s=arc-20260327;
        b=UDuOLqHFgCmqEQom2on5Q9kbiT9dElCHzmnG3p9p67KogibABaHv87tqQSymA9/FbB
         JmQaQNT7/0n6zD/qQiNU+53weIdAtahsTKWCmNK/RoE3TSEp8T4U3s5ForFNcTSakS7e
         /FxVRkQOs5WUnuFFMs8gSRxqSbnOxMyFQ9P+vXZEcuEqSzqBBZ16NrqFCcZLRCR47pgX
         OnJNMveZe9djN0EQ++Z+DT1rPuY5xG+nTQucmWVpdIpWENs3dewtcB26a+SGFk2yfwR7
         5FcW/oF2Xxv3ewQoTJJOXvhHvZSmllLgxKG4Ae6nbybmvOnxMwc5ui2+fCpPqWV3TSef
         +xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        fh=tW7I6KS5x6cZZEmeb4khOJ/bmYj29+WBHMnDg9CC+EU=;
        b=QhddIHNFD4wZ7jc37YRES/Yfi7q2T6lXH9hhC4SodnLAYNBBA5o/47jDgZxPasQhXH
         0QvIHrnxenWaEdCQnC1l0BqKLThMluPdHGyeWjgqflzP69J5AZNplMkCqDtNNkvhQ2+F
         GiwGHV/sTO3dk5VUzc030F3znPtuC6O4kYrNmSRoOQoZiVRc8Jyzr/+nP5CnlIyP4IT6
         m6oCGga++hW9pUlkKumQCahxNhJPd3ATDCILMhBrCqpWWXMlweKx/nc31+Wk5kaCpCZY
         5fP37NyeOSH2RAl5px5MRdicipYpTuf9tkEGDVzBefmIE9HRho+1dPlDDz4xqFALG2bK
         6yeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780290; x=1794385090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        b=BhKbR0mE4y8j3ie6Rt/Rf8T/h62PcswhCh+4CSzAIgiftoUlC35oc1auCIJXww0nvV
         OTNMafJB2seIX/eXDNW8/eylYRixBnSREMe8JOaFXSSBg4uZcnc2+HJ9Z/uhb910FsoW
         nWu6rWbWiAxs4yblVWKirif4d1113Falhw/vHckZgqWs/mTbVdm7DklRhlMgkA4p4NZU
         q5T/kK/kukt219DAmoJB1ulVBAG2jV3r18pQ7FlxKzMv5rnOvC6i7ZlsrYfqMkv/vbF4
         C6cl1oursdXPbAMKXBhKLTg3RbAhdDIViaUB/PZ1mAT9IBP9uKwh5Oobby/TvcvbI28y
         dCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780290; x=1794385090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        b=Y9nsqz+773axJnO/MzaEpnCzILwl+jEPn/tdWcAzZqoRwiYdWBxgMYcPZfCTHOlP6r
         C8mE8mvrOjnUzDbCOUDd419IxidNJ/QEEjDSi2TH1pEXvHxR6bOkT6ZXUWWEhiXYzJUN
         cFCiSzm0Y71Ix+iZWa4whKGWStqPrFn8UUs1InKlhyckXbuQ7wJ8Apm8whNqhz1Xid7M
         oEQNiV8NWEYSNZfJSeC+N/rjHJrVBZqYKwyCZvN/DwiuFhU+G5pkW40zfT6Rqki4O+0p
         MtRqTLd0cnoeEdX2lDvc7xBI/W+zWGHEwNrQ5GerI9y+MTb5mVT1CMHEhRB+2MWJ8LT0
         PLWA==
X-Forwarded-Encrypted: i=1; AKwUvBwNvWFOt1lCwkSchikA3O26u+U3js80pxo/XAW3lcWAAIbgEA1iWcSAr3Xtza5y3/mI4Fgr6awlK62aWm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DOx3bpB/WaRvSInK5kudpQ9FPECJpMVUmHUUSWFqSktZtD/Sy
	wqONI7K8xLI+1rlJe/5btc3K5JrlkdB1hq7vdCoYIGoZqcnp8piqjRLUACP4M3lHj9G3fFsMwB6
	wcbCmuF6D1F1eKbfu8Ndbxti58M7PfIlWCgyFGdVtS/91Kz08cAvoVPCLotms3QS+032VEKVYGc
	3aTObKSJDFvAjdk9p+CMt2vvqMKIo/jyqKWYsMNv13Tw==
X-Gm-Gg: AYBFou2cMvJcEdgo1t1nUohzIjB9DiUUEIQH3EyAM/Q8t++vEkZKAHEFE/idUX3xuns
	GqnuTZxkEL2DGDSO32u5/KywXDB8GFubhD8EQpNqqAnnGUPvbUhY1MMQb57nrbsWirpp5J4mtdJ
	LWOji6TNB8YScDGeamlbiYdSlAEWZD9cEJFU5Htr8hRyLaiw7CyhMVaezIHbGswMdYShGCtcuEI
	9PhRU+1AMkRLG4dgRwipyLbuUr7TPnEdFCivo0BiavHdFf48ed+Jahq+4on2uWshZ3X99/xqSU=
X-Received: by 2002:a05:620a:6406:b0:93e:7944:b874 with SMTP id af79cd13be357-944216ebf09mr2346221485a.33.1793780289954;
        Wed, 04 Nov 2026 00:18:09 -0800 (PST)
X-Received: by 2002:a05:620a:6406:b0:93e:7944:b874 with SMTP id
 af79cd13be357-944216ebf09mr2346218085a.33.1793780289422; Wed, 04 Nov 2026
 00:18:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org> <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
In-Reply-To: <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:17:58 +0100
X-Gm-Features: AclHuK9lnpn5o-AYyo6W8Av-ZNEtQ8ukw8wc-Ki9Jr4kBT3RqAwz6_m1hfJuGpI
Message-ID: <CAFEp6-3iLYqvYqCrdf0ruQvuV_PKkpe+zdqFS6X78bEXroXF=w@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaea42 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=dZbOZ2KzAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JbTdJk7eOsX8aTkAOlIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BIUXhQRgc39185hJpZmTreygSuRBECxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX0FH52OAwgFog
 dvmR5cBKv+uiolig2E29YXeoZWRbLlSV0B24Jk9qh6CzkZIxdLdjPB6lY0qgz61aVkOjl0e/bb3
 LDXkfjBAeI9RtIf872hwlKdFXuDsDKtOSb3DqJlQlBjh7hDZLnU7GLTATul+7cregMk1p35Z7YT
 V5yaZx/2R1iKz6hq3GujRDQdqy7d4n8ONL2mDBEgv1P1buOZuhBqF3yyspvGnNlwZX+3ctqJ0o2
 vrDC4srwp2rkXTPMLWo8vfBN8UEIgN7oAr50tC3ZgaiZgzcfE4kRYBBvjYDsR8CTg5HClPk1JcB
 OG2tEeBoB9/4eIaSXb6qlUHe0NVBeObHaO98pbmQXz/bEXKY553hsL0msYGWcml2z6a6Ye1lrMJ
 X7EVOVEAir2neL7Zsw9SPdFHppcgozDDM9scDBNW7Cvg/mpMfgBQ/zbTzRduMxj2tyFC4U5sWV1
 IJqI+N0OGD9vLwxLF2w==
X-Proofpoint-GUID: BIUXhQRgc39185hJpZmTreygSuRBECxz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX6V6pfj/LqIU0
 egGuePtxt3aZZ9pU65Ge8GNO1sT7EZASZTNCN905+0dlstKteiV9TPebOwybhOL0oDSKoGs7te+
 sztZzDHMr4BhwRYEKZeDeSbW8EDfQZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

On Wed, Nov 4, 2026 at 2:11=E2=80=AFAM Shuai Liu <847807867@qq.com> wrote:
>
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
>
> With CONFIG_VIDEO_QCOM_CAMSS=3Dy and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
>
>   camss-csiphy.c:(.text+0x51d): undefined reference to
>   `phy_mipi_dphy_get_default_config_for_hsclk'
>
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Please do not submit a new revision solely to update tags when there
are no other changes.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> Changes in v3:
>  - collect Reviewed-by tag
>
> Changes in v2:
>  - drop the redundant "select GENERIC_PHY", as suggested by Loic
>    Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively
> ---
>  drivers/media/platform/qcom/camss/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9..e0cef2cdd0a1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,5 +7,5 @@ config VIDEO_QCOM_CAMSS
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
> -       select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY
>         imply PHY_QCOM_MIPI_CSI2
> --
> 2.43.0
>

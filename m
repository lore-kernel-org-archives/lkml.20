Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368846;
	b=gN3jk536mXSzMHkoAQ7YeIr9JZTa4xbU6aTvLOWfK9s891/C9LpxA9Jo7rtjjZmp38tr
	 wxTu0e8NNumr2EW17GYGwdtS2LDtohyIyzpNxWV4TZulYV3Sjd+UQrgt6/VzBuDO1JM5D
	 oVb5jEy1B5gE/KL+iAxyrRyf+hGdyEK4Tj4rVAyDnSSe5f0b1fvTr0V321aMGijTkm0WU
	 X+NhuJaKiZ3QdlSGI59oMEpyP8WXnm7keCdpWHH0c/Vlry3eROy8BqIW0KRhYuAQu+ck5
	 vFR+4byC0ao3b4RiGFVUzKP3R/6Sf6M9IyCn54+k9EK018731xO5TXCohChaSv+w0wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
	b=MZjCojfGIjNxkYERw5xM1ZCJ0S8A+DgDWh8aI1S+p6KK9iexPgbFvnklROoZv2C8MShH
	 bg/C3Qod9BOSZWi5unS07FSlZvvpyKu3KbaAYwcprY3DAy74VP/KDlWmsSsJr7Pwow9WE
	 7dCe1sQ1mgwhqKtdn8EkAZm5TtU7X5CDTWz6y/nilM8SLXvJr1YQOBFjwr9+U6/YC1dOL
	 PNMpni819oN/piskkUuFOMeQZ4Pm3WbplIMqJn6m41qT9SSQdgezzR4+fzaadEGk8U+CA
	 IUlEaE4v+DRQmIj4LdCnO4RNi0E1+ntWLzrAqacvQDdXXeWcDMWW+sRHrGjMoT8CaYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yp5wOBuY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KdF0T0Iq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B741B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B741B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yp5wOBuY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KdF0T0Iq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnDs23468770
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=; b=Yp5wOBuYUvaZ9G8H
	Y1Ge9H+4Uez+7kLRVDPNkz4UIdvmsydhiWxon7uANhBzMmnRD4gl4ktaeTi7mg1s
	e0O0BgJCK0RC5wjWI0qIafUgGDuhxHpYBQDi5Wq+ocDWDCGq6cVCNarTRp9nmrhL
	w/1K3hutLf4UKu83ZkdzgXoKWv1CPqy0/LBn2Dpm7ff5xpkl19H13Fn8+HXVwJQJ
	jonaNFWMxz/1aG0P98FMwkS8WWWzGZF5MkDntYotkgojATsIDlO08MftH9z5v6Ce
	l+D8tzVXSZfHpPU4HJ1K/LUz7NvfuyaefcFPpGSPbPHr6vXgV43GG/GFuf6ct9bZ
	GpjimA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkawf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:00:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e987ec84afso7419345ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368844; cv=none;
        d=google.com; s=arc-20260327;
        b=Jg9myottFN1K6s1yq13q1LFmlKLsXgzTZCZMo9lRqZ1zOxN3HC50lwAKJ86r0sRvrK
         HbwEWy3MFG4EC33IofssezGPu0tzk2EFFvnM0b7G7kOYgCu92LN64mQtIC0MHsfEemSD
         9tHJaDk+g/hz2qQ5gIHJ768CqU0y0jqxhBlwzuhfq/bv1nnPx72o1g/g5UmprFmsR+Od
         hFXg2eKpLo8wCoeU3ctuehawwDhetaCOQAPUeGarZtz5fPkRyknZ7LSJ6dJm7ub4kUOA
         TTBjbOOppMHYGmdrRUN9ALUJF3YyDWu6l0xwT2o35fDT1X3kFjBj2gnpjoxJ3jbHhII/
         o3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        fh=COUXf7msIawbxP3/CC2Bzz15Dw76JzM/11sfUmMyLU8=;
        b=SGwkDV/WgPJ3BjNuZP40PqH8prV90c1qBkhAdUqSMMBycdBrrAi1PlJm766JFk3XeQ
         JE+o3RCw2/8906q2rGOxlLBAJ4bBHfeylDrAv34s3Lm9NKoE4FrWgiylpKjHhNGmmsdG
         kL9Esn8aEKNwRrfcaGlk8dr3N27Wqqd1B6BRfDu08hDOnpZ3TeJi0LO3rlCMBod3RCA9
         v2ugqLcSyCcDuUQLDMuU7pSP8LNZlrbfxfOie+4aC0+BXNvoXrzu85kdKy7cXN7/y9/a
         IWHNO54MLv/3ig6GW00HxYj+XnXMGY4NEWVhjji68GPPYjpOmWhMOFr9GAkdiy/vBj4U
         LkPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368844; x=1793973644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=KdF0T0IqR/9u+is73hbl4kFHKP1fyNZK4lGWMSIf9mV15FJOdvxLhao1WqkAQC2D4r
         Fip0tn//jq40e8dEZ/0qfqbMEXM5J6+2hR5uKZXS+T1iy/tD4ky873EDCXyDcVT3x6ZE
         jFWlUJCa28Q8spZsHdNZy0IjkRXwoQ4qXRHcXaZ9x6R1GLHMZWU0wXplIfrZgNjYFCTW
         2fG86BkFOY2baLKHrJLEpHRDmH7SAD2TF8gHe/cF14+aqt31WSiBzHfUd2kybgb8PvLl
         vWmL+riRzG6fVPJ+j2kTTOFQ05jxNR78gcsGiwV2Zbd1ENhvQl5UTk7oNFpPJEKVFerb
         3Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368844; x=1793973644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=G29VHwH33A8i2ZjcYGhFbcQOzph7fWCegg9wOVp5pPxdlzUi4nc3XZhX+wjD4Lu+jg
         87Unlzj6q6mhN1lp8bk0FyRuX4WzY2OeEpIHT8C8HvRi9FlH7jvFJbhw6d+TZb/e7tZR
         t7mO0Hfe+HFLsMhDTHJt6/t9l7mJR39fPmgmhGLFkTkA6ySyQi7L+YxjsVC58R3FSWGO
         S6FFJBEo4KK3vxllB/XuqLOi3vcNtn/fM0NthoICl0bpRRvMTsof8ZM1J06CndetKHJ6
         35GJ2pfkSMWcqBMbnkeTgyFmxCS5rYnepH8VeKdJNYhH8PsUTGZYj6es2n3M3JgWpiqo
         Zxmg==
X-Forwarded-Encrypted: i=1; AKwUvBwVTjA0tzghu7lcquxCMYe8lOWwJRGUR94S+2WXEcLRTwWCPVgxDF6samJfC85+w8VFyl4KCaIhHV80FRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9idp3jOTI8VAyy5mTDS8x3TqIo3AH+AZipqkon+WMBMyn/XCB
	67O+ex3gf2G5gTex795Wy8u5n6UTCfQWLI5hJOjas6l2Erv9fXwl0vVDLE7wKf2ZWJBIsoY36PR
	SXeQmSfc8xnfC3qGfRcp9zN+NHJoTG+deyU70ZfF7xx3T/qo1W2xCVlAv8X39udrjOUYfI9+xkK
	GTemMmF5HhK+GwpAEmo5IlOw4kXJIQF6D+2kNvlQfkVA==
X-Gm-Gg: AYBFou3ccdsb9HIcqi4PdtsB4mcGkmoY56j0gLkzfmt/tE6IQs/Rl8MTHbX/jCSbmJx
	TorCUn4PQbps7S1PiRxWbIZEeWgYZoydwyGSDNwal+izQ8t+sSJ78NmtSxi/KW3iJSFkFefF6aq
	3ls1xdL2MOCAIStqkUaHsG9Gcg3420JmUKKHBgqH+83jCNlFU0J1yW68aXZQ==
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2eb364552bemr27295715ad.34.1793368843538;
        Fri, 30 Oct 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id
 d9443c01a7336-2eb364552bemr27295385ad.34.1793368843102; Fri, 30 Oct 2026
 07:00:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com> <20261027144002.10606-2-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-2-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:30 +0100
X-Gm-Features: AclHuK85D2yzjqjadIBbGwA5No_thmVDaWhvxFw1u5vv5w3KPYrH4xdvCoOE_dE
Message-ID: <CAPx+jO844b4kY9vbJPJj+N5H9cRJ4TzT52=1yU-Pi_oxqysd8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xDmW83o5vvbgxeRzA8Hmxesgh2XKY8yN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXzciHNlyO5MsM
 SQSPDkS8XPXdDseDmQgPFsRSU1pPvaKFfwr+SpUW3VVIwcRu4pOpZSXaThJJR2pLtbMVRiZmMr6
 bRJ1J4vp+MtprJKqPRuxeA9QSlAHpdU=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4a30c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: xDmW83o5vvbgxeRzA8Hmxesgh2XKY8yN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX6G+dX10aFfCK
 CHa3XdfMyZbzM7ypg4jlBv0JisOlJTO/5noBHzwVkfO4CcAbXyfWbowBJ5SXRxiG1j0zwW9F0r7
 CY84Y2lrv53Pw/PAe4PyYUFjD7UgTbgCGGUM/NXKqytwxE/V54ZYKNgTfbdmopvx0ztCcAykwK1
 YTJl3CBBNJOccXmL19PZ/Kc+/OkKYm7c6CnlHYokpPJ8cJskb9h0ZLihJan65h6oxGgZhavPsLv
 7TA0yKkLKRpSw3v1FtFC0d9AiWPIjhLDOe+EjzTIx9zG2tPttoR1PP5Ih9cvuA8/hL09+R0HkVe
 Tk2euHuNfgpTxWv6cdY9sGpK6UFyChL1oJLbfJhPnfIGa0QxsdAtYO2E5kk2lCBU9tHo05AV1xi
 yCRPqtA8jFqE00th/nm2JQQzrNmGqolNMf9Li2BuhZkYNx+bswE3hqrsrm8Rie++RYnzWA01sOI
 16VkxsTcq1Z77hehUjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Tue, Oct 27, 2026 at 3:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
> MMC controller based on MT7988 with the difference of having a single clo=
ck
> controlling it.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 5b160fdad3f0..736cff2783e2 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat =
=3D {
>  };
>
>  static const struct of_device_id msdc_of_ids[] =3D {
> +       { .compatible =3D "airoha,an7581-mmc", .data =3D &mt7986_compat},
>         { .compatible =3D "mediatek,mt2701-mmc", .data =3D &mt2701_compat=
},
>         { .compatible =3D "mediatek,mt2712-mmc", .data =3D &mt2712_compat=
},
>         { .compatible =3D "mediatek,mt6779-mmc", .data =3D &mt6779_compat=
},
> --
> 2.55.0
>

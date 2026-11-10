Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308109;
	b=M4Oeem5IVDmyj4tBIDYhJXtwxCTlK2mjsBgdTm+vvQPNHuiBDgcD+lC8xdEN6rXZJjXL
	 nQr9yuvH8kt+M75yE5bzcl148jK3F77N51wttWrBI6MYRw51jpk5YFef1+Zs3uDMXEYND
	 LCCR9W1tuuenLZQ23VBsks4A5F23dg9QWLAu+Kw3JjB87Y8hxDC60UmAwHl/bbrNu27aP
	 0hoUOgeYqQPbOOSo7TeLwqEPTdTwaLcAOHcvkhiMlikBcAVPQsGyoEF1D7sdxvjv57gi+
	 FGi5/5YWL8BCEKBHb1No2z5zK8Oa94Aa5uJEhCDkCHMUNwc8BOVt/bGhl0sX1BCiJkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
	b=W732u7aFG4GAnPwiAQ3THXTjbohGZBmI/nMoOV0eGk/qlPisnIYC+ChEVpPlc+7KrZ2L
	 c8/dLsJuS57J//O/+2+ih+eOUZ9MjUboMIZp0H7gE8uIQxqmO3GMTpn5AjIEJxAH0fEW0
	 L2IaZLfA4GIiKJQsJ9VySnAGNmtC+Gi+BiGZQFSEv7g4knSQJ/m2hSzqX8ornycw4HrA4
	 rlBNgNFnwMj1z8Wf4qvwcD3U4n6mRGDIx9oVHRt5nyfesH4CKhFr5XdmngGAhSi81XhSh
	 k9eZIjp0GprafwkCyT/Zwi7w5BHfNk3bKe+B1GARI3K+LTaTqBGSOvvIvYqfl0jmvvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIq2FKal;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ixu68jdj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B72C606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B72C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SIq2FKal;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ixu68jdj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lA1g2433868
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=; b=SIq2FKalNnAEkO2P
	oIkOZMlWpOUnJ9sGWRZrSd9VTJoz1ggGjeIgAcwU7l+QMtNkT0zVc6JPRXaYU99N
	LzFJZwYiQjttoE7IbpNIV+HBteYxQr5flBOYSR9G4gADntAZfgCxaW8Crp1DuiLa
	c47wDPuFdtAOCJu4ueco1U6A7wGwrhQMNbq0ZMQHHTq7FlquqlorT6j4DzV3Posc
	qe/bHHKmGwQ1P+zR8Ot6kd24HmnhH00i5gbJkRv3alyFe4cwKk2azhHErstl/geT
	KmZTB7ADiQlKqGB5wim9lEcjL/UGXrg9AMpkaWgK+mv29UUB75zXBJSSdcGiIbwS
	YhZliQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux848xw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed2803f863so19329625ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308106; cv=none;
        d=google.com; s=arc-20260327;
        b=mqKn0YDVGCMUMBnTMvP8WD32MHPZoHeL4N7OpHzz3wkVNn/aHEDAEZ9D6iLk2WkSYH
         g1jQbTn9kSV4WE9TKGT8k9uS/mpfeIFwXgjyqnUwog9t31+jELeXkWxezlm0/+9384pn
         Gcyc5nJqtSR/hxDxZJmpDEASrDPI/JveEFBn173q6YVqyMDJb4bcUvRCaD3l90BM6cex
         7o5pSdiOHayhTSDXbbUBF1kMqkQRvJN8ETR09q2T16Z7WbAJTiz4SSL0RvcDA0KeHvuI
         ULa5utUeuLYqDnujn/qfibwUaD4oEdKi8bQN4MOKOBC8M3RNSyGVzvE8ph64pzwVoyzM
         Etrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        fh=a4of7xbrG5Cr+0CgWYhK7MLydido13QwJm1fnZo2MOE=;
        b=AH2HqYS8q5GA8r6bkF0L44DjWTqW9bOjcDQdXwgMVdjP4QSzBTYJzkdWIW+hJjNaQe
         oXd9fHuYw7/KW8KjMswrH2JoXPlpjJabcG9sf1jyBMm2ViFN0yVMoXry0FtnuJwk0JB9
         2U1GJ+MS8di4uQSDk0MD+Kjm2iNAQ+f94ngDf4L7QS0GP5EScK8ks6AMb9YWS/7UzLKF
         IFTVzmifPkY86qM+YczXKTGRoLKXNIFVl672vAL9GSIz1lULGf1Z1/pgcXih8YI8hfu+
         MNJnRnjQXDhIVQXtL64GQTK6cB4tRNO5IjrCzlJ9tOaSE9pWCIvk5sLi3dS43qOBA1Jj
         6+0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308106; x=1794912906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        b=Ixu68jdjORJV+29LCoUTkG9/C9Y/3u1BuHfccLfXT0SKH9NniBdnTZU5bN/hByFXVU
         wdUgjmVUDa73T5P73fDTh9EV2NnF7wFSD7/zNPjgTzXW4JXdDmhuYjQHC7OkqI39cySB
         K6100VKZfZVL9i91uyqTQmisjJ6oTrR/YGQIZUW+Yz32nq/tea1hA2w7Xkbl3gDlCqlA
         M2GotgE9gcNlTsXCMvr9EYMmXh7FPVoc7VV9TMV0Y7NH8K/v2azScxJRS4j8mBDCauhT
         JO4bKsLUbBCT8XZTb9yFswVD3E6tcJ/YqhOkiov1onoYWQm6c8EBmO0Twp4Nsw7atIBH
         K5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308106; x=1794912906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zn2h/mfdeJyzmrvYGtYi3WlYP6oFtDlczeBFhJTZ50=;
        b=IYbVUWJPtX3h9QJL5qmjPjt4YTQ9y8yK+qbiF4UhInHPmrKyCuhLzcAoWsHSP+0K39
         xrUuL8+U0r/smMUZyBysHlGsZGm+FDeeidDdhuqBAStBV0zDOymcAYXHHTDG5AzqHs4A
         WX80ATJuJf+s8Uhm0LAV1Y0c7l3UsUvyBNKk5vr4Shg37gEz24HXrouMeNCA/bVNOKVx
         szQhjeOPEN/egKy0mC0vtrynkcvNn6ElOSI7b/jmMU4BT/soHba1wfSOYPBk0nx8FFxT
         ExZKeWoth07p0bq8kjUGL0hnsVQU/bLEII8WDSAwTcuBnOlwLtkAMQtYB++etFQ90PZL
         U/iA==
X-Forwarded-Encrypted: i=1; AL+hErHVinoSoUwa04DSiUl2xMaKnp+H+5QavGKHHGxyYMNCNaALCihKlhWkfQmzT+DBNk3lvMD+7KuR/1zKSlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dalLVegXTc4B1G9pf7l+KPhHDto9SLmOBpCUx3Xx8b+m+VRBE
	a5F1CHZsOIg7YLXq4/vApcO+cKFfeUjMIRgJzTr6wuQ0bUWzV7TbFlZ3KywRu91TMVCSM7zFCGj
	FypKouEguVIKnSb+x0cnOWBPGQNPss951OqOVYkOBealBlprUihU7Jg3JXcY8wNKfTZwKUQ799x
	JFMedYx/q2D18Q2m2vwJ0M7nEtw35kvLzOuFfc3FFjvw==
X-Gm-Gg: AYBFou2rlK1pGluUmMIwL2amO+0CzQuhPsc1hv11OqIP9bODnrayct4ZYbIWdqIM/6q
	Y8PmcSjRbnYJsKCwQ7i72HjFHDreQY28JX7+MtSs8RNj8Vr58WQE79H/mRORASwQR5OQdJixy69
	Sl0uLnUh/N7xrU6/RvBxFQ6uNaYmd6gXvjwIS2HiRsPORFzqEX6Y35AayHCA==
X-Received: by 2002:a17:903:1a0c:b0:2ed:4ea4:2dba with SMTP id d9443c01a7336-2edb8fb3d86mr20040015ad.5.1794308106389;
        Tue, 10 Nov 2026 02:55:06 -0800 (PST)
X-Received: by 2002:a17:903:1a0c:b0:2ed:4ea4:2dba with SMTP id
 d9443c01a7336-2edb8fb3d86mr20039865ad.5.1794308105831; Tue, 10 Nov 2026
 02:55:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
In-Reply-To: <20260926-b4-mt7629-scpsys-v1-1-e02d03d2151e@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:53 +0100
X-Gm-Features: AclHuK-wCHxxV1sk9ELba0eXodmE19efdczWGBPVlSLOk0ffW72xQC95zfSkjvQ
Message-ID: <CAPx+jO8r=bBSZiw3SVfyaU6XRWtPGMj-okMT3=NnTY=Su+fwEg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: scpsys: add MT7629 support
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX4J+LDfQT6Frz
 6xRls6AiDYbbAWIbkNrjOv+seU2u3940jNMzyZ/2pXrcaA/RmypKBaErV+YNIArPxKm35RBs7Ab
 CxiwmuCoqHpdWS2VOUruofueP7XWgg8ACwMJqS3q52c/cMNoUrv4M0siNJZX7NQijJIUn3yJ7Y5
 VEDOMYAvAbxNY9JSE4Rw5hBnkCJhyTyqatUvlfdHOKVHXiaIyVJWngLxCIMwdrPXpsExC/4kBI5
 aD+L20qkVggt7AG4sXJyCar9wwsqJa82QxZktstRXfWwgcGYADsDoYPCLEReB82W6C8MWSNcYkc
 kPF8/yRAnT490DL308O7KDGjVaneMcBqA22YFzlZmqgCyLUA4oXyehSsMCg0ZbyRcuhGFv1ObeK
 r9qVhsOSNU53GHCp8I+U2CPmGICf0MyOoDySSvV3lWCKvGq+WVorFEaoVyfRn9dMEEkP3H2mIZ9
 6Hbkz2fBjqhhY0DoTWQ==
X-Proofpoint-GUID: uptP7R-cLNqUka0x7SEytgr1nuW2SHHl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX2nCLo/iJ5hiW
 uAjW1WsvI7T4sMJN2oIPNGK7EIORCUE1hdse9sMyGoOZc3bYRk14LmmauhG0F69RBuuLAk/hcPP
 OK0/iKudqGwQskAoDLYRVgsDZOpRw00=
X-Proofpoint-ORIG-GUID: uptP7R-cLNqUka0x7SEytgr1nuW2SHHl
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2f80b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=3fVjQ_tGrbk1vConURoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043

On Sat, Sep 26, 2026 at 11:59=E2=80=AFAM Chuanhong Guo <gch981213@gmail.com=
> wrote:
>
> MT7629 currently uses the MT7622 domain table through the device tree
> fallback compatible. Attempting to power on the WB domain triggers a
> warning during boot, and powering off AUDSYS times out.
>
> Add an MT7629-specific match entry to register only ETHSYS, HIF0 and
> HIF1, matching the domains exposed by the vendor driver. These occupy
> the first three entries in the MT7622 domain table.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-scpsys.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/me=
diatek/mtk-scpsys.c
> index efc8f276ffce..2b5bd8d61cb5 100644
> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
> @@ -1073,6 +1073,17 @@ static const struct scp_soc_data mt7623a_data =3D =
{
>         .bus_prot_reg_update =3D true,
>  };
>
> +static const struct scp_soc_data mt7629_data =3D {
> +       /* Reuse the MT7622 entries from ETHSYS through HIF1. */
> +       .domains =3D scp_domain_data_mt7622,
> +       .num_domains =3D MT7622_POWER_DOMAIN_HIF1 + 1,
> +       .regs =3D {
> +               .pwr_sta_offs =3D SPM_PWR_STATUS,
> +               .pwr_sta2nd_offs =3D SPM_PWR_STATUS_2ND,
> +       },
> +       .bus_prot_reg_update =3D true,
> +};
> +
>  static const struct scp_soc_data mt8173_data =3D {
>         .domains =3D scp_domain_data_mt8173,
>         .num_domains =3D ARRAY_SIZE(scp_domain_data_mt8173),
> @@ -1105,6 +1116,9 @@ static const struct of_device_id of_scpsys_match_tb=
l[] =3D {
>         }, {
>                 .compatible =3D "mediatek,mt7623a-scpsys",
>                 .data =3D &mt7623a_data,
> +       }, {
> +               .compatible =3D "mediatek,mt7629-scpsys",
> +               .data =3D &mt7629_data,
>         }, {
>                 .compatible =3D "mediatek,mt8173-scpsys",
>                 .data =3D &mt8173_data,
>
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20260926-b4-mt7629-scpsys-88d0cf37c6e2
>
> Best regards,
> --
> Chuanhong Guo <gch981213@gmail.com>
>

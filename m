Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353312;
	b=WkPqOjSuz/ZjmuR3Nxk4ay0+kCJ8NB23LGCFCepfs+6ULjI6+0N+/AN9nCUK+lzzU7Z9
	 XzMGOp+FH/inoIRlbut3jnUtX1r3jsSHeWPwQhgVUBVRt1gsvjJIOsCxE2ZxwYlpllwxu
	 2KtZleHgLhimiS75v6YFALSeG933ZgJS9TKbPrIaXYSxMeiXp0Sv1BqTcDL7rdO3ziXLu
	 vU+F48JtMkTSvsajJ2PDKKVnVJ1lLqfzHzDB1TQC+T9JH7ZaQU4cQxMVL/SRJdQ+NC8KF
	 YKj5jk5zh0aZZdaSWELFt3EgAkIbgwUYRWVf1gsQS46v8SQDgKCOeCFyjXOIZR/+dgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=;
	b=KeRl3qtQY29oGLcepNy/EOLl6qI4NaH0rpEUwuHN5alw3VBw3y2frI6ULSRK6e7gc6pf
	 45aXRlBnX+DzOOojriBXq2WVCBV4UP91BThO/VvyzljWD27F2Fp1AXathjwbW2lgXwMKS
	 k59isc5vQ0Heh5FalaPFvkiP4dVrB9SED0Yma2ANYrIvDzyvw1YcEctKNaiEbj9Otq7Km
	 RRBs5uMlz9VGCdworfg7NAXxua4s2I65667Ee36wJHn9m9Yi2nyHJW1oNXzRH0eZ+gG/m
	 QGKeLHqtA5TSGmiXOmLlaokLttYKUTBv2jCKyLGcSsMkTkIWY6GqGxhFddcmxosaCTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMAxc9Ha;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QBximEv0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F2F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F2F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMAxc9Ha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QBximEv0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3kX3308822
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=; b=fMAxc9HafL57ftM4
	FY0MTvhj3gxGQWVRAqEL8qfVFSCVB4BhWm9HZ0Kl5XsD24BHweZhXMa5YQdbifJ8
	ilGTd4IWMghb9S2E+ujc5rQ6CXYD/I2t9kUpOBCwa/UqzH3QENska+7aljbxsXUK
	oNgImzBi33U3TlSGVW5CnzDLTcLxZHSMY/WPK2hV15xR2zJDhropF6pelhqA+T98
	6FxhspGZNMPVEbSGrC6I28JgeOLR4+OZeku9AFvLV8H2tTcDYBIkhkaF2IkUTPPW
	rs3FESlRBr7I6ibkzhI5zp+731b16beh6ClHlU9QXTaqZ/mVoEdxIhhB5gWZCcyJ
	SH0RKg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qt959-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:41:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313b1501a0aso90056eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353310; cv=none;
        d=google.com; s=arc-20260327;
        b=LyyWJOc8G+JL3fhJc1r/hqPXJ7WNds3uotuk0Lt6Jm4W847UrLeUsm2JldKMJ9H2A1
         akNaNvcDawiPYQSZtMJqlZtm473VF5U7kUQyN90ehetfBfpG35hCfXXVkm4mUPVmwiZ8
         kZxA59RCod5vGsoI3LVhp2K4eDB/Y8G+KqJ5sAv7H41lD6R3XViKJ35obFonLCBnVC0k
         uT8gQgKwfdMA4qVn6n0yUvmpFh0ck1KUChagB/nD9gazr2wYTFCtLsNduIb/bsVlRMgX
         NoyIiWt4BiT8HchsiOTShVoKYK33mODY4rSZyPun12OzQAC1wRBGPgEohYOcNiEUaSae
         hOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=;
        fh=Gr5pH1auNpa3x2D1Iqip2Xug6YsFRlUJa8NCMdERP0Y=;
        b=eQgF2CgSA92mgrDYB+2ijZUUqNQ4Tcbgp/Dem1gnN1rK4b8TsQuwTe0W0sZJ3t6v7/
         4F6UjWkD4cMb7Ir8MRZ68yUYDy7cVsiakKZgW2FDpOHy420SNggPSF2vw7WJrO+WPf7N
         +htEoJjkUidAQ77TB86YqJ73vGX7JLnmU9o4vJk0H+oalJ3B8Y4hjvPBAPEJri6MjWqb
         2Eu7DsMbYM7SoTeVMuDlm42b0ccyiGr2LxCpHKjvHUkpqW+SN+hQIMksHkcx9fDggdXo
         JsR+2X157MfNvFHPNzBYyT3puO3Koe49gS4ABHGTEv175FEy0dtl7DsgC2B3v9pmyO2N
         b8nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353310; x=1793958110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=;
        b=QBximEv0P9Wgx35N7PdgmVaauSadXECAMcJEB9lf9beea7iAgsiUcF3GwVPae28NQa
         1pAPsHWFaDFZrdnS6ISXx6OLtmvrfz97FhESu5TPRxoWOvmErlK96DREHtN8i0dZPim+
         iOqG7NWIMxT5XIcKcuB6gae0mt+sVtWiJxe8eoDRuTzQqAtau0xyQkrDzD6aIwqyg95Z
         JsSzG7fOkV5zfbRjGNfGrt+eCS5u9LeKPVNkQAuyG7CEtAKIziXa/wzlCHwWUidDfYh1
         iRbRS24wy2sv29YCD4zGPiVb0gctVgjI/N4TAL/MC69AQyNQ7CKeO5TtTfIA9I6xnPx+
         06MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353310; x=1793958110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD6WtmZ8YWGFFS4OafWDNc0kV1xy7kz0GX96oxBuXCc=;
        b=HrV1ZtrbJZ3HoXQwEByQy/9sBUomEAHI5kZK/NaSXloTr9i4liFHoZx0JkK6Uc145x
         nlUEFpQZ1Fc7k9P3jyVHyYzYQ9Ahdm+jWET8BkdahIALTzYi7nChSk8SdeuUTOMBjhzv
         NHlSrJ/YdM1CU+IY6mZ7jNYEJfrf7t6Hy/raglodpXJ0btuO8lT4+dQEElVUlJtOn+ZF
         B0wBj/4a2JPLYi8ZBlxJ1XUIrz3kmXwTgVicdSAjOIMbN4T3aFEf+jnB9H4sWHDbIqjl
         ZRTgTZmqvzW0nPJfeOMZrvWcsD/utjyIIbUg+/AOrQWv+Amk/YCN24cIuos+n5opacyJ
         KoWw==
X-Forwarded-Encrypted: i=1; AKwUvBwLzH8IoZQnK4CeZqPa7gQVXonm5J8PpG1K80je7CnfyQJSGgRzEqn++yiBWvyU/szxwbR2hkht91VFjVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOmDiWgDUdf2laUlRh/4zujQc1VTbcFl+anQC8Wv7zxZP+HMMk
	OFTh+IDknocJ4H83V7EISMG66z42tb3mcUA4DxuBmCzR+tnq20yU8RPVQIkOibLT9HpZC7olkgW
	qEwOEtjuTbEa9jXBL7jis42N/Ds6xaX/oHmDCxYWcw9xYaYNhJm9Be2H3ua+4Z9JXczffc/2Eb5
	HVEDlgx65xain3m1zBSRKE5QaF8o1kgJVCun+6504srJ55MQtRYgGH
X-Gm-Gg: AYBFou1Cf/w5YnelzIaIv+turbGaSh7hQ6n6VNae9/5Rpb2BGRn60GWxC5334LEgkUH
	hb4e+gp7IXM6ZnDI5Elps9jwe3AA6mro7w3z/7UMu+LzOczl87oL+ra0zCVP+vpaMXCtOkBoUqu
	IdxNRMuyy0nuVI2t21DZIRRN94+5Y0RHROZbZquAO6SnUL+qM4VOxWMiLrx+/JQSG497prnK1jP
	LxmChXFBSV5yZKikP8=
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id 5a478bee46e88-36a4231f759mr4734658eec.1.1793353309979;
        Fri, 30 Oct 2026 02:41:49 -0700 (PDT)
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id
 5a478bee46e88-36a4231f759mr4734614eec.1.1793353309428; Fri, 30 Oct 2026
 02:41:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030090906.298234-1-jtornosm@redhat.com>
In-Reply-To: <20261030090906.298234-1-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:11:37 +0530
X-Gm-Features: AclHuK9KIEENlHpS4wLIfGVb6D26SoMd1PZo5XAEkqihEp0H0825EShVfmY1brU
Message-ID: <CABkEBKZP_NFzoKEgdyTriGZqjYiDUMqOE2jL-NAkGEFBtJF+Zw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fix wrong register read for RU start index
 of 80_3 segment
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jjohnson@kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: lZE_CuQjRFOXMypmDmjRRbTxke0MCMFq
X-Proofpoint-ORIG-GUID: lZE_CuQjRFOXMypmDmjRRbTxke0MCMFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX3rtDIqdXxVWf
 P97pOQLAh5I27wXmLGjBlMxZzKNngyYhUkhsknD3kngWi9sSickQ9tiTl5UYQ+V+QnvQIlNR7UG
 FzbTt9vZ3rAZJCGRwsUWumkuo3IEueihomI8KhjgmZPjXrClkPmAcdmqHpBEb0LqL8oBLKZBR93
 sPDVs1yK93NH3csB/MCuPRCmLafF3UZpqwaXW8SwX259hqduH/YJvTKta+qnSoj6ybzoduqx291
 mwOOpdWRIVjqpqfUq7khNMwZL+VznjwUexl/8uallFWjk/ONTLfNG4SkJSSspZHm6ZFowWWL5EY
 c7RdymR2yyM2YnWI92JiybqjhABGeitOdhoJ1Jk7MUEyHc8wRnyL5+/4/CsIXRYqCQG9NefMM3u
 t2y+izD816URP0V+kixImCmEjhuYRQz/8k7HVn46HdtUkPYIBcZF6hqP+7HFAT0CtuzeyJw5Jjm
 WLyF/xlwtpO/55jWIBA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4665f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=LQZMuA99dPo4G15aSkQA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX2a5VVUPG/ik3
 I+0ZCHXVRx4njwUL8gaxP8KcKwQjmpUl5GWyouOmiUkFbHSCgfKYkZAJJOF+HmUtZwZtxmzO8RO
 a0aPrVuYOEJFmgkLh5WHdlJMxaEOxPU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

On Fri, Oct 30, 2026 at 2:39=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> The RU start index for the fourth 80 MHz segment (80_3) is read from
> rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
> (HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
> it to info2 extracts garbage bits, producing an out-of-range shift
> exponent that triggers a UBSAN splat:
>
>   UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_=
mon.c:302:22
>   shift exponent 284 is too large for 64-bit type 'long long unsigned int=
'
>   Call Trace:
>    ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wif=
i7]
>    ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
>    ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
>    ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]
>
> Read from the suitable info (in this case info3) like the other three
> segments do.
>
> Fixes: 5db19c488413 ("wifi: ath12k: Move MU user processing to Wi-Fi 7 mo=
dule")
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Reviewed-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

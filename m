Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470785;
	b=ve4aqpVfE5eZGdP2Bu+IbW/EcRM05cwNwplBEB/ZdrX6DbCI6lW1XPOGBrS5qbgudi4z
	 FU+XV4u7anoMC6vE/sRu8htQAWn7EVCXRA6Wi+jG3trBNbcYPcdsB6qT18ctUnxN1jxwe
	 HWRMHZ4rQ0X9/mWFbkqVAlWwUJ2Fs4URJdFaXLll1WchkZN+g5LcVR4tckuapQT0jKEOJ
	 3+GUPVb9pHWAKb/QdXcRFdJzP/0xagv/tf8jo/t0VhvL5PEp9c90eb1letYD27BpMo2Mf
	 +ELJ/DYmMz+F8N/uQNdAxuVLrHBfeoSZQEaJWXtI78yGYI8VkQJvTxUlCh271DVl+PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
	b=gHLwpSkF0IzkQm6Et8miUpTp6hxxwKp2hwTYYqjwjBn7FeOBro7pRFKD6GFy2u+g9F4Y
	 1k8uash3Gxu66M4aPXPbv/mNA52zjnvdpsUGOv3ADzbgMVAOYH489gE6mPEER7D7XSsrq
	 0adZeeoo4rkz18f05YYAUiiCtIVkHoGTL9gH40LnUuZnPoOQLWHdgrNtNWv1gd5MfW035
	 mXlx+pk+FLDLD1GgUZZXjaoNwJdMXs5fuw6D5ztZbj8TDvRDx35GcOMJOBLRgPjQDO2S5
	 AVPpg6zZkVj5pcXzc2KxUGa3gpjG6xH8wh/WGW9Wt5W06NJhO5JXBS28sMMNrE4raTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eEi9Scpq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79943606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79943606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eEi9Scpq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zfnj3812884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=; b=GCMGHbPBHiZjGm45
	eihsbjjHclEvPKwF0SXIHt/hk+pqn5tdeALQ5qh+MCit3sAPOuZ4STlimn9hCr1y
	9qBW984mW2+DAbuu5V8aqW5b0NLDQpKF5g6WZbf2KVnaVPMDQvSEP+KObioQpjZP
	ErNVr24Jj0IHJT8vLn1X2Ghh3w77iwaWO6lr2SzDh/CCBVFPzj1GIOuOTGcwBnXK
	4c4dzoiEWBrDa9oUqJLUbvwhqtNbGB/hdkD+Rk0u2CpDiiTiOrWeFRf+//wnQ5h3
	0CXfLJDT9M92fgXuvBh78Vs/QT7Q2BBTxNjJIENM9FvUQJ/V7V0eeZ1S8ijWsaCI
	6z3hJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0jut9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:06:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535131e4c25so81406121cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470784; cv=none;
        d=google.com; s=arc-20260327;
        b=LIw8GBkI6hem75x6UznBSv++3TyREi6UNP9L7xEtTiTbTXe1By9ch8lJvm+Cnt6wMg
         i+1p1hqI3RFiwXrw+tlQJxrfLZJLww3ZllHJ/kTu+m/P85cleVF04rMYR3mlASZle1Oj
         FFDihMu3KBVHrmuD7NkiHInb+w9ZSKa8BDcBZ/+DaLLHgz52iZs9FX4UAR+XWktrpsKL
         IvzWwaFHeFMgA0bkVVVVFCYtY17i3edZ8z6/njluXWIAsj1T9f7nv1MuFc3VEJ48mSah
         ebcCtJXigTHlhF7kzGTzWnYtRMOiF/tPZxwVIl6OMdLL/Cm1qtgd4yD6w8RYArGhjfkE
         RFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        fh=dVaRxd/UJmU3JquZHSKlegmnFViD38+50SnWET+0H7U=;
        b=qEcSnPh0WpSoHQmJi3bp1r48SsoPwcRMK983prjc3W6J3ScFOmRyYxw6WAvuRT6DMk
         /n8LJ0IOUCcMG0s68N+hfmTqw2pGcIQYjLx3OQaJ7TU+Rbb3aTSYA6ZsmIyorEVWvqSK
         V7Glj+bGSHJKYnuitDuOzB6ot5lVOkLgl6glpFU9Zxe7CEk+ZMeZR6ASbOKH5XJVNet/
         cXYsmHVQ1Y1NjS6kFORDv3MUU5ljW6Nz5nmrOfRjtdIlEG+TJkq1o+lP9ehgzfgNNfWy
         mS+HJ0CveuSnUV8tBoJvW7i4zx10lSBVsRgyGrSTfCBESHmDnIGaWmCsENxo1KvCUjNn
         wEXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470784; x=1795075584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=eEi9ScpqVbXsNKE6X8r36/Kp4+RSmNKyJJARwpu5l1bzx8vXjG082QCz7lt9/HitVm
         dTGXkdB53fEyYlTGbm6Du+TNhf4lPBh5u8czaVFQwNPRbr/DZyAmqX1nHilwvGqo7Be4
         9gpPf2YR0PQ0pK+vPorG7NlzwRVHVSc+vQegcp1Ta40lOcmkDfdyltN/9LCKHrSG3+kv
         bhAVnlRgnmRFubtMwXRulnIswWJvPITgbftgLyBbO6Ylh18ZMFfjc/fNVcvY1qEeF4ba
         pXWdOPTBOnyou2aYbHSbB7F2jkhLQ27SdhQZ84ozDi2Wv3X/HYgrXa36E/VF7UmaI8YC
         CAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470784; x=1795075584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=ywkYuoT0aBoNu3YZM98rBtnoOkEIygyoVupq9qhyvQozGI3I4AMzGK5Jq2qLTBEhK+
         e2GPqCELk5Nls2qYSma/AU0/LZNeq/Gx4vO17O6LoWBFygwWTUb6cbGJsrKSrl2TJKWj
         MaV75TRG7beNad9ajPUN6hCUlMqKN8KaE+6br9QTEmZwgZEESpf9pQ7XwHSWT360m7WL
         9mMd6IOBVfvRMS3/9oErPzUGlF/ZgaNQNJuOcIsjxVKG3Q5TPOQMcBxibTrlD+Q2tNPc
         RklslmpeuwSJDNVcQM/P56bHCdfjbWPgY8/ndsdB1Ua1w2iiCWcmrhU86pW/zmSV50t6
         SdxA==
X-Forwarded-Encrypted: i=1; AL+hErHIGQ9QFUP9rmwZYWwDfY0cyCsJMB4M+fa6o/fvyZcVJAjrDyEcxLnIDlMpB/XQPuI8ANIF5r/2ke4noRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iAdT+l2Hvcq7YLN+YCoj8633B6xuW6LdCIioUbjfL1tbUkvJl
	Wqx4K/oNyYkgCFtQ17aAmJXhwGb4qFaNoUwEmkXzmeJ5mMGXNmVMR+JD0BC8I/alp+smDqznaAL
	EIWCnwvzBZgxqrmneAJugnJ9t2wpgd26T1Dt80qbB0e1Qe1e3F+oStjzW3ldWrPegaanTARqZ+g
	rvkjdETJFoBIGwfzsx0y1MEl/7TuYn9XHQDvjEckpgvg==
X-Gm-Gg: AYBFou1GHe9+jzNO1Cekj8zsyhfsosVSMRYjKD/PzzjyjDszyogGx85TrAPTqFqeQns
	19c62nT6GFB20xkFByb5hL+4ZFNvk5dc7L1Obhvols+/J9RAH7MJyNZ0P4FAisqmCq0nwld0V21
	lTa/ObegfRlG/f8dByx7uXcGQLh6/onSl+bpm0fAHcho/xVUVKAjjAs12caA2CBRmuJDx2Z4QL5
	mGYuykrncAwlpnzofvC6qxsoKwYAbB8j4JzO4KecmKm2l03WBavGRclkDjYkpj+/tH83PEXyjk=
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id af79cd13be357-947aff88abemr902866285a.37.1794470783649;
        Thu, 12 Nov 2026 00:06:23 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id
 af79cd13be357-947aff88abemr902862685a.37.1794470783206; Thu, 12 Nov 2026
 00:06:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com> <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:06:12 +0100
X-Gm-Features: AclHuK9LrNxyKqjXo9lhssRniwpPC4kGf-DKVNvzPuscWH2E16tSx8OTAwPwjUg
Message-ID: <CAFEp6-0EXr=rWY5M=L__KU9eL3UDA06q_vmPWdd+CKxR4iEYdA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7 bits
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <Frank.Li@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: j_yzKQXHf7i2b1GDDlufv2K7mPI5HEUV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfXxCC9y8mko9VR
 M1LBVfLnr44HtUsyUUtJA7GyRAIVJDU+nXyO0CnAsBgRQ9rx5m5V28CHgCeoeSWkrfg4dzoM465
 ZOFTrnTN1mGhJYmb+Rs0nWWRKLfgU5JQFU9YY2NFuVmi0WWz4QDUfEKdJulXeuaCA32aYnit8sj
 O44hUMQUqzwmODy31z5B/VkVs3gMEPPVjwcOp1ilJaHT40H9mcTG4IJbYntZp+3E6xmbJiiEZNN
 Fxi5Qg69yEJbu2WLLO+60MVX0rIqCrOoAnPgK0dV7KRH26aWkaHecNIlOZYAZ1sbSKm7FqPh1nx
 yf+35G4/uYBoJbv79JNgk9VRqMdGgU6MlXO0IqiMeIFFQztcogbGhPf3qS5z/GiqL2WZsRf60HJ
 sh2jO40ifOIOBj9SJCprPe+4X/RcpdYRTL5ee/AhRC7DwzT1lm4G5oPF3RVd7FpxSKLbtogk+Dl
 gXu29EZU+eALxM1w0Mg==
X-Proofpoint-ORIG-GUID: j_yzKQXHf7i2b1GDDlufv2K7mPI5HEUV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX+yNf4+dC89qs
 2PKgGUCT7npUWk04FQDz0Bd7N3WPeZPeMZ06/u9ZnWNY2wbwEXClqcSWAPJDOsb4Mt4Khk4rkwy
 NQgzohmatZSQ1Zja04ZZRc7RxllRtzg=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af57380 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=zoG6pt3vYd9LuZ-_mncA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120032

On Tue, Sep 29, 2026 at 10:48=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.c=
om> wrote:
>
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL                                          0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)                                        (=
(n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(2=
9, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(3=
0, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888                          0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888                          0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888                          0x02
>
> --
> 2.34.1
>

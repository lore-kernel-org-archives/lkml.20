Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411619;
	b=bkm5dZ2ps85fXk6NZBymtjo87amUjoXxZlVLdjidqpNsx86MXTHSkCFhP864c15b/psp
	 CaF/D1DrH5W5ao9jstSOVGx3mVJ1boxqqy8QqkgLsaRyC0pTIaznqlCxmm5uyvPD21RVY
	 npBvdJJYV4Up7nQnwf1u1p+bhq/NmO83zjvupag8QDPF1JtlebQuMdw095nBNt4LkatUY
	 vbpHDWDoVzMuDKqAhbO6sL5GUoIT01NuuHfCilW95Ye9sr0qvyqp9bHiOIuV/NLyA1Fmu
	 AfRUbOntNrTyv6IjXewJBRqpRjqJRu+DMl99OuDew9rVudD0ky3JoptYsHkol7nQWUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
	b=u6IJPP0Bhd67qwfqdUNGg4Np3a51xOXFb13LOIDPtbtsEwmc6HvZGq6fH3J5A1t1Pz/v
	 HHAM+hIURiB+jUKxUJJHFzCRlMs8gNZvoCB0jzvv6GiRNuv+TAnNvdFLH6vTbfBXp/AIp
	 ODkozqAfFBQ48VaeXSZHqZNrArCZwzyg5AwTpK6lJNU06uRH8W6/90ZYt94tPEMCavTv5
	 zAlRqHASdQTSDf4MtXUzw6YvwBZgwLFeHuyEEY9tB4zYjm3QYHKaqOAmXjG5iZ5jbXM9/
	 CFUF/Yievzo8pzkyf8Z4Vd8MzRrQHeDlM+u1/18lyDZU/JNnOmd//GsE1l+KpM2Z4cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE59606A8A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE59606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Jct2651104
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OprF36JLM5p
	8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=; b=M3QwgKSxxQJcxSGDa83MrU9chql
	7DznRsYzMHol8NytPvt3D1F2xJjmZ7dbthOA0b/J5D1EodiOHkvC0ns+JiO33T1T
	K0X8/mW6GYTCiciPkvLf9yJh4vSogWBim3GwODi6alKa11Ki6We46ssLeTFXRZbQ
	73acnyKcZNE6fPVGfRl3youG4KSxRumDeKrCNIpH4/ZgK4GE7Hc1IhSozZ/qOkdJ
	W6BHo95e5jnbpoyzkd/qx+2ZxtVCZXc4g8mFRyMYmyY1ShMMCTR63hokMnRaUZ8I
	ry39PhoMrxAMgMeaQN3W1WenZC5Lho3ZexgSJFvWTYn2LyqR/cvuYBmwERQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmberf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc37ee6562so333922137.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411618; x=1795016418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=F6K+7eDABkt7UC+imlBBZ1AEA4ZfVsAuhxpuk2455MVR3z5g8rTJGGrz5TNokawhCQ
         eGEe0h58hYX1GN0mcO7tcueEZmUKgcWXfhy7WJr4W8ZN/OxHjI5lTKBzKqVClo38aziH
         I7sdhV4e14u4935XIbBad+Z7jaicPpIFUzl8GQJYKVM4xHVALHxCkWc9agQiJr2K9FIE
         QKolPWM4xdcX/06T24Dfa77cyhp7YSgl2UyTUDM5kbyGunUd6HPZyEz0U6DFJvAyDCZs
         AwYSD6ycuTIxD7Dmb/+0gMmc9on/GNiX1qa7jOw6WrNDtYwz0+27tvOd0vDsC3C73Gid
         xFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411618; x=1795016418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=my4/H+er+vLf7DIaagL/7B62VCACAuOVZUctxGAA7HtIxZaYXqLhWYGJMELqrUTLzn
         S3nIgqCaGCVmHUQtY/+HFKrZFmhU5+4Vf1W9Am4xLdYK2+eEjNlX4gMtltj7LjtOHAna
         1auLa8qI/5Vj5X6Z/2oBzCmZ8CzvNW434CffkfXaG89yftS2ck+yOwrMbZsyt737BcOI
         RSWgZ9xjWYWQj88G+JD6/i4ajMfBNI4RKluLbumAYUj9kewZXRLJEEEhyPC+8DI9R+IS
         KI3m90YDTHjXRV9MJqiTykZKSHo5XsZkSEE0frjptPRfl1gHP3+A0ttiqwoWdQ87QKqR
         j6Xw==
X-Forwarded-Encrypted: i=1; AL+hErF75oykIrHyPnIesZWSfnioEYSZcmt4xH2qjxlBs6HVoiomu33Cqz9QA1jYyGfvayL/RXDxfVPlAlu1nsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p69kse9KPifM0eb0TgYKcFKROgygPRQwaZjRpdFIeOsQekkSe
	p9IGpzy83PjbFan/sntXmPTd9BRUAaZkurI1LiLffXt+ZL1NNmufSAW9Ld0aZ3FwUhQFOIIJrKk
	KjVgXxbdUBi4pNl3sHhiaK0cxHDce0M7UBeF1jqnwZNoI7Rx06p/zrx/oeYCC7wMNGFA=
X-Gm-Gg: AYBFou0HM8j4jAxakFMtKFh94mazZsxmUYHWqzIyOU2Ou5XxnxJRlAv9/urwbFYwJNb
	LKS6AikippVfT5YkqksOapY9S3/zzwlnBEReEXQpwIC6d0CxZwFoe6+8fzXpB2grSJ8UPeOEIqC
	0SjNE/8NhHgyiVLaZZa3ub5ltICukmf4KXxw7EGGpqqi3nzX0tZCsT9AWvLnRiXlLVPPM778lIV
	hVvYqEpJ02a7owR/noJ8rphsRvt1L8LKax29Te9y5xnUxESFXieXmFjfYRlXb7seAHOMnjWPvnl
	zPljxrW38pw41QvoF11VKaze8oSQt12SZlAD8a8qYBYuv0dWEpD/PBfgejuFLqh/YRQ4EqSjJL6
	Lvc70MI8Xs71/MKFhJT48+rH+SeQlfweOp1xhfmBEb388rws6a0e40KaEPCuFDkjwfW5I7xhgLA
	==
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802012137.32.1794411617701;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802004137.32.1794411617218;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3517355e9.13.2026.11.11.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:16 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 3/8] media: v4l2-jpeg: Add a baseline JPEG header writer
Date: Wed, 11 Nov 2026 17:40:14 +0200
Message-Id: <20261111154014.654617-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com> <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ivyRkgceuACOMZMbwRGdppOsepupnylH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX5GgzeXI9I1nX
 z7gM3ioa2bnuj7QT2YhNpm2AYi7UPLIbFDGx/x1eqOR+kJhbY7wGxlLwQWXuH2gpWpYPaVv1FIZ
 xRjY9QsXIjEHcYhsQiXY/Rf+zf5e+bI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX3ne3kadhm6s2
 nOGi3S6sjtpYutRJ4VEHRUzd2pKhZQuoQlZHBKZUfSsLLYCC+EyN74fP5HEKqCkDi2H2Qtsv7Y5
 Zt04BOq+EDQjBZ/mvow9Aagpw1SbSKUrFOAqlXDoXAdiT2o7dsUJ4+qZgTDyh+6sPKzqgmbd3TM
 wVnX0ktkxIyqK0jvynfMGDAGmHLGahYteIy6dJDcQtOUQOULB7q6ONtr0eGqhobwnhXasP1tBOX
 J8e8BA/lp6BsvLwn+qp8wJaulnmBdobkvRCcpzjzYqtDxcI1cgXzmK2Y9Ttumn0DqgqItgyzLiE
 hyUFfHH6vOOpfZA4DGUkE4eJfwIP4RZ8Owl1ve7UFc+ldmUrDKIyPymuI/8gPsIp5wJE+hGIzkQ
 t2xx4CWdVOWkk51++X35qnFpi/wvdYx5tBNxe2B1ySc7nS9G9XeMhUpAsRYg9Gw4vGUBfh240+q
 LS54jaNxbHP2OJ5Ichg==
X-Proofpoint-GUID: ivyRkgceuACOMZMbwRGdppOsepupnylH
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af48c62 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=l-wiyt6Y1aSZOmScoPQA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:30:57PM +0200, Dmitry Baryshkov wrote:
> > +/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
> > +static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
> > +{
> > +	if (b->pos + n <= b->len) {
> > +		if (src)
> > +			memcpy(b->buf + b->pos, src, n);
> > +		else
> > +			memset(b->buf + b->pos, 0, n);
> > +	}
> > +	b->pos += n;
>
> Now b->pos has advanced past the b->len. Is it expected?

Yes. Nothing is written past the end, and the final check returns
-ENOSPC. I agree it is not clear. I will use an explicit overflow flag
in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
> > +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> > +	}
>
> I think it might be better to write explicitly:
>
> 	jpeg_put_u8(&b, 1);
> 	jpeg_put_u8(&b, params->luma_sampling);
> 	jpeg_put_u8(&b, JPEG_QTABLE_LUMA);
>
> 	if (params->num_components != JPEG_COMP_MONO) {
> 		jpeg_put_u8(&b, 2);
> 		jpeg_put_u8(&b, JPEG_SAMPLING_H1V1);
> 		jpeg_put_u8(&b, JPEG_QTABLE_CHROMA);
> 	}

Ok, I will write them explicitly in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
> > +	}
>
> The same.

Ok, the same for SOS.

--
Best regards,
Atanas

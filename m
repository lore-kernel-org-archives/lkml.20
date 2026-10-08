Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D404D90A0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474124; cv=pass; b=Q3BtXjWVgXU/A2+zDLMtz8Iyp33az2PYmqCFIuV/mVddZsbZzA6P4t6MIVEY3SSNTh4BZ2Je/XjjFQG2QhIdh/8EkIiJpKeO4wtcgOXOaUYvIao8+m0hFxOW88o2kK2uefd7Xgesh9dw8iIRwcKdwn6OznMWGcm52NU5ts1JW8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474124; c=relaxed/simple;
	bh=t20Ga3x8bXqC2bOb7ons2kgZbLzv9IG8A7SxB1EW40M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwjQoPObPV63L2Qf4b46SoXM/9vN7FLF+EQIVTRVGX1K+5vc0a8rEaNLtRSK1NlY0GpXS9fdTrXhWAUdFeOsgrlz38K/GwHILW1utx8bBxNpo43NKSlCz0dDOI90tcZ5VD73iw3KM8brosaWNByUTLovzPhWfzk69a93/nCrs1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEgbYTy7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dclw/+/M; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEgbYTy7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dclw/+/M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EViUq2124121
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 15:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=; b=OEgbYTy710WUPuNO
	RjKY3GPUnKrdQ4I1jXmsmAx1LqtadDZ/Nx6f2EgiEfWEkq3cgpv2/VuROLQiQXJk
	M/6lnZdnw5bG5aX8GyMSWjQtQ7tRPQ8A5tDg30a5gus4fUrwMR38IlBC/WZy6FW7
	3rZYVfCJfmgKB2kAR2VLS253RERTM3jWFTgr83vnvGMpUNrGPMgfzOFWqXo8uXuJ
	TJWlctt4JyOKzbTfu/fcjd4UbVEEsFLCcuytkWiN8u8yktcBcqg3zm5xKmimTU7p
	Z0Shlg4TvAS53Bp2U63xEuo4qjs62+85idT0rSGYWuZY5OFXamARyox3NiKh2YcO
	MP4ZTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3bhtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:42:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8067974so355045385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791474122; cv=none;
        d=google.com; s=arc-20260327;
        b=UtmZI+laMsFkpIbbR921Rme78y67Oa82AxKDANiW3xRWuH60XnnG1ZsWdcLlDBfLql
         YAXx1cBDWTBMB8eZBWMWc0D99q/KYLqie3ayJR8qfNnw1l2lObXtl1naEk9iW7ALKFRn
         Oj2COx0HLxG65z+2HExqKOKkcdXxzk+mhJeTPb3q0GmWeTd7HvHgpxO9aIjT4zbPFBwa
         6olluFpa2+hHjs+gJkPVzbjiQHvNIuTgo8CCDnTLnxUsuNRbEU2G7gclA5vOwW1u01hC
         JkvnmiX+Se/kBcR9zcfVPOthQv4CMTkbQzQWpW8XLMo66qPZQLyx8eXxepBLCP1mLGqH
         yH9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=;
        fh=eTtTE3eq+Uwc8SwSZ9lPeT+ynBs5gg9F6ah3vPkTqsg=;
        b=Uwyte9WbxdDIDkc72c6brStbRjyaOnhw2SH+WPLiUGqEV+An54JQ1+PaLKLgKb+0Qz
         mWAK0zY1UZ3gIcOXSLgiQXjJS/upHp1pXH69N9/VDcXg6l3KL2VEEnV/77Su3R+0UZTu
         gcOgDX4sPZLIjgfDnG7LGswRyJnd+2WdQJUCc7KL0oWkIv7frigur/ezmnk4sAQIMtNk
         /n3vjpcrbaW/iiuw/Z2aCOu/97qnPA1Z9Gf/ZOnGv9urI6YsRllvXBm/Z/HR9yomPyQ3
         KHVA3WyyUK+sDIlupsxv1OE6gb9y89bqQlwKLa1IaKsm7NtAu+ipBNqRRBChYPaKQgn7
         GZRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791474122; x=1792078922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=;
        b=dclw/+/MZlHqkmpvE4WZPn9Wg5HNnSaPMrLce7JzBSNLIKKa3lTwYlFmjQ3hIG3uRp
         TQ2ObAcM+PeAh195McsJAG9Y5h++FVC3hqYrt1HDJLMNv1B/uXLVrlIB9ApbuRXAeO44
         lZebIRDkQ4AYpcYWX7T9EZkIyQA0hpVMLZ7FgnQMF+d2N/3fh2CRsWUAHnmwc4KSXYjQ
         KrbI1MxXb1fxTFDvFc5Ta+iz3Bu4P4AnBkY4rcy7EO3IORP2wMUkyfYf/K6Iwi/SHBH2
         6mZNPrPYrC52T3hIbCe2KOx+oXdCsLeLLnk3IPZNjeoZ/0JKn/hC4B7zwVpw/jwnW/yW
         rd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474122; x=1792078922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjM/nY2k93xH8zJGRXcEc24X+zL/pJP08AQxr27mCe8=;
        b=1PjlX/zKbPDBnY5Pe+ghYSlEvoL62DNpPzxgj+lgYZNGBgfJO6HyRoaYj7AHAK+Yh5
         MyCNBKWknNM5P1kyGaPhFuJVd4OqtXa4EUrBlGP7PgAY8N+h+Qk98CNLF6e2Tip9oA8c
         gO/9606HIBMYVVTGRwUoOVHE+9mgEGN8Pf6f5XjaG/Elz+/D5oFSyqwL8HlyWaL8TaE8
         +yhf1gJ7Y944IKLr4h6fIFGO5WuzSgo6rCpUyMOGatQZqVg3eISRuWmH9KaqHv10rH3h
         aCluNKANsTkoMvHLnaYbgNfx2OP/QwenM54UUiMFiUOMS0uNR1MQayZIWWPRG0vSm30L
         mrdw==
X-Forwarded-Encrypted: i=1; AKwUvBw8IFYYPvWmTeEePb6xrhJmLIlb0wlOozffebBLS2aghkSPlanRdZj2T5u0AhlP9AU1z3losRr3cWCDUuo=@vger.kernel.org
X-Gm-Message-State: AFuF++mbWulcKATIMLy0VefoNLdSh1vbtkkNUvyi4WRN1R0/eqBk0UdZ
	nQccWezuQtugLGqY19pyn/AaSb7EswKjzbW6spvdAGH85qdJhsw4/GpjsU4pb3Q+adCoMntXFKX
	/d/5Wn4/Upavu4P+zWhsIAmcOSZlgaCBM6D3lnkFyRMjRVqU+XrYsIL8/x5yMrmQRpw5PfNX6bY
	VT6BVCrfzcI51rvb96xvpBRs5Pofhc+edIa3bxotcPmA==
X-Gm-Gg: AYBFou2yr1rs7hsIuxqHqRZFmStZY3WgPUtmVMmIcZoAdQr3rZve++4bvClScu7kg1b
	fJsTuIWHId44P0th2HDQ+d7PUKIWmRm2nDytpiLOqSxZJsjjBrv8EJV002lZQiZbR7pNlKkwcs6
	PO3BsLXfhYjRzxcZSlHk3aZMNOSvT1VvEKsTGdr4PakV9xx19DqmRMKeCEmoVBvpD0eBU3m7tTk
	bGgpMtkaBj73PTn5rvjYajqHUup7rMLxhK2wTNtLu4+TyRMKAXcptw7M1HzZ2IqJnXxvK9oA28=
X-Received: by 2002:a05:620a:470b:b0:93c:c96c:a592 with SMTP id af79cd13be357-93e9b7753ebmr1062778085a.36.1791474121753;
        Thu, 08 Oct 2026 08:42:01 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93c:c96c:a592 with SMTP id
 af79cd13be357-93e9b7753ebmr1062733885a.36.1791474116529; Thu, 08 Oct 2026
 08:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
 <20261004-cci-imp-v1-2-227d12cb4829@oss.qualcomm.com> <asS-ppSQ3zHjjVBs@zenone.zhora.eu>
In-Reply-To: <asS-ppSQ3zHjjVBs@zenone.zhora.eu>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:41:45 +0200
X-Gm-Features: AclHuK9ctZbMWTN3PEzNG4CbIi1vmDGf5VZHwy1UaF8tqiYzoG87hLMVrDUMXo8
Message-ID: <CAFEp6-0nLqJ2BxzALKoGzTYw+dgzrvAB9BgvRVtNMZ10yXsXnQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cFWbiU_0RsvFzhg4CmRTaTKGA2XIdS6g
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac7b9ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=eS36LTtrxdnvZwTP-pUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfX7pAl0+mfG7Kc
 EIuVpeSrugLloULcBpoVnXfaZ6PbLq7jpqR6tUvJSVc4XcoqOwCgjFQFkSA7Shyh2Mu2ATYgHzk
 kxqPEcvs/taf3y2b54eX4qYY6txXyHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MiBTYWx0ZWRfXx9j3rTbG9BJd
 EZGAxg8UumgZpdFAxmkIirXfIVwq0327Fi1FL7yHpQerLl37rcQXSFRjXQJCWPdurnU0IuO4Qzq
 LbBTfA+KxcyIyTNuNZYc/kB1LJfUh/xjXaYE1LNCYmJF095K97ucWiR9ityYI8fAlsNsiMLkl1d
 /h4YF8l062j/i6WBzAzKLz1fh3ae5oEf2alJy4syf3GmI17AWP1saSFyfxhgbRFbn/XSJiocKY3
 2TpfIifPDwRcIHmgT79pOWMZHK4YK+3UfNsOk6g3Ebqk9vBZsqdBSvLJxrwT+93HndAl5Q2+tlO
 Qp1+ho5VzuiNwhwnOWm2XtYUlaWdKoAPf6wWaTYlkqKpXlgzDqq3Tw303DpEIJ/2z+S0qZemz+2
 YcaWSJ7WJqjwM70ucwfw0SKQJfj0ya50lFPAAXiLYKidPdUEdrm3vu11T9sxHdJIfW81lrzeQeu
 k1RjkUWpwMo9NFFNIlQ==
X-Proofpoint-ORIG-GUID: cFWbiU_0RsvFzhg4CmRTaTKGA2XIdS6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080062

On Tue, Oct 6, 2026 at 11:28=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Loic,
>
> ...
>
> >       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
> > -             reset =3D CCI_RESET_CMD_M0_MASK;
> > +             reset |=3D CCI_RESET_CMD_M0_MASK;
> >               ret =3D IRQ_HANDLED;
> >       }
> >
> >       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
> > -             reset =3D CCI_RESET_CMD_M1_MASK;
> > +             reset |=3D CCI_RESET_CMD_M1_MASK;
>
> these changes are independent from the patch you sent. Can you
> move them to another patch? Probably this part can also be
> considered as a fix and if so it can be sent separately. Right?

Indeed, I've just been lazy on that point. I will submit it as a separate f=
ix.

Thanks,
Loic

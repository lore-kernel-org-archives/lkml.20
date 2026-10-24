Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830008;
	b=lWnpWiQ+dFBXR7dmBPvP0maWTU+j1Mlkt9CsyEQhGXbtnh64tNY/vmz64EH5to6CDhbY
	 Rh1ngIGDLaGy8CPl5EzF9dRzPboV+AS57mpcVY3JF3ZBzMcg37fT3A+lsQhr/wpy6ejVv
	 hU4PCcjRi75ZcwNrXLzwO4ic2Ls0hdaa0xd0vN0tiLq+Uz51J0OrvEEyEv86HADVD71Qm
	 qIbSi6wth2FPfqK0V+/vJwGm+j+Q/0xqgOs8ShawrNOn6CUFCRlF45wdaFllLsTYxTo9/
	 uthL9qiPEU1DWZFEj6zRdhVrgqsiZjQH3kT3IOmLycP6P/QBXUErQWlNTWbYUBkCTtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
	b=nZg1RxEYNPdejnnG+4qMp2/Kuu+0wOLfAeJZ+hs0ufPag18INl7XIvZNffScpJw+SfRW
	 uzXK21okJsybyEKvCZfQJ2BcCzs4iq71rsgtwBj1ggWpyKuDbtX9S7EuAmSTvN5Geh+Tz
	 CEAsvWI8INvk4wB1+8CxXY+KEPYzf2zQVt9QdZQDHOBzkWQpbDLK42WkYyZ84lu+EKKDV
	 pUMJN3prNrY2B9zhAcJf0ntBvmiZCzKRZG/oy5YQDJHnQuBQ7XTET02DjXpLr4E8h+bPA
	 XRENLZz+mdEudnxcN+RSJZmW9XyXugIPF+L5irepJLyzOVR+jbJOuT4lYUbX0rPzOBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/hwZ8Oz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZbQC5xd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA4606A336
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AA4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/hwZ8Oz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZbQC5xd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O4mIB63961308
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiqvpLecSe4
	b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=; b=N/hwZ8OzMHsSn6NShlRIQTvDMvK
	IZA8h0NGwW5OnPLl60vnRZzQGx65lBVFHtk74eB7yIeciULp11VLOl7PAijBnOXd
	KLH/sENCFYdlNeqxWy5DI+fOlooWeqn1ekHwyT3teSyaUtxjwCPRNVnyX0cetBdo
	HAqOZOK5ZzLGkAZZAucrQnbPeDw5txoNkZWaBZaHMWpqF+eUyPKUOYgL6juHnqp1
	4u/SyKUw3CaL2kJ2R0UAhZzfqEJCSi5qwbwgsP0ub5Gl9arKpH0Ea0U6R63fYvCc
	o4zhYQS8G8NijfdnV4dB1HSaU4S1/YTn6oUrh9UupkK7BePSeO2yBrhPTiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9rc6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:20:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338974c0ceso1226931cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830006; x=1793434806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
        b=WZbQC5xdDBrWar6d0nGaSxEK6YzwzBTmmNnS0mQ+QSm7FWBGWxgOViHD6BZBfLM+RJ
         lFKiQ4P/2ONshM9U2+j85yUrzDhMgv49SOxN89sLwjDdcMYxJ45REhxMQO+MuJ5ZuLWE
         29zwbV/QPGUf/S0K9uDq05RNTrtUrDDRSJRUyPDlHHpJARRwOCE2GgP7pBAHLWmUrVgm
         HaTL2H1UbC2dmX+b3WiWpN7fT82tRN/zuMFMT97/Rjuo7Xnpx8IMVgTxcxVXOHTAiTYk
         Q4mSnH8vXwmDcoUL/Qu1U9+MbwieQCF+oSS/Y3JMSjJc7Nl9o7LpOUj144wQQHEjlLkU
         DBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830006; x=1793434806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
        b=X3Je9MPpRxAihWA1dAEyS0QgHTS3VSUgIqKWw4/O0ooQIakxeDieJ1oZLsMwCCS4UL
         BiGRtQOO5h5clH26njUKTUCXZoXaCPZacoJ+81REGDofMX4X697d9jiSGEGdX1GoXy9z
         L2FLDBUpR97RUKlwKgRGCg0gL0E28jXMcHIFeb9EFgH60QcszaMuP7uBfd4L5VSJAN3k
         0TpMwuk/mgc03EqpjspdfcFhG+S+1D0uSim1wYHP20BYZD+5FMoeAnmwaNSSsoS2JZB0
         1awJKpduwkBmf0BKAQv2FzZS4KbV5G2+yAXMgOf9Bbhj3AYftSEJ1mDchRmBM7WjQ3II
         g3hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkw6IK2f8+jf8zsvhU0sy9rjismhgvcW5Il3OXmXkpxx7jfrMvXoWTWjlt+joMcZ9jLCIOcsRlmfpgKmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYINDfg6WuQF7vj6gq9bXifySeE+8jP16MPi3J+5M20LGUqOLp97
	uEfEP9P1/6Xnp4qt7IxY8YWUdIJ2OKgiWSGgVdykqH6HO61Y68Pt5v9gIokXZzjMM0bbMuSENL/
	GTXGJNTntEMamWNVbK+2JCXIqVq/wOtZ+IeSuj1S+9srcE0GHJi7t89otdFJ7BBqZjS0=
X-Gm-Gg: AYBFou076G1JJg/BoWgS510yOzbTAVIZ4NbhtjUo2fKvgbXqXfkm6+c4WBqRHXGZeG1
	2EJ4Xg8J68R6t7C04co+NZNPel/pY3p9BfL73YzjfybRcZS1L0ReRf7AYkQfgEWOz1N5pwZd/yP
	PD8DWNN2gaARcQt9Mebyk8KA3CD8DjLG4jWnnO3Wz1Ar1SPgFUzdvQx74gig0BFxWPlgYk4zvxj
	aeI2cpvaX38TgJUUMeZoRwcQM1kRyAAbf52ZODp2pxtkgSyIg48H8QRFL614VLhV4fjlJdtmAtU
	XW/L74TtFoF9IxA9jSm2xpgno65mpHnY53jrCFXGXVKiSqRWf+MqDGWZv6iejzVg4dPs6c9imC1
	qY46ffUqhPAN+Ok8tZxk7c/QB
X-Received: by 2002:a05:622a:5e89:b0:533:9753:4e03 with SMTP id d75a77b69052e-5383af10a20mr15964951cf.0.1792830006169;
        Sat, 24 Oct 2026 01:20:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5e89:b0:533:9753:4e03 with SMTP id d75a77b69052e-5383af10a20mr15964801cf.0.1792830005767;
        Sat, 24 Oct 2026 01:20:05 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: qcom: camss: share VFE clock sources by the highest rate
Date: Sat, 24 Oct 2026 11:19:59 +0300
Message-Id: <20261024081959.2887288-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4a88a2ab-0020-41d1-8924-bba8ac42f429@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-4-atanas.filipov@oss.qualcomm.com> <4a88a2ab-0020-41d1-8924-bba8ac42f429@linaro.org>
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
X-Proofpoint-GUID: x5WX-HBHuTRC8EiPm5a7MCJtyUDrfyu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX+kkEsN5kL9xx
 zOVPDGg9O333UQnSxs1xbIeYunzsmS7EQfq0mwb3ZWo8GZwYSonERJgyk9KssJ/5hQH/TJ1jifu
 N6nPoKyKKcIKIchqTP2gclQKI4UJTuNN981qvjjDiabwcm4KXpqA2FDyXQxz4ATBwduqA0SZRpo
 bBAxFo5pqPxwmMgfgCZZitIUTaQhW38eoLrjCuBSMa4OPKpULpG+CGMi3XY5fPo4WC21Kk9McFd
 ATOwe+3sAGRbCfUNa4ZPBBugw/QNs/kbXWJDlpB4qQ9/fRNeuu4942JRs0WtXev0wIEDwNNKCCh
 pPmjZwZ7DdyJkC2Aq7AQxh/PjtmRWjDZwNfpuBuFq7iH9P3ddJSdwAKQJK6TWj82h6owrjqJ/nL
 4nWJzdp4e6R8Dgz3TGBA26WX4CG8J+ypARK41dsf5L21w5V4qZzpfvR0lHsN6zZeJOIj49pb2re
 PEk2Ca3xnw52lezZxOw==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adc6a37 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=7PVpw9Zm12totNsPFDYA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: x5WX-HBHuTRC8EiPm5a7MCJtyUDrfyu4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX6LNEzg7pky/e
 WfC71cGOKpXtWQt86soPsvp5siLpOOy/RaCSazi7TKKFMEFEfOBEY3JvJdefTSTt0MtT6FXKQld
 3pqoUt/bg4L4gKF8Q1+kSvCSQUw190M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240033

On 23/10/2026 22:41, Bryan O'Donoghue wrote:
> You're simultaneously adding a new clock to an existing list and
> introducing a behaviour change at the same time.
>
> Those two things should be split on principle.

Agreed, I will split it in v2. The grouping goes first, then a
separate patch lets the VFE set the AREG clock rate. In that order the
two VFEs never set the shared fast AHB source without the grouping in
place.

> It seems to me as a read this that the above text is the abstract
> description of at least one patch - which should have examples in the
> commit log, to make it less abstract.

Will do. For example, on SM8250 the two VFE Lite share one core clock
source, which the VFE sets to 400 or 480 MHz from the pixel rate:

  - VFE Lite 0 streams the CSID test pattern and sets the source to
    480 MHz.
  - VFE Lite 1 then starts an imx577 stream, needs only 400 MHz, and
    sets the shared source to 400 MHz under the running VFE Lite 0.

With the grouping the source stays at 480 MHz until VFE Lite 0 stops,
and then drops to the 400 MHz still requested by VFE Lite 1. Once the
VFE also sets the AREG clock rate, the same applies to the fast AHB
source shared by the AREG clocks of VFE0 and VFE1.

> What do you mean by user here, its not clear to me. Another engine ? I
> think so - you mean the JPEG has a dependency on the clocks listed in
> CAMSS ?

No, JPEG is not involved. A user is a VFE clock fed by the shared
source, so the users of the fast AHB source are the AREG clocks of
VFE0 and VFE1, both inside CAMSS. The grouping only covers the VFEs,
which is why the cover letter says that drivers outside CAMSS are not
covered.

I can rename it in v2 if a different name reads better.

> I thought we decided for full separation of JPEG and CAMSS/IFE ?

Yes, and this series keeps that: it only touches CAMSS.

Regards,
Atanas

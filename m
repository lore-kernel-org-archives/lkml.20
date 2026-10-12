Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9513A1D02
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799056; cv=none; b=QggFK/WMaewsOn2MVniSzhgdYeeOtfEgPcNK4DQdgESS+7R4t7/HqVWN00aUvgN4G2A1T6lR3vc4glrwmXywECME61hF6hG2jj5y6kzd9WAWvt2B9h8xQks3PmqGuLbi87lFXQ7GQiAgaL5cwTgUJHlPex4d6VLrntvjBtEmBuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799056; c=relaxed/simple;
	bh=RuujOt//5MsOXCo+/CdK6ipbpO9887TpqfzWSfRFAMQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myvRLeUoGRV3A3qaZ+VQjNwW4gBvWwdJ87eSrGVwe+VKIQbxjxmiBK5plLBqC/LgQ9U6tAyRtmNrpV6dFx9JicvaH8u+6kynze/cjLJC9jdfd5sLs22VyRoVKh1zI1Sx2ZmWBumWbMCM8U8YZkQrjz7h+PrzL7+FNP3Cha9H5i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAcWRfyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDCrFG85; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAcWRfyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDCrFG85"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LFYs1754867
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eODGZNkgasAkWaDm+WQ0P24bqfs/DzcNJsQLJCZtfJM=; b=AAcWRfylT/sskCor
	IySCsp/Wqagh9PBfJWV015agaWIRsLDSEtB1ThfAJHdZRorZDrVcNcEJvtsgAu/C
	sR1OUTIBKZt/sLcVl2399UxdDch4za2tX5BrhKsxWhCV9RHwKKLjhwQ7LYjXg8oS
	Q/lErnteyUsyq0hLrrEA8hoHA5YI8fHzT+oC7J8W8V0fH8MWQ9jR9b12rF8FVpk0
	Tj95kyjuAfxQo9sfSIlo9UAAeqUtsCvKdx4r7UAmsnWPpEmPCPCmR6ZzE+RzNMOh
	wwrG+ONZCDYUaVsH2xjmBBV4yz8nOxyD6qJuG65/p4RbDR0T13+lHdp/kXO6y2mp
	y6nkVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7127un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:57:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337ed1ba44so42103971cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791799049; x=1792403849; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eODGZNkgasAkWaDm+WQ0P24bqfs/DzcNJsQLJCZtfJM=;
        b=hDCrFG85BT7qm/ZYr3zkHyaNLc0RfFjiDNZtsUFzl2K1/ptVj+5zrc8UjOm7ZK8FeE
         SToP4ZUWVCVWUI6HTyaAB8EapKcR+9D6KNyLSOchZIr9rutif06d/ShOkjJxtkiN7wVw
         U3tapg3ptjvVfCiUe87ggJU2+DrbnlYBt3NhNO3ziMuVb4/+OMnvt8ZHz0l8VveJ6gVH
         pUqoAz4VImygCmtJ/L7LaI+YNbYOjcorx4XqQ7P/UohuuyNjqSM1UeImt8i0apZOXksu
         bMWyGpHlyFUZlgEMBNblUnKjU6Cuy1yVIQh8o3+dMtt0rWUulSmN49thpBFS/R1wk4Nl
         UJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799049; x=1792403849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eODGZNkgasAkWaDm+WQ0P24bqfs/DzcNJsQLJCZtfJM=;
        b=A2YpuUvG1Oqf09LH14glKahUmTYKb9K5QRkUXyHXawZk2dA3GGQPfmnUPcSivRPbN+
         FbED1ITwXm/nqR8GuG3elEXNkBRdpqCPSZWSGtWwFZnd5otusvC8cdRgjnJU/VbWiYZ1
         B7/cjcEdOJUNEb86NTdCRDW3Dl5E7VNDZpMgn0AZFukcSyl+Zf8bu9qwkS9gQvLEv4v1
         P/g8vKZ+csPmE9BPiPz99+9pzYIq48Mxl0N8mKQjsb+E0gIo/eFIya8vJ4MKQdi1uBJV
         yEfDDJm2YD53LlN4f3vgjsPnW7Qj6fimBZThQLLQqFJYRDGMw5H2kRVYZpTCjmbqq19o
         NW0w==
X-Forwarded-Encrypted: i=1; AKwUvBxMCUfNFRbJa1MCQKkGxMqFSsoCCml3bMFpsWEDnTFO+ka2LZnR7qrAsCmK3J7LQL578l9Xegr4yEMTweM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5bZ40HEH1UK4N6LF/+d+Vh0a2SfeJpsGIYlTA/a+uNwlW3hIn
	sobT8+u2CmA/gc57Ad4uYopUvoGa2tWcY7bsBomvlYDHuoa6Nb113KqSNZ70YwcI7zVbfUg4fR9
	eyl5s31XSA2APcwuA5QoyVTfmPYUEST/Vy+FW2jsbAg5nIKfvuREgkPetGd9mP7TRbIs=
X-Gm-Gg: AYBFou0LfW8JB8r0vHgTjogidj5s0RAzBLkq5fDWDEXaRZLysMICxdWBmsdLytC5kVI
	0diQiWkBa3i13938fEAifzZuzvQFUBw0MHpZnSEa/JG1Pbgph7xYRDZvkVv3IvcZ6qQN2YXz4KI
	IES/RUpxEnmP3sbYQ/xSnwVfUg+hIzCxujmGiVIBslP8gzoMdMpfuPkuyOseFOqYw5QpTPnR+wR
	VJfewIWYbAdVkMi7dvjIscTA5Q8vmShker0U/i101EHMv30RzuS1zpkw9c3HreJRpD1nWgDrdKP
	wsVfkhBDJrlaylXqyR/M0aMOe0/tVzRITxg2nMiQN1mcYqzpVmMCv6Mdve5JL78QRqlAVUSE/3w
	gAD4mtuxc0Fxw0AEnECLGlL0FEHDyeVHiVcC7X4ufIKtIsGTzlVZTZ2+n
X-Received: by 2002:a05:620a:6f9b:20b0:93e:c12c:4403 with SMTP id af79cd13be357-93ec12c4988mr917235385a.80.1791799048730;
        Mon, 12 Oct 2026 02:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6f9b:20b0:93e:c12c:4403 with SMTP id af79cd13be357-93ec12c4988mr917234485a.80.1791799048282;
        Mon, 12 Oct 2026 02:57:28 -0700 (PDT)
Received: from RAMIREZO.na.qualcomm.com (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm322037675e9.12.2026.10.12.02.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:57:27 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 12 Oct 2026 11:57:25 +0200
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        mukesh.ojha@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, harshal.dev@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
Message-ID: <asyvBTR4K6ebxI-K@RAMIREZO.na.qualcomm.com>
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
 <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com>
 <CAGptzHPnOx+7iZhtF+ng4ZonucOH9UDWTnOD=KUnRNGMnS0JHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGptzHPnOx+7iZhtF+ng4ZonucOH9UDWTnOD=KUnRNGMnS0JHQ@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX7k1gNz149Hg8
 YksbFRIeQOrSW/pWM+fD/66K6YtMpxcYZrGQ/V1vh2MZqsT4cst9Kx16U4ftWUoMXm4cUe1+W/A
 BnCnHaiaTcwdCafGLPb5WgagOw5ssVE=
X-Proofpoint-GUID: xnS1N4ecBq8quNLfkrQLV56NTjDtZeBZ
X-Proofpoint-ORIG-GUID: xnS1N4ecBq8quNLfkrQLV56NTjDtZeBZ
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accaf09 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8475QBnM4D5EmyIaQVQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX7eHJQ+U3NfFy
 E4ZtuNOQCNxXZdSQayt8Ow30TzP97K/769/bxYIHGPdL8qkQ4JeO5TsnItMhoPLS8ehaff0FLvs
 OpZ7dty8bPe4hKOQHnZRZASNBdhjA0Jm4tW4F2MLBk0txwX5X00yw8t2yWEZNVq3FdNsRpDWQ5L
 +sJZeVTq0Tg3KOrB1OpvAtOgWBcXaV19XmfJw4OAyn8MhHUtEdLHR4/vStcpFsLNAmo8PpM1S7y
 TcXOkuHwJSQALQzoLpRN1lZg3JKMPzuL/MtSOakUxMw6tdkJqycDd5vUI9nCg66BiPD4NQinKGs
 9GWw0t26+a8hETHQZQsAn1HdrQexKqneZjzMkqNiVqeER98EWco72YrLGfXtB3bCcF9qHYNhYOo
 kGEPbiCwZTEZke8WHam+qY4rEF/5BXwtdUakVIORvE8jHSA0DczipZfMHzY9wStC5NEDM0EVRyj
 xUJ6pbSLYoZjRcm00Mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120039

On 12/10/26 14:48:22, Sumit Garg wrote:
> Hey Jorge,
> 
> On Mon, Oct 12, 2026 at 1:33 PM Jorge Ramirez
> <jorge.ramirez@oss.qualcomm.com> wrote:
> >
> > On 06/10/26 08:41:49, Jorge Ramirez-Ortiz wrote:
> > > Stopping a remote processor clears its cached resource table pointer
> > > but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copies
> > > from NULL when the firmware has no resource table:
> > >
> > >   pc : __pi_memcpy_generic+0x110/0x22c
> > >   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> > >
> > > Zero the input size when the table is NULL so the copy is skipped.
> > >
> > > Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
> > > index ac33a00687aa..a52a7df385ff 100644
> > > --- a/drivers/firmware/qcom/qcom_pas_tee.c
> > > +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> > > @@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
> > >               },
> > >               [1] = {
> > >                       .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> > > -                     .u.memref.size = input_rt_size,
> > >               }
> > >       };
> > >       void *rt_buf = NULL;
> > >       int ret;
> > >
> > > +     if (!input_rt)
> > > +             input_rt_size = 0;
> > > +     param[1].u.memref.size = input_rt_size;
> > > +
> > >       ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> > >       if (ret < 0 || inv_arg.ret != 0) {
> > >               dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err: 0x%x\n",
> > > --
> > > 2.54.0
> > >
> >
> > could  we merge this? as mentioned, it  protects against blindly
> > dereferencin a pointer that might be null. I submitted another patch
> > that should address the issue in a higher level interface but regardless
> > I see nothing wrong with catching it here as well.
> >
> 
> I would rather prefer to error out to the caller rather than fixing it
> here. Doesn't tee_client_invoke_func() already error out or it causes
> a kernel panic instead?

it panics

the advantage of having it here as well is that other backend(s) are not
restricted in case they chose to take different actions.

> 
> -Sumit

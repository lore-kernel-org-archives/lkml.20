Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E051C3ACA5C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801751; cv=pass; b=n2SIhZWtZtlaGYS4GrMoklGzHHd1V1z2NDB8i2g0yL9g2yED+mE7ITdFG6nHQcS/uNJ8iReYXLqs2qbX8Ag5x1lBxJ/myFyVYXS48vBXyyp+MHAITWITUsYYpISJkY7TLhzgkl3qIp/bGetEo+PKSZ/J745eVnO2Gj9O2IK3/kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801751; c=relaxed/simple;
	bh=3js71wal8EuozFhnWmZJAshhXKELMieO/Rt9CwfgXJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrgOrPJ/3oODXjh2xibV7IpyAlzphnfzTh3YYfyeTij+0fK4rWoKQHGmSdn5SDlRihyGZLqyfEe/JGwaX86bjh+XkIbRbMlx9cSVQc88ezs0qWchWk4p622nLECA8Xh0D3RC8HQCGI0nGhsyl/NsSj1qrwgdpZsnsdbPid6niEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wh+glnP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+DV9SGd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wh+glnP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+DV9SGd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA03TL3098922
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=; b=Wh+glnP9ybHEz+Uz
	/XOQXKVBaksswsmllB1jERKb0YlmTqTGRBWnz3ldvr68yrORylUjKqPZRRLEoPVH
	oObG4iri+sbB/5ZsyKVVnVaCkCnBfxaxb7/DhbZO2Cc9YY0XEajuZkLQ+/7uvRdk
	MFu/pEg4OIqsW2tQcxxDjVviN6q/YUL5/4aCfXl4yibdWATSisym4ENE0LIiODLD
	TfvdXtDgaF5lQVam5BB5yv7WBb4ftGEaRBfgOG+Zke3ZlIY+1JzX07L0UR1ki/qm
	lMm+fDccheWEbuyH6YEPQyO6gfH2l9bYUa/c39aDSfW9EMktE93Tlj4wor6WMKwk
	6Zg7nA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr86fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:42:28 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6790b1d37e7so2091958d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801748; cv=none;
        d=google.com; s=arc-20260327;
        b=cWPqU7akMCwGE40Oh17jXMaUihes6Z8fM6yCa5ApVMLSF/6CcMQIT6VogpHul4Beh4
         3QUv/EPYzb609dPbWbWzIpaSPcPcOBatY5EdaMVNo5pA25nkgl7FVTKvHFlJV4cry866
         AJndePbKByd8knGuLXKnduoCS3vRrlnhW72atjOryQt5HdK4xl/MVGEhja323JlbzQsa
         rZ1JGs3x8CrNK0jbacxQXnBBWUssr8R/wb9r8apYo9qsYOizfI3/rtLQnOfe3XxXNWA6
         2yKyfuzRJQ9LX1gmHOSRMIddkRv7Ta8RXYgJ+TpLfOHzIYMVyo8TIITc60gSN6ol73Np
         QmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=;
        fh=PKB5gVgnZX5o8M8XFQwnTqPFlbdQe3LEaNd5lZO6gfs=;
        b=lPh/LYRXN5Wnzqf33Vd43I0PXZm2mdoButT2hdp6qdfnVZ8DHHsc59JDTSC8VGbWrn
         zxArNuC1ckjxwcB2RIxdL3XeMaP3hXOJLsNOO7//z4efZuO2YUx1caDdlBWFXJbImeC/
         DXj6VQcbLlBtVKsZbJ0rnFUPFUZ6hBVHQZ2VKAC6Co03xzHXr/ncT97hYYQxorPeGIJc
         QY0yKAnSXgGjVr7+7pUEUb+mfxMU1f863Syxsd9pCDvRcKuw2G/xEViNZelzi8ay19m6
         KMDVHbtpwS2z1Y/c4jdrMiXt3nrZOoJxn+UluYD9goYfYxTgCITCnk9dDpcuWTah+qP5
         XglQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791801748; x=1792406548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=;
        b=I+DV9SGdpOVMIIUOAtxIzUXtkSmwUl2OkfFHRYT4d4YiiKIFlJ3+lM9dEYxTV209kQ
         dKvIwIj3E5ocvPrgpcVk8aFGDVaOtxCJBEVGw0Wq5GalRxTAKzaBht1bfcQQOsa4HnHo
         w5/82yMLb3YZDuUcUqPTW+CXv7uOoRYsFVXWj0Hk3vgysDnHW82iAypSybAYKV9+e6Ej
         utO2qqE/Ikh6TCQ6jw94CJEWIb6s1ePs4shh1p/gfh8EcUhO2WkUBopc+GxzqtNn2lKY
         j2W56vlvKEpPYOih1aOj/sW3PgQpGLpVcjTNckd+0b5fm8zBH6lkGjGOXrsxgoFNKzd7
         CMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801748; x=1792406548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5x7GoduPw7lXSdRHkHjC3DD/Hv50zIl3fcKRsT0v74=;
        b=VTi6IqI7mxy0yHFHtJM4sFOwNkKYMSUkbQ4ti41dfN1jK0AX2dtdu695fR6codGGCU
         O+8nZvHSsoYbKtLrdeKFQLVs1Bf1rZ+N3b7aZxVza1v/33HeLbZX/9SEQuTogce/JWXS
         NsEVBNAeqXiXv57/qMvRuMfREVn3CyOCB60i2cH46NAfaTSnkZtA67nxaibddDGMfQ4L
         gY2Avew+fa3E67uyUu/DhnX8z47tf9LErIGIYPLNsLKKr/+t3OuHYQYs8nagDvJVK2Ec
         RXze4NNCiuEtmLwWdqRS2Ub6RqZ8E5Jym86p2BgoBT8WkzA1Jt5tuDhbQflM/1rKW0dR
         9ZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzT29wJldOfvWxEauz5acIjR4AlS/pqY05AirOHC3sDWvPcln+JE+YLSl9+ny1AmuPZ2+CMMjxG/nlYins=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkyAv88C+XLAfOXYT+hJ4Qi4lcEDmQra9FMDx4BjL/UUWa5BFo
	tP0LNSUG5OKo+jek9UzH5tCXQyLDWB2MRKwmNNqbH2XtVuV7oqEzPfJ9ElJwL3bcgPLyfr5saDk
	GsOkBaKhzQ9Wkd4vvevV66QdQhTb52yYAiNJtWCpvd5qnWRTMQfVRJgQJ6/lZkeIkGBXgJmunPC
	E/RteMUux5ReYy02m7he29lF4GzIXw8lPuTJq1Dx3wBg==
X-Gm-Gg: AYBFou1Qf41eZSoZcMwWlXWbxynhOkMHgITUB7w3i+tLo82rE1KO+YCHsK/uI8fRFqh
	mqwoJoaSr0oqeY4tQOsNQrRoQGvDyXbX0LOQvqtRv/qz3RRIIcrH/kJQdG/5R5WKJEyU72wh8X3
	LGZFn740CjPrqwI1JViuqXGIxFtjRQO5HQ72YwMjNzGeAbV7SIv+x7A775gfo=
X-Received: by 2002:a05:690e:4809:b0:677:c075:a576 with SMTP id 956f58d0204a3-6793604a27amr1951816d50.57.1791801747666;
        Mon, 12 Oct 2026 03:42:27 -0700 (PDT)
X-Received: by 2002:a05:690e:4809:b0:677:c075:a576 with SMTP id
 956f58d0204a3-6793604a27amr1951806d50.57.1791801747134; Mon, 12 Oct 2026
 03:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
 <asyUYnlZWt-ESGut@RAMIREZO.na.qualcomm.com> <CAGptzHPnOx+7iZhtF+ng4ZonucOH9UDWTnOD=KUnRNGMnS0JHQ@mail.gmail.com>
 <asyvBTR4K6ebxI-K@RAMIREZO.na.qualcomm.com>
In-Reply-To: <asyvBTR4K6ebxI-K@RAMIREZO.na.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:12:16 +0530
X-Gm-Features: AclHuK8SYeokotpnm4k42NtJjHxPe1iuk-XJHNtnkG-wqRiaHN3WTmFDP13zk5s
Message-ID: <CAGptzHN3OQfLu=Ry4Xcqy6RtfPpYjVwvfZmDyrZNoK9G=EXyiw@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org
Cc: mukesh.ojha@oss.qualcomm.com, konradybcio@kernel.org,
        harshal.dev@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX/Anni83r2pZa
 lzruidh8oNtU43yah2vB4bN+EM7qSPZfFvnJoqjJ+lHAKH0botTbLody6si9qJeXZ7HllW2PefG
 PpYDCkPBDN3gIHkSWRtwhbAPAKTm7mcpKQgziuthcATpdc75q5OpbLQhtzG4wdHtA11c+hPknML
 UCDhB6FkfH+cguXV82a17ErQmVulNtrPWPUoE5ujbTu3Iq+w1SNmDbVDuUqMYnmcvNgtXqoRTVy
 bipXVvexglFjHCV5b7GlLNuqUHjU9Gm0DdpGSh8wneWUj4aIeoyp8+VbjyGXS5WCDpibK0oc/hw
 Ln7IGyOE9Uh/iS7BpAmSOpsaxWF1pSjwbrh2uUx0rMOkrrAybZRVkw65qSbFkHJUR91jIACgxPZ
 6RKPi7FkDU9kTJFblCXa9yMEJIy++6c0Jd94nOHrIoG7WHwWedoqHyUqWYQ6B0B2S+9B48UoV3R
 IVrcAJ+7gRNqzkuXLJA==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accb994 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=BPBVSY88CwwMiwvihUEA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX3ywBHHAumW6c
 FdmBCwLQjndDZyihgXOgJcpG0+/EU8OdYOzfCWwovk6qsQyngr3A+gAtY5FVrekDVZVwQu65GG9
 fnpkmpbLsbR5/Ii7/nm3GGseroDdQUE=
X-Proofpoint-ORIG-GUID: 1Z3XRunRT46JXeFzFB3KCr-W-P_GPE4q
X-Proofpoint-GUID: 1Z3XRunRT46JXeFzFB3KCr-W-P_GPE4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120042

On Mon, Oct 12, 2026 at 3:27=E2=80=AFPM Jorge Ramirez
<jorge.ramirez@oss.qualcomm.com> wrote:
>
> On 12/10/26 14:48:22, Sumit Garg wrote:
> > Hey Jorge,
> >
> > On Mon, Oct 12, 2026 at 1:33=E2=80=AFPM Jorge Ramirez
> > <jorge.ramirez@oss.qualcomm.com> wrote:
> > >
> > > On 06/10/26 08:41:49, Jorge Ramirez-Ortiz wrote:
> > > > Stopping a remote processor clears its cached resource table pointe=
r
> > > > but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() c=
opies
> > > > from NULL when the firmware has no resource table:
> > > >
> > > >   pc : __pi_memcpy_generic+0x110/0x22c
> > > >   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> > > >
> > > > Zero the input size when the table is NULL so the copy is skipped.
> > > >
> > > > Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > ---
> > > >  drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmwar=
e/qcom/qcom_pas_tee.c
> > > > index ac33a00687aa..a52a7df385ff 100644
> > > > --- a/drivers/firmware/qcom/qcom_pas_tee.c
> > > > +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> > > > @@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struc=
t device *dev,
> > > >               },
> > > >               [1] =3D {
> > > >                       .attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_IN=
OUT,
> > > > -                     .u.memref.size =3D input_rt_size,
> > > >               }
> > > >       };
> > > >       void *rt_buf =3D NULL;
> > > >       int ret;
> > > >
> > > > +     if (!input_rt)
> > > > +             input_rt_size =3D 0;
> > > > +     param[1].u.memref.size =3D input_rt_size;
> > > > +
> > > >       ret =3D tee_client_invoke_func(data->ctx, &inv_arg, param);
> > > >       if (ret < 0 || inv_arg.ret !=3D 0) {
> > > >               dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d,=
 err: 0x%x\n",
> > > > --
> > > > 2.54.0
> > > >
> > >
> > > could  we merge this? as mentioned, it  protects against blindly
> > > dereferencin a pointer that might be null. I submitted another patch
> > > that should address the issue in a higher level interface but regardl=
ess
> > > I see nothing wrong with catching it here as well.
> > >
> >
> > I would rather prefer to error out to the caller rather than fixing it
> > here. Doesn't tee_client_invoke_func() already error out or it causes
> > a kernel panic instead?
>
> it panics
>
> the advantage of having it here as well is that other backend(s) are not
> restricted in case they chose to take different actions.
>

Ah I see, feel free to add:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Bjorn,

Since this is fixing a kernel panic, is there any chance you can get
this fix in for the v7.3 release?

-Sumit

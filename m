Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1F37F8DD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194656; cv=pass; b=nzWF2bfZTuFwsftt/P4Qvd1JlDBeCmB6dUAXz8OMXFo165bSZk9ebVrG0nj0xzsz7qlrzzDG74ILTpCKXfcStOCc4lukwWjo4duScyNQ6XTYtBM+Y8XHuu84nWXnLXP7NaWw5VGwIV2bwejeqg3y5YGvMOr4DDr3W8ilhN/28xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194656; c=relaxed/simple;
	bh=k2spEhPKKDs1hsoa0+BsiKrY1mHQ2Y7FvSFpHY4YUxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RX//VY0jFZCa+63NFVK2JKd6fKcG69puS4Gi5JU8PY2cwDHA0DrdCC2tT0DfjqPxzHQiNJh0OvqR+hLI1qfTK2OQUlnVtouZSkz3frLyqFWeEuQUKk1HIeOGwaAFF/66fUJSHVl+BPjEizccd+dPcCKADFDb21XVMqe9zaLh9u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkX5UsVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHHL/Th1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkX5UsVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHHL/Th1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xZBi2425840
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 10:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=; b=XkX5UsVyg1u3Q0GZ
	KYC0Jwvkvw7s8pazgeqorwlp/VselmEAkfKgWvnWkLPezyLE2Kqr0/xmwc2P/mC8
	Cc+k9tgI/m56FIVgPauEGISOam4c7WOJF/njkInawNRxsCD3A2rcKXonm9r8yV6h
	PFuFwcMKS1CPxe5vsQk9K4Dpyd3Tpd0jQNDvV7gCrdFeU55xbiP1YMgdK3BbP5Ko
	8b0+t+NjBy1T9iLZHEbycfK3GF51lFlhB4Fy/CxpwBJnp0Oq+PLKofgV7juxTzKZ
	e1YrwottOZOGhmd96nDWHLdkr0g35ZKQOIoSoRZ77dIn2oXzk+OkGqAvKFm8jpJL
	VCQTXQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr6dcbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:04:09 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8acb6172b5fso19203277b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791194649; cv=none;
        d=google.com; s=arc-20260327;
        b=CvG/9Mq3HFWS8D+m0BoSeNSGb05FpEMttmX6e1/bpDWLmNtlNd+ODSZVUVgqaBvLpK
         MzL2tArPJe308INiYJr5LGiLU4K/dZy342gXH8eY43SRl48RCyV0bIW48zarpDIRILoD
         MTmHEaKN5e6FcmdNqhZHJ8xK8KXgfNH0iaJRbBPlKBA25VWAnXNSw59p3TRzQsYDlmJt
         i7jLBAti5m8VrC7I98mBXTEH0NoTglwrjkxThtMcWgJbO6DOncH7ubyXcKLA4X5sBMgZ
         nIGr0wTn5N48ur/jWsIx+dC3TwotDZQ+2LOylmDosKABT7P9BZZ4kM4+Xz4cH+gvo5R+
         e4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=;
        fh=V0ulcrckUrI/8Xr/1Rs3jECwlZZ6v2Mn7IS0ItFss/Y=;
        b=GWDJIrG5+Y+HCrykoN10gLBt84DLcsCBjAX4wcyGt2E3oWqH1xv9zwO+M4Q1ruN7Ty
         oWxTIEZCD8AhtIJd6BGDuZw85QZrT8aEg9UyEb+Zm/fnR92pP25FukgR+FBPSt9/TB+O
         MfHK7Aun8V9SOnYGcLzn3es3w084bnxgXBJzSkEghKEPxdMJJ31Z4+0VT4H5sv9DaB+B
         WXynbIQtRlWqWg8zIZ07KkVoJs6gtLT7kjjkjWAZAuH6sOKD/kxIdqxPqhk7IVocjwWk
         UCcs94w+KgzTaVINUdEnzJz2ar7y3sIl2ZLjpxpl7xFg2ieRTJfTqmhrxaOS4sxhdL+D
         qLLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791194649; x=1791799449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=;
        b=SHHL/Th1VwxGCqYvg5m4lEwQPab1n7yG93x3r+e8toSNy+udiN1BCZwDJwSNP1tAhV
         dma0eNfCzYjEIxw8csc08dnPhmsOIgw8CplT1ZJA7GBH1Vz7R/OAeFxuHV30qizUh9BY
         dUb1vbA9eno+n5i5T5hAul549V30pBeqB63P+qnq227kCldXCTdVa/pi6TyCGr9H2wO5
         ttM2ASNj/tbUene8gbXYinwZIXPNCpqiz6vX4iSN1lBdOzJFZE7rdTPoAVq//ESg4G1g
         BszMaFp9Tae2wqbR0y5dj4TQ+Uxr2dPI82/0mq6KhqCsB2EoG2SKW+Waspa7hi2ZKbHK
         VW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194649; x=1791799449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqR2VsOJHxm1rWLbQhiJEicrbZzmNLQLjY+Jd8gYyV4=;
        b=SNus3Bs3h7Mq0VvmvIsTUsgbIrFeKjTPTgCveUXsB1uN/dgtxQ4isUMqSrk0yC0xJm
         ciKJd2PNlwnXm4ePTDs8EMxwAWn5ixcWCZrBO1m7QHcNDA8tOWrqakVCpZpmkcoHAiN+
         Dlh9Nnu+SRlIC1U6DXJFlHNyNMzv5Zf6HN7kik08LuoMNd8FxOl++/C9BJHo0VZOoCn6
         BHYSRbfO2vkcz/jh3tM4d8xbentC7UdIaj6Cyah05YBNHbb1MT502/4GoNznKMk2DRUr
         TYrWOzFj2emj8mK3/8fkCO4hEDVVn6mKas+ctyQgFkG55+HTlPMHWBoUv9gLjdzuNq7H
         HH2g==
X-Forwarded-Encrypted: i=1; AKwUvBz5FDoCbMMGJ/5OloQP4ZnK3GMRFWBmbIP/1pVMX9u7FHJTLrvyxX0N2Ku3ZtevFNd0X2g7uYW4MHwJr2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnDmNqm+DHfbcgW2fB49/SqaX7hlk3EZISuGPBQxkK0W2ZnKoi
	LZ15zHxL06xImDPYXZsQqUL6hsMtr5x2MFa62PA9XkMMRea0gXAc8tB4jpWx98NXG2ACR034shr
	GJgD1BoUDDD8bzHdqNfC0+jPKjzX7CJNHfMYQWGommnwTG0P73gT01HOwHy94ymqsuOB+TQG5/b
	qqaLh1on5Si8nyBI3ZNvEVejSi3BbB+RdZ6KDGrrr1jw==
X-Gm-Gg: AYBFou3eDa8S8nah3sA3RzBzxIorIXtnr9sSZt3IWRcj/aU687ngBeu26zCeY0C3ytJ
	//3FyMi/3u/Hyj+zWEyeU4RHzC4Djjt/UJukv/pFkqFhsrn6iw6pA6r2C7dy4AT3VxQBkrsQke4
	hkNn1dfDxVmjL0ZAO7Z/Ue+o/UL480B74GAXlQRfEtxcfN6muLVe2I8EmPcKs=
X-Received: by 2002:a05:690e:4808:b0:674:1cc0:3523 with SMTP id 956f58d0204a3-677abe3a67cmr2176028d50.10.1791194648676;
        Mon, 05 Oct 2026 03:04:08 -0700 (PDT)
X-Received: by 2002:a05:690e:4808:b0:674:1cc0:3523 with SMTP id
 956f58d0204a3-677abe3a67cmr2176015d50.10.1791194648059; Mon, 05 Oct 2026
 03:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929092939.1806907-1-uttkarsh.aggarwal@oss.qualcomm.com> <arzNOP4jBd9uqnGv@hu-petche-lv.qualcomm.com>
In-Reply-To: <arzNOP4jBd9uqnGv@hu-petche-lv.qualcomm.com>
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:33:57 +0530
X-Gm-Features: AclHuK9oHSdFJXWHB3qCGwtJHa-TWOaryqpxlOsBriiYH30mtE2nCh7iseTF7SA
Message-ID: <CAHBxaDc+pZ3+04iZsQwABrTEnbcFVi8oD7H5LP1ecyyOqQrziA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Set ucsi->connector before enabling notifications
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX2BMlC5OG/au+
 YvkA++unBO3IrfWWo3raAbIEiHe5rrzEnW3eK0Dk58wwwpzzZPMW61hZvgJEskD1fWIORr4dYV8
 gJj8bmb4XQeNIJG5JxSZUa0sv+FvHQ8=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac37619 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Xu-oKv-mTIZ1_Gn-t1YA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: AAg6uScEsj3Ly2bS5xHYJsvnuBNlED2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX4aQ5rBa2pw9R
 l9lgQooWi5B9mbM9/vmJm2LaF9uJs587hBl0QK+h4pr8PuU4kL9vtbjFYVG3cM2NddGa4oIcJBa
 IrL9e0kerCjfRfqQjq45JLEgwvlxNtmpqKTDraRKCkrbirJOREbtFb9TkW8zjkPAIrCVdZWouBj
 Wtx0HIVvTAHXolGVczVmfY+T/lmJ+Y6lxYJBwc87qWimOxs4IcQV8CsXRMH3goshb9yZC+0nytn
 L+PzJlDtvJEovftIgBWKKsYsBRwrkvMVrdYln5/q60ZNuGFs37XQAtyUUwP8xYgIOwxfrWVnmKG
 0IpMO64fUpXFUseK3y6IsLPrdfilPK9PmMU1axpwBPhk4lr8WSC7btG3Q3ZMKW9tm/5ZWucz/VR
 XANhA/yTIOVVSeE5Br9Czy7guEbaMLin4znG7ulxldRaL0gYhvhQoK7Lo7rr9j9U3+C3qFOLHNG
 PoUzXpC9kb7+hKHRXbw==
X-Proofpoint-ORIG-GUID: AAg6uScEsj3Ly2bS5xHYJsvnuBNlED2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050039

On Wed, Sep 30, 2026 at 2:20=E2=80=AFPM Peter Chen <peter.chen@oss.qualcomm=
.com> wrote:
>
> On 26-09-29 14:59:39, Uttkarsh Aggarwal wrote:
> > In ucsi_init(), ucsi->connector is assigned only after the
> > UCSI_SET_NOTIFICATION_ENABLE command completes. But once that command
> > is sent, the PPM is free to raise a connector change notification at
> > any time, which is handled through:
> >
> >     ucsi_notify_common() -> ucsi_connector_change()
> >
> > ucsi_connector_change() indexes into ucsi->connector to get the
> > connector and schedule its work item. If this notification arrives
> > before ucsi_init() reaches the "ucsi->connector =3D connector;" line,
> > ucsi->connector is still NULL and the driver crashes dereferencing it.
> >
> > Fix this by setting ucsi->connector right after the connectors are
> > registered, before notifications are enabled, so it is always valid
> > by the time a connector change event can be delivered. Also clear
> > ucsi->connector in the err_unregister path so it isn't left pointing
> > at freed memory if a later step in ucsi_init() fails.
> >
> > Fixes: 0482c34ec6f8 ("usb: ucsi: Fix ucsi->connector race")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
>
> Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
>
> It is better cc the one who gave you the comment :)
>
> Peter
> > ---
> > Changes in v2:
> >  - Add Fixes tag pointing to 0482c34ec6f8 ("usb: ucsi: Fix ucsi->connec=
tor race").
> >  - Add Cc: stable@vger.kernel.org.
> >  - Link to v1: https://lore.kernel.org/all/20260923060434.2599545-1-utt=
karsh.aggarwal@oss.qualcomm.com/
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index bef3f9b71d71..8f7b73a9f4f4 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -2122,6 +2122,14 @@ static int ucsi_init(struct ucsi *ucsi)
> >                       goto err_unregister;
> >       }
> >
> > +     /*
> > +      * Set ucsi->connector before enabling notifications. A connector
> > +      * change event can be handled as soon as the notifications are
> > +      * enabled below, and ucsi_connector_change() indexes into
> > +      * ucsi->connector, so it must not be NULL at that point.
> > +      */
> > +     ucsi->connector =3D connector;
> > +
> >       /* Enable all supported notifications */
> >       ntfy =3D ucsi_get_supported_notifications(ucsi);
> >       command =3D UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> > @@ -2129,7 +2137,6 @@ static int ucsi_init(struct ucsi *ucsi)
> >       if (ret < 0)
> >               goto err_unregister;
> >
> > -     ucsi->connector =3D connector;
> >       ucsi->ntfy =3D ntfy;
> >
> >       mutex_lock(&ucsi->ppm_lock);
> > @@ -2143,6 +2150,7 @@ static int ucsi_init(struct ucsi *ucsi)
> >       return 0;
> >
> >  err_unregister:
> > +     ucsi->connector =3D NULL;
> >       for (con =3D connector; con->port; con++)
> >               ucsi_unregister_port(con);
> >       for (i =3D 0; i < ucsi->cap.num_connectors; i++)
> > --
> > 2.34.1
> >
> >
>
> --
>
> Thanks,
> Peter Chen

Sure, Peter. I will take care of it. Thanks for the review.

Thanks,
Uttkarsh

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1DB46C4D1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323203; cv=pass; b=uu/qcnMjrZLSyz1LmnEAeaagv+fZUYZ9xE16PmJed9LOIlCdqF2y3+rWzJpK0+Zth0UQqnSwf2QKrJUr+F5vKJ8JpvE05ym+ieVHcJ5ySH844apEH9zGrhM9vOqsRiouf0zgZP1Xf6p48cwA+AWYULklHTi0mxR/S6G+CmHClAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323203; c=relaxed/simple;
	bh=YQpyFzYuFJ7F0ZueHz4NBOojoYTV30GESlmU6P8CuI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=To9gWqy3o8X07DOv/SY9n5pvSrYZw7PcuclayYxFWTHIsOa2gJilbKupHo0uoBaFoLZ31lMfCGNvQGAmWaodxhew2a2RJY6lvw1zNvP5IApNr7qKq7jTapPEmpYRoNhQxZjmdsz/lPUMLwJ7+hlXx2ODf2fYwhHLMI5HNSS/sZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifB/q270; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiCsivRB; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifB/q270";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiCsivRB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5Ivis600642
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=; b=ifB/q270N8HZGNGN
	rrhUgJLb1DTsCo/Q2xbWcEu0faHe7ndbWuYQm7o5h/XtZ3S2lPtTMidKI3tixGEv
	6yNf+nuEDEzkdF39DApd21AfvrHmm3IeA9mtuP09PaSwnaSSY7qqJdL9kyxH3sPI
	IqHE55cmd+Li95koIMYp7VQz3Yo/1fMeYtIiHfjJFebcrgQpzViRxkBGiTIv7Xtg
	TCOvvhuCZrEUwjjGkHFYskBHhIlpSLn3G8NgQ4sokbajPrr45ZMNiF/8PlIyUqGa
	tlD3LdILYI/ulQQxJIA1tVdR1xEy93E0m7XHthJ/Qaat1VJ9/MUif+V1qA0gHdr2
	GfAsFA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvregx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:59:59 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8546e211940so9192817b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790323199; cv=none;
        d=google.com; s=arc-20260327;
        b=dlBnMJxc9qsIsllYNt+gQDOzniZfYYDJLedkDtMSb80ZTkcpi8+A1n5ufiXi7d/g3d
         BzxNqQGQBIYEZe2XIPwDLtHf0FZ4iH/U1Ko+CBwPO4Bq+CZzjfirFOhvZrCSXkdtJmHs
         taENeaUasFdML1vodoOHkgb+EX6NL/ivv/U/vLJ/68yBtyBTdGMLQ1pbLuEDMEV2gfh4
         ypeorzD9EM6MNVpD+Vgdw0teuY1I4ThgH2gujpw7Rrs/7c+sM2gMLyA4pGHcKfESoKV+
         9czY4szTyN2V78AYqZ9wQXJ+0fThMcnkqntzzSEHeF9Xt+v1JdT4xplGZ3VXm4oM473r
         08ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=;
        fh=t/pylBcnqmKj0/A9ZXSrnut+5jTBxA2bvPI+QKScBwE=;
        b=Rm0hdJGMusSNF4HMilJw9wjnibBkXPhFxE/rOrmjbBO626gR94ImDM9Kz80FnsjcFc
         +XzpySU0MU1OWPdcjTKMCG+Lv4P+46VrWO0zH77ZIQTv9vApmVyMknUP8gozWOKx7FLL
         Utb/b1CvNoma/rQZ9Z8tqzBiiwNyt6oSTFW35KgKxQww8PLEZRwV3hSDdGkYDzS9HuUs
         fj9hdSt3lBn+cBnXk8DL04VCU/Z5Jm7CEAKyjnrDFik8HRMTbYAhHIUo0377QmY0y9fQ
         sJUd1WRQs8/YhKiAve/zjKVeOmhEjPAqaNzqx0ulAO5LuVlN+2LGe2DdYG7v+JFMZrZd
         oraQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790323199; x=1790927999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=;
        b=PiCsivRBXKdUE1h7sdAOdcyhQhJlZt3gqQHadJL78Y1OyD+GeToiEP/4ZKWeAfzke8
         lIc9PayOSzUkkitfZLwNGxa6OfZMG7IFlPWnkHomWBAoVduvaBYYXtm15JFeHhGjLJE1
         0PKlcOfU2ekGv3kszT+BYis0Cq4+7JxDp/2Val+eA/CIyzyXgJqK5V2nUWOE975tJTMW
         2sR3Mlez2C9I2tIDODCTBQI+H1aCBkbnm/mnmVKy2nu1qMxS50050I/3+7F5bZ8hZlwm
         IksdNvWo58JhukS4enZJjXIbvbkWd4zDdpbgX+I5faAY67uMY7YXT0FPZHk8TV6BJiIt
         erng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323199; x=1790927999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoYemRht/s/cq9u82m4DGv2O/LJNo8FWdUT8fX5vwGM=;
        b=XSptTP0d7O846jAehZpE42cDK/DC48JGIlgq7IFZC6BSeFdeGcaMvZHYZqc1jLWrJe
         opfA9cmSOZ7RQBZiW8563xtsHZTjtogKrAZA3rLqupBQd5sXcH9sfEMl6i5mA0V0h29i
         EK4iYekHdM3YUa5iyGiHDTBQ1AWd1EAsitTae9jZWSCPHNAlGoC5ey3SZC1amCc3Gh6y
         qUukeHxo2B98NyxzdXETaerV/YtIydrVMEYvxa7sh4P6ojfO+F7QFm/+G6fmXlG5N+Th
         I0/DDN4TVZDX32lIjA5V8o9PbFxDp8F+bSQxFhZgi90Ybpv6gMSoj7vZlya897AqXTUX
         9frg==
X-Forwarded-Encrypted: i=1; AKwUvByTJpEuE2e0vANsyCHBPCI7ehU47RCYXaN3kQv21UmIqB6qJnewZz5jYOkVRBPDmT0DTEUIkJqsqwH1zN8=@vger.kernel.org
X-Gm-Message-State: AFuF++koMgi5Ecn5Gi2oSM8dcBh8qcAIjeUpeiYRcWjIYw50tUTiCRIC
	VdRHPT4BFJ2Vi5zdomrV8HDX+Bw91m5pxkA8AGs8L95gbd44XCjlfYYziXN05hbXdXhah5LnEgz
	bV4woWKzqe4Mw+uLJnh3lJGsmKnZ3DClOeBfRz5HZ1Sv75IZ8q2cYWz5Cy7v6IJUZmhv0oU0vMw
	Ac/oieLe2LrJQ7T0optKtnDKodKiWV45ar8SOirIokug==
X-Gm-Gg: AYBFou2nrCV4LDBfwCyv8iUj+o3e3ky1S0zRHiUNvae8yygBrvVLdtoKXuKy8H6TMuT
	uDKVzf6MQwrRs+0L4USOtG4UMnu+pT9QKm7dvmE33twDDR61LYNEYsagK1EBrURQiYneFHdVnVu
	WqigOV/cMwM/yccbXy1zF1b5tR+QKqhaxtHAyjlT6zC2Gdy84F88zHSJ39bA==
X-Received: by 2002:a05:690c:94:b0:89f:d85:f31e with SMTP id 00721157ae682-8a6490b6b58mr24382427b3.84.1790323199390;
        Fri, 25 Sep 2026 00:59:59 -0700 (PDT)
X-Received: by 2002:a05:690c:94:b0:89f:d85:f31e with SMTP id
 00721157ae682-8a6490b6b58mr24382327b3.84.1790323198905; Fri, 25 Sep 2026
 00:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com> <arN-mTL7YwNSJKjX@hu-petche-lv.qualcomm.com>
In-Reply-To: <arN-mTL7YwNSJKjX@hu-petche-lv.qualcomm.com>
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:29:48 +0530
X-Gm-Features: AclHuK8zdLFfkFZIJHB-nPGrdwt0768Gc7Z9R6lk2WXRej6W3bqG0Ymlo7E3VoE
Message-ID: <CAHBxaDc0_SvyX5Ok4nqkPZTHoPJRyjHrFSLQWK=nMJ5piJAoNQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Set ucsi->connector before enabling notifications
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iLUH3DMQPx2nG4Z_J17M2eWoB9s06cO9
X-Proofpoint-ORIG-GUID: iLUH3DMQPx2nG4Z_J17M2eWoB9s06cO9
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab629ff cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=7XFAkDuODWGRFg0CrWoA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX5TR1g6jLWBhT
 RmIgjkmHgLWcNuTvekfFx6488gnq4mhZoNFgVGdQBeQqqfdeBTTKlLJXZvOfHh3SxCV64+Xg0T9
 jm3S/Vx3bCx0wI6SDYW/zWcr+y7yz88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX23jvE6Sqf26K
 Tq4PNOCrZvctzjEdyiqWXpzjL0rA05OsL6IhvtdoMKYWLzndauCondCNbyCuODEz4/xycNI5GMu
 vSUaZDqMirpRMqOKNLeP2HKc24M8cq4FwOfjKWBBWbFUd/Wx797YG0aVMzGb1+AZZuSBpD9sMzG
 P+AXItftC5T2nhDqjfx8SrpY3myAk6jNVG+P7j2RNvrFGBJM4kTVk+SqM8GlbwhQPQba15EBCEI
 gv3S9A8w9+5busAWcUOQzbfNNHua9MkzICLC525Xfu0a59/tCemo4qwczdDNm4gdPR7QVqjwiTP
 szpJrO1WZQ7IVANTE1HSQBOY4GItjVCQY5JNcAo8WPk3Ws3iwEZ3SGKzlJfIrA8UmdFQOJ0qmb/
 3UdnUfmpakrH7rG5IFBKICRRWSSCvCLF8s0tG2gHeJGNLSgBfHw/ULIXGzkY5fq45soaq/8hFMc
 lL6f9RoozEbouAC//kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250031

On Wed, Sep 23, 2026 at 12:54=E2=80=AFPM Peter Chen <peter.chen@oss.qualcom=
m.com> wrote:
>
> On 26-09-23 11:34:34, Uttkarsh Aggarwal wrote:
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
>
> If you have logs for it, you can attach it.

[    9.344626][   T12] Unable to handle kernel NULL pointer
dereference at virtual address 0000000000000038
[   10.264527][   T12] Call trace:
[   10.264527][   T12]  queue_work_on+0x24/0xcc (P)
[   10.273545][  T558] [03:35:41:266-E][
558][charger_partition]get_charger_partition_info:684 partion: sda
start 519(block) size 256(block)
[   10.285497][   T12]  ucsi_notify_common+0x6c/0x150
[   10.285498][   T12]  ucsi_callback+0x1f0/0x310 [ucsi_qti_glink
582e698363365d861463162e2b10d3a93557b748]
[   10.285501][   T12]  pmic_glink_rx_work+0xe4/0x1d0 [qti_pmic_glink
9f1cb39181e1207dca3707d04498cfe86db1a757]
[   10.293012][  T558] [03:35:41:285-E][
558][charger_partition]charger_partition_work:1389 get partition info
ok
[   10.353543][   T12]  process_scheduled_works+0x1cc/0x46c
[   10.353544][   T12]  worker_thread+0x204/0x2fc
[   10.353546][   T12]  kthread+0x14c/0x280
[   10.353547][   T12]  ret_from_fork+0x10/0x20
[   10.353551][   T12] Kernel panic - not syncing: Oops: Fatal exception

From additional logs i can see there is a block for 11ms, that means
the call flow ucsi_notify_commom  --> ucsi_connector_change is running
during this block
>
> >
> > Fix this by setting ucsi->connector right after the connectors are
> > registered, before notifications are enabled, so it is always valid
> > by the time a connector change event can be delivered. Also clear
> > ucsi->connector in the err_unregister path so it isn't left pointing
> > at freed memory if a later step in ucsi_init() fails.
> >
> > Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
>
> It seems it is a bug. You could add Fixed-by tag and Cc to stable tree.

Sure, I will push v2 for that.

Uttkarsh


>
> Peter
> > ---
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

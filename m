Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793719471;
	b=22KxqR58r0eT7ASGDHSdRypJu8cI+cxpCE5RsydFwMJ/UmHNkvsaHJmJZF4q5Kkr2Hhi
	 FZDmOumm9d6MVpbITkxnIdZaGklershtDSTHBEc6xHI2atZwDTWj/SDICciN34+P1qWxI
	 LhhDR2/qT7ikSLz2b5EdnBJp1EPoQWIivdJ+9lVZ3q6d6ovyYsgHYQqMxpJAXhMSIHh5l
	 LVkELBCjpZmE8VbbpLNSbAjhQFcdeTEJrwaGDbtBq4JQYFEWZVBuEJPn8BZB73aRw7LW/
	 e7aUiVb0tKIo//XVrpvPoyGrAyOB4o+bOKTr9xJvI6nUxhAR5F5sRv1O+ytOceQ9PLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
	b=F3KzNdkRiUzYpKVscE2XbOjrOA8VSdiEOkTKTedXsW2/RwFUZhy1cRYhZVxkBVOZaWxi
	 PbLlCJqxpriBsG8rjCAmpKuAEnfe+ORD0mr0kjNpFM9Wu7uxJM+vCcLgfvDEXABQGrb0r
	 fhZyosgX07mdv6O2pPJtou1hjZgelp7GS/cG3txnihX2LdhSXb6eMitcrgf4GDypQN8px
	 UbxF5baXBNpiiEdhMw55nKUtOcRGy21t/hRxvbyZUeF2NS2DSmrS8f539EfCALg8rbmfD
	 bdtS3oh8aeIFIdxBh5ZVJudHjULgQaQqt0llnAna6lfjO4N/SyYzR9YUeh0LkYst7zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPcooBTx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eF7xgDrO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5CB606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5CB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPcooBTx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eF7xgDrO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9tOX4104156
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=; b=VPcooBTxCDhHNlWu
	u50nJOPgFwIwrNCdvcd9ELscXuEk47b/QKFclC9AloHhAEYldaAmoaXWT6Kyqveh
	vGC9n12OmyTXa3djbLxV8++lQTAyIr38ZLJ1SG59H6B0BjNhrezHYTYPCB+FYmPC
	DZCtDSVaWvx6zJvS+6ZbytXg5JO49rgRV77sqJqU4Vlwt5oYWap9kpKzSHKmocjE
	dAAa8F8zcTRXwd9ERQfWQ27Wde3x087FFiqF+nyu8olZeaS8DXjGiRaVrvslehkD
	Kqsng8SHDgUHmYKQPDMlzWwaRtrnZbf66KStYYnLbxzXoo0mfbR5ulNwCq5JGKp+
	e5poUA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76datna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:24:29 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6798c4b8894so5176721d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793719469; cv=none;
        d=google.com; s=arc-20260327;
        b=HxPIokzNOKE2jx9XEigcTpt4uoyO3GELtx8MxviYff8B7CUVRoCzPGwqLWa6crjHMz
         sO7gI9Zx6qm4yGUyxm5D30yUkDFu2tnsRsNxKmN1wj0+3n6CyR+ol54kIep037bDcgDD
         qM1GMiKs3UFlAp9TjmMtUF4UHreANQjRl4ZVtQ2R5SgyYAOQoBfT710j6LrTcfQaXuld
         hyIEVW5UrUSdKyaBLi44Y1ik8Imi3ZfnDnyi9gRN4svOd8zsp/xAH2anUqnNTyUV88v2
         znVEo3QoESjagPwlXqB+t+7d9DeNseskckc3aow7+kcSWRB9sZ1WfczkGi4UK3NCCpck
         aVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
        fh=3eBFnAJygm+MAA8gmLXD0ete6UYscHtqi/BKZoxDJlI=;
        b=RIPyymR/bLvxnfu0cb5bvaAd4nbRQ7i2JGsYeYFmqfZZFW2AbbqRBnFEfr5eO4A91I
         KoR8p8h6H3pkd9tHEoVDcJMZWDkk681NskBN7CpEmEU6oLuSlF/s0kuMRYeRec38Xq/E
         cIL3i9R28WTOlfluoCwVCPz9IIvJvM48Wg1g4cfL+NfMkgmq2Tc+cXxJhDU9ZMO4sReP
         e7/KhCf2J0xm7/gQxjQlto1D/5bdvO2w8mUWBkcc0QKFqUyxtjJN5R50pAy+l4n/3GLz
         km1zdJQyijsg0me1++WurxPYx0oaj3iGjvKwwlz5T1HBHCT82KkwAhgRkZ7LZ8b7Coih
         nEzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793719469; x=1794324269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
        b=eF7xgDrOs6CSHNCpinaRKXO4ZQIGp6LVMnHNvbaiZgOcWaXHgucnhWgfRRcAH7WGpY
         mBKqhRXqnmuZg+kSJFQHtg2tKXeHrzcO+d7zacBlkKAgswcyXABRGskWBebrmmJlQ2tV
         IAb8ck6nje992U/Q/twgHo1gzfaQKzlvWPYM/EmCAINegZFfPSPYkcY0eiaVaR4GSdSd
         XV+CQLCIPTTvSkySqAaRfQxE6Ys2BADx6FDAN5khNvyBUsJMjWOvLFHo0zGTzBD8/T64
         uwOOOmWMLUNVPmbPb1coGWipAcWVVUPL05cjoAGkeN/SPXAd8HKI0F2tjKB3VRCyTGjD
         pziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719469; x=1794324269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1Jf7yIZNINFepAMcdlza48j9DjWumf2wWjQ6qFxRvs=;
        b=Qnw2QixUgrzkvC9VwtF90T6yhYWTRvW0Ldfii+MY6p6O79QR/4VRJvYuNSGM6Y7YsD
         +i2eF6WEiW+4Iv3kQY/0o8UkVSRqV9WQmbGLmZQOQf/76Er875ZlOBloOt3+F8WQqKut
         ZGyjDoeXIgh9XjyIMVJu8cRj1+/N9SEwQ6edpgnhSNuu20mEnj9us5GkbXDx+5N7/2An
         8QJskizrKYkTliEMY3TxCOI4rBjKDooSDMNxgA0pKst9dGL73OSJthhj1jUk/2fJvrM3
         YL+GSLm3JJGRVkY3GDol/5SwSl+wNKcSveX2hFZOBioDJlO/6PyMYPm3HL0KKvCeigo7
         uVNQ==
X-Forwarded-Encrypted: i=1; AKwUvByKIrIDtdSfCxWEu/vYuVnu0/ywulZFzOChLJFa2O2H19/E7gngIVSD71/gLltJBBCpABdg2cFcbI49C5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z866eIaV4BTMM+fak7CS1wuhYfBOqgjkcjWQCpsou5Fbqm9K34E
	QlfdgciOxIMuPoTsx6z+eAaIUBilG2CKZGWQa/YSGkmqJh72TRO5TQo/ssc44w4BE4KHD0e+PCC
	kAPkoT3Eox/17cJOMNCIuRvxgTaPg5q6NJ56gaKRih7CJe3TG5XxrG6GrrV2IF4zXAMddGIWlIc
	FnqZC78gSQRFPFuH2LNNriLhV5eCvHBI8u4TcYHp0tiUS2NQO5K4hw
X-Gm-Gg: AYBFou0SXWpmpmcWsZvLZ4bCpZSXcXOIRpbR8hN/4kib3d9E/7cG+aIRVHN/zfrlRsl
	ab5NB+NbWJSbtE12jSz6W9Bl/1L+T6QhJDRGs/Hnk4KFbYrNO/d7xlzfDSxt9bRpUEq1bFGfsYR
	bW4gwf7OHMl8I92CR/Xge6pnJEPm5mz76SsiHMm0njFB/hJP9E7YUjGsGoBUHhtAp7eM1ZAxVHR
	HVWfE76CHFMYV5VBdlC8N+H52Gimcm0CXTgBFtw
X-Received: by 2002:a05:690e:138e:b0:67b:abb9:3d15 with SMTP id 956f58d0204a3-67babb948e3mr8554277d50.24.1793719468603;
        Tue, 03 Nov 2026 07:24:28 -0800 (PST)
X-Received: by 2002:a05:690e:138e:b0:67b:abb9:3d15 with SMTP id
 956f58d0204a3-67babb948e3mr8554263d50.24.1793719468109; Tue, 03 Nov 2026
 07:24:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002145140.GA784348@rayden> <522a2d28-2ac9-4a56-8a61-477be3dfbbd9@app.fastmail.com>
 <CAGgiveUDQvqpJKo4XuboP_46t7DPSBT1jdaTafROvobk2V5mwQ@mail.gmail.com>
In-Reply-To: <CAGgiveUDQvqpJKo4XuboP_46t7DPSBT1jdaTafROvobk2V5mwQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:24:17 +0100
X-Gm-Features: AclHuK_7QkcnsqO7rpddbyxmd5bsrxtK9QzYCDAUOQsSq6QU6rohTZ3Vg-dyLMA
Message-ID: <CAGgiveWadMfHBMu=vSeqwgoz8rcXXg4E9OrAKnkWPPFn07pimw@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE update for v7.4
To: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9fcad cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=h2ZEknDc1N0j5eo6QzAA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfXwMSZ4V2T1CA+
 qgN/kFcCCcfCSVKYdTh+w7m1L9AqKk2uWgTVkfwYICtJ0XD6Pp5pSjbakzEtXYzXCDPIF7yE4yf
 SwrQrci5jykxN2uV9AB6eQdwFpqV3lE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX8SC/z898F8OZ
 yMSh4VDyR4JH/Kb8zmD7hoMGHcH+NDBIZqReh2eLWDYt2TxQj/Ivf9VPT2PHhE/XvkyjWwxqQ8G
 6CdsWISdMiazYcjOYY7gvmo5gbXJA1nTb7Ilhrgh9SpFXh4eQ6xBsyorD8aaoErq0u3mbpbWv10
 l6TjVDGRIyyRZlqu1p2bgAIArKwH4U4HWir7DVAuxSQY3dB797zZla9dTExfZqhfuSfeSCY1UfW
 B1PF/i21XYl/cioLNKjd3EH7/GZ+Hubu7/Bmv7U7cnRFsCffKf7sKShNUDr3tbj9aGzSpuPYDGo
 g+vbk3Vzvx5Jv4NV4qo1iPNHZzvSJef/JegoNBIBm19kakzJr+lN47KwloXzZgALqlT292V3RnA
 rQ6qW1ael+lWYG/UTJglezcCHjDbhcwf/hl8vBdwk01RpEKJzB0t+pLfKHVMjBqMcOmtxiXETP3
 s1cyGdKdO8F3g1nxozw==
X-Proofpoint-GUID: BPiXLLDnX2vTfGTTg67xGOOD1zV0LO9s
X-Proofpoint-ORIG-GUID: BPiXLLDnX2vTfGTTg67xGOOD1zV0LO9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030061

Hi Marouene,

Can you make a v5 of "[PATCH v4] tee: optee: build the Arm-specific
code only on Arm" addressing Arnd's comments, please? That is,
replacing IS_REACHABLE() with IS_ENABLED() in the patch. As Arnd
points out, with  OPTEE depending on ARM_FFA_TRANSPORT ||
!ARM_FFA_TRANSPORT, the code is always reachable if enabled.

Thanks,
Jens

On Wed, Oct 14, 2026 at 8:34=E2=80=AFAM Jens Wiklander
<jens.wiklander@oss.qualcomm.com> wrote:
>
> Hi Arnd,
>
> On Tue, Oct 13, 2026 at 4:53=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > On Fri, Oct 2, 2026, at 16:51, Jens Wiklander wrote:
> > > for you to fetch changes up to ccd4b23398acaf2139cf04f1ba0a66150cbf26=
63:
> > >
> > >   tee: optee: build the Arm-specific code only on Arm (2026-10-02
> > > 16:28:41 +0200)
> > >
> > > ----------------------------------------------------------------
> > > Build the OP-TEE driver's SMC and FF-A code only where supported
> > >
> > > ----------------------------------------------------------------
> > > Marouene Boubakri (1):
> > >       tee: optee: build the Arm-specific code only on Arm
> >
> > I had a look at the contents and saw that it keeps the
> > IS_REACHABLE() checks that are notoriously error-prone.
> > E.g. this part just looks broken:
> >
> > @@ -257,8 +266,12 @@ struct optee {
> >         const struct optee_ops *ops;
> >         struct tee_context *ctx;
> >         union {
> > +#ifdef CONFIG_HAVE_ARM_SMCCC
> >                 struct optee_smc smc;
> > +#endif
> > +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
> >                 struct optee_ffa ffa;
> > +#endif
> >         };
> >         struct optee_shm_arg_cache shm_arg_cache;
> >         struct optee_call_queue call_queue;
> >
> > The presence of the 'ffa' member in the union is conditional
> > on whether the driver that includes the header is a loadable
> > module or built-in, and this changes the entire structure
> > layout if both types of users are present.
> >
> > The intention of the patch does make a lot of sense,
> > but as far as I can tell, only the Kconfig change is
> > actually required, while the added preprocessor checks
> > only make it harder to read and it should have been
> > sufficient to change the existing IS_REACHABLE() to
> > IS_ENABLED() for consistency.
> >
> > Sorry I did not notice this one earlier as I was travelling,
> > but I think I can't pull this version, please respin.
>
> Thanks for catching this. We'll repin.
>
> Cheers,
> Jens

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288814;
	b=4nKnYDRSsbFtO+GfrODwKctaQPyrcbJMdI8x0BiFIej+Jml3iHD1oX0gcZ6sf+qa8wXq
	 YmObBVQeSb5oVxhFMDCZsyDtUaS3SOnFTPFOgwbH1RychJnvjT8x16HqBJ2Z2ZtB5r3VM
	 MQ3qgucC/+k1nSW+L69R03TuV8kN2PjClbsnjf5bYZQo+2MPgjdf55JJ5eFvXtBIyFG2a
	 Nsl1wqNG5cKru+9R1es/3MWwRkQIexR1wYkovA46CP7lOGQnDsjoB1jGGmLTM+2KwjsNu
	 R9IQzcu5wfsAEsZo9fDTCfuWn4b2YoYIhpkBCxP3rpwKBmYLkuY2Rpf+rQMJVUJltEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
	b=yWQZO9yDT9497PqJWxKvnchTBzynvZl6hYQ0MD2AtGrTtNUBEN4dZOxyzXB4N2cUMuwm
	 AmW8GnSryCJgHZlXZVeA1DVLVxFyNP4tnJFI3EoECx0o6Dl+p5N3RlgQd9Nk5SLOAg+SE
	 s4xBGOr30sUxZrP7NtRmJaasUKOjnmszLX/+bvJyLP7X1Ej+FVgVNuQX9NhAROkT3eH2o
	 S18o64VgY7ofPyaobapZ0JaySjGne68ZamZPMNT79thpe0wMHfwzuchyT/oLYrUiyyM1K
	 x/lLjmp2bqbcpURxe/fp3dJGgmFiqu2IYELyELCi3LUB1+m068rk4NXL8rJMV6P5QWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVsOp0qL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0kEtLQZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED86606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVsOp0qL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0kEtLQZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdx33067947
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=; b=LVsOp0qLhcYVcsik
	p9Vh8cqrpVhZ25bJ6bZCNQ4+y29Pji8XE03dp7QH865xOaxNjXUOg7vqhG8OO5pg
	QFIap1Z6F74gPfv6TL90/UOm4J4E+etmyCZlQJOS/idUSFj6zGiYjYV2HiE5/bOz
	3Sl2tZNzkRlvKjigaMP4AY81t7Nd4/Gz6IsCWSxJK5WVFx6hL4VRYqT8/86K8dJ3
	iGXAzmfKNbP0R5tWfZUh9+xQ6EJwnymeJydZK3j3bOOfFb6IwcsC87BmZ9L/s99w
	v1Y1c8EiZ/wFgMsuFasuVhz4MIpUngOFHfISM2tX+5JLZouy1LieV176OOF0UVEJ
	wN+bnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshtkc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:46:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so405902385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288812; cv=none;
        d=google.com; s=arc-20260327;
        b=GSTIfWsiEYEQmxFkJmhojJi66pB78la7SVTtYeibUq3h9F9mhZDJYlMWk+3LWyxn6h
         zu5f9NuXsDoaYEqBARWU4bI6lP+t1lhOu4F0MI5X7vSQ1SGcQp06PoXL3dfouIAsHGvj
         6XRjBXw9gXTiJiQrcg+iVrGhEj/bHZRfvkGmm2j/GfAsz76PYMJiEuIDtzdbIhemtEf4
         pH/w7Sq/AaIG2hjFphoeff1P99qbPYARS/bJfn9q2WYhc9hrlUe3abKh/XffKFvKwx4w
         gwfo8rB6kJfQ4J7uaFA4qBpSgFf3JbokE8OrTbZ6gZ87dW2YYVHHUJt/kvdGuLf5xBWq
         Z0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        fh=Gj4Q4/B1N6wy1+8bBAfzWT5ys+O+9mngoIXITZT27W0=;
        b=dJAw0FxJ9c2eWwsjj4uuBQQbd8K0mNBAky/YHjpY5E6a/HuAzoi+14RJUzHIfBOKqy
         o33xqMwsYVIJ574NzRxUV2Ijh3ssuF86ib985Fv4dnsXnrHa3TYfkaot3aZvfNACWU6h
         OFHJNljQYkOS4u8OkYmhZ4sxouMjjRQMHMftARauPYe8ymwmaTARpH4KpVOFRCNGVR/Z
         zWpCIws9KcmlKiqHLUQZsnmeIL/dYKqCLhqwwUEgferaasvfyhcgtergqJQB6HbuXQda
         0vZPExJrjrs6sjIB43ZVQOJ7EgFci0C4DyoTxYGWjzPhzw1QD7T9FRyJq+TrvbJFHi8n
         1K9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793288812; x=1793893612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        b=I0kEtLQZ5FWySmkoeXx0IjZhmDaiQZm9UIp4C2TF+/dPMcqgvtBuz7I+g/8pEfYn0F
         D/Lday1v6JXM4l3MBkcgLJTIMcp8jkUtnzdod3S+zXDr/JldwSb7JDbR7th4tDW/PI+r
         aNk9IVj5Ghe0ivs8i0E3bwdIr2IPtzBHn3qejZ+IICHe39JJgIDOAgMplqRFRauXqqdk
         TFufWRom815JPyadNASzzddMDlJ1f2Hsu+5mb3Chpfw9lWIP6DuVylpUHHGPpOPgPEUF
         aeS9LOj4EdsWUpOHwuACqUzWuhjUzVTbIxrq/Nd5hI7zFc2jAZJTn13asD0SHyT6OwKq
         a/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288812; x=1793893612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        b=Uyg+Z4d5ksseyihpKtkkki/xKtUrtCjvzId+55yr7q6JmNSLD4VQDxRaSqjJrohwFb
         t44GDSVxRxsyvM4+7SZDJCqIi/CCGe/goy/BM5fy6CtXkXFQpl97W+uvvC3fVQO8XY4n
         xM2vfKyqp+kf6qrNCJ0lgzRCC+yL5svNRIbLhPPMWB3g0S1bc+EuWaNaZH7ky4pc3kh3
         XkXUB/6pnORG9dNVpQAFWjGFARrPw/us0FeCUnQpAeQHx1A0pqbtDrMFZ4LeOsNgvrWi
         lm6ivezW9nmDRrtFdkQ9dcw195sTS0KydkC6j/4lRhXM7adR1vI4LOsS7ht4nvP1vWLv
         4DQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdZkjVm/OWxtsqJMAdwKw4KJBzJ0Yc2Gw0ZpYbr2rzg5IDVSPNISIlvmk+Ma6vM85+DoSjDBT6GfwagOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJePch+5bcZ3VVV60BoM9oy0fKyfhng+pz+9av73b/HV/yG03vt
	IFRXWC+05/O7akNdOQ8IycODlRN7GSiXlhIhIelwOfyLzIJAmuCv9tNluTqoYWtD3XbUyr+Nrh7
	iiz8GutvXb/TOuMdsU5s74t4anJtmi9UqIbyUnN1WPDY8PtoZEtUD209e7Am7eOBmaMS3q1uEC3
	zZ5LXHhvjzSAbeKda21ddwHoFR1qWjHJYo5CsOTrI+MA==
X-Gm-Gg: AYBFou0TX86NMXK+TufOycnMNO1azxR+KJopomjI5ZUSLztTII3BEZETsDqCBzh2znJ
	VUlXvL9zNgPUvIfaEgpAGVZBGGk2hBAoVub7z04aNSs0u9cGsN9wmuhvz3cztXCh2yxTX1+rzDN
	fxt+7EBscBu2bcos63CyP79WvpG1rpE3ym4mTRbX/UzrCwW5iHZf0y9OPAdmioJhLFoS3ybtWU6
	gwV0sLR9zFc6AizjP1kz+7dclAlE3afTVZseWtDEwcRkdC73UbS71ZancWAe3gZvuFCD7Ykm2Il
X-Received: by 2002:a05:620a:1a20:b0:93e:592d:f5a2 with SMTP id af79cd13be357-944089303camr914160785a.11.1793288811642;
        Thu, 29 Oct 2026 08:46:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:592d:f5a2 with SMTP id
 af79cd13be357-944089303camr914156085a.11.1793288810985; Thu, 29 Oct 2026
 08:46:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org> <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
In-Reply-To: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:46:40 +0100
X-Gm-Features: AclHuK_dWimsnhoH0_XzQl8ZjHm1ns8Wq8ivGHA1U2MkUrMeF4i5qln3flFwdlc
Message-ID: <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: NM47Lb4RXBoXU-NLYS4tkpwqPX5BjwLi
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae36a6c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qRbGgoc3eL5JOgqkpqAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX7XcRBekWIh3K
 t7e62Xhc2OHUjHEMBh51HmjnafzGRdR1xdZXPKX/Bvf9kfjChKRcWwaxTcHOQLE0K+bB+tOVdZr
 xaYZZZOqBViqOhVT7OoK5jBZzTSQlOM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfXyeacuHJyvweP
 sg7XXUH0gDJfd7nqYHlA3JL+y7goz1Xdu3cdBKHwxIliQKRXTOL0/OyhbZGIMOdWeKZXOFgAvg6
 DyuD/kCM0H7MCAu8xgBDdJHehWvU2FTHKcoPFmzh471n6vL0mTHPD1R/Uo3cH8/1yTRL+DHf27u
 hZBmkhTnlNrYVgwH7d2VA/H2d3qaKaQrSZeQIzQv6EOo2HiMeR/GBr1/htiGu5nDQ8fQr4urQaN
 CXWfRjOiv/i2/EgWRsU9sN5159TCUMhFtkWNGX4GE0hYV7HBBzcAZk6VkNZHQgE525TXL8ISrRt
 BJPsHwTONScrYv+ruHoI5YY3EhXYJzq/rL3u0Slk41NmzpOYvLUs+TJCVcTQYJfdoxwLeeSr8Y+
 LPDj9u+lO+3GSejof1DQhiy814ObWnA0pJHJ4ogAszpzKSo+gfrR+8za+3/flza7adTB900MS7Y
 MoYn9cjxOA5cOIEoXiQ==
X-Proofpoint-ORIG-GUID: NM47Lb4RXBoXU-NLYS4tkpwqPX5BjwLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290061

On Thu, Oct 29, 2026 at 4:43=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Thu, Oct 29, 2026 at 10:55=E2=80=AFAM <bryan.odonoghue@linaro.org> wro=
te:
> >
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Add in silicon enabling code to generate SOF and trigger the routine wh=
ich
> > produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour=
.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++=
++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driv=
ers/media/platform/qcom/camss/camss-csid-gen3.c
> > index 0fdbf75fb27db..6a538d825f78b 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > @@ -34,6 +34,7 @@
> >  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(=
20)) << (rdi))
> >
> >  #define CSID_TOP_IRQ_STATUS            0x7C
> > +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
> >  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
> >
> >  #define CSID_TOP_IRQ_MASK              0x80
> > @@ -58,6 +59,9 @@
> >  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
> >  #define                RUP_DONE_IRQ_STATUS             BIT(23)
> >
> > +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> > +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> > +
> >  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
> >  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
> >
> > @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csi=
d_device *csid, u8 enable, u8
> >         writel(val, csid->base + CSID_RDI_CFG0(port));
> >  }
> >
> > +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enab=
le, u8 rdi)
> > +{
> > +       u32 val =3D 0;
> > +
> > +       if (enable)
> > +               val =3D INFO_INPUT_SOF_IRQ;
> > +
> > +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> > +
> > +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> > +
> > +       if (enable)
> > +               val |=3D TOP_IRQ_RDI(rdi);
> > +       else
> > +               val &=3D ~TOP_IRQ_RDI(rdi);
> > +
> > +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> > +}
> > +
> >  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> >  {
> >         u8 i;
> > @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
> >                 if (csid->phy.en_vc & BIT(i)) {
> >                         __csid_configure_rdi_stream(csid, enable, i, 0)=
;
> >                         __csid_configure_rx(csid, &csid->phy, 0);
> > +                       __csid_configure_rdi_irq(csid, enable, i);
>
> Is this something that should also be tied to frame_sync_en?
>
> Also, just thinking out loud, are there cases where we'd want to
> toggle this dynamically at runtime based on any V4L2 configuration or
> pipeline path? For example, should it be enabled for the pixel path
> but disabled for RDI?

Obviously, if userspace subscribes to the related framesync event, we
should enable it regardless.

>
> I'm asking because one of the appreciated strengths of CAMSS is its
> relatively low-latency and lightweight capture path. As we add more
> features, it may be worth preserving that characteristic where
> possible. Not saying this particular feature has a meaningful latency
> or compute cost, but more as a general design consideration.
>
> Regards,
> Loic
>
> >                         __csid_ctrl_rdi(csid, enable, i);
> >                 }
> >  }
> > @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
> >                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_S=
TATUS(i));
> >                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLE=
AR(i));
> >
> > +                       if (val & INFO_INPUT_SOF_IRQ)
> > +                               csid_sof_event(csid, i);
> > +
> >                         if (val & RUP_DONE_IRQ_STATUS)
> >                                 /* clear the reg update bit */
> >                                 csid_subdev_reg_update(csid, i, true);
> >
> > --
> > 2.56.0
> >

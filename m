Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4828841D626
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823082; cv=pass; b=gUUjI2lORnyDwZP7CNkYKkJQIPTxyPod9pxDS5uiJ2pnOWUUlZ0k5CYDzOPcZYNlSxgH1XQb0RVQj+INJyDgmDRT+WbguiMPhWcRnV2Gj3mtMTuose8s/fa6Ck9qktuMiAN8aWhGuJPM0z+az7c83+bM0WFuqjacMU7eqPzn69E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823082; c=relaxed/simple;
	bh=+OFocx1aEP+9vQ3gcP1bnLrVbBnXFhujaRLhWeC6sfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atzcITdgRCfq0odzxiiWVF9g1G+gBxiTmEBnbqlfpmoi4UbeZKU2B+N5Litaoq8rqmdbifzI9ybJ9wuEaNfD5/JwUXSF1YXQf+piekXz9cdQBYgxVg9RpfZ21SZN8ovLKWmUrb00IaExKiEHLPFOlBCP17HvUokKZdFNnzj1nao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puXp5hrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ezf6T6+/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puXp5hrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ezf6T6+/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9IEdg3978562
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0bRS/1/Y3fWl7X8ODZrF2DAl/+US1luAoJB+jji9gM=; b=puXp5hrKOrTO+euL
	jJObPvmyUHIUELmdbOpdfaZoie+lfFKTkRGROkQehzHwRcHIQelKzdMUX2Sj3Jm6
	pwlEVqgh+pqwNIuIvtDTddujHwVDYSS0cljIaWfKN8Xr9tlIE1ivtn+oFGb6fc+B
	HF7kS7f6U7n9xfeyDyNRuwsMH4Kt1BMDvBYDo9HRoNuXath02FhlepGDhX9oPWTb
	9Hue1xQeRCOHHbGun6a6U5jviRtcLlZpwIY8fD3sb1WdvK2SGpQEztzHdGO5lwZJ
	0z/iYjkkOE3flq1vK12OoiDSrJGsWGG5B0W4yZm0gBWXFQhm/DC7Pi+w/6TMeGEe
	GOiacA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egk3ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so343316285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787823079; cv=none;
        d=google.com; s=arc-20260327;
        b=P/olBKkNhXcRnqe94EGMVxUmuFPSujDGfk4RrKy/hKt4+6wuZJYXxL5rl5Fr8Jaf9K
         TwhHQYnXGfoLcUFCKB73eMQAekOzW5tJXtx2dty7k1BLKsgvsNHU9BqTiCdQ6stUPv/p
         AC7Wz5QYiIG0qng5TlQkmmwSMeS7zOUf01kRAi/6r5drJmcQsztUhNj0R+rnUxV435EQ
         sN7PbjF+25BG04GY8aTiBWCkDlufBhWFUWUHvMFNFfvnHWjt4Y+sRI14fEb0F4mlUEcQ
         K0DEU1DbGGXUXcSSB9B4inUWoi2L9+8fBUmKtr4zH5U9GZ39Idf0Ybc/Srszm6vDjbZe
         OqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e0bRS/1/Y3fWl7X8ODZrF2DAl/+US1luAoJB+jji9gM=;
        fh=TbvD84whBmYto/NR4IGRrK8zTDIGNDWzCSAkRJPud6s=;
        b=HC6eC/BCLRpJgPowUAXD9Y3oofVAv5M+ulSXB0oc+xRlE3lu7mjjZ+Cv+v+88rGAEv
         fNvACdz74ndybckXncmoVwcVEvMaJaH3314KmYWJkYS6ogg3AbCLT7V0m7S9aI+wneGH
         7+eSRSevaBRbYHEJT0q298avD4yWQT2Vh3oxTe9ghBFl3l+2uEHEiaRTiYrzHXUIskeb
         WA9L6Ll4Eb0qOxE8ArOg084l/LwanNZrW6H2m9dOYAAO16VR/uIQc+kAPCcm2Fu3NhQS
         v5yowUByig1QKPlDAI9PfW332zXUS1n98FKlAMTEZqi0mPjbmr+kxSFPDlL67fcv1rE5
         gIhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787823079; x=1788427879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e0bRS/1/Y3fWl7X8ODZrF2DAl/+US1luAoJB+jji9gM=;
        b=Ezf6T6+/SaUKZrLnJqz9O5dEAZirnj2OOrzxGxhPLEyi2A1v+ldJQvNfoL7+PRRPBx
         7qujxU1Mx4zdOAN2GL6yHNdaGyz+FC+m04Pc8jlbav6CeukhRm/F5AsdUbtMB3w4hoiy
         knI0ZKLSDtE6zZSKAPwS86GsT8pyBkmjLWmItgXsBvtlssPcPz0voqV4ob/MwzXzhaxp
         fJHP+RKnpOrpXBFshICUrQTiuoiirSER4BjwNYbuNRitE+tm8I/DjrMPSp/5JWZ3TXOn
         4mb7KumT4K6QHy3cILdAt5GV3ya9OSluzDyYeQJ4frNKv/ZDxx5SZe7AQFm+hOHDmBm7
         BQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823079; x=1788427879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0bRS/1/Y3fWl7X8ODZrF2DAl/+US1luAoJB+jji9gM=;
        b=dhjGgZGDKEBLonY1QGTNJm3DBVsFz1xqC1ltN8G2bKKHHdfG9LgjkosZTdZsuIuO2J
         zO3HML/k8OzY//KeNUgHQwNPDNxCWrS2k1dzfPeVFUyppnv+jRTkF5pOP0CWfV3no/vp
         8GtPnuR3zzJC4PUikFSCg2sEgXrNDkLbeZRMzRT0UvNSyKxLTQAaQ0oqzh7c3i7rKTu1
         1TZVF/NZz6U5wl8aCUyvi9s0Fc4Nxr5xTK05homChVYQgjRPUDtSYSfDgobNa8g3X2tq
         iV4mKZhRup9eWmeReSs8R5NeNCvXYhkxo/5W+iIDOqHdtWF5tkj2seDtxDzmqJMB2aub
         jZBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpc8gfG01pQuU7R7ag5LwJPKMwG+DmWQP/sji/lkobZ5WFP1Nn9+7gkiwdno3tGMxpvNYE2V6vx/wgAqdY=@vger.kernel.org
X-Gm-Message-State: AFuF++nEXssaMErvlEVwTjw+poSZ+DkxOJ3AcJhlYI2qaU7nP2FzcqPH
	LYWinOm1YIq/QHa3pZl/cl6RquT1nEpJ8BVCjyqsRA3Djw7YR+CPAglVWCQrF2vSlL3F0Bh9Jwh
	Jekk1SMMKAcWTJtqF/P78mMf5oJzgwX2Iz2plA8Bqoi3fo4JdhRhFAZ30ustXv3ytlXgXyoDPrp
	yAUX57TN75UYhxxRR9Iq4+I3UPqDEIHnW/jDvnKoRmzLfCzOG45VwWRj4=
X-Gm-Gg: AR+sD1326Dc1ZtSnMhDsnEta9b0EEKzckJjoQGMmnXuaYskJs/1i86QqtcA/rzd7fvU
	oaQim6kTJAtmtcC171651FNYqu7pgfEF2YufVW29xHkogOL0Jjybk1f2jSvk9/kMVQRgcUVRso/
	lHW7d1TpdiROB6lpeEDXWB1zdvjOMdWbFLTipkWmKtYSK0DyE319M2gMFeZf2y5Vlhgm/kJZYeI
	L2isCTv3Iqw0O7Ecl27oihX7zkLzbv2vuW2hDq4R8sgv+CNbaPQGcUf4o2CKkX/4cqbPqohy+0=
X-Received: by 2002:a05:620a:4414:b0:939:682:684f with SMTP id af79cd13be357-93906826933mr234773085a.17.1787823079204;
        Thu, 27 Aug 2026 02:31:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:939:682:684f with SMTP id
 af79cd13be357-93906826933mr234766785a.17.1787823078637; Thu, 27 Aug 2026
 02:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
 <20260801-cci-clk-fix-v4-4-e1d80da54e01@oss.qualcomm.com> <8af313a1-5f7f-431f-91f6-9e22119d456b@linaro.org>
In-Reply-To: <8af313a1-5f7f-431f-91f6-9e22119d456b@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 11:31:06 +0200
X-Gm-Features: AcwNN1UvaL1W-zyD8Eglxdfy81HKEI8nddcPmZVpUkhnUF7SybxDrqSKZKvr1qg
Message-ID: <CAFEp6-10Dz8EJjMNrM0FPHwmaMr2ownKLBh2=F70PmkFn9Ke2Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] i2c: qcom-cci: Share the timing table across CCI revisions
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7n8mGU4yzWCEVrjhmaKFEtq3liG2S3Jl
X-Proofpoint-ORIG-GUID: 7n8mGU4yzWCEVrjhmaKFEtq3liG2S3Jl
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a9003e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8nvrDW3bclPgcZMhjs4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3OCBTYWx0ZWRfXxaTBRWiyHMCT
 F4bu8r0R3Y690NnyxRgg+2yOWytOuZLTolIUJS+HV4BFFBCCaCvvUHxfwIWfMrnv6kagE7djDSs
 i4nPbtCCJtXaqUnsM/k1T/0n/Hx1KoXNfcvqG/Qo/VyKFKULdUJ6Ww9F/abpOCCuFMfn5JSvplo
 TIEvu62vO3K2pE9pur5fT5ZJgoD9YcOkG6VHYrH4MPYezm48eNpC8pobVOFC34Y+i+ofPacqO8A
 rZkw1zp+erVlXq1x/r2kgjtsz2qvqewhb0v8ERQ2gyYx+R09Li9wp8Gay7Eh8QiU4iJG1Agan2m
 8AJljpFm2CTn/zxB0ZkCf2Auhn/E4g5r9lK1E8+YQ0oqRGVQATHwFlzguO3l48u4qADEymmLF9W
 KwzNqBDaxvQiJ9r/PspmQ5O5oiy2Ws1Gs2mj87FtFjoLQh9o9FSnT2s06z8B3lY9LIeTDOzMTWd
 z9ruZAw1k2G1/Zf2LeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3OCBTYWx0ZWRfX+M3QO2DEbLaq
 Vo9hsnurrOzDGXQwbwaavKOrrTff1qpvHORUOk/bYTyTho8lqcuuqJ7ov01QORKzkSF/LKmYW2X
 oPy4C3cf90i66RJHygfndLQOrRxCwAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270078

Hi Vlad,

On Wed, Aug 19, 2026 at 1:31=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 8/1/26 23:10, Loic Poulain wrote:
> > The hw_params timing values only depend on the CCI clock rate and the
> > I2C mode, not on the hardware revision: every per-variant table used
> > identical values for a given [rate][mode]. Only the set of supported
> > modes differs between revisions.
> >
> > Move the timings into a single shared cci_hw_params[rate][mode] table
> > and describe each variant's highest supported mode in cci_data with
> > max_mode instead of duplicating the timing values. This removes the
> > per-variant timing tables without any functional change.
> >
> > Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/i2c/busses/i2c-qcom-cci.c | 181 +++++++++++++++--------------=
---------
> >   1 file changed, 70 insertions(+), 111 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c=
-qcom-cci.c
> > index b6fa37a306758ec33ede6fcc39ce4412b86d9a84..21695c744502f7fb5d333f1=
272f3771e4d9d5508 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -124,7 +124,8 @@ struct cci_data {
> >       unsigned int num_masters;
> >       struct i2c_adapter_quirks quirks;
> >       u16 queue_size[NUM_QUEUES];
> > -     struct hw_params params[NUM_CCI_CLK_RATES][NUM_I2C_MODES];
> > +     /* Highest I2C mode supported by this variant. */
> > +     u8 max_mode;
> >   };
> >
> >   struct cci {
> > @@ -249,13 +250,76 @@ static int cci_clk_rate_idx(unsigned long rate)
> >       return -EINVAL;
> >   }
> >
> > +static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C=
_MODES] =3D {
> > +     [CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] =3D {
> > +             .thigh =3D 78,
> > +             .tlow =3D 114,
> > +             .tsu_sto =3D 28,
> > +             .tsu_sta =3D 28,
> > +             .thd_dat =3D 10,
> > +             .thd_sta =3D 77,
> > +             .tbuf =3D 118,
> > +             .scl_stretch_en =3D 0,
> > +             .trdhld =3D 6,
> > +             .tsp =3D 1
> > +     },
> > +     [CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] =3D {
> > +             .thigh =3D 20,
> > +             .tlow =3D 28,
> > +             .tsu_sto =3D 21,
> > +             .tsu_sta =3D 21,
> > +             .thd_dat =3D 13,
> > +             .thd_sta =3D 18,
> > +             .tbuf =3D 32,
> > +             .scl_stretch_en =3D 0,
> > +             .trdhld =3D 6,
> > +             .tsp =3D 3
> > +     },
> > +     [CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] =3D {
> > +             .thigh =3D 201,
> > +             .tlow =3D 174,
> > +             .tsu_sto =3D 204,
> > +             .tsu_sta =3D 231,
> > +             .thd_dat =3D 22,
> > +             .thd_sta =3D 162,
> > +             .tbuf =3D 227,
> > +             .scl_stretch_en =3D 0,
> > +             .trdhld =3D 6,
> > +             .tsp =3D 3
> > +     },
> > +     [CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] =3D {
> > +             .thigh =3D 38,
> > +             .tlow =3D 56,
> > +             .tsu_sto =3D 40,
> > +             .tsu_sta =3D 40,
> > +             .thd_dat =3D 22,
> > +             .thd_sta =3D 35,
> > +             .tbuf =3D 62,
> > +             .scl_stretch_en =3D 0,
> > +             .trdhld =3D 6,
> > +             .tsp =3D 3
> > +     },
> > +     [CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] =3D {
> > +             .thigh =3D 16,
> > +             .tlow =3D 22,
> > +             .tsu_sto =3D 17,
> > +             .tsu_sta =3D 18,
> > +             .thd_dat =3D 16,
> > +             .thd_sta =3D 15,
> > +             .tbuf =3D 24,
> > +             .scl_stretch_en =3D 0,
> > +             .trdhld =3D 3,
> > +             .tsp =3D 3
> > +     },
> > +};
> > +
> >   static const struct hw_params *cci_get_hw_params(struct cci *cci, int=
 mode)
> >   {
> >       unsigned long rate =3D clk_get_rate(cci->cci_clk);
> >       int ri =3D cci_clk_rate_idx(rate);
> >
> > -     if (ri >=3D 0 && cci->data->params[ri][mode].thigh)
> > -             return &cci->data->params[ri][mode];
> > +     if (ri >=3D 0 && mode <=3D cci->data->max_mode && cci_hw_params[r=
i][mode].thigh)
>
> This earlier introduced sanity check for non-zero 'cci_hw_params[ri][mode=
].thigh'
> is not needed anymore, right?

It's still needed. max_mode captures the platform limitation, the
thigh check captures the clock-rate limitation. E.g. we don't define
Fast+ params for the 19.2 MHz entry, so the two checks aren't
equivalent.

>
> > +             return &cci_hw_params[ri][mode];
> >
> >       return NULL;
> >   }
> > @@ -696,30 +760,7 @@ static const struct cci_data cci_v1_data =3D {
> >               .max_write_len =3D 10,
> >               .max_read_len =3D 12,
> >       },
> > -     .params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] =3D {
> > -             .thigh =3D 78,
> > -             .tlow =3D 114,
> > -             .tsu_sto =3D 28,
> > -             .tsu_sta =3D 28,
> > -             .thd_dat =3D 10,
> > -             .thd_sta =3D 77,
> > -             .tbuf =3D 118,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 1
> > -     },
> > -     .params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] =3D {
> > -             .thigh =3D 20,
> > -             .tlow =3D 28,
> > -             .tsu_sto =3D 21,
> > -             .tsu_sta =3D 21,
> > -             .thd_dat =3D 13,
> > -             .thd_sta =3D 18,
> > -             .tbuf =3D 32,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 3
> > -     },
> > +     .max_mode =3D I2C_MODE_FAST,
> >   };
> >
> >   static const struct cci_data cci_v1_5_data =3D {
> > @@ -729,30 +770,7 @@ static const struct cci_data cci_v1_5_data =3D {
> >               .max_write_len =3D 10,
> >               .max_read_len =3D 12,
> >       },
> > -     .params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] =3D {
> > -             .thigh =3D 78,
> > -             .tlow =3D 114,
> > -             .tsu_sto =3D 28,
> > -             .tsu_sta =3D 28,
> > -             .thd_dat =3D 10,
> > -             .thd_sta =3D 77,
> > -             .tbuf =3D 118,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 1
> > -     },
> > -     .params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] =3D {
> > -             .thigh =3D 20,
> > -             .tlow =3D 28,
> > -             .tsu_sto =3D 21,
> > -             .tsu_sta =3D 21,
> > -             .thd_dat =3D 13,
> > -             .thd_sta =3D 18,
> > -             .tbuf =3D 32,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 3
> > -     },
> > +     .max_mode =3D I2C_MODE_FAST,
> >   };
> >
> >   static const struct cci_data cci_v2_data =3D {
> > @@ -762,66 +780,7 @@ static const struct cci_data cci_v2_data =3D {
> >               .max_write_len =3D 11,
> >               .max_read_len =3D 12,
> >       },
> > -     .params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] =3D {
> > -             .thigh =3D 78,
> > -             .tlow =3D 114,
> > -             .tsu_sto =3D 28,
> > -             .tsu_sta =3D 28,
> > -             .thd_dat =3D 10,
> > -             .thd_sta =3D 77,
> > -             .tbuf =3D 118,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 1
> > -     },
> > -     .params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] =3D {
> > -             .thigh =3D 20,
> > -             .tlow =3D 28,
> > -             .tsu_sto =3D 21,
> > -             .tsu_sta =3D 21,
> > -             .thd_dat =3D 13,
> > -             .thd_sta =3D 18,
> > -             .tbuf =3D 32,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 3
> > -     },
> > -     .params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] =3D {
> > -             .thigh =3D 201,
> > -             .tlow =3D 174,
> > -             .tsu_sto =3D 204,
> > -             .tsu_sta =3D 231,
> > -             .thd_dat =3D 22,
> > -             .thd_sta =3D 162,
> > -             .tbuf =3D 227,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 3
> > -     },
> > -     .params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] =3D {
> > -             .thigh =3D 38,
> > -             .tlow =3D 56,
> > -             .tsu_sto =3D 40,
> > -             .tsu_sta =3D 40,
> > -             .thd_dat =3D 22,
> > -             .thd_sta =3D 35,
> > -             .tbuf =3D 62,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 6,
> > -             .tsp =3D 3
> > -     },
> > -     .params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] =3D {
> > -             .thigh =3D 16,
> > -             .tlow =3D 22,
> > -             .tsu_sto =3D 17,
> > -             .tsu_sta =3D 18,
> > -             .thd_dat =3D 16,
> > -             .thd_sta =3D 15,
> > -             .tbuf =3D 24,
> > -             .scl_stretch_en =3D 0,
> > -             .trdhld =3D 3,
> > -             .tsp =3D 3
> > -     },
> > +     .max_mode =3D I2C_MODE_FAST_PLUS,
> >   };
> >
> >   static const struct of_device_id cci_dt_match[] =3D {
> >
>
> --
> Best wishes,
> Vladimir

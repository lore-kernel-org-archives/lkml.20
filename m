Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632749;
	b=dI+7Ap03oscuItvCjB8QWcBvKHeMVxn62oUIxLoj5r/YvZS0Ho78FXOp0nzTgS7ctrf/
	 Y9drX1OGiiyjxsISH6ix/uzfXo1QRiyt3Bg769DXzWN6lG06QZuk5EjWjnIQ4u+eG0FTR
	 aRtv1fUEjfvRxx1QZMmkc3kyLXnUvFDugPUSzNtjdJsyb+Gq5OlvBie92gF8EK6XaCI3w
	 rvdyySrWrn3Q6K+MecLcKMnVWRQ98gZ6H23XBFNFmbQJqwIbt/SIkJasRcBrtziTnLzhI
	 pMSm3LvxthJv+CeEho8bADaRgaQLvS7G6yV+DWjhsAbfr9u+1oI4+D3o2Fx16QBUw0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
	b=aYVPZnm9kP4ZavTgmKDt8d1SNVXoODeZgkt0gLIjP9cQ3B3Qq0Iu8OWa6btXqGsNawRi
	 3Wt2g1JX5QA4iJWMXrEJWACS1XGslOPRY4jNCK6kPjcqmJU7nXTv3Wa8ZGAMRu2QdAm4/
	 mdf5ixUCEBowGpRnIHj+SCmEr3a+dDsQUgz4YMoN5m47bYqr1gRlKjwB5TO6gu+Sln2Hn
	 fmDTJXnW8V5wuh5BU042kWO7eFmNJe8n3nh7CUyFt+FRE3eXk4uBIt9nvjrX3rg/vaCtq
	 0a6zIoLcVfDqKPn0GimVpZqThZXUxiQpZSwgNvHhdUkUARKd68+k9czQvRDdW6osQSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuHoTSHU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHcqbIg0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC46606C55E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC46606C55E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuHoTSHU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHcqbIg0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpItR2991830
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=; b=Qu
	HoTSHU79wtw3WxydbbwxFGBHTAmhokn4hj/ikHi7Hv3HQFNcTvWoFCfojIh38ymS
	zQ8U5z8sf64CySh/M3RJSfvI4clEO4bfDX7O7wL+RElTGYfrMtvZvR82HHx6f478
	gldXZu4hwzuEubkTr/mIWCQahbJNvu6cUbP8h86mQEHUS+nOL0OojO7QLfD6ZslL
	sdSfD8KLWrEwGxjRs/vg+J1dDCrgG6SRHxheP8Zk14JKTPRKpXKpr+Cf5fLPnh9L
	GZPZuOgytRJQg1D8+hWf7fHKkocPkZ6efMIKNAhW+VXdQdsPwThWspX0VSpNJpFl
	qEhr4xrbzxWfAOYmblow==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgyyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:19:07 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-492f39f29c4so3549078fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632747; cv=none;
        d=google.com; s=arc-20260327;
        b=Ls/9oTNdVM4UqF5jEuSLGDIdzJZZ9NqOxOSMraBy5LvKIRlLVWTygcZdKliZ4TSp40
         ywlfuJADbcWS4sQnWoD5vUhmeH9+iDyBeUGPpAwy/q5nQ+rUdyzDvY3v4rgOCACpez68
         P+D3H0lE3IK8+SuZMMMyNRHxPBB1i0XyXDfz4sJlg3sT1QbmMdqTzkJHurzqoQ6E+GpS
         Zpxf5luCEvKEeyPn6TKWzjhb22jElTIKztkupgJDu8in44auabKLMaMSNXZNCtJ7or1U
         6ZkPuE2h4hLmfXMtk4E8SctGU2231CFKS3GjKSUnDFKzKhLpueTzoxo5XDRT3UB5GbWS
         dqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
        fh=ku2FDncgoF4seRM7cjHnlWKfxrXcasQPmxyYHyAbjc0=;
        b=p+RcwEyTDmFrNzxfx2jIvciBXZPgN+nSKVKdrDq0OBH9Z1vDV5WFhmfCr/P1zb3czh
         C8tGRfPYfg+EVikSVJkHzbr3nMZbkKkZZrYAQnpco/IT7pxEWf9aqNr2GSRsSuBZ7lOu
         /cMC5EAky64kqdYWIQ7tb3P6UUzMAm75EY6i/XQbP4x1y/xGarGtP74fQiIyk+VVl69b
         5Gl5pTTc0j5vfwg78aqFj6/pH3L9PyBQ/VtRK14BZdGpWj9K5WlmKvOP322rxseNPulV
         Uo0yVl2p7OlO11iKvOv2P7McczluL9ES3nsMw+6dw9JNsEq6J2VPF+cRjk/bj/rcDgxm
         Wh1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632747; x=1794237547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
        b=IHcqbIg0OxgGiGJF3LKTaTCakU5iruF2vY6P/hGeIqLWoq2DqhpEH7GpBcvwAlCHh8
         r+mcRZu9g8XBXzXZxt8EnKBpCPhOF1sa3KBhcSY5HjnK9G+18xj1J9aZcZfoG9w45fGY
         IAOD3fhYqqJlQXmoovTKbuh1HGI9WlIzfmm9byZu8mPAvQmQrmNVrSzWhUlm/nGViCoF
         +sfoRMX1x9AxGFYv3X9bgx4UqAQdFBUPNONZkwpnGu04VuOhrq+dZGVCwx/XmXFeOhL7
         FHOb5xXHscBCYyilDP/2IQugLwWtvnD/3tDVne6WIyzjvbOyVJnGm39IqTW8jvPdttxP
         vndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632747; x=1794237547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdDU8m93RcW1fZwZqI8+6F0AE7NDrUTsi9z6BVOaBVA=;
        b=iraEFDdMX54fQXh9rx39d/IFwHxWPkUgY+xiKHWqnYn1rJ0aGem/FSoM6icnInjVSO
         oh2dRKF6e8VwtMRzJBjAUUptlSyqx30KHp6bs2i8VT2cPNeHDGHn4V3acl3w85xwxC2F
         Zb58R8igtbHBs4q/fatlB6lEog9rYlq2tY+J+BtH8qUMsR9Ytv9P9U3b3E0ocuH9tHnV
         0WoCdRy8PsoZ7uHCLJzo3+BIVRlJqZ7FT6ypWHOLXenHBcD1hVePIg9Ho0z8tDgTfg4B
         mV+bCZvvhYnEElPt0jRYDyl4TPMP5lipp+8COQ6EhK+X/Z9xBq+J0Yi6hd/+OxIfdc6G
         9kYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOE4S3Gl8snaZourX6Az7WYm3DSQZ4aeAp2i9dVub/MUJY1dCCybHqgVR/avj+H82f13SY3iQVvx9utH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV6vHAB2wkuR35T/JPBZ0cJ5x0gdhP0oib9rhxXcwdDcn56+Go
	MzB1JDgicJvWKFP4ZngRiSFrGz3FfHw682UJ0AFslM88nZcZdvHOzlnTT9HchEASGdTFQvOfJYl
	TMQbrNxSnaeMe3NTz9alnEVVa5iUN9V44I+aX/lqdZisJigANJUiAY+h58frZY28WlSgfNsDh2F
	SW/MmtiMq5FwV3NF+ZQB5PYGqzhQK347kcj4LOmCQ7kQ==
X-Gm-Gg: AYBFou3CRR46VJ6K6FLcGMod2kQySnLSMPhwGcvEWaecJu9AbNvMUZNvRP9xHlxuv/W
	6Fcfz/bcexdJDgnyiB9adMI/uBjIs0gmlzzgFhxc4fEmviAwmE1b8RsQZn/87eHuhYIBuTnj+hk
	Pe8TbXEe84AHoWC5LGgt2coHxFQiifuKzGnGe2q8GLjICrdWFGhzxh+jM8dg==
X-Received: by 2002:a05:6870:31a2:b0:4a7:4730:affa with SMTP id 586e51a60fabf-4a907691617mr6816487fac.24.1793632746907;
        Mon, 02 Nov 2026 07:19:06 -0800 (PST)
X-Received: by 2002:a05:6870:31a2:b0:4a7:4730:affa with SMTP id
 586e51a60fabf-4a907691617mr6816446fac.24.1793632746294; Mon, 02 Nov 2026
 07:19:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com> <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
 <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
In-Reply-To: <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 07:18:55 -0800
X-Gm-Features: AclHuK8f43_19qDcy0p2s8OAyXrGV6vF3SunCYGHH5JIns_9PiJHYiC99rZWaqw
Message-ID: <CACSVV01=19OWZ4i1Bc-j8m8u0+5jtfOgqPU-VfkLUQUQ_oVdmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX45ol5ZrOloBX
 uVgS/lkBffiLyzIJ9OQYe1YQXKuodPLKI5S8XTyO8QsBjMNO7EFIEkj/Nf51NMkPXddwulIa592
 +d3PcmjyB5g6QEO1AyNDeK+OPRD7xcVqG6hjU9FUbI1z5n3a5rWvJLWtjELxygGxR04ogcnsmzS
 rdtir1OaIQJ/EGviNUborIbmixY1begFDBcGk9YCIoY9PehrwzO9oJe02cfQXRICUBho5e870MA
 XbK1hJY22oIG+/meCjXpxOJ+E1LtT17bTrZ9S3YQr4epbrv6edarnr52GGlUatTsZSi8Fwab7y/
 X1HRuPDZZe527BsskSpOCuJCQqsKg+2v+yQqqlKldwExsArklAPFqlu5UihLMgczw9PLvl2oSFo
 XILxLYdM+k24KtqQcKwzqfDk/M5Cn5cT/LmIalcVP8HG1EUsOZzgIXJPhbDWzVcSQYXGXXQjdUW
 5URu21TifLfCmBN2nFg==
X-Proofpoint-GUID: xQ4ybqgXT4yPYJrAra-bg3ZAURJ1YRsF
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8a9eb cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=q-aMyWzK8yv6Tw-4Un0A:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX9vxCFHdVW+sq
 hNuhOaBixJ2mxrTuX6EPSPnuoNeD/3M+MM4WMpogfw+xtmptvigNBJjyzjDyWR52PY5BJuCHl7d
 Io4rTxFYoXmAjf5UmKLr4b0n5rJtL6Q=
X-Proofpoint-ORIG-GUID: xQ4ybqgXT4yPYJrAra-bg3ZAURJ1YRsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On Mon, Nov 2, 2026 at 5:59=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Mon, Nov 2, 2026 at 1:40=E2=80=AFAM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 11/1/26 6:49 PM, Rob Clark wrote:
> > > Use size_add() to guard against overflow.
> > >
> > > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range valid=
ation")
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/=
msm_gem_vma.c
> > > index f687a629629d..16b3870d5e90 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > > @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *=
job, struct drm_msm_vm_bind *args
> > >               op->obj =3D obj;
> > >               cnt++;
> > >
> > > -             if ((op->range + op->obj_offset) > obj->size) {
> > > +             if (size_add(op->range, op->obj_offset) > obj->size) {
> >
> > GPT and Sashiko are unhappy about what this does on 32b
>
> Considering that we can't have >4gb BOs on 32b, I think the concerns
> are probably unwarranted.  But yes, I do look at Sashiko's reports

Probably we should add checks that obj_offset/range are not more than SIZE_=
MAX?

BR,
-R

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792594272;
	b=oqJ2p2IhHJC2DcHdbZgM691eaVCTcvIDI4OVbPGNOVVKRzGuvK7Ky8WV8jna/7WnRsQZ
	 eNa0ojQJHDICIFYFTFYaW93Y0w0znXbhVzZ3MzoLmf2RKdMa8pdpFjftBzQXuqNGUV3SY
	 1Qezfixu0waG+NwXfXQZq0HQI7v9TEAMrrz8MoVlPuNSzE8uw9DWLakpOQuUhYS1T70Uf
	 6TlhjyIIO3rnJYMU8jqMIuPVI9BG2qlm06bYvfywLPBQQbraFJDfPBvB0+IYF2AL9rrBj
	 LFcCzqsmOMlai2mmAZvNdVdkq1bEDpj9824+trfLLropikyLkAd3Geo/MRY8I/rfR/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
	b=3kV6tcuu/GoM1WE2qmc118/GOBgo21YLg9Q1NWpoo/Zr4Q70Q3YPpg/wofbSjNsgRKcl
	 vGZlKXA5hWTnfk93Sjh7nDVKK+DMInlBZn/5+U84EknbgMEwNnRY0tvk2U3cu2I6Jn1eM
	 oeCftDRGuXhn38Y2ejKed4VOtMI5ipkZRrnAT3fU4dZQU5lDM/W3mhpKR90sptz+M5RwO
	 brRCTcQUXkFHPq/0DU01ye9l4YIEH1ZyKEXN/vBGbXSUkXxH3jeLN0CwVrdX/ivdTKEcT
	 zXQveRSfWQrjfcxKuWsUwZFPc48TvHN/tuZcNoo9FtsE10cC5BY0nY+S480aMsfWINQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdAfWAAx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Oy/jMqUw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdAfWAAx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oy/jMqUw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF2BO3557815
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=; b=Od
	AfWAAxGtG6LOeHQ2KO538LPP0mZuIUNVNfnGBrB6gzHMJLRmNNyvSk/+WWJytfb7
	KnolhRZf88/aNE6u03wyIDQ+U3X1kV1dRc80M4DiLttfCB2KyN/agwO4Bci+kPJ4
	P8VA4c8aaJmbDA4NlFlF8j6kPwNwDBZocH0MNRWnHHzHOUbFvagn1A2sjgEF9Bxq
	MH8doGnDWhOHT/ltI6eKRb0O2LCteAUDHLrD13vt2kiMAO3Cl4OJDJjV6+UdSARs
	aD0eXd+ndv9DvV9z8Ivigc5DKauI5wtuOTJG0Nke8LN6+HAoSk41Rkr+HD0t3mhB
	S2u2HYqB2UTd+bO3w9vw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79mhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:51:11 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46a5954cdfcso872154fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792594270; cv=none;
        d=google.com; s=arc-20260327;
        b=o6hryIqcCPnZXe/qZXrHCS5iwh2HQqnHOYf71/Nu2+FaCoZOypTm0ayjMzOfoM2utn
         ZK9gbRCPEzDXDhjiaySa+Kdh6a5r66xFT+q6nD9fATiMlpFVay2dsF0ead/zrjBXIpE6
         R8NuvmBtKi//8qdQ3DLODSe9UZN/sshLuvsnKJU7bRGt/xHRcuINzSsfL17qU68VKLjo
         hl9yKAkTlZV7qHnt7SGmsYrJCNiYJDmuBq+F6rmYw6AXuCqpwwF2vuySy/mWn0SeI2a4
         LOcHyLaCG0Hk1YZn7zdByvTIj1HhrYsy9BSpCc+KGUSGg5XI6YM/UC1og/zkimBA7J9y
         HwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
        fh=gygEbpyTERCeD47hXQI9MtTdizvP3gfm2HReL4jEboM=;
        b=fPk1Q6bf9M+ygDWjEZGBmEpSeUOCeD0xnpAMKeJeISdc2YXXu8hQjkO+kKbWivbre3
         iu3oIcepEk4ZAwIUYULFIAuExqjiGslskXGTOJRFfQxpiHAiFVThZpuBlvPgIe0Rgr0b
         3tNy+VOnRbXUhpWBe9sHaw24iC8NPMNbBrxEBRA4Qx0oiDJg3EG5gS2RHM6Vjodlea1g
         d0hXDY5DRXy1rQ2cweI3Mh9qQvdD9bxVdN1/BDPPLSr78fmmXALPmQmkXz4lR4sH6Eky
         2bzV+iKy/d+4Z/1KkgxqhRM4FhGOXoOZyY4pyRqjsXNhxVTebLodNhHQQwbePZs7wemQ
         9lXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792594270; x=1793199070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
        b=Oy/jMqUwlUJvrxYI1whh1d9hZ4e/nTPlj1WnJfVT0+Vn59KY6WS8zeaENyXyylNRB2
         oJzGRi+H2rX2L6gu41BFaNI4lZ//2eEOEx0Sdg6smrclQSxLF7zi/dkgQ0gC4rawZKaI
         hDdUrxsYbOAeC67m2gHXet6ksqyvgKgeVXHfjMqN7esGd8SUfarZP8JNjbOzzeumI5aZ
         oFHL6YXn3VeMWoz5OfJbRoGt0wp9sYnnhonC1FqBwvt6Ejq5m0Zr6MWMtd0vv0CvaqXj
         7xy7m/TF/vz2VG/KBGBEJS9aWwp+Gf9LNxi7K5q/Dc1rsCjMp66FzKjVYR9Xr2QhvJhF
         koqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594270; x=1793199070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5p9qlTx8BOaAdi//0zTq3lrbyfHYbM3+Yp/X8xSSIKw=;
        b=2pzTcyob2cP6PqyopMacY8Y83qmSvXPTdsJa+sZ1F/xom0COrhmxLYBZSD8USyBR9S
         iMNBx+eRUul/DDlhHEYS28eQUVP/hVxXauJ45cVlQ6dhCKD6472FKbZ5kriMZfFboW/x
         q0ySpzqwN6Ir5ne86I1TR8pf6U3lYS0iOQYU4AO+QzKKZwGyfLlbOn9Ljs08+VXcowTg
         vD0fWN7KYIAz8GjOiUSCA6DXT3ECK/6KgYsK15GKK4V/kbdtTZwLBDYhL9uqoYbTKSKx
         JoKZ59qqWnr4Nvzcnge+DV3SvOjo6wz8WAl14Z2tdkG4lojd912pBfA0NmsMtTWUXAAH
         QuDA==
X-Forwarded-Encrypted: i=1; AKwUvBwPyhSz+xApfg+V0StosuXGJ7Dt7v0vn1PLELO8CpNETEZudN+I83bbxpoPr61U8WdyGTSmDSrsv2BKiQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1+nEvQ2lENKNCBtfUKrHCkGb7mPI9K9u+6uy797xuvkC2e2Ie
	yACjDEXzaG3Nc14WVyqg0ZryyYl1Nr8+zDjEpfMpiZO5Gzqd0h3EpxfeQilQGnilWwZY4BREMNT
	Gt9sFPcFMhN24l1A9fH7PLVGFqUu2xAYg5ofVkPbd5MBrzJw7lKuJOE8GcCIxKgoJTmFLPbih9j
	ixa4/16UD7VD0EOKktvtTaAijotkofy6SoXPeBgYLCBg==
X-Gm-Gg: AYBFou2atlaNls6rKLqHODzvhPTeYWVrZAJn486fcp31lZvQlMzVyEjbhPMDU9uJvLd
	Om4ofliOTXjmVU/cYsxIpdfMR6B55oBx6y+ywdsT30bkSTmB1o5yXTES/Fntjyl4anQD9ulW7MJ
	JN/eUX10TXsMRRf5eJ+oti+Pna7PXrI7d7CptTTtkni5wPHZU7PV20dCQDaw==
X-Received: by 2002:a05:6870:4e88:b0:494:b8f4:9a22 with SMTP id 586e51a60fabf-4a7dc1f1813mr1321144fac.28.1792594270132;
        Wed, 21 Oct 2026 07:51:10 -0700 (PDT)
X-Received: by 2002:a05:6870:4e88:b0:494:b8f4:9a22 with SMTP id
 586e51a60fabf-4a7dc1f1813mr1321121fac.28.1792594269645; Wed, 21 Oct 2026
 07:51:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-7-robin.clark@oss.qualcomm.com> <daed5a07-7d4c-4597-bec9-7a537d0af4a9@oss.qualcomm.com>
In-Reply-To: <daed5a07-7d4c-4597-bec9-7a537d0af4a9@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 07:50:58 -0700
X-Gm-Features: AclHuK_273K7JWxAwm9ju6BwL2RphOQ69uYzozmpnUfx_cbgda8C-aejWgJFIyU
Message-ID: <CACSVV01Kd10wFrPKaG2GgcFoTuCXT6imthSUbbtBZ--zQszxtQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] drm/msm/adreno: Fix PROTECT span length
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: s5NB0_9BhNMHjWs7NoKohzJL4XO7XZm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfXz2OQPR4G0rQ8
 d76FWpPbUJQj+DhnPKDpCNEhDNuRLVp2RtW3nYNWcURuHBfGmWZuMQgGI/Iw7FkDv9e9J9LvRLf
 0FhWj5ZmRiEY+EHAqIWRoYkdyiGOmqAjdw1E6Au7tSXaUpjndM9wD7V2SYLCIqCwlPw2SPFsIqy
 YDyGOb8h/Vc9R/l/pM8SEKh0uvUztlje0ha2GvXyS4OMvzNacP9pMhAnMywZctHL3P4kOOyO3r2
 E6yc/Z6G0+8mWvddbUH/yNN7P0y5kL2Yygw9zVsxQ+mLjmIjoCzCTJwbKGqEtd9U7wPq5uskz0d
 VyLWr+5isqpkYeCh+B/z4uyKD9kj509HZbbAuP2lJ9VNElEqyh08CYur74A49a5LyLsMiRs6pvi
 KfVSS6wNsrI3eVSokdve6CElE3OdqXcf5vQW6ePY26vKzzJMEx9+KoBBxmzcvEzCnYBAxeWorde
 VsD1nVaxNDWtEY/lhtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1OSBTYWx0ZWRfX9A5pYn/3yXZ/
 B48IUrRprLHakMMDVLmLixJZGvhsfHsdiSEzNufl4Tuid4FFE5rtcqM5TnjFrimoRZc2ToacTsV
 VQtTuzXXxqO6uW8zI4bsMpCC7ZZUgwM=
X-Proofpoint-ORIG-GUID: s5NB0_9BhNMHjWs7NoKohzJL4XO7XZm4
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8d15f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=A5R5xhKYohY9jtTwzVoA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210059

On Wed, Oct 21, 2026 at 1:40=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/20/26 10:46 PM, Rob Clark wrote:
> > Don't let the length bleed into b31.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.h
> > index d60cbfaa0d8e..5e1f35c83d63 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
> >   */
> >  #define A6XX_PROTECT_NORDWR(_reg, _len) \
> >       ((1 << 31) | \
> > -     (((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> > +     (((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
>
> Time for FIELD_PREP()?

We have generated builders, ie. A6XX_CP_PROTECT_REG_BASE_ADDR()/etc..
which would be better but they don't play nicely with tables..

BR,
-R

> Konrad
>
> >
> >  /*
> >   * Same as above, but allow reads over the range. For areas of mixed u=
se (such
> > @@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
> >   * single register
> >   */
> >  #define A6XX_PROTECT_RDONLY(_reg, _len) \
> > -     ((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> > +     ((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
> >
> >  extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
> >  extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;

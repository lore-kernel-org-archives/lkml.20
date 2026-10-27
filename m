Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113547;
	b=QX7+sAW0kLptVuTsQeHKylQ9Eo3soSlsR3TPl6bKeXJ43Jts/B8mrjhtm7RHdwMB1zMi
	 fSY51izJhg8KbgNEEWKIQxsjxP7YGS4N/oHZtPdJEqflm+X+FnIxwJD85fGvIedgmCFWw
	 Sxgjt3RUwmex3eRVUhd+B49b9vbngDxcVBDK7m1HAedlaJuf8F/tjFlwKk/V+aR+IvdVm
	 9DtiqkeLkyKkjpYKf7RjMAyZ7yHZ63QxxYHeloipyTpY2mm/jLML1++fab+3ic6bIPNuQ
	 PKdt08SHYQm0ehq0/TO5U9HygOpHqnfJH4soYN+xSuNpSsUEg//I999kcUNx79sMwQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
	b=cRT1FWK0QUDQJfH6D02+EBRj5zVVtGJ8f4Qb8u1PX8XKbpya0qYuxFHVcjjOYxhL7raw
	 t0yBDPEcipsxMyp7Y3xEHVkW6O+0UFG34N8EHdLKVSyH9X4LYeAA3MLNjsLYIJclfBZQT
	 v8ujAtIvN49AwxCDaE3mrp1oUwoezKk0blYbJ2mXc2Ytz8ZtQNK36EtuqfgPccDoQhE/s
	 j1xQlczr8Ib4IZjI7xF9r/6pdr9+vz0l9KznenNXU3kYAD6oGzfH2qA0wbo9my1lnBgjF
	 Za3SXS7cqjFRYkKdyqG6bds1X/dJtBQeNphnxl0pqsIS3CWAtUTC0/HyI/93MaAgBXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBLzQzOB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwEMMlMk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81462606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81462606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBLzQzOB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwEMMlMk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoaUh2397581
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=; b=IB
	LzQzOBvSr6BEXk9yS9uMGnDZRQPwqxR2DPOfoP6G7c23HwmoH0DfgD4EfGnniGGZ
	WpGX6AC3dkpJdnc1aOZucGgeUVCnpI+JjPgGnPR3Jpipvj9JdRKOGDNnEMcPE1jD
	nVvRwRBnyMQcqfHS5OJe+Nr7nim7g9Wc80XiCGzeqD0hHlGPd/G3+aUFOGhenAUa
	RQA6oEe/hDUM1NsnOawqpgatrA5WOEJxqMoMMsTu2ueXl30VDSucSZ/CkbTGYU7T
	LzllvnaPLz0o8ySJjvdcTlfVcTkTF+ss6WYZzRFq5bsktaLoO99TGikwasm7CZZc
	1yR4n5ftJdmTr5yfgNhQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1h7a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:05:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so7239092eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113546; cv=none;
        d=google.com; s=arc-20260327;
        b=c8rPD9d+2GNkrUIVgp2juk+soIfIbe+lEuNsEqry+O6pMdud6ILIUw+d4XkuFSlw8l
         vpJfRwac3+Lnc+md2yHgpUKQdXTn5fVrwhJscL88+gG1hfP4YGlIx17iUZ1w52+GpnXp
         AXiyx+Szl5nrD2CCJZL3kE/EZPOQoN9Dy8d0Ax8PLz/m+MMo5fIVZMZeJSt9Keu5Zd7y
         nunFsTrBGyemXWz12GMROVVpjdcCgmzioGdpSIqiuVaaDPtzh7VFigpbQEhdXNqeg0I2
         z1pUogz9aaiJTARiXgSqzPYPlaNfslak1Oho/ZAa3w/6yJ8xDo2uubyxhaBcoBVvPoIg
         wz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
        fh=rH79WmY7T5V8pA8a5R4jxIpJJrw94wZtMWUloahBpH0=;
        b=VazbNqgPrvm7wLCYGtDSx0UNnAZNcqYpeOnGEgpOijQl/ecCHkcN8SPoIdGzu2lHQh
         k0kxPzzavLMzzAM4T7bWFpTKMeXmmCfRM9Bw7OMfJPxwL0rLsydKXh4jyOl3tcTBSu47
         J9KT1TKHtzMKr1KDoD9eKmBr5squK8n8IRR3ZIUcHDvuEGfTG1oXgdJ0sBHRUBDfswRL
         dLYyG9vTaYd+YoUEhOErYKkR9yx+LAr5nVAsIOqOSMnGfodbAlwHoBff9RIM1sUWf3Uy
         LHq63KFGhgjbTMwr3djOIf2r+bGSGA+8mG8ZNwhHswsyftQ/5b79G7T+5srv003HmzFN
         05oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793113546; x=1793718346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
        b=BwEMMlMk2MIKw8ilFy3F1YAkGKIeiJwhpTnnnsGfpJKY+HafPncuSCkunikEh8sgD3
         HFsI2yZXnMwg9g9qFmkJWeKl9YyrowAb+mKz5mAr5du3JBxgA8dZyJ0p57AeLVn5wlXm
         ZGU+JAEykIzI2kNhmZroSvHsWr/v9yNipulbjxPcOF9lvVv6Lzu53Mhvf+18MFwQaYDb
         exBtsK1qwqHaEutS6vXWHf/nunMW74KLkDmf48tGQej3nYqIwJWHYRiDKoqBgXfX7QP1
         +Avcah5Ebe3ai8DmoaItziVYsCKdeFEGvSvy2YTJIW9N3l7RcADTKcjJrvsiusZ0B+PA
         70ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113546; x=1793718346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0583vDhsBJ94xGrX9oVOV7g3odknMXYWYVTxKC3/IU=;
        b=IjKsMD3UJ/RcPrlWSmzzjPNEWKXjG7PexaCDbYeTqy1fF9Fbf87jGzC9Wz3Vqg7wLY
         NI054S3h4H64ql8jRexpscRd5fDDXl+KVuY0f8FpqJ/4SbhA3j0N3TMiZayjAlmnKiNI
         d0me+hZoeLBWyrOFLXVg02mcnOpeCShgd8aU99GXfchyAHbqPoGwY7cHNVCKZAGQUV8s
         9CLDk7Bq2Ne0yqcT/1oDbx1vx7cZKR1bUBSdzHCxtzWaWp8pUtL+mF2P8SnKVH0dRcwg
         tNR8QVQVbuEflapwD4DXCVS5bfw6fwe2bdXd94Wzc32pz/StDWrc71TjY2M0fRYdQleX
         AfGQ==
X-Forwarded-Encrypted: i=1; AKwUvBycdpX88X1drYVTKB9Deeb7oXqcrbe6Rk9U1Pk600ypTLcthspB3FFCEmrj+WlxAyKgE7Br4Bmb3zVukAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI48boWlnUvHZ+eRP1EWWdV0Fy1MNGRmlfrPoTu5T/BdqGX5I/b
	psBRdmBZrqKMXbm63OYLO8cjrPm52Nj8ai7bXLYBZewE+RF5v6/OOa6oQD0yxWEsgIvDoxyvCwS
	jejya2BfigEE/PAdjEgnYUKadFK9TsOy+USaJwUzWi/kIyfwp5FeXZORX/U6x3HQblrZH3A5vn4
	1qtllSNss+7gWBxPLmGswaxGmzkIXlMwu76s+6LiNtCA==
X-Gm-Gg: AYBFou0tGd6k+mj0CpfbZmnaH1NkVjecheqHlwxQotLF/eoPpx2FTLqizv0oPmyDPBp
	y5yNsUN0M1tOJq13tPy0loaxJwJqOTrXzuVtrsI+IyYOc/JKeAK3sPDWNkx4bTEYFOEe+yc279P
	lHtZ7golJtmsh079OfzSj0medS/P4Yk1FixkWcKm8li30dMSE9q/lBx6DjKw==
X-Received: by 2002:a05:7022:7f06:b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-19935be807amr14865952c88.19.1793113545467;
        Tue, 27 Oct 2026 08:05:45 -0700 (PDT)
X-Received: by 2002:a05:7022:7f06:b0:18a:d0b5:fa42 with SMTP id
 a92af1059eb24-19935be807amr14865912c88.19.1793113544807; Tue, 27 Oct 2026
 08:05:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027141430.20258-1-robin.clark@oss.qualcomm.com> <2dc67d8c-f406-44e9-bf54-12704a8792de@oss.qualcomm.com>
In-Reply-To: <2dc67d8c-f406-44e9-bf54-12704a8792de@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 08:05:33 -0700
X-Gm-Features: AclHuK8pDkPsUbP5zSTLlPCMG5M5jT8vFmaBsciIzHEhLjQPlBsATNz3gAReJ9Y
Message-ID: <CACSVV00VNNWaQ7Y7PrzHeQ+n=E_mh430+OFGmQN5+F_B66Jz8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/gem: Add some cleanup.h
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Bart Van Assche <bvanassche@acm.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0bdca cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=xJAUt8zhRqVQzByVXjkA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: lkFxZ4J0vqe8o-irwOm-Q3l5smwlJpxz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MCBTYWx0ZWRfX5RcwnDxw2Ouw
 m6QUuBLaRH8LVC07LTl3Kj9XSucjp7ZG7T7slUigO/T1+d/01fF3l/l2RpVmKA11JSpkQh5o/Gf
 KdibsmO8Ih4iXkpIktPCrCpZ+ARpv94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MCBTYWx0ZWRfX3MIIy4OB4kF0
 GHvmbBybUW1is+GgjRNifL9lfrlrXnM2D+RnDtiAHPtVTFnByUEgH1Utq2ALIuEjVU6u5jGvKiG
 yBsBcpX2PL1BOuEdJ6sleUZMVnXIygzD/gl4fjd/BlHKYs59IJXoN/FI+4BZVHahuznptctHPdy
 RuZOaPsPHUU9GCO31p8mNVjQsYLqaeqEImx4i37l5BtUSHjUX2/eCC3v5vEAUjPLKVr1gW71pYI
 ZdDMVE1nLiAAwtAtUP3gCXXx8PltHDQvniSc4d6vQOb+oAfzrCeo3Ts+OInXbTGjykFb6SWPt96
 UKhGv4C1eYK/IQtVUtAZ9zfR+/UDfe5L5AQglHA4irFhjKZavL6LHpdNigC7aST8zcrAPwzLbZ2
 VMS7mjQ7hXhZnqmxo5W2DMQTAPbA3KzTqL4bDFZEjyLkL5G+rAl+dF99AX5qTBIyA9ZpOrJjGQk
 Aio6KYSHXgjiYGsRNkA==
X-Proofpoint-GUID: lkFxZ4J0vqe8o-irwOm-Q3l5smwlJpxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270060

+ peterz for scoped_cond_guard() question at the bottom

On Tue, Oct 27, 2026 at 7:24=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/27/26 3:14 PM, Rob Clark wrote:
> > Convert (most of) the msm_gem_lock() and friends over to scope based
> > cleanup.
> >
> > Other than fixing a lock leak in msm_ioctl_gem_info_set_metadata() ther=
e
> > should be no functional change.

oh, I meant to drop the 2nd para, since it is no longer true after
rebasing on Bart's fix

> [...]
>
>
> > @@ -608,26 +600,20 @@ static int msm_ioctl_gem_info_get_metadata(struct=
 drm_gem_object *obj,
> >               return 0;
> >       }
> >
> > -     ret =3D msm_gem_lock_interruptible(obj);
> > -     if (ret)
> > -             return ret;
>
> LLM is a bit grumpy since this no longer returns all of the return
> codes that it can but I think it doesn't matter

It is a bit odd that scoped_cond_guard() doesn't seem to have "proper"
access to the original return code.. I think I could do:

    scoped_cond_guard (gem_lock_intr, return PTR_ERR(scope.lock), obj)

not sure if that is an evil hack or not?

I've added peterz, if he has an opinion

BR,
-R

> There's a couple of single-line-scopes we could shave off but any
> which way
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

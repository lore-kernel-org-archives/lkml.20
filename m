Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693353CA69
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879077; cv=pass; b=ExK5uO6OKQSLOUIjNSSbiS12kAdSCl5J/GGyFi1SzaCK/oi40wXkBxlZ8pvu5cjlTBM6RSlL4MjYRxL9ILNClY2+H07WFxJ0EQ8T7ByTTi5+xVbbidc0neuy/1EDNEBDqiZVzoBrTDjEikw7FXj3X+jkOOMjYFvVU3sy6q1xE6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879077; c=relaxed/simple;
	bh=/jR7Rwopgs7l3OagfV3+qDefGzA7KmXlsVjovFHL59A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNWsTCC9Rs96fwu4XOceY7JhWsLGzTT+c4/SL5RHEzBDIaDhtrPz+YXydT42P/RzBJeywKQ0ct3RFrhK+VPpmoiKBvUX99z7spLjmp/JmE8wIUtxCrHw9z+iW/SH3cJCmo9jla5nP5mjyV7NpE1RfArJ56071Z7bG5pLjeI1YOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk0HbjE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i14hp3Rs; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk0HbjE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i14hp3Rs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjtYm2070061
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=; b=Mk
	0HbjE8oCx5M+xQXmdGUO7rwOhnAmK/xbe/aPcsPgNPzfxl24ZCe14/I57BnVLsE8
	noFbHwmCzdXp0L2RbbSWNZo8eV6m0ykWPvnomEfxIbPB4lkpXxAlPIy6Qhin0c1d
	ESiWE2O3oPd1b2GT/mr2CWikjxv8tCQ+hCZgs14Fhryy3HlR0ztEnTmvwU6aiu6p
	JCxbn1jo7gn+lF8ZT483Ltu9sIwHhdNh3NUCj76bInt4Ki1XTmSlGdA4ayoil73e
	RbuQxBdmsDMwEjyGIhcosRtWsACgj5Y4B75K9xHsOBUBMeLxgqYUb51Z/nbYaXnz
	Bfwz+n9fa2bEpqY00V9w==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjkshr8de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:51:02 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451d80641efso7505159fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788879061; cv=none;
        d=google.com; s=arc-20260327;
        b=neJN9WiiSg5lFyPDKK0xiPnxIigED+0w0F8jJq4I4Ca2jyqhSUHrN0mRk1+5NgT+vb
         JJMzoTWI5WE9N4DUKon1g71C2hormafGyLccmjZ74Mc93R+Pt+z7rRsIliyU41HLWTYI
         uhEt7waS/05Yg84mDZyVc6FCBPZjAeWCmx+U3/mLw+QAFSOb4bR2qhxyKVHBZ8cT0XUl
         3GoDAsfj4ZDR5+mpaDZ+xIUmrvykA8+LImg2qI7A7hZBo/WctBlzIZI1yAVeTanFgGUY
         EVPSNjLqJgINRPKJm0cofotGJKNRFmkjZCy26nCywYOVkznFK/oTAweq8rkZhFKaI5vP
         1I2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=;
        fh=u1ZuvJ7ZhCCiwofe2Y+XQQxLR/WlbliO5Av6fdlralw=;
        b=YQukX9l7YpsnX8YqGGHomM2PtwLmHNF+tzlUrAEIXRwNvNfSmqEH0D6E4egUcYwFGj
         zFLYVIMaZzKf+S1RfjTNQxCMyP2pqFRuodBw83GmoVPypqeYuNia/BWv/tyCea1337rF
         +YlWXZGgPQcnVoEhQarQsveUkRNjZm3nadXhNMEsrcrwPU+WiD1l+KRrU8zYstNb4w+q
         sdaUea0zsGOMkDISnQPqX9cwDlqOdsbdNd8ufk8Of0JWQtzvqvtDoMKiVqLNdyx7er8V
         n/nn/xfwXD3WxDgDfnlqbOxYPejJez4rV51O1B5vrxNS5kBxCR6f+Ab7IfZES9tlCwC6
         +IMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879061; x=1789483861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=;
        b=i14hp3Rs1WPqUOkiKG+fg3tyRQ+kbzwv4Vv6wEd+TZK+nimzB1RR2s7aSYrKXy9sD2
         5r1em3FTu1f1jQhtvM3C74Vtk6nXkCoBvNohqQZoF+byLyRbAgm102UTMsgQRDNrUw0p
         7xONBlBn42vPFB6+/IkbwKC22y3eCObeKkcPwY4EP8bfEWTA0324Z5aKTvTQEBsMB5tI
         gyRv6XK4kkI9sFWAyvyndfRerEGrAAPCwjkFh8yZe54FSXiijr3fzdS7PiAxuB58mcV0
         84hyYFXLhwL4/AxDu2aCtKKH54yFm4ZAu0NqJZcWVhQfnbx5vBybfUrrkFEfjxYWgKjw
         s5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879061; x=1789483861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=;
        b=ZAV5inGebvRmtc1z7DOxvcGHLKkRktDz1k4zN3B/YNuea440Hpj8ySDsz61bL1laaX
         y79aRtVe4JUUrKhsFJvKjFcJ3ujG58G0Jx+AzFvQn9hM+6WvKz4lLKuqPuFIXDlg+zwg
         TTNUgVSmjcabGpZQJOFgUZYUiArzVfVBNhE6QnQ6riu8JrhkCaOmVHWD9Wg2EdnDvIvG
         eP3Lz0ZksArAawvtOzzbVSPijKyvQxgqyxcB2tRdWXVs4x/E5Jv3eFEDHWwzSNnoxj1Y
         t672df6gwZUNfMMoLTSLxgF3JAsv/xdLZg3N/e0R0M8U1fQ6MroTYJHfxQOwLnH1AOds
         gy7g==
X-Forwarded-Encrypted: i=1; AKwUvBysXhQliVi4ZLkfjf+iCXQ4fejS4pVA3t4MP2G9VOIGLzNNAuEKLE86Miyy6HPijUW+ho/Xpvmm+FjE7qI=@vger.kernel.org
X-Gm-Message-State: AFuF++nYrAnonEmjQqO6w6wh9wywcWOz2M/lj0Rgxe3zRF3aQrDCdlwy
	BvCrA9APMmbFW/wsUDmFCzDL1jeYdGtzUC6KvFKNGvvkVp38bAwhqNV1RdSl5KEpewv7X2A/5mL
	Ubf+3G+pahcTB+SHaHypx1SjVnwBCAafRHeK7FHyDaWjglg7wPh8FQPJWfKo6aKBIcYegehNl8a
	iF5mocjpoobCPvJTt8sBd0XTD4pOGZ2UNxZWe0bakgHA==
X-Gm-Gg: AYBFou1YPabu2PGolJ3h67xIYdiQdOHTkKJSpWslaWnJpti9iA46tZu7R71K2KOfiEP
	jWUQqZr6poGUKP3BaqwtAk5Ga0qY0C+dVolGGBsIHNlAbPDmkIVoT5G6VYmiUfZ36qzhFw+8neT
	IfQoKOEIRnZbaq/u5y0NwVDk5oxArTLzkfrtLCLOVtI6ockQJRn74LBRuq
X-Received: by 2002:a05:6870:9124:b0:45e:d529:40ba with SMTP id 586e51a60fabf-4755158f2f5mr19089686fac.4.1788879061213;
        Tue, 08 Sep 2026 07:51:01 -0700 (PDT)
X-Received: by 2002:a05:6870:9124:b0:45e:d529:40ba with SMTP id
 586e51a60fabf-4755158f2f5mr19089618fac.4.1788879060667; Tue, 08 Sep 2026
 07:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com> <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
In-Reply-To: <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 07:50:49 -0700
X-Gm-Features: AcwNN1XMi8Pi6r5G72nQXPV504KYen-57fgrLczceh4tvG6Q5zpbewONJu0ggJA
Message-ID: <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfX8LFMDgzmkWCR
 m8t5K6DK2UDT2snAAy+ZPwgaFlYKjFF71LZujoB5PiQMRAdw0epwiG32CL08n5lImJPwhk5ouD9
 7sG0zEVr95K4LHOuQ8eCnFcGn+U66dY=
X-Proofpoint-ORIG-GUID: 9ZEJuRInTM4wHmeq9jiNPosOEGXAtrQ5
X-Authority-Analysis: v=2.4 cv=TammcxQh c=1 sm=1 tr=0 ts=6aa020d6 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=gJJ0UDS9VYZS2QgkKrkA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: 9ZEJuRInTM4wHmeq9jiNPosOEGXAtrQ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfXw5Uj1+wrUDdf
 cc+yTMfBI/2sN9wZWnRyR5JjfnGFsMeROvuqAlN9NbL+IgBSXpsmWZzSYYkDBdp6XRWL1aRCZAd
 lpRFwNPVBvf3k5fVRYpnSyieO9hDG/zE59pnQz5fjPJ46LDKXArGFHUE2rmDg4L/WclhO2g96y2
 nV2S3Eh44d6GBFp9CTW1NHIS51fbeqx1RF2VvNs7XVn6G5ChrRH3F7ttMDC6r+DJdDSDwoIHcT3
 rdKZQP9QepylkuA6TJZLfQ19XvxPCt93KeGM1KW3pCGH5gmZuwK9HSaY6+L8La0kNJmGczvc1EJ
 Y8kvcjuWJ6aPtOrAU6mCzZ2muzKQICCrLwe5n3PO7kEMWOBK5481VKvSL5wD2t4Z6CtANlJW7Rn
 vXAWLUDdtG6MER4N0YXneSwW4+m2LsBbVv0XoF/x+l7e6dKcQ1TzfF04u6gaZ5CcKLp3yP6VsqN
 y7NKNCR1MhHj9XTx0KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080158

On Tue, Sep 8, 2026 at 4:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU po=
wer
> > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts fr=
om
> > > > zero whenever the GPU is powered up again and the timestamp reporte=
d to
> > > > userspace jumps backwards. On an a702 six reads three seconds apart=
 all
> > > > land in the 500..1200 tick range, stepping backwards twice, and on =
an
> > > > a530 the OpenCL device timer conformance test fails because
> > > > clGetDeviceAndHostTimer() returns an end time below the start time.
> > > >
> > > > Save the counter in the suspend path of the affected generations, w=
hile
> > > > the GPU is still powered, and add the accumulated ticks to the valu=
e
> > > > reported to userspace.
> > >
> > > This is useless because the entire point of clGetDeviceAndHostTimer()
> > > (and the similar thing in Vulkan) is to match what the GPU itself
> > > returns, and now you've broken that by adding an offset.
> >
> > Just to clarify, the timestamp needs to match what UMD reads directly
> > from hw in various different ways (timestamp queries, shader_clock,
> > etc)..
> >
> > If we can _restore_ the value (ie. write the hw reg) on resume, that
> > would be ok.. but it doesn't look possible.
>
> Yes, a quick check shows that all relevant registers are write-ignore.
>
> > Otherwise I guess we need
> > some scheme where an offset value is stored in memory somewhere, and
> > some coordination with userspace to add the offset in various
> > different paths.  But the kernel shouldn't be adding the offset to
> > what it returns to userspace itself.
>
> Ack, thanks for the explanation. I tried to match what kgsl was doing.
> It reads the GPU timers directly from the GPU, but for the CPU timers it
> reads the value from KGSL driver which accumulates the offset.
>
> If I understand you correctly, we need to export the offset to the
> userspace via some extra page (like vdso) and let Mesa read it. Correct?

Yeah, it doesn't look like there is an existing GPU_READONLY && !APRIV
BO we could re-use, so I think we need to create a new global (TTBR1)
"vdso" BO which is read-only to the GPU but otherwise accessible to
IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this BO.
(And update msm_mapping test in igt to validate that it is read-only.)

(I'm not married to the name "vdso" but not creative enough this
morning to think of something better)

I'm a bit curious if kgsl handles this differently.. maybe there is
something I'm missing.  But somehow timestamps need to agree between
what is read on the GPU and what is read on CPU.

BR,
-R


> --
> With best wishes
> Dmitry

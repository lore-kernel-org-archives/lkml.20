Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634B46C852
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391504; cv=pass; b=prKM66YIyWj9LvfF3T0HbcZZKKxrig/CPsLq/iGOhhXmDF1IwtXjy48ie/eMDcEuAozjGG8d2uEImYDAGZAjbPb6vFwtFIXSLUqyhl/XyhXcp7VLR8ghBby7/WysVZQmEblnL/s6+sC5GN/+ZcotDC3OvBqIy7RVihf4cIG1WvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391504; c=relaxed/simple;
	bh=B55hy0c64L5iGDKfZOVK2tkRkiBptV3XMV9lB12/8bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWwIzcU0TiQwbCJ0UGfrPMaBWtcTiDXqf6zetJW/I04V14edsw9psF2o1+xuFqNDPzN0WyMG1RsC6knaOrTZHFRsKuj3FP3exdENE3uCI/PgZ8fvyuK7qqXTypTO7G+qR34WgiEnkg7N/n32H7h/WjZ9RUnHdVec7skuQLB4oHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlOYK6no; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/FnrFjE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlOYK6no";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/FnrFjE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0iss1200889
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=; b=Rl
	OYK6nomNLUYUtxkEBUgGm9alaMEh2kShikXrceQC75dRTTpHSf61ufnfShaoM6Bm
	IefB4HCE/4GyQ3Dl4zxOBKquwDzdnNFSlIA5HNJcRvr+fAk/EivHGDLhINeMbJHR
	M4IY5srTnn1+9kSDAjjRzwqVpZD4J7YwM7YJQZKe5cmyvgYrUI8yqugxXd1PXu36
	0v0nGHh3OCmfxfP7u9vFI/Av+XWEHPqPINkxtAZAtdg1RPApSA3GvCWrSrYwgI3P
	kGZaar+6q+nWOhSrkDFhwSzrbxZYoicm0hirw+bAuwuP5kF5Soz97awS/BbAdR1A
	N1sPAshK9dRvuO0vQAbg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevs02u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:11:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso5772014b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789391501; cv=none;
        d=google.com; s=arc-20260327;
        b=NR5yC+o40nU3dQt5tb3aohQxTxFWnzTlLqZlV2bWS+vzDih4WMwFpzXcKY5MrQNd8f
         +rESOgYztT0EX9Mw69975n/bT8gJm3fwGxdO7IwZHkxP++7syShHsAPLI1hb0CSL2UyB
         l3my5oigSmhviwW2oh7SfTlwp++MaufqkGvqlE7qD2/vZfne9rpPzzzgFRy+pX9JQH8f
         OjGAwcRNX/m7Z67+22E2SMH0BnJO1eUne12EGAxPhMJUNNkigLOafzSAgspZ/k8xsQal
         hvYS93ndBz8dXzQTm9ie4GMb9E+utBpfKoHL4ITT5Ymj7uZ7X/JTzisgiXLmxBiQ76J2
         3axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=;
        fh=L09IA6WwO1WgijN4VGop39XIVvE3TihYRCicCC7IHnw=;
        b=KbiZP9V8XBS2R3toQ7RCc2eplt9l3rXpW4NyahPioOnlIsJKh4wMb/aKwEFEN9dqOT
         1KDwa4mNyD33ZIFPzlXrFL4GFYiIdGAXxWaXam2agKDWEvE9ISMCmjZbgQ2YVNfG9ubL
         jJ9Kv1SfKQu6K6YxnU7c5o32c0YlNGAc9p588AAGdf4z5q9Xc4VPL+iWJzYh3hkYRgXK
         1xqUtwVdnILoe5o8hkyGB/FWsBNFwAyiporUHl8lAj5KtqK6sJI1xrCZYQy028XfZTq2
         sVBvCEpffNavgdOstB9HI/mCgyCrvnaP8ytquXcRScSdECz1tYW8WmKAd3JakwdALwFx
         Mbyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789391501; x=1789996301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=;
        b=j/FnrFjEA/8ZFedUwdIjE3SSsafuOIoGJuiW97ovxH8YxqkuiXdB4bdsrUKrZLgXbj
         4+WWVdMqSkwRK86qw8oF5f3pM+WCcx3jFR4iavQ0mO7HRJXAgaLX0JmUflpOgf94E+tI
         PAbW9H6AJrFtclJ0xBBmJrKJIMGUVn4ZBJbWeGP2g8sK5dI26U92H/bLKBs2Cb3KIaTf
         zWfwlsJ5KjTUsp++ZFkObetVI+s/DCW/yGp/kwtpl7EFXbX254DFEjttJzV/PAvPFOVy
         1440cHpuFpkzzrsxpWCEFsk4REzfFJxrgyF8/lAKsWz01rVAEbJyPXjsX8yHV1sstUd3
         qI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391501; x=1789996301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=;
        b=PkVH75PY++2vQwkddmI67f4dpgvpL8EkmsQMTPQr21ZVPhDo/lFC+864/uA52bLXHT
         GGWFdVWvc44iVUtGSr0Qb3y3SlxonMD3UWsa883/L1FPtnbZF0fwVMPPivr+U/mK35OS
         nfW1oEPMO5uPbUoxYMID97PbhnUSukTa/VfFaeGL0odAHFz9MnZZUJb32KD8pnv3GqyG
         7d4Ata0TsDBC+0nDy2yMWXJQq4v6B6zYjLurdEeEeI8dQcJ8keYwWkUjZY/YXhgjZ7Tc
         duK5ycKLr2TBS/zexCPW9VO8GamE0sfxtap2UUID/yH9GPyE6VpQ4j5jGiG3epal7mBi
         rFkA==
X-Forwarded-Encrypted: i=1; AKwUvBzNP9evvCavI5BUyCqzxtvY1ut7CAWBmWa67H5w+0Yoa0ulo+V4U5N2RXSd7TguJr3kPuSyxQhuu+57tvo=@vger.kernel.org
X-Gm-Message-State: AFuF++kiee7810H+rPR5OYxQ4s4YUegJfMEsO4RJnff06z6o2vlhiW2j
	96g3BEQsSSpPeHlU0YndLqE3zNTtEZQyIus3o/Rlao++u2GoUtB4Wj+atFMUq8rAcIGN3D9BQVD
	Ab7fB5MVLV5J1m/vsHr0YjwRA2rCrz17tNGEi4cbW5bbxUUHX01c2fZRzo8mKBnUASoM0BghdUE
	xmzGVZW4HilGxFStWhXEA9h3X26R4EGn5LojwZlyF6ow==
X-Gm-Gg: AYBFou2p2h/ARmBG3Un6K0Z5a1swOdS/yAF9IUzhX0XZ1awNZRZQAAtW71PEMDpGZhz
	c0XuEeSXF9rgi5kBxP/6ndI+BQyJI4C5IZwjXrEmCRQNLeV8S6S67VYVwXo8UXt3YutJvTBhwQ6
	SyQR2Evq0pANBZzRIx/Yu4yUhYgPjVpauBXXOyLXNdzp06C4BdtjbozIo0
X-Received: by 2002:a05:6808:6801:b0:4b5:5bfd:518e with SMTP id 5614622812f47-4c7b42c5fe2mr1784230b6e.20.1789391501531;
        Mon, 14 Sep 2026 06:11:41 -0700 (PDT)
X-Received: by 2002:a05:6808:6801:b0:4b5:5bfd:518e with SMTP id
 5614622812f47-4c7b42c5fe2mr1784191b6e.20.1789391501098; Mon, 14 Sep 2026
 06:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
 <20260912145922.24115-2-robin.clark@oss.qualcomm.com> <12b7dc43-b9c6-4cd5-bfaf-fac8bddd7352@oss.qualcomm.com>
In-Reply-To: <12b7dc43-b9c6-4cd5-bfaf-fac8bddd7352@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 06:11:29 -0700
X-Gm-Features: AcwNN1WXFzG55PRo053-QCuRiZb99AXL7fZ42PtjLhwj0qFmTajOFG4rVvx1MtY
Message-ID: <CACSVV039xdc2+VAAm0-m_LaYM+uwGWFm2Qc0oZ0oSSQ-GJvWGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/gem: Add modparam to disable shrinker blocking
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: P7cthBUAkQ2QyMnDbVWbELPjaLn6x_A8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4OCBTYWx0ZWRfX+jRZxcAYnO/j
 fMV9egmULT/5cLI4Zn3tFrfwb6WijWDMmZdFlRRdVhlEJGefry0kyI1AG8NOYzysN2hkL1BkxWu
 Kksxt+EIMT1GQs8cSqYjreouST+gqh0=
X-Proofpoint-GUID: P7cthBUAkQ2QyMnDbVWbELPjaLn6x_A8
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7f28e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=e9D9l_ksrzWtAqLwVioA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4OCBTYWx0ZWRfX/4bb/Gds5IXq
 XAKO9VUnDafwOJqEGUgunoFUFEy13rDzrziMPsDzx7dtCQjpFIKxI8o1w8/1+octlIaF0x39Ddf
 GBi1walSevhiESJgCykq8PH+Yn3WbZaNrXcvAYrmxfMVfSGVT3C/wqBGRyGzyq9YF3P5HRaxMZL
 U1O7Wq7XK0IsPYRpM1AXezDPaMNZN/cWn44BmVEZmaoU9gGevKRcKIT25tkJ2V7Q7cQC6ynqTfM
 vPeMjzAuqXqF74VqDvsSlbkRc3gHt7ev88bfzRiblZ5shC98CMKHMs1XWat7f7gueQEMvMF4e7s
 TgFL6waUOZPspF4Aysw1Ri94Sv0DS7ozHEMrrz646wc5f8SDtXIN6CbrExd0lYwxbq+eJ3uLg2k
 crGdybQScQd1vgXd7upWfVfmrrebM/s3Oht4lzgoXgOnYOpVBUrStbWQse5/m6idM+9qiM2/Mw3
 kcfMlXL1KWcPwmwjqqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140188

On Mon, Sep 14, 2026 at 12:56=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/12/26 4:59 PM, Rob Clark wrote:
> > Normally if we are under enough memory pressure, the shrinker will
> > eventually start waiting for BOs to become idle.  In some very latency
> > sensitive use-cases this is undesirable.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/m=
sm/msm_gem_shrinker.c
> > index 3514d5c84989..83ee032cb21d 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > @@ -19,6 +19,10 @@ static bool enable_eviction =3D true;
> >  MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
> >  module_param(enable_eviction, bool, 0600);
> >
> > +static bool eviction_can_block =3D true;
> > +MODULE_PARM_DESC(eviction_can_block, "Enable blocking for GEM buffer t=
o become idle for eviction");
> > +module_param(eviction_can_block, bool, 0600);
> > +
> >  static bool can_swap(void)
> >  {
> >       return enable_eviction && get_nr_swap_pages() > 0;
> > @@ -26,6 +30,8 @@ static bool can_swap(void)
> >
> >  static bool can_block(struct shrink_control *sc)
> >  {
> > +     if (!eviction_can_block)
> > +             return false;
> >       return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
> >              (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLA=
IM));
> >  }
>
> This is just a guess, but can we always keep both and jump out
> of msm_gem_shrinker_scan() early if we can satistfy nr_to_scan
> without locking?

We do this already.  But a pure vulkan/VM_BIND userspace that happens
to have realtime compositor requirements (vr) has a hard time under
heavy memory pressure.  Without BO tracking the kernel ends up quickly
looking for anything to evict and not necessarily making good choices.
I have some half baked ideas.. tracking LRU vm might help, etc.

BR,
-R

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717895;
	b=FTiZjUe/mUNyqqUK7xgTo3gjBo2bQvC43wwHLjXOLdNhdz31erZ3tJIZnHlaH6SfPNJ3
	 IDUmRjnoFi+wRzvvi2kjVZmiAkHnJkuI0egilpzeZQmeUUpP3kELCNdxz8jIrqzBXcQ6F
	 fIeCkF4QXOZjj0ETWL+orU4Fj/uJa72eNBMBG2r3wQnqdO2d1xgY3p4IQ6XFLlP38Scal
	 U4wX/UlvxYFh+Kyzg4s3cN9Y+5s8+kSw2NIGvwTRteA/7uJKTkyNW+rDLeCuiHZuKDsXu
	 m2b6eD6vvyMWQCLXzcjWaMnBFb4XDidmQHT4txVbZn4trmvd84fxX1KWJ0b9S5FlW9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
	b=dqb7asOnD/ArlZCYJcr4sXPjcjXJArjoM4v2wfoegQJQf+8DF3P7nRS3Nz6DByooVqOq
	 oI1mGhtZLtEX2ALBtwF+ppWdplOOiFKZDojx/1JH02H80vBRCx3emsAAGNi2D77PIaRPp
	 0lFnfO+z78TaAigwFKg4ZVPlLrx1CwQD2+WlRSNq8Y692tEP28A+7frkVf7LjZvDULt/D
	 kxkgqEEmrcPAbYvn9P4RM3E7MsbH+bneLHAqdvmK272wU/v3xFRplBB+XOZ0o0bQ0iF4g
	 QzealqxD+wwWG0J1RJcaJsGBFLrqE/CMApPsHJC/8rZJ3lyTMOg1s9tqBlO1zmT+4aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TUE/mQJ5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ii+nLjZp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445126083632
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445126083632
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TUE/mQJ5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ii+nLjZp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAM431453481
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=; b=TU
	E/mQJ57EWkOciSfHqXbEljCXj4YQ+LeMzgJqnoGcvwiAjXinu/xJq81JNwv21b4I
	yu4Nz7YPi+aWs4zdITnRGhOrcV1L+3xxjLWleEKn3/QXCySfHcHjSyaGQSYJxia2
	/RyO5eO/wtFWE0BJOv/XL3juMHs4k6rROjNji6ved77sl8Vj8fUWGOMglXL+V8VD
	E+kFHq5rWwAGHhsWlPFVdz43RRWxElf5jrWz0lIk0PfoP7h2/0je32nj5E73mXrz
	RS72qMkRUOgsYSxFkN6M3SzMjqe/Cf9qrCPrCSbhxLbQNH1dHL4SNf1SaZa0zGFZ
	uzOFsWvZ2L2DHW0nFpxQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07em9jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:58:14 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cbf700ddccso3660043b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717894; cv=none;
        d=google.com; s=arc-20260327;
        b=pGkk0XWiFTJuQf/DXUjD7UfJU31xy1mML3zPi4mUYfsMDH0AMt+VxXjX4Zkr5C0/U0
         KI1bCki8/gBKF3vtrfXuWWmRdvFVBm7/15bBeF823WdFHVftoN0HfT1TBgO4KZ6C15Sv
         R8pKAAaNe1NJHIeiw/xYySZQsiwCkjkxu4ayVo/Au3Rh/eZT/wEivD6La6rSNZ88j54Y
         WkZEuIdpxn+2x7nFDkjZAR/TN84N4dj3wXRT5tr8rxHyTqSxMgfrwyVNvVuNYmslvxsw
         cYbXLfoZdsu0/GVauL5R9C24rxvPukpQFo5YSbZi8/JEKCtpo/kxMoRjymdyoeRoDsff
         Mb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
        fh=afBocC07o2UEDGQI1tsWCKcQZNWDJxTMrqEs4e4G8Co=;
        b=PzUc8txkOWL1w5cEpdeeKvN5ptG4VftOr/nV6QWEMuz4fwGqTybIN+WHNOeKNfeNJE
         +bLMPuNVH12F9xjvQUcU2varkh+nHAVTq4Jnwv30oRFJY+EsrQ/oiWd1ksSENZDIbfZZ
         MCZFOe1exI2uI7ABTRYEDonUpd1OSYWdGANFoCzTxr3wjUyEKAtJ4iDqTpxhW9CWFQRf
         JQcdkNWqA45mILYBKAdclR9AnKcjAgBAszq1o/iP6uvh+hDUMsMwxFCzrL4M+pSGc9CB
         KNQOe8h4Yj1ha87twP6pOky6l+MidenVzbui6VazDT3I4viuTcJTkNPXiBP5CdMzBIrS
         FSLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717894; x=1794322694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
        b=ii+nLjZp115wVjvgfHz9fhmOQMxUeDOeSazPSiN6FSxiSjxrvLOh4qEttjMmreJUcH
         X2ZnPXgAK0ZQGLuUYLHw6TNAvleFdEVG6nJ23WBkJwO8g0AD4z0yXWsDLYe36gneHtjY
         4BniIZo+W5MLxL3Qo0XurvQf/+2Prn/UIAnDCPhC+IuI6bBvfOltaAKrGa9kMgNc3aQF
         GUIsPY8WNk0OXenVMxGuKzG2pMr5WDI0TZ6hwirNMFt9ZvcrF9ATm8hDAVnSSyzQkReh
         PkySLuApp1TiUDyKmsHw881izU2fVti+etO0j085ybzwaAR7hvvdrLj5HFeRIyvAIe9O
         EmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717894; x=1794322694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpod83vmD8+b5six8nkD+H3MifQwihy9OfP3u2dB1nY=;
        b=o8YG2ze43StRAz9mKErUADXPrHXmbmwxLIn1fDwHZ11X4uMfYNfMRyIENLCv5zNxXM
         Or4v1uW7M1yn9MIsjaLt0PwudfJQ7wVFwF488nzjIKXj+uhV6PHgQcYXhd4VYsH/o2HB
         JaqO+iRObgr3iOoD7XzzSgbYm+c+Jr0r2lKgLkswppoqVHsx+XL/jqTlViqCN2P5ZoPd
         P25fXDenubjCjOzO/41DEpZvHSSjZmclEHASd4Pqc0KJ8k0+29YNGAaVC0PhuWSmm8Rs
         9egw9BKDhhyMS21Fb/HE6f3cQ3lsfPs0dcimioN6hUooIqrGQiYKqO+f9ShctFMRFFB9
         Smow==
X-Forwarded-Encrypted: i=1; AKwUvBzWnH/m2FYnSZpPT/itEmBCLyEFgOX+YqzfW2R5oa9HvPByu0PKUVQLT128cNtCgqlXTs4gmqDhNyTbMu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S8iaOnD491P17zOn/ODG7/7ZSO2woB7VSo6jV0Jmf8/YBitIJ
	cXII1FAW5O8EYAP/ekgdxORstglIIzWFcell01LFkwAFm/3WGQcIJEJJeMC0zAyQ9WKX2cpOqa5
	Vv+o3YltOtKFDIXpSii/SX72U+s3imUQoPRRvo6v8n4edKnXDzqEWN5m2wxVYU5dgyD5sQuZwfh
	H8WdCGnRO5k/TTaBjhZSgZ/e9+Pi2qw9IPzYpXY2ML/A==
X-Gm-Gg: AYBFou2iqx8rlNimmlhZazynwRQFNYXuUVl3ef8cnwOtrqhJzkzSmQ5CdsGcjarz/l1
	PPok8uU8pYtorB//y7xZ0XwysD0W7DsDxLDyqc73m6eoE71smEqEFf2wizfvYe9FUEmHl+Zv0+r
	FVji9bWI5oQfdadVkkEHjBaSTFDZPuoDMc48nPudxL8qjGHXDJxw8ngLFUTsvQyw9MS415V8gLH
	ppd5S6AEQDUSoxbZMXIjQ==
X-Received: by 2002:a05:6808:2207:b0:563:c491:8b5f with SMTP id 5614622812f47-5640de2851dmr8710154b6e.47.1793717893533;
        Tue, 03 Nov 2026 06:58:13 -0800 (PST)
X-Received: by 2002:a05:6808:2207:b0:563:c491:8b5f with SMTP id
 5614622812f47-5640de2851dmr8710134b6e.47.1793717893084; Tue, 03 Nov 2026
 06:58:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com> <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
 <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com> <d4b18854-0e02-4fce-b168-d4e80035aaa8@gmail.com>
In-Reply-To: <d4b18854-0e02-4fce-b168-d4e80035aaa8@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 06:58:02 -0800
X-Gm-Features: AclHuK8GTgB6Euj6Jgwafzumtco69LVrTffNhbBVo0jvz2_1fame7MYtQsB5bOE
Message-ID: <CACSVV02_vNP4wnSvk7GQF9oueQh_aPer1UdKcVHHjLg_0MYfew@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfXwmn1+AU2ln3P
 VKqB6x03dT8IoihEKkDEcQkf5m1ct9rTBDxqE4e+OgfNHSuPwaULjTP162tPe8ttuAtMv6yuA1b
 ZAl0R9uqVcRpsYToeoWTTBg8saNqbcagx/bEVa7SFcfTsrLOehZF9PDuBoKhCwKLpiq6rrevf2a
 N9ywmHOrPXNVd2LYViWWxUrbdkX4my2lfzaUsJE4VCBom7hMS9aJeOXa+hyE2Xb6tMrahtvP6NQ
 OSDlg13BMg7p0x9p1z2z39hN5GCknMnmHm/4VgYjPwt2p/Ykk7bzQzZ53niUfWP4GyLb6jORpgh
 Zl2QX8NG+sKu7afjXd4vZv6RLpderafAv1CcZ5ajzP9MTL5/3djd7JA0Ae9hCW044xdsDhHDKrq
 qqKN2+AqFykIIjj7ixYuRzn2lDjIlMLjWoeT7NXBHYPWH50Nn3wAI4LuZ/Npzh58vfHWbOl5bBf
 J7I4QejaTCI37BI1Y1w==
X-Proofpoint-ORIG-GUID: epVhgG2jZ1qbwK8Egu8yW-0lolUiN5qK
X-Proofpoint-GUID: epVhgG2jZ1qbwK8Egu8yW-0lolUiN5qK
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9f686 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=bWKnDnX5kYEKHeIC6Q0A:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX+iUgH4pmuMQm
 GirTBZir3dT0c5fteOKykeT+pT2rFHq7EPDE08crh5SRb0CRS2/jJm2FlL69vDqRo8DtSjuXSbJ
 lQ4aNh2ElKjLslCy5c9P4H+eNgBO5hs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059

On Tue, Nov 3, 2026 at 6:24=E2=80=AFAM Anna Maniscalco
<anna.maniscalco2000@gmail.com> wrote:
>
> On 11/3/26 2:58 PM, Rob Clark wrote:
> > On Tue, Nov 3, 2026 at 3:28=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 11/2/26 8:00 PM, Rob Clark wrote:
> >>> We need to move the gpu lock around a bit for the next patch.  Use
> >>> scoped_guard/etc so we don't have to make the error path handling mor=
e
> >>> complicated.
> >>>
> >>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++----------------=
---
> >>>   1 file changed, 12 insertions(+), 19 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/=
msm_debugfs.c
> >>> index f12701e286ec..aa59b28a3392 100644
> >>> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> >>> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> >>> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, stru=
ct file *file)
> >>>        struct drm_device *dev =3D inode->i_private;
> >>>        struct msm_drm_private *priv =3D dev->dev_private;
> >>>        struct msm_gpu *gpu =3D priv->gpu;
> >>> -     struct msm_gpu_show_priv *show_priv;
> >>>        int ret;
> >>>
> >>>        if (!gpu || !gpu->funcs->gpu_state_get)
> >>>                return -ENODEV;
> >>>
> >>> -     show_priv =3D kmalloc_obj(*show_priv);
> >>> +     struct msm_gpu_show_priv *show_priv __free(kfree)
> >>> +             =3D kmalloc_obj(*show_priv);
> >>>        if (!show_priv)
> >>>                return -ENOMEM;
> >>>
> >>> -     ret =3D mutex_lock_interruptible(&gpu->lock);
> >>> -     if (ret)
> >>> -             goto free_priv;
> >>> -
> >>> -     pm_runtime_get_sync(&gpu->pdev->dev);
> >>> -     msm_gpu_hw_init(gpu);
> >>> -     show_priv->state =3D gpu->funcs->gpu_state_get(gpu);
> >>> -     pm_runtime_put_sync(&gpu->pdev->dev);
> >>> -
> >>> -     mutex_unlock(&gpu->lock);
> >>> +     scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> >>> +             scoped_cond_guard (mutex_intr, return -EINTR, &gpu->loc=
k) {
> >>> +                     msm_gpu_hw_init(gpu);
> >>> +                     show_priv->state =3D gpu->funcs->gpu_state_get(=
gpu);
> >>> +             }
> >> My clanker tells me we can't grab the PM reference before a mutex,
> >> as the recovery mechanism depends on the rpm count being appropriate
> >> to let it drop it (and kill gx this way)
> > Yeah, but we also can't do it in the other order, or more specifically
> > disabling ifpc needs to come before gpu lock or it can deadlock with
> > recovery.. but ifpc disable needs to be after runpm get.
> >
> > Re-working that ordering was the whole of introducing cleanup.h, to
> > avoid the error path with mutex_lock_interruptible() after taking
> > runpm
> >
> > I guess if you are hammering on debugfs while crashing the gpu, maybe
> > the first recovery fails, and then a subsequent one eventually
> > succeeds.
> I guess it leads to a sort of deadlock scenario because the recovery
> path waits
> for power to collapse, though it timeouts after one second.
>
> After that hangcheck will have to trigger again so I guess the delay
> introduced
> would be significant.
>
> I really wish there was some better way of doing recovery that didn't
> rely on
> the counbter having a known value.
>

Yeah, I don't love it either.. but also don't see a better option.  My
best answer is "this is debugfs, it's only best-effort"

BR,
-R

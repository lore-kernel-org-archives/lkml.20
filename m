Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB943A7E9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122298; cv=pass; b=l7brT20plAclyGgLxvC1gzv2IsdfsTWcuhFsUf5fpzBAv9OTun9yrZ+bnOzoS97ujT/G7FlEITeMwLX2ZpkboPZfUfUc9yIl8Sb7NJuzVL/vMYEwkJe7pS9Ljf1wQ9JaqfDhJZ+nRdqesvJ2nEgzmFu+TFn7SbMl0B5bvwVodUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122298; c=relaxed/simple;
	bh=WEaQ6XiqVtg2tmigVy5JhaPpL6oItqqeQ0+x0LG+yaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcUUh2SKArCsP8IVss1D6TBezY42QEoDsBlEdXmBm1qtlZM5bBxxAXp9s3aM9kpoNUUfcKN70V96flk7a9n6ZZrz3781R4ESuMImAGzEKROo/cMr1/UOod5ER+AmBnX+nimQGUnTVfEP5aqAtdEu8Vba+e2VHUGsXF8hUU3l4qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiH6Tam3; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tiH6Tam3"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8aecf8568b6so4868157b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791122296; cv=none;
        d=google.com; s=arc-20260327;
        b=KcaoWr7aFqPFm93iZyPVmoHshMU3Yl34TNx1Ore84WTj61+6HpwzM1MrZNCGl+QvWq
         SsxIaNawrUX9XCTyQC2i6TRwlbMWb0ETHcbP6ZFwtcFnpd+W64LPmRUCmUi80LehBylj
         Y2T/nuT/XGVTtmUDwt3DoV3YyqsmBdXiNfH9nlkPYwpmzUuKKZxFhKX86OXTzf60XZ1b
         IJjn2o0l/Rmm/zchF3nr+Hw5IzU5K3wTeym3MuXxzGPPlXBlE5jJ6I6emFTwzmj0+fos
         tHAirsafWioxCyIPsAqYqCv8tfoipFhOiKf3EGQ/VWhx97EP48LNjlDLEDYA6yLf9aOu
         xMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        fh=83TVoZsZu/Wh9JHsO00MOLh0+T5fPrmc3M/rA5+PXNY=;
        b=UihRSmtPRFKuxI/k/YxV42s/8vE+ol2D1BfR4jwtBP9hlf8KwMhvh6lAsjzUedAPAA
         ncYsGNDlrnTaFUNLO8ElBeqbKSRx9kBJl/FmLp3FsGZ61Uy3fUFcJf36USLTLtGc26l8
         e2O+RJl5qWj3xll+tO76+VtVyifalqcty+AG7ZlnwsFSkMQF9+RHOT6W7unPORSPCwb1
         QT2yc25kruHqbUCztojc4bVKghsvT7/2UnyyhO1uW637/ofwuEPLE4DfyMiPjBeYdIws
         A9jMqae3WL6hJsp4b9F411cl6KPEarG5JigrMLsyjJOYzEV3FxD1WLGeTp7EGSfgIpj1
         rynA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791122296; x=1791727096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        b=tiH6Tam3uTd2FiXGSp4cxy7BQT2SyfuRaZ2ny0fStEJfjXUAfxIDYl47qa3HDFdivA
         7ptVHFPAq0PEDn6+SxhA+luVp46kSo+f+m86prEP/wUCnjmL5nS0GZY1DNx5EdmIMKoy
         dUTTItSPg3XFyhJca9mxAl2hSH4xLIN+/RwupcrP8r+k1Asmuc17I6Y3O/eJ/r5cmObt
         P3ai1msSZCVD/MhY4AfciVOn72dvDsR2VZb2o8Gus4wOlwv5UI62ft2xOoNbJN4ILCK9
         KowIRK5QzV1LmRwSqx2t0niwkcmMoJqsmlE4XT5bH+ODeig7tDD0UPn0+IE9arsW+VPE
         FIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122296; x=1791727096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        b=USKFuKfqIK5btPKbVGsBRUmAEiFgwzyKtGFS96agyqUSUu9YMmlys/FO+IZ5qDGy2B
         S/F/uAPTmjK5uoWjq2he/Wl0rSCE8RThazGtdqD8aMMjURIe4WgKNIX8BySjPT9zm0HF
         tL0V/xhsynvm5iP5Ddt9H6v0XPTqkN0vRfZ5TePUIHOoYSa5thUoKU/kUF8tWgcHQzta
         8uouzkg3yIAPCC03BtUZ3jw8ef83ngOaaRdr1ws3zy3k1YBAVEm9uyJ+AJneroFWzoVa
         ylIgWZWauGzU6P1oZA69fymgfjQHRmKOHFlrvmYR0E5y2PJ1ZdIA/KLa2+xLfr2DcCfU
         qyrw==
X-Forwarded-Encrypted: i=1; AKwUvBzT9tMMs/QyrIfiY4NBd3OlDJrfMSRcqi9vXOyUl4Yp0YKSvYYAYsPu+bbcJQAjSwc2jU9Ps/OBCftO1xY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx98hOxbQIChH3u1x3/F6sBOG1JQG6IJc5iEShEMwdmGiKYq0a
	go08n7859L/jzK0a9mDoiaOuWcmCHuN6E3RaqVCvq8JNn3FiKjZL8X8WhC92pOKRBZ8EGgsfgZ+
	EpPmGk2/Hul6VZjSNYVxT4cXIXRlxZ7ZWNvziIfSiGLaCrBStuyv3Kzc=
X-Gm-Gg: AYBFou0C/6QieSjgHxGLbd76sWaiJV0hePC2ZtqLRXcPyebuSrAjK0eaKyJvuECQ4Tp
	09HfDnd7B2D3KuzH3A2gnQnR74TwSFTI+zMpfNS4k4W3AMqwUEcjB1O2DiuansNyplPv/RRf7Vp
	aydCEMkS6UeR65LMCvQko1Di3ozELq89MLhJIQ8N9oU9DBTMPngnP0AL2lqnUoebaTwYUi+YmqR
	p2gyHturDHUMIJzhfasNiXeeCBHLyh5pS6jlTAZSEZ/FAf0l5QOUojjRzmN+rT3OPkkbU8YI1zR
	BfhxGu75tqO9lc+CQyJbwmkS/nnbSeV7nGXBDIvSXiYcLz+qvecQhCPy7kitmEgO
X-Received: by 2002:a05:690c:c3ec:b0:8ac:b167:4877 with SMTP id
 00721157ae682-8ae39bbdff2mr22844037b3.36.1791122295720; Sun, 04 Oct 2026
 06:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
 <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
 <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com> <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
In-Reply-To: <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
From: Jun Nie <jun.nie@linaro.org>
Date: Sun, 4 Oct 2026 21:58:04 +0800
X-Gm-Features: AclHuK9hzkrn0hz5wdouvmEqGC_OxpKSvbDPHUzvFuTecXtty7kAzmgPFKXJfPw
Message-ID: <CABymUCMGT32A5gE+a3u7=-3scH_Nu7Amb22-FRfWiNrcEOnAgw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel configurations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
10=E6=9C=881=E6=97=A5=E5=91=A8=E5=9B=9B 03:43=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 30, 2026 at 09:52:48PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B49=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:05=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > > > Some devices treat two independent physical DSI panels as a single
> > > > logical panel from the CRTC's perspective. However, two separate DS=
I
> > > > hosts are still required to drive the panels individually.
> > > >
> > > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > > allows a panel driver to inform the DSI host that it is part of a
> > > > dual-panel setup, enabling the host to coordinate both physical
> > > > displays as one.
> > > >
> > > > This change does not force individual panel driver to manage
> > > > system-level display topology if the driver does not intended to
> > > > support dual panel topology. Only the driver that set the flag to
> > > > true need to take care of panel topology.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  include/drm/drm_mipi_dsi.h | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Do you have a single MIPI DSI device, or are there two independent MI=
PI
> > > DSI devices? In the latter case, the flag is wrongly placed.
> >
> > Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
> > mipi device
> > to notify host they are one of dual panels, so that horizontal
> > configuration(width)
> > in mipi host can be handled correctly. Where do you suggest to put this=
 flag?
> > Thanks!
>
> Into the msm DSI structures. We already have several Qualcomm-specific
> flags. I'm thinking from the 'generic device' point of view. The
> 'dual_panel' doesn't mean anything if the device has more than two DSI
> hosts. You need to specify which hosts are mapped to L or R channels, etc=
.

How about to add below 3 members regarding multiple physical panels in
single logic panel. We have h*v panels in a panel wall. The index start fro=
m
0 when we iterate panel from left to right of the top array of panel wall. =
In
XR case, we have num_panel_h =3D 2;  num_panel_v =3D 1; and
panel_index =3D 0 for left channel, panel_index =3D 1 for right channel. Th=
e
original framebuffer is divided into width/num_panel_h and
height/num_panel_v for each panel's DSI link.

u32 num_panel_h;
u32 num_panel_v;
u32 panel_index;

>
> --
> With best wishes
> Dmitry

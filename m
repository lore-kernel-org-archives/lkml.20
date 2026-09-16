Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEA94FECFF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602761; cv=pass; b=cVAmzLlzQzfZKcvFBq6/3Jp0vWswyy+RYYclBxkZGkizGxGjIbYwAWzaNJb/h8lpQMPtCGvAfQiZv7mvUfQIHc1/2BMRq44raoXWF2w9sGkMgNZc45c1GIlXEqFfMf8yVvaOBAxsdTB5LK/Y9cLAhoZ0WelpSMAYwlUnJVTkMrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602761; c=relaxed/simple;
	bh=uxCUV9YlsQ4ETsoVuWj+Drc9fcipQuUotBDec86K1v8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aK9k6gdlGNc66V3bDGK2TiveJvo7b/bpbFfKLqntTuXDGvCm6vGuhNKa+5xf5O7wSCjh08coNKsUtN2WI4XwWgv9XMCeDoco6nOvEQigRuZUb4SHRmtdro3sroQ9VFUQlI8gohdVM+agL0ZTgSTmWXvDbiOdw7fR4gIyrwBSoTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GrOnomwf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X4xEhUj2; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GrOnomwf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X4xEhUj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789602756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxveY0gK9JFrEbJosmnsDKRmBotP9lpgucyith6XnGI=;
	b=GrOnomwfMeSOPMSm8v97+2SGQiRXjgabOBY/I9UtNK16Yf8L3yIQaJ49o5lo9Yaq6IxkDn
	ah1m4XQjMSXdWfemprxwIcNjyM/dX/1m2oN/f7Nj5rbNJ0ZLb7b/X7i1PsWPy7omEov9XF
	hJht9LXswCmA2R2dZam9FTPlXbI0sFg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-j0QrPFgUPsy2IXzuYnZnTQ-1; Wed, 16 Sep 2026 19:52:34 -0400
X-MC-Unique: j0QrPFgUPsy2IXzuYnZnTQ-1
X-Mimecast-MFC-AGG-ID: j0QrPFgUPsy2IXzuYnZnTQ_1789602754
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91064f6e75bso7585406d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602754; cv=none;
        d=google.com; s=arc-20260327;
        b=MFqiFejcQELjaxgj9AaG6ez8wv1SFvoiXj6EzrG7bOOWqS7qRjwUZsSF6JSeAGUqnL
         HK97PbTx93MoRblvCEZyTUOe5XEwDG1lxu/rrUVk0Q6/rSoZNb5Pub5tpYz6rWpI16ey
         4VfeDhcW3k8oKwMj8TScdKGGTjlUhZPED3gJ1zKBtl29u4dKz0rot6PJgTZ6K0c2/OgR
         vmlM0eIQNjjwWL42pAimOcNpSzYUhrWHfqKyQl28nk+aYCHu28pCZeB5EZ/97odQ2kwO
         oq80hkKRzZG4lg9J8l+d1CjpVho6kfnXh1P2Do5/UZybvwwW85nS/XLO5w1jI+QRoO6C
         TLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XxveY0gK9JFrEbJosmnsDKRmBotP9lpgucyith6XnGI=;
        fh=P52V2mfwl+PoTnfzh7YhYvUT4bahihiJuFK2FMNRLhA=;
        b=sNpvWhHaWYegm26MQ2ISszHNWN4fZLhAHwJXDiu8CSaHEVJyN9BTA5VkRCZf4OLz0i
         k+dBeElnDcA9aCYO8NjXA5oLOKjV1nmW2OSE0vsumrnRQOQ/XcW5eHab1sdd973foyov
         VBdyeTKNvgV0DWS6kBAGqT8cQzf/0AYt3YMBYDDZx3MbKYOYC7r1XdZnLnPZLoq+9VOW
         /Mz9nxQTEBTTegP+XKU1zEc1c/eGYw1xhb09DobVolExRdE7LiozQRad3qq2/nSGf8Me
         0SvWVP9ev1X+kYlDPhMnVakIjhDfXLPoetdQ31a61obOHl0i3NxCBqM/Lw2TblDaFFqt
         QnIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789602754; x=1790207554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxveY0gK9JFrEbJosmnsDKRmBotP9lpgucyith6XnGI=;
        b=X4xEhUj2XwjdesjtibqNYPX612pftC5FnpnUBX4hcv6IgiFj7Kj3yxaYQ36ouyL4Hb
         eYzWd6smj415Gb5eeut5Eoifh9nlwN577Ey7dZRIQUjahN3j8NWzTqAYscrULYNltVRL
         tG9CxkjqG9ECd3fl4eaB8TU5yntRlv8C0MlBObQMaM94dWUm+6p+dkG+Vo/IsJoonP+5
         wtIbCMcxdweCWZ0I2ujBDVWgyS5A/xnGQ68PdUC0eriVfW/snlVyZ0YXFFt3PEawjZ8N
         F7wT//e+etZ9VPUKWu9NFsXOF3zuQrpu5i6UMLmqU8dnl5DY3tUy9d1+hXWIVC7CtuDx
         uEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602754; x=1790207554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxveY0gK9JFrEbJosmnsDKRmBotP9lpgucyith6XnGI=;
        b=n9W9ZYkpZL8lt0daa0Qd0yRWMUInG1ar4XV3PcVFkVHSj4QhqGMJjzGskVZOHEPAAZ
         0rrJjrd7g22fSUdCmAnDvy7ciukHr+HWf3wqyah7iPBZz3iC4GTcZRhShJL/87rAM138
         63EYPj4uKevLG2idH9pTcVfTdpweOLOFbZUVWBrwrLZ4IBeamynN56vYmHq8sS7V7r11
         MIGVHRYlnCh2LoOVWVcErLJL9LeZqa2mtMRUcreA+tH8lrVSBhfFSPjzdYc0rOUVKquk
         jIsNS18lh62Jd1IcT1Aw+vD+s8XSWc/g0EhasMezu6PH0j2cyRrQrJ3PKqVPRY0u1I1t
         nJ6g==
X-Forwarded-Encrypted: i=1; AKwUvBxyaR8IT1Jwd2mhHgBW4q9TJ7Y6BesVBTr+7H0ztzPIBBTObrobZoZK6ochxJA3RvVWCeUzZMCjw8mmk74=@vger.kernel.org
X-Gm-Message-State: AFuF++lrAfkAjDm+42X7oeeUrMaPTmc3tB4UlhwfBXKJOHfLSqgWCRTG
	cn6dAKAp56nNcJsccrh4O1KJOCHthCS9NSeJ+614dDRH+KVQ58+y77dnUxFINmfHYLQiYUx3Gai
	7csb+EqKLsxAdA6zzO2gyWoZgxDkNDniIRUPyLTd4TnYi/aKP/BmgI8FMp36cJr69GCniRFre+V
	MpXb50GlLgU/rli/uanbzIL6B8Q/cLLMQUqH55r5J9
X-Gm-Gg: AYBFou1BYwY2XwLf2XmyCqYK/VmnKvB42MVQF4JEM1v7k6FDrZ5xBgeGHUUN380Gw0j
	bLkhN8N6igjctyi9Ug55NMNMVjEespgKszoNJQcN8nlW9LuKdWHprg3VSxa6ppPrLpQR0WCRPNV
	wtYeDZlh6zys8m8Cd5/LIAU7kmoCY185DA1bOJlxVdD4K7ifwllS/ntUbrf3oQP60KpdC2tnIra
	qynBrzDaFzop23A
X-Received: by 2002:a05:6214:cc7:b0:912:c32:f67d with SMTP id 6a1803df08f44-9123d71d88bmr87785856d6.5.1789602754220;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
X-Received: by 2002:a05:6214:cc7:b0:912:c32:f67d with SMTP id
 6a1803df08f44-9123d71d88bmr87785576d6.5.1789602753822; Wed, 16 Sep 2026
 16:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916223358.507351-1-lyude@redhat.com> <20260916223358.507351-4-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-4-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 17 Sep 2026 09:52:20 +1000
X-Gm-Features: AcwNN1Vhn0Q92zF9XK_q_kVcWg67HkJPIJKmLIMdoKKm-T5YZ3FSW1jZ1gt4KBo
Message-ID: <CAMwc25o+rVLRvHPqmurPJtPnqHupx4SNz=ZSrStwKm+GEejFng@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/nouveau/gsp/r570: Add comp mode workaround
 from issue #3172217
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	Mel Henning <mhenning@darkrefraction.com>, Hongling Zeng <zenghongling@kylinos.cn>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 8:35=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> One of the things that OpenRM does right before initiating fbsr is apply =
a
> special workaround (nvidia issue #3172217) which temporarily disables raw
> compression mode on the GPU. It is later re-enabled after resuming with
> fbsr completes.
>
> Since we don't currently save the compbit backing with fbsr, this shouldn=
't
> currently make any functional difference in the suspend/resume process. B=
ut
> it will be required for implementing support for saving and restoring
> compbit backings from the GPU.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V2:
> * Fix gsp object mismatch in r570_memsys_enable_raw_comp_mode()
> * Clarify debug message a bit in r570_memsys_enable_raw_comp_mode()
> V3:
> * Enable raw mode before rescheduling FIFO channels
>
>  .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 48 +++++++++++++++++++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       |  6 +++
>  2 files changed, 54 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> index af5aa5065c3dd..fe618a94461dc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> @@ -26,6 +26,35 @@ r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool =
suspend)
>         return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl)=
;
>  }
>
> +static int
> +r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool enable)
> +{
> +       NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS *=
ctrl;
> +       int ret;
> +
> +       ctrl =3D nvkm_gsp_rm_ctrl_get(&gsp->internal.device.object,
> +                                   NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGR=
AM_RAW_COMPRESSION_MODE,
> +                                   sizeof(*ctrl));

I think all 2080 need to be on gsp->internal.device.subdevice

Dave.


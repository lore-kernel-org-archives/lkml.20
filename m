Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C473D3D12
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371071; cv=none; b=OBPP5RuqAuSlZbjkth6oc5qa+HQNO60Zc2xduco+IE7HGGBJCpgKgfPjQVBrU17SSFTOIKuOuUau6WJpYj9AozXLPrK/RsZbY/dhG7xDuo31vVJI+I2R2YdddBPvfKdl9kRcu/jAL4XDEypnBIepC9j2NW2xI4x2eKmdElt6V68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371071; c=relaxed/simple;
	bh=qHQ93L30NFby/srZDdySh0m2e+fnRmBBePN03ypWWIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YD6dFyCoqKEi1qp2ZI+/HUxqpo0nmuxF7CN3kuoe32+qg+GgF6ksPengpjQfQdaLJeHWsp4I/c9+tSWjNekoOQ81JoKgpDNviMsoF+NHxM29ULA22Fr2xTHKwf5q+W/HysTFMtGKIEtlsPOnISQaqOTOPzU5imOfPzftVBh00Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ks6GxPvt; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ks6GxPvt"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id A5FC1C4FB3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:03:52 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id DE8A8C4FB6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:03:51 +0300 (EEST)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 26328202BBF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:03:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1791371031;
	bh=/ORScLc1VcbIK5JR1EFjJBMDK2APU9vpafe9mtl+7XU=;
	h=Received:From:Subject:To;
	b=ks6GxPvtiTKZMBrbHw/jO1Y+pjLYbya87NOGY+bHBHPs9RuxxQ1WoUWDhF+UFLpoL
	 Eocdd2T97OI15Di9jmkkMFFtz5jBLXmerxzAnFnTgSDjb8J0wxhnMXhlr0oQV+Vnbh
	 Q0HaP/RUoFzfT3yIktwsu9pzQgH2DC/Dc6n7p9EOdnxDJfx6sXa8qWkv35M1PThb5H
	 H9V9x2pJXlQLxn5OSTVQMODqg2To5Fn0+DFjwJDiNtDQcgu27FG7+Cvm63Dzjw2eHv
	 u5dbrxszK4C91WrzMlIErJXz9mnZfKDk55lQswYzLXcFW2xaY/EVw6jeGd7kOQvklD
	 ZElD/brttw1HQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2db710396ffso10063105ad.1
        for <linux-kernel@vger.kernel.org>;
 Wed, 07 Oct 2026 04:03:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwyQkI2gdgTWm2iDY9FS48sHwCpjNr9ccdLkyTaiLjhX1l/d7LGJe4sVi+9iOseij/say9jdJd+MF16MfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPfofh/DSuGAw8M2UytJSNI8CM39kcEeZg2xhU/EIdfzH2wOuu
	fTRtSCbTT+0/UCm3pDjMWX7rxfXV9c90vQ8QsxTuhNeAhD5SG2aS5KOhcFPjbCHskWXgY1j0M2l
	2qGfF82pZEGjl35wciF0puMvB/0T9zD8=
X-Received: by 2002:a17:903:1965:b0:2e4:b6b5:b305 with SMTP id
 d9443c01a7336-2e5c4f13f83mr34551555ad.2.1791371029771; Wed, 07 Oct 2026
 04:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179122226568.6.10663878730330541363.1670962442@8alias.com>
 <P3C8cUq--F-9@tutamail.com>
 <179122346529.6.9250312386131579603.1671009695@8alias.com>
In-Reply-To: <179122346529.6.9250312386131579603.1671009695@8alias.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 7 Oct 2026 13:03:37 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
X-Gm-Features: AclHuK-cXbFB-0vE-IM4fcBx-I70z_Em108_XAEikMcFAi55s8GX1AAXMfJVxqc
Message-ID: 
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
Subject: Re: [RESEND] ALSA: hda/tas2781: TP3407SA evidence for the January
 custom calibration address patch
To: linux-kernel.supreme403@8alias.com
Cc: tiwai@suse.com, "Ding, Shenghao" <shenghao-ding@ti.com>, perex@perex.cz,
 baojun.xu@ti.com,
	kevin-lu@ti.com, sen@ti.com, matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <179137103138.308136.8414771598714403164@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 5 Oct 2026 at 20:04, <linux-kernel.supreme403@8alias.com> wrote:
>
> Hi Antheas and sound/TI maintainers,
>
> Resending as plain text because LKML rejected the previous message for co=
ntaining an HTML part.
> ...
> Limits: only the primary amplifier was read on hardware, and the final re=
gister snapshot was taken idle. The listening result is subjective; there i=
s no calibrated SPL measurement or controlled same-volume A/B. Current main=
line and for-next were not built and booted as full kernels.
>
> Unlike the January Ally X test, this machine's OEM and firmware layouts d=
iffer. This report does not claim to fix the Ally X's separate symptom. Com=
mit 4fe238513407 introduced the custom-node parser with the BASIC-only assi=
gnment and appears to be the appropriate Fixes target.
>
> DSP SHA256:
>   a29f522c22cdb203eb1af84846838b5ef76c3a2c721760c7a898dd35f9ce1430
> Public firmware:
> https://gitlab.com/kernel-firmware/linux-firmware/-/raw/20260410/ti/audio=
/tas2781/TAS2XXX10A40.bin
> Original patch:
> https://lore.kernel.org/all/20260107093134.583873-1-lkml@antheas.dev/
>
> OpenAI Codex (LLM) assisted with diagnosing the quiet speakers, validatin=
g the existing patch, preparing a local reproducer and drafting this hardwa=
re report. The kernel change is your January proposal.

The Ally X had a different issue so we never merged that fix. The
commit body would need to be amended but we should be able to merge
this.

Does anyone else have any suggestions? If not I can plan to resend the
fix in a few days. I will not be able to do the testing for it (no
affected devices)

Antheas

> Assisted-by: LLM
>
> Thanks,
> assembledev
>
>


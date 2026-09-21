Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B064746CC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986996; cv=pass; b=TVnFXHcM+i4gvIy4JVAPMT0iFPVqveTMqLmbMFd0Z/KC4+muH8RUZCf7H5KPlaQTJbdIw+uNwE0DKp0Z+T3DUvG8aPW8xuI7Jxng4wKZ9oWWIUNmh3NaxNX5iGKITyfR2qcdFkLkaIvLsZHOw/6pcPEFdIWxTjqYLxrsBWlqLsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986996; c=relaxed/simple;
	bh=tgcbeSCZ60V4Uq3SzPkVuSOvbwuE+Wldbt8NJtFM49w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mI6Qgn3/0jjF91GcJ2RiEqoYWgyVFRz7Gbn2iUz4JZpydHtuYJWmBFi1d/jN3tZt1fv2qhL9l9mJnxZLmRhbeVKT/Z/zK0Ft512gEaC1JE56550Xn00bFPvWNOux5yXdeYuvr+8CnAYfy27QSZD2OGirpmGkwQ1LXzhBqQa5pfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sd+6JFXq; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sd+6JFXq"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d2so2274668a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789986993; cv=none;
        d=google.com; s=arc-20260327;
        b=bml5uBh7G6n1/GH1MX4WP2JJv5RhE+DQgi/MEny+HGr4O3p08WVJ8TaM3UZDCIGpBr
         vQzvl+uSjF3PaN0uk/pc2pSy92iXKKTKQXHpel5gx7xyRRk3mzy4rgC1jsIyr5pukkW1
         cYQQ/EHiUMy7Dd/LWD/mQI/N4kWRcYZABsoGvsIm/t60NxM9EpkCYYw/D8Cpk0vBco+h
         nO9bOWJRT6bDAdAk+QCGOqAnuAKPINDFVV5ypAAfNowqeSDBWOdEoav3Dmu5DUr7jHzp
         Ee5rHojQu0cmVPY3olfApmCTA9/ndacZCWf04t23IZ7fynDflRe1Y/UIf2oW3ocETK+N
         kGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        fh=mF881Vkh6wtwXd/9zbFK+6S8hxgJGXgdDEuHTSifQz4=;
        b=GYBSZhdQ2D5RN4C6D3oIFbNq2w20eb40JgrVZFLfOoz/VjPtgnmRiYAge/Y/Skaz5t
         VkFHMM4GkEW4BPwogPreGfOGFYXE/UN2hX0QRjHrBO/+iE7IeiAWthWzxaRj79IhmNgm
         9jjwqAQ8KSIl/12Yvo+rH7BqGduT/pld2R+9usTT2YMg5Wy+B9z7m/vPOeVqIwRkxTjO
         MauEv7zSnkgcjlN2o12+r47NIqpH5p7NhRPP5I4UqTgndVmK5Wq8W/7zoyvHNJicNIx8
         9wKYzJtZezACwYChWIFYgM85+n+TiOIyEEixK+jiQ411ylLW1a5mRTdgvob10/XMnEY7
         FHuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986993; x=1790591793; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=Sd+6JFXqGyBFMEWfi+fEPY4u9Dp9u6tdPWZjrQa1b4oyWG4vVy/tHid3sWNRjKbhzR
         mJt/q1cnfu45peb8OyZsWdgYrZlfiWelKFywkibA4xFeBbnoXnoPhFsDD3u70QcuJa9R
         /fmSEuUZiovgFLf1RZtbueIax0vY0a+QSi72a2belA1XYUo4Q0SaV5uCxjdRGdRQCzWT
         GD621IWI+DGJ20dEHSSDtXRbfvDH2W8ZP+4ptCkaTlpfIuM6g4/F6RWTd2G73punhYSI
         4whdi4sbDv3FYeshDeWtmYPbO9RY1GzhHKPEJbDbzRWC5C1csDjzrSW2/7HqBZp/eQq8
         sElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986993; x=1790591793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=Lye69sW4k5jjIBlK4dOJgM7nTJKTpvD+Sue32jyF23vFefNYW6gIAstrGIHP+w0xnJ
         cRwBwGEAadnYI6pzwZrf3vnG7DaE7CE4l+y6BM+Tg9/U8Mu04sezOKrrcAfp9Hr9vBoQ
         WwzPGktnXMGoEneGEVJEGShGg28+722Nih7MvjpLXzsq25/ECj3OGOj4+5HhgS5gnreS
         ngA2MaibsCPUzFzy2PK4R0zVhc49VAVoUcCukqMdMbrMCTsMrjK6jb/Jh/vXNv1qf3Y4
         9MabFx/sp4Eal+QhhnLnXYfwfQWnQmS3RtDHslrrlm6eh2ME/vL3Lrtreq+6QXZ0m0EW
         O98w==
X-Forwarded-Encrypted: i=1; AKwUvBxIBX4vPcBYvQpua+g+vUBIk2+Ujw4DTWZZ65DY1MXiXmHIoZxQScfn8yWodoQsU9XB5aXXkNyCR5rWrao=@vger.kernel.org
X-Gm-Message-State: AFuF++lFvSGF5jg+nM77FK34F2myjyixk2cH2GaIhQZI6bhCTMjhVTxP
	8oL7ZTA0YlVhXfFrsETODN3f3PfyIodWRQuxdobfXMem0EI7u7FOEAfJomDI0/qhLb33KvxT2gp
	f63viQFzWExRrA5V+gHnz3SsFyj6oCLI9P0XM8GA=
X-Gm-Gg: AYBFou2FAwax1aofL7TvB+fM3TGUjkOCOJhjPFvk7M8wbMRL1QFAwyuavY/bop50EXd
	KHWEL6kWp8eAJmv5tXgNmOD0m09mmmCrt4vfIl9m66q4WDeaBnqDcxGr1YE5IuyMInjo07RvjYz
	qwrJMl4Efzt9KodwNbliKlxVpkKgF+qoPZ0q0qRhrPMTuksbWK6u6F84Yr5NPVYFQkBA89V3H+w
	EDMdzL6E8scip4nZR3AX8bidU7qjLFhlV6/jU/lFnBwIOVvxbXhPNUaUwRPSsZqN7PbrQKx6RJa
	jT00hxywiaqIuI4vaSLrul48ED597DguU6IHRth/wzMuXZJrSww8sw==
X-Received: by 2002:a05:6402:4547:b0:6a9:f88b:14dd with SMTP id
 4fb4d7f45d1cf-6aa4f97d7cfmr6238277a12.1.1789986992392; Mon, 21 Sep 2026
 03:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <178998607025.21155.9680834242820851509.b4-ty@b4>
In-Reply-To: <178998607025.21155.9680834242820851509.b4-ty@b4>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 21 Sep 2026 12:36:20 +0200
X-Gm-Features: AcwNN1VQ6S9fCy63ty823Nyxcerwh9XF-bIr0lhnPcmyyBWQe3Ulp9EvTrhD9Cw
Message-ID: <CAORyz2+E9LY+6sb+0G-deR8ZVZK_xu+p_hvp8aKteVVhHpeBRQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] Add support for the mt8167 display pipeline
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Applied to v7.3-next/soc, thanks!
>
> [3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
>       commit: ae0968038f994d6e275f5dc94a27325ee751fe58

I'm sorry Angelo, please revert this - I'll post a v2 with the
corrections spotted by Sashiko [1] later today.
Thank you

[1] https://lore.kernel.org/linux-mediatek/CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

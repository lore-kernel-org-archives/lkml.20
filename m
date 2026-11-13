Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601378;
	b=y4nbhBh4B9iSfP7dZzJ1q/Mij9KntiIy1LOh2uJcKPix4P4oHWhlN3q4zMfKkjyURw5D
	 acJgTf+IsLsbnocYpHrtLrxKzlxUD6Abwu7NyEK46VDwbmhQeq+DDtBGrJHPx2RFF3ws3
	 aEYg2TJ6kSzZLhW1L/qMU/Yb+zRDFsmzycjQ7OvINmPiBD7rG2IDqqGkUC4loT3skvpQb
	 ud2or7ezN2iIcxajRakOsXI0W+j9ycMRykdBl7xckxef6Bc8BBWje5Eg3I3Q8buVT6R6q
	 w7NshT43XtY5Gm/Z8cycEUpXZ4MKggl5LDUxJe4XnuShETe1z2VBCSPxbvewwYhtJYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=;
	b=VN0JG83sgGa+zpOZPVybhorI9yZ7Ej6LpmA/CXpCcZ8GIRK4d5e2puIPeJ1ry5I7OLbD
	 RGaIt3KrsbQUMZiOezU5ujrf1vkFHr9kNXnWyOB4r0ujGSlkZwgxQO96BxJped/356jo8
	 2iqDYopc/NR6Q2orVsJXR4tH9ENsl81aOGASippGXKrb0RYo7PJVPIdBwoMDVRjukHrE+
	 i4XT0NBIKL5gszgKPXKbmae4K0iYSvFdQT9FeK77oie3y9X5yfmmT9IpaHThR8m6Wnl7O
	 pG1ZTNj7DYaXVq4PEtdMw+Mn1ygblIruaZeTjOq0zmtcRMXiPT0eRp0uWsf8dBlynUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZb6Wwxx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08470606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08470606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZb6Wwxx
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2764071fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601376; cv=none;
        d=google.com; s=arc-20260327;
        b=EXToZkYMpfe07THhd7f68IXahCmNF73KmSvARHyqhaHE0Z+e3b0mWAd10nNSxHgnFe
         No9IhptE0/sXm4FE9ZQssd9DWN5CSUmypoHk0NgpuEAwk6CnKRTr7qYmeaEHtpoRxLKr
         /NLEmQX76tgHisWuX0YwtAVE477ZY0LhKol5pt58Xdrm90qz/rK8UIQshcsHVFQH6KY9
         G1d9Y+FD7JOMEXTAUvh8d9z+Noml0i5YKOiOsxqJpVvRAbjzdORzBVsbqMVmfgs5fggn
         w9WheWIEbB5lLeL3L4YZtSFOwGXjXNoIiK8nQztqS22ZnVN1UXwgAV4eZiRIlQdBFdmO
         7YlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=;
        fh=ik+EWRxkSrSpd+IRXfg1okf7SewVU1OQGVGAelelmjA=;
        b=GnB15lhBhyk9ccUmqEaY/SEdolOyuxQEBgYXuFnxadFFotjZqYXOWcDO1vYceV5g6M
         D2yFn7BfI/tJk2oNqjNJYqELKFua1nxL+kb501APSfw16CUNiBpgSgYE1uG7W+Ztmv82
         RiNn/F4GUdDvQ9nYAeAptYUNXJG0atyI/QaFXkUiPGGfJtpdhAY2OWjGk4b6wDX6ryWs
         ACERxZ41jNJnMN4c+eZB4A9GDZsoeN48KjT5aYhNT7Vw5UC7xNA+TdyxoYsn8x5cbex3
         WfHBDsZ9XRPL/CQNyio5eJtLAIHE5g+zRYN590D09QGXux2rkBhFWdf7V2eRHrSR9MEL
         TC7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601376; x=1795206176; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=;
        b=sZb6WwxxWjWIq5ME3DKJ29k+t/JMifPQXsqkQIFW7iKu4NWNwTakpR1CmAOHVEpHuP
         kGj34UEjQskWU/aJugnoXAoFxNPQTkD2PDb6D1ZHhTRAgkpFZI0wLNC8HoTdz+MHxjCB
         37VUEaK/qxvaFSoa0w85esgJJ1d+2ZS0aBJrZkw1Lcwln3KJXrAgZu8TO2LoSgc9DTl4
         NiLFHNOhOrsuoRIsweS7GAFR/OG15zua7SRIRC3bKMhioQzfvbIo4FCFa74pQJL51V/5
         5SSpr3hufIl5ENVRlZ0jOmhmAPF2NrHDbhBonVDlT0X3fpLcKUIHcGVKZbOWdWg+ac66
         iZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601376; x=1795206176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AW+nl+4nxASRB/K+GIqpGeSKyCzwpDQjXMxGtCvf3sQ=;
        b=FXpqL11wSPwTA1eenzoSskhOTW2cwJRtarC16uOuqBbVAcs0cZmP0T0/EZi3UtUK+E
         Dr0XoMdAdyAPPtmO8Tm4RuQWB1pI7UEJVmz2ejOZ2m1rko+5h1r6TVfcNun34cj9FKOM
         PiK2N917C9eh3M7E/yFsEEh7btOilzPXtsZgmQcN1KUMoFXo0S3L4y6K0M4bj/3YXwFF
         YIcIgUbMdIF1E9MIar43FUhy2kfn4otBnMLmSxxFZTE7mDkTabKVEjqUtIHWVstNo6X5
         9wiNE1ecw5z4sz10XOAkZoYwOqpPtIRcwS1G2NgxCh7P7mn1InV1FqbDxCzhrQqkBQYb
         DpYQ==
X-Forwarded-Encrypted: i=1; AL+hErG+4zZSWO4JbxzaVcLP0A7Ti0PEubVbiMENgAue0+uW5eewuGiiyiqKIY4ediwCDL8bnT70LnMUbl09Zvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LxnVY/rkQgIdDPHVU73HC1uuneEcBujkD7cHl7irGAvfpPbjl
	JPvI6eGUE657/1ELWCDtzAdrIvTRXduGMQbUF8LNOsJo9976EfScX5HKe+PAR2kGKpxrBAOLXi6
	bh4wMlTmkYfgVVHYYwIdX7kqLK+7Gzl4=
X-Gm-Gg: AYBFou11hY9jLqm0bQ4Kf0Ys6GqCrk+QvAN3tUDnEi1HpxM+FhswJkuzCeN3G+Wh/et
	kUnkjNMaZd2Z12V+3mI5ioE1Z9c8skeu9OJ5B/25f+JPaRP7ZFVOzyuHbesHzls2Vn48G2TBFTk
	nhW+bW37XaZVGcfbueYVUp+GIWXoEPftTkyD/ef1LIQEFJMXkeO7PKdl2zwtHkVl8rV5U5lHUDV
	znUbAsD9d3d/bXrGIj3QNydmi7EAQYwyGM5RR05qtHiOcjuH6CMoQ1xBp2An5WtGn0qYIKaiE0c
	7ePel7YxfFRG274vIP1fjrEGT3epo6EqhUN51pakYwhKK0kGH/asfn8w9t94p+nrDc7jXlYEre1
	fO2KxkDRCjHzW8V9z3KFStTNXL3Mx2qzYmQ/NItjlR4bvjGEct8TNY9Vs9OlBuL80JSGJQ+A=
X-Received: by 2002:a05:6512:39d4:b0:5bf:a48b:7827 with SMTP id
 2adb3069b0e04-5c1705f074amr1901758e87.2.1794601376064; Fri, 13 Nov 2026
 12:22:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-2-8218c1cf8ac8@gmail.com> <72fb3540-e08e-40be-8f3d-63727063be6a@rock-chips.com>
In-Reply-To: <72fb3540-e08e-40be-8f3d-63727063be6a@rock-chips.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:22:43 -0800
X-Gm-Features: AclHuK83avg87MErP1c1PWVXkGZUeHXXf76PgTC3e-PET4yuVzF7UOnIAvMmRRg
Message-ID: <CAEy9hNXox_rE9XUOKe=0zedpTR-sfpz4sum34s_DW12bM52q-w@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] drm/rockchip: vop2: Don't use uninitialised
 dividers on RK3588
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Piotr Zalewski <pZ010001011111@proton.me>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Damon,

> I think we can drop the previous divider initialization, and configure
> the correct dividers for specific interfaces.

Thanks, v3 does it this way. One difference: if_pixclk_div isn't set
for DP and DPI today, so v3 sets it to 1 there as well; nothing is
written for it in those cases. HDMI with DSC isn't supported by the
driver, so dclk_out_div is 1 for HDMI.

v3 2/8: https://lore.kernel.org/r/20261113-vop2-fixes-v3-2-08ae37e83b5c@gmail.com

Best regards,
Arun

Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3D04BD344
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799177; cv=none; b=pofSVQECVIQgGzsZMIoffsuxR2RmD1CS8LookAYTvzVU/NV9zumUwaXqjWzFSBnJCkhRwDweFNmxBzTO1qZc7DPzW4w6SjAGLkfnWslTkvBGyCA+lgFAqAuQSaWDr35rcWIo6l+BN+eUhFxf8FVBEyU50zPYcKwfI+UUsv7WLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799177; c=relaxed/simple;
	bh=GIPQqQ+ymggVo/+F0KkO6CV0QlV7pXKADmK7Db59nhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfZV2rS78Z9/KAgvSgiAKYc863ox5lC6cJeorDYsaBRVIRqthVUPRQis/KSO/0ciWqTWqObtkErv7WvVoqO+zbu+E1fxehdDAWecw9ZJ0VL7gCdVL4bapxFLUyhmcbDxv5qWmPa4c/UOoRQiOrO/35yAiFa3y+H2NCjc3EZ1Lmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bOsfjaKb; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bOsfjaKb"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso235420166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790799174; x=1791403974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7U6thcsc8Wz1xK8U5Qhc7QgqtaRZtBZlNvbNYRYr/EA=;
        b=bOsfjaKbQsKkThE3BsyiMcY8Zo1AgOhDvYTeFnWsCO6lYz3tpy9e+yEKyWZwlhxugv
         lVnm8r76RO/DC32PNU/k8BnF0boinKBlHlb21jA+nBr2WqAUFRC4+/+bNzUxinWuAQGy
         G2uP1wlUCgPl3k8VbTIPK0V/+CN73GXwvSUo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790799174; x=1791403974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7U6thcsc8Wz1xK8U5Qhc7QgqtaRZtBZlNvbNYRYr/EA=;
        b=neaZjKkwgmu/uPC26QnJJwEG+dOXJnOdKvYvk00Iff6Q6agIq/gZGtXSQFJVqzG/U+
         Dh+4pfsi5XJcdERSSwowDTiwyD9F5G6tfoyHYXiRxk0T+Ayo8p6mMrHN6d9OTsjGYEUP
         hk2eD8eWv2BUCzOxrGY8oHi/gLMWyoERJT0OQQ8gFRdOJbTluIUBBetMS6tHgT50T4Js
         0ihTKPb/66t//iy7F3dZXrk2J1Xk2zUAMh7qWZV2aX6zlG+Gny1dCI9F7DAmS2xO1lUR
         qq8uMg5l86tmbdBp4Vwd99CbytYpaoMRxRCSDUXvMiH90R9zw6ba1BeVriI8ZuzzYwtO
         cxGw==
X-Forwarded-Encrypted: i=1; AKwUvByEBgNNt51eeYnMzWZA5TL7i83H7a9anyfN8OxWN2uFnZtONkYe09yRfy+3gOp67bM7WAppRgaMkVNUoxU=@vger.kernel.org
X-Gm-Message-State: AFuF++mC/O9rdXQ7+ReD07VRMDHS+cSCkY8lcHGzcHsnDvmyl7KTS24M
	RZB+pLDEsRqURlcGPHqhbqPisNXevcHmU+Usvc+Wib9dFlu2fSIj8pudI+L2Yjj3OVKbvz4CyBv
	ExkRa8g==
X-Gm-Gg: AYBFou0fUCpNx7SQlblg6OoHR+OLZY9WpVDEFxz66ygtEO3/gBGTGgYp0Da9OQWZ3uj
	GJc7hCSJ3jKXTO00olecvpdpUi9FMiro9yRPHStB0yE+bsU/wi9JS+0RktDIi6U9rLNah576cpL
	jAZJxkQmUj6Xc9s486FM40ZgI9EAkEenlPRSsfT5uYlh542bG3sfSHTQz7XLpwepr6G/YFkcVfP
	U1yoE1qzLiSWnJzR6Te6gcbWM+NA96nhqrlMwRjCMBPd7qG1xsmWwnvJuo2JRYQjZd4boSkdyFx
	V/zZPcrTNx2iAyP9QpC12UadJyM9dPvHQ0/7xi3/HtV8nokCa9gWO894Zqj2SfB6xNnPfH5uhS8
	BlM0DlDdyM96kuY3JU3lgsPhllaDLOHEyMSobKHEPKWINWsl+l4hHNt1jPMwOgSSmLJPKQUvufB
	BUIXY5hXrYrT903O6YsoANxHYyhJLUKWN8v9G8ZeYDTDT3UT8KwmP3ODvWZkFp32Q665wbZ4W5H
	1zIGJn+DpVTbZHQYpPL7tWlj+3XQmG/eyEZzIQ=
X-Received: by 2002:a17:906:6a05:b0:c26:1691:b364 with SMTP id a640c23a62f3a-c2e23d933b8mr215445266b.29.1790799174130;
        Wed, 30 Sep 2026 13:12:54 -0700 (PDT)
Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com. [74.125.225.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3ab58sm55017366b.7.2026.09.30.13.12.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 13:12:52 -0700 (PDT)
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-48b0622cc90so170920f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:12:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3SD+FyAe7eYirWor1GecYS7waTZzQM2FJ48UmRkDNgO0rcMG45MaYcsvlJCzn94JmBWbbeE0PJfIFZss=@vger.kernel.org
X-Received: by 2002:a05:6000:2301:b0:488:89ed:4430 with SMTP id
 ffacd0b85a97d-48b02522f7bmr5017118f8f.33.1790799171532; Wed, 30 Sep 2026
 13:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=UohyFHM3r4i6NoDbzVFpY9xZzg_=FvGFhBgScaCUwH2w@mail.gmail.com>
 <179045227485.41069.12855843493298872118@gmail.com>
In-Reply-To: <179045227485.41069.12855843493298872118@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Sep 2026 13:12:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXUmdt6MMdpmc8+Ef3K_BDA_=HBrm=55L6rN3CGFXrXQ@mail.gmail.com>
X-Gm-Features: AclHuK8FcTnHffXPC8rDzSxRGLknuirXL0tZK5LTHVWoYw6G_lhLZa_jZ9uuWUA
Message-ID: <CAD=FV=UXUmdt6MMdpmc8+Ef3K_BDA_=HBrm=55L6rN3CGFXrXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: don't mark the AUX backlight enabled when
 enabling failed
To: Oleg Keri <okerixx@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 26, 2026 at 12:52=E2=80=AFPM Oleg Keri <okerixx@gmail.com> wrot=
e:
>
> Hi Doug,
>
> Sorry for the muddy commit message. Unfortunately i cannot reproduce
> the enable fail. I found the unchecked return while debugging eDP issues
> on glymur. Please drop the second paragraph when applying, or drop the
> patch if a code-inspection fix without a reproducer isn't worth taking.

OK, I pushed it to drm-misc-fixes while dropping the second paragraph:

[1/1] drm/dp: don't mark the AUX backlight enabled when enabling failed
      commit: 707ce102521496c67860d81221b20c56d8255f2f

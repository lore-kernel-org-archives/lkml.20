Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC5039B970
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200230; cv=none; b=lKf2EbVXoOVp6gsasxFvKFEmT9qMwXTvH+y8bVmnnpqcIFNvPsXB5zHlt5RMYMu6kMVJAM82XI5z9pvPz21/BTN7csVbOt28oOgOtTWcoq3axgMxvjxlFX3rqllhH5S1dXwLNEW7O99My0yyrpJrX7xOL1h5y2Z9wAygq4S/ipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200230; c=relaxed/simple;
	bh=uuSQFEl0f5Xgmd+uvHvfUuQ50DstW+2uE4t8uSGFq5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUi3bBfTl0IECZpMZTp97oeJ8dsOcg7TxWOvQKm5ZciXVdrmtrb7DtI1IUDZyPVTmCZ5XIUKX8FmbkbBW62Al41zYTG92F/JCIlhpWyOpPFaRBYWRhlK6g9o9biERRDl1a7wLaCJ0ylON19JnXqwtH4s7DoX7O9Rip/GHCMZXtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TDfnxHy+; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TDfnxHy+"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2531f453eeso592263966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200227; x=1788805027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HEz6oOVo7hlt3+Pf50YPJ4GWCG1Y+vkc7cVq7puJWI=;
        b=TDfnxHy+pC1lDiJixMMspQIxNfKaeT9o46zrCn/uSPEC5xV4w7u0mQ+Wsm230or72/
         vQ3ib7wkWojYS9e/HA9E548DWfIhYy0jvAx25pklUMxGBXcS+Q1F3bsP8XnXZW4A8WWj
         BoAvBTOcYiWsiS4iK4Bw4XkzTlQQBVr3VwHEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200227; x=1788805027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HEz6oOVo7hlt3+Pf50YPJ4GWCG1Y+vkc7cVq7puJWI=;
        b=fuXDN7zUfYIAdoE6uP7gF0qYopNoaj2zRw5zQpc5xRURwmiTLfsrzgsg1TMEmoC1iB
         1O6wLNArFr6PUqL1qRdQkjvUzpSxA0BBT2/EhD+NDCl4EBPAUZzIn3bW1SaMiutG9XpT
         14ctQbtVh4txYgjpwuN1kGqXH8umOsge26cyK1wju6uSbhxH4404XpuNo3xjZBti7jn5
         WfKpWAcKzH2bSQ1iIZF7O+jcEurb8xDfDhu4lDufqVlY4+GNEgh7ZJfqGqigePETTF5+
         2qHhsi69nh7rU/8C9cHVeW9USJ2zBg6IhmXU63kjpihNKUpVZLxLiZg/XoXpj2yXxfNE
         2Faw==
X-Forwarded-Encrypted: i=1; AHgh+Rrz9SWPeLa9N9gRa6cCf/KzblIUSsotkyIJG8q/9BHFjsPZM6hZkP9eLkVkvml3M1AisP7b/2qwMcOFA5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nlrAHCyyMx0mfmo1zv/KrXYtN3lgQ9Wq0BoFqEJ7ogLRhvZ/Eo
	6p7MCjiaJepsDC1fYg4/x05fQgxi+/zRAUhIH5++/GJIhLJdW2k42bPAxVzpcWZUzags9WQjUsd
	53MXA/7UH
X-Gm-Gg: AR+sD12d3plVG44Mz5YwSQJ1z1n+aOYNUiP7RWUEAKKJDBH8fvizZaMYMDdQw/Rl8y2
	w7YxJh1NsAzLQ78IesK25dYzIvJJZFqJamX7Jo2IBL6JS/4EgwgmFuzoe5adpR8SzMUHfiZqkpZ
	3jTkiGGyLR31+MGRgT3HGtC3LvEO6ViuY5LwNw5PCcEmWNRVj+dY7tpA2B5wUWHi0f9pklaCx1h
	7MrtW0fVI0EWmfnPwE4h/drXXsdI/tVu0P41pEgAr6IoUvQPtt/dXbVCydxrU8Farw0/N4IJgH4
	fYH7WFjyISXXm281dkFC/fSQLQW2rIvO6ftIQQZZEQPBQNxGsxBfP2E3L9pgVFGL+6AWsChybjf
	FPCHiMq6TSHc1N+PcZvCDMN2bMAf55OD6+7bRCTEkRpsAkzFQltmBgAFYwM76r+s5P21Df1on5o
	KpO0tjGkUIZla0SMflXcxK1EuijYif4viNa33lL+bSfRtXO4f8QHl1urXkk5Mzw6cvrZBT085A5
	sJL1vTxBCU5ZxUajC/UyksWof8=
X-Received: by 2002:a17:906:39d3:b0:c08:417e:3696 with SMTP id a640c23a62f3a-c25b3da372amr150086866b.20.1788200227460;
        Mon, 31 Aug 2026 11:17:07 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee28596sm483425966b.20.2026.08.31.11.17.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:06 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso3190719f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjjBeRqIcdZPvk4l8jHV3RubNF0e2PysUkt6FInVv5JR8PhFHotkR0wE251azUviWuEYBZZgcGCkxTmbI=@vger.kernel.org
X-Received: by 2002:a5d:43c8:0:b0:484:40e1:8c40 with SMTP id
 ffacd0b85a97d-48440fcda91mr3934528f8f.5.1788200223514; Mon, 31 Aug 2026
 11:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-2-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-2-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:16:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xgq2aJ1wPFggFBT5x810xZr33GOtyJDvhYf74CmuPUKQ@mail.gmail.com>
X-Gm-Features: AcwNN1VE0AERlOw15wusqCepTJcCXi7KNdMxoGrnxAOTT_pd3WQ9VGal9zL8yXg
Message-ID: <CAD=FV=Xgq2aJ1wPFggFBT5x810xZr33GOtyJDvhYf74CmuPUKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] genirq: Implement synchronous disable_nmi()
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2026 at 6:00=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> Currently, disable_nmi_nosync() is the only interface to disable an NMI
> line. Drivers stopping their devices in process context need a synchronou=
s
> variant that guarantees any running instance of the NMI handler has
> completed on other CPUs before returning.
>
> Implement disable_nmi() by wrapping disable_irq().
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  include/linux/interrupt.h |  1 +
>  kernel/irq/manage.c       | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)

This looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Sashiko had feedback [1] where it was worried about tightly looping
doing HW polling. To me, that doesn't seem like a big deal since there
shouldn't be many NMI users and NMIs shouldn't be freed often. Perhaps
Thomas has different thoughts.

[1] https://lore.kernel.org/all/20260829011853.0B9A41F000E9@smtp.kernel.org=
/

Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ECA46AF2C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200249; cv=none; b=l3flqtbZY11mplcaCDMpdeXXM6yY+DZg0/qBVu4ycxs2Gd+3ZigLf8DgZaYQiTaVn3Rmw/OzyIUbT733rnaBTKjp+9lC4ba9Elg3zAOqZkc3WxtkM1x0D8Z1kCGlRWqzWpzmT0uR9hDriFJVKTUr0BWIAHm1ftIl3PD+OIIuveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200249; c=relaxed/simple;
	bh=D0gY1RFo3fP5F2alggX1eKdz74k3uW88LC29EILOh/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/1nlAbLjHJOwOGcPFdH4mx6WKX7f9s5pnykOFBat0n37BjyMRKK05YX3GpaerI0tIJkEVH/anuV1KEsw3v3tRQ1H0VwAuhjkT3NRtxcGjm29fO40jYduWvh+YhtxgcacbhK852GCj+aj/mNCsyvccy6bP9qZEdybIbJ4NddmdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EaDoorwH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EaDoorwH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c25b661d37dso2573966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200247; x=1788805047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YA45RBK4xNm5is/1vr4qQL3XM1GA4yJrufiy7l4ApY0=;
        b=EaDoorwH+gRzG1hKcDdi/jWv5A+g/q5Z7vq4rVzTyrx7H6zSX1Hg36qQo+PLF8zM/K
         2kfzbiXSOiNZLxq7L7Qv7DphoJEV1Kv6w2lX0FGnIDG+fw+SlDg0shUkiED/dszd/opX
         6S5Z57HlLkFuWJnVsgRvMNuh0gsmE0xpS+G1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200247; x=1788805047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YA45RBK4xNm5is/1vr4qQL3XM1GA4yJrufiy7l4ApY0=;
        b=TYyDjeGyLN+0tVF/4BQTVgPchH3QiK7UeC+huUZgcoqrc0I3Y5lh7rODvky7rOIg1M
         r/nTSJ5abfvOiSrAv3HpDHfZ1fAuXUwgpiLa7DkRPuS1EnZbS7Lzq2vWVBQmzcTJ1squ
         hDuIpT5rE1s1wqLG33Alakd+FvqPmZrx/LgDZBTJ0/CWyA46emi+bXl3PpmdPyckgS7K
         lSFImjS7ZRgeoSKm7e4I7RS3kawjQLfkKTbaziXxfcZxr0FoV74nQ2ViQ9P7uXrvFhGQ
         So9AftTaB+tWJByz/w0oUKyqMFvkPeI+KVAwBpxOdv2ETyxPFPc8bFs115GAPjco/sb+
         yvUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNeGrcDlI/Yg4iPvHIxsRNNIMwpCbou4qHKSVnuqP08iprOtU616b9jPMUdOJ/g5u8JhITcAnkQd1q2aY=@vger.kernel.org
X-Gm-Message-State: AFuF++n4ZUeCNjn5DYBCJdT9Kp6DmDaeD0j8+whUwq9azDElaSp8VwRx
	+kZfpGa6FxkU+E54UdF6Sc23R2jDbxazCoXxNKZ6nVnANfqYUVoEPD1FhbXfUBu1AYcaOdTjhSW
	7jh1JxX5Z
X-Gm-Gg: AR+sD13nP4OLp4HrmvIwV0OMoYidHizbQsCXRnJOJ/xjQVfyykyU5tZuTb263584FpJ
	j6Iv8CCPL9GkadBvYm1o//SP9t/OwLU1lFF1FFZSV61PxDzrFxcXR8fR4pw2jLtb63q211yjVrl
	QEAF9DlAH/SvCZCO+KlO73O0t54l6MmWw77d7+T/6J5hErn1B99fnjPZTrbdPG10CMJ1S/RmZwx
	wQF/AwUiyQcb8F7zqrJiNNrReWRArDHVUE4dha2XoAvePtaxDd2L9gCisUrjt6qRy+4EddqStRM
	ERzfpQgBq5zucYe9VtUh8xoFYZvfUbeLjlojzKG9uq/+q69NM3aEpC+nXXt9bCPmzBQCvJUUikX
	s/+C9Hl4JryKmOokjZwiucdzJeEYo1YkNfXGML9LkzaxoRXSDHP3/fDp4JlDFao+Y2iGjU1vZsw
	hYua8pawhZgypiXsSp/oRLm5bQ35tHkibZ0WefWGzAv1+Liwd2LPzRm/6KjN86XD+yH87llmfr9
	d6cvPMArvUT9IcNGz14YpXKS5s=
X-Received: by 2002:a17:907:72d3:b0:c21:792:8257 with SMTP id a640c23a62f3a-c25572034e8mr1531928766b.15.1788200246685;
        Mon, 31 Aug 2026 11:17:26 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09c68sm465320466b.7.2026.08.31.11.17.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:17:24 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so37917f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXccD/P/GxwyQIuTMJtx8Dzb/4edYPak+9+pBhJBSzh8awKu7lOhRmmM+j6mGyxHraLR5dflN7DErMRmk=@vger.kernel.org
X-Received: by 2002:a05:6000:480a:b0:484:3311:af37 with SMTP id
 ffacd0b85a97d-4843311b2camr31399850f8f.26.1788200243898; Mon, 31 Aug 2026
 11:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-4-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-4-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:17:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V+vbapkDzby6f7BbjSuSHc9RFUVejCf9dO6xmzuPE1Lw@mail.gmail.com>
X-Gm-Features: AcwNN1Uum9nPWl9j-6K-ngg8lklWL2dpaMcNuBtk2t_f-Opra6jTlnvJ6qWwoik
Message-ID: <CAD=FV=V+vbapkDzby6f7BbjSuSHc9RFUVejCf9dO6xmzuPE1Lw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] watchdog: pretimeout: Protect governor access with
 RCU for NMI safety
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
> When watchdog pretimeout interrupts are configured as NMIs (or
> pseudo-NMIs), pretimeout handlers execute in NMI context. Accessing
> the watchdog governor via spinlocks in watchdog_notify_pretimeout() is
> unsafe in NMI context and can cause deadlocks if an NMI arrives while a
> spinlock is held.
>
> Protect governor assignment and dereference with RCU instead of
> spinlocks, allowing lockless, NMI-safe governor notifications while
> preserving safe runtime governor switching.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  drivers/watchdog/watchdog_pretimeout.c | 45 +++++++++++++++++++---------=
------
>  include/linux/watchdog.h               |  2 +-
>  2 files changed, 26 insertions(+), 21 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

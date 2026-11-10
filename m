Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293644;
	b=hjpiGGOIkmN02kv6CFQ0w0GRyWeSZ8C/sbg8ZF17iIM6Wjn8taVspPkhylO5IP+e4BbJ
	 i1T+5RPopb3CdeWydPbSFxu4AMJM1AdgDcfspYYDURmToRRsDNZcguydkqQ7QHUOUwsj/
	 DFNNtpOAQehJ/5cz6EhNRzEWgPLOEAPbR83MUOJjAboVJjTArq+A+q8RxYSAzE0VzJAxv
	 QcphMp+JNGJmF06Bl0PTc9N/kmsukSXgSP0h4G19p44Oi+z6glcwFPkxCObH+UjEQPDRm
	 XeHiYhKNGKt6nkX1d4vHPsEYvj/A3HZgwcjFTHq5Cvsh3QpZPmGLjG0gWoqDd2GM8Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
	b=U06Z/LjaIfyl05J2l0vMh1YbusI37CQhACU0Wp3CdhzgfSxuqn76xwK4lmqw05xj5gq1
	 vjcFwxiV7hJ7mTAc0RaPUADLe/Q1ZNB+nKB0dhAHjMXH/nN6OD5oiAB7r6KIeIjuqhB0b
	 knFvI8sqBWCT5IBktyfvj5H0PqCiQWd/zcRkAfBAHPky0Kt50siCi1sOHr2fg9fisdSUt
	 MB4NlN9xhPFNsJkCGjCGupOgHppIpFCfzx68fYZFel1O+cpQV0UoyhbvMVz+aN1EiHOHr
	 yj5zwNZXvYW4mAQViiPMGAbRcLAHT6n/WDhEdq5XVO3UboIeBxwzE8Byc0ZukUYpUDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxkTfmlp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4616606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4616606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxkTfmlp
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9d7791b00so14336565ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293643; cv=none;
        d=google.com; s=arc-20260327;
        b=cTFBhUETMlIi06lTgmIFyGx/GBpHWbyM6WwJV6oM93cEQKyqV86gaQuK6+Irop3Gz3
         /KpOvzRO6SZ6M8DEo4axZrm/8X6JNatwjpnApbOmTgTQvSCDOnGf9aoXn10z5XfbeOeU
         3Z1FnhVFS06nbt0lxJmW6idZpiqWH7P9YHU6WvbK9NNYZxUuXAZcj2UqCBnamJSKw29y
         Ndk+Kbf9/P5a4nEftnUVtZvQZ6SrcWn6ky4RktELAnJ2WDp7zK28CjSy8IJhxUh8fyyK
         lDEfeo1yAJ7L3+1Rv49e10nfEpu67FcnxR8FkWeIoTHrbmin72rA+SEDhHgz/5YPQ+3w
         TpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
        fh=qM9b1d8JdRmW7FRQc8yhsGTAipV8S8Il8m06/N+AO3g=;
        b=GjUrMH+DWNp+O2lpQqw9WueC7ENrf2ZHrrIFRauAk4Orl1JGivYum+PU7Q1jVdPT2c
         gg+Brn7InMPfCtyaWzdtmF7RcabwD2ayjVk/igc2xRkz0GoF2gtG+gSdK1iaVPl5Ddyv
         7+3qEjccqlhCbrwQ1bXIXIvJs6kFNpXCkKq7lKS9CvxlrMA4iSHFetIitWmdGbOb2vtb
         ugKjPll3Emxhq6tcsl49j3wqbBWYFaeGhd8DV260NjbiAyYKVFPY29vkXVym1OR0rJeu
         PYm32SmEI9x6OjntG4xyXwF23k/uoZYdB7cYX/5xRbjuPfKihqR2Ohu4zyUptVgmN3Kv
         9uyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293643; x=1794898443; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
        b=cxkTfmlpxVNlweQ+YpcKltZeBZlukioe5E9I8ar/GymZbC1M3nZv9tLBlqzECmpIvD
         7Z4iTpPp31o2Hx+TrnZyH3tRmSpBoGPFhFf+WlvIwWXEmPqmyUzLZxNOHmMSLS0jlXl2
         c1X5n4XouCVS9w88hb8ppVbvX6tBDOPlAn+YtcMJ1GlkJ4Bci9jGGbeX8L+A7Z6wWGu4
         iehKQeS6sHIe+rqYb8OVx0dAE9k58fhyZukljXQWbHk3DgtaJ9eGn2SVGcCV07xOVD8e
         LI1/dzYaEH9Jek1WDwJ3B+6idn81cdhtmxpA/eYOSChlY3InNa+s/YtA5bBzc8hXw6n9
         DtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293643; x=1794898443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G798vRziUXpP9Xg5EEyF9/whlRS5Xqan3lvMnE9t3H4=;
        b=MZJGg/gEnLKWRZmspnTFDLjKJzBz5TYOQXs5wM1cxCdyDqhjbP8NoK2Tha+fuNQaEO
         8bcn4iOmgtWN3DtzcNJA+vC3pE6r+Rhs71YXkHz8tG2I/Io6GFiDB2OM9sJ2OTECrs/e
         PbkEzYhlTJu1d7LpPmAW2niTAYeuFGUTQKjm/k/+e9y5XKbMTCjmtsj26EDWsBbkiWJW
         OWz1kkTB0UqyEgsOgxfTVJQ4WPULlyGwnRlW5FJ+gd5Q9qcDU/0nixQLBQ5rXW+QldMw
         psRzjUTgPOTI2wY/jvouM9T3mcI+GQeG4LGbLWbzmt1bshe6JQhRVGrPfpyc5SAuCnRR
         YBIg==
X-Forwarded-Encrypted: i=1; AL+hErGq8Vl+vd5zE+90e39IGa1EElE4NzPbdZ+x2gSb3Xnf/GDj3I8euqVt5dtp1iZVTOkR0n4IEFZV948qxm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hks4kBdpmEwbiNBuuniRgfIJZ3mNwJ0wwbYSPkUYYH11cK3Xl
	ucfOvT4Kw/Sih9Uf9jmkLhxPISrnghcum7yTwDq/ShBmDTLGzVfSgmEwJoJ2uoN9iF56J6L+Lnk
	R7gd0D+fg7iuT5vXHuAjTa48KRhBLt14=
X-Gm-Gg: AYBFou149nJM0/pyLsWl0mmyYI63wa2g0YFY4AMZJh/cAHnrhQl8zMjlqgmJvdodZBJ
	kUggNKh45+3OAah/fkqamna8dQUiaf6KdilHzWNjKngvdV34hfqIu6AzF9Eb6w4S6rKftUlIN52
	AizQRkaUfCUzCGv++mA+TiR80S1/FNSVRVMHReCqoQ5MAQsaxrBoCmBPCJaHnUA8oZdVKC6O9rP
	kod0Y77L2R6J/n7ekATx8JtuAIzdqNkENQVNmNY/S1OFzKCnISnzWP9WocM0AawNmbfOC6ziv6/
	++OmCHBqT5b/62971/se7vkyORxfisTiv6uGjy9FTr1xvTlcexksPZGzh5Ce6CcsJB42AFXPVYe
	PrWn8scKu7KpPqoxby+x9Ny7XI777MGmGkyqbtqFZ6PNRfItMRd49eg3ZSE0upQJVQ57GGnlv02
	A14NcLXoz7SQOSSH6YhF6LQwCUjzz6W+oOKKYMwF/StH3hxWWk
X-Received: by 2002:a17:902:ef4c:b0:2e3:1bb4:6121 with SMTP id
 d9443c01a7336-2edb924bbf9mr15145705ad.49.1794293642679; Mon, 09 Nov 2026
 22:54:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106112940.53550-1-phucduc.bui@gmail.com> <20261106112940.53550-2-phucduc.bui@gmail.com>
 <f43d21ed-ff7e-40b8-93ff-42808985fac4@inbox.ru>
In-Reply-To: <f43d21ed-ff7e-40b8-93ff-42808985fac4@inbox.ru>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 10 Nov 2026 13:53:51 +0700
X-Gm-Features: AclHuK_vldNLcFCg-yvxy6fHrVuXaZDu-V4fnn6HfWZ9iIf4c2WYwX9dLn_tO9g
Message-ID: <CAABR9nH+V_8PRqk60rZ24RSNp5ybzUTi5nJ_1-JhL2XqDBsWxw@mail.gmail.com>
Subject: Re: [PATCH 1/5] ASoC: dwc: Fix bit clock rate in TDM mode
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Andrew Jackson <Andrew.Jackson@arm.com>, Mark Brown <broonie@kernel.org>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, Tim Bird <tim.bird@sony.com>, 
	Yuri Zaporozhets <yuriz@vodafonemail.de>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxim,

> >                       u32 bitclk = config->sample_rate *
> > -                                     config->data_width * 2;
> > +                                  config->data_width * 2;
>
> Should the identation be fixed in a separate commit? It is not related
> to TDM clock rate.
>

Thanks for the review.
I'll move the indentation fix into a separate commit.

Best regards,
Phuc

Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0B443C07
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527315; cv=pass; b=LmqHJ8vMNcXuBaGvAuc4cJJRo36ZLnkrYsNL5mi2sR5ha+gM0Zb54ZS8PL4Nfwji8UsE58NxD/Eb4Rse866bY3zU7Fb+Xmuiwg9XLBH2xG6cTRVRhkc58VxNM+zTyN/24Pym1VBCBGHNkmz5hb6KECiZWp6buIdIJhiQa9uJWEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527315; c=relaxed/simple;
	bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Is3Lqs9+XM1ABIOiwhXaQ8ohBB4xc1DuJZFGYLF+v5JwLpqEHy4ODkciPybV0a58WFWaqtFZTrnwOiDA1FLadx5v3jO3azoxBICjmvPe1DEM/ZuvTDYApw7ueuonkljsYSNbCrg7WQ6bccE6yJTZYSW6VN2PV5L0CsPyxjyZWvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dJgE6glv; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJgE6glv"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c998d93153so2570901e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791527312; cv=none;
        d=google.com; s=arc-20260327;
        b=WZabHXE70tKl8bTnlw8T4NLWkH7gRZezNnYvcKS19p3MIrz/t+iH8ybKyvtn7Xt23h
         IjGBodlYFiDzuFo92h/GTb9/bFzTpKEo44ENmwRlyCEwrVPk5YsqiONyzTLXIJ/FaeBY
         WToEOWuiT4l/JpxyaocUlAMfdmacafvCM+fAjsUXRtJvPO56GEyD45coJ18ySSHtZ3TC
         rprSSUkjlnDgWDy/e0Lz1JFeOcSohRy8yzFd8Fl7VGXoMGsMSZ3uE25MLuK1zCCEjfLA
         7RkZOwp5NfYWivZUK4uuHSsYxQyQ5NXCZGjxMcpQsIN3K1GJ4zXACtiAJUGkpmdKWhfr
         C46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=;
        fh=AC6E/Bka0Amih4TxoQXgDQIfxbd21U6z/k2MyxI962c=;
        b=L5D4NJcuG4nuQB+D1RNZ4XrSNbSj+EUfabUGFd/ool4zwVc7HScen1aWokPyBV21/+
         pDPGIlIFlvaEbclr+mIylvvILiKkNiTMIAdxxh5zzwpmLkXr07sW+J56x8lLpl+KGEEP
         K6g/41qfWQzHora1lWokXUjWmozXdPIhPcN4/GDaeodStRek84wADx9EMencUL/CtMIQ
         F9GzhEoUt5PfsVnGdntFkUWRn+0Lxf9Ft717LYMkKFxp/vlT/O+dBVdcejxWKfZt2bWy
         zwNn4FlzcQPrchM7iaV1sAZipb77T0b/RxwgGkKDGA97OorPUJ271z0cU2d1JjoUe0UF
         QMJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791527312; x=1792132112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=;
        b=dJgE6glvh/SB+lXtYRjHy5lA5iewsp/W6Taf2ASnkkZnxY0dBYQQFMkEPDMyazrRXR
         Mv84WDB4X8P/vLvjSm220kQNQhjPnFalokGe3jkfC8ydqQ8mFRomS9+9y7UecmIRKZ4s
         SO9/azhDqDglFmOoQ1J1xQobTgxZw9JY0vYQKGCHlz80p7NPtvb4toz5vVYqJFXFpfd8
         MRTkNZn4WjfRYKq2XimStKIK4qoKY3wzUbh8aVGQWntjysY27Q7mGNXvou5W49/4rfZt
         xdecPBp7ZUYvfr6/+z6if9Zo2RRhOJ9UZxyBTe3H4aFbAvEzzrHCee1ORXwJIIg3ABC6
         +CJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791527312; x=1792132112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=;
        b=hsY5ExkSoEFmxYsCvTKDj79nlhn7uPbmjIsD0pH3sChDXlHvGpQP+CcymQGsbGJgJK
         xbmnptDC4EH9d3AIz9Tj8v8lVq/MZJOWBEe1onNbU92+n0RKGlm78DWEJPpWFo2eTXd5
         L6VLDCSQH6U+vHPCebQ3qCKsGExMLxT3BhmEzRFJUB2uBqE943WqN7+JISbHqfKrmEtE
         z85tsF5JxLz/soMFY5leZ2MUC6WJKs0MxZtZuXtl1IFHdzapGVUrtYdjk87WdpkzIjLz
         E7or2EDfuFjGHwfBQIWlpme4TVNFxUAd8gYRae4+egmmvxkm2VnEzEPVO3HOsO5rLey/
         pDgA==
X-Forwarded-Encrypted: i=1; AKwUvBxRCfipXq13hrTXk//QmY0AuPTNi7K1wqLw18OWqNuY/OiatUtTlKuqVGp+GYJDDq6tQW2qaaIoS9FUHJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRi9bQ3hsJ1Fooubqu/VrYMBgG1WCeSQziH0E4wWVitVPn3I7i
	SfiFlf1zVH+7DHSrIIcbnPe0rfCdoH9Rl2/VZaCYCZesf5MvQE0QvnR/y4qmFUaYs9VuPyU5WXT
	SG7neRmE98BNYCC/rfqCl4OIxx0whPClkKVE/EWo/
X-Gm-Gg: AYBFou3QgP+pky+7FaGrTrzPlNP27IUg8iqFd/ADe9S+zL6756h2Krky0HICKgnTUwC
	gncqCyfFH/upzcJUnkmVuJlT3eN4KwUkNbwg/uunS1rVIIAu3faL5bQNPOJmKqJn1ReCJsoX/Xq
	uNmXful6cbWkEUH/im3GZarCAfO4CoIxOmGWHlvvjDLuDZtMboiFb6xcjEY0mTIoLL30t7+tiwg
	eP8gtEL4jeRtp/nFNUTa6v9kCzV+OrPxwC1+nE//LevJpuoBvYvKt1K/XmaaVah9sOLUHa77FvF
	C9W9VSwxmjl7ulfAe25xd3vOWMQPYAILCKAlUzykrsup1yH9eCzMz1LiCEepD4DSTg==
X-Received: by 2002:a05:6122:e189:b0:5dc:aa1e:8a06 with SMTP id
 71dfb90a1353d-5e91f43f417mr266429e0c.5.1791527311933; Thu, 08 Oct 2026
 23:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 9 Oct 2026 08:28:20 +0200
X-Gm-Features: AclHuK8g8wzpeXyMue5uZareIGGpfm7oWlT7bNlgcuKmGssBskC1rzSd82Cda-Y
Message-ID: <CADBMgpyF+QgmLjX9p9wfikZksFFg47QaQU6fHrnX=y58Wvk-gg@mail.gmail.com>
Subject: Re: [PATCH v8 00/11] unwind, arm64: add sframe unwinder for kernel
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, 
	Mostafa Saleh <smostafa@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 1:43=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com>=
 wrote:
>
> This full series is available on github: [4].
>
> Ref:
> [1]: https://sourceware.org/binutils/docs/sframe-spec.html
> [2]: https://lore.kernel.org/all/20260505121718.3572346-1-jremus@linux.ib=
m.com/
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.=
git/log/?h=3Dsframe/core
> [4]: https://github.com/dylanbhatch/linux/tree/sframe-v7

Apologies, I forgot to update the github link:
https://github.com/dylanbhatch/linux/tree/sframe-v8

> [5]: https://lore.kernel.org/all/20260821195259.2688377-1-jremus@linux.ib=
m.com/

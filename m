Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB04370AFD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261235; cv=pass; b=MxtzrNwQUEjkm/fuCK02pgdjNiIYiWuefSu0XuEBLSsAAzZvD5JY9xntL6Z7e/iJQbPGnTG3lDkfJiT8jo1YrQTRx08gHtPMolObU664wbYTz5H79p/2ez4aXQLtP7yp35jcw4bpXsIUtSQkbiWn1UDF2tcc+wZL+leufDwZh6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261235; c=relaxed/simple;
	bh=iosePCC775N3ne4xUx96Xnhx54wV//EdhymcJwRKPKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSjE6UneYSiWWxoiPSePs5xQyc9oNavi+FDDiKiATF1eSAo2TuACdK3mDQnlChAD/6vAtjs78rkTkNp6UWC2A/lTwbT6s+vk+VUfKsBqofiRD3zPmOtH12bXOvI668H98yyG8wiVSG/aArXj9lEO6LeRNM9U9O/5DakrC1aIvaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgdjWjTM; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgdjWjTM"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so398114241.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261233; cv=none;
        d=google.com; s=arc-20260327;
        b=mnOsfS2bADpLgtXJu2lIe+pZw8X0ZBE2F4fTH/OF1wrtQU7n/9M70FHVBPIHEnUfxl
         m/9r6x/jYEMw0YNLgNoqXtxFbz1cVH1CNPyxrrluZ/f6BLeC0B7C7zoBx7LhLKNp6tJz
         lKmLs0smzClGbsr3vxpPCQZxeRrRbE6oglIfFfqBSdzPteohqJ7jXNK/2mwtHJsEE9IN
         FBoE0oH41Oye7gt20Jux5Ei7nXVfILGRhadMWxnERrY/XJMxFVU+y47kQKgQ1jmrq8ty
         qWzVa+M3K1nknD25bkpshE2fMc7giVpfeJRksxDGVUr6JqJcvaNbBTh4qSRTO+ixAwo4
         5OCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W1UnSY1pMfytkclFL9S7Wbx4/5qWTLUFOLzTIY/CjLc=;
        fh=5/BLMVQbwic3sPCVzGlxA2vxXvVFaeH+4D2wyJvV2Mg=;
        b=RfBJWKGr41LFxISa5rruQkqcFooAj392hntSqhaoV2BZprs3MgpE8yehTKcpN1TE87
         ktxPQranigI2ieKw/2kDJBfmVO+QAm8hE4TZpP9aH3BgD5x3DNQw6SedUDL476674kn6
         w20fif0A8bazvQEMM8sZGKIlDi5ZkAJ2o5pnu6E45BHiy90z5Av0HV/l4pGMOXBWxrzH
         QISnI3EO18v/9dKJtZOzKKzQ9thKHJlSZorsIZTAXy7Sj6UT2pPGaJKYVSQq21lVBSf+
         jJdN3/Ci+M/WWcDxXO2OqVNKWklalcwWxEW0xmssa5xXQYju4pP8iZHJDvjeolCqgwbh
         mz1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261233; x=1791866033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1UnSY1pMfytkclFL9S7Wbx4/5qWTLUFOLzTIY/CjLc=;
        b=YgdjWjTMo8VB1fP6OxHr9jBFEat8DI/aPpwrKYpglri05jbxwAnh+o5L4gWhsSx6tK
         +FY2xfIOt10ZrA7fxvRGs2bSbiSRw6N/KIUEhmIIEuSQ8raRUv2aAFxsIBfF3piqtaBq
         H3DV+MTdn4tNhtm+OgFaH8PzEuv16YF7RZbz0qnbUMwnsHyCf0GVsFJLgV059F8Egydh
         KE30XZ3hxoTUtmUu2h+jPw1s5rXRk2C6QF0fO4M1pmWaF1y0wRDv97zaeq4HHfYJ1yGO
         Rbad80NaNl0MLtVnQCZs5MG10BhWR1/CakrzDftH65kB9ha8HFj/D9tu+juKg9916iQV
         +x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261233; x=1791866033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1UnSY1pMfytkclFL9S7Wbx4/5qWTLUFOLzTIY/CjLc=;
        b=EHBFvqH5CSyvkPKhPIEOhEPg37JMN2/kt4rHrS9s3Hp+9QO3lYkh8FskoZEV+A2D+K
         4erPT6cc6c5tyHpqB2GBoYY1E/7xjpYTT2E6qVf/gia7TnRt+Rcv0eFPGD8SXL3RSTm8
         AgEhMDGzuil9iv9wLET8U66ngTYJHjWrge0IlqTk7pGiWFfzq8BtdfUVUDI/QHftdYng
         4i0/5zwoRUaSWLg26EkxLwOP34rPyRXxiQfqvVEcq7nGxWf23XLJbdQnzKFIlKA1CyRw
         Uqg3T33L1S/Cgjhr6HWxhb8GO+2/6Nm1/fFMbmnpRrlloMWNaQXPAf3Traet3WZqFsZm
         86uQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6N5IgXwvbMtGDS3Ee7fN30V5CSRTHfUvPQLxo0v7vvFFI0dXJ6zoou6D4/a5HTSSj9DVlmaAqGAgHwoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpM0sClmDMt6KQ96wSNbRKgxT0vBP96jDttOUUznn+Zl+hzcN+
	JYFI6Cu4Dv6e3VHOHSD9cl6coNewYixSPcTcZuZ9kA0tkbGbrhpP4A9kHVztpQw1Zu6tEHJwOGs
	+nNL7L5wkcvOcv3gzfu6y/sfovrUd+SM=
X-Gm-Gg: AYBFou1Ai3KEvScR14ZMLUy6FRXH4R+jaNbpOBi0gt3R1SIQtuOngvJZ4lgeMeHX/+5
	SlZnchMJ3MWjWaik8Cz9DYF6bgCcX17y3dsNXRJwnGtqselkz1IWeK0ZZxc79cDOvgB0OLFTSGH
	sW4KQXuW0vTlQMDh1qxPNjf4tNOILLyAaT81jo3d60bv5l++XMti4Q8KTQ4/MeJ8tRays+Thl+3
	HOgKs8aOW4l+a6vwdt0uCJaacmBLFXq2TIgvL8WqVbpRh9ykLewmrloH4P/kAO8ob5FxFVNs3Zm
	94NHmVtWLRGqdvcf53c6nNIYpsGs7kbKUZ26mNmWI4Y8cvlUdZxdrCLFrPFYrFpl2qMf3gDFzS+
	IdANSR3ZKq2E5jDm7Pua/9mFmJT52XX1LaX8Y09jcW+Eh3ZI9MkjCtUk49BeFXFeUBekbkLg9+y
	wCbwPYc4QOh/e/gBq/5lje+WmnmEWM/Ii9Cq4BRAZPbWx8
X-Received: by 2002:a05:6102:41a4:b0:7b2:508e:3d40 with SMTP id
 ada2fe7eead31-7c244b9b1d6mr2226954137.15.1791261232672; Mon, 05 Oct 2026
 21:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com> <179082917987.31693.16306963663623790870@kernel.org>
In-Reply-To: <179082917987.31693.16306963663623790870@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:33:41 -0600
X-Gm-Features: AclHuK82V5DkOUCqaUhJZE59pODmUlafKc3ZXKL-nCUbjbXn78J9QhKq5piIljM
Message-ID: <CADvTj4p8u0A-6hZ1Z231Z5usg5v8riBHtmskz_ozgO4ZrP36jw@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:33=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found during fault-injection testing of live XDP reopening while working
on the larger stmmac MTU/resume recovery series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Yes. A failed safety IRQ request produced a "Trying to free already-free
IRQ" warning and left the WoL handler registered.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The reproducer used QEMU with the real driver and IRQ allocator, but
mocked MAC/DMA operations.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

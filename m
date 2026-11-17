Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922002;
	b=Enw1VSqjmhiTlL4tW8Cu389GJRfH/POcta+yYApNqdb6sAGSnz+y8HDxdUE5Ucj9fUdH
	 ya/n4kprn8cCZjyyLvI4cwRMuZhJYcxSJ31sQEhRUQffw8VSd3w1M0jzx+Xvl6HpKCAZC
	 CBJmbHla3PxiNsg5uzM4Yc+biTGMABw676P0iSaHnR2njEwxMM2M4bPeVZfdALfs56wG2
	 metkOEZtLsKHq/xzdFteDmKY+7KKa5Y+TrlidgT06z0QT6vMtecS1nqduAmInaK02jYau
	 HGt8/QUcj9uxa7fl89Q78LxA1xozvKsNEoxqAfbqpwB1JiytcNa0r3aEO9ArxfkKQGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
	b=Wjc6hVYRohkYLUEYlUqjspQ77HcMwqEeMWUS4ubYOejiJncroQmhBnGk2u+3JhuTyJBP
	 f8kCzo+EJTR2u0XvrN6mIbPQf7RIt99MY26Bq5IIEw2rWKTR1ulnh0LjiB3IQAG3RSmpy
	 TLHQaSIaPWD6rBiT/jR3lmTVNjCEuCeBEA/JClqz/Gp+UV3mmRVdJHJaSq6O3z39904lT
	 DIlvTr1/GEmBIFDSJjqwZ/CYF+npb0/snPtZ+tRFP4cBVQIpewr4+cY/xe6XTgVMw5mbA
	 StgTMFNQKYQZwcC3RcbIclDcAGuF231WVvF3k1+lu4UGm7GNHxuOzFsiy+6bKcbr3Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTsTP4U1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C26606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTsTP4U1
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso564162a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922001; cv=none;
        d=google.com; s=arc-20260327;
        b=dlH4M3x/a+eaRBrqshNwQi5F2ZB6RxwNbK/K0yXeIVFUTuauHYw+z2V72dNJ2ZWzDI
         fbd7Glnvmb2Z7V2Q/T2IXKGPF9TxCrR3haTw/N1okCF7qKWjzI+62my1CYbsXj9QGHqi
         Aq6IbWVQ8nVCC2vPnv9KJ8QZ+hMTMCaKgIIx16/S/fUnZyq4tjdegYzC4WaOFsJgVG2i
         OLN2THINjxDfVVAd/b/8uQHPfbaM0eFDXpAp6SMJMI+muMr20f7lfrJr605WP2QzWaUE
         frJafH8UcrHe0yILixicMPedIWu6rSy0szd7ZDW0F7Pg8fC8eNSGlrbiIt/MZOIof9nR
         bAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        fh=4NVQLmQM18IZJ5t899LcyV1EVUsztVhBOpD6QOwI/ws=;
        b=XMCHA5MgA2eWpl3+CuU+ltI1sA5IIoT6XGjz0KCgWicdHtSYDtD/BkfCe7vroWAlmT
         Q4BauTIviJP4j6p3jfu9YsQOf6S6y+6x9/TybV5c6HlZJR3PYaqePF/TU85it4joytDK
         85UIULHeZ45+Gkmr+pgQXlTxc+xomAQMZOFFdRvNqCnKrVSnglUn3RwQpQXYpsPDAzfH
         mHQMvQBm+zeWPtep1RHZG7i8B/EWqXHeHZfAHG4T6aSCPk8D01sr1s9KtALBtqMbFw7/
         /FSAMWLU0ictqlfekZZ8hsYV58Hec/C+t8yMYCXJS5mL9bfvpN+yNC4aQYwbKlD+ZkHe
         nVaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922001; x=1795526801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=tTsTP4U1cCg9Rk1KBSRbSUm6wrsPHp1ZGTzobUTmseCRCyq7/058crmjpXgSCDQrVD
         Oo//fiT1U/F1MgOxMmxooc4czK40/OUnCOlhjrsYgDN9x3tSKk16GX1Hh49zChF2aP1L
         MHLP4aI98Sg3L2qBUjcpxaIE2XkQkpiMlmnY1UOMMW395k4HisBZyhNzgBrFASyHdSoy
         Avg3UUwBdhjJXOLDxSd0mL2t7078Cy4hytGP8ZlALjQYHCUUZGiP9E82hfdRNeRf3Tia
         VRF8x8qN569gR7x1QNnbgToOet2Laa74J4mR2YGYkSdMROuuFvFVVPJYWX7gsQ/a0Irh
         QcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922001; x=1795526801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=2JP8fDhnTCkzZwni8LEVesLagsM+XA4EOYZ/Ov6A9kcfX7771KKuzz49lA//m9eEc0
         f5Kpxjoq+OuHVAjBJYr7mkjo4+SxoOl5VBjEodRstO7r55WVY5a/A7C5u4vNeEXDmOyn
         evD7B3bZXSWYsH3+oznw+Fl/7CYG81eXbo0Pw+M7mQl+a8eyBsN3xBecYC9mtdbRkbUV
         8AMpfjSFG9WuZQkKWuNI8F8f2xpS33XxE15WRa1pTxl8Q22KNFTPrc/LKgYbZoe9kyo3
         FqkhpST8idFbKMvePlWHyQbSxeihztGS2HSwRQKt/A9979eXVieU8aIsjpZR2DZ6sFzi
         zfkQ==
X-Forwarded-Encrypted: i=1; AL+hErH4vEKwBc7ZYUilMPbkEZO6GTkyvXs8oruS3kmP9gFHTu0Il1XsrCg25QAgszslN7kZU9g+EvjpdZw2sko=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OqKWBllhhNqIHe0uMv5zcj8jwhVF3/seDol6KFkLxA0j0kwF9
	KvocM4cC0aNV3A6K8tM9zLyPzIEUp4rXIPNaHy0X1BsZlnHM+pq8w987/gwW+ZTTfos5gPgv8Lh
	8g55rTzndQUwMrRCD8P8xZCBt96iZ+Ic=
X-Gm-Gg: AYBFou3nbwsoC8R5joPp6zHQ9EN7ecKbDPnbsmHeAJFMWIgxb0nNLyfZTMNWCDVYz3X
	RXtQMS/0jgtEgbHlphZ1FDobdEPhJUU3BQGVfxCNYpOMaBaK29OUPB0aP1QqnJxhFOIqZ9eHtcH
	tG8087IUjs1oRg8u8qJkwI7C3sjbtGqVnwVrop5+u9o1gN6j8RVYjEIcRR+WBO3LxXHcGF4OQTj
	Z4FnEiSQ8NYUWxuWQeoyUTQExqGVVhqb4c5WG1+2dvY8/Qnq44j7AcM5BldQDiaGu2ZC2XJNLup
	HzzJQI4KYVqIDJBkukUIRpMbDo7I/x6bDO/CmFqbzrQzf+n9VC0c0f88/m+c98333GrmWrus+La
	4bF/+nAW940N8POPxm0bfDrmLC6lRjBvy5mA=
X-Received: by 2002:a05:6402:4504:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b7c0d06f9amr10641554a12.42.1794922000158; Tue, 17 Nov 2026
 05:26:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
In-Reply-To: <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 14:26:28 +0100
X-Gm-Features: AclHuK-pAjMxUsyMno9u008purn-se7dqQHzpp18oe2HOK5CuVKhIbMUqhDzQWQ
Message-ID: <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Turns out you bring here undocumented ABI. NAK.

Hi, I'm sorry but I don't see the relation between this commit you
just NAKed and the bigger issue about mediatek-drm alias usage. It's
not like I'm introducing anything new in these DPI specific patches
and the individual display block drivers do not depend on the aliases
(they're used by mediatek-drm for building the pipeline).

I understand why the commit to the dtsi that includes the aliases is
NAKed, and the eventual fix is going to require a change in all of
Mediatek SoCs dtsi. I am fine with the dtsi changes being blocked
until an appropriate solution is found. I just don't understand the
NAKs on the DPI components.

Thank you for your help
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

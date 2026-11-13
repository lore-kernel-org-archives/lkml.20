Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558040;
	b=b6o8MP1ghSCuSO96Pe1k5l0vDPAZqtgaruq8xDnL4zzNnCaYBeCgT35Dqyrz6uG99M1z
	 PNvimX8RfkgVIN2GNck1DYNqb/WZYlb54+ctE2u+3+uEjCcVYRSwzbjDstfL7uX2R1Twn
	 naXk2UAxVT/F2Cy5Xu/LEGHXK/FZnu+qPmXbM9AbkOtZLl8u9ih6PNYHKQ9ES8jcTfGEi
	 mkfFYOwxSpEzTrisFrmltU141ra6OVypVGiMRD4KK2gJ+ZX+cmsNo+XQCRwEX8YGN81xT
	 3ekc2lnr9sxAtFEuQ81b30WNChGrRoy70Vx2Yj9+B4+asx9lvO98CQR9lXNhi7GKQXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
	b=KK2ihp5U35hjtpBhIGv1uvxsac+7d8dmHpjeOl9qspm3ihXzcjcvKjCBltV8YT7kw5AH
	 Z+fGwHffdoeOKHNCnSYbffa6PYuyi1ZZU6f6ds6ZfpqkAwFWB9CXlAJpMmLn08xAaZ8+Z
	 CwJDwOFQob8ev1t9yih3LL1cd5y2SC07+gcGhxZsj/VhCt+J0XrGJeOQcHxzsm7PArM1F
	 AJtyoKMp7FBhSP9Aj5FtbZQkNiLIr6QivS8jjAkBgfnTy/PZ/h6C0uqOd4j+RzxMb/DFl
	 MpmrQLKBrLoDRWftLZOQzpOjROFxozFMAwxhiAiR+ZMao5Kvsjf8eSyWNnhTl6PU/UA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHhozOY0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89973606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89973606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHhozOY0
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so942111fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558039; cv=none;
        d=google.com; s=arc-20260327;
        b=IDxX8hRs/0lkdbvtlvzi4NoNho0bMjf8afYU9xi9B/XTl4VU2UyB9SbXvBLvDCVVw8
         QEGhRw7XsTV/ihoQ07GtzY7VKf2gnPDWco5y6BtjPWi0c16H/71NH9avF/33wagP68vr
         u23opcebMl26jyezUCYgcnc/y2zmG6K1kDzbuleQcbuhg+QkRyaQDBfnQNU/HHebUg3P
         It9rpTac7ucJo07QqDZ1PlOIJAVj3aC7HIf/AxtFuvyDs0YfBS1Z0Vr8Xm3OUKDuukh8
         h6mRePdUMCsbefsmfmIpz0+7+2PMs2Zq6fqxmdXqm1egubgi6uq41c9tNdCb6C++hwy7
         Gr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        fh=FPhNWJrmCF6Lns5Nn9+RUsPzDAJNmzVAlCCMYo3zpYE=;
        b=bGrREu09cmKMTwm7WC5WbOCeaftUFjNstnmGkONfP5QvVvWISxyNjfAcAghcD7YzqD
         0uANtr+OoezsZqxMBlsHp3sR4wBIt/5UWfxjHCn7dXG9wTjbzpj2bh+CkXZ+DJrRUjkD
         x5rICjUa6Im2PETWc7aVN2r15IJAoCh5eT3HtqATB/kZ30n4PU1tnkL6NInVBoPf99eW
         02BrHtB/RdM1NYStNQtyJiLdmioooPxfOGuhcyW/5MlA1CzIuL0k54y+lwU6dRStDFl8
         Lj0CqHwESlVPZ2PBx7e7XrdrM/eX+BSNTd6OfDOS5B9xhL9Z0PZE0cBjXhxDeN9ODMOc
         0T0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558039; x=1795162839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=xHhozOY0NJ2QC6eQD/p+zobo+GcRPv7sezbHuV39CnsJv+rIFMXaRxdJiXo4HMW5rk
         kdxvT7jERlvnC68k2QiiLyZBRz0Ugps4BstnvYKRHz5kDQ7XrUh/llNQWvuncUNrlHtb
         UPAURYJDSTDhXQAGVBdPLs3MbasyoOzuhkKkSlqdmvs7/hg/e76tWeuXBnwTKZWjyeNl
         6gPLUcwoKmikMRmwQogewu/eo82l858Atm07y51VNrCQ7+NeVO/+QfbKpyK8znspUjBN
         CxiJHKQWIU0idMqoy3WQW8DkOPmPpJtd1qWjg7LA0ELH3ls0J8uIExMIUmyu7vTMrdcW
         OmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558039; x=1795162839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=JrcUCf3ThTcSrixDymmE8NibtGC60AN+HDfVcRbbZfhU66NoriiAzRzVQ9uOJiByiM
         qEzgAEQGQJts1nUobFG0/KSaPBIS5PEafpQrOohc6pCiU/WnLebzEt8f/PrjO1HgHAS5
         kP4VCtrmisXxT+Hqb1W7ojgFsgVXVzY5SIhnbStmHwviGvi8gCXuYtYqg273MMc4BwR2
         dfEDFFMSVqpF0yY4gYsMrFiQeLzFozayLy1L/3QzK/Y6CZqRiGzqbWoWR2+vA8AS5xbe
         OMRpRbyUy8nTrD+zEWGw4GBcJ2sCkShgmhMseUC/nhGODc1vFBvIk1Te75ZmRdZnvFFY
         Pxhw==
X-Forwarded-Encrypted: i=1; AL+hErFPvrmMIUeSvTEbdkTSgruE6Pwesoc3BSqaMwLzH0GpCqdz2mlAUnczUehYajeIzDX+UT/AVssYgIIggI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D9O+yU5l0I1fcipnmc0QtNpkaP2ASr8lRAEWOPkgm5HN9062v
	Hxqu7h2yeEO935WBA4UW8iwkpI0oKTWhTsquHc1922jqp3nlMdpMNAECBmId2b/0UdjLioii0Pf
	cpM1Q4ROZSbCkfpKGTyFcuk4XSNubjFg=
X-Gm-Gg: AYBFou0x1UW+bE4tJmRuIHT517OKP7FVmfo+MRhOtOOA70KPibq1PXstWhRXBak4FJ7
	hJzQOwvvPabU6KOLLZmIJg0GzeuXv4ecj7gNgN9fqiyghcHbZ9CYamPGKPEReTdW6+UuJ+b3bDi
	gk5l3vKVd+Yaj4iwm5WTFj+Sj6Kia/xviNpFUEkWRWzFsg9WRuCRl7DCHLML/PFaAvtKNQcN+4J
	WMe0sEMQEZ2cGXvKP4f08w1MVh6MrcodL4cEjRY1fVHLJqpVXXwlmiQGoV9ShxORqh6qmLamfI9
	qzETcv/R8rmszU+W1ecQzwTX//F+ZbXKN/IYNtxN2JtEuJKdgO5nXJ6HARyXYkQDf9Ckmd9ldCH
	iV1nhWIdp2YUI5SJ/Jn2WL/Le9pY/0L7LFjhvt6w0SD9v82Oqxlj44llCVSsyaRQMwLSU3to=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr849129e87.0.1794558038625; Fri, 13 Nov 2026
 00:20:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
 <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com> <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
In-Reply-To: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:20:26 -0800
X-Gm-Features: AclHuK8fPl6O1DLxtbIbOB_Tvsw2cAGJCYYC3mBqm8ET2-FLO8BbsLPv08rZzEo
Message-ID: <CAEy9hNXErDHYorhMp+xVz-A1tYs7JSEdFYApCK5AO1nMAFDqCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> It should definitely use the raw port number, since that is what is
> supposed to be used in DT (and what is used in ACPI).

Thanks. v2 crossed with your mail; v3 will use the raw port number.

> FWIW I'm also pushing a series to wire up USB on M.2 connectors [1].
> That also has some code that does OF graph lookup.

I'll look at it for v3 and reuse what fits.

Arun

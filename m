Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597300;
	b=pWxs+dga1hkGdMISxlmr8GzRq32huentz/mqQbqi2ECxGK/7k4CZTJ1XBrTfsY5SVB4f
	 jCjhuYj01QFgZZhjjeNIDKWusK0JbibJrq2QIb0t+9YSNfhDGxYpKZIIBx73Bb6uh2ipd
	 aOT71AdHNmO2BVFRYfMwbUs1RpkK5mnT9o0ro+w+r3HIFcggiqMAyNDtFJHjcePYhQsJb
	 EX/+U5P40sBLm8lDDcox0Qh2anpB3OyfAsoeukLD40fdTdfqbtpnqVSo/Upg7k6VLnsPB
	 YSDalgJ9eFESZoBzGwW0Rn7sN0dWdKeZwyagoT0BPeEI/smApyuQH0ZhYyDCo7eAgaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
	b=blKywdE1fl7epDbTwlHGf2g7KSVh60WDUvzPEyh3XisFfcXKsocQlqPmih1l4Q0BVcd/
	 pFUQN46Xfu+n/UsQqBIBTp7iyGjhZ2Hj7Ed9xiibEqJLeFMamMZuTqoG1dJn7woEEu0jM
	 75xZY/fj67eGWM+5YgJfAJJHTBOSzJwU7Pm/UsUwz1wGF915enCpAJLJ8fFshiRydqeaB
	 v54hSM6OM2CGoxlll7ylVZtOdrULas7Pum/FUjIZqeT3ZQbrJWlkwodYBH62OR95iZ/vu
	 U3gDgAnm0UHn+3zwgQAym1cPdJAPWhn81PeBDf5mGdEG+s/T3etaj4/+TFz6MqrshOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxInhMNU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E40606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E40606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxInhMNU
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be7b9abc8so1105019d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794597299; cv=none;
        d=google.com; s=arc-20260327;
        b=dliq4L2Oo7Fg6Ge7AFXDJoK5uosSH6oXwqGbdn9P4mhPZLmaX+TA5yCXCYqvqJdVS7
         4zam4TbqssH7yyN7zDsgoJuNPpA89Nf93QtlT6q32Q/eoUjoeQ1vuSnsXQQOWbpewF+t
         K5qsnVKZ05lfn1Vl/6m05CS5xFe2B0qO+CTBd3CPn20+G+3JIFZrt3ahGwWjUe7FR+84
         DLGXzawfStoYZ6ifv0n+nqSNqb/9VhAv7NYxjhFZi234YqKMMu9zaoSzC2g8ixxf/U6G
         meCX4Y9IsEAH3L3Bvc9pwP4fLstf63kpX55//s48Poa7pPg9B/8T238OJrBv0Xal/Pmy
         oQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        fh=PSsm5ZaXSjdKvyllCiHo5FXqDjtAcjsGzcnL+5eabm8=;
        b=TmjWBGpSYmY58tAuOyRUnpv7Yah8wsxKKLll1H7/gL04a1WFHSvPqXoSj3CgOopE1Q
         Fk17KdkzDAT8jo90LToOJB0RhluSWlA/R2obBqm6crVF3cCQUixBwJS/vEvMcBaQK0fh
         8u4FABKFZdwZYwLKmyWmcbfNAEj0pB40h0IGOChU7KuyQeF8/80tikde7ohmAQHpogIw
         3ItaoAI+scw6g9qOJL5zRL8JT6rHsTpo6EbpHXJX5aK9ypRr//nvc0ypKEw/w0LKoo0j
         etYcUA2pgrmcx5Jd46HuzcwZcff3cdQm6+QIBbPOvkZus16TLwLRPn8+vL0bkHs/jcKE
         pHsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794597299; x=1795202099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=NxInhMNUsk1V/GHuk1KJEYz7215Gz/JpAe8IOmddxaqdRdV3SRBV6i4ekftDaqb5kM
         aNmI8zGb87pgvjwzaq6B89gecxVmqqFLzJusRJwwA3OwsIbA7BuQYtGaP4A8sNt2kleZ
         NyW/BoJyCMWS3aBm3XxNxhxB0a8kUb9niJY76q1Z01Fj89zGHdS3otf2dIInzkQ6dwgY
         zPx2UsPTrqqDaAYBr1oYlOxUYjfbGzKIBzmWbo7NkAr6Af2D+gpiKLvLSJOG7P+9uVfv
         G8kpWf+CLRYJcUAj9aYqW2QJGz5ZH38aJ7wMXHvqEbRl72V9Ut8yE2FpGX0/IdgDmid7
         SmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597299; x=1795202099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=jt9hgxkxrKj3ILLzOMFC1TH7KIuwRELMCdSKXAjIfHUXcVeh4L7KHqxP7xcMnJ/lKG
         vF/frNdCztGNoqCJFCBc2NtPSAQIb53iOBRvrhWe+KXdCsFeiHT0xABOpSxH1IkyOmbU
         Sds8IolP/K9upYZo0LbUOT6j22G0LeXRblVnLaO8pmBGqEjkqgA7Nf/FpzhFypMAV2PK
         CCi2d3rjYyWcilZMFpogn5BmJO06I6U6gSIMhXVrxbtyMw91fhjMuH245Y3DXIfQbgfg
         B9bs9tzXht7Ujhx4ErKPUzGbgBz1z+jvimTOoPSYBphYO4B3g5vVvrJoUo/Bwbg8SA6r
         OUmw==
X-Forwarded-Encrypted: i=1; AL+hErH45aOcPexXln4GrMGn5/jnvPThI0qTsAO84oMh5zFGkV+sOqH2K4CEOdH5K2TLOee7mqc61mFeB3lI+cA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LU/4J5l1YCdFEclcwUuzM73iewL7cpWuuyKdD0Yspo6Q9l4ck
	h3QhpxeqjHuDaFfVzECFWC1ON6jmCzMfkb/kGL6gOYno1nqsnnH8LtRcrpJ7zFy4K5jexl40u7g
	P1VEv9Mju2EfU6Lb5sDKQ7Qb5GRyUdWQ=
X-Gm-Gg: AYBFou1hOsvXd+aVkyN7oPQw0GlTIOPDmL8ep2Olh/R9pj1hyt8uUFKFViGYgd5sw0D
	+W9NirThwf9s7G2WdTKOMvTLByn0ymN12FjZLayKjVPjbXIx2Y4tBn/2DXhreDEs4yuB7WY0wn/
	QlHtM7hOQ9nX2Lq+vw340dzxa/pJ7rok1W/oR+Er6ncpcrOxNR6Fne5bzh6w7XQwSyKlWo3Dn4d
	G4h+d6HeHtm5e07IMRIi0REOipNl9yc5tsU4nOzyWYq+LEDKu4Qx2yD/Y+WcgyvcDMsWlb9TpZa
	53lMbJKiX3/EI+CWh5F/P549a2E89FGT376ckuvfwC3dy4lrZykVOv+VjuAqSHegO6YQh1Tqo1m
	bhbr9SwJda5OgOzUgvyHaSQqLhqQGro4KlVmx0g==
X-Received: by 2002:a05:690e:1188:b0:67d:98b7:8861 with SMTP id
 956f58d0204a3-67d98b79810mr345876d50.48.1794597299405; Fri, 13 Nov 2026
 11:14:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
 <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com> <20261111004732-GKB2005@kernel.org>
In-Reply-To: <20261111004732-GKB2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Nov 2026 20:13:00 +0100
X-Gm-Features: AclHuK_kboH0z5fWoPol696e94WfTnxywiDJDP5pOyMB6ipnYxJpzrLU0NPVDpw
Message-ID: <CABdCQ=MPPuTQ-3aCds7F6C1AZ2c79HVJXGjtqN9_jHpKo+0E2w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: Yixun Lan <dlan@kernel.org>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

El mi=C3=A9, 11 nov 2026 a las 1:47, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
>
> Hi Iker,
>
> You could drop "RFC" prefix next time..
>
> This patch generally looks good, while note that it has to
> wait for power domain to be kicked in

That makes perfect sense, I already noted it in the cover letter and
I'm fine waiting until that one is merged.

>
> On 20:56 Thu 15 Oct     , Iker Pedrosa wrote:
> [...]
> > Disabled by default; boards enable it individually.
> >
> As GPU is integrated within SoC, I'd rather see it enabled by default,
> so will not only one specific board befenit from this patch,
> besides, I see no reason why people should disable it by default?

This is one of the reasons I sent it with the RFC tag since I didn't
know how to proceed. I'll make sure to enable it by default in the
next version.

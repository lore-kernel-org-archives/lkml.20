Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481402;
	b=34S2vk56pvd/8xnzo+s8riOobXqyCkm3dQlo2ffyLFYId7ZqKdLXQEhDGkfhbRaB94bM
	 yuUkSvL+hqBSgMzyGptdUG9OSnIEo7ygQcV556OxwILwKGgSag+EFirN7w/Yc5oWN8wHc
	 4VzA2FiYUkriQxW+I7lPxpw/K1JB5beIDWNhgG0Bvq0m1OF4Xr9oSmBF8N8ggmFaPPD3X
	 037cKYJBx+nn5Ox6HcF6ebgDfr1m+2r8Tpfh6scF11RKJtOPKM7HA6DaaBzPivrRv/dKP
	 rMHqSqg7IfzAXCqTf/yPWhFNbHc2i2uh4gDfgAiolnPGRZEVDCwpBYCr793ZxFMV0Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vxUbqSaYvhE3NBiIJJTjM4BHgOZOReR7NzFQSOvhlQg=;
	b=e1I43asku3M+zjFVaugk64/AUXtDoZPDM8faAweOfbvaDX6dJs7J+04VA87MH1Hb+XYR
	 QC/jJe9eIiHsN8FeSwTqi6iRWpNjRCXlzL4+Glx6//EYA8Mq0LnJKNpVVZzT8yvoEdQqJ
	 ndrDnRpwgso/lhzCdNJEsTXpcKO58YOIGkFMXO+CNfS4WDbBt5VeRS9BhK+J6mDUk7bYq
	 hxzP+vV38qDt9djE6WkmXu77IzADzFxL68lAnrH1heWGQ9Ksto/OjLf+JJ7nwD3ju/UJ0
	 UHekpJzpJY2YVnO5oBYBL7lqgzflSnCn1EDCimqSlQzRCsVT3tgeHCbRYsoXpnKC3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4WpPLKS;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8153606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8153606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4WpPLKS
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67d8221074dso264454d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481401; x=1795086201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxUbqSaYvhE3NBiIJJTjM4BHgOZOReR7NzFQSOvhlQg=;
        b=j4WpPLKSM/7Vdg2oT87cL7Z3ITYR8YL3O/rFnO34LHaybdj9WJ9u27kZR7mWooZvgR
         SHbtSnVXAn0VL9Wl7jSwN0grF+fT9/OlZVn4FLOCnPsDeEgtNgXJWA57dwZnNLONCloQ
         pbEiLJKUV2+UiG1E3uwGp/JfCjgTZe9oe2wWo61XW21HP6UgC4gYFNhl8qsFj4VcG86n
         QpRXs15pJBcoZOcggid+nUCPBa00Ebrze/m32y9EGkUWq/PrWztEieSblVO/bWtsYdwd
         B+G4tQLKjB1oPlEuQWdXrMnWQx4JtBM62m6J14omtgjQSHzVXrSsATUB/Fydl48mjclE
         Oivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481401; x=1795086201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxUbqSaYvhE3NBiIJJTjM4BHgOZOReR7NzFQSOvhlQg=;
        b=08dGVe4nUJDfcIlrLm+TonxVGuKosDoFB0mj3p3Wkm+lWX0pTqDtnnTndgKI5WhjmL
         dUOxkdD9UdllPhDVs8nN4vuxA2gZjtsaMxls1TsTwiTqYlR/h7jnHFPhivaDtfQO0Xcn
         pwljqbE6vtp3TOTwJlB4CFwxr28+iwo8mXbVSRw0OdrnKRlLGQr6OUFNuiuBGGq+QZwy
         jETLmJUjtM4cgs851a4Ojh8xlxC+JqNY0icN2N/Ehy9zdVdC+bOQmFXL0fIhFvAq+gWi
         TNEShAhZCzPSw+ERT3Um9l4YcAerSeR2gD3pSi1zSnPcHII8Oj8mAZxY6nr2tsihWOY+
         JSuA==
X-Forwarded-Encrypted: i=1; AL+hErHJXtPFXcTqr7qwSJg23TOHvyjRo4CmTvIULNcR2cLxNihmDMx6B+RnaoHTONvb9JDC26cNYeaX/A78em0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SEUCY9gOkg6otITjyVjfdA8JwieyO22183cnacmy6TzbDnnap
	s0LpReh7VgcjZFM/JYxt95z7DsfHwCOdURsVggHmkW8QraMR+GcuDlhR
X-Gm-Gg: AYBFou12ywxdM8xhxatXHtV/7Nqz3e12bHZp9dUqa9T/afHA+cs169FA0wO9L2Pe/y5
	8SoX0UyFkCtb6oKDjo76RRVKAjsufogap2xNOK45ivBukjfLtSi3IAl1Av7QkrnxcvrEgkGB1h4
	ws/uyD92a2Lw/MbSHux2CfI+jRvFVqh9zdjgebxbaKxhybC3Y7QuSalry9/wJ6ZTNnAF+CiLV4D
	YYO8docfQmW1ZLwyfh6r6QL4zrcjbqTUA7GHq8ksnLoTTAbh0yWVI0n1UJozJRYBTP2wnCENT1q
	02cnVUVjEAq5a4kxDBNILemD2vTvAqqlWIPC+O81YzcE4GxA3sofMJ5QWGc2xg+z6zquXtECL+/
	mXYEldbXM+uu4MzfuH732y3ARlYEoLnzA7t0RNyCKLWAKel8gSMk6LXCu780EbSHmazq7zIrDqd
	gIJJv1BHHHasGtFdS0Jiwh9TmUiLVvYhcgOAopS6iSuJW8HPWvMmoHCmc6Issf2dHMp87FVymMf
	w7qH74NG4ETVhEXM9fSUF3YKxVLF9VDODNLMq3pM8d3Xaccfo7i6cjk8VCeJB/QSaBWy5PSzMYD
	vRZ+BDSJmZDUcg6JtAtxWL915bl38E0Vq2t8urFc5fcmCASWKcx6Zk/v68o2XQm6s4H5/wVV2T4
	xV9ODc13T
X-Received: by 2002:a05:690e:144f:b0:677:cf4d:a932 with SMTP id 956f58d0204a3-67c67fd80c1mr4309351d50.63.1794481399903;
        Thu, 12 Nov 2026 03:03:19 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589ea7acsm6965693d50.14.2026.11.12.03.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:03:19 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: bvanassche@acm.org
Cc: axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com,
	trintaeoitogc@gmail.com
Subject: Re: [PATCH] nbd: fix circular lock dependency
Date: Thu, 12 Nov 2026 08:03:07 -0300
Message-ID: <20261112110307.261098-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <c2f4dbce-f8e0-4f04-8dee-3f8d413f4d0d@acm.org>
References: <c2f4dbce-f8e0-4f04-8dee-3f8d413f4d0d@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> After tested, how can I mention this in my patch?
>
> If syzbot confirms the fix, you can either:
> - Add a "Tested-by: syzbot..." tag if syzkaller provides one, or
> - Mention it below the "---" separator in your patch (in the changelog/notes
>   section), e.g.:
>   Tested against syzbot reproducer via #syz test: <link-to-syzbot-result>
Unfortunately the syzbot test is temporarily disabled:
https://github.com/google/syzkaller/issues/8122

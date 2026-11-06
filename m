Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995189;
	b=U0/7+nmkPo9ln5V0Ei+QmySpiT5Ir639bvxwHzLNkWSUbw7t26RKpcEBCGNlniDQOU7h
	 kACOtWsapOJeLoO2/4humHjes4ZkOY6QHlLIJUr6uXBDoUe6LGHu8B4hGi74Ic8vdljhw
	 04oFFt+C6BLmYMULcRNqgCwY1L/PPUmMhccEdQZ8VG36exRVY2boXbZ0Qdb9j0GrYCWxs
	 /2pBlMXl4eiaKdbcdTUaHQ9H1J4UGL8r2mszl84iZdOh6hB+JEkxeDlKVe95FMIGy1fBS
	 Iu0PXV7d3xmMVz3rxiJBUGs7t+DsakF90VIBBDt5EzrQ56OPyqb1se02uRKf4m8n76g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
	b=dL2Q3Y+ka/wXR39slHu0WsTYE6Ansv3FzD1wvi99/qYVZN8d1sZIxHZE+2hpGBHdz2ND
	 f39UYIf1x3I1u2zc1h5UKXCrpwTO7RchB1jSxqKHR/Vqy2T//wPlmariGMLayHN8lkK3w
	 3Gl8zEE8JBfM4gqRzaK2HswSA3ajQG52O+26gJiHvS5QypihQ1UkPhMJM658vBqYk26ip
	 6W/4Icz7OA4ceurLkg4trsHruUiezs/adsx83euGlnShWnK0Qh/JxhnZ6n2UAhIAuxnJG
	 fY+pWlprpdr6RyIDPULEhUQKIVHRZgIcu15ybl2wlgfIafmbyyfpb61wiKb+hyzRtQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnfvgDlR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1313C606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1313C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnfvgDlR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9892505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995187; x=1794599987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
        b=jnfvgDlRBI+yxIh0kTBPlhMYJzE8Ir1UlsS0SxW1/czqfaMO+7NvdK68wIq6ghkziI
         gKUgnEm+CMfUTo+wMw7944hB3nN/K4cuwuqUzB9uw4J8T1SsoHbV2OomgfEKN6tbRiaE
         YvKGhAJzQFxkwDjm822TeEDbrFUSfLOXWSold/vj+045lGB7y4zWYbTiBrgd4M6OVAsk
         koBOXJThh2DeklPjV49e/BWK0t7l/rBPQawLKX3oi0642VX5uHF2f24OOIKWd1e5oZOX
         hH7ENv4q2enAwomT7b2170r09JoFGYqrC8qH19o3VlBIp+BAer3wuV0tKG5stFxhfrjU
         3HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995187; x=1794599987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
        b=0pmRpFUuK9jZDfr5fESc7s5wNTHY2TOq25beoGFhgdcAdJFKK2WzlSlJscwM2w7Cqt
         gJsaQnmHty91oZtZHJwnj0lFAYpGdc+bFB0sV+0ARTtTYBgZEOofFgmBcvKPEuUDzxCY
         G6zgMrMB4Bzhj9M4fkV9bNb7iuI120irzCzq2EjwM3pbz9iWp1JzrZ5xfHiyIxh9VqF2
         NIjGbibWbNWa8UE8gyQrRKD5eJOh4OszmOmIAulo6GwfL4CwLQGCjCLiBcF9Hs+3b5+z
         7/2lFsKso7BbAX3p05FksIj2WGW4Ds4wdzjsiBY13hqA08uAaN9HcOoQxTJ5u3aQalRR
         iJdQ==
X-Forwarded-Encrypted: i=1; AKwUvByn7sYvTa+Eh4vu5/75TyTFRjAEN6C4kP+gGGxk4fhUFO657oJzZBjljB1mYF+HaUX7pzh/KNDh2kkw2Mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u8/bhQiifxDVCtxf6s5FgnuUEcu0JYh6IKcAczlEPaIeMxVOT
	lbnWddiH3+bK+mNWnV+2kORGaxVCWuW1p3criIbHKOKXWcjgVPokYCly
X-Gm-Gg: AYBFou1tX32+cFs7dm2ZlIs68x4zWrE2fEFUC+xp7UQ5K2a/q01TcP2pfr7TxwSHHzz
	K5Vrhv7+rX7eyW2NO2fDQC7z0Ff8n1R+vRAW4RhTnxjHtGXxI6la8bTuae7bbDXIetNUkw5VQUb
	++8STx/p32yEGDlNLIw8CPi8IUxrXSY6pNKni/ht4/wgkhQP2eLszt3TSGLNvpHmYpgwTg8Ni5M
	nE72yVCCIQJpuOf+iXNFGmx/bfS9O5vBtjgwxRmamzi4j7hjSyobwVdAcvkk0ejNSAjFTDXvDRT
	up37GGVwfgxtTy9iVacmAqfThqqM+aFz3WI7GewLrTNAQq1rJEwkY41tpSuo5GqdjXBT1sKVsg5
	Ia3WMwyFHWAgdiY6NdQAnEfdDq7VNRy4kgNVBl4lWRAkrafviaR6STkh5XZfNsBdMKuo/WnHzmu
	XTG839go+OAPLPQRm1AOBH5NhoWuyiBFrpcAcokTMjrUpwB2HrB2TaFmCe/NpJT7obb6v9Q6/JV
	nnbNTfKSKY29WT5ENqUTUeUqXKMLA4V+u/MZhC4nnbtTvDXS+I6W9NLIfUO2/7+WZ/OWZDquU6x
	fUDaZKH6wwmJ7PH1k7YBaWRtCwxv1yg=
X-Received: by 2002:a05:600c:6090:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4b6db0d0817mr56859775e9.4.1793995187215;
        Fri, 06 Nov 2026 11:59:47 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62ecc1sm4414165e9.2.2026.11.06.11.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:59:46 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 19:59:45 +0000
Message-ID: <20261106195945.4157095-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
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

Hi E,

Thanks for checking. You're right about the commit message: I saw the
LED lit before Linux probes and assumed the firmware set it, without
checking where it comes from.

On the Lite, the schematic (sheet 21) shows RGPIO3 driving the system
LED and also used for fastboot detection, through jumper J20 that pulls
it to 1.8 V via R257 (1k). Detection happens at reset, before Linux,
and R257 limits the current whichever level the pin is driven to
afterwards, so I don't think driving it high conflicts there.

Owen

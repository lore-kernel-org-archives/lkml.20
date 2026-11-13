Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530261;
	b=tVHuie4Uof9GPbbAc5qwL47hthaYSCWScmqC5Q2/AMnsR4bnxnoKwIl1ohktgz5bQXhW
	 WABNsZOq5ecRj/q5dwow5MoD/7gf0f3hBPLMWxgq4nDzDCZavOsMHAayEBxqj8aTNstpb
	 lm4B3a0o44QKqK4xrKnUrwKQcCV+cfTmGOFFJdirrD3OzwrlUzTzTpo5yNzFrAccJTHGY
	 M1bvLFSfTgm6SDz4aCEGqGMdTgzp6uSNyYIU6QdhTm6LWRWGNJbbvRUVOZZTxGbMEb1gT
	 LAfNYSxFpOccuASP3dfXuqqtJYZNOWEVmc+G9qBSo5UZdXwxFDZ7Z423lHrTh+0q6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
	b=wLGMPIRWKu3tLupDDnKEAmBGYJwKvWDAwNl+46KrFIYxLRk3mIHoxW+YNtuXP9X59AT3
	 IWLzbm1a72AuoSxranJxVEjUG3n10aS7ZADVe8mgjJ8uVsmkDDsiqXwTQJtRZAy2hZgcy
	 qpaSHmqDAdcTSzDMMdxjxCAPFjHrqM1+QrfH2CgEwdui6Xpho5bARrVB2zatnUfdTMKAE
	 Hy/p39L3uD7mwOZODFDrMETsGXWbOP6WmeuYNTmH+Yztr1lgNaX8/rUTrFBD+yAnxEsVR
	 wksGN7REpJd4U0xQX1+weWYLSurRrCIhaIBE1W8WezCKStj5b0NsLVnwbjC5fuCQoIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E84Ppd4a;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C08606B560
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C08606B560
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E84Ppd4a
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so133660f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530259; x=1795135059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
        b=E84Ppd4aSdwOFEtvb50mYkJ8GCwSoQN5uVhzGqU35AoLpgc8TGS8Zqo9dRYn1xOuHI
         QMJqZx2Fp1O6JrOVl01jihKftVc35Fd0KwGQ/mTTih7BZXIuQdydLjZ1LKBBTTQ6Sgcn
         46vaRf1e2usXYTEgMyipS3OsNcWkpkJlwNUHaiVwCNsXajReQfmXIiYeGzFCwFB1o7IC
         gL4AOJWaMPEixnen4xAQDrBaZOp1lmudiRDreaQurdyfXGm5uzvCEWk+2nr/moNAmSTT
         hRKkAJ+aw2HTmgdYVd0nbIwDavdbwBoGX7xVBVJiSyTGNdyPqtT1TFezwuJluZSvTtur
         RL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530259; x=1795135059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
        b=DglfEtRnyfmeJTKnRbmPqPhqFaD/TgwXDgSomSB4yTNxoJBmMhNwxeoELEl8XI51ML
         VmIVpCQDYiumtae9CBCAyJX8LYONNvwCU8Bt9ByE0h73afcvTpw12TmpNy+XkI3aL2+F
         uPXM/oxvM5zNHNjjRj1272sJJqMZ1VjQH80/E5Pd1rYBf53T6RRIK7hQNAinDkDyD2tz
         hIGP39c8aQJoXF0kIEsXrGzhGdl7gXPDfJYPtFPijgXtkXbF9HTECGm/S5Q1b6XNdSSs
         96yEC97z1O1rrc8chlqsEv++KtDgNKWUAZ4okpkdG8Qsq5VYlwxpJLQkr0suLMJyWJZF
         QXTw==
X-Forwarded-Encrypted: i=1; AL+hErHWbtn178mrbDCozh+NAGr3basOl25S7MUQJzKWns6GHDkJh3exHVMws6WC1dxJqUUb4GJrvud8oMQQlUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eRXuBz3evnwFY/e8DHAnjyIrNvGjqYyWoEwO8BVJBMDpJD0YH
	flF6YMMyKsjfGk7G3ldEMmGJa5XyQV31hMcIQvY9sStk3pukmysINFGQ
X-Gm-Gg: AYBFou2yMM4SG1OtQx4JkGItv3d1bg//8R6IPcPLfqLQTnhZPq8IyOcu/r3dLjYmy0B
	6/gtny+GeTDOjJiT8Eo1BOWR+Z42RA2LvQ1ffCEXBFXIpduFmYB5bf4JyndNuvjL3EmmLlTDDXP
	khQOzj8a5zBLJU2b1RfRMnzHzOrnShFSYpzVTi0e/U0t6cKFPEJuQcS4f0+KXE460dQwCX+kSrt
	pefwWbvAqrdk81wRdcIMik6m9Rv+fVz811r1Xlf2UFSkhwB6AXZGcdfTSmck4JgObyeSyIAMcNH
	KQ0xa0nSmofdWaiLduVdpFZF3l/iE5W2hxjyY3BMeGH5Lk5twDTZDY9LnFNSkSw1hvxFRbbrN64
	uwRiKWXTAOEmiWa0+lfeFh450I79G554sd9MA8a4hf7HtUfMvMoAhVx2guyclIYF72+Kdalu56p
	zKDGCms8iNaMiWor3SloB56TCDWeqj7dcK8KmiS6GhP8t1KoFHtnRQIzSm8Nzr+JbymruG1yB3h
	N+2GKMQRp490Tnf4epzY+TsfmGWJA/VckEaizEehFMVQvxTwo5rObnmXaZTHYxEA7P5M/3iMnt3
	6bxpMihG/+no0hN5j/AzptVzr/9KW3J6Ab9mqmd1Rn/bRFsWX8J4M6U2UflqM+JLFY7XGhVZvu1
	bWKO9ltZzOm6J6yq2yeGEJEVKt4ch2WVy0/JYJfg4AX/4MZUOL7n1QO43mkTGHRSi0IdjRpb8Kv
	dTsEatd1vhPsPI3lTg
X-Received: by 2002:a05:6000:26c8:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49c73ce5e65mr2081140f8f.37.1794530259311;
        Thu, 12 Nov 2026 16:37:39 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm1866976f8f.7.2026.11.12.16.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:38 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding
Date: Fri, 13 Nov 2026 00:37:38 +0000
Message-ID: <20261113003738.3668081-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-celestial-wealthy-cockatrice-7f100d@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-11-ghahramani.navid@gmail.com> <20261015-celestial-wealthy-cockatrice-7f100d@quoll>
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

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> No, that's pointless. What is this index meaning on the bus?

It had no meaning on a bus. It only told the driver which of the two
PHYs a node was.

> No other resources? Then this belongs to the parent node.

Right. The next version drops the PHY binding, topcrm gets
#phy-cells = <1> and the cell selects the PHY.

Best regards,
Navid

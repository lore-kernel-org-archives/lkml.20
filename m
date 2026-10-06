Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E13A9870
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286217; cv=none; b=FV2jt0Wu3IQu70DJB+YSZpjuFGraOuHlB8cLVKV2SQ2WDAD6Jho1hOTvuUXfmbsXqT30r4cVLkfHJ2MB+BOohvrGRP003MLmhwAN3mods1eANtC+T9yBxJOPg/fRy61kgGrZmsyPkW5eQSEuQq1pYZwWcX2MFGrYkBhj1H+Tp0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286217; c=relaxed/simple;
	bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4psQeAPxnmWACBXrIn2mK6uSMZd6IaTT9FWWFSr0sbtv5aLRRKYmzfjOgvgQo/SZCHEHJRQyylUyaksdwE07kUOiMmCwi3HchllUlZtZweUUUeqEbWZotIt8E76IdA0tnoMVcT0svEhYo5noqBxcKS9oQAMwJvEM4V6AUKU5A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=N6ikWCBs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="N6ikWCBs"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso447249f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791286214; x=1791891014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=N6ikWCBsdcbB3DoCIPyofZc4CvNuoUu5bQyAiB//1y7JqLmqyFJBPuyCSrMAUwv1Nj
         FR1bTKZpOVExf8aC7PoDapYQxX4Jr6ef1lhTQ5+1jLxYHmSF346Ad80+p2WAEDiUO4wq
         yTcqjhA+kV1Nn36ZhTKRsJKsy8SsFvYGy5wZHwGuNTsP27BYF0WptCUyELlbHRYBh8BE
         EHQjcH1/thCFs4IGMwO8+cEHHAqJ86MTgA6Gc+uUt7Yo2yC6erKgZi9nZXcbfJiUuN5Z
         tEEsrvBGF61DfR8Z3oiFrTA8A2qN8aT+oxjEQthcCMfndNLNTwJ35cPCze7GLg4zUeyt
         UX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286214; x=1791891014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=td94zWXGGJ3CrZJS5Dz9eM6sjyu4spvNgpexGfpNaKqasPMO3ElTN0o2dY1WEue2xD
         1Ce59ZdmRSYseQoqjV+IJOXQ1C1l7BzpKOObeU3QcRaO6qgUWAFPlx7JHJo0hzkcKiwT
         ypBGFOLZGPy09a0QrV+iZz3rXCb6WDHMvfIUI597KPzx9wMjQjS5nysvPaj443lY3FsN
         yakCBP7kG6Cd9dVoXSZtCX7nxgBtPbVq3uCX/1WlO802ZS1LyVIPPICzWWVIX5rmGPtS
         QTXIt7mPhUaWoTfLzPzueLulPsoq0C8aW9JMdpi//Tsx8ejJ5Mgik+xm/8R1pveocWH1
         AG9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiv4J73hBGn6apzcUjlitTPYBN5GthjkuescKZ/7oWn2OwX3siKOHinHpjLlmU3k9Fi4d0ViOMYMDHS2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kSKNktw3W+GhJ7PCdu/bulbMhx9bz282eZ4xJ95j6RfgYMKCkZ
	DUx9A92OxFDRbv0iNw7qU6jiJgPvsH+b7u3HwtIq7316LBBicxTwUPWlM2sTGoJXbek=
X-Gm-Gg: AYBFou3OYD4yPwI6pXGrc360AnnjsVWaYYvTfK33lcZYBdKEwpUW3yBJog4+WWrtb5f
	lha80SX84LWUNsDrv2Qf8scpFcQfS+lStx3aqiq7HWxa/SUHRg6uZoy9CooITdOHrmCE/Pi4F/o
	WquyZDwcvKkf+Hs2faiPvNcz4TiCSSN6siIYlJdE0TUSf7SJ0i/KliAwUOwnNYhXgGylDEpCQ3K
	+Vo8rbQPQLlDN0lK+TsRbOSYsvBiTV9UmNmpBepo+4gkP1G7fenft8DOF5UeFZAQ2GdJ3x2qNiH
	QBVHo2Mx46tiHODisbXOY5jEfKaZ7Z9S7K+d4VPf/bUui6InFp4cyPV+r38UGarU2KdXNi/2lY7
	SEIY42FGK0XQQ8ueqodPeX5bpGSByXqCGlqRRpw5U38jCaQ01jh6FDqY5fpWU6vKGEunU0d4Mpp
	7iJewpeLVYB798vUfjI7VZOTDu9iBMjPfqOuzyfSr6BeYEE7nI2g==
X-Received: by 2002:a05:600d:864d:10b0:4a1:661d:da2e with SMTP id 5b1f17b1804b1-4a178a3053dmr37160135e9.14.1791286213774;
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6bd2bcb0sm3173964f8f.1.2026.10.06.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev-bot+sashiko@kernel.org
Cc: linux@armlinux.org.uk,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	olteanv@gmail.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5 2/3] net: phylink: wait for PHYs that are known to probe late
Date: Tue,  6 Oct 2026 14:30:10 +0300
Message-ID: <20261006113010.741565-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179120736418.434549.3034364543286173403@kernel.org>
References: <179120736418.434549.3034364543286173403@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> should phy_may_probe_late be documented as
> incompatible with mac_requires_rxc, or checked against it?

No. The deferred attach still passes PHY_F_RXC_ALWAYS_ON, and before
it the PHY would only have genphy, which ignores the flag.

The other points are valid and will be fixed in v6.

Aleksei

pw-bot: cr

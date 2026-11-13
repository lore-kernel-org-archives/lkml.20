Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530282;
	b=K1U2kNrskHeVx/HgdLNIjIXAI1G5+sey4DEEW+lfkpkN5WK6nOE7OpDnY/s/umaXGIyE
	 aQU8bOJiFVGk5vU5uXJ6pL2JHJ+cdNl+ei9H5B6C80VsSGhZ1SdY63Amh4+Pr3fmyQkqd
	 2+meFRfmdw7BJHjgheR5EJ7TZLotJl/VP4kL8kaC/y1jzxke2ujsdsJhEMGRvAYYr/ExF
	 3aEYQrFywNH4eiT2J9Gy7tzzVajX7OQzJ2ZLKrXfZ2kd6JHjhkyKBN8WEJKcJ0RFRgugn
	 E+7bEWj/1X9xcCBmgG5oTuvLYT9+e2UoXftpjhU2YGdyQ41wcsHvQToqmQd/QUhcg5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
	b=i2GUhouYXozKm7B3/mkr3g3194SjbmbjeAbDk+f8vC0RrXJ8ha4alj7PlSF+9CKLu3uQ
	 FLd7ztY5LmEmPDrRCCbYqzLKThULl1iSgJChz1Ei69RaURL1RejxIqfVdfG55IPHSehgK
	 FwLSLpClOfDhY+VM0LKI5x1D/VKdLLTSBc2LofVRHz8WbRh2r/MNgeRz51OMbpO5xD+Db
	 oYIesig477Xus4vrNU7PLjZfHG8Z6cPXQ0Cv7pVEUTtL7z0oikwstftqMyGo26RAWIIpE
	 OS/nS758vm7oSLSuJ6QxDw74CabIm4DYGlUwh72t36qkIft3tUA2OSn5Vi7t1jeAfDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POFAfAMl;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B740606A895
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B740606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POFAfAMl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4921795e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530280; x=1795135080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
        b=POFAfAMlzOe7mxCGaHxHhIQ7MfNoy4mBZBhwXuST4doYXLkrQmGxyoCIufW4Jk67At
         j+SxLUvrhx6EUXK/D9k0evL1gDF8hiWJLQDrmNfM//XrKTWnTJw/vTOLpO3tgrQg19Yj
         LksjfoErsWEKyChkkC5F/qzJ5ZY5Q1G2xf+FrkrL6v3FrEmBwXhI410bfV10v2FI8Inn
         4wjxf1yXt4ucgi9yzWO07vVaURDrquFhvbT3oml32JN1HHN6VH+mVhjIm1SYm0l2hQba
         EvMN8LiCQhLVUPc/xMwS7koslFgMA7GPJ7ZoV6Xt5b4wMil3jIWoqcpNFgCOQxNV6i0b
         2ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530280; x=1795135080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
        b=SPaURROWp6dA63Q2y/PizgZOz1LmZa0ZncBpq2GKiTMwUZVTNk54iffz5PZD6rn+nH
         xAam6SxalKBWa8+Suzlga4WHdJtHcCU+7CeCggL0Wt8zit3YO1n7MV/l/n1pQFAEtQK6
         MnI+FUHOxooSOu4OgrJ51/JytuercWXr0Ysw79tRYNjy25LIuNPDBOJ0Ip7ZEroQp9b0
         Rv2QVAqOePgxFhz+ZO68sL5fs1Wga/NXk8L02MgRr43CDX5hgqgMag4exi9sdAHqix2Q
         9IisLEpz6ED6lMvFtVT1U4BkQLJLek7pxv0nHbDnFO7UcPgr48OfoZODaObiCq0YvS0H
         nRuQ==
X-Forwarded-Encrypted: i=1; AL+hErEk4M2elXCpbBkUfFRYFADXQw+Iq5q3iKQm+ejJl7JUEwyRa9ZZsALavWVmMOGxASRjyI7B2rUUijKolzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gu3U/Up+sDX/+lhgoyKfvHaKEr/unzFpVCsa6Z/AcHZyQIgYl
	IwawK6b5b6756uoMJjIQ3fB9UarIDhzBZcqOt62jeGY87DIEp955hPyU
X-Gm-Gg: AYBFou38t6E4BHCbwznfcyZYmMNpOlp7OnCaw7ZyEbv69s+1U6Ac4juU/m4OA3CAa2Z
	pOAx8zXceVmtRn9N2W2JG3n2Q2d0hC7jDQiWzXAMoFmpIf3rH8V9JnkB0ZlbJdo48hUJj2/Wxjh
	Qr7ayOhD51Wi1VrEdPnRkC4Kls3Fj/ng4GyrDhgPD+jmo2ntJE9mpngDJcpx6wkWPLPQmcaoBcV
	dVKFRUJVCt26weA9UzxkomcMUAlX/MyyjUa2YV24hL7lez6T2VBueCyg/ZdjsBCcRQLrKL+4rBh
	1EKsWwOmwauTGyUiMU5eXvU18+rE2SUODRzMtRs4FZ7TIRpNmWm/biVEOg535vciy4u/sLJCzRc
	EMYieUagT424/10qUNod7Q1dIoVpn5fgPYF/BpjPkofbXGNrWU3qoIKWnCQ5RTsRkCRhxovTUbC
	U4lLbHb0Z8qdFRjh789bl0m9N3Mpr9gyYYUqchnAJP3OXB831XJdSwXJhzeroOVyryoE5S4CJmX
	iXUEqjw3YD508PPZo9zazw6iMeuyUm4hKOoZxTvsKQICfWR/qdMPVDKO1YuzD6RxxwG32MNLDq2
	8wkjKrqzz3FN6awAoGRsby5Z+EpdyLQ/CAhx7IvNBLAtKeNMLLavvtGLS6BKJCOTDOCgR2XmZI7
	AgHHWClL06KGfwnMOr6OGGICG2YJSe8k2jb1tICcEr+N5lJtKGxodHzf9jRga0oawzZzYZcB2yB
	jWOfw+WXXrzncq+CL7
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr12042895e9.23.1794530280470;
        Thu, 12 Nov 2026 16:38:00 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm1868483f8f.7.2026.11.12.16.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:59 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Fri, 13 Nov 2026 00:37:57 +0000
Message-ID: <20261113003757.3669262-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027214830.GA1267186-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-18-ghahramani.navid@gmail.com> <20261027214830.GA1267186-robh@kernel.org>
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

Hi Rob,

Rob Herring wrote:
> Use the ethernet-switch.yaml schema here.

> ethernet-port is preferred for new bindings.

Thanks, I will do both in the switch binding for the netdev series.

Best regards,
Navid

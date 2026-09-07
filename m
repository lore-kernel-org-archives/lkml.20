Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517D84CA768
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811651; cv=none; b=oNpAqv4/tb/vJqT6FseRNnj5lO+1Z4nhrIsErC81qg70GpZ25/phOpGeykEc/VTimKjZaN5NQptF2yhAec9KhAZsoF6L+DEM0oqT4LWWqwDrnNxMCMj7tjNhCafD1F9qDJQxmQItcC2lHPaSRtGVE5kbBVasmc+6n2urV2/UQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811651; c=relaxed/simple;
	bh=7NykevhhirRjqD4n4VJwFeqZSAO1XwPp+tka/eMaYgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3LfxjGLf2lBXuqlbkLx27ifvG2haarElC8yxkOiuF/KSAF86XUuTe04iqJ7D/l1TpLt3fnx+S81x+mFn/KK6oxrNwZKcJeTCCghUVoooheWhPczwKiFxiX4kEwCHVS8P50k7UYNHB4L3ngBmnj6GXs5H18OZph5SQ2MX3KKLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Y9OFU7xP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Y9OFU7xP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso33090865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788811647; x=1789416447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NykevhhirRjqD4n4VJwFeqZSAO1XwPp+tka/eMaYgI=;
        b=Y9OFU7xPUJBy+/s5oAlg1Be75AVxSTrepbtWpgk0VsCl0038EUCjAF+DWkr/Ftq7eU
         w7c41FYEEqLSYs4tED7SCWIxtTKwxN7S5OfWexWjs0ry4+SDVJpAt4G+dqKClIKBdrMq
         xu818MkI5vXHJaZh5dzWWFJZR0S7oAtJjAQmeU31zsOmJkw2vdRaxO5LdR6Mo+7NDmoG
         i0d+nnVG5azcG55xjrLo/PnU9BTO0yP28SOTvcLEqMefqr6pueE5926ljGthl88UoXsh
         1yCTw7rAQZ1bEQKGWSbH4Z7XmVfB1f2xsTzNy9W/dAhfbhzVi5UG9BE7I/koyi0/D1uj
         GGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788811647; x=1789416447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NykevhhirRjqD4n4VJwFeqZSAO1XwPp+tka/eMaYgI=;
        b=gF4q1JK6MP18evGc1bTDZRR/0sJTpglq0RVqejHlgkmj5tTrS2+zTqPKJP237yOBI8
         agr+e+p8UZNR51uNqHCLfLv1eeeLFyll8F/JZ6KanUIx6PqXHdLLCAX6abiYK2KHPEnb
         0B3z0oKaRFLoCdKgxZxWkqZ9ThQhgho4qyMCeaygcKxCUs2uRh3EIR6D4JWKfA+7d+0C
         9iUVgjXJL7ammZ3K2X1Rp+t5HU0lY1Dwv4S7b5FJOBuMGZ8RyF0IcG5TzdcEVWCyJrMP
         vZiy63Jaext/CaSJ4TN+krvkBrZW6bv36632qxg1L5xEyNdRZ+sD47PFs37AAuGoV87a
         CWsw==
X-Forwarded-Encrypted: i=1; AKwUvBxtQiKVj/y3v9aIxPwt46ghLFb+M54Qyyu5uaP/jmzEEv4l3gR2ombMB46yFenCGOUeO0RU0qnAmLXlhiE=@vger.kernel.org
X-Gm-Message-State: AFuF++nyj2GTyNpINblW1cZp0Oy+eC33mNgiXK9Elbv46gF6Kspuil3i
	wxy/I3nmtiMet44umtoHg6/B+KzIHuZILGbVy7nto8Bp77mkcnJu8j/wuU2FnYkz6HBbViuUyT9
	ntVcQ7JbwewdJ
X-Gm-Gg: AYBFou1N2perljkDmnE3DOt9Z0L0yBQxrJa5O45dcIPw6x/qQ8Su+tdqiWMrWlqf/AZ
	YfKA3st7aKDlXhdZF5SKI1j5SlQkC4AGb0IaYkVto5QKRxWLECA4hWY0mSJLWWsv1ZQwEVhnZvR
	3AcULxOLFNCp93hc8wsQs0UCwtj5s5nZySa09mDGyYDH2eXRA2geAqKVJydAyszfP7FFBH0oFDB
	MM/XgW9q2ZJsfMCjhaPvpTMKJB8Ih/iwPOFPR7GjQ5oSZtIAklOnppSIHQp1fMzkGLd8aqUMVfH
	pXdfU9Gu84tcvJo/SUYNfsTKeWMf93mFtfjJ00+8cO0CyD8VF9jgq0xX8m4+aszSTwfAJGWBDRj
	d3r+YJY7zdyCAx9XytfDPi8lU8syaAKAG7iqPz30693pDO5zbc7qWjkU0Ft7Uzv7dMfR6tKnR9A
	j24gD2r2jlOxcJwEAjgvaT7hXN93pGnBmRWj38BNU=
X-Received: by 2002:a05:600c:a40f:b0:49c:fa21:e74b with SMTP id 5b1f17b1804b1-49cfa21e9a7mr169708245e9.33.1788811647263;
        Mon, 07 Sep 2026 13:07:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm295497795e9.3.2026.09.07.13.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:07:26 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Conor Dooley <conor@kernel.org>
Cc: linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: Re: [RFC PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add phy-needs-host-firmware
Date: Mon,  7 Sep 2026 20:07:21 +0000
Message-ID: <20260907200721.3391458-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907-shallow-universal-b614da6fe0c4@spud>
References: <cover.1788711837.git.f@lex.la> <20260906174621.4107320-1-f@lex.la> <20260907-shallow-universal-b614da6fe0c4@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 06:26:31PM +0100, Conor Dooley wrote:
> That doesn't seem right, sounds like it should be on the phy if the
> behaviour is caused by the phy.

I'll move it to the phy node.

> In fact, it seems like something that should be determined when the phy
> is identified, not really sure why it needs a property at all?

There is no device to identify when the controller connects. The PHY's
MDIO bus is registered by the driver that loads its firmware, seconds
later, so phy-handle points at nothing yet. The chip does answer a
Clause 45 identifier before the firmware runs, I read it on my board, so
identification is not the blocker.

> Or based on the fact that the phy has firmware-name.

Nothing carries firmware-name here, the blob names are in the driver. I
can add it to the phy node and key off that instead. Which do you want
in v2?

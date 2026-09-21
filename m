Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09C515982
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027055; cv=none; b=rs4rVNPSmIbzdM21hjXxH+cs5IN4UnIGdlOO14S6+CtDtuqFNg90N0RWj2s4N9LpFnoPaSI5fqsNAQAyYbOERKqTIHxdDfHK/ULygy3p4ZX4nwCfV0X2v02Me5GQ6ryU2cMShDcuexd5WRKsuOswY8vMTSHJ//eOAA+XNZ38p4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027055; c=relaxed/simple;
	bh=ITSFGhBCgCYWwEXlvak+PK/ROh9aqcx9mXeYFcC0aJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjKhL0CjSKjWGWO+p/byFeONZ+l/YRZp6BidP8JaMwH3hwDt52L5DKN+tl43qUj/FG6SrtZc5g6L6Gyn94wmwxfEAxrVDYMwC+/wgHm9CdFoblIITjhfARiE2srEaJiJC1SLJngiumTUiVDD3LVpAWbSsQ0RlWkmav5mBEor1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WexRML7w; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WexRML7w"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso1871597f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027052; x=1790631852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITSFGhBCgCYWwEXlvak+PK/ROh9aqcx9mXeYFcC0aJw=;
        b=WexRML7wNY9HYHVsSLgAdJ1X8hq8E9SbazwD/0JPQLRmJHuWJ2731Zpik7tOudgSOa
         G9juTmXT56C9FkAAZ8eESwPY8of6wjvVYqMKruOfiXF5yt29+ui3kaahHRldS6qbQmQJ
         UBzumqhrIJEYjckC38tUy8qRCvTpTkebtoo2koAPc0KlxXXACERqEHoNodtQiXHJx3IZ
         X5iNUM33fTgMrGkW4XIZ2tOMWtVtrGY+5lB3QxP6XjUTG5Dg4JZGj5Tngo9kqajI0jX6
         F0fbrX1JJYL/zCrnLaS3gjrsC5+MATlfb3ABcPwWKd5N3vOsYokY0J8WtAIvZm6UqaDW
         Qt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027052; x=1790631852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITSFGhBCgCYWwEXlvak+PK/ROh9aqcx9mXeYFcC0aJw=;
        b=IBGZ3DusZ0tJUByp1am51YOivjaDbtEjJyOGmwboz3i1Z3plRvLIi4yp1o4RPP4nl8
         0GhgHlvS2pdyr2QnV2paT47pUaN3wmOwPRDuVsGn2CyCzl5B2I/KdV/1pOeHBNgSffbQ
         JttzOAnAXui6hbWhUkhzmyTAFD8JNhijbhJG9CH8AsxGcpOebPq8twtVgFxGHJ8WI97X
         K66cne6uoeT6NIBUaP6F0fTVGDHq6pe/WDfNjjuqkOcg4tlJ935H7xGD3JedCE8+14Tg
         GqAJlZ89vWCOtL0Hak7S0eqh3kWrGtfiRXt3PyhcVXyCM0DB/koWO6eO07KlZGco3Dl5
         wAhA==
X-Forwarded-Encrypted: i=1; AKwUvByyNa5qWGNXvenKcGvYo74ZBKnYidvq0wapr8hY4zmGXpD4sfLt+ZsSxa5ICz65QAV/Fkp0fMsjmNNWcaA=@vger.kernel.org
X-Gm-Message-State: AFuF++lEpNvsf6RncF18gqD3S5d0NeQPNKo6yJTTg8WTSN3D1kj/ngoC
	S911KZpNe1FYPvalAPvzqtBHDxWdWBvCKTP85K9Yx+PgGa+jC/rfzxKc
X-Gm-Gg: AYBFou131SUuVm7t76NSMgGTOcWzSuvUAeIH9wqC3xGBtaPUJY0T625NrfF9wCUSEch
	2GwHPKI9wSx7UVVDl6yUsDcpYyHAsn+qvWImeawd1csOpcBanui1xyhGafPQgYBjNywR5uW2iA0
	TG3GID4Cy8SZaAlK5tv0N136TdB8ypV7K2yKcmwV0lKxUvk5EfqgQKMYjqpYXP3N4Xx72DrDzZQ
	W08v0N0fhlD5xVj9ypjti8zU1YA19WKwn51a5nkGFGlWpw6Gdv+iGNYVzu6rAENC6l5HipLsakb
	SfOeEtRO1qZDlasQUIXRhwKKCX6SgM8gXs38ccOYjU7vhZtqhaMsZee7VL+HwAab2ZHyt1bu1AX
	5NrH+6ErcDn04kZzQkkKvbpHDANWsCXAK6Ont8JXKgapAdNfHLLgsyt2rM3+y2lmCf2IOyNBshQ
	Mz8ipMzzS7nBo1ko/eANPmOqodjUZtVumOarEwrUFW1ZI5l7RInA5sfMtMiySbjAG0CM1DEVWhm
	vWJcVXVQ3pPtCofFBZx0oxXvAOWQckmIQeS9qvnyzA4BG0q
X-Received: by 2002:a05:6000:2410:b0:486:f404:e833 with SMTP id ffacd0b85a97d-4871e363fd5mr17751590f8f.44.1790027052088;
        Mon, 21 Sep 2026 14:44:12 -0700 (PDT)
Received: from linus-personal-clanker ([102.164.100.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886224427bsm447839f8f.8.2026.09.21.14.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:44:11 -0700 (PDT)
From: "David .B. Dull" <monderasdor@gmail.com>
To: adrianox@gmail.com
Cc: fw@strlen.de,
	horms@verge.net.au,
	ja@ssi.bg,
	linux-kernel@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	pablo@netfilter.org
Subject: Re: [PATCH v5 nf-next 3/3] selftests: netfilter: ipvs: add per-service secure_tcp test (David Dull)
Date: Mon, 21 Sep 2026 23:44:05 +0200
Message-ID: <20260921214405.7003-1-monderasdor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921213031.6160-1-monderasdor@gmail.com>
References: <20260921213031.6160-1-monderasdor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also to avoid misunderstanding. git added the signed-off line unintentionally. please ignore it.

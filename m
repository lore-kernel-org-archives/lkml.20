Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA15B4E0B6C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473223; cv=none; b=t3wAQz2bHTaut/tI+b40Nk++eH+ofJPe5VTINDYFQwKejJMlxRgrNez6hOPXG5xvQ3QwDXyJGuFpKasjhtK2DO1dRYnCPRZg+hK9zR2JB+YDHwT9BopPT0cvBEUGbBB2WZAA0Lp+XL61vrIV8HiY3heyb1LOH1F78kksI42tYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473223; c=relaxed/simple;
	bh=kX25jehi4FuSWJ71vfOzc8Jgj9wsXbwIcLBv8fbMu2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLb4s67+lHOT9KZgu7Xtw68ta59LhOhlrFjc4ylxJqVHfl9/IeBNBrqxEbLg1vgfAjNzeRRKnq7FLwg64I1+IS2d03QZFYNz54aqL7NW3kcTidw7C390sq1tj67P/tKREHfk3qz4ccqPQWO5PKTomrBzm8mwYjTK/9fcVj20/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjCTSO0H; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjCTSO0H"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a49a022221so23628951fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473214; x=1792078014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuN2FUV+hXuI8JXFao7iDoOeEPUnSJxDqogYBlALZhU=;
        b=NjCTSO0HOOA6Gd5dqDjGBptCSY5qXkRhktZoINlmzpm+nevggQ1tfaXiRF3pi/kXJS
         mVF37Ds+plNxTcgVD2KH2hSGkFjVRaAAcVzJLKZzbI+34Q0EwSYy44kO0bjW0thgwOrD
         40sW5COIM3wMiASyDRcT4hlfmIQ6N+wWc18MGiABMkg/+lFrul77K90wW8piiSj0YJ5o
         rwlQfFqZIWBX7RMYLNtZ9cnZcd076tz4EL8xvhEpH3BNbPwOEgzaj7E2dxNJNiIVw4Ww
         Dxb08PYmOKanuAEEohhpaVQjK4FMT34jgPBYyfRb07gVPZh4+vzX3UvW4ZDcuJX35uoL
         e4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473214; x=1792078014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuN2FUV+hXuI8JXFao7iDoOeEPUnSJxDqogYBlALZhU=;
        b=RyIAuJ2ruH18MttSeDQVttJS4PyhAxdzQ6eDcCNagY3Wev9qEF3srQFUATEelqoDK8
         BLPOzfcKWj3M1FO40uyTmJyMQeFpsT2XZ+8QCGW45SgC0kRQI2KEca11iiqJS+HaAQDt
         oUDJTWoT92K/Mdj52WnQpD19YOvPhtgQv71T9VttPJID3tYOlnJoGHtaqK4X0vuFDt9X
         ll7bW2mndK5ObBSOXU3k5DxIeEjsemTAPGSIF0Ppc6W4PkrD3AELVCDHA1G6e2ORqxMt
         xGUsHSlVDidmtYIChgHtSiMpBfvydxElfy4jqDBdqOPI6H+yucw5BFuGTDaWfaZKfyQP
         xTVw==
X-Forwarded-Encrypted: i=1; AKwUvBybEZ9lKs+QulIUNVvXf59nJEe+DnS0K+ZChJY3Ahyw6FRtnK1txbIfXpeBjOOnFixoj9RLst0ucyng2FY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdY74NKUHoSBJqsqBbuwvku0U59UX2TAkf3kuA4HIghICoJ7Zd
	RcL+il1RBE91NSJzMwR48rWEtH7MxT7HB+oItebS/ovX1TqmNORQxSuu
X-Gm-Gg: AYBFou2Zsf4YHGf2bEaDHRVd4Y5KdTaZw87qGYxnWFBWXxbncCCHdNoa9l4W2JLYhr7
	KT7viCyq0N4f5VYzoiWaUMppG4zRhGJBtyYy+yxteRL10Le05ReD0GPXAdD5dHMhzG5Po2iKyHP
	PqzrCIztm1+7PeSIUBOanuyBZLHZro8Xv5yeaGS1Vk2H4eQW2BE4J4UPHjFgpKUgnchuWPs2cFc
	DKmcfSOb1/intn4eMhQiYEuTCuqxeClH54NZz3RXs8m6LcxMJSFKWoWXnQ5cCCGvqLR9NaTqYOu
	tm3Eu7ojsvzj7K05wSoZ2ccS/6eQXR1D0MCH7tJCalan9frVDBEvZgH7NQkaOq2tD/3vtnUyzGn
	nnlTC2JDux8udHK+ZhAL49LeG9LexZPQJ9NCO4eYEJuSCsk0fCYkGxQzEi4vQDwgSXkUjBIUmVs
	QLqJgrmydyvcvuU4ph0hsTHZXzYhFRBNLXMqeKBsn9y+rKTdu3k5ur/krpAglvjg62IikPrxb92
	W3a8kBvAjX8jaJPWhensVtxATn99KW1+fhnNcCfKvq3Ha5HNV52SX3PM6xMYbSFRtr1RDsx/Dwf
	mL4=
X-Received: by 2002:a2e:a594:0:b0:3a9:9a60:2c47 with SMTP id 38308e7fff4ca-3a9a2d60187mr12725961fa.29.1791473214215;
        Thu, 08 Oct 2026 08:26:54 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c141fe4esm159991fa.26.2026.10.08.08.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:26:53 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: Mingyou Chen <qby140326@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	ilya.gladyshev@linux.dev,
	kento@kekto.ru,
	platform-driver-x86@vger.kernel.org,
	ericted8810@gmail.com,
	W_Armin@gmx.de,
	linux-kernel@vger.kernel.org,
	chris@miget.com,
	matias.civadda2342001@gmail.com,
	btx342@gmail.com,
	wleizc7319@gmail.com,
	wolf109909@outlook.com,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	bozhenpeng93@gmail.com,
	nika@nikableh.moe
Subject: Re: [PATCH v9 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  8 Oct 2026 18:26:51 +0300
Message-ID: <20261008152651.1510220-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001133705.69244-4-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com> <20261001133705.69244-4-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mingyou,

> - 0x00002101 (Fn-lock disabled state)
> - 0x00012101 (Fn-lock enabled state)

These are mic mute states, not Fn Lock ones. On the Redmi Book Pro 16
2024 (TM2309), EV20 puts the new mic state from the EC field MIUT into
the third byte, 0 for muted and 1 for unmuted, and Nika's report [1]
has 0x00002101 as muted and 0x00012101 as unmuted. In a test of v9 on
this machine, F4 gave KEY_MICMUTE with exactly these two payloads, so
the entries are right for these Xiaomi machines; only the commit
message needs the change.

> +	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
> +	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },

Note that 0x21 is WMI_EVENT_WIN_KEY_LOCK in this driver's own enum.
Does your machine send 0x00002101 / 0x00012101 for the Win key lock? If
so, it would now report KEY_MICMUTE there.

[1] https://lore.kernel.org/all/20260531123345.237521-1-nika@nikableh.moe/

Thanks,
Anton Karasev

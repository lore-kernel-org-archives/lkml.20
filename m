Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5B922A4F1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441811; cv=none; b=bTs/sFXKwttF6wmGF0UTUh1JpzMjLEakr4Jq7pIzyCbcP7eR2w6nQKdGk9cRzKWBEKF2KWmzSvY/ep7iNZpnVeIXsMr4EYSGqWDeH4UnIa5xv1qM6Z2UtbBcCtbSKA1tMOXsPPRivAJM9ixJvtW+HmgehuTWTFXg0R5Ov5mQwvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441811; c=relaxed/simple;
	bh=4KsUfaH0mpfFuhNkFNZouNlDk84uGW2J1t0zRsLPJVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dwxqto49vMvu1ew+rDYaO13inYP9fsb2qrMcnOrIue56P73U2JKlamJLZOwdrZradlm0/uueQvF8b6rP1tNnmT74RWG5XitfPz5eVVJg1VpMW3JTIabLIuXnpgF6fB9liBQjiKxfawanZc4DbGQcBeW80JGV5b4L8pMMp2wZdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecbcxESf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecbcxESf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e4af975346so28138885ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441809; x=1792046609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fc0gstyYmgIaHfuljpcbBQGo4KJCcL9Xqn1oZFmF6zM=;
        b=ecbcxESfYgr+f84z5pPmKca2nHSOGvw2SOKlX9vYn0QsYYwLiDH09yswji1xdaT9DC
         +KOGAZLqbttlvBt8hCEntcfzH+zrAPXs3QUBd4jW/9iFSM4XQKzXEWoNT6G18IkeQnAC
         sb7MiJdBrYpVY1I7uNC2U/JcCjZDc6GeQd0zBUu4HNKFVkcxW2+AXBZjAJYQE/c1xwBL
         f9AoPJdANVjBgTfxjizMfpKPYZkhKHjCDTzMoDGxkG3pMw0IRDA7gIeANDOIxK2fgjqU
         YyoBa//5LXsanpuBeOFHOwhm7JR26vFIs/qNVebeTtRf304ueng1EQt4rapQZx5uBt8s
         mDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441809; x=1792046609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fc0gstyYmgIaHfuljpcbBQGo4KJCcL9Xqn1oZFmF6zM=;
        b=yOGSkNklmFuFghxKf2V4rHZP2M+ojWh/KxsTT9TWd3e2GdKyB/U9/HnY3MHkd3L4/4
         eaMcePpzwyg5Mjl2KDosM7VvRGGmVyG6hNLgxw931UOUSb3Lrp9tfWEsTWokIJ0A/G45
         Bh3YkzyaDZSqowdpcr3eMSj09SLdQSfhoa4Eys8UgboTXm9yDt+x13M26HPoeZpHSgsN
         7oc5/47ljmn8mN90JioF5jlK9x0mwcB7iHBZnoKxqJVnQyklkXuuj2wwnRjViSPBdo9U
         ez6EVdFfLnR5U31/yhdM90WAlA8APMypg3X+jhF1q6YVCV/MMwVkYWTfHudDSMt78HtT
         jVuQ==
X-Forwarded-Encrypted: i=1; AKwUvByjPw65eBOFhmK1HVot0nfpZJOxPSCErFqBBUQTOhXtO6f3Y3m4KwuYbIQGbFI+QS9ZCHJr2cYjIkhLUDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqTboge2sxqhoYYzKjX/wJxSViD6MFg6uD2DFGsFzAk9nBJwpC
	CRVus1Lxl64a7XHTmew6EVRAUwLQv6tHieNmrAZvbP6+Sv5LRO0+Hzlt/GeRgQ==
X-Gm-Gg: AYBFou2I+dS4QwPSq/AScx9wdNK73f+3GCuO6IZnxuc3UFmu4bUMNe6vEyXA+rzWIzp
	DOtkeW5UTSKZyx60GtDRKyPumBouRvnrlDiYBscgZws97TkJngZJIEsmZ91Zv4fkj5souO9ZcXJ
	3iWeGH4yNKL5DDR+0EJr8+KULI3UHbasfHxwok2dSBSr3EbKsDBIsW81IcqUE6iFjUrZeKrMn69
	jo2UDpuXYxD3Hi38sorLGji8jjbFQHLQYTjObNTmCp+3lJLEnSCjMrNJKoiy7n0Y1f0TqdiZCBf
	5zaOCNIwMxZZEDECEQ/wqP4zPiMHYQ/pJvARwUDWe96bhh99NHGbp7junazz5+pR5YeHfjRENLx
	ImQQlRlFhey0h9I3hqTnLU8V2eEkaclTV5rChagr0kEJWZpJp3hR7faWhP0S5ox8EquxKNQcayq
	CeChmhagY4atIfyHW8EXjs6PqEPEuZWdgDBPuGSwsD6EkKmstQUkyREieKbHt5tnGnWVDpFFGHX
	GmiP1fffYWiOW9UeotB2v4cB4mUp8MDhRnFtF+yR/44PnJ33NMzyEojmqufhI4p7f6ell99mg==
X-Received: by 2002:a17:902:ce07:b0:2df:9eb0:761a with SMTP id d9443c01a7336-2e60024af5amr39693995ad.25.1791441808967;
        Wed, 07 Oct 2026 23:43:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046feacdsm19997845ad.18.2026.10.07.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:43:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 0/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Thu,  8 Oct 2026 14:43:06 +0800
Message-ID: <20261008064307.2757324-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 ADC clock divider register implements a simple closed-form
relation, rate = parent_rate / (2 * (N + 1)), but the driver models it
by building a clk_div_table with one entry per possible divider value
(up to 2^width entries) and feeding it through the generic
divider_recalc_rate()/divider_determine_rate()/divider_get_val() helpers.
Replace the table with direct arithmetic in recalc_rate()/determine_rate()/
set_rate(), and drop the unused mask_bit mechanism, whose only call site
passed a bitmask instead of a bit index, causing an out-of-range BIT()
shift.

Changes in v2 (addressing the Sashiko AI review of v1):
- Fix a possible division by zero: 2 * rate in determine_rate() and
  set_rate() could overflow for very large requested rates, making the
  divisor zero. Rates above parent_rate / 2 now short-circuit to a
  divider of 1 before the multiplication.
- Fix the mismatch between determine_rate() and set_rate(): both used
  a ceiling to pick the divider, yet determine_rate() reported a
  closest-rounded rate, so set_rate() could program a different divider
  than the one promised. Both now use closest rounding, as the original
  CLK_DIVIDER_ROUND_CLOSEST code did, via a single shared helper
  (ma35d1_clkdiv_get_val()) that also clamps the divider to its valid
  range.
- Not changed: min_rate/max_rate are not checked in the driver, since
  the clk core already applies them and the previous
  divider_determine_rate() based code did not either.

Joey Lu (1):
  clk: nuvoton: ma35d1-divider: use direct formula instead of divider
    table

 drivers/clk/nuvoton/clk-ma35d1-divider.c | 79 ++++++++++++------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 42 insertions(+), 41 deletions(-)

-- 
2.43.0


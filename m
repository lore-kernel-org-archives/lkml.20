Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823E451981
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552977; cv=none; b=GPq+BDCACofubtqqW2hm9WnlfkV2U0hrNDMUi43kAjFzfNcasY8fOkRKf0hdrj45ywoBR8Zpzts2bfJROUuEyd9R2mK3Qh6kT0V5d4gi4WWkGuzLmmhn/Hbn/xPDlJMIgy5VHp2N1175+gVpYp/dkHBQF92j8gvUMJreXyH7eVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552977; c=relaxed/simple;
	bh=40TIX3NpIG+zOWtJ1x1uDcURK4B5W6fTMv+dybiQMZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6t0zYGxj5WVl/dOVrttcgj+ClILrzhtCtAIkbDhpKKoYw4LHcyI2mPQHTDnj3tpPt0DCssEFhPJ0wzLap11oFmEUBx4ZovqUBU2A8H7QJse1obmw+qaOc3tb7ezEeAMyjIh6UXPNR6ecY2WZATLGF0GyRX0XFyjGjO7ecCt6jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so22848975ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552976; x=1792157776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bcBhjlsgUHjb+oGqPi1QqiXsckIBTQjS/BaSbdqlKM=;
        b=nBLmGpspsuwTw2FBkoolwdIYvv3fhyScppMx8ggacnOqmI2ffWuR0t9QOMKGcb63j6
         gd+oI/bgV2r2Hyv7vWfJJJH7NPgVE2zHKBRdbMpelA5xfvasfh+Ca4qCjt3FidKZvKtS
         WiTN7MS9M9H7BHB85L7lLT2WIuJREtVguQqpRt2OYUMFYosLJpI38IzVT6V5h4TUDQp1
         ocd8GpwcRONjyjvVVCuAne7XrpxbcgqMmKbCvY6ZjckljVMAMfKY2LozbgHlEZBOjX4c
         DHarjynnHsoDnOdmfHeCNELNmnBXeteWNPbJ8ef3euQX9lkjJnBjl8dqeAcZd8L3/iF3
         CgmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj+K/3VUBGhAwLQoLnIASHL1Oafmc8Rzh7WqTq7IRbILUZ58AZtZ04Wxh3M78iQ1ziaUZC0jBXhON5xGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqwQNuZxjpzADdffIhYWr9Rjrcqb7McpiP6ZsAtWqYN1rYQ3oJ
	kYXnCdx1UzwAiwg3WsJ8+HGOLohJ/u7X7Jqfrt/0rRy+gJrKX0jnIMkP
X-Gm-Gg: AYBFou2aYt+Rhrs+eEiuk6SwAKkyFOVYoCijZG59whs+TMCB+vaESl4trQqbNwbZlVh
	gDV4KqBKFJzNSrWJyO4wlRW/vWHvuSD9vTrvr84bBE5ZFFdo5dBsdDxYSbhanjBV9cgv5Q1RVJi
	39gI7t8qTGHqb2qCizvLUISqyYnzWMjbdf3yM0mRzd6uUHGXqju33EBVNhQLBdmTKbEZlZmzXeC
	vO3SVciCF4886xJphKcWpi9XALn6PCWSJZARAm08CQRe2n2evRPMZysyRO7X/VhUSBydoIpGh1w
	bqVca3JMd6tlBC2fNIdP21oiP2IgNejZ7BjsKyyKwASOoBURkmKS63kyUZnCGpJYzVER+V1FNNL
	7UsMJ8FuV225VbBYjy23aNhQglhszIlQxkxx9sr5wOELxiMEOPRsY4Ov3BrPwyXAtS+pXSdQYn8
	35dBFKEHBxeoNuwpV8O8nAc7wDL/vPFaZBndxoCACmoZOO0JqtVcaEftjwbhA=
X-Received: by 2002:a17:903:1b6b:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2e84280d563mr18482675ad.5.1791552975728;
        Fri, 09 Oct 2026 06:36:15 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm7656985ad.15.2026.10.09.06.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:15 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 0/5] spi: replace strcpy(), sprintf() and simple_strtoul() with strscpy(), snprintf() and kstrtoul()
Date: Fri,  9 Oct 2026 19:06:04 +0530
Message-ID: <20261009133609.579046-1-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy(), sprintf() and simple_strtoul() with their safer
modern equivalents (strscpy, snprintf, kstrtoul).

Aayush Kumar (5):
  spi: butterfly: Use strscpy() instead of strcpy()
  spi: lm70llp: Use strscpy() instead of strcpy()
  spi: tle62x0: Use kstrtoul() instead of simple_strtoul()
  spi: omap2-mcspi: Use snprintf() instead of sprintf()
  spi: s3c64xx: Use snprintf() instead of sprintf()

 drivers/spi/spi-butterfly.c   | 3 ++-
 drivers/spi/spi-lm70llp.c     | 2 +-
 drivers/spi/spi-omap2-mcspi.c | 6 ++++--
 drivers/spi/spi-s3c64xx.c     | 3 ++-
 drivers/spi/spi-tle62x0.c     | 6 +++---
 5 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.56.0


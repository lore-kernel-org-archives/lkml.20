Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386A93921C8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761873; cv=none; b=SfVxKbw4b+W8A+zIof4SV6eMOQKw3AWfA8eRsoRaxtXzCvTqNaxMWl06fGKiW38135Hybkzok5m/nIO8IIQ8w9IUnFN/SAMrnBhPdEX8dKgjAO2btg8NToA0fUaIVM52Y1Ma7LFnnu7AyfmN8rqjBcIgvbCkLRpfKMLtp/4gfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761873; c=relaxed/simple;
	bh=TplUxq1CFTdcfiRVqjUbZN0mq1bRP7VLWIHFh6q6tJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcECezhM1bRKk98fGfT5Mz40Lah/3d/GtM3zCXZB5DfAHUjKe+onEVbDk+dWfBH0rAGmhgx8i8ArixO+Mg9ReGaaX9Otjgby+xNMuz1F8Cz0RMvsFerKMvh1JvtD1yn5gpH2Zz6t1/bPnxA0+c9ZUfphHOm618ml+hXwcdVqUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEDSFAY+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEDSFAY+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-851cbd64814so1063178b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761871; x=1789366671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWobaaywacMu/vGUnRLBYXlkY7KOyfbApyOliISYw4w=;
        b=VEDSFAY+qId0lOc+/jxg7sKFjcwK+1yFwqYyjMsdIMlCblFX7Eb5MPxV5NC/3qBNjl
         jKRWDjn5NL+e4HTRhp6SKGscO6TUEajCOi3S8ZeH3ZTeAHW4UtKZPKuM2lDC5uW6HlIR
         qviBr1R/nFnEIyHEnmmY4Wd6Ia0oLyig3WOeVDqHDEo+hhtXJWokDH78FcNeUfnCawqm
         awg1RMbUmHEF6n3yyrqSl4kTgzCYIem441UBczz22AOrP7NVG15oXEIQ/TFEJYi2xF4C
         b+Vp5C8DUYHCvMSjnYcqNJyPOI9SzcK7oau18ld6BOOeRF+KMujJ9GMLsxdVVLJKvHLN
         g7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761871; x=1789366671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWobaaywacMu/vGUnRLBYXlkY7KOyfbApyOliISYw4w=;
        b=rbZ/jn4XgE4I2rurxYbMQ/BPoqErmRuDwD8wWY995QUn6moZtnFVvv6Gu3cquohgXD
         9w6JZwc9Y4Vf739JDyGaq97wmw9CsFw5BOfHiqUGMy/cefSqJJMwB+tmViOaWPVtPqZb
         C23O7YCGr31dBHP/a617sH8x4jRfTudrWDOHmYV+BZn3nhyRpByLpaPpCEJLK9n4u5U8
         K0EKMiqq5PjzQmmEYqOsS5uXGiN36F4tUFT1wvqQ2fC3474t0yGa7cLfsRPKlPJOTZaH
         QiKDzapcXHppzLmM+9xalLsF9dIuZZ0KnruUgkP/1QKriaAws5LRIKatSaKHiaWKNCBT
         gO8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0W+b80Vp8/RgkASz3+iLWsoL526Tq9P7vDVv47zXpcTYKuHqJjAfEBhx2kIWuWolfxE6yC4zp44SGflc=@vger.kernel.org
X-Gm-Message-State: AFuF++kFJP/mDuCGf2yCUtbvkttcLtZYk//ICSEEiMBUxHkQCAxP+6Da
	23taNuhYzTc5ggqKnGNA9YXS6zWLsPPkW3uhwWG83KB+HE65wYV1t5W0
X-Gm-Gg: AYBFou2w2ZTR8bxS6WuHAhlx9d5Slz5h0+5cwLNnOKh2Qva/r/wTyZWHM4NMvnUDN2f
	jhVhbry3BH7PrbqvihUUGYGlOo3c2yVgrxZTDxPbpde5Wq9KlTFWoY1ooNdvRAA+IXPyiY4r2ec
	zxR4t4lLE1nvIPsLwmzIWrCMQb6tfK13EdeOcwhDaEqKmjb4EjNA34a6MegZNEJiVpCl0DJoChK
	E/UCTQlJlJ3qujCGiMnNilIxI2Jt5ULouni2u+IG5ehGCoSSzfLc1x9UqY0GymIquAVuBEuf+o+
	R62dF1rCu4WJSRO4xWPrCJEj42jj8NLjduky1kT5K9Vr3buFUc8VuaexscFLke9qwmJA4n5Ucez
	SwjXDIPZ+QWhFqAmfXE7Bz/U50liVgQjkCzTQRtzCb55RZZuyM0c5LiJGaLtvrqginmEJP39C6D
	1uBhEy/z6l+pSyDn9NcrS+OxS06zyVa161iyTLxfQT0Gps6oNoy0F7MNP592cchfG9N/0O2N7OP
	DyJugY8MxhHSks=
X-Received: by 2002:a05:6a21:115:b0:3d1:be60:2811 with SMTP id adf61e73a8af0-3da3a1204e8mr31320928637.15.1788761871530;
        Sun, 06 Sep 2026 23:17:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24275961eec.22.2026.09.06.23.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:17:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 11:47:42 +0530
Message-ID: <20260907061742.10954-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907061742.10954-1-hemanth.selam@gmail.com>
References: <20260907061742.10954-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..6b42da3b6c5e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -42,7 +42,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(geni_se_regs);
  *
  * GENI based QUP is a highly-flexible and programmable module for supporting
  * a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. A single
- * QUP module can provide upto 8 serial interfaces, using its internal
+ * QUP module can provide up to 8 serial interfaces, using its internal
  * serial engines. The actual configuration is determined by the target
  * platform configuration. The protocol supported by each interface is
  * determined by the firmware loaded to the serial engine. Each SE consists
-- 
2.48.1


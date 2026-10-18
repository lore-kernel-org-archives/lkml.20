Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A33A5443
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792344468; cv=none; b=GxinW1v3YlSRCExCVP2umE5t01cN8e2PuRyvPwa1ZGMoEI1TPP20qqZHDHjUYp5HgwzQ5Z79kWJ6YoTerjow0JffGVm35fJl6v7UB5H+xKMTlcVzK1B3DmYBlhOrn0FWmNh7jiwjNF9GRvuOcYcFCWwDr3RjYCsY8P+MS71B/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792344468; c=relaxed/simple;
	bh=rkp+TJ9i5bbiS7zbelTL69SgmxfZjEfWqntjkizog4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxIZAE7TpbzzZerP8rEfyWy/lwqI/4x1NtUrtXCAKS91fRfRNtrE6E60UQKqO/n/tSsvlgD2c3NWa+vPUfj3Dbrg8RYb/kDeTXNyUJ1nLcpMIW5U+E7qn6ckHurxiakRVsLba8RM745FOeMHPI3+YjhJ7lRkbrzogmSneS2pyjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1lltT2y; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1lltT2y"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35943f55c06so2040411eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792344464; x=1792949264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8BhmEAwrAS5v1BhAMr5BoqzbHilf+inH/YH2jYRtiI=;
        b=N1lltT2yUmqSJ3i7vMtTLzBw2Dw1HiiwtN4YXynzJ1uOrVxSOH/3bi10VI84lX+e9X
         NpK/CiaYI8u3ZGaYukQlBkdWODeI0bTgGrqgC5IaMZh9dVP0c19mvHJ/SnBFpjiFc1G2
         gAyuEOVUni3r5Qtxu+eaMgyu3f/cTflDtchoe6+KfVK2uvgkrlZ8T6aChtf2AP7Voosw
         Ad0nVOVcpe2oE+ECNoO/gy02Zp1Sbeu7FxJRbOnOlmPRRxntw2d/qSZtfXDn5Go5OPjl
         MthNXQlQ+xwpTBlEIzJZ/xrnPQTlvGp9D8cRU6WaMLkui8jQLmsC6Gj8W4TOs8GuO70t
         AYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344464; x=1792949264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8BhmEAwrAS5v1BhAMr5BoqzbHilf+inH/YH2jYRtiI=;
        b=nli80W8Ey0h1zw960crCtWG3vwwlOFE2/eKG2yGw5Qaxz9oe9IIWdm8PwAiBnS2Dsi
         FjMaqBnFWhndOGn7/n/Q0iqzs8mMnlJPp/zW+WwZ7Ont0L3Cr1xYMvbjCeP6XSJ/iJ+1
         oqCBSDig2sGg7CpH1jrAQWxhukuISL8ZokxWTMZIi4oiZB72hX+q53gHSk2wkEIOS+Kc
         FOwmt9OqGuFpvNBS3ShBcOmDuZBlHlu/O4umLca1rSmDr4+Iy8iOT9nZe8xh3EtoUJUm
         xt3uHkA36tGeCl9DF4VavZoiXQ9dxuoaJ3nW20lta0SYtvrnZ7xjRftNmLsL9Ij2IOYi
         lgbA==
X-Forwarded-Encrypted: i=1; AKwUvBxfuwS+U8qQa8La18eNdNJBVCaZUdQrx9e9pZNWof7Ll5glWFEyPJAwstOE6Q7HG8E/sb052cvvHo3TI9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjhCgXmV3lF7zitiigtefbDlTMhyFyi0YfYMOy+L6i9K2R+n+V
	74ZwfOiAffMbFUBJ41xYzdajkXiPApKqLPdPsTqL6OKAanwY3FsJGLJR
X-Gm-Gg: AYBFou1CVGSku/kmg6gykIWDQvicgBbh0CDcDw5Krf7w1ugDg9qNOiuiBXXqSi4BGjP
	tLiAIYiCaaXkXxqCkcELeXm6TVGMIybOYU/FcYnFOzFCj/RStntbN5IV44LepoEdX9QXNHicj/S
	POVyu+KCRFTgoKzLiSNQNW71KymwBDTuWr2WSKDRyFmY21j4kd4wX6tTqpUGlKfPLN0901vSe/Y
	Zq7fwsyZ7baRzuP3PTUAg7GkYMU6HXiHYLMeqwvAyErfN6weuntjbUL3+VX4JlEQoqmhzUvFQDo
	aFnGOZqqhcyskRDk8MZRk5PSP3xzxqMJ2xRxXp9/NfnKFSXhP/B9Rk240CgCJQKs7xMr3LYxg4x
	OtefbZqTWj+wKULQW2BRw0r87OQ+4bQy+ClnJGrsh5s6jl2Pcjg7pOXs7oaWV+ko94OKZkW3Aea
	sFr4mj/ErMGNFAbt8EW/5FxN6qasYbEOoQj2DN335ZnncVY3pOYmYLd7DLcImw/CDWVd2XzHGSs
	kpSjLTND12OB1o=
X-Received: by 2002:a05:7301:5406:b0:355:29c0:9cac with SMTP id 5a478bee46e88-3602dcda842mr11919489eec.10.1792344464092;
        Sun, 18 Oct 2026 10:27:44 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f0:11a:4ca8:f773:d2e6:c98e:8b27])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm42654054eec.28.2026.10.18.10.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:27:43 -0700 (PDT)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: fix loopback Kconfig help text
Date: Sun, 18 Oct 2026 22:57:11 +0530
Message-ID: <20261018172711.8013-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GREYBUS_LOOPBACK help text incorrectly describes the Debug Log
Class and names gb-log.ko as the module. Correct the description to
refer to the Loopback Class and name gb-loopback.ko, matching the
driver and Makefile.

Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
 drivers/staging/greybus/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index e1d7ffdf4a6f..3ff47550081d 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -75,10 +75,10 @@ config GREYBUS_LOOPBACK
 	tristate "Greybus Loopback Class driver"
 	help
 	  Select this option if you have a device that follows the
-	  Greybus Debug Log Class specification.
+	  Greybus Loopback Class specification.
 
 	  To compile this code as a module, chose M here: the module
-	  will be called gb-log.ko
+	  will be called gb-loopback.ko
 
 config GREYBUS_POWER
 	tristate "Greybus Powersupply Class driver"
-- 
2.47.3


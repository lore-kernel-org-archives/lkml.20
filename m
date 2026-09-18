Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D04B4864
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748374; cv=none; b=ECcM7K4A7q6q6Z750AUPPzGR5rR8RPhGMbQ0ikkZdzyMDrLc5O5lGz2Ybi9qXiKn4Z1aWv7YebpSfQ5eXoxHDa3LjLNgDhWrW9COm2qCNJmk6Yiidhr1amJWktgD8TkXfoaDQU/Al2jhRh2jxH2mnUNHifVSdCH7jZd4WBBzleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748374; c=relaxed/simple;
	bh=eHoxMD49RuFV3Eb4It0nXTbB/TWFeAo0DHVY9dkLnxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rEVkPB0SjHrnnBq8re9AhqDXLd2ps9YM2T7QO9Mk3mhaQ4Zv/3PBNbjKpWXPt1NncRyKiKM6OeB3rQCX7YtmzEiycgBMCS6X8IosMP36ckqM1dxwKWMKuPxo6NNZxhyjwxekHti1arCMRdckzZGRVsPJdgHOdauXtz3SAmJsQBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAdh59eA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAdh59eA"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso694337a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748372; x=1790353172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrqHy/Ltwsv9DxVnw14hRzfEI6+yxaAfvyb1bklLGNA=;
        b=QAdh59eAUjRsBuLu4EfBRJXnNgwc84tmmWvA11qA71PNIE0RZdY8fmxJbnc6QPR7Tj
         wvamDcp0QUCjXiQ3Em3Lfg11DrOO8gBBMCh1EhWeI4n5NgR+lOdAxTUhC0xuAv9mFBYN
         ZGVFHUP3Ra2+FuSDA5MqYCl96BmSbPxACu6WhdSwpRIJsdItsPjvEBbEVcFmD9s5lvDl
         1F+LWPLrQB/Z/OepdC8K/yZ+y/wj2Qhj9kuK36OK/YigwJkbTMbTaFOwKszsVCkYR+6L
         YumN14HqUT0XYhter0x0z3iZHtgBvLAZeF4ShaNS//rHh6yBsnTzHrUu/PAg12jHOOW2
         wMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748372; x=1790353172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrqHy/Ltwsv9DxVnw14hRzfEI6+yxaAfvyb1bklLGNA=;
        b=gNqayWPw+l3rMWoauh4qLAvYi2TREnBswhARsxKnnMId7IYugqQttFnYiO4+xZjEjz
         eDVzA5mVqXsF9KnmhHAOBsyoGpZscTaDq76ubcfBg/Gy7r1q6g/fFrJCLp9IAaL7aoW7
         is7XzyvHonbJhYvwj85iaxIrYIzwonzI1qD2MzMoWxcxghfVLwSi7SPmWmqLSvMJcTw0
         V3XEj1fBqxMiQlD1qFvN1OY6AUiq2r33PD8mNysBGfE3qGDEzoInxkdsSWds7ZmnYxMF
         JRPd8IreXzXM6g4YXlei7I7LAE7VIBCnLt2x9okSkbH25X5brv5lEDT1sPHEiKck7i+v
         lOpA==
X-Forwarded-Encrypted: i=1; AKwUvBwlQBSRK3vZxg9g7bXyoi1MacIDg+Gc3QZMTFuzo+hKo8XYJ90hUaZts8PjdjGz0P0nPOu1EpiOiICA5mY=@vger.kernel.org
X-Gm-Message-State: AFuF++kC19PleC+FpxkWCkdWz28TbRI0GWq5PNRyC2yQZK/cwwPXth05
	nDVu7vOrF8SNJPw1t/3pDG3BhOzEEZ6rHQ9+ErmJoE0eaceMzsfpWs9N
X-Gm-Gg: AYBFou3Y6xtFSYz4OlJ4s4Lrl+Nox83Zp1t6px9VHt8716qVYFPXWBJAcPq0bZqUIkX
	T+UHdJwfXltiD5Mujv4KV/EnZOootUJxls4pmRllvEEzcC7K7HazfvXPmIAG6uDCmrI8LlgPG7B
	pUOuh4pyJUm/Q3VDDQRzJCosxJc0JWjPVfmA6bZUeuqFNQou7FL3LRqczvKnS+tDKmf2LVjTUG0
	5ORnVZkVG/MT9O9qESw8Q/iiLGIYEs+tFU9fNdovBQMUNfYO+NPprGVTbMexgOyxRQ0gA0B/VKs
	9eJBbRzqYF+W5Y53oU3YY9zSfkiQwtbNhMjbGN6mqEB4UQWj/vuN9M+CO/Wqtw0rWn1bMVvY6jt
	Q26X/Xp3bWU7/SKIkHtg9+3NoH/zcZXXmGdraDAwnwClvbvgQpEZPJA6/uefNTfhA+MPe8gWy18
	+d8hJUkePLj1hQ9sF1r+XatQ6+CNM+dP6YpPd2WQwT5Z2/z6Awqu2+rqGQx0S6KFXEpJ3jTytBL
	PDE4248ldgF1eDH
X-Received: by 2002:a17:90b:5403:b0:39e:6a7f:eeed with SMTP id 98e67ed59e1d1-39e6a7ff0b0mr1221280a91.18.1789748372302;
        Fri, 18 Sep 2026 09:19:32 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce046d96sm4934242c88.11.2026.09.18.09.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:19:31 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ma35d1: fix unchecked IRQ error and IRQ-before-rtcdev ordering
Date: Fri, 18 Sep 2026 23:19:25 +0700
Message-Id: <20260918161925.2639130-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq()'s return goes straight into rtc->irq_num and then
devm_request_irq()'s unsigned int irq parameter with no check --
passing a negative error (like -EPROBE_DEFER) through that conversion
turns it into a large positive number, so devm_request_irq() just
fails with -EINVAL instead of deferring the probe.

Separately, the IRQ is requested before rtc->rtcdev is allocated and
registered. Since devm teardown is LIFO, unbind or a later probe
failure frees rtcdev before the IRQ, so an alarm firing in that window
has ma35d1_rtc_interrupt() call rtc_update_irq() on freed memory.

Check irq_num for a negative return, and move the IRQ request to
after the RTC device is fully registered.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914133532.CBFAA1F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-ma35d1.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index cfcfc28060f6..76d59b313721 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -236,11 +236,8 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	}
 
 	rtc->irq_num = platform_get_irq(pdev, 0);
-
-	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
-			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+	if (rtc->irq_num < 0)
+		return dev_err_probe(&pdev->dev, rtc->irq_num, "failed to get rtc irq\n");
 
 	platform_set_drvdata(pdev, rtc);
 
@@ -258,6 +255,11 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc device\n");
 
+	ret = devm_request_irq(&pdev->dev, rtc->irq_num, ma35d1_rtc_interrupt,
+			       IRQF_NO_SUSPEND, "ma35d1rtc", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request rtc irq\n");
+
 	return 0;
 }
 
-- 
2.25.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676644;
	b=XnY76uGxPmmf15h4yFZkuVdYOUPTmlPtbxGjLznEGhwrQ5Ns2UVZTG+7f0r0QV/zS9TZ
	 hVR+WeaeuyOlm9MALf8nMKOyu4KFdlJ8ZW3UcIJhQOvr0c57KOzvAGRfnSyvpyFPoR/au
	 eqe4iN4j60rbmI/UZP46C70LZJ1RinRObsv94zzNrv1vOJCxTB40SN2piJzZJ+lRNf2cB
	 JfVhzzr0gAEnJypgw9Oi/uVkdCGnequEOSqjCvFtN/yubRytvcdgR/bDkQftTbmix9uDd
	 4ueCQgOdgf1w9kdX0As4nl0PQ1NDJMz0lrrJ3fXJYMUbXtlNwPbn/VyoNterxmHTxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G6DVWsB7UpRsSNvVhd1CX1moWgheSuxjt5mwvETtonw=;
	b=JcP0E/Bl6cO3qS0JVyqv/HuIN0+s0fTaDbZ3azkIAfMhKJ61+KB46He0aZOnPAe7UGL1
	 crevYCyZenGBIdNSKkXjBcMkaXBOEAukOUrs5lmMT4lBT6TmvG+FsqGsWCNH000N2DAmx
	 V2AOcs2KBKGM7mLu9E3SSaMvizd1LeV1wXBbk04z084crsYh5YKXrHJKkNiqu3mna2lvH
	 megnVzcY7wY2nijgNp8ap0wJzHELvHAj6XkcgEWKknw4lFbAQA27XCVxNkHi8cddRUatd
	 x/vnlxUHyJm3w6YbOqeZSSgUPlRODe6kQz8sDhAUNd7LlGVolEhYQLbm5owX6964tbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="pzYi/UGa";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A460A4AD0
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05A460A4AD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pzYi/UGa
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1572947f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792676642; x=1793281442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6DVWsB7UpRsSNvVhd1CX1moWgheSuxjt5mwvETtonw=;
        b=pzYi/UGaU8T3kKbukd+jWGrSWWjGfCOP2nhjP6Ad1f3R0l+51g23VnNR9NOq0hSX0f
         Az1WKU3fPfU++kDT6YcKtnz12fnKOT7eGL0akRy3qUqmshwoMsim4rJkuj9UfqNRd/rs
         DQxKZrS4Vw3otgpYNi2GWYuThVkdbhDJS1brSSU3mycuZr/1zhIZXH4jqxz0Pcc/toNM
         q9gBhTn2/5J4aJ7NjyHjNwk8TKmMquegOYqfucj+D6RDvWCx5Hp/bEU/n6L2OwKibCwo
         p7M5qlk2bAkaETi+pK8NbMwujMg9gw0lhBOrjornxtX1LFpXU8s64u+FuG5DRf1dsGIe
         AejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676642; x=1793281442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6DVWsB7UpRsSNvVhd1CX1moWgheSuxjt5mwvETtonw=;
        b=qunSfqRb7uvZ71VWwc3ahGERgRSO6LUcj/8NE9rEcHWAkeoeWP9ZXBxQX1DeKuzwQ2
         ef1B5RKHDH6/qxxuznUNAvgdTtWQBGltFATrEmsC4MGAfQFFzIguBigu4IUMjvXwQIGw
         HNU1uBkDTZh+JLynQIZplfuAHh/JG+JWHQOLxcu8nuA0NGhBDb8VzYG6f5OerWry4Wnq
         Xjre6lgavS1kK90vMGiQFRye/wIjPRsjtNdNGBsOOaiGuQigUjVaVirFvLmS4aPPF7uS
         Puk7HaXOGWwJvr9RBwSZ1e5hksYDomyoeWBPahDOIMRthn0N4gL5+bzstdstTtj3J/wu
         3jJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl64fZtbwcADuA8v5fY19E3o385SRMGcKsH8EFh3mT1BkcBv9UN0JrghWP20l9gqzilaq6ElBJ5uWlpe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFLthvpiCx+PRg1gVkfD9SaUrV+TFRatUer3jEYW70U/BT14Gk
	8+o8E2BrrzxyOpzswEaZy1uSdyZVzZevUhq4hU6dLL9TTlOXiu4HaR5/
X-Gm-Gg: AYBFou0/KYtchlGSahO12qLb/AJYzh3yYk1MX6T6pdQ7tKrlHAX16ZNS2EGNKGiJlbQ
	BxY/5um+5mV64rQJ4m/fljiAnj4oZ/CoJ5L7PFYYhY4iPax+u52kJF2mEJBaCkALDh0sqrfARiu
	wz0OmT5/zETh5Rz/+RRHFOWera61OWp+SBPA/Rc8GV5PXFXIGXB8aB0GGhYN0DZqiOiope2GlcY
	wfTCGmWP/8SjTnfzMCdXz4IZ5Pekw8qhofBrtovetiEr4j/+kvRBOyVE9xe9xq2gW6qepJVYTqj
	X9iBF3Wpzuqg9tSd8b4zyuXNbHJw98hveAJZZvzrOzATztB0jZM7dtzlRYmWBsqYwxc4jNyQNfm
	GJowyEWVKkn6rjM19HQ0kZt6bi7loAMKZlZTtNIP3iOAYBid9f/0V4c3UXOD5Cv8I3fl+Nz9Iz6
	lyeFYLuU2P83H2rThbb0J6tohtU7yjs2Awwxn0l04gr6Hy6QvnQMfiCYGpN6mQobhEjC4EJlZxO
	KVr9/0QNy0QKuGKx7cI9JU9GnFFPvqJtbqEKkKlOAJ6DQsLhY65pwxp1w==
X-Received: by 2002:a05:6000:2305:b0:48b:2a1:dfe3 with SMTP id ffacd0b85a97d-48e264cd91amr12401762f8f.41.1792676642201;
        Thu, 22 Oct 2026 06:44:02 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm13621390f8f.40.2026.10.22.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:44:01 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] watchdog: dw_wdt: manage reset line during system suspend/resume
Date: Thu, 22 Oct 2026 16:43:50 +0300
Message-ID: <20261022134354.534642-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022134354.534642-1-a.shimko.dev@gmail.com>
References: <y>
 <20261022134354.534642-1-a.shimko.dev@gmail.com>
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

The watchdog controller reset line is not currently managed during system
suspend/resume. This can lead to an inconsistent hardware state when
resuming from suspend, as the controller may not be properly reinitialized.

Assert the reset line before disabling clocks during suspend to ensure
the controller is held in reset while power is gated. During resume,
deassert the reset after clocks are enabled and before restoring register
state to guarantee the controller is properly initialized. Add proper
error handling for reset control operations during resume with appropriate
cleanup path on failure.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 2cffe337b4ea..ec6a09673da4 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -382,6 +382,8 @@ static int dw_wdt_suspend(struct device *dev)
 	dw_wdt->control = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
 	dw_wdt->timeout = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 
+	reset_control_assert(dw_wdt->rst);
+
 	clk_disable_unprepare(dw_wdt->pclk);
 	clk_disable_unprepare(dw_wdt->clk);
 
@@ -402,12 +404,22 @@ static int dw_wdt_resume(struct device *dev)
 		return err;
 	}
 
+	err = reset_control_deassert(dw_wdt->rst);
+	if (err)
+		goto unprepare_pclk;
+
 	writel(dw_wdt->timeout, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 	writel(dw_wdt->control, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
 
 	dw_wdt_ping(&dw_wdt->wdd);
 
 	return 0;
+
+unprepare_pclk:
+	clk_disable_unprepare(dw_wdt->pclk);
+	clk_disable_unprepare(dw_wdt->clk);
+
+	return err;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(dw_wdt_pm_ops, dw_wdt_suspend, dw_wdt_resume);
-- 
2.43.0


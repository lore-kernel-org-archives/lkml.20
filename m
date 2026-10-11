Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBA33374F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748612; cv=none; b=Hldrvxip1+ckEwKtkVPV2UE6u34dKFkhaYxacVZ5eJQ+0lpXEmQQkkzQIkgbsSyO/zBH7PtztVo8OZkQAI3ST2712ygtj57ye/PjY0tI48MP6LCRg0kqYmGAVghedX8xQ5rNWBWWS4MUHsUPeoeusHcjl7TcPqm4nuGh5bUfouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748612; c=relaxed/simple;
	bh=epmQuNnUwuWrARF6TFO83/KSZ5JczeyOambMq4x8/Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e5s5zw3CrYxwS/2FIwAcZEwlo73k0yGIRcP1HY8HEdfd7s//ilK2bXljUYAnqgA+z9TSLvXk5LzFp1bsd59yL68uR/ec8lhP4W1UeXCseNloXgGSOiTuw/5Q63y87sL5etQs1ioNHWyTmbhpu+dwOBrTKKRM8RglgWxzU9APnoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P//eD9Me; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P//eD9Me"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91054f537ccso16779056d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748610; x=1792353410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=P//eD9Meh3ty9Is3pKnToxFWm/iKMBeWxKZ+l42qbdqTIDlN3/D27rVHaOwAzRSsP2
         jncL7ekJOnEnN8F089stkcbIC1xCf6cIKUiLLvmHO/yPpw5C1NyWFrgFgc+6qhLK7FDs
         7fiujLTQICiN0lTsY/VVakWfp17SY0gUaolUMNi+kYYDyYlB9VwZWObA/ZjiCGn6+vuG
         SA0+WFkDhHPIcFt9cCxJ0Qxm4Z0kODwkidaYRsDNscYJOLQLPaQQEx19XXFXacz6xcew
         /xHJml0nqdHteecqC/uu5U4cgQp/yttjELV46eeurQIOHSyqwFm5R5w4svhJXSLOwOf4
         l6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748610; x=1792353410;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=IcMYITz6w7BmuBnfuFK6/VGKDaw3PTQzOkWeJ4eDy9M1UEaBK6BRgIK0xlIqwYD7NR
         gQft/mJbl7a9A9PGmEdolI6xEGsBRxEK/iF1vaIs+r7qx7Nv+SSuTqz/ryBpFr/knhfZ
         yR1eXJT/a7ezhYOMfBeS8HfQHsR3q9Quy8jCbcXqIcStjj02zGDkvLNkGlqPw4klXaDS
         TFHYxVvFi4RxoSehim7Rx5xc2MC9CWV3uiByf4BYxhGfglKcCI5XxMQ8aXl9JKlwbgg0
         r8VtA6r5WrTdXIxiAERT/1iQhqDdJGi4dNvUuWrpJ8TEpIx8GFEEp4PyX5yx3kmcDeRL
         Ulbw==
X-Forwarded-Encrypted: i=1; AKwUvBxDNttM8212fk+/Ns9xqFHZwVYKJtHXfjWhoIqCMnuANWfviejPMeTS7bvf7TvMwRUvwCOArxZ9aUYFXRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQExqTdWOzi5IKXbi94Xym/Vqd7ex7hjHC0MqS9wp4fDz0RIwq
	vW+42FEhBCbr+lF8VRx/vaDttBh5BOwX/dQXbJLrIIcFlT/cmXr09LA=
X-Gm-Gg: AYBFou2z22iwQBzUWqZ/twNnSKHmH4jQfnrRgK6SUClUwImKAYt8lqINLmj41sdKhvB
	g592CLo6+eoPZ3h+UTgN99tJMDpenIHDvC/R4nzUYWHag67aYMSqnPMYrOPJh+dd49LHMSrpS2D
	Y/QuAJVTGhgnL1eorUHcjc4W2NqO3t+6RzK3Okl9m3njqXmzkU5d0EXHyexGmZjBt+zMPXpZwqB
	1GGImqG0UkfLE7tlf0H62MrtCrTd3I89ECe8qIdOGRwl277k4Z1UOODs7H21LljkFcCcxt1r35V
	jEiv8T1THEZfY6HsLLBWALUSdg1xXLTJyBS2xsHWEBPxyQJmjSB6yNR5DZwZemxfqDnEl5KXNJc
	Fea4Hc8mvZPi12sVucVvLC2zrqg5HeSF5EB1t3/r6quL791hZNGEfHs5r8Zf7JlS07n/KFq4FQM
	jWIaHuJBu6rLMnZqT3vBqUmvXj4oIZiuujPjtJO6lZ/+pyDbbNKZ+xpGbIuWUvFV3AWLsmF0t5s
	gTkm6aQHxkcPEEZ38EHrndsZaVWqj8bIZKRfEGlPTtKsXacompAogvt8ThtR4tKr1vRJXc9h6Ri
	xwg0i7zHT7zllYPoS4dARfw81ZKdizMq3GZoWKo=
X-Received: by 2002:a05:6214:498e:b0:91b:5d3b:4acc with SMTP id 6a1803df08f44-91b5d3b4e26mr149047996d6.53.1791748610213;
        Sun, 11 Oct 2026 12:56:50 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550dfb6csm77651326d6.45.2026.10.11.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:56:49 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: aspeed: disable resolution work before removing the device
Date: Sun, 11 Oct 2026 15:56:45 -0400
Message-ID: <179174852932.3.2170255507797724902.G64@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A resolution-change interrupt schedules res_work. The worker enables the
video engine clocks, initializes registers and detects the resolution.
It can also queue a V4L2 event or restart frame capture. The remove path
shuts down the engine and releases resources without cancelling or
waiting for this work, so the worker can undo the shutdown or access
resources after they have been released.

Disable and drain res_work before turning the engine off. This cancels
pending work, waits for a running worker and prevents the IRQ handler
from queuing the work again. Keep the clocks and IRQ handler available
during the wait because resolution detection can wait for an IRQ.

This issue was found by static analysis.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm64). No runtime testing.

 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275..4274b90 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2360,6 +2360,7 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct aspeed_video *video = to_aspeed_video(v4l2_dev);
 
+	disable_delayed_work_sync(&video->res_work);
 	aspeed_video_off(video);
 
 	aspeed_video_debugfs_remove(video);

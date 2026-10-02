Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140B3425860
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925699; cv=none; b=otGfGq39F+C5+6Cl+MPgD7vPvWbx21N346Op0SLFwApNGLLx+b7B6gz+l2lvFLRc7mhG1X5XxwaXPwt64avX/4a1r2zwQI2LryrG8KarMTQYW7Ylo07WGjMJfl1qT5ZmQKThdXI13HEgdZpStP8+U4G9SFe4OIBesm6FK3dHHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925699; c=relaxed/simple;
	bh=uyUil9Xio243Cn8v4Xig1YpagM1eh9gFGNKHzymVIlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFtSBiaz0moZb6kkwdvwMHCaiLYpAmO9eaEQyT2JMoT2FTNw6x3K2ejNNw+TiFdyaarupkn7f6axzA/rU0h5bZ+9sTWIGbW0GM475KEKQLekijpzL1GKBZFuMzVymr/t3QLF/TzT3X8zwCsytBpBvdxGZQG8BO2R1Fpfy6PirBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnMgJJcw; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnMgJJcw"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-48b0622cc90so1096953f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925696; x=1791530496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=;
        b=lnMgJJcwSjVtVhXvV0deTqRQGa5i1U0kOS2b7n5fZI/35CfiqoOM89huhIAyARL7B5
         L3XvWHmPg0TNrf+s0Koar8Vj+JSBysuYlNoYQFAglWpaDreSUxhBmsuwX5riklO0TzyQ
         1PQSrJwb2ZnumafS89BYrTAsAUPA6zDo4jMo6of5SlGYEMegISXlJraEDvZZHk45oAT7
         q6orceRHnlyF54/TBJsrJGl3lDxWboQm2zp2GyjT1tfrNYjuXHN78jKJtpLyxEZ7ZyTz
         pYVCsku66D7U0l3FMQdl/MGEn2Gj07GikfP+yg/d/vMX9R1+CWoNXVNuk0LKFJ6+Ki5a
         QtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925696; x=1791530496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=;
        b=Gds2u3RV8a3Ka9esMdzqjOBRDCDEkPx77RnHQxbt1dw6t09uI1kp5KqrEyQIVnpe30
         qo79u/GoF/C2GnG9luOyFMj8jbnjTZQxGOr/TjMb5S0eSebAK1FfHMzxDeWkCjiTeHrt
         cVbe3ls6eFkLC3HoePrWQSE0EQHXJikif3myQNeUG/ce8BWtts4B1hRcew1L2MiCrs4N
         ivPsj2NS5oHrwJ+g5eZ25SGisHq5ydVzouWew77RCEh/OvQFhL1keiuDXn5UC+4PTDgM
         wNT1rB7BU5SExj/tRNpxsG5X1HVXFcSkeZud/zo8t1X0OtICkeW36eUFXoZeRCWAfe3s
         tjnA==
X-Forwarded-Encrypted: i=1; AKwUvBwEk42fVEkHjQkTTfjMHS5k7Etf+S2qr9zkCVwMfqwuMIoM6hUuCMe4w4HeJhGuTF4aZemenb0ok6STHdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdIsAg4JvRaHsEL5qmp0VAFvyyguySTcVjPdSTmIUZSMgx5eF+
	Hs4dXHVfphqczT/w9wtMfI9z/ZwYWCKt8VRu7pAhUqXgo1/FDaxVtGBB
X-Gm-Gg: AYBFou3NarGc0M8evrmLXMAWzdVzTLBhTHBM2hg2pc5ui8jJRDAL4a0A/+E+B8Trhwg
	dFc728yH+b6qdAYcvOgceG+ejO3z3vHaUN7DLySOP5CXNBrIiwiLfuUwkh4q4qJfhaRYsZCM8pO
	yqp/xsqADiFdB8IUacy3IsAv5rdS+JIq4bNuisW1be2uEUH02TPz9bOkWA/XEEYvNiQrwspm2qc
	l5X1gzhrwRnrhMYwIQH0dkeYcBNBEqnJeFD0sCegHe3yIWohZIFqfI+jbTcA4/tmUnfk06yFSlM
	R3qEMXytLmUtrbEZ7VPPzgJtwUu7TsEoYQHOiizo7NIIlevISHrbbtaS9nU3Pexi0I2g/QTNDmX
	M5dQ+N9rhQRBSPkjwmHZdrAvnUkXTvDOlzc+dAFH5tyB7Q4hdqUiey5PWj60A/53EYLE8u7qJG0
	iuy2odnRWZHkEd2PkzH/WnWEQc3JmUbBU3yQ+xRycbNSJJjDpI70QR5ad5k0gQJE6niA==
X-Received: by 2002:a5d:6f04:0:b0:48b:11ba:1281 with SMTP id ffacd0b85a97d-48b127517b4mr2978023f8f.53.1790925696282;
        Fri, 02 Oct 2026 00:21:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:35 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] clocksource/drivers/timer-mediatek: Fix random crash at boot
Date: Fri,  2 Oct 2026 09:19:26 +0200
Message-ID: <20261002072115.169250-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek bootloaders generally enable APXGPT timers at boot. This means
that a timer IRQ can sometimes happen between the IRQ line request and the
configuration of the clock event handler. This leads to a hard crash with
an instruction abort, branch to pc 0x0 in mtk_gpt_interrupt handler as
clkevt is null.

To avoid this issue request the IRQ with IRQF_NO_AUTOEN and enable it
explicitly after the clock event is configured.

Issue was reported and fix tested on the Lenovo Tab E7 (TB-7104F, mt8167).

Fixes: a0858f937960 ("clocksource/drivers/timer-mediatek: Convert the driver to timer-of")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Credits for issue discovery and suggested fix go to          
matemiller992 on postmarketOS forums. I am submitting it upstream with     
permission. Not adding Reported-by or Suggested-by tags because it was     
requested not to share real name.    

 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..e20075b09fab 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -277,7 +277,7 @@ static struct timer_of to = {
 	},
 
 	.of_irq = {
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		.flags = IRQF_TIMER | IRQF_IRQPOLL | IRQF_NO_AUTOEN,
 	},
 };
 
@@ -298,6 +298,7 @@ static int __init mtk_syst_init(struct device_node *node)
 
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
+	enable_irq(timer_of_irq(&to));
 
 	return 0;
 }
@@ -334,6 +335,7 @@ static int __init mtk_gpt_init(struct device_node *node)
 					TIMER_SYNC_TICKS, 0xffffffff);
 
 	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
+	enable_irq(timer_of_irq(&to));
 
 	return 0;
 }
-- 
2.43.0


Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523FE415F38
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360786; cv=none; b=CnCCRn4exef3I9yOruRHKhcc0M6He6QNjPouAkGHBY7Ebt77aNdYSf4i3GTwyPQbDqpNGkMqzsblqPihDNjE5GFPFwf1igf22I9FrI4h3apdmsof84tE6Z89+0exmO0hpiOaVHFyCnpIE7jTVzg+KqLorPhieDh698+yPjnbb0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360786; c=relaxed/simple;
	bh=eoOfcs7iKCARmseiy7nRaZ7KYstGHmG8meGNbPJ2p7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L8sWTQMRUs0kG9VK+UXE45gp+kQ4/TOP6fMfALPTUwwETf6UwEa01GX99aFxoIAq3/0yvDoqsyHB3Ll0UnRNnvMX2IAuztxJSfx/p1jpmZt6jJr25hoi5dkwwLChRk4+XE0mLqxw2dcA4euX890mWT40jz5e7EiQ4dfGaCkaLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2CoS5u0; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2CoS5u0"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so723437f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360783; x=1790965583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gui2YOtiGUxo4TaQB/j5MUueXu1HhGNIinesLgvrcgM=;
        b=U2CoS5u0bqrLoVuyPDClU8HCe0N211R842Tb1vTuT+bSYsgO//ukE9hZk5jo12LB1n
         N3lU5RmgbR/kzm9b0+lUseRTZvlPO6MjCMgQe5hOAW06DBy1u+uzMk9Fh0gkrX1BxhYt
         GqOQfd3fvG3L2Ek8eeuADDARVso+xywxm4caQngOOhZPwIRsxP2K9fQpGeTfZGdl5AKV
         fAYlANkiij0n37vEbUuv1mEJtm4Ju86XwnK/AVoetyPG5kFg8Xi5HYxQXsbMovB6Hi2U
         9kTR4w4Xff9GhyGKCdN8yJXQNC8HxMzIOd74WKmu98wPrUNoBGiGnv1rJps3lrQ/wVPn
         1uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360783; x=1790965583;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gui2YOtiGUxo4TaQB/j5MUueXu1HhGNIinesLgvrcgM=;
        b=H1/p2WNvy2MktmtBhrbc+vxnJv9X+NFuHpzegztLWRg5HjSRUxSFtMkl8kB2C8ZkxT
         7XU/Cdanww86OEUj3GDjaAPI4juyFj9XzFyNY9ti91DDhHklharOjnfFcOUTYJGSzpyE
         jhUQ2iE3DJQW0LjRwHWlGr3YGqSxNEEySX8gAqdoVv33NwqhHM/0UI5fQL7X+iPLhhFB
         Nac4gJe8SWmKWBpqww/eKnRmI4Buw7eDKsSlEIdDz/YVXSVtWaA+MWUm4Am8g9txwO9U
         WR9NgWJRu+niQHRV/jOSFlcqPEoHBzo9kIzj3LDFeFpazbUOqv21WFyZxZjrl1ZQG9Vz
         f0Pg==
X-Forwarded-Encrypted: i=1; AKwUvBxpnFj9q89ENWiCGapTg574VyodfO86wx7CtLxWix6YEZNfMSVhuYOSsmz2tMZ03euSkdz4p1CyR7O0+NM=@vger.kernel.org
X-Gm-Message-State: AFuF++kMhMhToZZl7SeXs2OOT+Kz1+eDWHTtU9MWkZlckKr95z1Xrp5G
	GPhOhahIJmo2QH+/Qh9nzd9JhslNpGJUEyFrEen5NaynVyFV7IobflA=
X-Gm-Gg: AYBFou2iRMiYjW8GoG7M8QcmgmAKqlRkX8pev7BV6R7uUFo9jBaQ+C5X3FbMjo1+eI5
	NYZ3NmrgmIJqIa84aO10l9yP0yaVzM8J0iyNAtxZsXqNlXEwKy0pz8Yl8UHGZ+CAq/KaoWQlHQX
	0mwPyurEvkH0c3eaLZha7bJj4tieWzHrP8lZ23qZfgJxxfHsOeTzWexZebNnxGPA3gkBIbtKg/D
	8FPKoDJ5FAMuHAty54NFo8bpZ3NFgX1YeyEC1VoxydM+NCHRTb/LEOQ6EcOJ1uxvYiLOBBVYnkK
	02emrjQa1eiF+VYLO992vO+9nROO9MtOt1lD9l6F7UgUtEz2riyzAv9X8jD/suuUV0zKJBpFCk5
	K0JldBNuGIhs+2sU7vw4bjBGg2g659m1p0gYZ1SoTACMVJuXgqZu5NMvaV+JvQ/edUInAjdox51
	0ttWX1uC8ijarOujYroDtGBdbNAuUZEJPNbc2rTOcEA4+LowkiD3Sqg83VSpjPlugBKoARrdacc
	YjLsvJsWlFkXs55wF/muSVI+pTBwotXazWUkNiyfiATflI/X5tffn/SkA==
X-Received: by 2002:a05:600c:19c7:b0:49f:e546:86e3 with SMTP id 5b1f17b1804b1-49fe670ee79mr116002205e9.35.1790360783250;
        Fri, 25 Sep 2026 11:26:23 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef605cc5sm75964905e9.4.2026.09.25.11.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:26:22 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] x86/hpet: Add safeguard check for zero channels during init
Date: Fri, 25 Sep 2026 21:25:01 +0300
Message-ID: <20260925182614.16261-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the event that the BIOS or firmware incorrectly provides a
channels value of 0, the current logic does not perform a
zero-check when CONFIG_HPET_EMULATE_RTC is disabled.

Consequently, kzalloc_objs(*hc, channels) receives a count of 0
and returns ZERO_SIZE_PTR (0x10). Since the pointer is not NULL,
the allocation check if (!hc) fails to catch the error.

Later in the initialization, the for (i = 0; i < channels; i++)
loop is skipped because channels is 0. However, if the condition
(id & HPET_ID_LEGSUP) is true, the code immediately attempts to
write to hpet_base.channels.mode.

Since hpet_base.channels points to ZERO_SIZE_PTR (0x10), this
dereference triggers a page fault and causes a kernel panic.

Furthermore, propagating ZERO_SIZE_PTR through hpet_base.channels
leaves a dangling invalid pointer in the global configuration,
creating potential Use-After-Free (UAF) or undefined behavior
during runtime or cleanup.

Fix this by introducing a safeguard check ensuring that the
channel count is at least 1 when RTC emulation is disabled,
preventing allocation of zero-length arrays.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 arch/x86/kernel/hpet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 154fe23a1..565127ca9 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -1033,9 +1033,9 @@ int __init hpet_enable(void)
 
 	/*
 	 * The legacy routing mode needs at least two channels, tick timer
-	 * and the rtc emulation channel.
+	 * and the rtc emulation channel. Also safeguard against zero channels.
 	 */
-	if (IS_ENABLED(CONFIG_HPET_EMULATE_RTC) && channels < 2)
+	if (channels < (IS_ENABLED(CONFIG_HPET_EMULATE_RTC) ? 2 : 1))
 		goto out_nohpet;
 
 	hc = kzalloc_objs(*hc, channels);
-- 
2.47.3


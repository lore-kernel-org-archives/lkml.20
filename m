Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415735F184
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167817; cv=none; b=hh6NCVjAcQoWuqsTVOGxS+tIZCLu4Ru5ulgfDoF0zURFoebubV94ygsQ0plYYguuqmE0/EiClzLqPIPzsLBU53YRvBrGBuXh4xBmX82PxPae1OUr2910D7wI3GkQgqQ457dks04+Hyv5XaGP0PHcaLgFRc5KFFwTwPmLhDTzMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167817; c=relaxed/simple;
	bh=2DcKrTh6Fa5xsizeNBedkFyjjEAWZcTil7Z8r+RgvAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZYTQdUBTH04pnxpi5BIPslX5CPjLor0nucS1IyV7jqKn7lwZBJ1g+aOGx0phHB+hwKcYoIJAysd4spPnc4Db1bacH/lGySOEIHq54Ow3fncHRKX5rEDPzpgF4ADu5Cd9ORaUcaDoUzadKIfOUz5WbgJmszCNE/3AwKbGJEVt/wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgCtPHsa; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgCtPHsa"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so141640f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167814; x=1789772614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R29YYAgyVJQX97ebL5rl2w0MZtUio8U35ZN1MB/U3Fs=;
        b=TgCtPHsaUHLA0FJtO1QBmiAcHLcKRoN5IRyuqMBwie7f6j/3tpy30LkBBPvsLew945
         ShitSxlfuFPJdlPzPB8bSylg2VHRL6iE0BfQ6/a3Copc7EeH8fG9cLNVcuvs1AJvuk1t
         rKBT3w1nW3J0YM9rIlwtei885nWZBb/wm9++xXkUgR4NS5pg5zUGW4OkAbLH6hkkcU5c
         Drfnq6klfom7cGTsAG9QnA7ejz6VoQup08O+LRBL55vTiC20dSegR7UUtr9ERNoNVD97
         +mcRBgj50Fgkx3mp2UCJNUQbDqDLtJKuY8qkCJmJdE3xNnLbauKfi1XpKLs9Bt7sUjA+
         lVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167814; x=1789772614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R29YYAgyVJQX97ebL5rl2w0MZtUio8U35ZN1MB/U3Fs=;
        b=TZwqfTWwoTjF/A7TxMkw9u3B8UqvuetgB01R/8ItgGSXDGBb8kO6Q+ECTlN4Ha0G/p
         0qstxPT+kozPVV6gJbOPoMB3xM/qa1AmnCXytz4iWFhvMIe3MuNErC86Dpscdta799l+
         wCwkQn9TfH1BcbZVgNlMBt3kz/ZosFDhhFC45EolNRzN8V2OBqgQnxIca0WiEv3R4aR+
         HoxnNIQeVcmI+JuelUK4XdRMEAPsVV8MBAX/VT1qFlVSfRgUl9bpNAHCBWSuSfMJZQvJ
         HCqPFD7+17CudRtW+CtzDDHkO/lDit0WNrRcGQRnOGlCPzQ5DTWLjuBQGbo4qaudPMpI
         osew==
X-Forwarded-Encrypted: i=1; AKwUvBx1tnxalg2ZCup/aay8/fLqOI0GcqRknr7JiEY1DO0MK0hl/joABBPptJB8+66wiqFx23Yzxvht4HhrAgc=@vger.kernel.org
X-Gm-Message-State: AFuF++kU54THZudDedp0s8tBtKe/fXQbCbiI4CPyFm8/1SZs3pnw/OAU
	XqjdsfaSwkA2hh6E1GMvkmt66sFdTeNl5JEIUx3rwqcn/oQdUdbxZcbZ
X-Gm-Gg: AYBFou1kM8mrCzphvXn6ndpCtZFK1LYiXXHilQebrMeg2qmsBECPzUPNN6nE6Oz4mcK
	Gpn7T9RszBhy1X4fQQytB5K3EagVeO9DPm+Jvwf4OlazOYAsLtRgUUhY3ILq/Q+z4beQjanOPfM
	LRS/An8cjKZsXZ52zL5Li8HvGbDOrNCWWBEkIpjLkQRiQbSfaaq7QNUuvGBV2iZrbUrH1GlVIRb
	FcYrheGv4+neGCZhbH/bHjy0SlZVcPGlBXBO6VjpKu9kPM3o8jdYzbIN4msr1rbBzZ8WXdb4kMb
	1I6jTrZWerArJZtxr0BzcsvuKGSgLqTujb59WzUJl1QzK/LJxjc76vksfyxIQqMNBhzkyXIwbrs
	BgqM3VvmrgqVMWOC5ZZE51Atq5VrMK23LFB3+uY6E7nutMRII59ZRtWHMgQQEMwc5yJT1ydZ6G3
	2kJlkNRpCv/A1V3H4e0+BnmiHMhirHIiv5UQXLHYmmhl5c7AnMFP4DLGTmn0e1iyedLpdX3aJJC
	6DUaLZQ9aGe+76Xbdhfvxr+d0fW+p7fmKCGtFxRdOFPgBmqcgrf7nXmuWAzgTpu/VO2mKNozSj2
	6qUBkSP46DK5xGhGEUzPvDV0eGu0yTaEONG0
X-Received: by 2002:adf:f80a:0:b0:485:8a47:5b9a with SMTP id ffacd0b85a97d-486eb3524ccmr5422244f8f.55.1789167814312;
        Fri, 11 Sep 2026 16:03:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm6534861f8f.8.2026.09.11.16.03.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 16:03:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: Fix the return value in spi_new_ancillary_device() kernel-doc
Date: Sat, 12 Sep 2026 01:02:11 +0200
Message-Id: <20260911230211.11755-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_new_ancillary_device() returns the new struct spi_device, or an
ERR_PTR() on failure, but its kernel-doc says "0 on success; negative
errno on failure", which was never true. Describe the pointer.

Fixes: 0c79378c0199 ("spi: add ancillary device support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/spi/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 5b5b3bc5f0d8cf8ba60a1785acc695710865edad..172141650b648694d4163d0ba00746ed2948ccfa 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2893,7 +2893,7 @@ static void of_register_spi_devices(struct spi_controller *ctlr) { }
  *
  * This may only be called from main SPI device's probe routine.
  *
- * Return: 0 on success; negative errno on failure
+ * Return: the new device on success; an ERR_PTR() on failure
  */
 struct spi_device *spi_new_ancillary_device(struct spi_device *spi,
 					     u8 chip_select)
-- 
2.39.5 (Apple Git-154)


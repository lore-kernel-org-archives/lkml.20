Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905708;
	b=JhljPuMcq21ZqDq9g0g5/MO6mCZm1fVk1crEbrPymF7vAyvKaxuHeOsAZ3QTdZg8XKol
	 tuTjwxoenkwlhLZ6R43Io3UmgLMvreRdI7bsa2su/1FxCrAY8dvtiZ/TRKJs/Qa4CIoAC
	 Gdpt/WNYs9ogfCKOGrkDwP+bLLNfcsZKRqOxCRCCF8T9WrWVQ4WNGWTbHwvjt4zfSi+sy
	 1a3R+y4mNnogvrxHBvC3wrEDHTfD0rS3a+sng000sU+gWjDgqH3iAPmuVkd3QUKG10ZtA
	 G94Kwj6mhDOyCLvvyG1OVBXYc0vVRL+h+Hr5vap/YJnn+3Fa5dDe5EVeLeCJougbHjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VrsetohNIasoINtJjADb3Jjeqh2EUCIwdnh6PcRK+gk=;
	b=XxfEtcTxLZlfegZ3RpQd01Fn/GMjroj7FU3KrV4ZUwfsk2+QW4pV6LUrJ/UKTllreyzO
	 d/AvM6AeF7J4gN+slLJHLrhz7WrjOLXk9VvzMoE56p8Qo+g7REOpbdTi5zO1LtW5cy7rG
	 wQJ3kxP6qIaGASbsh2ldEvjR1hhwO9hNUA4rAfSq3KCrkmi1zFZ/0or3WK6DHmBP5c34f
	 imy1tylvVBpQiVAMZ/ZpmVySED+mqLc0qpz2ab0ZnOZszfZ8w/JMnkSX3UWZwEcINaHAu
	 lIUePf0pjtYp0sBCwbpPigRgdN0vHo0B+UNaBUkdVw2bu5wm2cMe0f8SV49wfsOq7Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RCNxwm5R;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B42606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RCNxwm5R
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5559836eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905707; x=1793510507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrsetohNIasoINtJjADb3Jjeqh2EUCIwdnh6PcRK+gk=;
        b=RCNxwm5RMCOP2cRWckzM96GzxR6oDKWOmOhmBVseDOMPJuY2VsnmYrVDYPjIG4B/Yx
         jQ4XrLlhZK1/sd2OblIEltuinppiZoeW+XkW+0HidYSBKjBzJTuQqKRqlbBsGe+SlLUA
         ZWoPCX54Ba3SmmapqO+nBT3hJgBQ+DXlfwJ4PIPQ+t0EF59qIbc9QumxKbv+pAPA6SuB
         gWkkLZ2CBl9DYy/+ezeBm3/MOLffvS/EE+baaazUow/mOEHFL75owUDwWJy6OLZHiufs
         T/bBngAuA9UQbn8bzkkILHUWb1WImnXjEqkznbaTJcOZH5ZoTNDS+vrNq50Mvkvi/dDk
         afaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905707; x=1793510507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrsetohNIasoINtJjADb3Jjeqh2EUCIwdnh6PcRK+gk=;
        b=lCN74uoqkeBwibt3s+7b6obmGiYVq8uKF2RxZH3W46HxVGm5aALEvRTLRCstuBYt7X
         6npyn9YHMzEoR4Cj5VkvdLKD3N/Nd6yn67DySN6Zt/jMbK0i70NT0KpZkRAXPF/oJFvX
         JpjcFM6kvsY3YxsamxLJqClCxT+cyCGnlYZvYOP/bdnFvK0SPjfKJbwUv8QcJOS9hE1O
         hFtg3MxwN7+M3gpcsMhlNJG1ytItnXDfXgq108GzzYNB0+VMm1gCGOm8C748ZeDWnYqj
         FRR1kdNY23xRdlqx+33bQfx2Ef3CT/mBT3spOl5VE6nHXutCdjgE9nkLzqv8nURLMubH
         mFAA==
X-Forwarded-Encrypted: i=1; AKwUvBwDwDatfWFXQqNOy4o2zlRuXNNfkKuiZ5WqIT473pzopT9Gaipom0lq5d47d1bXQz0pmgnv/nEXh5Twg+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4eV/mySOCKe86QLlm3odfj/fvry5D8TIY1R9WHVl7xatgCSw8
	knJaN2GOWspyMHHsvbOIY61rHaI8KlvXLbV/vdQo68AsNBVW9QdciaSN
X-Gm-Gg: AYBFou12ivOUED3MbeMFzwIPn57xk+jO3doiOLY29SL28LyiV+2SMIUtqLG9e0D3qCp
	LvvtyxlHIx9vdh8bTXDPwJI6GIIpjqFh9j1hP1f8WRmm/A+SsdhYwbLTT+6cI8i4scpA5txcT7w
	unPtf0EzALQ+QEu+NV82re01ArX3CNO1sIkvYjL80vWEpf8a94r+3h+YKjAkfrBBIkMFGWJYVQ+
	w+CgbxyCoQNAuHQewxdHkWkOjxU7yVwqrAfHOqxxbpwiiBynQKKLBpNJQXQopPzSZAcP0NCND76
	omPyc4UD23xnDqdgrLbgAdbzGJ9vgz20htbWbHk04QhE5KDi9NT8vmueKrng/Ay0Uw4gRju7MGk
	tKZuTLaYoTVcmOiwsIrdUaFeQ/+qQR5pIiQvPBoM7gdtHH9MquciqxihKLX3KcFwKhzfuG7mls+
	BPTbi0UmOntNrwKeg+vmb1bNiATW823BcEJCbVdFzzTVxlTOjjpZMj8FsKRps21aPYk9ySWwZLY
	ICT0n+vghiAM1a7R3f4jaVJMstgCUHCDyPElYD81hyi1o+76IAVs6wJ
X-Received: by 2002:a05:7300:cc14:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-369e84dcb4amr6835607eec.24.1792905707382;
        Sat, 24 Oct 2026 22:21:47 -0700 (PDT)
Received: from myarch ([49.36.79.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm15239138eec.24.2026.10.24.22.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:21:46 -0700 (PDT)
From: Aditya Nagar <dev.adityanagar@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Aditya Nagar <dev.adityanagar@gmail.com>
Subject: [PATCH] staging: fbtft: remove unused argument from FBTFT_SPI_DRIVER()
Date: Sun, 25 Oct 2026 10:51:36 +0530
Message-ID: <20261025052136.389541-1-dev.adityanagar@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The _compatible argument of FBTFT_SPI_DRIVER() is never used in the
macro body. The device tree match table is created separately by
FBTFT_DT_TABLE() in both callers, FBTFT_REGISTER_DRIVER() and
FBTFT_REGISTER_SPI_DRIVER().

Drop the argument and update both callers. No functional change.

The argument has been unused since the macro was introduced in commit
c222ea5d2f33 ("staging: fbtft: Deduplicate driver registration macros").

Found with checkpatch.pl (MACRO_ARG_UNUSED). The change was prepared
with the help of an AI coding assistant (Claude); I reviewed it and
build-tested all fbtft drivers with W=1.

Signed-off-by: Aditya Nagar <dev.adityanagar@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df..62d5c39d7 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -279,7 +279,7 @@ static const struct of_device_id dt_ids[] = {					\
 };										\
 MODULE_DEVICE_TABLE(of, dt_ids);
 
-#define FBTFT_SPI_DRIVER(_name, _compatible, _display, _spi_ids)		\
+#define FBTFT_SPI_DRIVER(_name, _display, _spi_ids)				\
 										\
 static int fbtft_driver_probe_spi(struct spi_device *spi)			\
 {										\
@@ -319,7 +319,7 @@ static void fbtft_driver_remove_pdev(struct platform_device *pdev)	   \
 									   \
 FBTFT_DT_TABLE(_compatible)						   \
 									   \
-FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)			   \
+FBTFT_SPI_DRIVER(_name, _display, NULL)					   \
 									   \
 static struct platform_driver fbtft_driver_platform_driver = {             \
 	.driver = {                                                        \
@@ -363,7 +363,7 @@ static const struct spi_device_id spi_ids[] = {					\
 };										\
 MODULE_DEVICE_TABLE(spi, spi_ids);						\
 										\
-FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
+FBTFT_SPI_DRIVER(_name, _display, spi_ids)					\
 										\
 module_spi_driver(fbtft_driver_spi_driver);
 

base-commit: 4a177d5e688e8e82113f7a32d6f75f0bab9658c4
-- 
2.56.0


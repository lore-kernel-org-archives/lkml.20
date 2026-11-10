Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328019;
	b=pmvYNOfxKzWKkiFuFKSs46KXM6Zr/JyULMyApiIelQAXDEqfCxm+qBGFHmqSgwnm+eX4
	 546t5PWbmQQrTFdebuAs/ml5vxZJU42eCwyQC3b8ZpSsbzKtQlDEO/v5APeMIoNuTJgBf
	 2kM6mOsn2BPe7uk+ql0Jpx7cql1mAMso9RFeFuis0RSO8if4a4w3B2MDecprVpBwyOlcp
	 xrdSBq3gLVcbLySoCL0VO+tkyiDj7vYmiR20rHLE3v8sR4n/juMqpaLMx0tXFsuVi3s1n
	 WEHHIXx5DmwdsjGb0+8zQEfjmG3iz2SADOLwVktJ/Q9CCsKjOaJDguET6KmyZRiKibw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j66A61VB02ttIT3aNMpet5+IqRoDe8F2uoe9E4qYXPI=;
	b=Vea7Nz99Vh/B6vh0yfy8F8Codvh2YhLZTtB5EybP00OAyokNPFivYCYG0j2NZ4kdEGfY
	 WA/NBk/jDklR5srZqGLEt+AZftl1xclgfUaC9enxpnMf1hNZSEl/0Wn5+tR1YC9Wxh/yn
	 zkaA17ssIpVcjO8F66hWFEE8Ltbqi3qPKizTCc5t7I4JN5i4tUmHfOuY8bMyTJVMQy9Vv
	 bC7xUbhmJUy+Bq6lTp7SEswjEXTZFkShbZCst5BfpGnbQ18WP8U6UQEHAFAF67TDHBbNk
	 l+pThj1sq+WnQetRPsKQn28048VJ+A6J9x1+Wq8tIwLQ8SnTkee3+gz5oQb6RrwqBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=k7C1+PDE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34816606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34816606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=k7C1+PDE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso23242155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794328018; x=1794932818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j66A61VB02ttIT3aNMpet5+IqRoDe8F2uoe9E4qYXPI=;
        b=k7C1+PDEQ7amdzJk++tIPHqB4AVXXQojtbcD3JhTbBIqD15rcWGP/Q95EwVL7zj9dJ
         CVS9MG5q/GXljka10a+sWfQWjaPcueFX8VtttYq8FeXuTc757Hu7N10hL1luoRTxmSus
         QrhNqqtaABmhr/vH9NskLqKxr3Yo3FdAOxBm4g0IVgn/qBtFDrO6W4DQzrJ+iNNmC3mo
         9MfGhBlIha65yHziUebFmQADB2wZBiChYVqTkXsvjf/rex1RpuA61bTW2avGv1pdh6mz
         x6JHl5Pb+duSaoUfy6p2jvsG6p1TJlAVdUxNCo6np1aC3Xugjptki1knvoRKrH7yc2mE
         cfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328018; x=1794932818;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j66A61VB02ttIT3aNMpet5+IqRoDe8F2uoe9E4qYXPI=;
        b=ER8l2IFbPlCZuNh9sHf7yDKh02+lhpio41M2+nil6SxREy7QgsHJs0nWkeGuFsal1L
         bd51rYPaDswpMxwlwqab2tKy6n5y8SUoq71msFpaWrQmkwdsUyuVyav8C6chT2HBlASp
         OFlr9vLfP6agyHNJ+kx8C9uYGfqr+B0QVu/AXTk64H3xbXkYbiQKZqyMvOTWnqc5Thzi
         FFSdFID0QQxjdMTa9URcKM5o0AHVcxKJv4+6ch2bAogh3HyxMAo1KKOVIx5+HQSbKWW0
         miEmA88J94yJWdXmGdH0JcmLpHBuBCQJM7svGiyNDV9kAHIc/nFV/sIQVeE0ZvEo/pPN
         elhw==
X-Forwarded-Encrypted: i=1; AL+hErGFdHDOqnGbiJC1DKKF0GZZOSYfHgpAd9yJxAirPDtuEyiJfNKeZ8Gwcqx0wXTxpjJLNrGUz1Gfo05GwXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ldjpyWW3gC1wL6FyL2WvJh3to5qttVhe14DjsIjtDqMOdtlqW
	J/oF1EbXrxbltw496Ur2ahwSV8M7yjjLaJZie8zinw3Jtg8lp/na3J0cEXB5Y5V3Tfw=
X-Gm-Gg: AYBFou2tJSfll/pLdCOIlFpuwoyPvr/OH8/9Ktms1ECMJBpp12xpgbwEId6yFl1tn1d
	zy7SfqeV0RwqumTRuxUyGqOmMXQVyfJ1YXwZgbo0/CDt8nHYeqRRAR+xMlA2olmM57IRzKiRsQc
	eWnbaxC7P6dhJcXIbZysdVeccjO8QyIlTJH44gU0e8HUMDmwqaJQEU1bFMc9nddAV3RbYMNMiOD
	83Op4rMRUz7CgeexIJrevGRLZjGAQHodzNzfpioxx7wWLeRP7AzXOPqChuEbyCoDmIsVOTEiLia
	qUFEztEO2pP7oFc8dycVJBAbrjX1ZeANglQreruNluQ/1jjQo4Cri+bePw36RxpDHuEdsciY7CT
	WGZtVIUeAt4dJSpmWsl1+nwt62ch/dS6pFDFCrDBp15arnF/6E6QfxyBSz2rg+wJiN1E0bocRPh
	xJgSWLfhwU2xUq/vzanKm16TaFWF1fwNEapno7TAr6+duFhUxeLzbgloLsAp3EtlV9qRgqCOAc+
	25Lg5xsrNxetnaZtdhdGboHneknmoHGlWpjGTFSndi0WiF+IUgbaWNDUumHBCLTx8ivF0hdvyL7
	2RkdtBPa5YqFi9dBYmjtn68+rlCA4Z/eE7JGacUH2OwCNwlhugY8PHePHBIt8FauykvyMJgxuA=
	=
X-Received: by 2002:a05:600c:19c9:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4ba02356ac1mr55662755e9.35.1794328017694;
        Tue, 10 Nov 2026 08:26:57 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm85050695e9.1.2026.11.10.08.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:26:57 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v3 01/20] drbd: mark as BROKEN during DRBD 9 rework
Date: Tue, 10 Nov 2026 17:26:26 +0100
Message-ID: <20261110162646.3028472-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
References: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mark DRBD as BROKEN while the driver is being reworked for DRBD 9
multi-peer support. The following commits restructure the driver
extensively, and intermediate states do not compile. DRBD will be
re-enabled once the rework is complete.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 495a72da04c6..ab0bf1b7eb7d 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -9,6 +9,7 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
 	depends on PROC_FS && INET
+	depends on BROKEN
 	select LRU_CACHE
 	select CRC32
 	help
-- 
2.56.0


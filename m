Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650466;
	b=sv/27sBdc2sbMCsIb2EaM41abQPzpew4fsCMLu2RJTKnJ2wuhIKdTptMhoXgF9qweh+O
	 f/vSRrCpgzj2fc9+QfC2pxptqj2oSD7sAb4todVQCPX/W1JrodEEQF/Y0X1S6qOf5j2cD
	 5Lazc7f9NfimboSrkJ8mHpsslaYOeYxWPt4N9l+PxeTV5kUy5yCg/7QP74jJqqfjzJNYu
	 SmuA6OXkm2GR4p00tTkzy27qbcJez1VL233+SRERZ0lE7el+Wtngz7mOXuoGFv41ZURBQ
	 HplRTuoUcna4o70FVowLQ0smoYNcMObv3j3oCl1rczKollKAMaYW6aQtAFnuHTMgv+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
	b=C2W++vXPdvd0NzbnFBW1T+xfSG/YPG7TLiKxj8ZfRhkA0PRDmQigf21TVaVafWsvpgBw
	 q+5fmSlB+Gn3UNW23xMf1KDVAathjP8TLyOs6muEA249O54KkopsYt+nmYiMWhnfFvDEK
	 udkwPacsvqQOwop3tUHQT44pVITGhcLHKXqtA6N2K6hCMuSTVoxcYPWcEbZ4gtpJIyiQH
	 8+WDGq6IjmM4f9WGNDg37rDSktRR0V4LOdaVfV0BlGP/jb7Wqhib3Tk/oTWkVPbrcTlrU
	 gy58bkFThdhH/FLHoRmoqCbQc+PawUQ+//IyMReJCdzeQPaadrQ55fDMaKJewt2X3pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8BELnJI;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9C606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B9C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8BELnJI
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4922dbcee23so801937f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650464; x=1795255264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=l8BELnJI3pTWl/XiiJbX3dWKO1ce40yOuv4TxMK+VNNJm2H1bwq91bW1m4zLaivmQY
         dwXh8KVHYsxhkFlL4STp2Rp9kx+KNDjQt6HmsciUFgo5GzZ3BGZ6Viyu6f+/rZnVkHz4
         qrGftZRjp8zJ68DPPcLIar6jsw/Rv1cGzPyd2BUOH5aWPMUzh1v3Jdos/oyS3/0a6x4s
         G9bG38Jo30AUexs7BIGS3uaQe3xI8QByUx0jJ5Rv83iFWEcdnGIBzstTTZFMo6XChTFw
         J3piGX4CaQg2c+40DB4lM4qnMdZPAkhuIDshGHpW8Lwe5tjqVM9rCkar3sFmAIOhoc/1
         g9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650464; x=1795255264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=nqiPpiOhWeHwTlYWBfyoHZgkf6dDm6411MOHOQwpPLXALxmKgaq7o9bieS8CWWLg96
         3bD8fYACyqmuKogmNRyevf3BnFxoTxPMr9SjozJEqp2yuV3y2ZV4WTbxrs11qzWkurly
         N7IYG64/wJpfOkM//Anzl7ccmi0ssuDY12zjGuhJTqBHId2nK7402LyXsFjpiMs157ob
         nGBWFZ6GjfFhuUDtGiGEhuow+0x0E5+0bX08EaZvoFls4ZNiFal+h/faTOmqHO5REWnY
         a33Gun3yvGDXc6g9fwp1Xq+RX7vPvVomaZdg2El8lxzxv7uqM56JlSE6Y1EtToKahubk
         ehMQ==
X-Forwarded-Encrypted: i=1; AL+hErFmS2ujxxcr+2X/s2fdxUfWCJC0fjygI+aP2M5SMnKHsZEejQGN42sZJ0Jj2RuuvEOzvfwlZnI10vqG9rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zxLvKcmpdDfZM7ApPK6nIkLcmtQtqFqPUE633fKiXp2PV/DT4
	XAxh5ZrlNw7T88/9fRzA3QNw6onD1qkG0SgRprAE6M1BEzRp/iAyutcLVw197IU6adXI
X-Gm-Gg: AYBFou0bETbwdtOPsinw4wn3Q62L5GT/+BrGsuhpar4stX8dv726NATSBF/fJ1DHkW7
	7Heg6oVFBUdBJRnU73r6fkKnJXKQslwGOdIojXejky885D2OSIv5rIwF9EST18uvwTIOmcJ0CA5
	n0mGdUs+OcMS9HlaJAQSBSc4ZuxFjv1S6cNhI+fJkDxOZVTsKbXpvOeb8o9A3OylkXFMmVSvtqT
	34dLjNYOdvz2PNkHmaZcYMhD2h2EDrljMfrdVOuQcBKOzg5w1pvbKZ7519jnLTWHdyo/QMC8az0
	FkyhLR+boKXhS7w6QLdAz6CMmrfMkyIni3Yjk7qS+D4oJlzP8Vl/5pHrf5vYY8fBhQWlbjbd9Ix
	nOpkvPMXFlJgagc61I2hgYvEoYL39cCMfNQVPwBQJ4DbxrMgFF/cuySO0TyZcSKlJuDqawwbm6P
	Asyl8aBGzkE4zvlLxt14TL5cBUUQyqSpIfytsFHxlK6EeDZfu4cD4ZBNumOWqKfPSnM11Z6vmur
	fvYAIyM7veuOrcHtqGIFXrJRwtaqZBNGutW9x03fKNKVNlE55j0/XRGkSbtJqT3Wt/rNHgg7LW7
	tN16/ZqRMdAaUwmbkRVmE7A7B+2ubM9m7g==
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-49c723fc793mr10335695f8f.26.1794650464192;
        Sat, 14 Nov 2026 02:01:04 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:01:03 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat, 14 Nov 2026 10:00:49 +0000
Message-ID: <ab06a2173b01f4e18dd24c68e03ef846ea933098.1794649714.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794649714.git.jpeixoto@osyx.tech>
References: <cover.1794649714.git.jpeixoto@osyx.tech>
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

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v7:
- No change.
v6:
- No change.
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466246;
	b=sT6LwePSrEZBXGWiclax12op5TXEYSbil1tJtY+cf6Jlt6a1+ATdABptJgtYZ6hqyGQG
	 kZ+hhqGRBT31WDlYkMiJQhsvSp1GMoCrS+4NkAzImwohhgI/nBDvGvOleqU5cPKhUIXaW
	 UsWJH0ODgeywgsNd/j0TOp34qt8/ZKUXxzgWKrTIRLBpsS2JW8BtirPrh9xFdMLBKde4u
	 IhlDb9Kask8DE14oCFN3aPizi1P21cDgqE/KHJg/hQ/g/UVvJ3Jx6yDrGGWQd63WHYcNq
	 IL5A1lOe0NV29twvuI4JhxUoiJoyvl+o4wchqZnndqT1w/eJ/edQIBeMKjrO3x46swg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NT4jdGotJzxNuTLZO5N6SjybiH5BTjQ5c+C2HwxxXq4=;
	b=YQvXEAXRittQv/fELOzzPnQ2x8dmq4srMlbXOatieJMtgXGWejMv2ml4iWJvW9kt8Qch
	 Kxd+Y3C0USHrar3y8uJs9l00HUZ6tvKL7zRIcccC492+SdGOr11hy5rvnk8a0z9JoyjE2
	 yaf17xBDVg9PnmdyQxX2R6iNZ3BjqQSb/IVfKwimw55NYvtULDPvQS9FkvuaXd58tSQrT
	 GSBx6X9nU6u4sAu+75zWk3SXUnT+ZJcpsQ7GB61AvqxwaMi/bxt49TAeKq3IXA0g1m+bZ
	 rW9anlRPplEcvTJOxPvLmlyNAje5KaKJcVbF1qiyF6IxJmPg0m0j0otdxM3bggh5Zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9w1Bdv7;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5DA606DC94
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5DA606DC94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9w1Bdv7
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3149264a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466245; x=1795071045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NT4jdGotJzxNuTLZO5N6SjybiH5BTjQ5c+C2HwxxXq4=;
        b=T9w1Bdv7HosVhLD3a83j84pnZVg5YS0p+0yDGBed/EdkNMQbcVElIpfp0Hrtv2m5TT
         zGWpqDTJuiEXvcVnzJwxkw0rO29SGi5SR8y5sQDHNHczPkaLHK48V8qj+KWhwEMVk3CG
         mtdgg4H7TiDipsZ+DnE/oKYmX9gEsFBTIcgqaOH9ptsL4YD8MszIxDdqo2XhNjJs+4dh
         mU/Pbau9lStyaGhcErPKYoTvmHb+nDHd9STzPt73qF2DI07topNWjf4I3PwH6kx482cL
         sArG/f3xb6mAHG5a+1Zk+AldIvcOXKcOOkh1Y8zqVEu6Mf7i1ev2R+EwHtaMVpUHFLss
         x8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466245; x=1795071045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NT4jdGotJzxNuTLZO5N6SjybiH5BTjQ5c+C2HwxxXq4=;
        b=HpmmDeIOwedkc6X83s4y4mGtVUBk9IdNlLm2wr89UkXsqUnrtEoJrPCYCgtQtXgLiv
         6z/Ys7dlvHD7DcAHMXaVCtXUDBSDfB2Xu1cZjMmmLMkOzFXyM8MB7jHR71XoAW0tOSa8
         Ah6NyXxc+ywYVzyMMD8H/XL/I7cS6sF2QAF5uY9E7/MJqAtiUxKSFOmzBTP1884w3gZc
         4JtU7+Dyrfzf5QUl/L1dJ6vRD+fi7ispqHvz94G+fTLW5nqWDYZ07rHg4sCKjqsnnNir
         GBmYxpWbswwN8sIiiy+CcjBHx3yZ0pw3RH2jBnoAkSdt2MWvri41XWqK6cfMuyCm9TTh
         JwgQ==
X-Forwarded-Encrypted: i=1; AL+hErHFaW2HS7MaNSgcfIiE9ql3dLlDUN314jvtWD4J3BYDwCLIqLA+TGL0Cb/m2ORvJQl/1P7n/5enZ/d8VhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BUBt4X7Ebu/UdOGxl6EpSISaLWGC+8YRBKFt0koAJgPF7f4xk
	yXV79+wOwaFHCJQcP2b5+zATeQx3Y9BRWoEweVsr6C2Way/9DO5oyRhk
X-Gm-Gg: AYBFou3jOkDsaC7D+1sAbQzPynByqQX4XM8vtVuFBZ1Gv+iosExnRb1Y8XerWpV52Y8
	a3BI+rgXxnpDfw5siRkN+x93Lz8/HRedw6BtVCp9vYM6LVpSrlH2OH3r17nLFTwv09rGbmmI3+1
	Ff+xwfcZv/mxR1yh8Pf36W3ObQ7+Rw9eM/G8OY+kdNIMVkML3yQYt6IFDMNCfT37lgyz/vmr+Z6
	NksiRSxmMrspuzu5fpju5NeuzmefTV2lWUiwf8QxXZGyndBDOfrIR+HWcCdxO5AINWWjZNOm560
	nzQWvaPEkkG3SQIEKxVXFc/kzz0arxxuZJ3cqTQkPGwPUQ0YhEdMM3tkQIBEqR1SARjpYl9RI8M
	xuL70Fj+biwPrgv3K7tHySKgv2Ws8N/BY7s4PpG/MeUxpawBG+zc1JdV1E/8zKcY3UIOZ5z6NxP
	CtaOv9Wq2Srz+bEB99c8FAvwZMv/lcSAaZd4Y0f1y5wVRaVXEuhw9nSj7TbBoUH1s908ecnPUqX
	DsEpYPB06Xrjo5f2x/fN7B5zkJzGBbhRZl6NrTVM7wyW8UqMWg8X3EL4OMd8RllpsWo5I/Ptxia
	hR0ljkGFSBVN8LI3EIZzEsHWhWY+DRVlbVvzM63lyqsVg+XXKDxQt5WImJ73gyIlISVddkXrEY+
	jj9HwyV6SiwD0bz/K
X-Received: by 2002:a17:90b:224e:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3b182f198d0mr4826630a91.57.1794466245413;
        Wed, 11 Nov 2026 22:50:45 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8aae8sm3073297a91.14.2026.11.11.22.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:44 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-input@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Input: tsc2007 - fix minor coding style issues
Date: Wed, 11 Nov 2026 22:50:35 -0800
Message-ID: <20261112065037.1800467-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
References: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
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

Fix minor checkpatch warnings and checks across the tsc2007 driver:
document the mutex used to serialize I2C transfers between interrupt
handling and IIO reads, remove an unnecessary blank line following a
loop opening brace, and drop extraneous spacing after a cast.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc2007.h      | 1 +
 drivers/input/touchscreen/tsc2007_core.c | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
index f65186b8e709..e5153b420371 100644
--- a/drivers/input/touchscreen/tsc2007.h
+++ b/drivers/input/touchscreen/tsc2007.h
@@ -78,6 +78,7 @@ struct tsc2007 {
 	wait_queue_head_t	wait;
 	bool			stopped;
 
+	/* Serializes I2C transfers between the ISR and IIO reads */
 	struct mutex		mlock;
 };
 
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 51e4d985afcc..8197ad91ed8b 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -82,7 +82,7 @@ u32 tsc2007_calculate_resistance(struct tsc2007 *tsc, struct ts_event *tc)
 
 	if (rt > U32_MAX)
 		return U32_MAX;
-	return (u32) rt;
+	return (u32)rt;
 }
 
 bool tsc2007_is_pen_down(struct tsc2007 *ts)
@@ -115,7 +115,6 @@ static irqreturn_t tsc2007_soft_irq(int irq, void *handle)
 	u32 rt;
 
 	while (!ts->stopped && tsc2007_is_pen_down(ts)) {
-
 		/* pen is down, continue with the measurement */
 
 		/* Serialize access between the ISR and IIO reads. */
-- 
2.56.0.567.gdb80ae8cd5-goog


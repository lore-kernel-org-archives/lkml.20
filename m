Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6838364EB1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789448315; cv=none; b=GFGk951YFKyzu5w7n8VDC/O2QSWPZQNRcnu1Jco8Hr2C/+c4/lV1kAtk/5zIhvQ1rOVffc7s0jEM2N8FHpEflyttiGq4BykkMmKZtn/Qvcb+6C4jalRgOdiDqoOScSputvkKhR6AG5vZUsMhSu3+DPm4nyxWD1smnChGMwR+1Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789448315; c=relaxed/simple;
	bh=C1fXXNHo8UXoCAzodDxhxcKZtEoK+gCFLSDL6HtXi+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pudn30P6qU5yACT5PwGUMXVQxDfEfCIrUCSK73CIu2GjIEoJBOY6uCYIwFi9LAb6UNWlnY2ltuXR1rM6IhYA52vp1MW5+RP1fBgLiz5dPfY9jcnI9ovcoCyjWWp+W2WcIrkRpGQru+Oa92eedDCpkhymuLeDrvDIOLyQ5IcoWzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=eIN8lMVM; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="eIN8lMVM"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso1612001b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1789448313; x=1790053113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYkfKrdykGTTKNXpCcbgVoHk584EaRb8tbI837afgGA=;
        b=eIN8lMVMRpGDi+0NxBXPGaI2D/sLJJvZYZaY451385xm8coxhQilRcVtZD/XTnM0U6
         oHanIMKrEPIFaNjelDbompDAKw/i7ui+lb56xB5ge7u41t7oMHIOoxwU7m3uOOoYbNdZ
         HogwphvEEUYxfY4g45/nBl8yzb2aT+4Nl/xw2j8seV2KWOjVY5mK++pq6lihpv+1pNm0
         mLiwIYYxl1GET7BkWRBKSsvM3dmzdovb0dTIbbt5wnIPEUtO4SHiPkfGcXxbw37VgzFI
         HOKBMucJH7kWd9BThAsPtKuG1RHpFpHWHQ/cNhYez3bpEYjUSDoD4gOVfEIJO633YSts
         Gcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789448313; x=1790053113;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYkfKrdykGTTKNXpCcbgVoHk584EaRb8tbI837afgGA=;
        b=bUQS+H4TTPZdaMA6/lzjmliJYskkYY1p54/PQGt2ZGTwwtP5WP981KrW35ZhWvWJJ/
         ipSnsczpwifHWc6T/zHEdPTaXbfEmm0WeuYtTN+EL5Zxiri320OZ4uvtR8M0AYTxV8pB
         0tzFv+hhhMfhoe0t7L8wj8a5ibIoWQtNROjwE9LFWmngU1vkxlGLxLurzL+zlj+rdgX0
         K+WV2sViw2lO6Wz56kz08qocz+Bcso8eGlUcgiXtippnLSOGeOxni0hrmFnOVNO03yNJ
         oc3AhbiCKgv/jsYZ7Z/+mZGBPLXi3aZyJ9m+IIHzfoo6z6iXSs7v7cje+9v9L+VM90NJ
         rd8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlwIsx7yaDeZBEeZJK70JNoeiaN3Mg2sBsSwco8YMSgEZRXXXjwLXN1AzXi16+tstKVrIAxmqrSSjau1o=@vger.kernel.org
X-Gm-Message-State: AFuF++kyOMcbH4lH7SdAt848bme0uBaMZOf09Vp8/h7qIeget6mS3FG3
	yVYZP97tTB+s1xxLAIF+7CEhoi62t5suZo/CAUQ/LoF/xOqJnczl6SLXDNJq3fVqfg==
X-Gm-Gg: AYBFou2SUr5V3YcfFTFKY35KRowODwiJ5rZ5lbCm4cEp07pfB2/jqy+cArhp3VEoS3C
	mneQJeK+iVIg3JAazg7etqQNb5Mw/hTGLoDDyidW03vrlJTGerZAE+1sspuYh2KoP2FaQXOX5kp
	5UARVuXkQdvsC6bvc8MMa0iOeufIpYN2DOyNctpieLodmbz+IusMWE5mbXPzUmkOVGXvkML7cYx
	/ELkXy1Yc+0AvtykH/VzAZW6az3bXDre32msFwa1fjEJVIWAcoq6wnjRjvbRl1ptuXPH1wgkh5Z
	mK5gbnKEHH67BKAqJ7CShzcO3LNMH5mBFXmLf1tnHJ6igglqrIIwt6Q+7jn6liRBMFryKlDX/PP
	pEuMpensZum1I7vHYuJMC8jLET/6RBiVRJ0U2cXZVxM2ZuA5nDlb44Mrmdc02YWjsZWKcLdQIrB
	BG9yztbom/TlSRKpVMlCKSS0/EfJx4JPCZ58Dnidwj3yzvcBoxQy6Nv+XiP+14QhwVL1h64CUXv
	IQJEhrT
X-Received: by 2002:a05:6a00:9087:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86f82a5e981mr10610059b3a.4.1789448312906;
        Mon, 14 Sep 2026 21:58:32 -0700 (PDT)
Received: from mimolette.lan ([58.136.228.96])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b5f96sm5917398a12.32.2026.09.14.21.58.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 21:58:32 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	netdev@vger.kernel.org
Cc: Richard Cochran <richardcochran@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net v3] net: macb: fix ordering around PTP timestamp read
Date: Tue, 15 Sep 2026 11:58:17 +0700
Message-ID: <20260915045823.76100-1-jjc@jclark.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PTP_SYS_OFFSET_EXTENDED returns system timestamps that do not correctly
bracket the PHC register read on MACB/GEM. On a Raspberry Pi 5, the
returned interval can be as short as 37 ns, while an ordered register
read takes approximately 1 us. This biases the midpoint used by phc2sys,
causing CLOCK_REALTIME to run approximately 0.5 us ahead when synchronized
to the PHC.

gem_tsu_get_time() reads the nanoseconds register using the driver's
relaxed MMIO accessor. On weakly ordered systems, the subsequent system
timestamp can be taken before the register read completes. The internal
smp_rmb() in the pre-timestamp path also does not guarantee ordering
against the subsequent MMIO read.

Add rmb() before and after the bracketed nanoseconds read in both the
normal and seconds rollover paths so the system timestamps bracket the
PHC read. Adding the post-read barrier increases the minimum interval on
the same Raspberry Pi 5 to approximately 1 us.

Fixes: e51bb5c2784c ("net: macb: ptp: Switch to gettimex64() interface")
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # Raspberry Pi CM5, min bracket 37 ns -> 981 ns
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Théo Lebrun <theo.lebrun@bootlin.com>
Assisted-by: LLM
Signed-off-by: James Clark <jjc@jclark.com>
---
Changes in v3:
- Guard the barriers with if (sts), following Jakub's feedback.
- Reduce the comments following Théo's feedback, and focus on relevant
  point following Jakub's feedback.
- Add Théo Lebrun's Reviewed-by from v2.
- Add Assisted-by: LLM.

v2: https://lore.kernel.org/netdev/20260910040658.18359-1-jjc@jclark.com/
v1: https://lore.kernel.org/netdev/20260908053150.28694-1-jjc@jclark.com/

Nicolai's testing and review covered v1; Théo's review covered v2.

 drivers/net/ethernet/cadence/macb_ptp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_ptp.c b/drivers/net/ethernet/cadence/macb_ptp.c
index e5195d7da..a9ac09900 100644
--- a/drivers/net/ethernet/cadence/macb_ptp.c
+++ b/drivers/net/ethernet/cadence/macb_ptp.c
@@ -50,7 +50,12 @@ static int gem_tsu_get_time(struct ptp_clock_info *ptp, struct timespec64 *ts,
 
 	spin_lock_irqsave(&bp->tsu_clk_lock, flags);
 	ptp_read_system_prets(sts);
+	/* explicit barriers are needed because gem_readl() is relaxed */
+	if (sts)
+		rmb();
 	first = gem_readl(bp, TN);
+	if (sts)
+		rmb();
 	ptp_read_system_postts(sts);
 	secl = gem_readl(bp, TSL);
 	sech = gem_readl(bp, TSH);
@@ -62,7 +67,11 @@ static int gem_tsu_get_time(struct ptp_clock_info *ptp, struct timespec64 *ts,
 		 * (assume all done within 1s)
 		 */
 		ptp_read_system_prets(sts);
+		if (sts)
+			rmb();
 		ts->tv_nsec = gem_readl(bp, TN);
+		if (sts)
+			rmb();
 		ptp_read_system_postts(sts);
 		secl = gem_readl(bp, TSL);
 		sech = gem_readl(bp, TSH);

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186347;
	b=A00wS+MTwc2eVvNpIds4i0ZGm9V2guWbAl6zA5IaKcKc3qUjgelh2tfTWVRgVRn1g46F
	 uWzH2LQIFCEE45CG5pwZOImU+wANzgCZZmgcVh26ToHZARrvWvaIfctm93FijArXZsVOP
	 z24zFcs8QgizhAhHLInB7Lw2M69AzFprL5lD/uLudbFznVG5Kvqd+LgcheGw7Eb8vT/PQ
	 eZwLidZPPL8Q1a9oDC3+nIx5OkBQh/G7YGuJmS46JLkk5Uh2IPwFRPUjb4YfIbrG854F3
	 dHdb2xVFyrXGWPJM8z1jQVCqrf+E/VBNMbJvs1bvav6cDrrhty0+O9Q9TeNyM3cFmSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KOoA9Umgn4JIoMaxIckP13h2ihpbZ+7K1hns+hD7csA=;
	b=kKfSCRGeTPSfynf9Y82dc3zt2Qcc1Zqas22ZC0JDX47GjjN49mTR4+cfYZWOMsYKbPu/
	 0PKa0yJQZjoVTSecDu+faYq/J1JIZoXTgWXS3ccs6tY7gu9L6WeKInE8eNZUEI3ub1/5r
	 En4Pwd3ljo+MgxhBF2/j3dMQTgbdC0wAEuneE4MiCWAuwFo/OLat6YbEvPmidEcnQC6qO
	 j7PRBcPmW46zDKjMxKOQYtpwRTpsU+eiAs1AdFAmbG8brljzaLt3BvMuwbr0wdAvKEghd
	 xUSFs5CsQWTmAhuX8vYMk1kqEOQpIyNGUyaFE/2mJIz1paswMTNJbyXvFnaQLmYRajw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j0C8rcYX;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71950606A335
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71950606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j0C8rcYX
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so8551545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186345; x=1793791145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOoA9Umgn4JIoMaxIckP13h2ihpbZ+7K1hns+hD7csA=;
        b=j0C8rcYXMoI0cHH6kB7YfdWfZh09kZxhGFC/Ew9pWrhnbWA+VWktWHe6a8uCRv4epn
         QtefVpLGyHDpfRsYKZF7xLnBe9uHEI11jP+GJfl/2r3RNfe3VhPaWByqMgy0h6CNFF+z
         wHPhfYNFXWQ8sImdfsr9VtQUc+ZNeNLON5eflMXAyn3LiR2yHA5CDqzBEGYU92Onmet2
         k8NPKNOqsP/CfjUJE95kaDcLV5vv4kSy5vKFtDMPZqcx7pLJO/Diu87YlcHEZfscH9Ne
         xFT8SitdW+DM8YTFN8BDiMXvNSHkBVnvYhZ3Pa2vrP1nKaPGu8YazCEHu6IqCYfI5hMr
         7XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186345; x=1793791145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOoA9Umgn4JIoMaxIckP13h2ihpbZ+7K1hns+hD7csA=;
        b=o/UEi29Pula/YCnJYBfMJQ/Kc2quMoliNgJO9eIImEEmUX3UCSpCtMeT4DnI2hzqh6
         WRYrPnA55gVOHqR30BclsoW7moMN6z3925wvjUAUjFBCJM6q4rPQP0nYnXG+lseP6y+U
         wO1jWSH7SGIR5phRCTBzxkUWBT49tUQpvl2rq3MT2oiMSvB5YStrgAnwCIAwot9g3TN3
         cXaRzlKYWXSu3z51YF0kkkmtMop1Wl4dobVoihBjrALaUKiyvGN8MCWTuzdKyMeE1Lji
         zs12QFPCWLb9XIrd/68ce+bzjJ4yPS+rywdFZyhfCGSispPZDKTm35dD0iC3152/6T4u
         FDuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTDU/yRYpEduCn92tE1Mj4jCEkdt4u7iAyRqYm6nH/B3leayGY6xOoDBEGkRcY222mjPzbjxoK+dLvkNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwwggAIt9RjmoXVkFJ2h2DReaJo/QlRLrCMzXIWvBy9zcVWkSh
	HScFvsC3MWwOqxEzMTdW/v9v4ZPcGwWf0eePsBRVvaf5l8mzmZ1+Wdle
X-Gm-Gg: AYBFou1BUfMxcPCxuVoKOHm5w1xe1TpDUMahQ5WWhktp2vkj2I+5qXvfxhXmMSkRmww
	Qhv1D9Ttm55L+PjuOga4mPIWWLPbf9n5gn/WhmpmDP3gN4p4D1kfmBFm9xI4sOJU4cTT0Wc/bQM
	R3IT5bsZJFsmscuZqVSKp0mwyFDBBaZOu2h2XcuKoUvx0V9j91pwKSiWNk46Kp+UP/rM4XSsCQ8
	1HMUNJ+X1PzxRL03JUfIWJzRA88HouENSSOQYBCExE4mXBzPNnPK2GjEGRG6RqnhBWlVNAIMUSX
	d0fllPiRQTRpCBGjjj+XKQ+5mb9Kl6qnlS0DAcWAeR2bOhOsxbKQp5O6zO6n8u8Sj1NyrOUYr6w
	eNzrqYBm/fq7TRYjjGHxrbHKMA7y6MqcNwIBOWVNpoEvR5FQtpiTb+EWbkWA0Pl5dP4GbFBcacc
	YmIezXOQuPiGkrLvw9v33Sd1U9v/Yq5KSNJCwwDC9lgDZ4drQiZlXy0SfgtvaIWPgcnGrFbe8/r
	81sCsRn9cRvxw1g9vei2ltsQ6lkkYN3NREP3rwRdZzZEf8qnvLqrplNfy19f1qNjIPi15BglIzm
	C9DCfBj/l8DcIJfoiClUDPsnCBWqfatd0HKoK4Y=
X-Received: by 2002:a05:600c:c3cf:10b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a967d96ef6mr29165285e9.33.1793186344800;
        Wed, 28 Oct 2026 04:19:04 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm64197635e9.10.2026.10.28.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:19:04 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH 2/3] HID: elo: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Wed, 28 Oct 2026 13:18:52 +0200
Message-ID: <20261028111853.22429-3-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028111853.22429-1-mail@taterr.org>
References: <20261028111853.22429-1-mail@taterr.org>
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

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() for the elousb workqueue. WQ_MEM_RECLAIM

is added to ensure hardware events can be processed under memory

pressure.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/hid/hid-elo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
index 86e8729e1975..72fdc073ae39 100644
--- a/drivers/hid/hid-elo.c
+++ b/drivers/hid/hid-elo.c
@@ -296,7 +296,7 @@ static int __init elo_driver_init(void)
 {
 	int ret;
 
-	wq = create_singlethread_workqueue("elousb");
+	wq = alloc_ordered_workqueue("elousb", WQ_MEM_RECLAIM);
 	if (!wq)
 		return -ENOMEM;
 
-- 
2.56.0


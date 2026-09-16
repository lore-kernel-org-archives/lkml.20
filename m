Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C34A843F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551587; cv=none; b=astb2dCLxiNj6YDtuHdQMef88Vs5lXbNqJ1U39vebhqYELB6vUTbUd5YlqZOlWb9Xj61qcBDtsOabw0h0thzh6Jgl02dQiNaZCZyNgwIXMA1ffs8+8rUGURnZlOIx4v1aBREU5alK0wnkLIwl9hYfHGL9i5ua2Q99h7O1oTiVjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551587; c=relaxed/simple;
	bh=b7fdcAmW6lzIWiw+Ww6DahHQLZ+/EizToms+bmRTlHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uvC4NWcXXYQIyQTDPN5nhGPVymev+qaZkqd2nKhanlX7Iir2qDq0O1lBab5tfXXobPU90h5+HhOYkOblMuM7NAVKLYycKz+iauDBWw8GLYgMvbWpUneBCyNvd752wpmoD3VKvMeGbOvI15tGsaNQ0uOwRzHSa8TQk3n9i6Lc+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZuCOWGN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZuCOWGN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so3361465e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789551579; x=1790156379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FK0BAI5zlwK5WHRW3pCb1OR6vOTCwaSaqw4lIuR/t0I=;
        b=gZuCOWGN1XbZjNnwv5QyX6cTVrfYXLMp+THnBp3a2tntmmBJbkxOhNBiB60rssrM32
         n/9+RyzXnNbOdLJFN+WvHJ5cvRVLa69NbKjLTl+8d2BfuJsTNaFT96vpqH2T5uY2gHCq
         srMXenrDEsrIEj4IMzxftUeXobNmvvSEtQC1fAmHZu+y3r2BsEHATPS5TDLS3CuBL83U
         5ZllPF74UsCCQm/nEHhLqYBDEC/DpxAxUfGAmBob/KzmHUYtOuns4alwci3Thw31WlbS
         XDXrsmDlncDDBHXBwyymfIX2vEk79Z7YLPWEaeX5lhkXIZMAy8gxMHugumLOWWB7nB+H
         i2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551579; x=1790156379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK0BAI5zlwK5WHRW3pCb1OR6vOTCwaSaqw4lIuR/t0I=;
        b=tEB7tM1AMkflnkSpO33Dndg9X9zBMEsg8XGiw+9QbF8Ma0wIN+A9sQnPhp+FHMJsuR
         LHl6DfPJDYzuDHkW21S8/DfqJAXMiKJdYTDf6UHzWL/Gxr481uQetPv6UYXTZyqtKEYL
         qhlQ4kWEaD4qbuBYKTQpHfb2bXruCDlz7zebxVbN+n7rJzxxzwhpGoPenVlpspJ2jz0w
         vOaD2FqHQBq431JyHpGxL2O/hvmHfTK7gG0OI8yveAg5hXQv2wcHfVk10h1rXBVM+lUm
         j+Oa4QP9A1A4IL8hJwH3rmDGu0iUb2/lXT+OMUA84T8NIesPdM4tsxu6dyCCS0Ssxi0Q
         ubZg==
X-Forwarded-Encrypted: i=1; AKwUvBx7IxE70Xy1WU706erUEr0XgYaZfXnMU2G6r0dZoCP8inaBcLAX79JnKZeVU6cysNwOTixChclKZQlP8cU=@vger.kernel.org
X-Gm-Message-State: AFuF++kOEeH4bSLX+d0iQV408TfUCfPUz+KFJ/XD+1+q8BRGSEKk9qku
	uGnEOUTQrhHtyI4zkjVBG+7oyZtcFAbRVWDmDpcF9woXsyPTUKVCnTH6
X-Gm-Gg: AYBFou3VY4wnS40NoqHgmmqbPB6Bq0Li1VqhTEmjvRj8PiXgmarR+O4LAdjTZlogVZx
	0U6TT49Lu5+Wahr6sGBDggObQoU3ZOWg+yuGPiTaxt3mmoLg2wNlmgGWvep4kKgrcWFQhhYw1VL
	JpmWJihX/RpNMIHbzPAsNbhUAXhLqDOLjW7Vmipg2uCBlzz1Q54gP9Z1vClgPZHvt5h4F4rU50P
	8N0XCg33U8xyUS3OZutD21+W9tS4KiUdwm45Tl/cjZmnr3flc8saHzdgW8R0huLjUKIrHCz5zBu
	cmYegVvTE1HDe2fTVhnRRDSJh98KlAwk//GlETXYCYwZJQ5Edb+AbkN2bQkAoZ5gznYiYuUaR2U
	twt9HinWcvVAJaeX3phnbKErMfRbKWxNMZhiNHsmnvByzGSkN7U5p0JiAln+cqQqJXvzXXE4qg/
	DH6mre50gbyJk9O/bnzS/Bz4aU2eV9JBFp+R3AL4ae1+fRF0XbsuwEN56skZ+NplLQp0mCMgRhe
	jlbW0o=
X-Received: by 2002:a05:600c:3596:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49eb72f2c40mr23366615e9.8.1789551578513;
        Wed, 16 Sep 2026 02:39:38 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da9a7csm61728415e9.11.2026.09.16.02.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:39:38 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fb_upd161704: replace udelay with usleep_range
Date: Wed, 16 Sep 2026 12:39:28 +0300
Message-ID: <20260916093928.52057-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace udelay() calls with usleep_range()
to avoid busy-waiting and allow the
scheduler to sleep during delays.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index 7288140e7..f66dfad1d 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 200);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 50);
 	write_reg(par, 0x0025, 0x003B);	/* amplitude setting */
 	write_reg(par, 0x0026, 0x0034);	/* amplitude setting */
-	udelay(10);
+	usleep_range(10, 50);
 	write_reg(par, 0x0027, 0x0004);	/* amplitude setting */
 	write_reg(par, 0x0052, 0x0025);	/* circuit setting 1 */
-	udelay(10);
+	usleep_range(10, 50);
 	write_reg(par, 0x0053, 0x0033);	/* circuit setting 2 */
 	write_reg(par, 0x0061, 0x001C);	/* adjustment V10 positive polarity */
-	udelay(10);
+	usleep_range(10, 50);
 	write_reg(par, 0x0062, 0x002C);	/* adjustment V9 negative polarity */
 	write_reg(par, 0x0063, 0x0022);	/* adjustment V34 positive polarity */
-	udelay(10);
+	usleep_range(10, 50);
 	write_reg(par, 0x0064, 0x0027);	/* adjustment V31 negative polarity */
-	udelay(10);
+	usleep_range(10, 50);
 	write_reg(par, 0x0065, 0x0014);	/* adjustment V61 negative polarity */
-	udelay(10);
+	usleep_range(10, 50);
 	write_reg(par, 0x0066, 0x0010);	/* adjustment V61 negative polarity */
 
 	/* Basical clock for 1 line (BASECOUNT[7:0]) number specified */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 300);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.55.0


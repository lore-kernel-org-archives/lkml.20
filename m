Received: from mail-pj2-f21.google.com (mail-pj2-f21.google.com [74.125.227.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46644D9557
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604655; cv=none; b=tUsNXuAPNqYWoXjumQN//eFnk2U3BP+8u1fPvRgutcWR95zsQm98jLKzTWAiPZ9ndcOEfjEf7SRorS4kj1cKWE8xgxDJXJPWHKreygx19xQzuPsn0TQ2rEzld05j6TD3+a1cjzKSsnm9NgkJEkq5KddJhuE9fYUFbUzBB6blM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604655; c=relaxed/simple;
	bh=911/gGTIVH/XBaJWfHJBfLJwVyKWC97NEVkQjJT3S6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KK+57Lh0B1DKCI1VRkhp7bQpTU2bNnlJYmfW+6monrCGglnnM4j71vrtac9dRDPt2tvZrchwYsF4W/rIjf1gzMs5l1K9bZ2Xq8be6jcPC7acrp04dTv1GFd6w8XXQR1r+xqNTWIeJ1pXc5d18EOeDuRZk9S4kNkOfraaabMaiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtKUnfY/; arc=none smtp.client-ip=74.125.227.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtKUnfY/"
Received: by mail-pj2-f21.google.com with SMTP id d9443c01a7336-2d747f0b25dso19503515ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604653; x=1791209453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzpzLV9YSjCLUYBpVj6plH2gR9G8MGLpr4Th3PeANto=;
        b=KtKUnfY/z8jcqQvJH8kIqwSISBGOjCud7ueVnF2bcdwLPQVwpWscNtcX6IHVyAXO+Z
         MEri4xMKCG4lTmQZjz+mxt9Tp5nhG7CqvncmUmMZDbDmTYVyTbTis+kT5PudkyA9JzMB
         Bo9rfgeB/wRKUMB2TIwkODM0rH1eH8KvtQ4ehvP8DL442k0Fc3rGDJRzjYTnHeqxZS7l
         liiTHWGpaqelC+SvUbiAS0fFR+LhPT+R571xR29NFr/5Ht4wE/LREU0ghsEN1WczjEoF
         UN7uMqW4j8p8bZ1UcNZL/fyLGQ0mF4x45RZNqCd8i+N8R+q5SnMUpxa3iJ8ETMO3PPIt
         YVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604653; x=1791209453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzpzLV9YSjCLUYBpVj6plH2gR9G8MGLpr4Th3PeANto=;
        b=KmC5mRwwEm6xyyv/CZbmm9S0bX3Unq5144o0N8Z1Df2YtWd7eOBt2zk64TmeZlkVAO
         Rdq1pAO+Es+3X+v0PQt+sW0z1vye1luPq9j9UhxsIgmnr9hwLVMriAk6+7Wkm6f83b9L
         0QGVW/HQQWrq/MUzQEFE42UJn+rRbYXcKtqHwvoOvUvtvf7w7DqzrXMUcUqxsv2vZ/QF
         MK6DjAdAZW7s0eYwJO87vWcGG+t8sPl3dirIxLP5IJnRpV6seRDc44Jc3W4VXTJa9a7+
         sqEWg1ADSUyUehiDYmZ0Mc0GV3tN52jlDipii8qltXp5nBjIvuSi8Hw42F5FLN4q/1PI
         eQKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwclPKKNnE2k5Jc6zOMCHlACEmrhwfezNujfuRYU9Q5sRFJ0DIvSFSqPYzUQRjJGAa5ozA/1+KGpO3r7ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLODahR+OSDh/dmXugJRBmP7WYl89hecQi1lIzjl8At4DrXhA7
	xuS91Fjh/A98/tkddjm+vbaj8+052K/VxvuwF7NQvHng2rJ6jWH16Ckq
X-Gm-Gg: AYBFou2otrI3Qrjxjm1kRn1ESHDKa6udi3LfVhEvPLDIEkFfdLrQKeH7dQ0cpJ7oIhF
	WHX/ocehxXkmhlhMXLD19EEfVzcEkmttHAC3I1Kphlo+kOpmJdSWMbn5LyQhMOJlw/1m7ag3+a5
	5nEXIuvMTy8jAq590rWECoy2ajmJ8L7LEz5kG5gWb7VRQI2KvoWtuXjedmaxF9LykUYFlllEyzr
	GlX6idLv+vrOUpO6enkNL0jvOd3zI6hAlLqQOfphoOyxCAx9vuCd1+6EfbShXSYURNgXkkpCbeX
	cBBtpStbOstSLdPdt+fiwKdTh2RENjHN574uOGkagI5HmfkvFqljhONC5m3Yf+GGYNW+KbWJOsp
	Uja06PT1OgpmLVv9ddhlzewrwSu5xFJj8r2f8OM/qJZfyJvBCAV8+l8Wr6kJthGKflXaX0TDeRQ
	cV6XeNQqeVWY6MBXem9cVpvR8P0EZCFi9kqKeTcHgRE713gF6V4XCStfUIFrRYsMlKYsviJgz99
	gBGsQjRf6PiUiXu
X-Received: by 2002:a17:902:e750:b0:2df:81d0:7c3a with SMTP id d9443c01a7336-2df81d07e13mr112334595ad.17.1790604652846;
        Mon, 28 Sep 2026 07:10:52 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9140545bsm41966305ad.39.2026.09.28.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:10:52 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5670: fix double runtime-suspend on remove
Date: Mon, 28 Sep 2026 21:10:45 +0700
Message-Id: <20260928141045.2436838-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5670_remove() calls ov5670_runtime_suspend() unconditionally, and
that function has no internal "already off" guard -- it always
asserts the reset/powerdown gpios, disables the regulators, and
disables/unprepares the clock.

probe() ends with pm_runtime_idle(), which drives an immediate
synchronous self-suspend (already calling ov5670_runtime_suspend()
once) whenever nothing is streaming. That's the common case, so
remove()'s unconditional second call clk_disable_unprepare()s an
already-unprepared clock -- hitting the same underflow WARN() fixed
elsewhere in this tree -- and disables already-disabled regulators,
on every normal removal, not just an edge case.

Guard it with pm_runtime_status_suspended(), same as sibling
imx412.c's remove().

Fixes: 62ab1e325978 ("media: i2c: ov5670: Add runtime_pm operations")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5670.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 01fa892de079..a08bb4e9bfca 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2784,7 +2784,8 @@ static void ov5670_remove(struct i2c_client *client)
 	mutex_destroy(&ov5670->mutex);
 
 	pm_runtime_disable(ov5670->dev);
-	ov5670_runtime_suspend(ov5670->dev);
+	if (!pm_runtime_status_suspended(ov5670->dev))
+		ov5670_runtime_suspend(ov5670->dev);
 
 	v4l2_fwnode_endpoint_free(&ov5670->endpoint);
 }
-- 
2.25.1


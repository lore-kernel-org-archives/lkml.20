Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4465F357D02
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861788; cv=none; b=h7FfCQ6UQiMtkkEK5+fMKPMmacV8UCTdDYUI6lEWWplthp9P6Mwu7QxtE857SVxhhYk2agplbZI21H5Go/uKcUcKm2wdSCAMgAem5cSb3E6nfy2PZvhYUBmBobGIUL+WzjOGXTpd3pNMlTCq21BHzS81xyPqp5JCkkatS865pf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861788; c=relaxed/simple;
	bh=av/RqU4IhFO21IwA44CfzNfwbz1VFP6HnDY1tUunHXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8UfOJDj6wJ27+E4X1b9Q1mdY7Hem1gmdAeMrDBjridtRnAze9fFG7Dw99+Of6eRCpt5y9+lpU0DlYXV6E4xaYd48ozJBz9CCrjn/uu/uhhjzIvJRkJmhDb42ikqioQFH8pDPOZR6WOf+ZLtkH+Q7AQltLhUNRB7vYU/+dLnxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNdabwCQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNdabwCQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so1236425e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861783; x=1788466583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5qf5AyR14QicTi51SyKC35gs+EjRCOBvh+lO2Jaq7c=;
        b=dNdabwCQs7dSM4BQL6a+tjdEAxd3W1nT5yT5K/t/F54qmLtIXbn2dPTo1oL8lxSNMJ
         SOzpqQfEDmj+5RTzE+SYMM3SoNqo+yLUltAKfd4snqmWTii/G1ck3qLo9ahQnOsh852A
         qBggPWd/h4m+XBZNLYzfGUlXb+eRrgpUC34AI9SAIvT21myiPkDabdAE9k2oitkFqKds
         jTm5dXGT1/wcFryGt9EgXjRW43/OU0yOKg4JN5dCE5zsDeq+0IRi3g41kfFUZi76Vjzz
         kL7IpAYk656c8mp3ReKOOgfoqtcWFJzvXYhv7PHRE595mwapk+JwlHW52/0GpUANMe5l
         Ry8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861783; x=1788466583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5qf5AyR14QicTi51SyKC35gs+EjRCOBvh+lO2Jaq7c=;
        b=jlq/5ER/sRcUbtxjbNPKOUHyFBMpvF6d8fjqnn3zzRx8NV4UkoZr88WutzcgasdHhW
         28qnbDnfJR+upEvZIbG6pYn4Cw2Vclpcmw5nIJNRu3R5UICXtRVj2oijaEFdjojkdauW
         pBG62hAvq5fp+lCLxAZN69U9PXVRdGg3g6XvvCJVIOnNmB8zmJ5yxpFEFr+FXoJHS1tr
         HmAy3IhjMdGSCcRGlAMMJPngsWHJfDPb+d6zi+X5P2Pkw9rMx+nkmN3UH0ejZWTbm8MP
         mJC3kXBzjkxmReiIQYEcahFFxVvRrIvYmtO5D8dLq3kV6Q80V/7gp+8L5XXnKppoIYY6
         PhAQ==
X-Gm-Message-State: AFuF++mG+eUaS3hO14i/hkxVWi7iLVCgTTxOLzu11k2Xd3TP5qjxxs7e
	GBHDe/mBm+26D5UUMcFdCbcyqEDnezJxN++P1HRrIAhpl7clYy8QpYKxc1Zo2ikPF04kfA==
X-Gm-Gg: AR+sD11QC0Nka/TTx1O25Utcwp8O1dsncch6W1vEZyFEaJG5u+yOq/4uZp7MCaJAJfL
	OY0OKDjgCsq8MbnXY0HGy3/Q2ZkxAk65ldSboUTbtu8WpIS6Z5IJbAhyLmO1it5KpKkE7urbV83
	FfM80zcRANgWJZ2pNMAcheWMx8u946sl00af2skG8S2WLIVeP81D1rYwGvjoAUWDQFReFKOXsOD
	9Wlgyf+1/Sj9/AJkLmB1fpuTqB9UAb+0WWmHiXg1xOMCffCKEMiRmv812A3131HN7iQW2Gfb81H
	CWkyP0qf1xvBICEGtFajssrmGdWNx4LprqoUDaAKXZfVmaTjNKBYcmt5FBykM5s5ZTouIvyR3Vm
	Ymwam9QXDwHWUuysYS7e1qv/bEkiCszP1fRrtTooJxgurSzmDXO1Ca2OC63ivJrSc/Ib+OyIvHm
	uzbuZTAYwdVNyQ+l7Qk0Fool0GA4S8wI4G0NEKz9t0F2JdyA9SGIuJBZeI
X-Received: by 2002:a05:600c:1c26:b0:499:a79a:694d with SMTP id 5b1f17b1804b1-49b91c265fdmr24699285e9.4.1787861782563;
        Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v9 2/6] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Thu, 27 Aug 2026 22:16:07 +0200
Message-ID: <20260827201611.99825-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO lookup table loops in the probe and remove paths iterate up to
board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
the loop counters to match and avoid a signed/unsigned comparison.

No functional change.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..5baed848a 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -149,8 +149,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct regmap *regmap;
 	int n_consumers;
 	int device_type;
+	unsigned int i;
 	int ret;
-	int i;
 
 	if (!adev)
 		return -ENODEV;
@@ -233,7 +233,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0


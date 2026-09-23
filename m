Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31675383FE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174624; cv=none; b=mlz9QyXb3l/sHg5HyWCoTUEQX0bNDGEg6l2hsihQWUYMxRJllr8AWeou/6mAGCpuU4Wr9MjPdH9jvUbCV3mlSDECWFGyEmofnQ+QJgrHR47zluYXQjSHTXG9M4P4v5VVkxIkxHvD4P9R1E+oMYkFZ1PXrGxURxHdyAgFTKvaFj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174624; c=relaxed/simple;
	bh=nrMnlpMLPXWaLslr/6M2q9sRp4BcdeY1in54DpOsRVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYaIExHFZ32ZoAGtgyzF9siq7cHcppR/MGB5j/RxIcPGqLPn0mvewMvotghUOyNWb/iTJUU9lgn8BtYxMyp2WxTqAIcQyk8Lc851iYyv7g8seIGjvblC91wyX29GmbLmLTFFVhO5hNT77W2IBASi5AYu28BbiJS6o+naLgreodc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ib1t+F1N; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ib1t+F1N"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so781262e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174620; x=1790779420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJldumoCtr7gLsKe4gWLJ70gEMUxGdP8Se++jExg2xc=;
        b=Ib1t+F1NV85oBt5b/jEBO0KcxeY8FGp5CsutEMaRgStFFCJw/23sdgdJafkzWYsMLy
         JkaYBBtXRGos81q72kzM00hyuu8FvaRYHcQJxmWVoSVQlu2MJ/z8GhuZ9nhinf/Rgzl2
         4SXh92Z7TOZmhTwwhtMpAWs2wzLuGtFZc6JnX2MStzlGeHFEBacL0EZVebnth0UYVpDS
         xtm9l6oizeD7C+8R69nOFtaznS5lGi0I7C/f7SC/hclsQPO52ORJ7xFUQOzOzqiSTQVw
         oaP7wBIroU8yoXpw4Ns0AEKea1dShjEMbUYFWrTqeA2PawBMxR+5N8+p8w9QAUYZLnTI
         4ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174620; x=1790779420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJldumoCtr7gLsKe4gWLJ70gEMUxGdP8Se++jExg2xc=;
        b=OMiQtOZe91ENNik7qxTc5kbGeapoZvxb5Ys8BkXtAAtiBD8YWT2coLkWx9E1DWi31i
         E3e9XRhzXTalQ+SZT/SIjP8lehQMbnrMEKhvsrWYzIvUyJ98GOFDj2GODxrIQDFlkfiJ
         WsNGWY8kkM4Xr1L0t0D31ivj0425KDSGKl5RfyAaSYcZ3+7DC3UXsvWRRne0QojOG0vF
         MvGQX9RVXBbbhVts/ZKO9gHd0Cqw+j6E1rXGKiMz5tjHn+IWCmzxxGOgIqH3ScrV4Bqd
         Oujb0PYHXZfFZl1nOO0VFOAWtyvTIkolVYaMMbc+N8UEA/m1BQ9PtC3CLKCK2lh2f7yi
         azNw==
X-Forwarded-Encrypted: i=1; AKwUvBxG0i0cQEAtpGxIm3eSwMSR8pTUwm/Q/AEYaITWIe8hTuNrp4KqA14UqSN6YckByE91gMCUqWi6OFXGhlU=@vger.kernel.org
X-Gm-Message-State: AFuF++mjaR95z72ckX/xL06CMO5r/D+b21rCTUprW6X2/KY7RujUzFio
	hYGFjFBGGUn6q2hBpU9N9DaZQhdA2LcCxOWnDm2XpPXXIU9oRK9YcgTy
X-Gm-Gg: AYBFou0n7fUWIBlCTLh8Nmdx+++FW10+KA61nJwDyvRQBXAXTJZ9kpTB5H05hxw6jJc
	rbJavrmC0uZXMHXLWm/lihqBFFMUJcLNgtnq6Yl6ILa9wSR+pi5Vckq55CVy/h1fif+IpFYATlo
	hmYjxcb4u85xUgkBpOiY0ciubSYc/VDGbSc6hVnXuWDmqMSKN4SrAFVJTCVbxQD3pRByw+zlQSr
	sI7OlP/gki1nYk5v1MQL/JrbbnRuZCzcGtnGtT2BVumX5rkGXNwKIs7f81gWRaPUh3HFHz/C523
	oTH+zwqtIL8GekoVDsgkWSY7N1LfTo6siuF5551/n6RMSjSB/VZwkjeMcvM67IDIJaG+Cr4DAHN
	TtJLFdlMfYIakydyY+wjgvTEc1skO2aydRVZv0HmSIdC5OCv667jJ4tyXLM09OtSY8WR3xtCkT2
	QQPKCjkpYGwKMiCu3Ka47AUq85pRFqai6RY6D+WglaqxO2bN1qT5kihHv0oNkh445kaff2/Ts=
X-Received: by 2002:a05:6122:130f:b0:5c9:c435:e927 with SMTP id 71dfb90a1353d-5c9f159a246mr3262793e0c.1.1790174620619;
        Wed, 23 Sep 2026 07:43:40 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3566169e0c.9.2026.09.23.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:43:40 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/3] media: ov02c10: Drop duplicate register write
Date: Wed, 23 Sep 2026 11:42:55 -0300
Message-ID: <20260923144257.119076-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923144257.119076-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <20260923144257.119076-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---

Changes in v2:
- No change; picked up the Reviewed-by and Tested-by tags.

 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index d622f5dca..730a40e94 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.55.0


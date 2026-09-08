Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253C59D63F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908270; cv=none; b=p1C/QgZbbARYZIkQaowV/YpeebJsSjQcKizhMJr5D41U35v6XEB8HdVqwPASva0dDySKGn9lObxNN8jjKNlf2NFrOGm8tapHeYGcqSGFYZpL/ZYmGElZcwloYyZtxdTjP2PT8cK7fFdPvZeQ2xw6elVlSb4O7wZEidZssk80eck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908270; c=relaxed/simple;
	bh=VylVE97urOnGo1fKhA1IwM8dNjVc6rVPycHxhapEvGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVF366ainq3t/5Rjc8Kow8ujb3dvmCVbXT44Kn3P0HYLgJhJEFISKskY39WET16aRv2p1JdiAVkKkmTZd4A1Q6Y1jnQESS/wnPEfBO56K3u8XECpFdAOq9RSmaw+Z7g1zfwmeaV2hbtJezwE6sMaGSxOYwOh0JHXYh5iyTuC0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lj7RsMSE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lj7RsMSE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d94c868ea5so52179545ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908264; x=1789513064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=Lj7RsMSE6XdDJv7V9VaeMxnHvUyUdiOOUjCzRUFGjQLoRz4eRmlTUwCIjgbTQ3h6Aj
         aZo1omXRAYcfzR0Z6HVzazpMicUmQfY2E0+w691HH+1WV3qUWe5Vy3bdIsfuLMdBkj4/
         vxblWXPjMqszMiTCbMPJ7mnnVb6ClYjRC2S9njzrhxk2mfV/U57HmfNCh+Zi3Zf5drn6
         9oQeL+4DAC/A0+sW/HDar6vIeJmjEsszo4D8KYsl3EJ5CcIaRukFbmmpOgJYltMAiY+s
         pOvVcYkPLI3CKG6jqNEcmAqKjDftKnfMTjzrPFfRHGEXtAkKHvLGr3IsIdIQSy1Z2WDG
         q3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908264; x=1789513064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=P7LdnCu+26p7OrBDDuDz6WGt5f80FWwdh7MF1b/rOF1AD3TN2Kg73lAU2KTbkEOSiX
         czXUD9Tyd3NKuggMszmJowonSqWWXoteXBFCzTDfF2wYprhDzqDtXSJrKy9dMH4BgVh8
         ES14Y0kvrjhglNFJpEOqcumfKQmycroeHpRkNhDOp5AuzUBlgycpxi0suj5V4Kwhpsno
         I6OYHM9sLvZY8J6/smpxDvaWY/3ap2AZPqKPRZnJK3lZ3wajmYrxXcC3St5M5W3TQYc+
         Ewj6mvhi63Ip9nl6I9v4BWo5N8MTF/ge837+4g7WCsiAT5sKsD/j/RABRrIOl/e3NvuL
         gjJw==
X-Forwarded-Encrypted: i=1; AKwUvBwRXk5wBjgLd5wPwbheEwxMCJwC+v28Hv5nGOKyRg1o+MD4TY0QCXn33sR3yvH6ltikeKW42yEjuNPNh5k=@vger.kernel.org
X-Gm-Message-State: AFuF++nh+9AEcERlB/3M5oJg+b9Ac4vARjQnQPMMCO4ULhJF94JhSZ5G
	AeX9LvxN9OQTSdoFFfOMRy29/asTcD1o/o/H2FFrVO9UN85Ew0+bfiBl
X-Gm-Gg: AYBFou1IBsXtNF1r2e54jLAnvSTZedBqHl0/PaeUykS0WKk6J6vfavC1Xiyz+jGtQ4q
	XZ0v3Z6l2o3aUSbUT3Lbt4bO8nNOzZmx4u1Pq5iriRu9iTQTu02seL9YP1THG4/7HyLles6Dqt2
	xTq3FiXbZtgZa3CvEQxHoc8z9VaN7lyhFlMURZDSN1CQiA9CMQckSvUY4RyKBpP5QA1BpVoy4sS
	f3y4fHJphzIDK9bV8u0irEaHaAzCALaMdkkTQQoG33pjWZohMU8IyOZBg/9US+Haq8ury5Eflni
	aJioPTn5kL+CTXTOGZ1OE1w6xbvIifgpjsIoVWGYq/sQ8yC4VY0l+bkwO+26e2t4a+aMpmlBtOF
	SKgpIJARhmmgdTnUO8C4AEoIep9u6SzLb/cLIP1rDWhAEaEEDIE9vj+SIFQY2ZO7W/xa3SuX5QA
	Jf5vJ1vgBW2T7mRh3EgWS7gOfzJl441WghBUb1XOjBqG0LZRs6PxgRkgf5Mmh/5wcjf/M=
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr45595682a91.23.1788908263245;
        Tue, 08 Sep 2026 15:57:43 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm32982165eec.6.2026.09.08.15.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:42 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v3 2/6] eth: fbnic: expose all hwmon attributes unconditionally as read-only
Date: Tue,  8 Sep 2026 15:57:33 -0700
Message-ID: <20260908225737.3034403-3-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908225737.3034403-1-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All fbnic hwmon attributes are read-only and always present, so
fbnic_hwmon_is_visible() can simply return 0444 for everything
instead of matching on the sensor type and attribute. This also
prepares for the threshold and alarm attributes added in the
following patches: they are exposed unconditionally and reads
return attribute values.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 6c8c66ab86c1..38bb26cb8e6c 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -20,12 +20,7 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 				      enum hwmon_sensor_types type,
 				      u32 attr, int channel)
 {
-	if (type == hwmon_temp && attr == hwmon_temp_input)
-		return 0444;
-	if (type == hwmon_in && attr == hwmon_in_input)
-		return 0444;
-
-	return 0;
+	return 0444;
 }
 
 static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
-- 
2.53.0-Meta


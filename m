Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C853A887
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189823; cv=none; b=u3ltEvr4BSaQJHp0ckIBTtobk/rM/xo2rbNHZZmTt66uCwPFw0l24TBqnW85+hwwBr6GWfiLXn869EVdUraPd5ZCw9+R2LRKp7DqFqlf6KG1qkt0qzbDR/JBNqOHEGV7cK/Rf3frE8JYFKyRHLpZV7B0tem2k0YkFWcxrVKsBgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189823; c=relaxed/simple;
	bh=mevHerDxAKLPyGK7PyDjdO8JDnb7+zQTHedcYrahIco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gu+0hzVzvZPOfaRdWiZHk5pC1VkjElOcF5PGE5FTXJre132LleXrehHTlwTzKMQdPjaCMNtufl1VK2Ke6PjgghNryIS4An6Ltbp2T9jI3o+fZq+yyesItCINePaNByBS0FS81i30yn+fCU0ujBgnEzGIl2ZXjS2gMEhex4gDPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puMYtJn6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puMYtJn6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso37679715e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189820; x=1788794620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYoMZssjOXrC6IExZNNz+Kvm0ZtsijKwmBjJpQbsPjQ=;
        b=puMYtJn63nfZb45V47+O1kJ8YcQB6OSXw4V+rMO3LJOZQjDEyMQ9yHC5lKj/cmYitg
         kW/qqsZtGVTCo37Al1YZ2/EZljj678gDwIPXHykeGz1gWwgB3GBgljzVEptWDkAJ9FRX
         3RlO70QCcIfZH2G5uEwtkTYp4+Gbggc7AYKFGquUS74TQVxh3226chEw4MAZQ+tU2FkT
         /SAiIRH0ygM4VH8YoQE3rOr7U9P38pmvfV+asgYepBc/6jAy6pYN0P6lp4B6cXSUzJt2
         YaZn5tOJZQBFAdEgMmqe3EHUsrNnD+ppJamdr7/VxRD+cd2zbOJIgFpsAbfwkbzdGZuQ
         DavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189820; x=1788794620;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYoMZssjOXrC6IExZNNz+Kvm0ZtsijKwmBjJpQbsPjQ=;
        b=KFUey/JjOQmx8kzW0ZXPn87NNfIrhXc02iZxmbOxNE6Pm+vW31kasfnlPkY8df8naY
         UbnyE6BtQpLv4q889NGiA5CBnIwkI/ldkWztPp1iFcSqghdf/669oyU/QvbW7lgL7Rz1
         or2qchUyNwLOmoARTbnjBf/FHVaHmTnM+8sFHFHTFDzMI11byIC/Fca2k9s+WOJKTvUW
         m+S8lou7OW4aaGOBNvvpH3PtpqMu0W4ed0baRgQomwCFLGulWrZcbclZSkcsxQ2ikAis
         WFkJoNQu/H/gtRpc+hwOvNZKJBAbaJocl7Me2SPC7TWRvnC8kJCqMklKJ9S9rodtIuU+
         xgAw==
X-Forwarded-Encrypted: i=1; AHgh+RocmGPLg4pb44/UGd6jPzEYJkN1mdlVA85G6h2zaH6dhdd5MSxuosOuAruyICn0pLmk0e8hzA3h0MYsomQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mYg88mQrJpCPXcdu5dl4SYzd9WAJxLHrpmbpWNzHznC26rDLz7
	kV/biqDyeaDYMiXY0RY/zPWIvPQlfme53fHN/RYg29DJ/av75w6zk76i
X-Gm-Gg: AR+sD13neHG5q8XwQT7tjFbDPJoORgjpPZhnJ73bGJ7eRo5nuhdqkx/G1+1ylmDf3W1
	T+O5GGewGbc3QHnkGVydporn1thx26Zh+xHuA+hhn7sUMpU6F9ocnFWqinKm3lafXC53bob+k+S
	Rtri3kAWMY0nxzZsnTJ1cWkY4WwOM/ZJN/Lu850bS+SX5rYWgxOYC5ygI78dFvqXbQ1qjRClXo+
	O6D9Hs1KMsd/674i6G2ro0bsA7w/iAni6btWJk/5ef1qVHbBUpvjhkD6fF8vX/d1AdvVO1xTfQL
	kSkWDXOvojrA3SF8NzQHYgwaxsnGvwzZjejQiZVfGX1b9sxlojGlVaT9lINGB5AkMZv1hvscp8+
	vB5sA6urKCx/BARxAgWPkAqpZXcFreQ4ETUptHTeZMY/68T2+ZYKuK+YNXoywWtKZpKrvv1AOT2
	cxyIN40Ob+AG/EttXzLOs15A13rsfr3tRYN4H/MUScPey0R+kPJx4Fd3QIxpcBO2IWUvwbFgCjM
	hZiaFoil9PjnoOMn1GuA4s4RaCiOMXTRrY=
X-Received: by 2002:a05:600c:5d3:b0:49b:914a:94a2 with SMTP id 5b1f17b1804b1-49cd52f339dmr103342295e9.1.1788189820544;
        Mon, 31 Aug 2026 08:23:40 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm24234272f8f.25.2026.08.31.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:23:39 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 1/1] gpio: cdev: return EOPNOTSUPP when HTE is unavailable
Date: Mon, 31 Aug 2026 12:23:06 -0300
Message-ID: <20260831152306.166630-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831152306.166630-1-ivanrwcm25@gmail.com>
References: <20260831152306.166630-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Map hte_ts_get() -ENODEV to -EOPNOTSUPP so userspace sees the same
errno as when CONFIG_HTE is disabled or EVENT_CLOCK_HTE is unsupported.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9f3b628d5793..6dc01f7ea838 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -715,6 +715,8 @@ static int hte_edge_setup(struct line *line, u64 eflags)
 			   line->desc);
 
 	ret = hte_ts_get(NULL, hdesc, 0);
+	if (ret == -ENODEV)
+		return -EOPNOTSUPP;
 	if (ret)
 		return ret;
 
-- 
2.43.0


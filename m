Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510886;
	b=xeYekcHw3rLJKk49YdqCuErvw5vgOLopwb1/l6KnwPpmSWRuhst6tjzUbttgvLUAfA8A
	 bvhRi7Lwzx0VdbC0uBZSKbGSOdLk+VWTqV2RJzraftCK9qa2SW8PbemjIU812rcFA6UnW
	 /BPOwA5MBKKdI1zt4u9fY+h90ImHEaBPdJoKoU/RjLMWO8LuK+qwD93IbK9Bn+v9ifg9s
	 k81+9n2Ecuq/mtfNLG7teEzaDkEK17zbp/FzAeDqWcG1p6cJtp8mx2CfGKqLSaSzJ/pIM
	 mcEQR2hEmitO1XHwXpMmIR3ntZ2nxX6MNQyMBAs6Gtzw6w3AAmPfFjZBgn1NSJNDfAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I4BFOLPby+9IaiXUcXIrSNoWr2vqcdZumYeXf9DjvkA=;
	b=1Vt/d67Sts+fHVgSIBiV2F5V0/rJ4hCAG0yx6vITWFRuLYjDNPDKhLhiKBktA1cMjhLQ
	 O9i888EJzBtZqSKTSFeppgWMX2wuUx7fRnFlUI++Gp2GGY+DQobCiNYj/M3SonVWSryNU
	 zzk2eFR8kheAg08traX9pezrHEoN29ddgMq/JUBcJ7Ej/R3hbKywc7Qwui0H55GTKb7fg
	 lQndFYwFewjV41+ponZkzqVWQO3UxuFjYhj7+ZYay0pLi2u/N5AqvGLRAqE7qwbD4xvHf
	 5ChGmXRHMnb1GHUQmZgZ1HlerS5fMzpEq2PWzkqIJ/oqYzmwRtxzBy0I68QiwXmqtJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nqZn9Gb8;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E581606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E581606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nqZn9Gb8
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34025065e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510884; x=1793115684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4BFOLPby+9IaiXUcXIrSNoWr2vqcdZumYeXf9DjvkA=;
        b=nqZn9Gb8gXLFutDCN7T6sIcSbt+oJB5yqG0AmRok0ac3RqqCnqyVCe6sI+CaMmfxd/
         D25iDWH8Os2QvQkWKqEhgOwRGchPnMtrHg4i9k725HrzbVR8SYStH6sWnyRYA6lP2/Vi
         eowvYdRFDAdcCnQ3W3fP/TWa+FLYq320z6yWst+KFoisKbxJHeOYvzWBSb/YIh0n6Ylu
         vinWlpdHZUnQFo25+q6h5R/bGJicJVO6A62k16yv6hjOvQKltZWd1wp7hpCVjRyy79yo
         Ai5/sYUXqXGnSjV0ZzTQfO1e1nWIF4QX9S1vBNJfIXPMqEJF6MROYONHJUmO+HbFFuwP
         ruKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510884; x=1793115684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4BFOLPby+9IaiXUcXIrSNoWr2vqcdZumYeXf9DjvkA=;
        b=NKXxiC5bstqf/xXwdaABuhBj7/IHNUL5KrqWbrWJLd4mZX0y0fJpIAjt1+o/sgMrQo
         EJpD03eC4XGx07ossbQT+ChY7SoeoyQNO7DxxMiOUcLVHczDbsN0/ElDGBppLyPIfNzf
         3xSTLRoGCAe0oUQNSsmCxkn0BI2PlAlBHyClfvCkyv9da8GzgKzL3k8+EbaGlbFuNPGb
         r4QsJS1nrT57OwGcpLV//qzKBJk+XxF8Rnv9wBmZUI7Sx/1PQI8f2sn5Y1weYqzhtYgw
         MCmZsT5Du1b4zjn6CqzhGzwYlAHQgHcRyrToEmsM0gZha9DIOw3Wk0M9JmAt/SGoo2vv
         tGQA==
X-Forwarded-Encrypted: i=1; AKwUvBwcv6v1Bvpt1WaZcd9r/B0zUIkQihu/UindLDBxtiWf0S+V2fVRjKMSEnqCR9JsEB1LkKPzb6fWTXpwQcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvxGI1TF/381tjHv/0R3w7zTU+LYF5EZwNyL2nLJUzMzBFHZ34
	hMIv3wFvAFitjmK6j0LwFVFy3+a7gLyHZKsSuwUjzTzyJDvRlAUQoRw=
X-Gm-Gg: AYBFou1WI4GLb0Hx3oR+3YYPEabjzlpycW2UPvcAXm1gvSqoMyO3CIfoyVUxbFINZf5
	CP9Kh+TF4EiGscIi+5dxYEELDNk3bTpOxusH4UpxZIPVh/6qw9w+wTfXplfrE4Epsab42k2DCBx
	COx9Jj/0T7JPikqjmAD4U/uOiCwi/owQxOi6ZFWMeYu80GjMYDvndHoc06y4tWbLHe6C4pY5fwO
	Fr6ahH4BFha5wx9FVV+OLjTYCEjCjzKVG4MVdYaiVTO+gYikrgRGI/kALVd6gj1GtYNNzJjAfD8
	9vCM8r3yGMs267usXPX2zu4GbvTM/ZquJv08GP1UrtQqTKO6JeXfI0m7IJy+3ThOb8ALDTsOnte
	nORSTSeDgPdOVFnOU1v6+QYctmj+69OPcsDn3RIcgntygVyFSq3qUE5chnjHfv26b8khZGRvh/o
	sf6JAFX8DxOdZjYgxM6dkSN0pfix2yWfxq4vJXTWY98oT9eIfOfQ==
X-Received: by 2002:a05:600c:8b6a:b0:4a1:f89f:35fd with SMTP id 5b1f17b1804b1-4a1f89f3764mr37513285e9.24.1792510884253;
        Tue, 20 Oct 2026 08:41:24 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm256606155e9.4.2026.10.20.08.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:41:23 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 2/5] extcon: max77693: cancel wq_detcable on driver unbind
Date: Tue, 20 Oct 2026 15:41:16 +0000
Message-ID: <20261020154119.2568395-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020154119.2568395-1-tristmd@gmail.com>
References: <20261020154119.2568395-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The driver schedules wq_detcable as a delayed work during probe but
never cancels it.  If the device is unbound before the work fires, the
callback dereferences freed memory because the driver data is managed
by devm.

Use devm_delayed_work_autocancel() so the work is automatically
cancelled when the device is removed, matching the existing irq_work
conversion done in the same driver.

Fixes: 297620fd1e14 ("extcon: max77693: Check the state/type of cable after boot completed")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/extcon/extcon-max77693.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max77693.c b/drivers/extcon/extcon-max77693.c
index 2c567e0b7b7f0..a76084e4d5512 100644
--- a/drivers/extcon/extcon-max77693.c
+++ b/drivers/extcon/extcon-max77693.c
@@ -1251,7 +1251,10 @@ static int max77693_muic_probe(struct platform_device *pdev)
 	 * After completing the booting of platform, the extcon provider
 	 * driver should notify cable state to upper layer.
 	 */
-	INIT_DELAYED_WORK(&info->wq_detcable, max77693_muic_detect_cable_wq);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &info->wq_detcable,
+					   max77693_muic_detect_cable_wq);
+	if (ret)
+		return ret;
 	queue_delayed_work(system_power_efficient_wq, &info->wq_detcable,
 			delay_jiffies);
 
-- 
2.47.3


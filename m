Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4435292A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461349; cv=none; b=ics7sV2X8D9S/xiyw+lHgRohGkYBs4wP3Y9shDZUfL/eyxrpEc2WKvE6HFf5CctoT0AZbiBxTq1MjM+Jx0foU026q8J3EUWZc8E5Ybvzi+tPA7r5v+1iH8Ga6tHK2EuoG9JSBPo8y6NeE3nA5PWsDe5S3U/tMWhC1zIyNElAZ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461349; c=relaxed/simple;
	bh=OM/p48Qc0aO3PcwqIVzqa8+f4RK6lv3rfeLufct8Tg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0hC1jOTyC8pXo8/u7tU5zhBrCckgTroxqrqsvz9huFF8k4LqNhVhX7FZdDIr0KE61CVtJyL3A/Wm0bbua6t55AvKkkHtyvmnzP0K/fzycVu0z4nZ4swHEk8zaFjOswNnMXpwEwMLXfkSy/+6A1iRhE9JgEqVIL59uSHcI00UJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8Chn+4Q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8Chn+4Q"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300816so1713715ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461347; x=1790066147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/IPwSIiNpzASsj4SkKRZI8zUj5CTEryEYHaO7CYib70=;
        b=a8Chn+4QvGWgj6dT8mI1PV87sr/HTz1CtptMT4n/abBqbfXwsCWlk+wYwgGLL+3fTR
         EKHlHDVAARQDMAUMTQu/t9S2x7FpTfmpIP7S90aWozUR1ZwM05fWzyxrOhq3Eg9RiTCG
         TYXxN1L4hP9XFUJ96FSMgo+3pSDvrZcsru/wCAOKK1sNrdS/noYJtYl9Dt8iTan4ANwo
         yB8KiHtAHm2TcVC5B9DE1HtoAKrPHF54kR9V4so+zx0cwGyq6UpiMrca9A9sUUiCwqKy
         6IHDF3OUsnZcbGMpaDKgSUR78aXuRWtb+tZuPZJa5sWJJQEBugkUMXb0vWi9VP4A1knh
         Vw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461347; x=1790066147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IPwSIiNpzASsj4SkKRZI8zUj5CTEryEYHaO7CYib70=;
        b=BlToDw2lxZ7TuZRYTZ9hnXeugNgGEd/IY5RHVAKfpMsgNIoFHO4ilJMNFiDpeWGp2A
         oqnSPBcgP1+LAqletNifAiSvSIyRWP1xTy7jgRj6TVR8xNSi8jrfObocbj71UdFB2RnO
         zwEsBYArlNaXW7Ep3H7+uliJQraQtGCjYKX+jg15lygYJLb30MBWjTvSZXiaqp2SMbYL
         bOcvbqUmj/91A6m2GkRDPxqKhvj0EJxlzfTqGr1+F6JNdhcP6R2h+pmY9oOPhUOKHcie
         rQY3R6ottdOIAOCmmQB9GLlD8URC8LQaaabtXOdsYHQeX3ctYSumijg+a+8pKvU8aXVl
         0KPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXQAPu1Mav8sCKajJVlGRH4Nh2Qw83KTzB490n6s42GqEzRE59rFPG0jGtFC59y15po3htti/EsQeQT1I=@vger.kernel.org
X-Gm-Message-State: AFuF++lwCPPAxo20PIJlirzC9rzZArrcnaq8IXWVDkhEVGEb2h1Xb6Us
	QC0SKODBHwYNhfwEnjgI746wK10PQVudY/NJTQf52VFHMrjlTM/fbItwOsAujbNH
X-Gm-Gg: AYBFou0LWyaRB47ddNdagFxAYPB3BZPzVq9OY1eAHCHjAsYT+ysMKjuDdTuxYq251WJ
	tpWHS5xX1UvAkyw15ILJp6AMLv4m9oDBH475UAPkwASJ/+g1rLhMB8kC5QfMePyUd4qzk+8WgS5
	1zn+VFfBunGu4xn+o2Sv2vN4FsLhB5rzL1dB7KnEkfVBwj65EbFq3XzDFqgfqWlVLTtAnjhFpx3
	NvzTg/xMUUpJCaosPvQWhQ9fj0e9AoZSbqHmSR7cD/5d6dmGb2oOZQIu2uQGlwLd6pQmNb4ONfp
	iJOLh604u/fSlJ/I5inRLQVk9yO3skPOjjR5wJjgIkQxnBtA2TRMcMQMu4OJGnPn9P67jge6l28
	4o/lh2ooRTpOaXETUaJuSCrxUhMxlBRzAVFgJDllWdOgMSmbhq/64X9ZJyG7gHYpdPuKf3O4++d
	Q2w3GdjnGAvzYIGUlEK4kdQPc23U8qOZhMC/vvwFE0JqIOoL1++STEgV62b0ZWyNgkm0Fj
X-Received: by 2002:a17:902:f681:b0:2dd:68a7:d853 with SMTP id d9443c01a7336-2dd764ec710mr35774085ad.9.1789461347173;
        Tue, 15 Sep 2026 01:35:47 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm62294745ad.2.2026.09.15.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:35:46 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: og01a1b: power off sensor on remove
Date: Tue, 15 Sep 2026 16:35:34 +0800
Message-ID: <20260915083534.2290587-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

og01a1b_probe() powers the sensor on explicitly before identifying and
initializing it. After a successful probe, runtime PM is enabled and
pm_runtime_idle() is used to allow the runtime suspend callback to
power the sensor off.

The probe error path explicitly calls og01a1b_power_off(), but the
normal remove path only disables runtime PM. pm_runtime_disable() does
not guarantee that an active device is runtime suspended, so the
sensor can remain powered when the driver is removed. This also leaves
the xvclk enable performed by og01a1b_power_on() unbalanced.

After disabling runtime PM, check whether the device is already
suspended. If it is still active, power the sensor off explicitly and
update the runtime PM state accordingly. Avoid powering it off again
when runtime suspend has already done so.

This issue was found by manual code inspection.

Fixes: a95ffde28783 ("media: i2c: og01a1b: Add support of xvclk supply clock in power management")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/og01a1b.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 1675f0460969..1cece90c59ee 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -956,6 +956,11 @@ static void og01a1b_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(og01a1b->dev);
+
+	if (!pm_runtime_status_suspended(og01a1b->dev)) {
+		og01a1b_power_off(og01a1b->dev);
+		pm_runtime_set_suspended(og01a1b->dev);
+	}
 }
 
 static int og01a1b_probe(struct i2c_client *client)
-- 
2.43.0


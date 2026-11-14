Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672782;
	b=oJlgDj8VcOpTFrzsqaQk09bm32XChI+kxwb09oo2R/eKm3NkGdcyIKfd+hPjChSQUvot
	 V/rvoA+fntAOumT1zmcwHfzIfMb0izQBwIU2HjN19FL1YPwhExl+7DdFzg0qH2xUUFzZl
	 N/vGQOaFeEBXjs14n7ryPFFOw/2MVXZcSYbBL0MMUG2kQ9zbkANmrJlwwXZ8CDzOQrR/S
	 +13Vs7mZUwkDvCLgFf+u6LDKioc5+u3u7FwcWQO9khE4tDdMSpQJvzFgPETBSFemFEphV
	 yXKoaQkjgmz7bEQtp2mFDKuHmJvxGEShEypMpPJFwIuc0TsT0IM8H236v/fpKGygLzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=56atBSeIj0Xj40ZEnZAWbn+Pb+5L+CHTI8/bHXYtQms=;
	b=bmBUW7QJqFynwSNz8N4fU1PYtlcug369qaX1it/w5cLrqoNntMlM+BciXgSgpOPk4or4
	 zhnqvM7nDjFwLB7PLuGvsTqGH+UYrZi4M/UyZeF5GX7XD4e00zZ/b6LWokt2Y28fOhb7O
	 tMvG8J/hGH7+qXANo9+DYDwK4u1naiIyKhFP21pNzBrw/7s4tSwINVAbUmrW+eIPNC7TW
	 EqSb2kG718rA2iPTbFuhiLuLmv0/N266UOPeVD/aI6FpF2jvuiYrTcyBIICnYSTwpAXFK
	 WwHuqZal717joEAp4AsOUwN8ik3dXjsHIXVthNunt/HHqWEBaP5IYX6HoAgQqkL5I6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffB9CRnJ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D85606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D85606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffB9CRnJ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so15540125e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672780; x=1795277580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=56atBSeIj0Xj40ZEnZAWbn+Pb+5L+CHTI8/bHXYtQms=;
        b=ffB9CRnJj3ttnJ2dq+N1itpGNB91i55wPXaNLifFqo5AD/6vCWeyRNAk3FNMJVH54w
         wfhfxwYzdTUmak3aVgZtWR5HyI6bd84TVdivh8z2+Y+dAphZ3ys0xGxaJzpRmuLqxU+p
         ruMeHx407LwKUvI0qAmPdzAsXr0pfYuL8xB4qATr/khCdimDa0YbszErzkxzLwkEGu2M
         O7/nn7RoYaVFy/50e/j/pMblpiavLopMw3RlReFTD9Vs6ySRinTcVnMue2HfI9d78syV
         VlSPblnjqxWhJ3OFYN3Pix8qIKmuizpJbNUWihOOlotZ4M42cokp1OIvDQl/j1P/DDN/
         S9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672780; x=1795277580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56atBSeIj0Xj40ZEnZAWbn+Pb+5L+CHTI8/bHXYtQms=;
        b=2E9D2lByXBhKneKejWfxedJhKxd6tNNDZeg4xBgbW+nkt6xmPDaUyuEijYhL/Kc2Ts
         JzsGZoptmgBvHqXgprK3N5EAYPLkY3M9E982gHGZU1IQTudi7T1oXYz0CGWyCsxC/Eu5
         BvhMvR4yL6X730hpCOmMPuIDgHw/PClm1U5tXKmeHf5UeR9yHKd57OLO3dkEPU2MfVL4
         +cjLBusgjoJvRPKFokc/+5EDxWR2IaK9Hv9EyaWTZdsxbAuC92lo4xa3HBvqp4K2LEjq
         DK3QD7cdYORO5AeLZ8z4F29sZUP9dH1u4yEhGXx032Mhxhdch49D0lZ+kZH+fIiHq/jS
         0rAg==
X-Forwarded-Encrypted: i=1; AL+hErFLGvUARG0spVjBj5zPhQCqE9DAdShQl0dnmEs6mIT7z/HSuaJsK+d4yY4rB0dtSFncF2loSjNo7Y+8k+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I87JOIqxdL2szode20dOzSJ4RsfXLpfS0DT5HaS6Y+OwtnYsH
	7qLubmx9G88PMVWtKvu9VUUVr/g1TzKDFAPpKEBCRAIt369I3qZY8wf/
X-Gm-Gg: AYBFou26KlD3MRVyWKNY/ipT2a8UYWRYF/9r0SqNCMCKqil3yo25N9a6MWtHgLgz8Oh
	YSp3q5RJ6x9vhwfvtYHTg5Juccmd+ZnVIOMuFyp0atxBCXWTNx3BmUG6dJPd+EqEm5P5in0LjY+
	M7Xkj5fluOlkNhFp5qW1RG9ezWglQjiQshqAgZBd/CGfNVdGUMLtWS5ZuXU7oB14umxo63IkyyM
	dK3g7cfATBQfA0FQBzVROBHZ84O5X9LZVWi9dl3Sp2OQnr+bzkGOAAO1tWndCJK7eVlMyuy7trd
	OrNIXePkWK0CvGLRTUmkoXwOmRx7YQ5Kjkb+EgL3Z/pWT1jJSgTdBW1JpuiRMgMNWQwxuHS2r6F
	6zdkLWuhLyu62qV81PkzNgPz+pCRVOuleLb05EAX5pqiXKWhtapCQa/XJqwg6aC64ClEVfyreks
	HnE8j/f0/IyZ2PkSrhJucv1G8jzFDc4owIClOexXn9YOHbpUmqvmkJHhlyUXk/cQdPPYuwgmbnQ
	LApoJYqPHNsdqWMFhY8VKFv9P37a8YngKAm517RsE6NAbTte61jA5XQNCnIngnHHHlKIIGcoM2I
	S+LVeWcPEHK+4ZQ+Ah1HvXk1xla8Z2i6+0TKstuh6P7wP1fUXDmnBnRA1NpR06xfRR5CecdqISC
	9LXfhCkZZkjRR/O5q/kLHGonjlaeFTO+04qWJ
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr122972675e9.2.1794672779903;
        Sat, 14 Nov 2026 08:12:59 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([197.45.81.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm101786405e9.14.2026.11.14.08.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:12:59 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	obabitemitope765@gmail.com
Subject: [PATCH] gpu: host1x: Remove unused host1x_channel_open tracepoint
Date: Sat, 14 Nov 2026 18:12:23 +0200
Message-ID: <20261114161223.3017-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Nothing calls trace_host1x_channel_open(), so the tracepoint is unused.
Remove this unused tracepoint.

Fixes: 6579324a41cc ("gpu: host1x: Add channel support")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/host1x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/trace/events/host1x.h b/include/trace/events/host1x.h
index 1b6aeb7b177b..30af7ebd724c 100644
--- a/include/trace/events/host1x.h
+++ b/include/trace/events/host1x.h
@@ -28,11 +28,6 @@ DECLARE_EVENT_CLASS(host1x,
 	TP_printk("name=%s", __get_str(name))
 );
 
-DEFINE_EVENT(host1x, host1x_channel_open,
-	TP_PROTO(const char *name),
-	TP_ARGS(name)
-);
-
 DEFINE_EVENT(host1x, host1x_channel_release,
 	TP_PROTO(const char *name),
 	TP_ARGS(name)
-- 
2.53.0


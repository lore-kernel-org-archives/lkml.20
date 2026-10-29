Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268982;
	b=ztKfYubbaBihLfGRUAG6/lyAPNUOeVEqwgpNsTVZwj9Ed1gN7HMOQPQzsv2WcZrjPQJr
	 ovajDgWSFZWEg79NbMNSSbVZ1tlLeIMpvKJfBd3/B4Z+o7sCWbp9cQsPUQjXMs4Tg0S9S
	 gPi3FjAP/ZdDiXvrBbE2wz2VlFe5CeujA3eRsBNjGb0d/J0ZXHK7a3ec99Dd72kYH3EBe
	 DoouYiRvnpKEABXVchhkIMwn9IcbbYdc/k7K1o1kjkqsyClNKbhuDhvQc5lIaFcaoT4OM
	 Jut0xHw0wChl468Vxi475DJ0M6FIfZtvkhlSndVfnW/eC/1unMsCf364kaQ8iyEneKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PCVSLB2dfEwYf5cLFxpRtRFaPc7z6iIc+xw9E2dK6Sg=;
	b=lqSZNlKwwnsMqZxhfz9LEIT39Cyb7AkiLN29p2yc96E5Cq2iz+/uJsMM/fUTit3F4dku
	 YRId+Z0T0hCXde3yFO1eT6lJdAkx8hRvu/ZR6IjIxXWfGRF0zRJgEQdTMx7WGK02Z0IAk
	 cmyTJICFNwO+RNFL3HNrVUEw2fyRP54BBYYW/j4rpcx5t93NzOH1NgMmEVzSE21Jm737p
	 unzeP5niw2ElFrl88a8KlnFQMzxC0ood+OyZDAzD1l3uaRgZ0boA7M6dgUBOmlDMxuAHd
	 DUI3KbiIDHf5klpkFyAxbJTI8TjXi8TgWPRrnCT1Kt67fufyMLttDZOa4FrsEgwd7RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFEvauol;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474EB606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474EB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFEvauol
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369f33df08eso3615946eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268981; x=1793873781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCVSLB2dfEwYf5cLFxpRtRFaPc7z6iIc+xw9E2dK6Sg=;
        b=vFEvauolT2yRc0WJSaylrmvQYRCjUo8pz/5Z7ncrW6IVuaUj5+PVelKSQ1XcJDVEhK
         gKk8QJpUcHJTEj/PI5r+vTRl9e5WTWGPc0ssnNjBz3h8fXZ5wTFHRv8QoANQn9VE4vcK
         Gx0gDvezaHCzZfhzkhMRb3TnesVN0JD0PsU6Ac+UguXR1BELGP6jY402Ftddfx9MqQDm
         2LyWLfvxjRzOuoALM8cVSbqOnPuwMUrzRjOaLXtEq2hSRT0RUBC+A8iEnFQBHE+fL0Fc
         PPv3puwLNn0KSz6C0hcePZysE2BjvZszbqUybztn5o91jMsEdbT4frH918V0p8iQ3aBW
         GNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268981; x=1793873781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCVSLB2dfEwYf5cLFxpRtRFaPc7z6iIc+xw9E2dK6Sg=;
        b=EpYDdR83vFIPGpCSv1gPsg1T9tpa1CDNl0nlfiCK4T0ajYjTxg137ZEGPu65WGo9VJ
         04GldSjUP3qgklo6cK+ueA+hpSjzJJSvBeMmhLEopjj+w0TXwylVeNBS2TG+5YfwnWdJ
         zMBATeYRl09uYoKETJqrnbdckVLkSvVKu6woUilVD2jTzI+atEJlbTaVWtnd865IisoB
         v8VFhwlofi72k249IwyX3SEQJctvk5tKXQ/NHSU/OUM9T+ihUMAanb38xdHLMpD043Nb
         AQUq/mQ8qV8N2h2LWMlOUAVOhuU97Bk6LIua0inLpvJpdPANp8gl+OgrgVi2tjvvmQ1t
         WCbg==
X-Forwarded-Encrypted: i=1; AKwUvBx0vDNYzd4teyTITMLFpOjaZhVBlQWb0FNM7PwLswZ7RC4VVncgzgq2kjyOeyzk2shUXsepFbQc3GZ+f+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG+5WRNroMYUzRaGBqBpuvFLdJ1uPaPtYneaI647HtIyLwSp3b
	6OKWjFaRIK0fdsdLidiyUvaPLzhiDeyt+o9CGcPmkkzZ9N5DdEL9ORax
X-Gm-Gg: AYBFou3ebAb8v1LYR0fD8Hpc8ZlBjCEWJMhZipAZgaKPIu6lDICafnCEqFX4blwdbel
	SeV2JHoxWgGKh74HTzcXok7vRyDPgJvsMpnJWST58WwH0K/5Aoti8N8/B+vkJvswque5l6ovMEk
	qJHLiFAZK05tkfuskJ9+wl795/slHG2yK8rpT4qJfYZt2BFuI1Iair5PqFt0rArnYOlcjyC4NAP
	m0zbxAFw/8pTJXo+xiTLWOfzqqMzSuEVSWE4fusckx0iZLW8Wm4LsgqaLSnU24rS+ogVpGl7Rro
	WJAizSzdZphW2ZMSGwBmGjJEL48q2MZKlZlSZWbMlhiE/CoKtTlRtOubQ752vTNUipApRhpBqp2
	OjQptCX2jC/hRi17SJ69FdaC1n1bgaWroH4XZmbsfzToA/RjD3cy2kuEmpi/2C1P9pnRzaJdRIe
	E7VNY9tS79jCRQuDdN6eRS7X38vkHCG/2xrhQ5WmCRhN6isbNbyHOqUhNu9a+3pFPl6aBRIceg0
	elMkMTvi8ztEEyk6g7HfEP2OQh0cuBs3yBhvVDDk52DGl9dhAOd0z1aBuAezcnnlSD6cP4vmJxM
	0F/X+Qg6T/JBuZko2eJr0d7yMzU6lGUsY8i79KGo2yL+6XwRixh1
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a20139f87mr7445407eec.30.1793268981113;
        Thu, 29 Oct 2026 03:16:21 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908542sm16729398eec.10.2026.10.29.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:16:20 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: o-takashi@sakamocchi.jp
Cc: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] firewire: cdev: Check return value in ioctl_get_cycle_timer()
Date: Thu, 29 Oct 2026 10:15:45 +0000
Message-ID: <20261029101545.3216-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

ioctl_get_cycle_timer() ignores the return value of
ioctl_get_cycle_timer2(). If the latter fails, the output fields
may remain uninitialized, causing the caller to use uninitialized
data when calculating local_time and assigning cycle_timer.

Check the return value and propagate the error to the caller.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/firewire/core-cdev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 87efd65e6b00..76606c37d212 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1316,9 +1316,12 @@ static int ioctl_get_cycle_timer(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_get_cycle_timer *a = &arg->get_cycle_timer;
 	struct fw_cdev_get_cycle_timer2 ct2;
+	int ret;
 
 	ct2.clk_id = CLOCK_REALTIME;
-	ioctl_get_cycle_timer2(client, (union ioctl_arg *)&ct2);
+	ret = ioctl_get_cycle_timer2(client, (union ioctl_arg *)&ct2);
+	if (ret < 0)
+		return ret;
 
 	a->local_time = ct2.tv_sec * USEC_PER_SEC + ct2.tv_nsec / NSEC_PER_USEC;
 	a->cycle_timer = ct2.cycle_timer;
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246886;
	b=NXBUr4x4fC+FlMZ7HMO0rYFCSJPkm3ks1YsDb2+52y7qs5dZ9mfU0XiEJVecZSt5oKdZ
	 RoEfyGHMEWsUXx0Y7LAt7QiapOdAoHjMQh+bt5IPvwPMDkJEMXX6invPkTLDeMjZa6Cmj
	 4tcGq01z1xbzAvwRHREM+WJBFX/Z47sB7/xMTo/L3yWeB9x2QrMxLxRGofHRwAYRa6841
	 yH4jqR75zpIUR4moJwtbBTgVeGA5j2HeowjTnHMSLBlf467lkE2cEObNMt/BdJF5sLs6s
	 xFmdzoPweTng2J3Kb1dQwGkR1Ilj6+zDnAsWhwj5GFo08VxxEk+9Zixv4cE+BMOCVmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nwyR6TxIPEqjKF2oJPWcQncPlh2G58YufELbU9iyGxk=;
	b=bvmfQ3bwmPxOOZAWlwb0syEMtlfXrY4D+iYYEMk4H1bLrWRHiA8US8ijuPqszcEdvxK4
	 mSs3GesEGLiEEw7NEd3lhTqEMP1RLV/hrRVldto3pQkIeCzqMFhi/iDyIQKqYeMcK4PU8
	 rU44TQtb19QeAo4dlAgO0Cf9cSRyu9V7CNqwqKr6SxwESjyl5WT4CvWfIXk9WyLvPdZo6
	 QNbzTJQQfa7hu5UzcfQKQOLUJUU5T5IaWyk9GMiQbO8M1JVw8JF1EwOVFq/DfXECfb9VC
	 cDU3+Tk43+Z+A3jdTypS4Bk0ltPG5xSSXnGRy8XrTd7l8t2b5NVdE7JlAfNvrO+ykYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+TQMMhp;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A11606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A11606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+TQMMhp
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f269e335eso128987685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246885; x=1794851685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwyR6TxIPEqjKF2oJPWcQncPlh2G58YufELbU9iyGxk=;
        b=U+TQMMhpJVS35K6a85oGim4U4eTQTREEagwjzk4kmED+5wpKqvfzZkSFCwScXXe1m4
         kjdAtGYjy8SWBwT2u4PHbhavJbmDDTqfK7TvfmeKgBZ/U5cXm/CvhuqkVZjLR69DDjcK
         ho/t4IQVJ+Wt7EC4rE614AObzpSuz0fekm0vpwow6ZKSvOv9zpVyuepIdyxK4Cvo+R3z
         dwGgOoGROo5XQvhH70PeS28gW3IsgdecGScnJ9I+bx07n43PTnQTZtjEYvWV5c92IpqK
         AkReWxURZWUE04Jeis82SRBOtWps2iyQjnl5+FSmC23cfuBn0lMvoNY4eYa/btQYyKRh
         zwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246885; x=1794851685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwyR6TxIPEqjKF2oJPWcQncPlh2G58YufELbU9iyGxk=;
        b=Ip2ns3H933oQTbONOigehffT5N7ai+IDoVLsvGcRxUxIkkaSNMziha1j1tlGCRjXfY
         y3igxOSgCIm3R0bSHjhKKe8sCKLOrpMjAnfiLzNk+KksCqCQGvj0ah/PEzETqpHSbGkF
         C1B7E0tNePKYDBb5ZFeO7Gx7xfhyciPPoHEy+A38T9qSzHjCIlrb2fq4gz208bFVHWkF
         E5gwz/2VSZeIhLGNtL0DK1Dyf/HWLWGJnOHgDm1CI/C3XPuNsCc/5BVX6o7M92RthMSE
         n/QmjXkaP/NZ//PrMYsiVQH7ePUh26lm5qbzyJcQj4218h8F5G+Aq/5NYfnjBpTRlXxd
         cCiw==
X-Forwarded-Encrypted: i=1; AL+hErGxs/rmBE90eXVmwN+Q3/gskDLK35eRXeh4nsaqyAC529PxE/dcXNwGc6Ul5EIO3f/ow1vkLoRBSgoRYGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LXQc+iMcYepU7T4lzMdn4czwovTE70v+l+wzAl+QQj4yskQSi
	0A2DSmlVwfuQi/G+bUh3/Sjs4wyJg4l23mj/FemIYD931eYXbrx5NFWvWcKRb6Ck
X-Gm-Gg: AYBFou3lHiaW5s4cPwUlW/sj7Y605UvuNH0liwODmpnKkYRY7KfNr86fWZ3WLZuRoeF
	hJ6znrkGfRvNAwkFbCIv2g8KxcBq102v7jAB5h2z2+i9+BrPopNfFYIOqXIYkpC85Ih/t7ki9jA
	N+0VcuMYylK/GgZ00DDACjRUK7VbyB7BdjKeeJEu4NYKLgVMz4TfrjqNKFEWrAcKADYW2t9v4Me
	0nVCSWCTSu9W4tDZzjZBoZi5sByHgpN17EB75MrE1r2GTbyOO8Q3gFzVSa+yJvmfCXY0AKPOckW
	cLWTkUCgsNaXv38irX47k3PjfqimJHnK6P3/rHooopKHRKpU4efMvi9/28fKPGgDVFO79Z2/4kW
	Sgcc7uJkryFwruvZ9BU8p+VUz/hIRCxd5dC0x+UPm9ULgwc8aZeXb+IoWQYEEAMuCMjA/LVyEMv
	ZHx7/uunkNxa0n3IxavClVdB8LF7SBXM6B7ezLBKkqijc1Uwiy3iqacYS6xdARJpf+MIqSRCifa
	4P6k0rYzQiRDRuYrq/M8l5+0LitXlfIQofiPAlMkZx/XhMYvPw9qg18d6i9Zpp3GYJ0gh0TcMme
	fgUrYZDLNvBqCaGOiQ==
X-Received: by 2002:a05:620a:4509:b0:93e:fa30:f1da with SMTP id af79cd13be357-9479f33c0damr31442385a.45.1794246884777;
        Mon, 09 Nov 2026 09:54:44 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7dc398sm25843685a.35.2026.11.09.09.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:54:44 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] memstick: core: Remove the host ID after device_del()
Date: Mon,  9 Nov 2026 12:54:41 -0500
Message-ID: <20261109175441.1180468-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

memstick_remove_host() removes the host ID from memstick_host_idr
before device_del() removes the "memstick<N>" device. A host added in
between, for example by another card reader being probed, can get the
same ID, and its device_add() fails:

  sysfs: cannot create duplicate filename '/class/memstick_host/memstick0'

Remove the ID after device_del(), as the error path of
memstick_add_host() already does.

Fixes: baf8532a147d ("memstick: initial commit for Sony MemoryStick support")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64) with a test module that runs two kthreads
for 20 seconds. Each kthread allocates, adds, removes and frees a host
in a loop, under its own platform device as the parent. Without this
patch, device_add() failed with the error above 3713 to 4442 times per
run in three runs. With it, it never failed in three runs.
Not tested on MemoryStick hardware.

 drivers/memstick/core/memstick.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
index 0d15f48ef51d..98057ffa1bf7 100644
--- a/drivers/memstick/core/memstick.c
+++ b/drivers/memstick/core/memstick.c
@@ -562,10 +562,10 @@ void memstick_remove_host(struct memstick_host *host)
 	host->set_param(host, MEMSTICK_POWER, MEMSTICK_POWER_OFF);
 	mutex_unlock(&host->lock);
 
+	device_del(&host->dev);
 	spin_lock(&memstick_host_lock);
 	idr_remove(&memstick_host_idr, host->id);
 	spin_unlock(&memstick_host_lock);
-	device_del(&host->dev);
 }
 EXPORT_SYMBOL(memstick_remove_host);
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


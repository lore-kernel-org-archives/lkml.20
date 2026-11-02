Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622544;
	b=CzVjq/XUghHxaV8JFiZJOig8nej41Xo10k3vbN/St2pvXxrKnxbLSMu15559KThmDaFO
	 aY1tfL74JJoDk+F51uLQDnlnfSosgSH0JXhumKoob4v9wIU8cyohPM5YPzpn8iJpC2Nr0
	 hcJSfTHaEVKt4O0i2zmnflaVSytHUQyAvSzoIYorPy+kjQfxLxY55QYrkeETCicgavdrb
	 /vi7C5vWpS5dxqe3iSvO3o8XIEhh/ebNizx7IEag2ud7pXqXbSi8Ai0MJH6vXlbrgIpYc
	 7AOQavQ9M8D218YApoCVNxG2YYEXbO5ylgMAkbkJD0d9jlnMNyysZ0JjD6HrCY6de/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GyZdeAbOtqkzbSkUpNh0d1h4qY0XMF49rbWHS3d1uig=;
	b=lyZvodl3Ve3sPAn281a+TFGUE0lvAAH712ZTOT3UwvR78orOUcAwGC0uddp0lqyhq46l
	 gg9S32dOjUa0JkwMiQpUBkitlmZDD3kxPSkBUuKMsWuw9boikuh5CEn7M+v724rxbE19I
	 Epuus9uRQqmW55t6yM8XxqZ+rztz1z+CgjEDeLFXZ9YMCe/O50+L9ZdEhyFBife5FlXPb
	 geIGc5Eh8LYUXyVMp8qrMfEp06Z7aiZqSlYUTQkPKtB1OKMIqMII2LhAcaC6pCjiSsIdz
	 jVsLVkGDZYmbInzpUJD6D557YNG8zeaEQs+JAnMATJOjKrjh5lecjOQBX8PvUhjpbZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pyHd//ED";
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB7606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFB7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyHd//ED
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93cbc3ab2fdso135911985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622543; x=1794227343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GyZdeAbOtqkzbSkUpNh0d1h4qY0XMF49rbWHS3d1uig=;
        b=pyHd//EDO6sMRs2Eyv6ArIF0S4T1nBQcyGYd18mQA307hK6Vimkn+eYDIKYPOIJBAM
         LXZfltIBDZVl7x4q3WusCqF3CP58tgow3o+jZy+rK3khMQ+Vnrwv0BVkNxxbF39M9aD7
         vHghu+6nvAkoMwcA0FuvwarhhzR0NdsijfTDW8yLPjfqYIxVTMY/Ep/iCM0rdWpOlxR1
         X7NIasuPZommqxVzEg89TaBP/rn/oRXufZRevaEHVbzgmy+3RhWUxrseqyK6h47Kp9i7
         eqszrKLDltlBtWJaTGy6m043A+ad2DVnUhbO9nK6qRcKN6wdOUR76EPbqIsAePqvmiHh
         5W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622543; x=1794227343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyZdeAbOtqkzbSkUpNh0d1h4qY0XMF49rbWHS3d1uig=;
        b=nAh5HMcYiFK4wPHAG+CWLs+lE5pBzIlBgLzFtkco+tW01I3pNKgzfZ5llpozhFXZSy
         P6royLnak0jzK2bAoy/ejI2CxZkL9+VaYp4Jek9Oczl7E1WEa6MM24TkHW74uqIVvIuA
         GSffV8tCm7byb+B4IaCoyaJ3SL+1X9sGTgJgCsmD4zqCgc/HU+Xe/YTv0edXej7xJfBz
         cGjH4iuJIlLjorR6nrykBgrGGS7JY7QcMb7lSeln5qBoqJSknZD9+y1sAFIJdJMAFYD+
         MHqUh2UdNwkOX8Xn95xRk3vDBN/ozePuR+SBxr1RA+2iNiydksv2T9WCGlLoWDNJxlT6
         ub1w==
X-Forwarded-Encrypted: i=1; AKwUvBxVuKAX9lmXzSJ/LxMSRernwEf1AJKsORrYYahDWGGaNFD4//i+vf+Nq8or4K0/4E7FjMSp27iE5oo306U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjR+JDv1FKXfzIPI39dRkFsgMohs23fo+2ICIB5OXwd6BtTYXs
	mWG3yz9RqrNDfrZhqZqnWQfhB2zXNUpAYGe1vSedSgM15oPiAwOBnc3+
X-Gm-Gg: AYBFou3ZblpAunDilg2s0OIuVA4mL3cjT8heyBKlGsUbzOhOUt058OpepKc3iY+ZUP4
	jln0xQjyFobdLEGIM2rRk9Mgt+07ogOwfpb4uhhNmbk535fTJwS/SCMKivClioiSc7kY8i9BeqF
	OfAqaXD8vyFfmSeZxnlDFYBgUTHRqx+wtisOrkC4ARW+uxaoqACUPGjFMYge0G18i/eoFDkIcpE
	HNsTfiGRMMeAUoHvEW+cV47lrWaf/Za3q2QR8JQVmfjMs40ra2tVuRehrT4fdpLFaoGHkGzkAYx
	YZXe5AtoCJN9/6jiJgRZuZStzoMxZpXDRzOK2gK4eR+OZajAwWbqIs6kMWTBR+neudwXFTu/Vx5
	PGjw9FEA7h9qw4JIOFNfH6IqvbiVoCmqe0GyTkE/YKkzdB4Ol5rAMzLybF/Uiarx36ujaSWZWL/
	/UStuVwH/KA/xOIk/kW96jkKBgy9XfW9sCLRzV1uCe8QrrrS0qzPGf0oUzmm18R/7m730aCH00f
	t7YR9xQ/3Bab7Qzh7N/HN3Iofu/zK3JjHL4e0nh8G7DjyqH8bq4ZY6I65YloeJVkCzJ/HISzoMF
	p7KopoZU6h4p3BsOUon0GlE7fjw3Z69r
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1573777385a.73.1793622542751;
        Mon, 02 Nov 2026 04:29:02 -0800 (PST)
Received: from fedora ([2409:40d2:102d:42fe:94:1c18:1e05:91ee])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425852274sm825390585a.19.2026.11.02.04.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:29:02 -0800 (PST)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sajal Gupta <sajal2005gupta@gmail.com>,
	syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com
Subject: [PATCH] md: fix use-after-free in md_attr_store()
Date: Mon,  2 Nov 2026 17:53:04 +0530
Message-ID: <20261102122430.39209-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.56.0
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

md_attr_store() calls sysfs_break_active_protection() for a "clear"
write to array_state before it calls mddev_get().
sysfs_break_active_protection() does kobject_get() on the mddev
kobject. If the array is concurrently being deleted, the kobject
refcount can already be zero, which triggers "refcount_t: addition on 0;
use-after-free".

Fix by calling mddev_get() first. If the array is being deleted it
fails with -EBUSY before the kobject is touched, and if it succeeds the
array cannot be freed until mddev_put(). The -EBUSY path no longer
needs to call sysfs_unbreak_active_protection().

Fixes: 9e59d609763f ("md: call del_gendisk in control path")
Reported-by: syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dcad997ed2b5bd95cc5e
Tested-by: syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com
Signed-off-by: Sajal Gupta <sajal2005gupta@gmail.com>
---
 drivers/md/md.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a802..26f17dd24bdf 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -6163,17 +6163,16 @@ md_attr_store(struct kobject *kobj, struct attribute *attr,
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
 
-	if (entry->store == array_state_store && cmd_match(page, "clear"))
-		kn = sysfs_break_active_protection(kobj, attr);
-
 	spin_lock(&all_mddevs_lock);
 	if (!mddev_get(mddev)) {
 		spin_unlock(&all_mddevs_lock);
-		if (kn)
-			sysfs_unbreak_active_protection(kn);
 		return -EBUSY;
 	}
 	spin_unlock(&all_mddevs_lock);
+
+	if (entry->store == array_state_store && cmd_match(page, "clear"))
+		kn = sysfs_break_active_protection(kobj, attr);
+
 	rv = entry->store(mddev, page, length);
 
 	/*
-- 
2.56.0


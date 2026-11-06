Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991726;
	b=UB4RMH5iy2Jdv3l5mr/1xgn+7YEYSADY1DNG19W2xe7Ikl3omDF9uR0L2nSwISfjcyFO
	 jutsZuOWzQl/i1MTxq7Rc3O47IiS7PQLm+BRUYyl+z3OiUj+duQojrtjft4+f5gAkFzTV
	 vXG6tKx0yPoOPth9ydC+QfnDkIrnchORQ9rPeR+dOX8qgRT/PL+DWKPMuW3fyHJAOA9Z7
	 Buy9kDuHq+29FVONUJArpXto23E/31xpeawdwn30+SKTAuSQnFPizVcp7furzRMs366cJ
	 uraAs/ZOBs8KLl5ErwCzWrXHYIQVJLuoVQUaP47AL9yfJ/rqVDu/6lDomxCk9LDVJRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pYGk1FmNeczBhQn1UsPHPRZrRnoHl6R7CQH1054vTrI=;
	b=UwrwgYzknQ9djDvfQuxlRn1E3vR2v3H0EHvjix4bX5vlKSJ7uYdAC/xj44NmkLYeuiqm
	 ynn2zW9/w8OptkrG+0zdkrJi5544NlAyX2aMZiiVny1Llyg/j3iszkoJqtNslYxe0ioG+
	 aCD6gVAUTa5CHmlIKxWTUN3KChxcKA2eY4SPm3EdZT7eLQFCX2N4slCIVrDvlHknxEJFw
	 jwYEHra/DaE3tccbdQyQPIfnALCstH0en1f96jWQj4/4QglQSXnkp2GGhzKMIJWdq0jqY
	 pLWvCYu2wwc9Nxr2iENLMAmoLuE8nQYB5Q8EJ5ikoc764OD+KQOUCx1DK8qLZ7ayxDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sB+77iAN;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FF3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sB+77iAN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso7350275e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793991724; x=1794596524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYGk1FmNeczBhQn1UsPHPRZrRnoHl6R7CQH1054vTrI=;
        b=sB+77iANu4sBWjq5Yj/DnEHrpn9VnrFWqHUW7OkwAaP5dLc8utiQsZqaecQaKOdGOX
         Q4+YLZPOMKYqvmOABAc90Vccr32jqVaSkOBSxS+s/+AsTxePDtP8XmblR2dveY8+/to5
         mIDAhZEivhtnUi4ZtXSwwXSYZ9dwUNTgZOKuFOhYI/HaxFUpoovbO4HKca+AV5ZsSg05
         FGP+lReTTOoEA2viCc/mBuVGHtXkY2t1NIT6/fdzKdPMUxloD1TpWuXq4wWIvNrKEc+5
         yZE9OJyfk5M4Jbsruh3NSL4rwpNEexNUJrjbJO1xLbXq+Qos8Jxpx+tW2cy6kmhGx9E5
         oQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991724; x=1794596524;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYGk1FmNeczBhQn1UsPHPRZrRnoHl6R7CQH1054vTrI=;
        b=EnWnl8SB7FRBUL8q9smWHBY6XyM6IEm04tiCYVQwxzryYajPdjUElbc1sbRLQsEqXC
         FocBiM6JPKFgliChKsBO/7qxY7ORbOckN3SCPwW9Y/EiGYnE/2RvjIKfbUgiG6tz76Ov
         V+VWOcMH7FKzX8pcgjHl1VoUzPvnQrsPrKukVYhj3WJqZfvHyl3j9M+r9yIKEKyD1Mrq
         pDTSgweaudJnRWvi00q78Wd82Xg3ddg1BBD7ggBIBzN7odH2zFVmW4RR5yMq9NMK9v//
         vlRlrYeG063tGLNMqtAelwlGFdr2SrUEDHMOEzUy9P8OG35jEEMrFSUYPlj9JJLGa1UT
         O10w==
X-Forwarded-Encrypted: i=1; AL+hErGHN0RZJNYnfhryAOgIJ7K8ZjnaD2msuC+ux8StJTLY5yhlL4H3FGV9+MuIe103fsBT3hdey3myCGdXRuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TPKDlGm4cZQuJhJaTRN1yQW7LFZuJZ5k+QQBKnXNMYEthgikM
	6BLthFAG3G5zjx3f5IuZFGOn+oM/ftc8cjHmOp8fvIWdqwbdBuIHkeQ/Tgeakvoo1tk=
X-Gm-Gg: AYBFou0T0mSC0J5GtblyOd5RUGE54gBFIg3dCWXw0PSRqEtD/ayLbY7ErTw9N68JnXz
	eoFczwBqP5cAQQsgsCttqCMFErEFzfVIfk8lff2954jCEkjkxio+dHpMDI7mlJPc9Kx1HMlNqal
	l/rNmBKfI3JEsl9PWbpprW/L48+DbYlMjiLpx+Jwm7mhHFz1Lnq7IRS0HwIwP5unLOvkCKtEs4Q
	9njnTbmRvJaUZhMzpVHmYaNrGG+IaUFbAEi3socUCg06zlWO/Wi59BOnasI6elcnAtkCJhCHM1y
	7apyPpA1mDU1Ivs3bEGHrxjpOeMaCA+uZ+dQsOPYMm0H9FVf7xcwlcp0SzgOPxRkaLND4JQopIR
	rxOYQ9Lt5ZBA6dHMM9texdn6lltaDwolQ2pSeU79D9mCF0FNKOzRy7Q4mJaQNPCJs8QedTdvCkw
	G7qL3F7/JxCsWUgmxQBcraWL5a0Rq68ZnEdIOGMSyE9lmaHzyKjFGdtnxxWJTmzlfanwJSK5Lpu
	Gs+wSh3acpRMQ9w88KxAXNePsOi5Dk0mHMTyLhRbEY1srNFdmY/NbJDPpF/g/tvNN+yB7XtmmGt
	Af+YL2ebxE1/39pDoZV0DDbcvIij
X-Received: by 2002:a05:6000:386:b0:490:7fb3:cb41 with SMTP id ffacd0b85a97d-4927527d892mr6225482f8f.24.1793991723615;
        Fri, 06 Nov 2026 11:02:03 -0800 (PST)
Received: from metepc ([138.199.53.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d72333f9sm5175028f8f.29.2026.11.06.11.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:02:02 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com
Cc: jiri@resnulli.us,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] netdevsim: take device_lock in new_port and del_port sysfs handlers
Date: Fri,  6 Nov 2026 21:57:54 +0300
Message-ID: <20261106185840.774601-1-omermetekaya0@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

new_port_store() and del_port_store() access the driver via
dev_get_drvdata() without holding device_lock() or checking for NULL.
The sysfs attributes are attached to the bus device type, so they
remain accessible after the driver is unbound.  Writing to new_port or
del_port after unbind causes a NULL dereference or use-after-free.

Protect both handlers with device_lock() and a NULL drvdata check,
matching the existing numvfs_store() pattern.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: 794b2c05ca1c ("netdevsim: extend device attrs to support port addition and deletion")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 drivers/net/netdevsim/bus.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/netdevsim/bus.c b/drivers/net/netdevsim/bus.c
index b792ee10b1c1..822651e00776 100644
--- a/drivers/net/netdevsim/bus.c
+++ b/drivers/net/netdevsim/bus.c
@@ -93,8 +93,14 @@ new_port_store(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 	}

-	ret = nsim_drv_port_add(nsim_bus_dev, NSIM_DEV_PORT_TYPE_PF, port_index,
-				addr_set ? eth_addr : NULL);
+	device_lock(dev);
+	ret = -ENOENT;
+	if (dev_get_drvdata(dev))
+		ret = nsim_drv_port_add(nsim_bus_dev,
+					NSIM_DEV_PORT_TYPE_PF, port_index,
+					addr_set ? eth_addr : NULL);
+	device_unlock(dev);
+
 	return ret ? ret : count;
 }

@@ -115,7 +121,13 @@ del_port_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;

-	ret = nsim_drv_port_del(nsim_bus_dev, NSIM_DEV_PORT_TYPE_PF, port_index);
+	device_lock(dev);
+	ret = -ENOENT;
+	if (dev_get_drvdata(dev))
+		ret = nsim_drv_port_del(nsim_bus_dev,
+					NSIM_DEV_PORT_TYPE_PF, port_index);
+	device_unlock(dev);
+
 	return ret ? ret : count;
 }

--
2.56.0


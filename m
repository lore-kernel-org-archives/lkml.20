Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357453;
	b=aGir3VgI1J/Iq8HhGdmQJIBc6RI2636F978gxotcnexzIXBCod+rA7fvbhmAH6q7XVfl
	 2kcPVE7rNMVM2ndy66oVL6qUHRfOiKHO1XaB7MlrhIRXF3uLfcX6klgv1hWcrSLe+Ewe/
	 CCkoEqB8R9nJiOCl451i96aiuw4896ytrBb7cZ9xwuAlQ4tIN9ZJnSaDPHe/pa8jhtQSc
	 fWvllKqNbDr9hPtn9FYkBhyTMm6y4JwOeBI5CmtAVZlzGiOZa+6bZwTp9fRiMFt/ya5+M
	 k372nnpQMg9uH8w7Tfijnk1YF39GrB40v7TQ4vj9ezIYCQYbBYNcJ8xZbD2kmriYXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GzD45p78gNzTa5aIk9ID2PyH1503C4udwMa1Ck4JnCw=;
	b=IxdPkD94jMuyHXWxsle2WnHNPzKHE6+VY0KTZJTiFWqpX3ZDi4jfeFK0Ic2UtVWe9L2L
	 bcZTUnabbt6kgVIKR+DV2OSCZ72P02IuKNPodTxZQSDPgT2+2druHTMkvlawEy6nvQw2l
	 tNwj+4KSPLdKU/fjTn7tgwUZONmCDCPPlKLseZ2vlrkDo6mW/iHYhKxF5SWi8W0+xeqRB
	 Rgg7whi+4j7vlOqeP77ENAAAyWgLSoZ0E2mMrbz2i2R8USF1GPvKn2jTPlZsUtnMBRWGn
	 0H5PBOISIHzIVpa3idsPvd4NBv4+yYO3yR61z2WoGu/+aEokjzd2yYbrl5qYZhhi0xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phbBjwmz;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F0606B97A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB0F0606B97A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phbBjwmz
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso903334eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357452; x=1793962252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GzD45p78gNzTa5aIk9ID2PyH1503C4udwMa1Ck4JnCw=;
        b=phbBjwmzJ1KSYKgBFMuNBKYOO1MnWiVOZvjQiJqVyeAzTJCdH1X7VJJq4RzLvz0Nl6
         OvR72MGGpaGKA5eke42lp1VvaUpC3NBC10M1sAOG7MeVeGhSuuNgllFkjOFFypkPVUJW
         hXWpq02071rYk9fCyh0m2B9U3FxMM4xFNbylHekGY2O58gNdtz6R/VdjulTXlCAKW4YC
         WkB6DfFTvyV+f5p4V3y7APBcedGTlNLHm9LYBhop68lyN/tUIhQ19xrWWm6akLELCS9O
         Yu1sIzNxvuQWOCQmstwqRykXiac0yPNdWVk/5OZC6bbOWdFYNHzcxnze5668oKjzwTTX
         ZMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357452; x=1793962252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzD45p78gNzTa5aIk9ID2PyH1503C4udwMa1Ck4JnCw=;
        b=FG8QJTAF4HGAgSkA5n+6FqvydieehprKraKN8T7r615SH/3F32utYK2XniwkkNIb57
         SGIGKbC8rS3Sa8OaSMtgCrLZMcNZhvyDbkteXhGWFQ8gpGtKIKgm8w5dGHKkdSECHVQg
         PWqlVqDLP368lxZp3XhTo+vbN1g3VytD7zVU4nJFHlrsEVyzVmVR20LXjz/gbJRm4cW1
         0EgyXRZq8NtGmzGQTwUjBt9GVautJOVj8LJiDtP5jKqUJ6fudWBTUQXA1fXQa+vqehNS
         hCveCBUj0tsi5kRqy9GgcCBhxa8MSud9JUEe5LYScFrMP+RrHYQ2BpOKdPOF/i4kYa6s
         ylxg==
X-Forwarded-Encrypted: i=1; AKwUvByqTmRangI/WSNG4VjwZj8c6AQ51ac05TE7OQemio5Ccc0uqHFb0lmDunGeDyv/71p8wwoi34Z2Of3EsKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNSVLRUYyagE+SuLwOM2lhubI+73FReiHCSK6K3kVbppE3Qk1P
	xDyKMM4fidnTW9klhWwbApNv3wfUhYkW1qX/sk7LOfe8pyzsj5NsxkJxxfNjzA==
X-Gm-Gg: AYBFou3azzSPfSf6/4qV4Z4440w3x0OSHoeo6r25Yg5Fu84jZRzunCcuQoyTbEw9nMx
	UmErnPb1UmYrIoyd1A2DFW58C4TmQ2KmbZ6TQaGTCL0Rnps8yjclMkNLVc3FU8QMIR5OdNmX9yM
	v+lMMQEFw3Km++Hu81UAJlw7+ZJwdDYK/vtBuTZ6skP9YSJpmp69P33PY49V/xxR3Rk7KxxVnP2
	Ry60X0LZkrAs7/xMmaOycgi8L8jjg/eFhZlzLI0fsQ8Rc5ooVKwQpD0n4RWEzHHViDO6KRsPmys
	YexgAkfphh7g+4Yh+qdkMmlrtkMPUVJE9LWtwVlCCN1jK+ryQeqMYFdVSVaOfCDUNBHTNCmJMgE
	TugydTVu4nfoQo37BbvlIaiaUlKjcxuwvj2na3Ft46eSDB5leVm3NOJiBW+sbDQHmzhpu7TwOQd
	e2UkJUzuYlKZNHv93MbV0asISutP3iJKUhKqqheS15BADQMa/1jJl/kUwCZNZf2zlOldCdQ/xZA
	RXgqM6yLrICuDKqcyX97MYVFR1BiMdIbRK5yXN3PjGAX3LHtkk+N2eHVggNy01mXjdkf86WSYET
	J92GO5rJdkUnvi+P5tzPvqUgC7K/Tpi149yTU1f1CSi52uGTawtDXg==
X-Received: by 2002:a05:693c:639a:20b0:359:1b05:ed30 with SMTP id 5a478bee46e88-36a42203bc1mr3128900eec.4.1793357452078;
        Fri, 30 Oct 2026 03:50:52 -0700 (PDT)
Received: from LAPTOP-LJ15R92N.localdomain ([49.43.7.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm6547838eec.19.2026.10.30.03.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:50:51 -0700 (PDT)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] rtc: rv3029: use sysfs_emit() instead of sprintf()
Date: Fri, 30 Oct 2026 10:51:18 +0000
Message-ID: <20261030105118.426-1-akshatrawat095@gmail.com>
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

Use sysfs_emit() instead of sprintf() in sysfs show callbacks
(rv3029_hwmon_show_temp and rv3029_hwmon_show_update_interval) to
comply with the recommended sysfs attribute formatting guidelines in
Documentation/filesystems/sysfs.rst.

Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
 drivers/rtc/rtc-rv3029c2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index c348b31928e9..33b73bbcaf52 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -601,7 +601,7 @@ static ssize_t rv3029_hwmon_show_temp(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%d\n", temp_mC);
+	return sysfs_emit(buf, "%d\n", temp_mC);
 }
 
 static ssize_t rv3029_hwmon_set_update_interval(struct device *dev,
@@ -654,7 +654,7 @@ static ssize_t rv3029_hwmon_show_update_interval(struct device *dev,
 		interval_ms = 0;
 	}
 
-	return sprintf(buf, "%d\n", interval_ms);
+	return sysfs_emit(buf, "%d\n", interval_ms);
 }
 
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, rv3029_hwmon_show_temp,
-- 
2.56.0.windows.4


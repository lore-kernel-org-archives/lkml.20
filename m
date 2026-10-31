Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436426;
	b=F/zadc6FwFa1Bny9QMY+jRpLdixjSUHCJegzvkgUgo2sUUCMIZeOgVmFaCb84yf3K+8G
	 6SsWeX1vSZqOiOn6MALL0QbEJ4iN0kTzAQFXmMKvW4jNLwvzvQ8282b8b0t4PLzcqREtf
	 ibFHKGtonwKwTMn1uyLmXDJ0mwyGujPiY4kA+ErnLte+xGUzO/QcvFM/aJzsNK5uhvmdA
	 mU8DjDDYIgAOOqCIKFoG5l6YxG7nVY7Q6qMNDBDyLbiyx6gHofEbTJYvtNBT8KrOVs1Nl
	 OLXRhpbbskSQbG1Zg7Nli0qBkd4ffiZqOlKopvN08m2d41/oiRZFo5efT/Bx98en9GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tQZ+SMI7bX5fVz6VQ//lpX/hBzSPPOS0UylhAHpyrgQ=;
	b=f+xdNNKoIgsogCRoQ5MH+Lnm40XmOAhOUk6Gfee6QC/de+PyNW4cb8zLxAkSazx1nl+D
	 ++9BjFHp/5KPk1KrzpH9nTbUhdq/gGFA0e0xBpKhaFu+jHBQntHatn7ytRqFd57p3BWgi
	 +LSlzpoEOFhjkqPOLUFwNIOhYZMS48HbnNB6QeKYsz6GvwS55f07L8bm3M6zpnwMoVkLv
	 csUXdN/gzl/K9Nrwo0fi4AxB9NJxbHU/ekFHne6763lg2IhTSXU+1+JdgL7BWsSJoUhFF
	 2ml9fovAr8AmT66Mx6EW6iSAOWTnE8McT7IfNA5r60FkpB6vwpO4oyBFRGdpDkZNJGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ug/lUxyZ";
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23289606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23289606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ug/lUxyZ
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-369f3e9e431so1173171eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793436425; x=1794041225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQZ+SMI7bX5fVz6VQ//lpX/hBzSPPOS0UylhAHpyrgQ=;
        b=ug/lUxyZ74PliptXDM5MTNx8dWypa/F2gaM+lxD+zjIQlXP/GA//eel6j/LsA/PXLN
         Jm6etJFR3I498VAiBSAC0JMJi92VDDHa6FenIKT0TjShoie15feMcbjxu6vLmZyNLjp9
         06uBUDnp8c4g/aW8N5qIMip9iGuVCcFIfpkRV6Ao4d9crM8S31OKg/eeEdlEk66stflA
         SCqFNcfN79laZ3+XAmtJragmuXDbOxNaUXv0Lla5gdaU+YrefFO4OZbcXTf8MiqoGpSC
         6S9ZTSzqLkI/OHJrl8tDodYyjC7K4q5EbGu+pgXHSErc/ndn9erdvHXSFlcrjPk1BNSj
         I0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793436425; x=1794041225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQZ+SMI7bX5fVz6VQ//lpX/hBzSPPOS0UylhAHpyrgQ=;
        b=OV+O/olx/0s6r9wfutHkU3gKgABhR8cSekqjA80EBdsR0oJWRcwESz8Xuqo/GeVaRQ
         YJ1o8yLRWRFVBm9Sc94U4OmxomQUcm+K2j1Pji4nmrCkK/HPBJpzuVgZR3yjmMuT7m7k
         QdbcuV6L59vj815WBcI0jhOQjNL1rfqedHrzK26DW/Px/0bUISlxMLHG+evAna+1ixrZ
         C1ihTCvDJuo6n95UXOf0C0GTN5d8NgeU+JheZCNjtICd6jv1q6L9j3Nxi/4xH5YBV2UT
         cS0A98Aivo00hiZFNGTZ9yKwznityax7JTdw0gixtnrGK6RdPw5zm0xCHjgtJLTd8qYc
         gLow==
X-Forwarded-Encrypted: i=1; AKwUvBz7XAi0M92qvGsjwkpq3ziRbVJC9MzyZF3ZXVajg0gVn67ZCJy7UwieVj1BMtgdagfBuvrMEUNhG2OgpD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWlbplGoqo8byBFL9DZPDh6GUhC2iLzfOzZAwmWn2FvwBDOKjM
	ZGBxyKRTsgPuR8qVZd2QmJmQaISKNieo/eGH9O/aI/j+x+JqiaUNybkn
X-Gm-Gg: AYBFou1G5JcmjJHWOBIWKjKqQiywZ5ES+AjgQmr2Alrfoyz2ovQBjCEIFPY0OwZdkX7
	1AcD8qYF8kmKz+AqiLns2ra2k1Nmg76dPhalWa86Ut+kEYshXt0nkqJG/78nBn5+Qdg4Te9moGV
	ljb5mFnWqEpFpwDJMT+zxyZyh3noFGU4DO/GG5L0l2HWezo0/u5pV87dbSBgIRySqna1git2WuC
	mnFDqSWDoCLcehszcCbtzc0ICQ8qHNMRY/lB6IKVUh8pVEAruf5aiCsjssJK6i1sFKUvV7uTZfE
	fcY2W+F7exTiBFCzCCHfvYUfXBpUs9Ja30K7mdJD/hubsoq50/tmooVdN7QdVJ+ehxNdxDdriCF
	fltAJMo2/jlcOhKAx+cQ29ocs/q5tA7VM6chgYx0E0yyGcmUXTO9PiQuPTTm8pln85t9MIkGarq
	R+E5wuYTNqIgtN03rINFSNvAB0WsmWI0q6oHNbrdiFjBcC/idvDV04npGOw584SUiBd66CLNls3
	NSc4WUGGCrwEt1zIVPa+hGFnQea3OSHoPaAbNKshy6QZJ8DAheyh4wzEw7PH5fjvzuQxNucK8cW
	oumhr8uWqUIxLEzX2QIO+RFB69mVBgbFTiY0QKmBbjW/pjRtO9t/xdRAnT1UIe4pHZyQkFFI
X-Received: by 2002:a05:7301:5408:b0:36a:1446:4852 with SMTP id 5a478bee46e88-36a30008540mr10632884eec.5.1793436425057;
        Sat, 31 Oct 2026 01:47:05 -0700 (PDT)
Received: from 49152.tail67c8a6.ts.net ([170.62.100.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm19952736eec.16.2026.10.31.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:47:04 -0700 (PDT)
From: Ken <ken3009le@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ken <ken3009le@gmail.com>
Subject: [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
Date: Sat, 31 Oct 2026 15:46:48 +0700
Message-ID: <20261031084648.213333-1-ken3009le@gmail.com>
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

According to Documentation/filesystems/sysfs.rst, the show() callback
should use sysfs_emit() instead of sprintf() or snprintf().
Convert fade_*_show() and color_show() to use sysfs_emit() for safer
buffer handling and consistency with other greybus drivers.

Signed-off-by: Ken <ken3009le@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da..2689f9a75 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0


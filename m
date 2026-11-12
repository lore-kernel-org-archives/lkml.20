Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442889;
	b=Q+10HTTHepVVsz6QmnXVIYviCap+pefdbRrvKbSQggIt72Iztk7Zvp+hlCt36kvZ3Web
	 O/9x675wIluBzliALJSGD/lMAtHP2Pz9Py9OB+Fz6a3g+CICU1fav4fYdM/w2VuPXCWeP
	 Puqzr+FaDcEapuxrm+Qkzkzq7NwfaR/1BAQR5j2MDnrfbHT6v0aaxAgDVRpfkle2Fd9u/
	 18Ny943krjeipGQZ7tMX7EtSRybHmL5WAXz6tYUInIh/wmVZ7r3O6A+XyCAEFho5R1Ezw
	 cLoi9a/Mnf4DCplRpaumGI4f1+D0+bzTv5PHSX46hIv89ciaT38t7n7FCX+MFSPKKnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LI9uvWE3IMO5HhS0brzUkXza2vMATY/vaZhZVTquYOg=;
	b=ODPpvEoWVIHMOSDBW8BezDENpusZXbPk7kQJciK3K+nnsssr3MI0vnErbT4i/j22lq2I
	 oSMPospnH/S+vqRTlgByQfDRHE6j8iPWWCuDfwqZhP2SJu8Tv0HUi77dGRXVW7YH00AQb
	 5siFuxVdcf5g+NURS+SLaR+E52vO52NoQfEjJlhOWNBHStaWJ0hud1zXGDrx5VhcPpDp+
	 a+8lxL1xzg43yJlVLOdT8Ku3WgY5+snnWmaiYPXGTw1LVkT8oPwWz1qptp0/WscfeL3x+
	 TP6hrZgj0K9gW603A9SEKwweqFenFa54znCK2vbfYo+ITkjzJL3Swy9LtTeNvV0pwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS2Sl6nP;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6C8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6C8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS2Sl6nP
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e55db58cfso333284085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442887; x=1795047687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LI9uvWE3IMO5HhS0brzUkXza2vMATY/vaZhZVTquYOg=;
        b=qS2Sl6nPQC5yLWfuX9EiEwpuykjbfjbJ8ngdKlOkuPx70wrphU8cXRLnTBk3RoeWOD
         uJ6UFsYSO/JGPFJXQVLMdAcV+0wyCWFkPuQ+1Cm6nB1eSp6amMxJkohOWRYGgQjiKaK2
         BAYBDRSCgAy3YAM9kSDLdzMQzttS7EiA5lO9iNlwPcwf8QjDnj1C6hTAfVY03dQuebR3
         5jL4nuiZj5BMmqTDGyxRZ5vw6l3hwAlenCA8YJJHFjLEglV/B/7fipcn6Ff0PkqJ49Ex
         qSCOD1ROK0Q4q9fZQb9VidPP8aB+QqAThnXSJDMf0EHpxhsikcQn7K+yczhRIOblcw47
         6N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442887; x=1795047687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LI9uvWE3IMO5HhS0brzUkXza2vMATY/vaZhZVTquYOg=;
        b=qK7OrEZccgwDZiJAYDCT+H7E5MDzLJDY6yJqgDr91aWd0VqlTuhXnt99coc0he/zeb
         dax+5yX0zQh2oevAOO71MoQDteLaos/s1NDIvxdD9ca8JihmAgqLdOIrkvoZfvDDQbth
         f6q+KzEQ9SCcwpBK0Iyuc+0fBGCXyBykoICiDs9niAFDVuOlgu9eX1NWANxIC3EUFIhV
         DBOviCYkL5rq8FPdoGHLktll0k2tTp2h5FO1lxXKq9Lqe1OJEWI7PFFoKAszYgWYI3zm
         QOx2b1W8X6PspZh9XxbhPxkw5Ubx+z+Bw+zWhXHroXI3uQzhnr3XdexJEQzTa0VeS695
         5ang==
X-Forwarded-Encrypted: i=1; AL+hErEfEFnE4sL2z1hAi0qDZL5iESuyps7nTyjAXaI6oi7/pnVhKa8l9oJmLRgaEK2c20EJM8NseR69c/OTWEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oAQwBiH+6HFdUFczcW8JWIEGZ4ongfNNz37mVc2IrNTNXZm7o
	Xaj9T24awHpp2Zj9IxTutcDccTnKleHoWhvq2l/dgrDc1MLJA8pKTQlEnzj17rdn/cUXHQ==
X-Gm-Gg: AYBFou2+KXauyn0LUXTm6o+lWNs3fNAMNoSJDZCbs9VHf+D1H6WAG1lLRnKESfuseG/
	kDH3v1enBrnd3/gvatMtHwoyhFfTZHGV6ZlH/DNJ+PHxFIYq0QufiLWZ/diBvINxxtTnhi1GJtx
	ges+mV+11lC3sjHFUWo6K+2ColmwcP317JCDjGs32FTdmEJGcfNkSKOWdDFWleroqSoi212eSvB
	l6F9CxplgGQxmFScHQIWs6Et74rIIs898hBCfvDPjZLZqMGE7jl3EsqtDCiTnt3jTQAeCW1r8R1
	SBlWV8j6CGUbFyj8X5ZTT+/xA/c1r/yMjtJm2lFzIusDm5mvYnKiC2gf9q0xodrzx4ighmEMTN3
	z/tKtmXa1Wa4yBBUDdDKNyA5jgqQSOogThKgTzYRJSkOe68lOUR4WYdbjVf3o6Xfeh78JQO/yTP
	n2RGf3V0pxS2mRgix7VdaFxRJU3oqejUVx8aRgSmYbYR1neq3pP9W7vQY5excREYABnkxYyd0JE
	c5yITc40vnG/hmN9TQCvDeblGtrgSpfhJdzBjRQZ0sApKKdJ/eMwez1EomEc9vXGVqVpaIi/Ff9
	/qjgKJM5g8Blml6OshnIKqzISTRwbg4YY7RDZ7QrxObuxSvnXSD3r6EMweI+2FPhGZUwt+mu6A5
	X5Fp1SFomi26vs7Zv1JYc2mykZvOKtE89MOzSZJCmO5QMiHlUNa2IkSj9rZbWmqRalAL8t7QsT4
	pmRDUDUPr2eZemk3ko/WbEDDEBGz5CFk3s/d2/tgezw6XAQK2jXPzhBu5h5yfG1nBRhMsrjBpTi
	xYsxRO1ahNAL4xrz+Z8nFKbbAIx4xNQ6m5h1DoGhoYcOA==
X-Received: by 2002:a05:620a:1b9a:b0:943:b019:f011 with SMTP id af79cd13be357-947aff97216mr622570085a.28.1794442886869;
        Wed, 11 Nov 2026 16:21:26 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:c182:d409:44ac:104f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7a7aebsm602111585a.28.2026.11.11.16.21.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:21:26 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: interface: fix wakeup source leak in rtc_timer_do_work()
Date: Wed, 11 Nov 2026 19:21:25 -0500
Message-ID: <20261112002125.24566-1-jesse.casco@gmail.com>
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

rtc_update_irq(), rtc_set_time() and the -ETIME paths of
rtc_timer_enqueue() and rtc_timer_remove() call pm_stay_awake() on the
RTC parent device before scheduling rtc->irqwork, and
rtc_timer_do_work() balances that with pm_relax() when it is done.

Since commit e8ba8a2bc4f6 ("rtc: check if __rtc_read_time was successful
in rtc_timer_do_work()"), a failed time read returns early without
calling pm_relax(). A single read error then leaves the wakeup source
active, reads of /sys/power/wakeup_count block and suspend cannot
proceed.

Seen on an ASUS Zenbook A16 (UX3607OA), where reads of the PMIC GLINK
RTC time out and the pmic_glink.rtc-glink.0 wakeup source stays active
from boot. With this change the source is released after each failed
read.

Fixes: e8ba8a2bc4f6 ("rtc: check if __rtc_read_time was successful in rtc_timer_do_work()")
Cc: stable@vger.kernel.org
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/rtc/interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 96626f8068f9..ba4f92ac0f89 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -980,6 +980,7 @@ void rtc_timer_do_work(struct work_struct *work)
 again:
 	err = __rtc_read_time(rtc, &tm);
 	if (err) {
+		pm_relax(rtc->dev.parent);
 		mutex_unlock(&rtc->ops_lock);
 		return;
 	}

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


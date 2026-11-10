Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285005;
	b=thP7EQm8X1ZQCEnffkH/e/xqb3HJDuT8njT1Hkvg0GFSTN6wsjPAFfmsnsqq7B0PwZa4
	 I/cY0G20HLxOuL0JhpVYgLB7e5oMHuPanXioMRHRLtwHCxGLCmqtcnwQMM55RBxShmfDg
	 D0D4oi9T+/wqPBd6mnaRNB7toERD/55/0VzWcxOCY8m/vGHtqQdUXg72uuLbnG0KZv0GF
	 5G9sgxzBWWQ8NfKsmJSNHnuBqlrSUYz+gN78m4K1UYXbnl6in9wZ8FWxVqVghbbpZxA9D
	 0lH5JOhH6sXTB4g9XP2OuBu8P5CryGXo247mo7HDj6UM1z9NePW4b1JiXRIpHpXxTBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=stxCnrlGC2A4AcV24vYYzmqcDrFf7sMGldsWecvMla0=;
	b=I/+897B+puhlg7ms5Gw2ZkMUzlSIWRFRd2Eq7c+XoBBruabiqCaCNaLPlCCShbh3YJCd
	 qTFBAacLjpdKWgwpdgwt4vljQ6F/bm+O9t1BDzfJPgDnqpDxSbnDQ8MMc7VDMb5dA39Zi
	 Ju8Z/XmLjnHwZHhBy5+/CedcB9pKmR3NjnMCRiyIdxSU3XVakL9chctB418STsjVjdKo9
	 zVsqbsO4repQ2f7rFjrLWTJ3DRFdZVeJYFJSzoqId4EoV5Dn0hvVVf2DIvYDGEvwoh1RW
	 kd4HQZfYzOD+TmkbqRAoD55fm1JY6rqQsJjaZYxq1D2o6Cpo1XjYJDdjDAUOqUhnmNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYmDBB+e;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6573606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6573606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYmDBB+e
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5363c8de563so16074231cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285004; x=1794889804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stxCnrlGC2A4AcV24vYYzmqcDrFf7sMGldsWecvMla0=;
        b=nYmDBB+e2zfOChsZe2iLOKg2FPKLIJNpck+WFm4vCEJ/ef1hnNs8QkFka3ynthr63F
         XkwSDVUzJGTtRKa9ISBP+st+PuxJDVkmiReawGH6EbqP3guYafPvURfWj4NKl5EFrzrj
         N1Hn+gS81a+aOmqtFusyfiZVtWq8JM2Lr4djeSL8gK0OVZ0w3lZoVONXEX6bM7swBqCI
         P5zdgv10O3qxD1/R8L8KFucKU5GH+3BFa3eTdH5JzGjv7Y4pjAqWse7JEMKVtpPo4Jo5
         kVe2f75kDhj2ihNcHbD5iaglHiinfEul4e9qSjYiEQ2KvyF3mMQu7LeSMJT+D1p0RTH5
         zN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285004; x=1794889804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stxCnrlGC2A4AcV24vYYzmqcDrFf7sMGldsWecvMla0=;
        b=OIULTNrienFCWgdwJKNcvkh47R6zz3zQua4HD6NlDpVL0eSC9M/9EZJRDdoQhUYMG8
         MVCSmjd97KVtq/RWKlCtPjsPcYOMR/IGwNipK6M05t9RUh70yIzlyXN+6GgSDRaUIHAO
         SFEoHF5e6ABCXTr38UpzaBe8qq24hvppaAY2rzTxP2s3qzZ0YfLPAPKahaofYgYdDgmS
         XdBHGbFlYyepGiijVB5X+K5pmmhE+nMO5zE02iSFS51l7WIc6Nj+/KuNyxUdTOIaeoeg
         2ruK2BRGLohzzPosxukDucvUtJuizWpdUeh3xH2p29qKXPlYJK0WPgREsw3bg64MSaY1
         9/Vg==
X-Forwarded-Encrypted: i=1; AL+hErFyN8Yz9UTZk+xWCCMWv+tfnnN/fabGiukkdwk3CRWFC/H5QXlr69uTpvMMidUzO0/G+TQQBkLqqbFid/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/iRkWtf3rmh1pBN8cND9QUdOyLDx8zuOzkdpANoL1RvyXOIQz
	/ix43LYZCHuqL5Zlul6qHdSa0ovIJXK4h6roAv2wZw3wD4t8Hy7SxfU=
X-Gm-Gg: AYBFou3zDZRmdeElBZwQc2olCG2VNzgto2GXFcblxLEyOkRLLJsu6tMUH9uf7bEm85q
	u4jKDRt5d1WZQFig7TE9rfqzAcNiUKobRFjTmwoQtkcaYH3Dh+ion5ZUTm4gLYLCOGJuC40BNf8
	lgBOZqska6stOb9Rfwq3r7xAbwuIeSbn3txSnb/SvjqUwnhc/R99N8uOlOu54eU80r6/i+9JGRL
	ZOVkAelABD6rX4wb/uc/drvid6BaLp/3oHnCsvF5P+8Nbv9V6fKBfYoP3vNXBrL00UGhJ0sB2xK
	Wo4m6dbnihanql3sLPFTRm1xcpkrhnAEsfKciq3Q2ni90J/e0OIN9N6fhyW865bboGLm4oA40dK
	aBKIeVCP0nJAp6p8nnscV1Kt8cAXd5CyIadqIQHOV45O+pD4OkbJbNmxb6ZvXaFqwbO23n5AhLS
	AJLfjKZqGEoo3+hCB/tgrg4rwTe8elb+yn1ZXMx0aDs5Z8k1kFqOj42uvVL/NluYXSfYwcAS/pC
	EkINWSLtX2UayaMEecE4AY7Jh9wicHYvU2PGIpt2P7X6vgv2cYhIkptAhEeSPSvG2h1sEsVRZie
	Tp22YQMeRJT+WFfrAoO+IRPM5fLM+WgEjK45Gnc62MnPCGT55oXqSkxsDMVtAf6IXJaKLfvs93U
	UgboYA8cv8iQmU5SZbu4OQ9z4pu8VgRcUQ84zhlebwz0rfbF0TLvc2JxAgUlWDJxf
X-Received: by 2002:ac8:5f12:0:b0:536:8843:c2bf with SMTP id d75a77b69052e-5552a76da88mr20758921cf.67.1794285003678;
        Mon, 09 Nov 2026 20:30:03 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b44e6fcsm14363231cf.10.2026.11.09.20.30.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:03 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] HID: magicmouse: disable the multitouch work on removal
Date: Mon,  9 Nov 2026 23:30:01 -0500
Message-ID: <20261110043001.56615-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

During USB runtime reset-resume, usbhid can call magicmouse_reset_resume()
without serialization against HID driver unbind. The USB interface
remains bound to usbhid, so this callback can queue msc->work after
magicmouse_remove() cancels it. The delayed work can then run after
devres frees msc.

Use disable_delayed_work_sync() to drain the work and reject later
queueing. Probe initializes fresh work on rebind.

Found by a static analysis tool under development.

Fixes: 4253fe22b137 ("HID: magicmouse: re-enable multitouch after reset-resume")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index a01e84a18ded..525ffc64a2f0 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -1032,7 +1032,7 @@ static void magicmouse_remove(struct hid_device *hdev)
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
 
 	if (msc) {
-		cancel_delayed_work_sync(&msc->work);
+		disable_delayed_work_sync(&msc->work);
 		if (is_usb_magicmouse2(hdev->vendor, hdev->product) ||
 		    is_usb_magictrackpad2(hdev->vendor, hdev->product))
 			timer_delete_sync(&msc->battery_timer);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0


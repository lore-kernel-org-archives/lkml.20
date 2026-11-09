Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204675;
	b=5nIUKIFG1ZbSSQIx9PdsuvJdgddGeQWQGtfkxO+dQ778gm1zhFEzEdhAA16rNxqvxYYG
	 C9pWniHnNRXiKYdFDwoxHVraigyjRzawa6ej+2Bb9WsmhPX5KNJZCdEOS+m6JE1pov+wD
	 UCTqKqEZUL536Oc8eJefXunITrjBIw/XYxxveDUUP5VVeTrvXkz3uItKLfsrJ/n4o+H7y
	 x0iBqroxsZSZhiTLheT6vP50GBEKuOkQEiuwGny3syLupORzW5JiAWf6wIG5tfJ8mZ4W6
	 TUNzOzptbdoCL+t30wvMJUcZ7g1+r2mwbmRoheabjorMFxXwBoSBkdDRw5e/k7RCKpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gHzyFwE4kZmoIyCMCuEGRvLMldGFpGCRJxETSq1bEAc=;
	b=NQiyf5h1asCClKIEZtjVvuVPhMjOIbcW5D7L1jzqHP+Yer0+8jq2HVfdgMzGP+xKUcBL
	 FwIwI/A+8rEpkbEQN6O7Zf1BFE2hYQ/VWKOtI/s8dBr3y1lhywgSM7CQIdo45K9a6D/LU
	 GDXJ2DUj0CPjvLxjxgVf+sl+m2yuTGLyAJiNTJSGdq7tH6dkDhiGfTqaF1sm7umCFvn+G
	 LAp4GUwjnSgw9fMMdZAGySBr17nPXFrzAi5yvs84h4eI4VDxMefOSq8RmmC3N998wHRIb
	 tJjLp04waVMa6PsuUuK5CpFm60Sv7/u82RE3kQIGtcGbd7edH8HQC//W06dshuFASfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QzGJvgB/";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1FD606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE1FD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QzGJvgB/
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso780789eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204674; x=1794809474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHzyFwE4kZmoIyCMCuEGRvLMldGFpGCRJxETSq1bEAc=;
        b=QzGJvgB/Ha/ubu4EeNf7m+HsnOI0YYdWo0CGi2KAtFmjebJ/JSQV8O0Czo47GbFR94
         UCLgcXOHtgNdPZ3ZDAMNVLQhMf3DbFCy8sC4cB04Z4vda25/yUwx4rvBLPlw57oVyLIX
         zZUACtRLgEXv6WMxsVjdol2ou67ROg2qfna6SidNhHKaQSwIN/FMV/VqBcechWHf0JWj
         ZF141THChrSnWiBqaSig4WugfTksD+QaNgU7/SH5qXhuKG5++6vwC1/NI6o+EBmOV367
         EKf5W2HKFAaJYZqRLIYp90e18woIYsCyN3LnRrsmNKpIngX49JMrgkayGcOjlkneirBo
         ubVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204674; x=1794809474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHzyFwE4kZmoIyCMCuEGRvLMldGFpGCRJxETSq1bEAc=;
        b=gP350P0DcuKuZrGY9rflvPLBHfpVzQflfzD2ZHxoVVWVDseJzFSynHqsn2CBRaPxvv
         wfKA7FpU/A09+gqH/vs44Ipp97gzRW+OldTy8CaQh3ROFnRqGWy9oYsLL8K+gmdiisM6
         nlqVo7uwTjrBUVtBe2o1jtqMXQIizPbq49psY7Ut6mYMDBVGgt2GrQBxq6nkn2afBpm0
         eHKtSQ15mXGkfQV9UsiLYr4IkVvyAuTMozWm0es8utowaMOfaxSgBQ6y6sL0h0qjLsWU
         B24pH+72EcV+xy4WQWTJgLyGQzcpTuYdZmaATCIg/AMFzP2QEmFV9l2TPUAI2GYuwpfT
         PuGg==
X-Forwarded-Encrypted: i=1; AL+hErFr3l00Mnjj7Dt5appkti37x0PxrpCSzH2CmliO6MuQ2Pdp87/OzX4y+SxTLS6wMabNrl+WVik+PIT3e6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gPNTVGLRAZfSQ50i18oiv26CEveTYEg3GlIHTvsv7K08ZgxiN
	xNHv/fvP1yt1EHrr2UiU+avGuT2BDv+VWaxo7xbtViUjunZBJHJJt/Bl
X-Gm-Gg: AYBFou2LEn8GwSJs39anHe16KsoQbpB+4wzOtWIfxLXJ7Kh6NLSrK50JGKlDKcVviuv
	Ykqy74PQNtVREM8ePeAtIII3hhMIHh2CB975coumYsTfILG/OBgdvSighIrOSQ/S6k6Co79HIHH
	AF6hIVb647j42x85Al2gKf6nz9SoavVUEInEgw6aOeg/W9+G+XznktM9YLgL6d5GCd23q+6z0U/
	1jM+qfl36IeYV0nHQnhVpRy+lkVDJt171ItA2siHx0Ye35zJKBRen7q32rMR3jF6QLgnot0XW/T
	NYcazoG89wT+GY+pSvNowRcjZRtwraVyhxaD4emIsh01+dkmC2TbjobJXTB4iEyJT4/5z4TzOPy
	kfucPQK6EG/fka6iD2NZI16QDCh8toETOdtiFdu+IytOq9hChOWcQC1kIcUKwsTy+Bj1YQTRM93
	r2lQs0oynssnsJCNLMX+if81czAnxH/kEOgb90/KsWO0G1V7ar7INmg0feNgt+izx1yPkCHJcUK
	IAk+xEm2X7ujlDABALT8m94+aCe2sX08Bdya5v6Ys6F4SMB22vgG0/vZjfEYp6xwUEnhA+gc65H
	oAx9AoUN+yv8pNkG+uRBragmbnDVQF0zLZUwr5lI4zDVMLjKQUeW4fNKsgRHyqEhy3R5N8Mtyl/
	i7GY2iSSzy8vOH4SSxm1+7cszrd0qk7qZD+nGKQ==
X-Received: by 2002:a05:693c:8382:20b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-3725546fbfamr6786230eec.19.1794204673770;
        Sun, 08 Nov 2026 22:11:13 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:13 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 04/18] HID: logitech-hidpp: disable works before stopping transport
Date: Sun,  8 Nov 2026 22:10:48 -0800
Message-ID: <20261109061103.2887636-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
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

Device removal cancels the connect-event and hi-res-reset work items
after stopping the HID transport, leaving in-flight handlers able to
issue HID++ transfers or register power-supply and input devices during
teardown. The connect failure unwind path in probe likewise cancels work
after closing and stopping the transport and omits the hi-res-reset
work item even though incoming packets are already enabled before
connection setup.

Disable both work items synchronously before closing or stopping the HID
transport on device removal and on the probe post-I/O failure path, and
drop the unreachable cancellation from the early transport start failure
path.

Fixes: ed80cc4667ac ("HID: logitech-hidpp: Add HIDPP_QUIRK_RESET_HI_RES_SCROLL")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 476c0f0eb086..4e0758cdae64 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4799,12 +4799,13 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	return ret;
 
 hid_hw_init_fail:
+	disable_work_sync(&hidpp->work);
+	disable_work_sync(&hidpp->reset_hi_res_work);
 	hid_hw_close(hdev);
 hid_hw_open_fail:
 	hid_hw_stop(hdev);
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-	cancel_work_sync(&hidpp->work);
 	mutex_destroy(&hidpp->send_mutex);
 	return ret;
 }
@@ -4818,9 +4819,10 @@ static void hidpp_remove(struct hid_device *hdev)
 
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
 
+	disable_work_sync(&hidpp->work);
+	disable_work_sync(&hidpp->reset_hi_res_work);
+
 	hid_hw_stop(hdev);
-	cancel_work_sync(&hidpp->work);
-	cancel_work_sync(&hidpp->reset_hi_res_work);
 	mutex_destroy(&hidpp->send_mutex);
 }
 
-- 
2.56.0.506.g506a7eabc5-goog


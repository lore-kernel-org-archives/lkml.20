Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8572417BD2
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108473; cv=none; b=ZejN5F5chX3SiNknKhXtMwnJ8OT+b+oX3gfDoSCzYGrI+5AP89oq5uFEP8x1fMBQcRakoNsfSKjj6tbZTKEow1UeZegxk5wNU+KtiPvuD8l00sKDz9vXikJjNQcCtvlokgcUsH7MbiskysKsKomwgi/xHQ6ziwz1BBDqKbpVmd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108473; c=relaxed/simple;
	bh=V8p7f+anGnSoL+KBB359kqfJ1ldhGnObhu2HYkCbO4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdux6zwZQLCuaASwJtA943HJAMmLGz1XOyhFSykbNf6HXDCXkNGRXXBbW4cGb867xp3rbtRZIZSyJUgWks1Qw3fAZenxqiQnZRuOFs7ZmtKVC5NsdLpF5I4K2AuqECNNO7SYi8ZEpPVxU3gvN1277hc/72ZDregk+msmKQnHXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpPkL3Qp; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpPkL3Qp"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so415127f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108470; x=1791713270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yr4Xk59A6nBEe9AXu0gZsAXZVCEOldu1UBAKss+kKik=;
        b=SpPkL3Qprtmbmc4Y8rw7hbFhv2TP8pNJxHxSGjVB96GKlOKRzzW4da+H/fvEGJvzvX
         5pPv8lImD/oRoQ2vsZRjPxm23C1zuOAv42N1zStE3rSKOx214agHIPgTyTTsrbXL1ckg
         9IPdx0zJSy92FuKGVeS9rQpCCheGNZ77if9KXZxzskJe7mZwMzvBglPuGcOzrbDT/mrH
         Zk3PYJp9uAgYuT519Akj4DXRYhGToDhsbtOQukmdUZTIUmccLl0k2rODJ+5CnbGS9S2z
         M+f1ig/9JZP/gvsvCtxa2jqmBXOY6+HUI7j8oXDAU9n7vsdbC9Hm1ybCYL+TD2LWT29V
         HB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108470; x=1791713270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yr4Xk59A6nBEe9AXu0gZsAXZVCEOldu1UBAKss+kKik=;
        b=J+VaW/i0X3gN+0Ofpx9SaopsDnMjqYegIcFokLFbLAyKS7mOxdD5Y5Z8IRKw4x7kuc
         BsiFKDSKRE76wx1JtllgHHjnM0/jWjIZnbRd46oN4aNFseCn8xRBxNp3XIheA67wS1Ms
         tkLtfx4fss/OLPvYD0x2ThzurwG9ic6sOu8tcWFxhV0hBOc8/hmJ3YlZx3NED5xKC9Wy
         082/+xwirhENrwRhHnDV3MrPV3R/oFmNbKzuN7i2HSIvcGP5HwAyF/BQsdVo/uJ/zohk
         NWVXdchWKjWDiX1berimzRzgDizUTQWk2ZXzwxju7OwxNbCGpQMaWo+3AAKx3637R8O0
         KUGw==
X-Forwarded-Encrypted: i=1; AKwUvBztFTJ8OavNu18R1L2Fvogp3CEnQVRHUawY/2ssRlLa/F37iG2B0rStM2egtoRZHzzK3a955eqH8QLt+eQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI17nlbFqdYvNs2V287ivDqh4kSbrGYCpa3UIPJ8udkyiVFLNQW
	F6rk9dvr+T9PKoemgyXQzWr4pUWv/65HZjeo6MwAxEZxYpCrQhv3524H
X-Gm-Gg: AYBFou3AkSgND/ZafaacNaBHNdZi0ir/eIMn1EYKZLKejzcqpai/OFp5LRtnvR/sNSB
	iXUkhon8F6UyxeJoIsRGBrIGu7MaiSR0hw8z8uLAJ4Dqh5miIBU3vFlsJRUXmQf69eY9UFWJAxJ
	E7eLYXl10CGMFLuk4orX8exOkk8Vx+wOUMMHQLnv4wj7mPXYjbcgOv40HFcPxAZ6RMExA1rCnoG
	ZFKrPgtVSl58tB0VhaVflmqvWcontvrnpgDNmrg4Sjl1FPBFWtMExcrgFv2yCJ5ZMSn0l5SIB6u
	MOmK3ESSNaENiKb+D7UFLGn2D2shT8nbXN7j/dJrcerhhoW0tWzEBMFXedP9TI/XXwQdt7jdbgL
	WVZF+LSer3bPsYm2pmmeEopOK+CDayGrUHVVbWO+88DR+T+0a0c7pl/zZW+gqNyZ49/+ZjYeQpS
	E5xY6BYM5KpUvs1TrfQNr0myvSBPOmmL07UKB/fElhyrIcdTSO0eeemJ5P0FVYuoLvBLIyc76lM
	CfGVZrFOOor1jJmAweerhQC9ZKJ9PxUZuTmz4fqHDgStxgW4h0UK/N53ZQUeQTSVLpu0tm9VUCj
	6goyyauGgi4zd1pNbOKah9o7+UtkHdezi0raaLZsx+8J6oywUbp73TaS02lqrrSxZO30LSTz4JN
	U5PBbWVaB/P/RpEe6tv2H
X-Received: by 2002:a05:6000:260e:b0:48b:161:ff26 with SMTP id ffacd0b85a97d-48b12749fabmr13400933f8f.29.1791108469910;
        Sun, 04 Oct 2026 03:07:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:49 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/6] media: az6007: fix CAM status polling after disconnect
Date: Sun,  4 Oct 2026 12:07:36 +0200
Message-ID: <20261004100741.71711-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
References: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

az6007_ci_poll_slot_status() returns -EIO when the status request fails.
dvb_ca_en50221 treats the return value as a bitmask, so -EIO is
interpreted as CAM_PRESENT|CAM_CHANGED. The CA state machine then
handles a CAM change for every failed poll, without sleeping in between.

After an unplug, every poll fails this way and the CA thread can spin
forever in dvb_ca_en50221_thread_state_machine(), preventing the USB
disconnect from completing. This happened when unplugging a TechniSat
CableStar Combo HD CI with a CAM inserted, and rcu_sched reported a
stall.

Report no CAM when the status request or buffer allocation fails, and
only inspect the status byte when the request returned data. A read
error while a CAM is present is then treated as a removal and the CAM is
reinitialised after the next successful poll.

Fixes: 962f8f67e486 ("[media] Add CI support to az6007 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..4ce1afe01c3b 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -526,7 +526,7 @@ static int az6007_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
 
 	b = kmalloc(12, GFP_KERNEL);
 	if (!b)
-		return -ENOMEM;
+		return 0;
 	mutex_lock(&state->ca_mutex);
 
 	req = 0xC5;
@@ -535,16 +535,18 @@ static int az6007_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
 	blen = 1;
 
 	ret = az6007_read(d, req, value, index, b, blen);
-	if (ret < 0) {
+	if (ret < 0)
 		pr_warn("usb in operation failed. (%d)\n", ret);
-		ret = -EIO;
-	} else
-		ret = 0;
 
-	if (!ret && b[0] == 1) {
+	/*
+	 * The return value is a mask of DVB_CA_EN50221_POLL_* flags, not an
+	 * error code, so report no CAM when the status cannot be read.
+	 */
+	if (ret > 0 && b[0] == 1)
 		ret = DVB_CA_EN50221_POLL_CAM_PRESENT |
 		      DVB_CA_EN50221_POLL_CAM_READY;
-	}
+	else
+		ret = 0;
 
 	mutex_unlock(&state->ca_mutex);
 	kfree(b);
-- 
2.54.0 (Apple Git-157)


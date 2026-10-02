Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7144F55F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977463; cv=none; b=hfixiLpTLNKxC8NkfjJ9oC9DRfrUayuSK2EcjNvLw2gsSkNnx7Tg9omOH4uO60OjC+G+xkm5kFw+/7Vy1iw5fQrWUcMkwvkC2g3jdi+IJh5LkXZCVd2zYJWo0eK3sHhuLDLvYCvvU0BtPfc/hR45dMO/KiUs6cv4jYRZGiRxxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977463; c=relaxed/simple;
	bh=ZCaeiEXn07+Csr8kWh7m58CfL0dqAr0onVKjEQ2TCUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2OcfeL43KhPrUS+uYUBtffiojvzcWb/kRzjRbHR/lbmgQCLebNq9C0Z0p2BWRH+0mGtn37n9p3a9Jzbe22akAp5a2Dw/rrp227xGTi1HD6f2QR07RPNoKnILMNI3dWRkK0bC165PgaiSrBnoipP9cQvPf500W+CGnmnNISCH80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTpEq5QY; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTpEq5QY"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533797e72e8so93291cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790977461; x=1791582261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=731GWBd8bmU4NH2SwdaToIMYTPusA7UXCs0lvTfehWE=;
        b=aTpEq5QYLS6xiS4P0Qjvjklm+3wdDQqV1rXFmSgeQNcLXmLqmdrThNDBRmd/fEzoyZ
         xnjg8u44B5JaKFwTaAKDvfJEm0h6R3De5UP7p1QDVu4ResjqClhtv2tL3RQ6qDWocgmD
         47GEpowVFAb2lI4bl895oBqdDQtgniBk0GzU9bdoEI0FC2Flkd3P08SSrYX1fcGXZ8Yd
         srQ4uWXGSQyn/XIeuW8KzuhfOfyrIQxkZaMzjGVhU/TnOL6L4UrTLDNFzP8ACHEsKDoV
         ycJ9o01EsGNl7T8CYp/PdTDYKYw4kMyJGfy2JPnkThErGaTAEHW2fPf2evdEkS32uaW7
         Kyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790977461; x=1791582261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=731GWBd8bmU4NH2SwdaToIMYTPusA7UXCs0lvTfehWE=;
        b=iWzNL0E2elKbbJDNSAdaEMf/LSGEXlk0Asvmv6kEQbe3RQWgwDt9PmaD5/WNHaTocw
         Qf2x21dAvOwU/PnrgZfNSJ5B+KZl9/HvgHZFtKGsaqDY8sUlfNFbdjVYgLaOGQ88FfF8
         l7umDY0emhkSGZ4xf0uECdM3w0jrnjkY3cJArZ89hYRuD34M5pHUheFUTdBRFR8r1Zd5
         ULoxSTWVsFU2axAAFZFaPZp7p9GAEM25YvDfha2IZsLofN7JjO0+QACDIraoup7KPglu
         0S4C43011tcUFELgFpILXCU03e/lgiPH3JHx5OmXStAMT5H+itfbEUrwwT0a9B+g6Z8B
         SrBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6ZH3ZfUzDQ3oUtAfe/eZJLEOZ3WYynU0jE4cDG50EfmSprntkyH/Wllv7EcRxUxHx2N9k0WNJYamHkeg=@vger.kernel.org
X-Gm-Message-State: AFuF++k311E8L09/rRZQWUiGMTl8/E53E7Lje6La5+0hP1/+tR64FOfx
	AZtiDxIsGlfHtZMsvWE7dZgybDq6GTjS3WddEeEpZJ9bnTRcpUnSqUA=
X-Gm-Gg: AYBFou37KbWcl/oP9FSYvai+kEo5OYkPeYdeEFWAyAeCmHJD3L7GqNO0x0hYOR4QNZQ
	F+TYHp4HhR98OSKj7uqEzjy7Gh3MC/9ugHC09MQ7ycMCzZt8A3gS6sxrfzCdhw/+0AbaVrLEXCy
	V5Raq24nhW+2uVeVPqjaCEJG9D7g/StBSbguaj00OXqfoHS9A+kLnj4YDsXDes1oHTX9e2CC++r
	eZlRS9rvkkbMWDHa9vpzCjm+xYevQTvpDiHLCTkglb6ob8EoM9Cy4MCJeUrrgj1zcnIqHeO1STU
	RRVqw7IuZyQiBSy+ttbaMjhSKVjSnEqdyKJY8IRLkgPEplnIsNRno7Bkr5Gu/fpyuMOto7xF7QY
	9yjddsJbVJ0xUvSuvYumUB9xc/i7z+xaxukbIpk91xlDr9H3Qq2MOqzmY/OqK11UQnik0i2JvdG
	Lx7ZuqTmx74DURXiUxHM5ECHGsYkxdCsLjiZE69cpqQ67fDs+4+OiVR8UDuLPvM1eedPqIF88pU
	W/s4smHADZQRn9R69Mc2oDSwxKap4lB4+AeK6YoZWkd09UH7iMHHO5sMmuW63CoodcIXUWE6r7z
	oaIxBsGsUooS1nJ3Z11SRteJCLTiw9ZcXQvUjRg=
X-Received: by 2002:ac8:5a46:0:b0:535:958:b9c1 with SMTP id d75a77b69052e-53511d18e2emr12544691cf.11.1790977460535;
        Fri, 02 Oct 2026 14:44:20 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398aa36e6sm36669261cf.15.2026.10.02.14.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:44:19 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Rishi Gupta <gupt21@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] HID: mcp2221: always initialize and cancel init_work
Date: Fri,  2 Oct 2026 17:44:16 -0400
Message-ID: <20261002214416.459795-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The writable gpio_mode_enforce parameter can change between probe and
remove.

If it changes from false to true after probe, remove skips cancellation
of init_work. Pending or running work can then access devm-managed
driver state after teardown. Changing it from true to false can make
remove cancel an uninitialized delayed work item.

Initialize init_work whenever IIO is reachable and cancel it
unconditionally on remove. Keep the parameter check only for scheduling
the initialization.

The false-to-true cancellation gap was previously reported by Sashiko.
We also encountered this issue during our static-analysis research.

Fixes: 200e6c6e94fa ("HID: mcp2221: Add module parameter to enfoce GPIO mode")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-input/20260715143415.916A21F00A3A@smtp.kernel.org/
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/hid/hid-mcp2221.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index d52ce3531ab706db8ec908d57ad0383af9fafb1e..6515692b408ee7b6ee318cfa3f240321c133f2c4 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1072,8 +1072,7 @@ static void mcp2221_remove(struct hid_device *hdev)
 #if IS_REACHABLE(CONFIG_IIO)
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
-	if (!gpio_mode_enforce)
-		cancel_delayed_work_sync(&mcp->init_work);
+	cancel_delayed_work_sync(&mcp->init_work);
 #endif
 }
 
@@ -1347,10 +1346,9 @@ static int mcp2221_probe(struct hid_device *hdev,
 #endif
 
 #if IS_REACHABLE(CONFIG_IIO)
-	if (!gpio_mode_enforce) {
-		INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
+	INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
+	if (!gpio_mode_enforce)
 		schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(100));
-	}
 #endif
 
 	return 0;

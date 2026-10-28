Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209435;
	b=CCykdwB/XzXn60jH9s6FvCTTqiEA9zDrdlhCaF1IqjU/iqMh8pGvVJT5HJEZplVLRnii
	 4JnQ+p8nKfZsp2j2s9UYVD7OdbuUHiXcoh2GjH0YZc2zUAOMvpPcoJczCuqvPliW0i7Sj
	 5Jf7OOCl2FsutSwPbvZzbZ6GPub/xM0+x47TpBOxOgzojsniKepUJkLLTCDWpDIqGWxSu
	 k8HtVlY0QS1bTXl7R5LCj0JRE9yFfE4zw1QoMLCE8hilqz+m96JKcIhuDKKkEh3MgUUGF
	 jFpoVs89NPB8QF8tbSMjiVCRc5h3A/Zjr/788EHdd6Vhwg+8HGOE0hIG4+bpH1gWeTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7bPJOiOxWmpQxwy7s6DX34z4VIYYp5wKziJM3UDTWA=;
	b=sI+uy8PEO2NNpAqdGLq/AKCQI7Yq+dECvM8Guzk3WBSyvljrntj0TNwD7ja5MkKUocT9
	 N91h4DsnzCBFpsqkPFiVS9FBTMjazHmoXrrUWzu0mLJ2Lmu2sOJ29Ctmfwc4lvYauwNsd
	 NKv4uHvSA3jFzJnGlZr6UZoDLrHKyOCshgT2HDK4hghsMvrs2n+PbWkOu8dI1NmJs95K1
	 BfXwcThYA7flkRC8OwMavPhBzBhnqTTMauszsrn5QsGU1orR13CQYCxmbWagsyHUacA8q
	 fRc02X/L3Zgcu0raImWiPmTW5C2Kvx3jKLXv7O0Qppy+2xC8E7fR5hTwUXI847Aamwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJYiJJn4;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7CA606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7CA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJYiJJn4
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-54cd7de2d42so811444b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209434; x=1793814234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7bPJOiOxWmpQxwy7s6DX34z4VIYYp5wKziJM3UDTWA=;
        b=JJYiJJn4JkWCZeEc6Eis2ekHoap8cCzGqHyN7y9E0/bmhYY6SeOMj9wXaDxYGCF9W4
         rg6+zkS0FgWnliPYuAGh09K7H+ciIbzVpwopLnTlrKjr3K1sgsRTinNnSJQqI16KG2ME
         zRD0FXl/xMNfcTSFf1Vw2j92iw2g9/DbY79Xu4A8/Aq0YonF6eSIBpGbs52puEJc1gfO
         XgehVrwlBeXP9hXhhcZGLFYKkB5r6tuHGlTnxEV9n3iHFz7LB76f2WflVwH1DxlH0Y1z
         MhGYvLVap0OCNB+iO3pgZimqvW9FhewVuq4G40TkNci7ysBcRx2Wz1rnVlGNFCMfP2Ug
         +i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209434; x=1793814234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7bPJOiOxWmpQxwy7s6DX34z4VIYYp5wKziJM3UDTWA=;
        b=bzxcSZNOxS4cDmQkh4Ea1j7JzMkSQ1bL9b4OONHWd3NawZh9kJv5BVeI5/wk9OsJ/P
         NGug3Wb8IC9Vy+8s6/tJcoPvTP/dCsGxo8GrJ4/yeOE5FB+zmkXczVwo6CfkYpWx4h80
         qjRj7pYtqFvOnRtS72RS3Thb0cKV1VyIauO1TfWL7FhHxSDDn89QUFus6QIqZ7CRszZd
         YV8hHC8MtrnLEvdp2hnpIqjZ/awBrGMVL0xoJ+3RnbbrsClCAzrAHSDbIRM0svWxqJfD
         DWie+rA42qiSNvpI8wbu69Jhg0okKr0gS+th1MIplY6a0BK1JAOcsba0ZvnovkBQOQLf
         LS7g==
X-Forwarded-Encrypted: i=1; AKwUvBwaAxJpMGgvrKJS7qhLl4vNuxIVD9gAVK0heEB9maffyIfw8mOiDXAioKgqmOyXsvFBMMtCyErD8EZdD+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8vcnkQlLaUCCULjabocsQ1YBIsNWfEi/lcoyPurTJwraZ30eH
	ciH+NJtP3gfZ1SbetXZIOu6yinus8g/8MEytF3yBDfLQwQYsDswVgGRo
X-Gm-Gg: AYBFou2BtE5vGG+DkgjXU8KtaAo9stO6ugwOBCTr15Aqgo9sYyp+L7LUIU6tBfI99Wh
	CacMnyE4e1BQ6BUDklIzFNlZXaCCJTJ/Em8OVzmPIc9yYMIAfe+pdcolj756AgbQR+FtAbfVsSQ
	Jp049tLJz6uIGSE+P8cH00ppOFSvStzWhCl8ZsOvBLwUXrlcfagegEwVeqeElUbYg07bhqzARVw
	VOT/gAripBIYGNCEPY8w0zZ+0JwBGvBXUvwHd9icRhFi7M+uhZpEBgSJi8fz0VK3Vu8poN4RHuA
	24bW/kZtC9LZ+JL9WYhCMJ7wBn6d5pbWZgFgNb7v4PYRc7jbV/jTn6CRbeRtKXyj4ueug8cQOdi
	Xm9+ItbCtQRwrwJpnk0aAE+ndyvJvbR5nnV2nNFIO0Z5qOzyXnfIi5U6+hoe8oTi4AXJi9AyweZ
	BAwLp92zvY1efmpRndh/8+SxVinpLgZP/prsAHPUSEm7AjdLdvY9zD3xN8d+gls/mnV2mOMzPoh
	mO0TRzAICzpoS/wqfBSQsLiqVgQf6PhoJqrDPJTI5xaYa3nZyWkRD+OSPPh0QfA70D6/HonYrfD
	zkTUdTf0p3MHAWk6kYXKpdU5bgsAVRi2nf6q+zqbpB2gFIzDGbSaJg1jdrHJxwz7NYY4n8saYFp
	TlPPuOjsWxdw2ww4a
X-Received: by 2002:a05:6808:bd6:b0:4d6:9283:1dec with SMTP id 5614622812f47-56384c81150mr2067708b6e.58.1793209433737;
        Wed, 28 Oct 2026 10:43:53 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm1612114b6e.8.2026.10.28.10.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:43:52 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] leds: tca6507: Fix use-after-free on unbind
Date: Wed, 28 Oct 2026 12:43:47 -0500
Message-ID: <20261028174348.64014-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028174348.64014-1-danishkhateeb03@gmail.com>
References: <20261028174348.64014-1-danishkhateeb03@gmail.com>
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

Since the LEDs are registered with devm_led_classdev_register(), they
are unregistered only after tca6507_remove() has cancelled the work.
Unregistering an LED that is on turns it off, which queues the work
again from led_assign(), and the work then runs after devres has freed
the chip:

  BUG: KASAN: slab-use-after-free in assign_work+0x414/0x5b0
  Read of size 8 at addr ffff888010d5c0c0 by task kworker/1:2/65
  ...
  Last potentially related work creation:
   ...
   queue_work_on+0xb6/0xc0
   led_assign+0x223/0x340 [leds_tca6507]
   led_classdev_unregister+0x26b/0x340
   release_nodes+0xb3/0x140
   devres_release_group+0x247/0x470
   i2c_device_remove+0xbf/0x1b0

Set up the work with devm_work_autocancel() before the LEDs are
registered, so that devres cancels it after they are gone, and drop
tca6507_remove().

Fixes: 1b5c2fa7081c ("leds: tca6507: Use devm_led_classdev_register() to simplify remove path")
Cc: stable@vger.kernel.org
Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/leds/leds-tca6507.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 9afe2722986c..0f987e551f03 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -71,6 +71,7 @@
  * not recognised when matching.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/leds.h>
@@ -735,9 +736,11 @@ static int tca6507_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	tca->client = client;
-	INIT_WORK(&tca->work, tca6507_work);
 	spin_lock_init(&tca->lock);
-	i2c_set_clientdata(client, tca);
+
+	err = devm_work_autocancel(dev, &tca->work, tca6507_work);
+	if (err)
+		return err;
 
 	for (i = 0; i < NUM_LEDS; i++) {
 		struct tca6507_led *l = tca->leds + i;
@@ -766,20 +769,12 @@ static int tca6507_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void tca6507_remove(struct i2c_client *client)
-{
-	struct tca6507_chip *tca = i2c_get_clientdata(client);
-
-	cancel_work_sync(&tca->work);
-}
-
 static struct i2c_driver tca6507_driver = {
 	.driver   = {
 		.name    = "leds-tca6507",
 		.of_match_table = of_match_ptr(of_tca6507_leds_match),
 	},
 	.probe    = tca6507_probe,
-	.remove   = tca6507_remove,
 	.id_table = tca6507_id,
 };
 
-- 
2.56.0


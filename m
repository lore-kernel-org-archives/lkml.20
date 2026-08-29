Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0086041B8F2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044258; cv=none; b=P1firPWQXhxhrbXxQlilYJdl6I9nOTvrmfFIi22dwzDZpuiieQ/RwKrGphIUjz3BYKapsp2ADTn45D00S9MspIc3tPTHXJjpbGVLzHOfDroS7eyhjXCh2WYIok/TeLhof9PVP11bfPGfYQgB3aNb3rCqWkGv/JFty3l8DQ/JKZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044258; c=relaxed/simple;
	bh=ikr0xmonSVEBBrsqTIBByVAQfkgWDFTQ5xl7Lwxfkqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLZyCkjELBaS2ttPmUd05JW8+dI7xtDf6t7kmSgqMagVemc1DzM1LUZdfuS3Bk75dWEgrHZJo21EH8NI33c4Qr8mW9ElXvWjToBnPk5iWLQhaddGcJV9s3Lo/9XzQ0VRECeCvnsKWEvAhmmMud+/LRNcm1ACKYu02tQN7oTSRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFBU2vRU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFBU2vRU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so22622065e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044255; x=1788649055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhbptZ7sTwzXtkLdl4fxPAWO4oqXaG6ecccqmYbEYoA=;
        b=hFBU2vRUeEnl3wznIlVufoHZ1vkWLuxJVECq5ie74IP7hUg3suB9VrprCBzDtbkZwz
         TIIZACASBA51sQ6NW2xZerQaMN4wCAYQw0gmOwBrvT4IKPucpyKZyoAeWiPtCQN0yRjx
         MAOZm+bK0StSNAk17KWYMSyQaRWgEYNVQaCPKJb3Y2E40Akxhq4nd8ffNBuMsC9A4zxw
         HAzcrTqykwwTqBGw8rMpEj7SL9hhLWbqZakbH41rKxoptrHMiADFP/73aBJTAYOgbi7+
         xAVYv9+2XyHeMKzMc7wKSrWJxTReikU3WbOD6l2pV/wheh0hOfwJbCo7uZpw9V+PsVQz
         MMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044255; x=1788649055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhbptZ7sTwzXtkLdl4fxPAWO4oqXaG6ecccqmYbEYoA=;
        b=rUL0I7I1q90zuwJlgVU6XvfQt5iH02uUaGJFjnoSMSMFQmsG1oUYgzChXImhvG6ZNR
         /NGhMP+rMTffpR1IHSwMyMOWYXRV/kSYA70IQ2w4Qf8xn1ubBO/Y1Eg/4YQHuLs4XNpa
         FC+060+Vd2sX9hCy8Y02KyBBSacY2736AOaXRIdzrq4bHPRdmmPsoczUliGLN3ZlPUtO
         3PfP9Qn3m3MARp1AEr3gR/BOeVVvZB4pC5O/OmCRO6UgdbvDrHNEQmKINtMYfqQryPHT
         k+geMn3DCGj79MMQdXT/sQi6/mU0rlhn4kVYshLkKHkNXhieU6yB43oQMajmaUGiEe3H
         DDJA==
X-Forwarded-Encrypted: i=1; AHgh+RrArorUhuYwETxjgZf3yiJ7zM7GUTP+V90KaIk2K486osAXfm8jX1yuNUwGRPovBWWMNY2bsHqInRrAB0M=@vger.kernel.org
X-Gm-Message-State: AFuF++n5hH5DA1G9Z2GhcFt6Pp4u++iNvhJEyBic6j8UqSf5JbsUXaij
	4MTi61sM19MOZiE62378fvR1kKUIcuAibaTABQb2ijwUpLwVm7PIWkSQreWRKjXa
X-Gm-Gg: AR+sD11QN65MMfQDlXmqZE4lKQl2yiFoEz6WJ46SehPDK96kiXRLVUahq6OcHAQmMZS
	6rBsxQbVV+Ut1HjEU0ZkqMEYk3fgq/dvGoLk8nS9sU+k9vvdBCUmhxiy+nm2JrHBZpP/Lbxo/dl
	9C3ChOu1Cv9XBYy/DeeKEzTaTFd65JuGg2KCurO1yU+szdWBM5r7ARlfCr2Wg4KEf8I7gZ6d7Ht
	KMfv0bEPBmCtUbddi0fThMQXobiKoQjsWbgvf115zIpjpyyRdS0EcVLh7ycMYezSvRppCOazbjE
	qtbV9I+HZ0TQphoVal3h+vvqwj5/PiWPkwM/mhwQ/soG3CginHCOIbHGMhOKdAMt17qrkvfGj7l
	FKNCOrMaVbODEnD1OlWe9NzmWwjC17MOOm4yVnqyW6whZkqIsLXcpc8Ent4D4yJh6CQYQ7jWT8R
	39Ptj8qsHl+mm3RoMuI2Sn+9zqTRNPL1/IqKKXWKt6QWJKz5fW2ucwxnt/1T79HoeyY4CmB2Kx1
	ih3Eye6KFNTHlz3fv0Kbevl1E7hWpJVAi6gojysHOUJ+yUmn3Wy0K4=
X-Received: by 2002:a05:600c:4452:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49b91c2e42bmr261263835e9.7.1788044255220;
        Sat, 29 Aug 2026 15:57:35 -0700 (PDT)
Received: from 1Z10 ([37.161.113.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm60751835e9.0.2026.08.29.15.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:57:34 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 2/3] platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
Date: Sun, 30 Aug 2026 00:57:28 +0200
Message-ID: <20260829225729.395270-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
References: <apLZF6b3F39z6bUc@google.com>
 <20260829225729.395270-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L firmware describes the TS3A227E headset
detector as a secondary resource of the RT5677 codec rather than as an
independent I2C device. No client is therefore created for it.

Instantiate the device on I2C1 at address 0x3b, describe its GPIO
interrupt, and provide the mic-bias setting used by the Yoga Book
design. This lets the ASoC machine driver use jack and button detection.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol [sparse]
---
 .../platform/x86/x86-android-tablets/lenovo.c | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index a8c849ee03db..88693b9a1b01 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -149,6 +149,16 @@ static const struct software_node * const lenovo_yb1_x91_drv2604_nodes[] = {
 	&lenovo_yb1_x91_drv2604_1_node,
 };
 
+static const struct property_entry lenovo_yb1_ts3a227e_props[] = {
+	/* Value taken from the Lenovo Android kernel code drop. */
+	PROPERTY_ENTRY_U32("ti,micbias", 7),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_ts3a227e_node = {
+	.properties = lenovo_yb1_ts3a227e_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -304,7 +314,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.init = lenovo_yb1_x90_init,
 };
 
-/* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fuel-gauge client */
+/* Lenovo Yoga Book X91F/L Windows tablet needs extra platform descriptions. */
 static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -315,6 +325,23 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 			.swnode = &fg_bq25890_supply_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* The jack-detection IC is described as a secondary RT5677 resource. */
+		.board_info = {
+			.type = "ts3a227e",
+			.addr = 0x3b,
+			.dev_name = "ts3a227e",
+			.swnode = &lenovo_yb1_ts3a227e_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 77,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "ts3a227e_irq",
+		},
 	},
 };
 
-- 
2.53.0


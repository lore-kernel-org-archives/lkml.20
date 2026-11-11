Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385730;
	b=kPjSOa2VMexl8wpVsElUbVlFyU0l6ZJdtM3Tz2V6nf/cbsf5lqz4l6W0bVYT0coKPQoH
	 u3wj+HWWD+q8N6lAqKvrcXVYiboYdaOICpteJDHGUt8n9ScvwB4Dbra1RCi6LeYRBlTdZ
	 /GeUDHu6RJnbITwlrgkhqEHz3ZUzPJfWlOjkXBBaqPgnJAltDQ8B2qL1TOdTB1jY3Y+iz
	 yXlp4fdUx3xZNjjpfE5X+KJxwEdm1XPb3drBowEyt8g7XA6+RGb4BFkkQZpMhEZR0Hwsi
	 Gv8eO+uWy0ELjMe9T2kBghJ+5rcQfkWhNczEBtd3y4EcZ+bvJCuesWsfeImmgOJ6ZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vib/5TwxB3fUtDLG/5zdfJfLg2wHWLUrNvbITdsjIUI=;
	b=Md762hRsmrrfZk3xfZHm12yGb3g6dnG9PmhxzCqUM/dmaNMLlAcfqzc8ywXj8Lpl+umY
	 e8ypaDkDpcy9XVdagMNxXEqXhH8so0T8ZkWMCkpd/Oxe0SW+oOp/zo1Urr+hswJ2WFBgT
	 lZtKsZdUhdaQMogoEhBUb6mfb1GKy4eXZIgy6eBc2WSuneiCrwJr6ULgiFDPyWrGFByas
	 JRIyy6tRee+mQH9eVFXvZce6ICB1+osK9u4cSL8r24aDBJIzhZ1AMO76SljjVA3+TrdTC
	 65N/MpS0s4rRPOM7zVYnn/Z5Nmdzzti8WIi70iDKHVvdzcXeXsCswcXkdxzicpNprBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hj/zEf5Z";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD3760A2604
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD3760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hj/zEf5Z
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c247f6687dcso480738466b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385728; x=1794990528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vib/5TwxB3fUtDLG/5zdfJfLg2wHWLUrNvbITdsjIUI=;
        b=hj/zEf5ZsGeU1Dj2Uyl6zl40lou6eCr69g4V4+JHq50ZUtlDFqgarsqdQpNTQj6h1y
         SW7L6jF6CZswNIy2McH+GbiOR3a74uPCevRWpcRdwwgVFfWVX1gHssPEHUtvC2nVer43
         mQurA2rNYiOm4A1O3UCtYPxNLO5I+au509Qv904jiJNBaxyJpg+uj3vJReqwyqvIuYqk
         YFSdamBwN0GOPESlfEWa0f2lEMini4o97i22EvGU7PTHQVj1RsMfZU5XTF3CF/0a+SZY
         KvwdaTZG4lS8og4zu5Zb7/Nmu0DtkvtimNEB0bgXS329O6NSBCwk4Z8QajH5YqypplIJ
         ARgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385728; x=1794990528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vib/5TwxB3fUtDLG/5zdfJfLg2wHWLUrNvbITdsjIUI=;
        b=OEeMhDbSNA3JHe9ns/5XhJ0YP6q1w7Bb0dTqQ0p78kdFX0yYaFms7W13H+f0wQOP7Z
         h9j6p4DSkZNu642FWrSdvG9YrxFc+rkIPopjd3imRzWuoOMnxeufVsaQuE9d3uEewdFS
         29yBewDAKj53BmzpvzlKOWYPBkaIgW8l/0sNik2eYmAW6s8PHpLAoDyt2vDGfrGJfR9n
         cyibuiKo0YY0rARzeyIhFP3Dxi6IOZyk58bwryGgxUO1ha9RuERbDh0Jt1uyay4fsj2Y
         VGr6ldsQe3zkEYepEZObbtLpHtu+wRN6RAcMhh7vZi3KoW4MGnDCTKnYzPW36Phkc6Pt
         kyog==
X-Forwarded-Encrypted: i=1; AL+hErFVZrJyIeXJTK7hEqCGP/Sg6hRj68mp1JdoMoqgg/HNUmwCTnHwbo1/DzmYso182XHp3IM8NXviIybR1aM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ShC1ecHO/f62C69fYfMHXRxAv9gW2buQK8YVISBothHC7ZvM2
	JW2kIZQJVlqYffMilF9yxdD3rw0lCGVQVMwxfq2GD0XUkkgMogpJXScA
X-Gm-Gg: AYBFou3SR8KwzAluIRE3CXR1R31B8pe6yTHVKF5y9x81mDGOhP83AuROTPUaZTcnkV8
	UF+2kCT7IX7imqw3x027qK6xp5E2t8U/KetDPh0H9pk2kD0QmMUR102PJKMjqV1umyyWdNNg2jR
	LugprSO0qGpFek7X0RGdwrQVgCfgaFfO1iqbou9jrxWGUKeLvQlvEwDFouHgSOAOZlLENVzMVyk
	4tpZvfWDMVj+SPjz9HoAoXT/JRc+ooYfT52vjEOY3w5MhWSGNGiIqpPBcDQeLV4PEtXiHO83x9K
	WUBK46rAvs8M7Ma8dhP68pd09QJNq1VcH55TaSOU4ps5j7sH2QkA5x8L17JJaHEcEl2MfSCIxwo
	tYNj27xPxM+dj3MJI2eLm5xKSMwJMrmpMEy5RV8g868yN23YO9u8maEZSgGKogXD/E3GVAOfoL8
	DWG0Kp1SLa66u2ce9sG8VsjnYJPzGnmHYUMM7swa9QRU+bEtwIoUtKvtusO+QX8YD+90vToZ+2W
	OSMA9046CIUBCLTwMjcankfzgkF2zimy8nWVi57I6ul6VU8Xu97PEOqMoT3d+9uHUaobBfpvPKb
	jIn+BGBaAz1HzL3fzUkIYtfdnd8A04sTUwMFJa/wbO/fdLfxkSwnHyoMDplgytx/jxg/kxcyPDi
	GiI3jVyZQSKZKHP0+hT/DJYX0gBfoXJkvKcLOYhQZXcMgbO1ZN1awTfiqBX45MMHriGrpR2fTw+
	IVBovQ0DI21vveQgm9ZRrIik6cp1tW8Y7aP9HeL0pdgRy3
X-Received: by 2002:a17:907:c10:b0:c33:ae8b:817d with SMTP id a640c23a62f3a-c5066cf55b0mr113938266b.46.1794385728356;
        Wed, 11 Nov 2026 00:28:48 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:47 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 1/7] hwmon: (nct6683) Add customer ID for ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:32 +0100
Message-ID: <20261111082838.1418051-2-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

The ASRock B850 Steel Legend WiFi has an NCT6686D with customer ID
0x164a, so the driver only probes on it with the force module parameter.

Add the customer ID so the driver probes on this board by default.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
Tested-by: Alwyn Kik <alwyn@kik.pw>
---
 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 62da8fd011c8..4c137eda6583 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -97,6 +97,7 @@ ASRock X570			NCT6683D EC firmware version 1.0 build 06/28/19
 ASRock X670E			NCT6686D EC firmware version 1.0 build 05/19/22
 ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
 ASRock Z590 Taichi		NCT6686D EC firmware version 1.0 build 01/25/21
+ASRock B850 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 10/29/24
 MSI B550			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI B550M			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI B650			NCT6687D EC firmware version 0.0 build 09/27/22
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index de5b0194c256..0565ca9290eb 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -209,6 +209,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_ASROCK5	0x1621
 #define NCT6683_CUSTOMER_ID_ASROCK6	0x1633
 #define NCT6683_CUSTOMER_ID_ASROCK7	0x163d
+#define NCT6683_CUSTOMER_ID_ASROCK8	0x164a
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1640,6 +1641,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK7:
 		break;
+	case NCT6683_CUSTOMER_ID_ASROCK8:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;
-- 
2.53.0


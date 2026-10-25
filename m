Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897575;
	b=Z3jqkNW46ifF5DSVPfmZwctbE5wouC2ds3moDH/RENYObqpz0jBa+Mc6DdxroEGady0p
	 bzE67/xdrzB8hGC/sgj1DSYKyAnsAn0+LvuKXXErN5ry4uyFRlR1EaDuezp1N0/ASE54R
	 RsqRMN5luGd2ynJ2pUUPt852vng27GYDdl6kSiNBvNiSUvQVKWkF3Q8QiBJfIpehR4QSY
	 n3+aRptidFzs4dfVNgOpoPlV9c0qujIvqqEaYvvIw4T7Xyw5G1xQhViYQ3NDq7y3S74wT
	 /s8m6CgpXlWyTeqzDNWnQfOC2XAigRWkVY+wuocOJAvVwLAa12ZP2NwSusrDucMt4pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3WaQqS25spNsxL4w/1bJSObHZxRnTWLajGgDREChJ7c=;
	b=AkiGX1CDr24FPLjFhjyE7DhyAty07EYg5oOpeXWzBVMDMSo/cmq5tZo48OZ6ZiTq1xhe
	 l+PHe4kDG2kL3gpFV0Zlb0CX3S83IRsa71MV2byBzHx2pscSTJgcYe6y0Yvq855RoZSPv
	 kTS5JoPhcCvdpZRBfbapZd1vTzhcRANQRiZFiele2DF5qwl9GZ7+lwH0/gXaASxhAkQKL
	 F/kcnxT7dpvqfEFdApwo2PW1VARRR6AODmuCy+RODhd7fm7NYIz8ETuKp/PbacOqTDtwN
	 0XE5CvTgadKJMG26LMGEIAIRpyLK0S3fDgZlZKz2Hgqtm2OivMHPCxciBi9S0CM/Igg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r84+T+Sz;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B84606A33C
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B84606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r84+T+Sz
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so3031100eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897574; x=1793502374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WaQqS25spNsxL4w/1bJSObHZxRnTWLajGgDREChJ7c=;
        b=r84+T+Sz6Qp/XXsTS6JbFAbAJ0pyvmqxoJZ2JK/Fj2GxdZW5CLVh3D7Di3phmsdgIl
         Umaq6bc41/8/svkYYerxV71ksY2WGeYOG7gd0BGdxBuUkH3eictMEHOhdnK5TiqmQS7x
         Z/Ynh/LDsKyNPY5MSH0dKHyRGQmvr/Os0/QeF0yxKd0eqTCTSm1frUfvaScWY1mv4wj6
         Fzu+uwsQ2Ecse5Y44CAXRY9rAS5oTxFJqgDQeQPL1P06hbmme96Eg6riIvyz14NgxwFh
         J2sdAZorXhTJGLEXXhTl0LDLY9bQRjDZqOq+bvgrS3Z/9D42ObDyjpPxln1N0ybYGFpN
         3uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897574; x=1793502374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WaQqS25spNsxL4w/1bJSObHZxRnTWLajGgDREChJ7c=;
        b=wP7iGy/oQxe5PKLb730EmCsiirtRKh+hOV7QP4xLi65QNWMy7Rw6MMW24L8eKOxPmb
         xRMu8yHNaQIr3TDaNaG0Os5roD4ePzmxfb2Vhxnr3gOcpUFXEd/ObthjBzXxNyN0d+Fu
         SKg8IQij04MThz/XV81vqEv+46BFrBpnEjOYYsAg8fBY38pLFsmCxqKCowpnqb3+aQft
         ex4h8wPelcLAWa9b01ITLRyKrOx4ZpXHESScGG0+VV6aadDolN4GYh1V2O3N1ZAxYHjt
         wxKtwlDMSGE8hGR6+ehc9va9EVs6pjexbQGMXd8iTUPdOpzIOvIli17A2mk4HCvFrVqG
         S8qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKIIJEKLOISk4PCq4Q5DfGXoeRUr17GTGM1dOVUJmRF0POF4g8/oSHgqTV0rzcUVG1FHVFRyUBMMizW7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0iB3DqzEvH/cS7dgXEInAHw+Al+HCfQYYqwClaN5i2wojyNvS
	KEj35VBD3DtkR6FTCdd3XmrIeeM69p2hcRGSVjMQPJfpX67CyuOXCn5H
X-Gm-Gg: AYBFou3MFaAkOKPVkPFEg01dZXU5wjQRF/HKozF3PoX5XGUKBVhaJTRGyZ3zdYaIFLq
	40eI21Fe4gkoRaCmCYJxOP4k/MhcV4VUrOYYxwYqKOHUvHkAa2P2jxmVEvTjPRxUnTc8fExQQS5
	0fApt8GLsAAtN+2ndnOIfDAD0dTninsSzvPcwSxp7NuRzSxwVltwA+c2xQ5ZphJaKvaq1mewHcE
	394KyWDWfTPahqYPydM/+C9mgJP1hmhNLImiYHiSLgPQkTXH4ckLENuQVsHaLDW8S3k1xmNOzkx
	WHD/qQyxGikUQs5YZZEoDpcEsVBQHbziqtXBx0TgRJ1yZQ2fc6ApgTK86ugyqo/1hIt7WCCzEG6
	h9MJgZphlCU9KcvSgnCgoOiIgD6y3Q32YBK03hxdbnsxI8ylbbCpiPTNKDOX2y3XKbsKSP/ZHMH
	cGQZlxda/X2zsiBSw7JGWPfOYJXPd4SeoQMYffnKEED/pP3eOG/qI2hu1njbwmuEWtj89dJMhld
	VfyNRvrz/HJdpIxYKpiAf/PQEBLRJS6nfPGoIUzY9epeI92wNqx6EeuyrWIPuEJbAQTI2gCi3uA
	yDPnffAfltMmyK0i3Cjn/F1byyCm6+2eshpvPpMVT2I=
X-Received: by 2002:a05:693c:68c1:b0:369:f2d6:4108 with SMTP id 5a478bee46e88-369f2d66dc0mr2290762eec.10.1792897574310;
        Sat, 24 Oct 2026 20:06:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:07 -0700
Subject: [PATCH 04/31] hwmon: (kb9002) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-4-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the size of the receive buffer to i2c_smbus_read_block_data() in
kb9002_fw_read() and kb9002_smbus_hw_read().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/kb9002.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
index 9f4521630f3a..01dedc00c3f1 100644
--- a/drivers/hwmon/kb9002.c
+++ b/drivers/hwmon/kb9002.c
@@ -183,7 +183,8 @@ static int kb9002_fw_read(struct kb9002_data *data, u16 reg, u32 *val)
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_read_block_data(client, KB9002_CC_FW_READ_DATA, rbuf);
+	ret = i2c_smbus_read_block_data(client, KB9002_CC_FW_READ_DATA,
+					sizeof(rbuf), rbuf);
 	if (ret < 0)
 		return ret;
 	if (ret < (int)(sizeof(addr) + sizeof(*val)))
@@ -208,7 +209,8 @@ static int kb9002_smbus_hw_read(struct kb9002_data *data, u32 reg, u32 *val)
 	if (ret < 0)
 		return ret;
 
-	ret = i2c_smbus_read_block_data(client, KB9002_CC_HW_READ_DATA, rbuf);
+	ret = i2c_smbus_read_block_data(client, KB9002_CC_HW_READ_DATA,
+					sizeof(rbuf), rbuf);
 	if (ret < 0)
 		return ret;
 	if (ret < (int)(sizeof(addr) + sizeof(*val)))

-- 
2.56.0.257.gf7497c7d27-goog


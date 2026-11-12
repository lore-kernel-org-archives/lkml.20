Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466584;
	b=bVSb9A098vVkqQKNCq0R/2w6T6AADGAc0MscBLXNG9oWfyB1DcOwYVPQpDi8EQ+hciQ2
	 FyPkwsuu5F3IrDNYK331Svqg70Oz3pLTR+eII8aAQYmRe18VGKqHup85KS03PNsivsmVG
	 VMIDjJGMewmWB4SN9RtXOBrvUbxpxniXRitdJre9Su9pnk5tlYCZRc2t7FZIEnYMDMLQs
	 +Q+9EvqAf48zYhhTapXyB4eNkQY01WViw95B6Sc/2wsLvWxUs3yt8rgB6r1SWSwAlEo6/
	 vLMEaLdtqXiCNS1ZbJs5Ncg/Y3DniEIynYRKz6PxonA8Y0MtgF4gseUYynfF5YrW6Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vTav8FAXb6nFTtunUSm9Oo3pbBRDYrw795godDfr3bA=;
	b=SdCoX7IaWwmLcnHSraQt5cdP4IVpgLw/dgRnXUmxdXD2lnEXAXs1kLAAromDu6WnnB8K
	 cO6Ga1uyiQqkIhEn/ofVTLdr4KqIf3XjOW2GyptesdpOTVNntaeReeMh8mRjsH2qZ4tX9
	 +U/Q8NZkXlMWacP0R803Bj4QTs1YWA6hCLB1m1qP6MX4iDe01H1HBf/ND23qBAsXq+VSO
	 d4RtRDV+rbIHSX3NSpCmD7x5WgyX5Xoj8/erhSzbhIMmMfeYs52eMwIp9XALPv/A/9kFv
	 AzSTCBQM+MHaTfvTSIuyXURkCkie1rLhu2+T+7EpczyrBYb+yZowD3YnevBsnOQAmsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxyEoZuZ;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7B0606A8AD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED7B0606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxyEoZuZ
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93cb9e9405fso210900085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466583; x=1795071383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTav8FAXb6nFTtunUSm9Oo3pbBRDYrw795godDfr3bA=;
        b=UxyEoZuZZPTpShq4yKIoeWQVufiwYeT6C69K4s4wsmxpWWb29QQTHCwJBZ4JcKQ3np
         qWq9MEbtxFWwBGbxG+GJ2lJj/UDk+yRg4L2Ud4rYX6V2knajD8KaJDkv4yLyr6s9C9wT
         IAr2K/VZiMY5a4NBQocjqklXKnCDk2L7c3RXsuAWVKvFUmU35gE6V0rrTNxuDgz+6neU
         qbOt3i6kBYDqRCRqz7f2/OwUHLZ/tqp/4xRbr7U0SZTtCKzfAua5rqGYO6kjSx0VMkvU
         o8CFYrkC5zqMEbNUnylldLJhDH4Msnh55xEQeIf4WS7DbZBAOPEoyG9DU0+Ye6VwzbrZ
         UxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466583; x=1795071383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTav8FAXb6nFTtunUSm9Oo3pbBRDYrw795godDfr3bA=;
        b=hCrPuuZvq5UTIB/l2Hw4uFHVwiwqMrxQJEac/sT450yuq03a7nvD8A9ykcUqH1sp1Q
         BkucYT2EhslHfd52Q4iYHqmFsaRD8dIkffpofLDU1XPqp8HGzxjdS10f8Z/RExRT2FG7
         In5zgN2XyIVLvXdq92+WoPEt1W6NAPfvdN5gcrMQdR3OmjD7zhbj3PkWKBalwyR3BfzV
         Xnkrh0oS7e+j94e+wznsr0E+LWuY0tVdBJSRXu2Bzb2PlK51ZJlBABGEIbA/hwYWx3l/
         F+q/aS42rNyqQH8Wpv1a5mhfLCIcNQ19IYfRh3vwhWncdjzJMixdYe30Zxm/3RhwwSVT
         DIpQ==
X-Forwarded-Encrypted: i=1; AL+hErGnUAbb4TCpaEqmaHRpIzDzfsLuK8xkgamEWODuj2pdpFNS5PRipWttFMSuxt2Y3hWdBgyLB3+PMLSLy2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8daxxNprCUI3M9Oz6GuiRKGibZN2hZp4OCKLzofon3T81zhle4
	/OrFDBr1wmunvRPbUiMzJCKLIxUVTDxUB4/tKjSBv5Irc49wMluETho=
X-Gm-Gg: AYBFou0UOFjpmeD8qjIKeXEaxsPp4cUUN2b2C/R79LDE1pLkyqim6xgBDL3yM/w5mq6
	94EOsszkJ+H9pqOj4xUyVIXFE4akrEsurPdXFhjJ2BBkA2/gxakO+Lijy8iegraOGqYwii7uXKN
	WSd8AeoR/PK6/v+B1dlhkWszVq7V91lSXte54a9vfDTsoW6QsHG9fHeuy3eZZX5tCf6tRhqSxBL
	CHWHBU15Qkz12Uq7p6OdQPStrsel5AdoN/iWwcBlsmDgToUJEST/isZN2yziQ4xwt3R+sZo8+Su
	5oomdBKNWEztY43XquIz/n5fbyHZR0UfTo5vBJmo7hDzsbBC9hQz8lVH+CUdccvIsBw1pXG78zA
	Zp2bJdwPdt0+mrni6N1KL4zvdzOBK9xHg/2OHDIAFvtb7QETw5EdrWsO9WM591kn2ECA1dwAlIK
	tkcTdI3QPY8dEvyR6T1lqy5xnbJGi5OaFE69dxQoCHzBLB1g8M9B342qpDeRUXaQXxogHAFu94J
	V7AVi4y53UbMnCHK3kAlImtLO0X7qLAv4I++B7gWqXp9HtLmXGQTX1u1dIwyy4S2WoZKuC3ghRi
	yIh5bHxeTi2eOwHniFdMqY8V4O/zpCHa68o4Fl43iIxe3HV3sIQiv95mZkj5PXqgu7n53gLktdP
	463xZ9QWWA5NHr8sywb6IPBBYCI3zV7QqSPL1Fcbf2Ce8tHkfd2b9cZAJTv7VTfX5qrpgYwNQNw
	1A/it3qAuUbC9Ic6IMsVjgdnA0jDXaSp7k
X-Received: by 2002:a05:620a:28c9:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-947affa6f31mr888523185a.31.1794466582945;
        Wed, 11 Nov 2026 22:56:22 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e784e77sm661246985a.20.2026.11.11.22.56.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:22 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: stusb160x: disable the interrupt before tearing down
Date: Thu, 12 Nov 2026 01:56:20 -0500
Message-ID: <20261112065620.34269-1-mhun512@gmail.com>
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

The devm-managed IRQ remains active while stusb160x_remove() tears down
the partner, VBUS, role switch and Type-C port. An attach or detach event
can race with partner removal or access the port and role switch after
they are released.

Disable and synchronize the IRQ at the start of remove(), before any of
these resources are torn down.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/usb/typec/stusb160x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index a2ec0565bd85..ec2f4d7f7ed3 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -801,6 +801,9 @@ static void stusb160x_remove(struct i2c_client *client)
 {
 	struct stusb160x *chip = i2c_get_clientdata(client);
 
+	if (client->irq)
+		disable_irq(client->irq);
+
 	if (chip->partner) {
 		typec_unregister_partner(chip->partner);
 		chip->partner = NULL;

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724586;
	b=qkw6Uf9CPuBXlAoWmH5l3+/EnnZ5jYoJ5ACjf30up47I26kB2Hm0jMr/N2pS6vaJUS7K
	 SSLrG55gpUSKOrgM3gTM3o70BbUZRhSs2tXCpZ+jm9nD6nWeNw6vE0dPcbGwScRfAE80Y
	 5cKzqHLPoSO1N0k6GQXr7svAzquc/AEMjbTL1vMhrnoqQV6kU89RrHQzzrfeyxYNyBtNK
	 tsD9a6sb+GktQ3zwsSS43NeYrhuKH/actzH4LH9L3eCy+bzDL3nCSrgZowhEfXHVeKnbu
	 UYtA6nhqYZvPFenshF+0jo+xfNV6sp6a9n5Jhx+MKOvvXys1SshacHaICJhkq3uTUag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724586;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=vrUn30d9aD0WnkF3mVI+esdhIKk+wHZiOxoTi2poybM=;
	b=MQyTPhe4QOIMQfsCaN/9iGT20l6+Q1z2nyMmqmYGu0I5pbm/+aMVelnZwpStwvJTrANX
	 eqJdoZVIIC7cJsBM/N0M96VFnb7RQVHedtj4Q2LKPRMfSQNUqtGKirfxAjBehDxoRIn2K
	 mTAVUoW8r/eug7kAmipcwqMKaZpmT77LCfh5cwvT4QpO8qj27yuem4LYNMkt3eeIc1TnP
	 G3whUyivqaj2zbTyRYbYjtRt2Si4/bQX5FaxU7dg4lcCsENxr1HBLpfGFyQzztXxFkS8h
	 iWfvRfXORk8ZQaKpDiAwSi4NtpayZzcfohfsXSut4hhODj0QV57CXPyTDNKac9UreGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCRY34IV;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CD2606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CD2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mCRY34IV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3790BC49F46;
	Tue,  3 Nov 2026 16:50:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B8F36046C;
	Tue,  3 Nov 2026 16:49:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4797C1032920A;
	Tue,  3 Nov 2026 17:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793724580; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vrUn30d9aD0WnkF3mVI+esdhIKk+wHZiOxoTi2poybM=;
	b=mCRY34IVz7fqYO7fRkIu/hXLV8B1XzmlL4cOftlKpmK9mf1fWl3VrBkw3IkqM2eQj992XR
	bXLdcbBCYlQOxNqOk6H6p02nzcaZYgmPAMUhpU5zXyF+rXbl6RJVhuYxhmvJ31xuC0v+P4
	7lC4Xh2pBIX5FKwLoqT6yfGmoKXvUT4Jti5qOKk73Bl4L7eCMEh+V15I0R17anNkhDymGC
	LBKzhva9WFjMq8kSx+/8UQMITw1vEZmLJlBQ/HLpqbs5hzN/QgZL2rXSRLJbdsjSFu0jVB
	4iTLWwegAchfyFLDWLY5kDR8jQAPe/QCEBMkX8uXHGGx1ulacghZR2VJat6uEw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 03 Nov 2026 17:49:17 +0100
Subject: [PATCH v5 9/9] i2c: cgbc: Register known I2C devices on the bus
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
Message-Id: <20261103-cgbc-i2c-storage-devices-support-v5-9-ac11f23fae51@bootlin.com>
References: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
In-Reply-To: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Register any I2C devices defined for the bus at probe time.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-cgbc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index 8623a5d03636..3226838cca46 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -356,7 +356,7 @@ static int cgbc_i2c_probe(struct platform_device *pdev)
 	struct cgbc_device_data *cgbc = dev_get_drvdata(dev->parent);
 	struct cgbc_i2c_platform_data *pdata;
 	struct cgbc_i2c_data *i2c;
-	int ret;
+	int ret, i;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -385,7 +385,15 @@ static int cgbc_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(i2c->dev, ret, "Failed to get I2C bus frequency");
 
-	return i2c_add_numbered_adapter(&i2c->adap);
+	ret = i2c_add_numbered_adapter(&i2c->adap);
+	if (ret)
+		return ret;
+
+	/* Add known devices to the bus */
+	for (i = 0; i < pdata->nb_devices; i++)
+		i2c_new_client_device(&i2c->adap, pdata->devices + i);
+
+	return 0;
 }
 
 static void cgbc_i2c_remove(struct platform_device *pdev)

-- 
2.53.0


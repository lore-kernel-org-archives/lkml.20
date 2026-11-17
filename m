Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908876;
	b=lJgojc9tjDpTeAZET7BIo0OeBUUswizoxnpX6NSv3vOoggOw7BWe8P2BMO7IuUcs0HeC
	 RRyd7syICmMQlVZqr80GfkD3nR6s2xroCKH/9iLBdOje6X6AI5obuxbsVSxAaHVfTsr/d
	 MY9nu+foH3z3IXeNSqOCD3mUcejQv9adEkK4G47qcQCd65UiCqFViArBs3gKTYIfFrCGX
	 ctlkQwXdKdVldWh042fRZg7oCluM+t7XUpuPjpu8STC5FCJEXippSamfPOR3K9eRMhYqU
	 UxEsjikwUovX27puFv23ZbIz4E6Z1bPJI0yayA7RitX+bDI/hXKFlO8eQzdSuTufr6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908876;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=IiYxbhfaOx0Q++iKRYbtpp1SJX5K+HM2T6/FfN15lU8=;
	b=zgeS1urBjzwScOluEXcM0MX5HQ8d9J5c7dUcUQUQ3vcuqw3z+qV0zZvF6c0Wfo0dR6h0
	 JIVt5liB+Bb/DhFDiID6rwrKH1E8YFTZBwM6K3k7VmZgPa9y8hQdDXG0YlsunkxhQfcym
	 5g3Cn3hiyfCabRfmPmPRKP+HzgZ09HDxXwC/UGIpdUY2yfiHOPTmVNY5BL1XdlAPhi+BJ
	 MAa/nqOcslYdhRRvsIygJtkBh2HkhjzPPsGZGwmVeATyDZbMz6K2+kcWnUf/Oty7A0nCu
	 MXiBOj3eSFzvfV0Tr3rTNjl4pTOGRRS8450F8KDwwC3P+mHdmMbVvy6ln7NDWWDnrrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jaCQXuFY;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B20606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B20606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jaCQXuFY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5B164C4EDBC;
	Tue, 17 Nov 2026 09:47:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 098865FC81;
	Tue, 17 Nov 2026 09:47:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78EDF11BC09A1;
	Tue, 17 Nov 2026 10:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908873; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IiYxbhfaOx0Q++iKRYbtpp1SJX5K+HM2T6/FfN15lU8=;
	b=jaCQXuFYopsxdgNuAbehnFMlonzetW/7f7ttToMaSIEcV0/malKmu+E27q6WkNprxBxV0S
	5ilmcaIpXqE6UoLdAQb/JguVbgNv77Wsie/p+RhE03A07wLb8AMU5nm9lj5wGNGKhBFcsW
	uXXqMgYwxz83vTyEpkav7RfMQjHai2F/Fs7qif06HGuiZ1O40Zg65NOMrHjv/GbzELLjtT
	8KNAeUKJgLvDk2t/Qa2lC34s4uXKM+7Oy+DhR0vE4pYK/zsSdDm/s9lkSduwMBuZxvmn6L
	tquQolcyJYSfEbvIvRQXoiRTLsnOT7d9OdAtcDv/eLFzf79Anm8yYqk11Jechw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 17 Nov 2026 10:47:41 +0100
Subject: [PATCH v6 01/10] mfd: cgbc: Fix use of negative error code as
 valid session handle
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
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-1-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The cgbc_session_command() return value was directly cast to u8 and used
as session handle without error checking. Casting a negative error to u8
produces a valid-looking session handle. So check if return value is
positive before to cast and use it.

Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove-v1-1-79274ad62b3a%40bootlin.com?part=1
Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 8a63923d1912..1d5c99a38e85 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -103,7 +103,12 @@ static int cgbc_session_request(struct cgbc_device_data *cgbc)
 	if (ret)
 		return dev_err_probe(cgbc->dev, ret, "device not found or not ready\n");
 
-	cgbc->session = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
+	ret = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
+	if (ret < 0)
+		return dev_err_probe(cgbc->dev, ret,
+				     "failed to start a session with the Board Controller\n");
+
+	cgbc->session = ret;
 
 	/* The Board Controller sent us a wrong session handle, we cannot communicate with it */
 	if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESSION_VALID_MAX)

-- 
2.53.0


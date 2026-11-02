Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578283;
	b=kM6hcz58SsaO/CysGgYbjOPRuDCmntNbGXeFY/l+/xHzNq++jVqIwnFbP3gVQQkL4BCH
	 uPKrYJe+X5emGg2IBXiElxNVKbDKsVvsxFjFReZVZkopLyykE1h8xng2ioToYgxYQtkzB
	 gfk0qxR4hyS3+8fgtyxikkUzzW9cmx98p2b7RAFbDFE2QJta21MhvenMOHpd2JfR7UoVt
	 6K0UdYkvv0lp5KwtaK1S4QapP2VuVnBiElAtq6dU24Ah2ZzEFrbQPGP9HVR/FbuGKT0oo
	 Mq7vigUR3z/uRSr1sd44T9Me9mrWRbHFvtCCYh09HvjLgLcQovPQe8s+Oti+g5xsuWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7VWjf8n3WvDFh+c5IGrcgvXEjMEwnWf0FFeeKq0U6ZQ=;
	b=ydpAvkLQa3uEaZA/EzsIvFdoClv5YmIjADD1M6CmS5S04xvjCYZ/R9mUt1hUTPMe9o9k
	 Dfmsyi6gr9bPHwuCou7CbWP7T7lvu1d1mmKgYzhJwvdSLwx56UbaywmH/WZiDmn6sMYJo
	 hkkmnrFaS5+W8aMCeWWmZwvnVohUACe6AihSR61pfoSsyGD7PEIKyWUcvkRR6kLb3MZ20
	 zVaVGdfPjEQJJRdTfcow7K5aMuPQtkE+EdYCirwXngtdeXsQfeGAz6W8nvSdDdJ6TdBXd
	 tqm6IS6leuoZMKXhk31lrL9ojZSI5A5W3WcuZT7c1eZsR6DZEmr5GwHDs98zQuhDQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKfEHFCL;
	arc=none smtp.remote-ip=74.125.224.130
Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744F606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8744F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKfEHFCL
Received: by mail-yx2-f2.google.com with SMTP id 00721157ae682-8b0fa446a94so7788997b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793578282; x=1794183082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VWjf8n3WvDFh+c5IGrcgvXEjMEwnWf0FFeeKq0U6ZQ=;
        b=PKfEHFCLO1Pa2cwXivsCSQUdhT3MH+Xe7A3u+cpoivfmVBg9GYcp8AE0qcJZBBGoDc
         bam19pUfhjf2sypZHGXLnDnzzLLFkiHRDJ2JrbFWIBDrnMU8+KLHlbvlac6gBqGpS8PK
         VjTIPr38Ne1OrzcRdeexT9SZUpjf9StVawHOIAsvPwBAPD178q4dfSjmYiT1V2HeuNDv
         wMqt+T292rulJCMlY28IbN1LdqKuqRCbmtK274uv53+uYBQnkRGOK/+cOAZliSvqw2Bu
         wO+bk4An1XRZmuugQaTUteNyk6uz9rZCdAuNmi3JnnYXV49oUU86s3kt57f56JxxabRn
         OjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793578282; x=1794183082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VWjf8n3WvDFh+c5IGrcgvXEjMEwnWf0FFeeKq0U6ZQ=;
        b=rjTkvQb8dPq0kEMCbHE+w4iAEFzjNEPDXKcvKBsgfNq5s9CFY+wdl0BRrt+j+noeCL
         k59dYVMXer1SWeohXTByS88mPwBvDUSQBechtXL+1UriUESVap+GNmxk+EyvQ090/TKv
         +78VqnofqFkSj4sw2U/eptPtvt5uX7XVw1IV1TqCHcOJnQuVL+f6VZIkSVME8V3p3HJ4
         76TM/A3m/kpZIE4mPl2NKa1v0GT1HG5ao+7evayHVFOvNz2B0BsstyL0vMpEl/J43vm6
         bzP+QKCSTgQjgTy++EFp3u/KGeVYsSi+1NTb13UN+kmU4UmbkYtPTUf0l7xzrJFNaSqQ
         WdzA==
X-Forwarded-Encrypted: i=1; AKwUvByqnskt6xWowZ7BM8IJykbc1OVgB0MVWJZ3K3lZLTU6yyfB8vHdZN+z6+pASBOqc14SdmvOaFmSxkjVgJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/f00JrcS90k3rlbNfd4dPqQFHCM9vXNAimcS936Z4RDQVxWed
	NXWLZkSGZ9moQJFCe0F24RMSRu3KsTin+76tjYfyqrlPJpRc0D/AzYHq
X-Gm-Gg: AYBFou08b6yImSNZEi7EOA1CEQiFPB/QQXf0KmPYYZAxmJkvHjz6FEKvvfRHKBIFmZJ
	xbP1wKz8HB3Y9NP9gJIIbi4PbxsePkUy9GPx10hzoWbkpk2yO4lNDsbsMVwBrqCc4hqLKVOPrQV
	QROtJaiGDNXmwCvx89nqZcgLbF52AyOkQP+d9Tf1DSFqQa95NR3VBbolikGNRybvD2jeNCJWTVG
	zJrIiUiy/FgTiLg2F+TNnXHfVoPVNGbxYyvuEHpUDcB/+DAMe80qeGmZKvejWmVSeMr19UATm9Y
	9nbShSkuaJ4KjccBEfh5qL2Z/5z+bc2JiA7hTj0WJddkVQ3ptnlhPrpLQUruBVN4Ki4S1KlW7cS
	LvH8wLerPXYYgzA55Ol9lk+WyM9AUhw3ycVhrbgDg8RPldg5Si4lPXBLyGkiygnj01i1gPgbzu7
	PhKgGkGHgbNu1gGaVQvh6BO8bCF0JCOlQRlILWNl58Os/dpBDMag3ZNCXIg9JsaT3v8Mpe1rPyD
	EfypfLWEMx9uQzZkhohP/O0/n3U4Dj+Trki5KWchUoaGEL9PTZuk4tFGZvsOSkBV8jD5pcYXGgV
	T2e0OWmJ/E8JP2LnMo7wNTkFC+aW+8k02mRKA6hShsTGLW4103XunApfejUhbTzEPJmb8U02HNB
	NPdBFK3Y=
X-Received: by 2002:a05:690c:6e87:b0:8b0:ea29:c543 with SMTP id 00721157ae682-8b2b658dfdamr48293017b3.10.1793578282295;
        Sun, 01 Nov 2026 16:11:22 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:90c2:3933:d321:134f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd57sm43161587b3.23.2026.11.01.16.11.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 16:11:21 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	oliver@neukum.org
Subject: [PATCH net-next v3] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
Date: Sun,  1 Nov 2026 19:11:14 -0500
Message-ID: <20261102001114.38144-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
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

usbnet_read_cmd() returns the actual transfer length, but cdc_ncm_init()
only checks for negative errors when reading the NTB parameters. A short
response therefore leaves the missing bytes zero-filled, and
initialization continues with parameters that were not supplied by the
device.

CDC NCM 1.1, section 7.2.1, Table 7-3 defines a 28-byte NTB parameter
structure. The pre-errata structure also contains 28 bytes: NCM 1.0
Errata 1, Issue K.

Require GET_NTB_PARAMETERS to return the complete structure before
continuing initialization. Return -EIO for short responses, including
zero-length responses, and preserve negative errors from
usbnet_read_cmd().

The issue is theoretical and was found by manual inspection of
usbnet_read_cmd() callers with LLM assistance.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v3:
- Target net-next and drop the Fixes tag, as requested by Andrew Lunn.
- No changes to logic since v2.

v2: https://lore.kernel.org/netdev/20261011035150.53315-1-xinsheng.zhu.ny@gmail.com/

 drivers/net/usb/cdc_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 19db5a668dcb..5715c4bf732f 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -524,9 +524,9 @@ static int cdc_ncm_init(struct usbnet *dev)
 			      |USB_RECIP_INTERFACE,
 			      0, iface_no, &ctx->ncm_parm,
 			      sizeof(ctx->ncm_parm));
-	if (err < 0) {
+	if (err != sizeof(ctx->ncm_parm)) {
 		dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
-		return err; /* GET_NTB_PARAMETERS is required */
+		return err < 0 ? err : -EIO; /* GET_NTB_PARAMETERS is required */
 	}
 
 	/* set CRC Mode */

base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
-- 
2.54.0 (Apple Git-157)


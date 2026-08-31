Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12FE4AFE13
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190927; cv=none; b=mlrGPiySeWZzoYfD/qp7N4zpvorGcmEOLKUDC867z1M9GZ5ulYgYcFAtAoa3dTSVwTy8PMkGjw8sV14SKmtqc8wTdRSq1Yib/2Em01KADdJGo1z/AHv4k6IXAM3ksRFrNbpfKsazKMp988xT7WQQ6eB5XmekfzkdkhDlVrutyKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190927; c=relaxed/simple;
	bh=Gq8JYF5nWCJlfgbdytpev/utNj+z83XlgtJTacxeFCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flhKnvpfddun9leQvPQmXsYFVICV5jFid+OYTZzVj3kKPaGksmnU49TT83lOpTeMq3ADuKy9P/Efq++jfgBecKbD+mMRZcCNYrVcDSZ/7YgAH5gsbZEeO1MSu7vmt2fCDm4N6nGB538GJMIyEWabeNiqOWabYi9cP0Rlojzd4MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=iA3Hbhs2; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="iA3Hbhs2"
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3649F3F60C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788190923;
	bh=axqcHerFD9/BKdwHu8nkAm/q4tjDX8v2GkuwmfGnDKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=iA3Hbhs2YEd51rsNg2+qFqI6R0t0xGbKiU5TPw2KdtgP0T3AjFFKEW6+lwg2BRy0z
	 HkFfwVejt7/VP6UeJkQmwc5b4LAojBFU3O/f/GdSoo88lE4PRHCHqZNzX922e86Iry
	 mef86oEjcyUuQxz4q3r0OkafBDhHXe188zE1/ogNl8GBjZ1RgtJmz08RP4Eq6jZ8Qc
	 aje4nQoI7/5ZSpW/pGPq94Vl5PirdDj6biBuaEOKPrFZCoBFrmwPOB/GgIPKO93sgK
	 T1YbYwdTXeehF4xhhySmfZJjch892KnrH23A/ewFJjXcWuDanptWuZ/AEPywtBSKgt
	 IdoqcCKFrHtseHBqy0/s+VsDHoU1Y/mEd1rm4koiTK50y1I7QaJl+i8bWScEUKAPx/
	 x6qZCusTT/PbNSMnUbyMA6t0OIAI+ELDEk+kYC83kG+lDpHU/3mYbDeDRd9mbg8AbU
	 l7L/0SFY9PqU1y36MBTDks+brhwAlqYSIvU+BXt0dqLfwUd/2cdqAAoktjiWfNKxuB
	 01xn1kpDANPJqiQQ3Ow/MVR9qaM1vA9eJF6YBZgQNv5BCOcAoIhKEqy+hPtttffRar
	 wonOtrrGxKIdg5GZTkXlqgaUDU4bs1UoTbYFm6x+mnLDj6+e3ZKsvQTCHg5wtAhBaN
	 FYlRdZVQzYvxjzt+5Rm5rpP4=
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso3958423a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190921; x=1788795721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axqcHerFD9/BKdwHu8nkAm/q4tjDX8v2GkuwmfGnDKQ=;
        b=eU43zneDItoyLKuFUi4TB0ococR84ZiCDO3DdlGPgAOXXjfw3LwY89gs6mNtuZPDiX
         l9TW82tmDI2CtsfeX5Ojgq98tLLZ8JE2bYSdndXRy8RCPob8qr9qahawbFXfNcMKEtq6
         Nyg90k0FhV1DN1kHh/cnk+kb0GQ6oedGULj9rxMxGPzt9Ej7v2+c3Djij/U6Qys9kPL3
         YkG/wXupnj5ulkHPlgytAYLo4nobPIGDFCdxcAMgyonteaZy3xIaTefcTT0q4OJlxcEN
         666w2/JrqW/yTkeLJCnfp4tl4gE6G8+GGtducz4EMNSwpl62hfqrCN+sDDzN1n3jkwN8
         cDRw==
X-Forwarded-Encrypted: i=1; AKwUvBwrEV4ksly+fjljsY+aPx7nkheDkkoimhbXcD+4CsFWoV1+ajMce6lpEX5Y4rfGuWGKAz4tg6pr8MVDKjY=@vger.kernel.org
X-Gm-Message-State: AFuF++kZPHz43eaa508sWKz1Ze9SOuKJVa8hI1F8lsv9ecF7IK7Tv6pt
	2YnA4hJ9e06+ytGip2ZTA5ngfbZUbsp5Wh4BxQzi4LGMrt38f39/o79DgbpVBLvHs0orTXcPS8W
	eXRXGWFsZsu3EKf2nac2c8gW61RdLrQ9/h5E80Xs7sFn7BPhP3HbgEtvSM7dfpVzr9lDWaBF8AX
	2QiXGqxA==
X-Gm-Gg: AYBFou1GCYQ3YPbCO52juAA2cdsxqFMw6R1YpHBn1mLFPo8qO1h59NVETRzZ/zlBmeC
	1pXYdqdYNxcVyo5Yua3/m+HLj/kascJwllr7OptfLUys0wYKZv82wafhpy6n1lnwI29EUFrGZFz
	g3reGMbQPUVK/esjaAGI5bONyaE889ii1YioZJbQ1HDhAF8cn0IWjEE0rXMndSQSS2hzKt24ff2
	xATZBe4VJvq7kQjjJwga/O5BbcdJjva2uTbw8WiVYMvAZEuX4Uazi48U8/SlG7BeNVPwC+5BmkH
	0LRqLJlkJ3RQhR9jEzb+0S7jmtoD67YzmZtPriwTQ+Y4BklQQ2+/0V0SunTF69wMtfrrXhjvF93
	sZrzljkU72VKOoeTgLiPI6vBGtM3p5d+T0zUBBDmJ4dnfQIGHVHXuCA==
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr44291199a91.8.1788190921315;
        Mon, 31 Aug 2026 08:42:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr44291119a91.8.1788190920779;
        Mon, 31 Aug 2026 08:42:00 -0700 (PDT)
Received: from resolute-linux.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm36228a91.16.2026.08.31.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:42:00 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH v1 3/3] usb: gadget: configfs: drop dead store in webusb_landingPage_store()
Date: Mon, 31 Aug 2026 15:39:39 +0000
Message-ID: <20260831154139.55811-4-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831154139.55811-1-aristo.chen@canonical.com>
References: <20260831154139.55811-1-aristo.chen@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bytes_to_strip is used for two unrelated purposes in
webusb_landingPage_store(). It is first incremented to account for a
trailing newline:

	if (page[l - 1] == '\n') {
		--l;
		++bytes_to_strip;
	}

and then unconditionally overwritten a few lines later by the URL scheme
detection, so the increment is a dead store: the newline has already
been accounted for by --l.

The dead store makes the subsequent bound check

	if (l > U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + bytes_to_strip)

read as though it also allows for the newline when it does not, so
anyone auditing that bound has to first work out that one of the two
meanings of bytes_to_strip is dead. Compilers do not warn about this
because the variable is genuinely used later.

Drop the increment and rename the variable to scheme_len, which is what
it actually holds. No functional change.

Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/configfs.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 4bc95f4b6670..02e619ed14f5 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1062,15 +1062,13 @@ static ssize_t webusb_landingPage_store(struct config_item *item, const char *pa
 				     size_t len)
 {
 	struct gadget_info *gi = webusb_item_to_gadget_info(item);
-	unsigned int bytes_to_strip = 0;
+	unsigned int scheme_len;
 	int l = len;
 
 	if (!len)
 		return len;
-	if (page[l - 1] == '\n') {
+	if (page[l - 1] == '\n')
 		--l;
-		++bytes_to_strip;
-	}
 
 	if (l > WEBUSB_URL_RAW_MAX_LENGTH) {
 		pr_err("webusb: landingPage URL too long\n");
@@ -1079,15 +1077,15 @@ static ssize_t webusb_landingPage_store(struct config_item *item, const char *pa
 
 	// validation
 	if (strncasecmp(page, "https://",  8) == 0)
-		bytes_to_strip = 8;
+		scheme_len = 8;
 	else if (strncasecmp(page, "http://", 7) == 0)
-		bytes_to_strip = 7;
+		scheme_len = 7;
 	else
-		bytes_to_strip = 0;
+		scheme_len = 0;
 
-	if (l > U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + bytes_to_strip) {
+	if (l > U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + scheme_len) {
 		pr_err("webusb: landingPage URL %d bytes too long for given URL scheme\n",
-			l - U8_MAX + WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH - bytes_to_strip);
+			l - U8_MAX + WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH - scheme_len);
 		return -EINVAL;
 	}
 
-- 
2.53.0


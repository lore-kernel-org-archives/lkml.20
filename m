Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122334;
	b=p7v8dtzrxhYIjGuaKYFiLzIvsFiRHXsp9LgWo/67eIsQL/Twe4TU2zyeeFK7p3T1HQvb
	 ugDUt7ZeA/m3RSsQTfPj6s2ah0BmJ6fW0h+4SZB2NtZnvBLIAVHFt6ZDkfEjT2iQdi8nt
	 kQLbW5HyFI/a+/7K1GWqBIky+3mu7157rDcWmbG5hoq0T3DRhbxbf56ZenFs7QaxR4q6i
	 N3Q2eScierUrPnYtvvSvBKu4brTk/+S9Wh9gIS6WaNjUgdeQglcYLXv8agibHHWIPUaAm
	 pVj7WxAvjKi8TBxH1q5glGfDkOluuHgI5niv+k9fhY33iKYceviSYJtesLKOvX5HDow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122334;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=UI9LOXrLNBYSnQFsr165zcYDw51yCLo/eU+srIESBmI=;
	b=12WKrGhiSO9FJp71GYYAJted+iukBkozvKiA0vvujDqjJbZElQ5qbtPCN/izeEPUzoDj
	 kPmHEtVNyhK/KpofjFQOIKhnjQxA6JoZVgXc9FO7WWBzw4QnCdLVWBkow+sKjmlI8OMJR
	 Ed0vFkF2Q9YYC+184gaUrCUJERQoYBaFfwKiPvM+8Muo+TtMCLZmsg6ilPETVL04Eeedt
	 6/4VoGASEPDqpD57Ic95qbamWLIqa06bxSNcbjAXM3CTh1CdZT+WuLeOE+nCJ7jBqP0S8
	 mkgxtDUHcGA0U9PS8m+8ZgSUf0q7x1ODQmL/g6vKIUMzLnw7DIGtIPIEi6L1rMuYDzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41BB606A331
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41BB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jMkmS1VBCz55RGf;
	Sun, 08 Nov 2026 15:18:48 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A87IlHk022401;
	Sun, 8 Nov 2026 15:18:47 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 8 Nov 2026 15:18:49 +0800 (CST)
X-Zmail-TransId: 2af96af02259bbb-5529c
X-Mailer: Zmail v1.0
Message-ID: <20261108151849390eWkZBJaNgwJDsb5MuOMLo@zte.com.cn>
In-Reply-To: <20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn>
References: 20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn
Date: Sun, 8 Nov 2026 15:18:49 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDIvMl0gbWZkOiBnYXRld29ya3MtZ3NjOiBQcm9wYWdhdGUgZXJyb3JzIGZyb20gZ3NjX3N0b3JlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A87IlHk022401
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 08 Nov 2026 15:18:48 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF02258.000/4jMkmS1VBCz55RGf

From: Shao Mingyin <shao.mingyin@zte.com.cn>

gsc_store() ignores both the kstrtol() result and the value returned by
gsc_powerdown(), so an invalid argument or a failed I2C write is reported
to userspace as a successful sysfs store.

Return both errors to the caller.  The gsc_powerdown() error only became
reachable with the preceding patch, which makes gsc_write() report I2C
failures.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index aa2252402095..999cf84405ba 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -125,10 +125,16 @@ static ssize_t gsc_store(struct device *dev, struct device_attribute *attr,
 	struct gsc_dev *gsc = dev_get_drvdata(dev);
 	const char *name = attr->attr.name;
 	long value;
+	int ret;
 
 	if (strcasecmp(name, "powerdown") == 0) {
-		if (kstrtol(buf, 0, &value) == 0)
-			gsc_powerdown(gsc, value);
+		ret = kstrtol(buf, 0, &value);
+		if (ret)
+			return ret;
+
+		ret = gsc_powerdown(gsc, value);
+		if (ret)
+			return ret;
 	} else {
 		dev_err(dev, "invalid command: '%s\n", name);
 	}
-- 
2.47.0

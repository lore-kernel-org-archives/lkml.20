Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636017;
	b=jJUsADm+5garnbW0dIInxWNjxDJtlP54eHAsrtXYtZvJXzyhMZ9qB6OzO4cnjUO5l1UN
	 iYETVvyQwDZzEQVxW5lH3U9a+83uaPsRY8jMFbqnLvYvO4gtTZTI4OEtC76hAGWh06hiR
	 b1gOmUoMbVHWYH8E3XhCiFglJcXZds6BZHZW2Fk9EhMc+S4WOVl0FeVumkRXgzSiVJyNF
	 Jzv0FcHUOXmMye7pMTJWvYo4SbddcNoTep0hY7LXImeLMpBEWujhAlKcAt0sZffZ9WmAx
	 tLQNNaSdz1+fa1J5NZrvPJW5h6R2YbGFGr4Y6i7If2Z56mOkJZSiTy+QpxnR+rnrG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CVV/alUGMc+8ghh1WdWVQB+EmKW8C9wgdGmwYrZy3oc=;
	b=G92GO1GtQeUM9BTRMLDX45+IYeyfEGFUqJcES1I/TVIXDaw9m5MigmIIlV/iJm5v5HNF
	 nVdwoDipAQWvCmf46WRME39hRLZftcatYzYHW5ujEayYe9yvFqcW5XLO5ZI+RnQ1LgDO0
	 /lwNyzMASmdhpeScB09HGGGOdhyzja3+7bmsjIUQ9+r/ET8r/izUj19veIIFUgdDcYAJr
	 0u/UqbkH0cPD4KJ77Rj6NtF5KtYc0vUTWFKU2ND0Z/IqR00rBzOi87ckueRQw1gHpE5lX
	 WYRwxWVLzcXEwavq+8FcnBWFzmiN6wH1oQJeQ4P/WyWSD17xYp9Fhxcyp0pScEbIRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr20jhil;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD7860A381C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD7860A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr20jhil
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37628596783so2992806eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636015; x=1795240815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVV/alUGMc+8ghh1WdWVQB+EmKW8C9wgdGmwYrZy3oc=;
        b=Cr20jhilNZ7CAwk+cpzndN3BncQScYEgrw4SDUjVYHvVcLMYO1fO0sSIuom/3uukFE
         bZ4zoeTQvMIYtWF1SHnYClirqPC9DMKakrTYZnCQS7KDgJ+3xDg7ZV03OWqHtl8xj7Ra
         GqtO42MrfC9CiZ/qjvDIaOunNWutyOAIXKFLLmaeZuPf9eYmmmnDI/pDTclWbpW8dLDG
         5bivm4PcuHpSAYJYBsJaLa6TEicthy4tjOHzklKyM8weJu7g43izwB+uCMWeGicig48n
         X2p7UWnUZyGSnoYAjDbgDNlDiDDdj5v94cWQTr6MvusPzUBmoUqb46MrG5xIUujDKY8u
         azCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636015; x=1795240815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVV/alUGMc+8ghh1WdWVQB+EmKW8C9wgdGmwYrZy3oc=;
        b=LRxc4U4SQlrALVtxKTg6PvMQScaXLwTikIjd+NSEiyc9YxJnmKxl7sPr3Fvdqboz3+
         qgDl1n9foUnEzB62gAI8fEqfqntXlBMGzBB/CyqmKobJk1BbPq/SJzMdk07EaMCISYB8
         Ylpvf1Kx+IhszIdtr5i96kmrIne49b9Jal/oK6DVkhFCjr8Y7SSbuJFDLrPIRXPkMlGT
         jxFyNTRnq9YTz9//MPZjNkjLTEmlH5zh6FRbdTzhUnJ/Ow9cd9Cw5CAsZH7PxF4tjrTj
         2ASOe/GFYRmdnikSQB+CgqEC55I+dQTzZlLPhPHEHm2/vb5Z1k7Ako+ehPQtUAa8QNLE
         ls9w==
X-Forwarded-Encrypted: i=1; AL+hErGrzBPKshd6DLAMv5hj1UOoDQjBYce2YpUIMrIY3s8nfChBqqSuduzDPNalZoblVTVCzr5JSMVHbU0r8dA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7iP8J7sw5+Zzd0yi//St3V5kunmfGnC1HC9YYl70OpOhY/V7M
	uHP+HSt2c8BYNgKTpkGhQ6GhMG/nv/yD+v50ckRoJeutibFtj46+oMGf
X-Gm-Gg: AYBFou2z+m47Qd5muZcke1rZE/1eu6UbbwkQbULGnQuWWicDQUxwHShT81/pz+3mpQm
	cvnaCXBoJ5XspgzeUYS9+6GWN+TaDqScPYfo+obtQOxm7n+s5uwkr+CE8VhNGAhHjw1Pb7XAo/A
	s8goD8TcsLdwYXPGSnlqT40khPupLjzAurfgTDzpBFKws+ujHYGfL7gJFAwHFK2vJJEqkZyk4tO
	dwsBt0mDCS+as6noSwuk5g36I+p+9YAP/p6dkgaCHy8e9O4IY6Sz4j2f3Pqk7XjlNEiKlatNj2y
	npwjaeiTCU7zwhfOV9yn+jfFcEnJi/XTXv1+xJ2HBsnpS3ZM4WJ+MJGFK7zzW9Ije0vdzftSwp/
	HoLVSZblYG8WR8QqZrAsRw04mA8uf4j4dcRkW2D+/t1jfS6YgI3dBU7SPyWxMUvonKlnbcz2QHC
	gPMC5WBaS/fC2xMTkIgToLamdV6PtenPgvDUKkIXA4iHy2nYlwfw/SI4s6rLBiaGIV1bEKEdn4X
	280OnMHTGWpTkj3sZDJduGT6S3phxesETYiz5rDCEd6cCOkoWFrDCeRJePsoe2bOXS/Jx7H+vFi
	IO2wSsp945sx7vKahyU/UUJOy/DHXyZjOCdhItj4RAfxrjyeISHlR5w8rFd2C7X/womEX/MbE89
	r6C7eAu7tm5gO9AUb
X-Received: by 2002:a05:701a:8148:20b0:1b3:a89c:c456 with SMTP id a92af1059eb24-1b5030627f5mr4240331c88.6.1794636014438;
        Fri, 13 Nov 2026 22:00:14 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:13 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:59 -0800
Subject: [PATCH 09/12] HID: rmi: use scope-based cleanup for mode feature
 buffer
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
Message-Id: <20261113-hid-rmi-v1-9-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Manual memory allocation and release adds boilerplate and complicates
unwinding on error.

Switch to automatic scope-based memory cleanup for the temporary mode
configuration buffer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index ad2ab6c13550..f1d52d55fe0d 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -144,17 +144,15 @@ static int rmi_set_page(struct hid_device *hdev, u8 page)
 
 static int rmi_set_mode(struct hid_device *hdev, u8 mode)
 {
-	int ret;
 	const u8 txbuf[2] = {RMI_SET_RMI_MODE_REPORT_ID, mode};
-	u8 *buf;
+	int ret;
 
-	buf = kmemdup(txbuf, sizeof(txbuf), GFP_KERNEL);
+	u8 *buf __free(kfree) = kmemdup(txbuf, sizeof(txbuf), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	ret = hid_hw_raw_request(hdev, RMI_SET_RMI_MODE_REPORT_ID, buf,
 			sizeof(txbuf), HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
-	kfree(buf);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to set rmi mode to %d (%d)\n", mode,
 			ret);

-- 
2.56.0.679.gc527c65306-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637353;
	b=Lhwvm3IxRAG7Nd0719bzJ9ZAiLuCTUQn4OinEzez46gMBq5ppRoPG76zX91ca7r8KGXH
	 7E9EQtZwdgR4U/v37E1YjYfOjAeMEWSEPxuwvy4N9cjgYOIWvGTXciX6yNrpCFg7Z0IAT
	 so5xJYXuEx2iWzZ0ql4IuUvnbRTA1fTpnIt8nC/s7w+qLol/a++dn61GkGUwE+YKecvX7
	 zX+SvJb6kjzPzwixHfBdRNtx/ZduTcY3s8yR3JiOIYv7pJfmCkpDmYOQ/kgU7m01pXjnS
	 1Ef6MvbYz2lT2q/sXACxjuSVnixVnryRAlj3h7PLtnSKEb9HmsLGLQ6jaMjBgyjmeoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a54BQTIFjPW8P0xkuWanHjV3ZdgHWnaMz+Ldxn8PqvM=;
	b=Bu+O9AgrjhiViiTeWtkDrX6ICmDsdonmy7d3WRR0lLMdyfLvXXLahMV2YIZcPJehXuwW
	 /9IzDKn7wJzwEOqS5y0YzsqD/cBxq/mWwPe8aYlHy/qtebuKqFJlNtrjEym++3TZeF9SY
	 YWe8akl7FaPTrlUii1HE/fnXiWHSQUnkabXoOOHCVdurCjyJfSLw8Jd1dBGit3KOeCewb
	 603l/m6UUWOAlC6GGXSMQFbEpODjs/Jcs5wEoMbDwI+VWhn8yVPPqEKvVE8e0chJad2Jw
	 X6pD4+sGJpzTz+qCp6JKe0yJF0ESDGj8uhvBZ4brqJ0nsE04HQADQ4ftDl3gt8EfTog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ze6GhO;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0684606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0684606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ze6GhO
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1590378a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637352; x=1795242152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a54BQTIFjPW8P0xkuWanHjV3ZdgHWnaMz+Ldxn8PqvM=;
        b=k3ze6GhOGxdLUFgZdt5Z9OexSj/i0OwBosPzmqlA8R7gXojUX8g2ifJvekL56/ipEC
         1slzLFYh8mjaHI8hiiQhezREESOCUb08P6TrheUqWCmdCjs+ajpNDhnwPhvoD7C/7RDT
         IH899UI2TPF4ztJugZDmVoaY0oWd8UEYNAMx0ujAkp8SkNOLmufPiGidpxV5jZfSLPgs
         xuzLgizr2dsBLu8pL0SuEdbebpXDJytvipoV0aZ5F8uo2Pw47VHpL/co0jqvAdGBtXB4
         TT2poLH6FIZkotwJqXaWxK+wUf/JaXlHJe3SfXpyIrDRuASGGdm4bm5HyMHftF6lPfdC
         ALUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637352; x=1795242152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a54BQTIFjPW8P0xkuWanHjV3ZdgHWnaMz+Ldxn8PqvM=;
        b=eKyB7e8lqgfPilxRu24O3R5u8lTKtIi7B110QwJceJ2bPHl88clugZ39dgNWRruwdA
         yCunzs3ePvO9XxQTvvYe+Y5Zu4js681pfsAX5v3K4LR4dhcmUTu99S22mOWmN6CgDd7G
         jvkLPEHd2Jrasd9dENMHEZ6P56yq+FUwwCSWWz5YMklCnYHN/297duvC7KzcQIkFLEwJ
         kOagza7GUgRHR7otggw1cpyfEMy1yDSYuZUAiW0Sxqf0ud6RE2zuV55Jf4KnLqp2Dkvn
         t/x9I9g6EIh19IrSpDO6ozsHORJ+9GHO6g+Gci73B9R6xb9gkfzhJ9NlyNDH2/3SS56N
         h2Tw==
X-Forwarded-Encrypted: i=1; AL+hErEFDptmO7vCB1rgonhi3CrKOG7a3YMhrNejHY91COBZ0rpl0Pz+MJwk40fG/jsWGXzCEKBYXqNsPYZS5l8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SimHNj4eODrG0gZwoJY3Ejy+7NkESZGj4Tc4bzvHYhmhW2RfH
	yP64OKNTAeTyS9UFLuyH1E6FURngykZ+i9BMsqC6Sh5LFjud34JlW6zF
X-Gm-Gg: AYBFou3fa7zSIoz/iy4YZRxpEB/reqhptBbocgxFk3tNKHhFbhjR4mO6bheCjVrcmXZ
	bxRJ8cdjmwCOnjBfEWiy117C8PQJiLnV+gkJl0p07VgY0jU+v3h3skKIspZ2SPg6NszReVYjRmD
	lV/4gGt1oNOiWOyKwNhEsRaApfRb/Gj9tgysIIbolFsPn4pa3kjuD8pcg5AUtTsKUUVVGeaJRm3
	yHgUsPnP2ByJc+djlbxPByiFPO8Lo+J4Eu1pvOrHm/vkrFmESAj5XKlKLGuGLWypZqtnJPWbyRD
	E36s67+3WrScwwkt6piWbKWFs+vLIVaeFS92K6qQM0x7yBItdCeupmPGpblQp9QUUFaOeQ8sJx3
	VijivMbvry+vngppWf8vfJaSCtgWkr4ILHN5f9eAWEMJx8AoH84SPPoPOXhyEyXpUFNXRtfRL45
	nAVq7z+SIgsm2DarpvCtNgtOtP4wfdhRfHMIuLJCbEYMcBHYKHF6xkd5gDkgC/SNSqVk55KdH9m
	T9R1lGAR1AWdAIA8z46X+jyLKIYGmzHXljBeHXx2XPcTb194+ssaPIBnAAoAsuHsl4dMXX59vml
	zs/R1XfrUQId4fHzIC0X9u+2ZqBQjk/HYQC+yClfETBPJMDCrk0tFTJ8V5eGnUyKv5EtNMPNRnq
	IKCKxOhdybpQ0WX00jhgAldpjg19mdq2KjYAPN8rZVGWt/kXrQRznudoAnoBZ5GPXXaQAy7xDxG
	2viA==
X-Received: by 2002:a17:90b:4cc9:b0:3b1:82fb:7e03 with SMTP id 98e67ed59e1d1-3b1b09e665emr4584940a91.11.1794637351981;
        Fri, 13 Nov 2026 22:22:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm3457653a91.1.2026.11.13.22.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:22:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Troy Rollo <linux2021@troy.rollo.name>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-base: Fix the data pointer for event sequences
Date: Fri, 13 Nov 2026 22:22:19 -0800
Message-ID: <5fa10b9dbe351074e61493c0ba3344ba6106137a.1794633180.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

dell_wmi_process_key() expects its buffer argument to point at the
data that follows the event code. The 0x0000 and 0x0012 callers pass
buffer_entry + 3 for a code at buffer_entry[2], and commit
392c19faec6b ("platform/x86: dell-wmi-base: Fix handling of ultra performance key")
relies on this. The remaining count passed for event sequences
(len - i - 1) also counts from the word after the code.

For sequences of type 0x0010 and 0x0011, however, buffer_entry + i is
passed, which points at the code itself. The tablet mode switch event
(type 0x0011, code 0xe070) then reports !0xe070, so SW_TABLET_MODE is
always 0 and tablet mode is never reported.

Pass the word after the code.

Fixes: 5fbd827eb9c2 ("platform/x86: dell-wmi: Recognise or support new switches")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Not runtime tested: the M4800 does not send the tablet mode event.

 drivers/platform/x86/dell/dell-wmi-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index 44857e99fdfe..c778409ca099 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -523,7 +523,7 @@ static void dell_wmi_notify(struct wmi_device *wdev, const struct wmi_buffer *bu
 			for (i = 2; i < len; ++i)
 				i += dell_wmi_process_key(wdev, le16_to_cpu(buffer_entry[1]),
 							  le16_to_cpu(buffer_entry[i]),
-							  buffer_entry + i,
+							  buffer_entry + i + 1,
 							  len - i - 1);
 			break;
 		case 0x0012:

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614548;
	b=VyGG1B3WhHaNy6pCq3iTZx0A3/PR7//xNV33PEHGXCKvT0qDhYZeh+E+8rwmFMrRfW04
	 E0DwKypjdu6EsOe+5rhNBPyqw9fckmWEH3epklASdRo5EJonHO/zkzmEgEZ+M6GQtoEYo
	 xkAFUAPH1xYoLbApkJbSEZBceTIP6A9Upax/6eGrXAoaPnFC77Qc6teJLqhdvYK6DiCTl
	 0lFE3+1NVPl5mJgmaK1xzilf1ZD+6BUx0m0SENHI9WpzDwNQEUTMBL3+b2/y1t/AJsXI0
	 Pb8mD1I8Eys9CM4Cnz/FWpc5Re8PueXNJHjulsyqJ4HtGkQcoyKst/gcwp2lQpOMcvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1U8awJ9myB9NQ9BFpOtadS9kZucwnK4t/vce0ts4uRI=;
	b=nCnUJcT5pTZc+/UfmJiajzuy0XXZM/gEwSHJDStFWLRZuh65M8sOLyZWLNv4qnBWfgNG
	 sHLPGdbjEHJ1twiIYAtU3CbUUv47qbmQlP+BK0UtpkqTwBrsFjYQJLa8dsFPRKxmhg00f
	 Yf5I40sgJP6OoUjhM/1y8f08wR9Ku5RabsZiD6rf9MHCLmMgBdcO8Jq2Q6BaTmq8rmP1v
	 CADjfDfbuC1yW4v9YqSNceVX1e/LQGRIxbiqopCTYdZDD0tCM+a4KXbSbR5kS7ibcLYvt
	 MKn8gXuo/56lBbf6UGj/8awXmBXC6+zECaj64Iib0B/b66NCmbMaMP7uxdv0g8yjEow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxfwu3HJ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4D606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F4D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxfwu3HJ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2700407eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614547; x=1795219347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U8awJ9myB9NQ9BFpOtadS9kZucwnK4t/vce0ts4uRI=;
        b=kxfwu3HJirJIrBDPvXWzt6wbNk1ZaiwMJOqqe560I5WFXn1dw/RQ44c9FUUqUOHQG2
         XaXCo11CFFopHr5jD4ZQqtzQwQi7Ou73148hzv8JeBTWcuz2g48PktEGHM0Bh9hpTXDO
         4ex8agvS1O7NgnTbpvOs0DUPuQCNxoTqT7Li12SO+VAJiKvLlZANX13fRtN2zFt73T5Y
         JnF1m+wR2KICBwB4vX10crl0cs6HVrg+GmCk6TYZxbBN544hRdtN6Javhdr0SRXQRXYo
         o3Cog3rc7+zIMBZdCHwZQvK/HXalkmDQ5w5AR9oq8QsGlK9iWrHuJD4gL+nNKakFwqRp
         as+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614547; x=1795219347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1U8awJ9myB9NQ9BFpOtadS9kZucwnK4t/vce0ts4uRI=;
        b=Vw8hg1Ak3QyihjDrIeGbHKGwBsNQ+f4zjl2SRKF0/7V+BV4VfexEXAimhJk7W++xVC
         zACQAMASW60Xnv3D32bWYnvn0CfKcSPiHG/worE6cBTIjwBQ/Tz3n9MJUifRuH3N3sOl
         vsw3p+OrjNP7iiqe5PEEE9hlngbW4GxmA7Vfm8nG7JLZC6PRw3iqFdVMMH8Pc88y2lr3
         UfuwVUjyf2zFchmaa3+g3Ufh9EF47RVywHuo7QGGRWEZOHAkascv5FqJ6tq1WLqka744
         zZ4LkRjOFrx4ZnMfqYFTm9pBRtbrxLY2PHcb5C9fnwCQ3cdjPPg8ZaIZpcfmLN85/f+5
         8DFA==
X-Forwarded-Encrypted: i=1; AL+hErHl1H0g7cHn4uhQ7cgV98u1Hy851XRP/b64TTkbEVo+HRzb1toANk4+Un5/THQdk4GU5ALgpKJg+uvwWJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S0a+8xBARZzvf1aT23cbXSmFSAXQRE2TIL0ZcGFGp+X3PumAS
	RCXzdERh1Kd04ghsL4TcZaEJEosJWgvGhFvqkEssCFLZVcStXqDRB401
X-Gm-Gg: AYBFou1MQgJbws8HTm90VpV72YK7Q8OpLHYYEsGlY0N72SR5C8a6+mjgdbD2frE7l6j
	Uqz5wZ5jPul0uYBlUoYkgP117gyVFaZYVfyXkCF1Cf6MQAWA/ycHJ3Xh2cwaE7cKAxhMi/NQ1zD
	ZYnPwouMfpLDlduYd2g/YVH/fEbhuRf3qidEkcqAdwnoxOE8mrOlaZKMH5SnJbLdyiRhUS8Yw4b
	KP4NrmBXVL6LVxiJUtoUFeJNQ5lEBh3c6qKGc+qVhGOTEavT/ShZkDX3g+ZsNS2N5TwTy3B8Vj+
	H1bYdhTioL5+t5lKevTBivCBt1I3rVaUNTMjyE8j89jhTRzMMwWALJvXS+bXWmFYue4D/HRBpZv
	nkl+hECb3rsTSo/bI7p7PbGLxSgA3BQwYESiEKBxncA1hSJX4gUthdbd/rqIECMmvUkdiaU1Rzu
	pjiT0XDNxpc+t+Edlb3zbIsUoP+cBogcjx7JxwHg9O6ucLP3Mi/9ovCAQC0qcM/4eNx//s104dl
	pgQYtg3d0p7k1djfmRhPEzVJjPz4wsvbgxphsdm0mA3wXeGZ9apoHQYRnHHLR31C2T7juzhNta+
	obqDZ8eecUZ82pJXx2trmO+kvAIg7VARX90oiA7BJY36ceNk4pBUThWcibibfGF9qMcPFTd0PUe
	psBwQhct+CP2129fhGGdx6G1gLleShih7dTohLA==
X-Received: by 2002:a05:693c:895a:20b0:369:f97f:72c1 with SMTP id 5a478bee46e88-3796721d051mr3595351eec.36.1794614546836;
        Fri, 13 Nov 2026 16:02:26 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm11309849eec.23.2026.11.13.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:02:25 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: tsc2007 - use scnprintf() when formatting phys string
Date: Fri, 13 Nov 2026 16:02:19 -0800
Message-ID: <20261114000220.1280581-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261114000220.1280581-1-dmitry.torokhov@gmail.com>
References: <20261114000220.1280581-1-dmitry.torokhov@gmail.com>
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

Use scnprintf() instead of snprintf() when constructing the physical
device path string to follow kernel string formatting conventions.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index fc707e672424..d55034914808 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -252,7 +252,7 @@ static int tsc2007_input_configure(struct tsc2007 *ts)
 
 	ts->input = input_dev;
 
-	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
+	scnprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
 
 	input_dev->name = "TSC2007 Touchscreen";
 	input_dev->phys = ts->phys;
-- 
2.56.0.679.gc527c65306-goog


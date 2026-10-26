Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031100;
	b=WSSEXxKJ2pskohgbxsZ61tYqEgCe6BAZ2bXMz9yRPjyuve+XrayU6x4UKiWu4TYr4CbZ
	 IWzFE77ebKzJ7u/bZIht00lVxnUUpsiXTKBKsVQxmTAPrJc/wwMS4RXCjPNoVyznfu86c
	 9Zd0i2qKQ1u6NyDpY+WEDUydolI+QxhRM9BpEppqTgmo4MZf6G4CP+R2gH8x7N7TheP4C
	 LilT3x2ZGdCOhxaDdzv2QIhjHqzKswfDeAg7kE8VtbTTCLsQP1wndRdcoIVmM+rTqjU1l
	 OddtEa0xqOkIFkCbF2fuvm1t51Y+0GAM6EAblbGr1kBEHFnUQkarum7h9dFdCdP/4vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LG6AcmX2/N2qOVHT7pnuXKdlfVeXe/kESoYcfDBWLAA=;
	b=0s6p90gad8rbM/gyQ9GT5ScbpYQxYs0lZpwo1iTozcn7DslRSSQ44LjrUuZCwDgSJHK1
	 E+sKz/PbsyJXRTVebsjz0+egDlbJd4P+FnpMpglz8NJ/X1XvfJe3kkEmOnYPNuuCAlwkO
	 B8Q/47sxthyDNOtB98OGIosD4EEbvs6tDjXGwxKOiP57Jv9fnoV4prejLyD9cEWxeJiFF
	 xVpIN4AzvSIExx5PyRGf+XDom9K9jNKp0j8Az01JCZLwDOfZpo6Jw/dJAiUhtE9YTM+uW
	 TGBkH7ueIT2Jc4KQrLO1AvM58dHvAZnIegv5rQd5RPGDPtRcyw2nfnabTOb/vUE/Jzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ec6wPc2w;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A02F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A02F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ec6wPc2w
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36661f953e4so5966517eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793031098; x=1793635898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LG6AcmX2/N2qOVHT7pnuXKdlfVeXe/kESoYcfDBWLAA=;
        b=Ec6wPc2wFT20FC3KB0+qnGI4dQd2oVEciA9syRT5/vc2mbrZC4k0vO5q0Ghw48UTd/
         LmC8Qkj/nCm4WdRZxVwvG1eNOniWv3ZJQIBjhW2zKA9eHo2zCpWdXXrieel8NFNNF9S+
         FDjTVgHvrSVWbwgyQBNqoBtrPF0OgEcS4U0KhfaMKXAYP3g0MQQcmeMFbgge6jE9UIop
         xgbQPODkOiVPxpHjLv+ui+eMpDs02wAB4Eeo+Gh/21WY87OAVbqUex0yM2hOLmvu2iOq
         Yeq1FMQYUBHWCHk/rSHb7nnkFGVnhqonHHejbXfyWdmJxS50wUY7hdcA4dakuHN1OW6L
         5pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031098; x=1793635898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LG6AcmX2/N2qOVHT7pnuXKdlfVeXe/kESoYcfDBWLAA=;
        b=a9LqEadiNBoWTmACHsraGykAQf1jc/HCE8QN4QXjVNKLG02MWvS4iFfqTJqRgICx+R
         2DdaOgeKdKfFsmj3pV25Xc3zblde8ESQS2twLIck8RgZjq8uXNfMo0x2PWEw4yC3/Aw8
         9V/ARzPQ3vrqyCXfqIWHNPw6Lc80HpL3LRVUSzDdn/5lzH9QVuEnQJUTI9AhtrgnQalX
         4xLbj6cU4K0Xa7ECXAJVnOGZRpBGS6yzMHOBbXizpTge1HjHRA2cVTJDRpS2vBSq/ROb
         Snob4U4ah/PGN528bgxrtlFVNhHH79yfrsNnUZqsANJphr7F9+pel7JSkaaTK9rpNERr
         LQJA==
X-Forwarded-Encrypted: i=1; AKwUvBw9Y6eKwWqv2KSJHDSJ+urA5dEpaW/Rm6drJZ7wpX8NTGMXXE+ijH5tcQru8YNZubJ0e/70C4YFshbiBiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhTTCTdyEho3ZssOml2wzzH0ocYJtuSzpMHbtiFOZ7xBk8Qign
	5DyjjV9BN1p9ecECv5fBxYQxT23yhFR1Mi3F5HCsgY4zBCnER0CV6T/E
X-Gm-Gg: AYBFou3l9U54R2RIYPf5enEXfPU1O1GlG9HZ/JAzzbr3k33bIEgF+ApvEQbtoSQjJ9B
	M3E4To8sr1ZB1cj+UXUKG9lhNCqP2dJ5i1vkLyYSxgpJZRBnBhJJlWG8viJ/wsxC/6hXiezw6lB
	RsC8C0F7xoAAsi+14XUsKzd54WTw0s+6yiPFa+heQHSbfIolu4HtdJS7TOiPRu3KYGr2eXLTZd+
	1o+lPVLF1BP09aB+4Ivq/0lZBy/MrtWJRJPhm6DRzoCDcXS8ZyKhZ2lkbH+2dQwm5WgYSG+oWch
	OQ4Ahbu1NHtqZ5PPEBQ+YsxQ6DZ7SWCcjC1qTcrRdgZxns09GZzACKoJqxAzk87Nc9y1coLLNtX
	p6Y1eP+4f/dfCJTjk08QJKMYh/sVXWeA2dCq2vEzffp8HXX+G0BvnvJQxY4IweMbUZdjwWEEUEf
	5i9oiGF9C76pe2pEUDcMGjU7UC88T3iGkNW1X1wLYOsWw6vGXoCX61mVWBjDyOTelUUQHwV5fml
	SmYwC0OVVacvah/xKeb7iEmY9epQ8FWj2EK6sIyWSFr37C8QccroAeg8anBOSEu1isRNHqLbRnb
	h/xTPqmrBHyEE9JKeJF4/lKtpTnc62Q9cYeyaiKjZA4P/OJ4fQ==
X-Received: by 2002:a05:7301:fa6:b0:369:f64e:7feb with SMTP id 5a478bee46e88-369f64e83damr7407400eec.2.1793031098200;
        Mon, 26 Oct 2026 09:11:38 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm11702809eec.14.2026.10.26.09.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:11:37 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] drivers/staging/media/atomisp: Initialize curr_rules in atomisp_freq_scaling
Date: Mon, 26 Oct 2026 16:10:58 +0000
Message-ID: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The local structure 'curr_rules' is declared on the stack but is
not initialized. Initialize it to zero using empty brackets '{}'
to prevent potential information leakage of stack garbage values.

Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e66a7d1c7a0e..d4de2bd9a0a5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -170,7 +170,6 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
 		dev_err(isp->dev, "DFS target freq is rejected by HW.\n");
 		return -EINVAL;
 	}
-
 	return 0;
 }
 
@@ -180,7 +179,8 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 {
 	const struct atomisp_dfs_config *dfs;
 	unsigned int new_freq;
-	struct atomisp_freq_scaling_rule curr_rules;
+	struct atomisp_freq_scaling_rule curr_rules = {};
+
 	int i, ret;
 	unsigned short fps = 0;
 
-- 
2.53.0


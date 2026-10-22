Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658474;
	b=FHdJ9jc59aKBFLYLY90aN6xVBk73KyS1NM7yeEVveYxb/Wij9mZeRbk4I/vxTod2s8XH
	 qabzT3x6YY7ygpC4YkskTnBPNpXrCzvcP/V7weUaazAjWPL4So+SeD47TeWVDL6iICUPX
	 uQJs+cGsM17mr+d7gcvEa/N367drK82QV34neqfKgLuH21YrXNXAITdFYOeAdbShPX60r
	 NtVuxamlPFs/mgfV+VNJovUjimeMDPjdgRHQ585qkXHhxPdlAcoSQZNJdVEOUWn/BM6zD
	 elJSD76Vy+/tCr30JytjB+SYyB3osCcCN61QDszTHPekLL629YS3cJclBQsPM7+z35g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vC4h8lGS1ajXS2oicsb2J7xM/pwGBkpjOexFGH/bzyQ=;
	b=utiNbieDU5iH7X81EZMs7jXWp5FXtR1PJXnMtZMsLrENKn3eNRDM/1eGXlLgNwVMo8ob
	 xzrM/iMc4ffqh7/5sxKLK0kIXnWkZYwm91IxItIm91a2/FDTCGOqzWSijL0sz5xLo38g1
	 THtJWJKNB708cYJsYuAzbOekpYX0xO8f8qVXV+2v0QbTRebIeEIIq+0j9u7ANhqdnYYiL
	 VcG2jQt/bQbAfOIsCkT77q+BS6AqN5ZtNAnLt62urk5Zh1JxoNgV5Z8mpbPGGKUbcA4Q/
	 Gn0G5VBjCJFk1TvyYsfITtYiMf/MyJHAYYbOPNW6XO0tw3uIaCLCUkmj+dm/6ad8jTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=swRhHnmH;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCE3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=swRhHnmH
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1269967a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658474; x=1793263274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vC4h8lGS1ajXS2oicsb2J7xM/pwGBkpjOexFGH/bzyQ=;
        b=swRhHnmHx+DjLVUh8U0VQ5RiCFwb9iMTsSTYOqzB9jdmyGJsn8qvs/y+ky9PwOMf5y
         Spf3AScLmINfgzBOCybDf4Hd1bl6vABYjyTN77/sl0NGIFH3GQKjPrMlcKZUdfzEclIg
         Q28lD5BakbLttuIYgy8t9F9GXVPil7k0HhGznnAhbYQ6I5Yd/l80MQfdhRO8qTFtRhm/
         Al9mrVs9agv4iCtw3V/ruQ+ec/AUhH9FUEG7vzq728XoWr3GBWnldAFKWcRLxjnXKFeF
         VmZcQDz2STo66zc8ql8Us90JrC6GO+Iwtas+ed5u9yBGnxMri922z+E0tNfhtaRXxoZH
         KA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658474; x=1793263274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vC4h8lGS1ajXS2oicsb2J7xM/pwGBkpjOexFGH/bzyQ=;
        b=ACd5kmaqc2NCyjBTHT+zVOMC30z335wNQ6fQqdqQ/eJCvwtpkeMdf6GkVWgcdK4arZ
         CGh1eWT4Xq+n7xYhMlKbB7Z99T9NXtZ/1b2Yyr9pAOAhfp58JGpc7fDj10yZw5M61UPW
         P2RvTDG9++3GwxoMK/XCpkoEH9xNblmGtvFv4F3CsDJ59QSqNUQdCbXo+ZvYrkq4lAtS
         bMXywc+F7EteyCaAN58phkMXi30rWYHhgAFMmrmsTh52tCmUaQhBnSUrVYg4Sbn8KZNT
         Y6GnO73mZ3luAS4l9VOgsGVh3U9qe39eZzgvzxzgGoQ7FYkzOMOMQswsRjDbnOKh3Bp3
         YpNA==
X-Forwarded-Encrypted: i=1; AKwUvBw3ddZ8qe33GCzp9yNqJKiJZd+nAUeW2Sb93o3Vi4fcqDTyxdwRkBghTWCPyZHUl2fi6wLDinsgVWQtEFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOmQcSjj7vaNbXRJXpblqBk4LmT0F3Z0xbNqD6qSYVAjN+fqSK
	TH+FbUtpE8otAjadaWDANqk2TUVNXucsitCOZQI9GuNVSq/qhGX9mRIX
X-Gm-Gg: AYBFou0tPDgcLRhwvTCzp8FICoZi9S/gTy8ZKb7SEb2xqISYViEAeSO2Jp1nPCKzBUn
	0tt2RkzKeVLBFxp4ixZ75vWey9lWhs30BkKof73jDdLBlTf/guGyrSfWeU99G6T+Wof6nFOIG6F
	0J8PXL+n7r+i3J5THy0QF1K2hY8INIFy4uuZmXBq1fafJilA0TPyDYjVvtytdW7ysArElianCdj
	iFlHnJAwZPG4olsMTzlGSyFiBRNC2nhSVUjwL6DrRIfNJYPcPfVNNfl0UrTK6PXwhDu3jpta36i
	3Zawgt8sBgJrGS4rnb9hQ06uqk2gQHxzEk5DOmpsC+trGWashUPa50HOfTLJRCv4QFoVGCRxKtI
	y8vgXvFD0qUJaV3HRnhmHMTMM/Ojdv5u+U+vMS8FJqRoXKvmWEr6HHiQ0CwDiCsD2QgauMHOCp+
	E6KJZ07mIMv2hEFdPIobdBPuQ7WlnRhKxK6CrCA+pW+u0T35CnNNFt6Pshmf3m58Lt1jTugqE6C
	gPwC1uCZ/jBkHMh0C7SG20xz48lhaU6difZqYh6l4JF
X-Received: by 2002:a17:90a:d885:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ad86f66878mr3777020a91.28.1792658473846;
        Thu, 22 Oct 2026 01:41:13 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e3:a82::10c:51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4933d16sm3266344a91.13.2026.10.22.01.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:41:13 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH] net: 8390: fix kernel-doc warning for __ei_tx_timeout
Date: Thu, 22 Oct 2026 14:10:46 +0530
Message-ID: <20261022084046.214725-1-ayush37735@gmail.com>
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

---
 drivers/net/ethernet/8390/lib8390.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/8390/lib8390.c b/drivers/net/ethernet/8390/lib8390.c
index 84aeb8054304..c1b7e3e9ee9c 100644
--- a/drivers/net/ethernet/8390/lib8390.c
+++ b/drivers/net/ethernet/8390/lib8390.c
@@ -246,8 +246,9 @@ static int __ei_close(struct net_device *dev)
 }
 
 /**
- * ei_tx_timeout - handle transmit time out condition
+ * __ei_tx_timeout - handle transmit time out condition
  * @dev: network device which has apparently fallen asleep
+ * @txqueue: transmit queue index
  *
  * Called by kernel when device never acknowledges a transmit has
  * completed (or failed) - i.e. never posted a Tx related interrupt.
-- 
2.53.0


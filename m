Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944698;
	b=BmY1cW76UFFBJldKoinGbMSBh+QbF3AJGLJ0ZcIEwbi/wxzHbPL3x6q0U7ZHZMpSq8X3
	 103YVbiDn5o9nT9tyqiE4YJDHASMtAzXKkSrz3gX0wEi6QxXDu9MQkXLf5IdlACDHTtJY
	 aY3cjqyhrbknLL+IpC6W/5WzzXwfRLKge8qeGTRHC+2TRsOqJYaX8NLmErf82udsFKSMa
	 4lRGEkd8CD6wwn3HygRd9hxSNk/uVGoYtfOXaYaSo9LSDQSoY7ACKW2cXeYEtW+ytS7nu
	 MIUO7iAYSXNTsIPBbzZ5wI26IdHvbNqWD8g6K6rKZLAWjzx8ocDW2QZfftGqzTN4QnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C3I09PsOwanE3onBdlLxzkDeS22ydCPmlVESj5Ag388=;
	b=dC3Cg7R9m0CzBKKZMUirnpe6jqi0N3/+jVgdhJm3ulMQ2DrAnikxxGrY14i8rsELwOj9
	 GL+/zP6aZsAizzDn2XwKCxUpseIOV3TeK1Xq+HyrLB2yjF6j1UE2+1PL/Kfvnyzp7RQ7p
	 U5H6oExCLIU6lvDndupKD5Ow3z+j4H/lO4N1a0rNlYRv70srB+3z1gEGsUj5VatPwYoQB
	 vaXEnSlwedldsCp5/iPwPp2yyXJ4FFa4/FZ90paYvbcTxcBpkhu8Fzea1kPd8NbsUye8p
	 KJ3X/J6w5N+g5I9GssXECndOy8uyyBgq5tmt1s+uwYKG5lLsGRMe2qWcttbGfuL17HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVAD+nPJ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B0606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GVAD+nPJ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36681e85e87so751560eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944697; x=1793549497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3I09PsOwanE3onBdlLxzkDeS22ydCPmlVESj5Ag388=;
        b=GVAD+nPJOfMo9DCQIvYeywyeLpqGlYy29jJLpo3vSlsjq6LFbec0XUy5tJEr5mOzhK
         BXs3rTgavPoB6t7mjCPVb263H9sZBGnWIjjWYBSF7ItCyvub/GTRLi705GP7cCdyS8Qs
         S8vzpnklLjPGeCMZz2a+GGkRqgUWoZVFM3673f6KEmrxNPSheotQwlwOe/PHSCvn+fyW
         uDYlXpVfrlp5mqz6JBQgFBQmOHwkxk1a1dWykxPIpJuMXNbbG7MZ9x/s9J1i8EhNFnDj
         7HybPN8vdSpNxgCduBjK1WkEY+y4tRG/7VtlUWHLCI8S1rbz6HCdNskaXWwrTb/62U/g
         YBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944697; x=1793549497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3I09PsOwanE3onBdlLxzkDeS22ydCPmlVESj5Ag388=;
        b=io3fz2U+Rtq6nBPqt8ROWed5m4By4Tf3WR3ZdHPxlgVa0bc5dgEGvgOPbYYeVoGhL8
         MLAtWJRsPb73lIF6q8PlwvvdEpzf0cVtwsGLvZt/G6z/h7Bm4pqrRKWHUUCDfZHGiMWw
         w+IVdeF3PwWgIThVe7qp89OpP4J45jESYKfpC/16iz5tXZJJ7tOFwS/CD5TjLKdsLLGC
         87Qw4dzKxgQ6aLQqiIshxCx/mu4hKR8uKVNxqWQLnXyuO5+WX6/lRYjS/Jtufmio0qVD
         S3mdknokitXy5sIY7H2MzkcDdMvfe55MDVtZ7IRw7j8lF0Dwl6kunTDi7KPGcCpQsl06
         vGCA==
X-Forwarded-Encrypted: i=1; AKwUvBzzR2EKcpGTKyaOKRSd3okAw7D849xiKBvNd3CM6iNIAYGrs+Cd7aOuBcItuYO3KS0ie+z5teTI/npJpdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQSYOORXp71mmxmVt/UkZps9XWr3BHOxcnCEyXHkfb1spXfP2a
	vyDbhvzJy1IXEffqDMrrQYDeOuBxVN55rOVpyFBuz0UrELqrsohFxf1I51xrdaWGias=
X-Gm-Gg: AYBFou296sCM/l9jQnzbPS/LJy+mwAqdM1PiUsEAwwwYCDIn0q3D/jzG58ftZX/qUZ5
	XqmqYhPCyD+z2TvYA9VlsNgwfalnClzOmOigUo2SdkQzLvEzf7TDOiOAR8jZ/4yNKqfEOyoNrWF
	yiDBTRviEpTpm9oKR0dI7N4v95F0bS7B6HUgQltbOFgVEdDlh9mfLVz8y2f/qaNmzanBdanCBMd
	CJys9/E4yIU2ccDHxtwDcP5GCfvTAAB2BtXHPnOLLKq+0FP+2PnhsjfDU4MS5ILJOJ7NE6Nh1Ws
	SIBuyA5ePbSiRguNHC91WH8hJwVDguJOFMNT+NhtTg+bnmJst3FgU95dI4lhVoEUEFhGb+Hhtvp
	TWQ1mxbjzh3f0y9/ywFYHySw8P7ansrcU0YLgi8iPDf4v2c2Hfv2CHNVjhfCQ/h59aXPgOTnFeu
	nG9/lguChLpRlFeodibfjNjd8lDJPPrUSSksTGG/g/42v06Lsi71g5oAYF4HDs+R105xiQNQGDe
	+IBMEvRUXEtMs+gt9KmM9hE2OqgkiVXcckgG88vrBH+gFZu68CKhiEHcWskcXXDKyqIjcm6
X-Received: by 2002:a05:7301:2f31:b0:369:d8e1:7bad with SMTP id 5a478bee46e88-369e84d7714mr6866504eec.34.1792944696530;
        Sun, 25 Oct 2026 09:11:36 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm21919868eec.16.2026.10.25.09.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:11:36 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] null_blk: reset cache state before device setup
Date: Mon, 26 Oct 2026 01:11:33 +0900
Message-ID: <20261025161133.59344-1-pocj8ur4in@gmail.com>
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

The CACHE flag belongs to nullb_device, which outlives each powered-on
nullb instance. Power-off discards the runtime cache but leaves the flag
set. If cache_size changes from 1 to 0 before the next power-on, the
queue advertises write-through while new page writes still go into the
cache tree. A completed write can then disappear at the next power-off.

Clear CACHE before creating the new instance. The existing cache_size
setup sets it again when the new instance needs a cache.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU/KVM through configfs and the null_blk block device.
After changing cache_size from 1 to 0, a 4 KiB direct write to a new page
read back immediately on both kernels. After a power cycle, the baseline
lost the pattern while the kernel with this CACHE change retained all 4 KiB.
Both queues advertised write-through.

 drivers/block/null_blk/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 6beb1f5b71ac..ec0d7ba4d938 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1976,6 +1976,7 @@ static int null_add_dev(struct nullb_device *dev)
 	rv = null_validate_conf(dev);
 	if (rv)
 		return rv;
+	clear_bit(NULLB_DEV_FL_CACHE, &dev->flags);
 
 	nullb = kzalloc_node(sizeof(*nullb), GFP_KERNEL, dev->home_node);
 	if (!nullb) {

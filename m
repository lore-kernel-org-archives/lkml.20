Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2DE3F1055
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531988; cv=none; b=BDB2muGnmW9FfQ4nwqXaY9huJY8tej1FY78qsNHkfJn9tSTgs5wO0JChev3dU4/P28rFhTMfZezr6NQNJC7YJY0Y/vze905PLrQp811Spcm7F52M6bpoc3Mfk4jjYcyUcMnXEbv3M5aLTWe7/p6PUknaOuZfjJ15Cm94tLmcrOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531988; c=relaxed/simple;
	bh=463LG4ptKQQaR+6jOJfu3lVszhEA1pLG8ooq0qd0hPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=IRnGcUbSNbejd39bxvgT8TRZKCfLx3L6UUwJ98hJ4q2HXn43nZ8qrVVAz+nXd2mSvbKgtg6mkSUD1Eg/EpSE28ZquSjQ9L1LX10a/nsXZrhp3IfRl2h+73cudEsCKVjcLUwt9Kv5VecgTSVsG9RqRYV0YXVFOAk4wJ07aZ6SOI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p29TfE7m; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p29TfE7m"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aaebeadf3cso6652485a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531985; x=1792136785; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DRLML2ox1kW5rwikQe0u5iFmxvNwP3jMRRP8kz+nNAg=;
        b=p29TfE7mkZJWyfNkDWx/FSUDQKHQeT/m2NRDEVXl/aNAYvWo5Otdl1IdqZRLQEqN6h
         M0jWbTBN8oCChGtvkZQJj3WeFkWLzX/GXFpfX3i9i6RjxfUCw+Dg/Zf4JHKjkePDxXQm
         5s/7hZ5Zosf9tJDO5sm+jqea9QBLbvzn3oiyYZnrlOPas9DVM+4fqB615Oh8CXmYGJSp
         EqTm5N7xVX58mn0ZCuCBMj1LbmGWlQFObXGoJmNHsOfgJfnKnax6/ughyaRiq1Dp0e8q
         Tj/7rY4Qx1aFcsbrzey7TcNzEdZJZrmKCuN7xYWWXghQRyEEDpj0RRf2A2DZUHp+uypf
         ZpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531985; x=1792136785;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRLML2ox1kW5rwikQe0u5iFmxvNwP3jMRRP8kz+nNAg=;
        b=UCwU3Mn6bfgBim7bO9Cwocj4Q+lr4WTh1Rnzc2H5/Prb0brq4jzZZ/OugDwjISGMpD
         tQVDH1mgBKVBZr5/+YoIkGaZ2i7vlMQreUZlD80CGC+7dQo+uMyY2sqV2AiZ2zOT/eTU
         f9ZIR3up0ymKVUxYboW65T1M/Un2nLQ8rER2I0dMgjcOApxlbscL5uTNoEqMGoWLqLkq
         UmEr6f+kKBHSLBfWUCaeUsYWhaoBZo6Avklwrh/1j7q3f7giwA/l6GQJa5p6YYyQTpkw
         Oom31CEDieqNx1muuWo6C9A4J0gGbh5Of3ElqGRxh42WBSw9wtyO6pKgQyTHnnl11J22
         GvhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6vw0vK0IelrVMMrMEU68y+xM8m4F2Bi1d0JgxIpYOUdYToAsQS3tBUAKc18KT1w2YHNw0+l7xlsqzY5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlBzqlTeMQ/J4yoRVIods0OzVmZys2uUQ/fz6JEAjtqoRqU8fE
	6hxqkU7o4rpmmucXKigsfoF6cfSHlgt3lBhkWnV4GJYS8xHSF6dQt8xyVZFhB+CV
X-Gm-Gg: AYBFou3UF41JUX2v6xbGPSyo8LAl8nFsGzAhDOCDaeIeupgSk2QgY4dbgiI+Nrjni8Y
	tNboc5Z0kob5wP7WErgC0MKsMljoW+IEkNAugYAKO0MvzkBXFC/UiaRHzz+I1Do/a5UjYYWAn4c
	9WcRxMAupgxNK5/+JsbaJ4Hvvlw0YCXtfxo/mZMY9ZjqyfuIvsVP8Sw8YIEn+jxBkXPH/X5cDFv
	9esZdADsJdNGVdzoW032gerEiuwYa0KowfQzilpQnxNvFKESO1LCO0o2QUcwWrcqop0lDtn3vT4
	q+edgqEhSIcRXYfBhzWXu3AlxO4PRIpgKz1905MRftXnvd4fuH3T0zPFgqzTQj601hbhFky+W9Q
	uCsc3yHnGVMH7bDwVNxYqsbhCVqUbRKWg2FlIz3CX3DbrXia2m5mvvIs6cpySGfcgi9Mbb6EmCC
	yZsqI6oEQFU8ulWclN0Fb01A/GzqyLkMY01htQEl5b2dwxTLcXpyblJTlJ3jhf3U00S2ItYYAxQ
	aeRRmJHgzYVcz15nIAAePhKM25VcNNMTlaf
X-Received: by 2002:a17:907:3f90:b0:c26:1648:a060 with SMTP id a640c23a62f3a-c31aa04aae5mr100390866b.27.1791531984766;
        Fri, 09 Oct 2026 00:46:24 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9accf47sm54341166b.76.2026.10.09.00.46.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:24 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 2/7] char: xillybus: Remove duplicate error path code
Date: Fri,  9 Oct 2026 09:45:52 +0200
Message-Id: <20261009074557.19996-3-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261009074557.19996-1-eli.billauer@gmail.com>
References: <20261009074557.19996-1-eli.billauer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Remove dedicated code for the error path, which is both redundant and
incorrect: It calls kref_put() before mutex_unlock(&chan->lock). As
kref_put() may result in releasing the memory containing the mutex, this
could lead to UAF.

Assisted-by: Deepseek:v4-pro Kimi:K2.6 ChatGPT:GPT-5.5 Claude:Sonnet-4.6
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changelog:
    =========
    Change v5->v6: Rebase to current tree
    
    No change on v4->v5.
    
    Changes v3->v4:
      -- Correct the commit description to indicate that the removed duplicate
         code wasn't only redundant, but could also lead to a UAF, as pointed
         out by Sashiko, and an attribution is hence added too.
    
    Changes v2->v3:
     -- Add Assisted-by tag to description
    
    No change on v1->v2.

 drivers/char/xillybus/xillyusb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 13dda738477c..9de4298209e7 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1413,16 +1413,12 @@ static int xillyusb_open(struct inode *inode, struct file *filp)
 	if (filp->f_mode & FMODE_WRITE)
 		chan->open_for_write = 0;
 
+unmutex_fail:
 	mutex_unlock(&chan->lock);
 
 	kref_put(&xdev->kref, cleanup_dev);
 
 	return rc;
-
-unmutex_fail:
-	kref_put(&xdev->kref, cleanup_dev);
-	mutex_unlock(&chan->lock);
-	return rc;
 }
 
 static ssize_t xillyusb_read(struct file *filp, char __user *userbuf,
-- 
2.34.1


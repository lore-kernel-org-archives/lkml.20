Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947869;
	b=au1BLSaQSzfQb/norntT9sY+15DVg3np/hEo0kDn0zsf024ly/YDlYnG8GrQipWoGt4e
	 BpJ5+daS4fDnI6yO7khUhrxca97/VOiJ2P7Tx28Pw8vbOAYzWO9PBPaBZxf9caxjk4c2i
	 NLmxqgRVltJap0GQFK+i8eh362iClhuEB9ZEr+cC7Jsr2Dedv4asZFjLb2gvnjcOfKqW/
	 wQxUe6eJQWgvLEUPZ0F2zwi0yjR7KZPDyrmBq3mSMEGsw9hM6HZa6n3QMoBc1dAiR9KJh
	 dVFekrewlkElU9U0IoVZp2WPFEBc+SDnuQP/twtx6uHxEIcZ+/qLE2YycTutW2vT5hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HY6NyKTM8r0x5O+rVjJnGBZO/BpAxBcqOXQFhbzKwHQ=;
	b=JWn2Zuo2//pChJrwunBbt0m/vdLiJ/hu8owRR9Mh6LEiGjFZNTuXtZ1F++ZkS1PyPf2P
	 2qnOtCGK3unw3Oz1Q8dpkB96+Qu+dvwNQe9tgieDeCA7twgL1KvzME8QESmr4MFXrCkM5
	 dETRTOK0Zs1GxQZQvaI6710x0tmAQVQgZNb2Lbv8bo1DgVaToQFcqIiID6kf6pahW4ay6
	 /9o55WaiwjPaLZIYSr9tUnaEUqPJzpJVHI4VYeubyYoGq+BpRSsUbJ1cp4+VCTlFw5yFH
	 Ll7Ztzmtqzuf2Hg1JdQedHEDUlzLUiwr3Ih1E2nI+I+Hhq8oxv4UupyMoqOSWcuLsag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWtVX+9y;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A109606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A109606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWtVX+9y
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14fc585291cso308299c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793947868; x=1794552668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HY6NyKTM8r0x5O+rVjJnGBZO/BpAxBcqOXQFhbzKwHQ=;
        b=OWtVX+9yJiDrq0rs2SpBd1em1ofisUH7B0auKEjhCJaJR29DjdEYtxDQlX+Dw88AH3
         3scUaZMgYjvdWP6yejXOIoQTt8JFDEsneRU6k+BjRU/wXaYOyANu40T81x914lb0M4Nc
         kfIa1BRPkCDHu3LsYSyKL+1kN9OrruoODUS3W8BbQEXCjrd7RE5Dy7LlKw5LElg8OlLU
         ScnnOIekOhEoMnGJBQP1n6VtNynZ/4Gro8USt/QjLxFhILpJVqWByAJy5ma6NlqIpFgj
         w7TbiXpwxmWNXntPnIEsFqSIcgVSfqHazGSBIyGTO3R7L6GuTCTxsE7wuFbJOVVFcnai
         NfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947868; x=1794552668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HY6NyKTM8r0x5O+rVjJnGBZO/BpAxBcqOXQFhbzKwHQ=;
        b=g6O0UAp3VPpZsLjD1KRWiPHQ1NSduPDLfonJLC3LAU2ZYT+DMPNbpTTre2st6iKfbT
         6TtMfWGbAj2NXQJcmmqKzj5eQO+7CqyBIRthuBdhFjazj1Twc/8qV8nlqUKmidMbB0L/
         uHjluhGPnyre9hnWSHutdfdNpq/wCpiDfNmNX2EnCEPppVKvquCA0soEhu1idDJq+eUg
         H7FIEzhfGIn9fNiQPBtYkuTr18ec2mrzE52u4BdTP2PnOBHUMUt1eJeO8IF08oWxBCbq
         rOlWD8MFad3p3XHK0wSA51/wS9Qxm/mQ44H7xt1ilUPhSrdBqq2C4r7lCH/MLNie5fC5
         14Nw==
X-Forwarded-Encrypted: i=1; AKwUvBx9iHnteTuKY4vaPNOLNsbZm+UFFDL2v8Zl0S2knNRD+CKai3Q8TQ5S3nv1dw02DTQ88EIILLDLZguCauM=@vger.kernel.org
X-Gm-Message-State: APuU4Z82MuaIqUJIPzFxTAnpwjJ3jYjDt1yCcN+u4AHH8I/YBiX7hejF
	i4ULtDVEiDe9dckr8XtQz6/8oFf07UpOtV/Z/igYCKEsimhQsenWomVn
X-Gm-Gg: AYBFou0/ipJrqVTuo/U3w8sZmubxbjw/c4wx++UYfVb5/Kog4Nrt/GFzdnGti4nfhro
	oX/5UJHf7rkqh9LtfhKLM0ovxhcm7nISqO57ROSBBYVhdVUHQ+oFJ+yGMFVNQL2VxsjyzVgcBcz
	6VmTKaWhguJRL5D6vR6MNEqbyP5rKst5sKCcOYSi7yP//AaCRKGUWLHHfNmn9mjhofbhHHk0i/p
	2WZB3XtdoePRQLlV/FIU0sJjMS0Ku6N0oJwYnZb+FKATlZrXp01nBv/nx33xdk6AEaE0E5yAS4M
	oXiigVxWGN9yY6KfwQ3zK5YpTW+vgruvWVm4b3wrZmlJsWc8qAptnSnHuAYZFeWFPsdQKpXxgHg
	9EDwmTxqgGXwpD5LxmwoJqhF4whtjDfn4hMpGeATGIZgm8a2sBt9j5aJP2ePDXA1ib4dKh+7tsn
	wLfCGM3GJTKxDNuTIexAWNXWBXtjeUU+f7PyDDotvZUp4FheAc9761QBW5NVBMW7NeAbWFyZkyW
	A6cS3/9zKRQC3wbilGj2F2ogLQKNl9WRTXKy13tNAE4G7k79oxu1mpB0uCRTsoEyXULGwAb5GWd
	2oI3lTsJ3GrNywZo5NB92r6bKyuD5bpc9aiV0O78VHsTlr3UaEPf
X-Received: by 2002:a05:7022:3b83:b0:1b2:4cc7:7db2 with SMTP id a92af1059eb24-1b25d34ed54mr2078977c88.47.1793947868395;
        Thu, 05 Nov 2026 22:51:08 -0800 (PST)
Received: from localhost.localdomain ([117.20.154.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d22cesm3196906c88.16.2026.11.05.22.51.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 22:51:07 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] remoteproc: core: Do not put the device when device_add() fails
Date: Fri,  6 Nov 2026 14:51:00 +0800
Message-ID: <20261106065100.44269-1-izaiahsun@gmail.com>
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

In rproc_add(), put_device() is called when device_add() fails.
But st_slim_rproc_alloc(), xlnx_r5_remoteproc and the other 23
drivers (which use devm_rproc_alloc() and so devm_rproc_free()) then
call rproc_free(), which puts the device again. The reference is
dropped twice, and st_slim_rproc_alloc() uses the rproc after it is
freed.

Remove the put_device() in rproc_add() and add a comment saying why.

Fixes: 7dbdb8bd7c02 ("remoteproc: core: Cleanup device in case of failure")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    Changes in v2:
    - Comment in the device_add() failure branch (Mathieu).
    - Shorter changelog.
    - Rebased on rproc-next.
    
    Bug was found by kbound, an internal static analysis prototype.
    The reproduction was assisted by Claude Opus 5.5.
    
    v1: https://lore.kernel.org/linux-remoteproc/20261029130037.5505-1-izaiahsun@gmail.com/

 drivers/remoteproc/remoteproc_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d5fa9d23bd5c..d0b1f6ee49d3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2312,7 +2312,10 @@ int rproc_add(struct rproc *rproc)
 
 	ret = device_add(dev);
 	if (ret < 0) {
-		put_device(dev);
+		/*
+		 * Do not put_device() here: the caller's rproc_free() does
+		 * it, and the reference would be dropped twice.
+		 */
 		goto rproc_remove_cdev;
 	}
 

base-commit: b16b5a4fdf7d1f4ec15a53622d9b66081325fbf9
-- 
2.53.0


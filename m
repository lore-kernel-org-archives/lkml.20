Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6FE4E8E11
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450159; cv=none; b=XZg1f2JKJuyHODQ+hUOBYaImsSQWP5i2QN6W2enbSUYZ1g8uTpGyFoFQ1eDNahnfdpJhIh1qFESrx1bJf6rt3LRy1s1VG+THgKvWkjR8fE0C5JaFbLkJ1DC/84Lp3OcZY40KyuYE24sZeooCOfbweDxYt1UqpmA9QvXqmmmRyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450159; c=relaxed/simple;
	bh=Krkxe12J+zKExjm+ys4pq56wu8sANIl9Xl6198K8bxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csO5eN3Xvib9oAJxdqVTp8urUdDnLRpPvl1YqYGSe1td5aFGAFDuILdLhg4Qd1j24QsZUch4Z7fdSKq212+q3lRw4AC+iz0fzz2+Qq6WfOBm/wj1U3PALDosg2ZSqzfAdJiF4vJJravXBurUso6ttAeyslhF55mMPq8GNGjG79s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=wyQ6JHWa; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="wyQ6JHWa"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39647184c73so1150029a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788450157; x=1789054957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrQF0RfWVSyrposIdYBuKXDlowmFEDCZ8WICH5uaiDM=;
        b=wyQ6JHWahQCr/IsIoFLyhycDxqzhtZVJL6sddGKAPpsVMcngER55T9sjuS41gxvlUe
         9vJp/21lgttDY/+j7Jxez2+v9zn2lmpzFZp8DBaJktKE/5PkmFRg7EIlzkuLMThgZpHH
         O8FECGN/BU7g5MouQRWM+5dS0irlqgQDtEgIJN7CKpr++NsP0P31eLAbIg2FS/4Ow5sz
         YkPjgZhx5ODBbMFvpoOSs020w6npNPQ55mq66buPZ7OpEdlCmx7ncRg4lTu4thIA/P+j
         mDjqQQyAE93RMPAnpKLWClob3mnRQaBKXyzgFrRqReYY1yuE/xgFOvLCnQ+vAaG2RhMj
         ll8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450157; x=1789054957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrQF0RfWVSyrposIdYBuKXDlowmFEDCZ8WICH5uaiDM=;
        b=KxS1I4Ae6mWE7CdKV/mTDgGCBET9KBhMVWlbcenjYVigiZShoYGB/qcrmVOzW2apvL
         GGL2BpqdAbHjAFakYVl49E7SbBuAO3FuJfLAs2q2Dj7TVwvqHmqfdLgjkUQnzhdBXSOI
         Nf8RmDi5WtjeknlFthuPQcHz1PJtdba74gtqmhqlyMlWrUeW6kl5fuF0ZQa44ASUriOG
         q0fdB0MDvjVZdol+B+BKa2+mvlcawIOzEhukD8fau4ztiJi1kBr0lU8lf4F/PUxMxt2i
         OBYl5ftfFq/Zj4HS7plvqPVHehxCB2T9pzR0iVLbXWKxXhOgqR5meqNvhkeRvrhVIQ1T
         P1iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzWqy1aaQPmaZ2L4aRD0tjAso/gzNjkR5QYJZUrifKjYqBd8b+SZ3ZycoX/ndQyyOyFGaKYD/B9Nx+EOA=@vger.kernel.org
X-Gm-Message-State: AFuF++na0D4VbT8R1TTciUroUmiTNJ1cYqVSFEuAhCJAw62KSo5GAG0G
	JCVOUmZnRjmuYqLZnLmYCF/3XSUTBUBZ4KIm1RnkUH483e2EmR4t8pAi382A4jMmHQw=
X-Gm-Gg: AYBFou2lXB1TtKL7OUtI4vntY1JVrfClHGhj3lVF4oHEEW7Wlv4aV6eh2zoXm5odMA0
	6lpwck5bPBkuhaAv+AikHtFzOn4R04CSTEbPxezDC2W3qzYx21JkEl7pPSfn6rr8CvkBg23bn3m
	wPNfFoN65SqriL1JlTmkYfeH/P1eLVM/rmXFPWdf03nEF06ICM4l35UjKvaCwHuZNlJISot3T5t
	/Itnx1EZo9WaPlz9etkwmabDGbnlp8h1b5R/qlsxb7XyIpEMRcP+2Kqe9WIwSsOQie0FBQnTGFc
	dTmQuLVAHRS6cG1T0Fy4xJhBSQtjzQJ0OlQ3cHbmPgRkMcSqnIYbmbY7JNdCg/K5WUQgGVXOfHU
	qvx/0uH/bBZsonXZWvvO0IDf2phhy9t1hny1KzvtIKxkJt95cq+2gMBnVa5FtC82MvextudKOBm
	7BktpyXalHB2a64x3ZI8l5nVu9nBCVCV42vkkkNEUkoJ0oOYsnoiRCzOSvWAIqf+9fbAy44MCmq
	/M6pa5blg7kJRsB
X-Received: by 2002:a17:90b:518c:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39b0865357bmr7566591a91.15.1788450156766;
        Thu, 03 Sep 2026 08:42:36 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:521a:d95c:2f1e:64be])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm522926c88.4.2026.09.03.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:42:36 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 03 Sep 2026 16:42:17 +0100
Subject: [PATCH 2/2] crypto: hisilicon/sec: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-acpi-crypto-v1-2-253cc6fd9836@thegoodpenguin.co.uk>
References: <20260903-acpi-crypto-v1-0-253cc6fd9836@thegoodpenguin.co.uk>
In-Reply-To: <20260903-acpi-crypto-v1-0-253cc6fd9836@thegoodpenguin.co.uk>
To: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788450148; l=979;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Krkxe12J+zKExjm+ys4pq56wu8sANIl9Xl6198K8bxs=;
 b=LMdxkZ9u2EsjjrwjJsmPaw1+YmF8oPJQ+Rs1S9Yq0E9Z+NHj/qHAxOcg1F42wFjFniWD3INu5
 tySBfldbaTBDSEASyy7uVONgqNAmblw47lNyLqTnfHY1ZSfld37CvYA
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields
which makes the code more readable and consistent with how
lists are initialized in the rest of the kernel code base.
Also drop explicitly setting fields to 0 where it is redundant.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
 drivers/crypto/hisilicon/sec/sec_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/hisilicon/sec/sec_drv.c b/drivers/crypto/hisilicon/sec/sec_drv.c
index 2514a5e1f9b4..7d3fb8d67203 100644
--- a/drivers/crypto/hisilicon/sec/sec_drv.c
+++ b/drivers/crypto/hisilicon/sec/sec_drv.c
@@ -1285,7 +1285,7 @@ static const __maybe_unused struct of_device_id sec_match[] = {
 MODULE_DEVICE_TABLE(of, sec_match);
 
 static const __maybe_unused struct acpi_device_id sec_acpi_match[] = {
-	{ "HISI02C1", 0 },
+	{ .id = "HISI02C1" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sec_acpi_match);

-- 
2.43.0


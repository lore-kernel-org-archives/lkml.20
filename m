Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9906385D97
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845889; cv=none; b=HgAPvzCPD/7gzMfdGkK7rSGNn0+LX9Fo1FEduHipJjt94OgnPOfYZN8dxvbQJgtUjsW2q0ofIqRgjBu2/lLRg1+vluWj45t67GLwJVhFCqVbUENNmrlhaC37KA+6ejWum0CfYEnSLIPFdUf0y+tRUyf7JwQckexbv2aMZlx95/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845889; c=relaxed/simple;
	bh=v8aIwwPu+ykUe2DVOsCMtMaDklWrhQYLetu6xwVJq0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMnaVRbqw6JdfoxbstydgMbcLBUaEq4L70DxWUSjSHFl+KvZ4AqSsjOIAOmvZzNfx41ajEtfvcXC6SypEHUVQrcegTHc+LyM1asTyYLmx3vCWJ4nIgbhERyf+AqN+EprLPQrej9j9PeOPSoC1kVkUUy406jxIk5w6trfa2xtxjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AapVF8P5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AapVF8P5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so10224435e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845886; x=1790450686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gf8kv8NIScq3SH2S6osm1YMVG98TGrAQ704A6bF98Zw=;
        b=AapVF8P5dphgczHfbjROX/KkV/6lvIR/Mguec+Pjl4230fBmMwekjXd+3vobBgaUqZ
         lwe+Avf+DPtj+x4UsJweh5KMA+coDf5QgroOhDNZcDq6Uh4Ss4xF6MRgfIDL8QBaDIMq
         bAXLD6XmDFKgZnSzkg2WhM/oMkqpBrvAa9+DNzqfEtbJIE7M2HSLXK4y8LiIxhn7BGKy
         wQPseBz8wJBe1KeoDXwULSbzUFHrnV8pOux0UgP+uK9l01vbcC5Gi1Ri+EHtLOCqrI9g
         IsS6HM83K6TlF9XHSmv1fLxcAfCtMTlG7xjtX14lbA7XM6CBUjJ9HOeQQ4lI3arNMeTl
         s4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845886; x=1790450686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gf8kv8NIScq3SH2S6osm1YMVG98TGrAQ704A6bF98Zw=;
        b=XwACmU8tcOTPORnSp7IFGA3NTaa4TJHtVwKiDHTF/dqIRRe2WEPJqFUUhyAkwJ+z2I
         mdtXwet7eWm1zwjxCmzyE2/HpZYukuXHnu/z4UorzRTYRe5yWyNjvqzTBph6dht7hecn
         Mlmg0lcSSJFeWyasYW38XpyvEKa0SmbobmhcE8gxW6otrW+UgkWr38qoEfjDCI9cioLi
         w8tLdfhPCcbE3+2WY3Na9QT3Pf6QfsnFSFH9VvF4yuGyZtEWp/L28asOG0Lz6Vljop0k
         /1Atc3VdX/QvT8RDLka6fb3Q11DHmCMhc34mDID/wF0UwN+5Zp2EEUPlOnz8ScRUy6XW
         nSBg==
X-Forwarded-Encrypted: i=1; AKwUvBw6PvYH8OCSk6lDhCfb3kkBIjI1AGPt4uF3GzchaY+DzM2bUigMsIcALHoMx7iHg2w737F5xhb5MA6H2Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++mB76Bb81mjeK9gPPpAGj1oVBH+V4d0nWDy5kiVb6ypp350YDLP
	v+wGpCYbDGxsPC+jLE9nwe9Hqwl5DmMT8tpvkS6+fQEsoX+sd+1xILxv
X-Gm-Gg: AYBFou0tBxB5pIu/g/q9CLv3a/as9UZOHv6WmYzJdpg7gXFAC79141u5mydo4mGKRXF
	FEkCfhs845rsoxpTQeqSJZuu5Xs4ZQ5Rwf3v3qPRiRInigXwixQxslqgTRYcIC8gKuph9q42cMf
	OruFVDPMeSrL9dE71EBiBaf2iC3eXIANqPqPYCptQpBS1x5yDoZogxSAjo1+YFjAr42+SXycKHm
	53nJg0mcQR9SWSWBgvtmrNm0lekgrN11v6qk8o5jSI76e7kkcVbJOZH0g5Z78MK9NECfVyO5bUK
	41jxUg0AGv8UUZpxzp0wKW1+FYNhbl1Q4781ma1gZYb8JzY1uh7mIeSpfX+zZvZIw1ZJSNG7Vre
	TFgWijjZtW4Vv3jVKDygrBo015B88ZgmfVkKhiG02QX+1/rjbH/Cl8Ff+b8YzcXjfLztFluUwv+
	rWCdjqqadWR8rJ9c/1myv2DT1ReoszlE9QzxKYCGANBBzgPetq/VKp8qKUU2kpTaTmBgNBniaxZ
	LZVCB9Hi5UE963u1Zsq/Qy4MwJhfvFQKweNQj3CJPffxQ0oHLQ=
X-Received: by 2002:a05:600c:83cf:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-49fce783698mr26147265e9.19.1789845885850;
        Sat, 19 Sep 2026 12:24:45 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm114499505e9.2.2026.09.19.12.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:24:45 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: herbert@gondor.apana.org.au
Cc: thomas.lendacky@amd.com,
	john.allen@amd.com,
	davem@davemloft.net,
	bp@alien8.de,
	ashish.kalra@amd.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] crypto: ccp - fix SFS ioctl race against device teardown
Date: Sun, 20 Sep 2026 00:24:32 +0500
Message-ID: <20260919192432.272680-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sfs_ioctl() reads psp_master->sfs_data and caches it in sfs_dev before
taking sfs_ioctl_mutex, while sfs_dev_destroy() frees sfs_dev->page
and sfs_dev->command_buf with no locking at all and only clears
psp->sfs_data afterwards. A call to sfs_ioctl() that reads sfs_data
just before sfs_dev_destroy() runs will still acquire the mutex and
go on to use the now-freed command buffer in send_sfs_cmd().

Have both functions take sfs_ioctl_mutex before touching
psp->sfs_data, so a call that is already using sfs_dev completes
before teardown can free it, and a call arriving after teardown sees
sfs_data cleared and returns -ENODEV instead of racing it.

Fixes: 648dbccc03a0 ("crypto: ccp - Add AMD Seamless Firmware Servicing (SFS) driver")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/crypto/ccp/sfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/sfs.c b/drivers/crypto/ccp/sfs.c
index a4777839790b..530141f8bc74 100644
--- a/drivers/crypto/ccp/sfs.c
+++ b/drivers/crypto/ccp/sfs.c
@@ -111,13 +111,13 @@ static long sfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	struct sfs_device *sfs_dev;
 	int ret = 0;
 
+	guard(mutex)(&sfs_ioctl_mutex);
+
 	if (!psp_master || !psp_master->sfs_data)
 		return -ENODEV;
 
 	sfs_dev = psp_master->sfs_data;
 
-	guard(mutex)(&sfs_ioctl_mutex);
-
 	switch (cmd) {
 	case SFSIOCFWVERS:
 		dev_dbg(sfs_dev->dev, "in SFSIOCFWVERS\n");
@@ -191,8 +191,11 @@ static void sfs_exit(struct kref *ref)
 
 void sfs_dev_destroy(struct psp_device *psp)
 {
-	struct sfs_device *sfs_dev = psp->sfs_data;
+	struct sfs_device *sfs_dev;
+
+	guard(mutex)(&sfs_ioctl_mutex);
 
+	sfs_dev = psp->sfs_data;
 	if (!sfs_dev)
 		return;
 
-- 
2.55.0


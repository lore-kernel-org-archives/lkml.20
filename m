Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393F246EF64
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521718; cv=none; b=u+ukCg5aEUGKdUotm8N89nTxhin6kXwtUU3UwLrFlZfM/LszddvSiAtcnWrdB6Zk5j9ie+tNSSfIssGZVYmuHFQdb9w7Mq0eXXJc3j19tmPjDSe0PkR7w9SCdLhWKmyDhf8WNdxJX8X1yA/0wLZzHA01hmZL8PNyNQUMNVQnD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521718; c=relaxed/simple;
	bh=XjDrZd4YIhNKuCnOzVL9JK1gQzcT2yvH+5UE75VLw7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ1ef4o3Jo1sIBY6PVzm3ByqLOqrZ7l/34yRa/0Nu03Ex2+aYeN/5JR8VJItQXAk1OMGuBdKDreHfCzKN53jHFkLn2eOSQSoIn4N9gIVb3wnqB9ZRi2FWaLzgTkK0UjS2nNF4+GxY4pZKiQzWAOH4fPGoasI902ymoc3GFwDLSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7aVp+81; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7aVp+81"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1040402a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521712; x=1789126512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJW4o/L291SC+eI59BXCWfFEdxDJM34jTF9K0ZgdsqE=;
        b=l7aVp+81Qx8D8Pf5MtN6a0LW0Wv5m5oq0vgc11S7G0E3wiFijasTECXvar0Uy6lqsJ
         Yu/a+HwBkFMAGVlLSDpQSRIB9HXvIOOfTAUNQ5w51a03Uap4uhfQgzZWCZLwL1xnOoff
         NW+0vufX76M7e80J9O0y3fzvr8ZOMrlGIwVWFrQkupFuAGycDzaqY6OKh+JIo2p56e73
         T0rlgKXdmqjQ+R8tzY2p+HUI8szTLMj5j+0PjcKqVa01ieHFwXZtmsaQaWylfDyg7Mrg
         0mCfbTWlQ4NYurwA05aMtuN8cODh/X/M0WPXR4xwdTRzxBcu6pSgLsBsDq4gEPoTFK8v
         X0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521712; x=1789126512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJW4o/L291SC+eI59BXCWfFEdxDJM34jTF9K0ZgdsqE=;
        b=lnZOwH/74fCF5g/oG72JCzsOsxZr8/tZwBmP4GKl1vENejmIjCqogOo0FflpzrkN7D
         cgWiyW7LHv8W8gJ0yG2WAGa97v5nzgLWlB5V7bO86krylNl3kBkNzkXs46NJ6sZ1ZFG4
         EYvh3OKDSvei2C9/va1pwtgKepRo71t+qjd01s4hDDrs9nltO6pZJ6iGN6iFbvi4zzco
         +E02FJBGw5/FB1dM12MJYOzIqSjJX9cN2SyayVF35BF11YX+SV3OTyWboFVzcOatUcHK
         iCmjVB4m6Cq2XPFvhIoBgWRstRUK1/wVbnqJVdNB7zfsyRrh5Hu4Ftwf2aLWGu5jb3Ci
         V8hQ==
X-Gm-Message-State: AFuF++myahX9U2tKGdH/bsQeCU2sFRq+JVSQAyIY3MFQmJUosu1sS6yf
	B2OIeSzfBO6EmjzfuMcLkw08TSab0TMdv0uTXHgkDBivJKFwSiTcLTslGH/zSErxxhY=
X-Gm-Gg: AYBFou1dveDG3VtkBZJZddiTDIyhXa9Z1NyeUFZkNEP2LCal+rKenfDMEWT5m05THcu
	vNhBitJ8C8H20Y0vjwAlUyVOcU0fMPQy+ljTC2Ug0M4ZgRwkJlWT31OysfIcX4mniTMegwmv5S5
	ZS8PcB8RMY9ENx2FxLPg3iYqFubqHhas7nN4tj8NXlhWKiUekYDfbapOoX4L5zFNt12adQfjNR0
	FyzKLWNfRFAqMKSN/Oiku2s89JZGb97uKgA6gI8IivbvtM/mgMOpLprVr3pupuPIQF1RnSK4r0g
	cNZqYRal47zwmL5MCjtp4flBl9vU37wuztfnI7EoAKqG/SLx02ln7fsngwTE5fr1zkmXLPGpHJ7
	JeiDOLuOAW7wfbH4lgoFb8ytVHF2K99R1gyf9XV8hMZyGuS1m5kEQf7YZeEGeRVms8HuBYEzTDS
	FVc0hkVAvC5mBtMTRMpQA9bjeCTJ+JVgMpslFmcWQiWoSraf0snvXfmrvIEwA0em4BRykheNRTP
	QwU5I7BIthM8GU=
X-Received: by 2002:a17:90b:2ccb:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39b261d8533mr9704057a91.17.1788521712347;
        Fri, 04 Sep 2026 04:35:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6054536c88.10.2026.09.04.04.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:35:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: pci: fix repeated word in log message
Date: Fri,  4 Sep 2026 17:04:44 +0530
Message-ID: <20260904113450.15838-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113450.15838-1-hemanth.selam@gmail.com>
References: <20260904113450.15838-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the word written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index ac5eb6b923e2..48e56617f324 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -856,7 +856,7 @@ static void saa7164_get_descriptors(struct saa7164_dev *dev)
 		saa7164_dump_hwdesc(dev);
 
 	if (dev->intfdesc.bLength != sizeof(struct tmComResInterfaceDescr)) {
-		printk(KERN_ERR "struct struct tmComResInterfaceDescr is mangled\n");
+		printk(KERN_ERR "struct tmComResInterfaceDescr is mangled\n");
 		printk(KERN_ERR "Need %x got %d\n", dev->intfdesc.bLength,
 			(u32)sizeof(struct tmComResInterfaceDescr));
 	} else
-- 
2.48.1


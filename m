Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38DB19C54E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384312; cv=none; b=JnpWeIVw9WJqb6lD7DgUpg15oZRdVFgXHKPd8eo1WGzzJIH2Hw8sCuC4tazdTV+OLHecoWIvBtWtFDN52R4dgoJKVnI89fJPcsKh7dmDIR1oEFdKycPNU5FWjhAXL3L2Or7GRUNJVmt020VuqPkvzdgC6SxcHNFspjGy6R62y/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384312; c=relaxed/simple;
	bh=t7gejd7pyTIJ2I7S4voK9PUjbWOEyRbCiGgVq4K0UpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2cwyI3Buo2Q9NEHQ6sedA/LW+YdpJSQSe6dsjcKL+8+JIF8gPMPxMDtB6l5KHjSlpR1ZXf3tBu3yw7OYtOMkxJ3O2xb/ixvUa34+vZ2XzWpdeiuRIJtsy0LzkMmMuZ0V+4HfotpoEnBnqWEo9qZWZnBdp1LC6VHHLd0jd9X3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWt99sef; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWt99sef"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so1809093a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788384304; x=1788989104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v79KdHEjlvBLg7mwEWFWAGAPOJe9EFP/OK1uhnL10sw=;
        b=OWt99sefuErqJBN/8NdmxiZyZXwzf2B8MxeKNWLAk6q0LjFV7itcUKcS82kYsBNstq
         pbWk+PgWN3xMVh+5jz3g8vfL1nCxZoBBRL/1TX7KduFHVRKAidejWVVf/nFo7jq3KgKQ
         Zs6z/9HdFYIl6x4HOx6KNh5xR0l1ssmA/mSpKEMMbFr6TT8nCpDdZ6M8GuPa9nWnQaBd
         cqY8pPqK0WU4UUpXRrLKO96VzCSK1ofVcTiyQg77EmiuHVZ26nwMDieYCJfIIVGfEZ+1
         JypPGm/LvslT1GjNR5wThW7kH0jYzNJNT4CYfW41zef0u+7a2C90MSGNn6D1wBLhjowp
         lCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384304; x=1788989104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v79KdHEjlvBLg7mwEWFWAGAPOJe9EFP/OK1uhnL10sw=;
        b=rNxkERIol7jCvVVZimuxrOpC0U1BfHp7R3q9mAGIH4OMSRXxfAVXtbA5RYTZXb+rHI
         RsKL9lwUlVPMU2ylrugaruQcKDlVW5vRC1CnrVyV8VkdeXl2ErJfDVWUheUqOvsqRhqH
         4mFOKMuheUR49IRy3mx6DDcLqKsa3GFyZqMz1Y4++Pi6Ns6e5SoQAp10H4gNlhRIFgKE
         Y3bdB7dRUrsQZsYt4Qn6R/aSKV20EE4Ar3XKoPw1MewGKtYLDNxutpPpUIg90yTCCVgB
         l8svwNZAFdf8x+aUeJJxZyjE+B1/HDB9Tz2UOnHgkpNZ3RtuO/rk17oZ7S9Z7pO7Y78g
         K0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMtxOYQGwfHvArpRLX39M5oNxdUIXvM4j9IEFGxl0cbSFJ2M9Dt0xJXr0e647lYlvFuItZtmxk+7yCGhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kn7TLJhlLsOS6kPm/Vy5kABH37FieHt9pNJyEhlZXcIHx9ZJ1E
	mmnZpZQShy0SXOVUPeZj7BlnifrttPymO3uDulOGuCvHA9/mSzRHWq9o
X-Gm-Gg: AYBFou1DDzBEbfNR0rzaX8LtqyOgVpJlWppEX0dHUsCmR8iewogBvBia9Q/W4Q5HdsN
	IUxNTrleY6aFJjyZKojG88u9ZyRfYSjTGKwJiOSVDQdGYpLVOie0JpQd7WO7EG4/Miw88s9Uj+w
	EPaYrxkvBF5ilQZkBBnwYTaJZvwFlmfh1v3lWj4SYUWJiOV09kY3vMky6Jd82mj6U6u6R336xiY
	Q3xxQ0vz3cjd13i1cHwGGChzkSIiXeq0Yug18lBkA17NM7HFLTMQF9Z6NbqPUzgvEzXCl8vNP3h
	y7aLg+NKWoGqhZxMBrvM9MIFULWSq356QFqCBq3Jl07Vrg13aKrUpMKUtz+cFDErcnoHMciYhJ7
	RCSbaJdHfjXysXkxdejVjmKbnavE5fiDAnRlUrDnsXVOyfOm2EokqRnT9OFRbGzJ9lUAQynwH4I
	9sBTutaJdeebYi4uFJb2FUwW44xz/SCqkxDtCi71exUMSc7wLYsAOr9VB/KSQse5C5druDX75wa
	wzBAZdKiYP1JCiAYTgxIlq/WKVQxoxUm9h2+JmSr3/OSd2MUxuscZ2qdGLjiFNvMcIxh001Z8U9
	8faKOGBWod/CrvoZ+vcBUSr9Pw0Fa8kY+wA46A==
X-Received: by 2002:a05:6a21:70c5:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d9acb3e96emr13064690637.4.1788384303970;
        Wed, 02 Sep 2026 14:25:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d40c55fsm90890a12.19.2026.09.02.14.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:25:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 3/3] i2c: ibm_iic: use devm for main allocation
Date: Wed,  2 Sep 2026 14:24:56 -0700
Message-ID: <20260902212456.289608-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902212456.289608-1-rosenp@gmail.com>
References: <20260902212456.289608-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of kfree in failure and remove paths.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-ibm_iic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 8af666442952..d577bf47fa56 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -693,7 +693,7 @@ static int iic_probe(struct platform_device *ofdev)
 			dev_warn(&ofdev->dev, "using polling mode\n");
 	}
 
-	dev = kzalloc_obj(*dev);
+	dev = devm_kzalloc(&ofdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
@@ -755,7 +755,6 @@ static int iic_probe(struct platform_device *ofdev)
 		free_irq(dev->irq, dev);
 	}
 
-	kfree(dev);
 	return ret;
 }
 
@@ -772,8 +771,6 @@ static void iic_remove(struct platform_device *ofdev)
 		iic_interrupt_mode(dev, 0);
 		free_irq(dev->irq, dev);
 	}
-
-	kfree(dev);
 }
 
 static const struct of_device_id ibm_iic_match[] = {
-- 
2.55.0


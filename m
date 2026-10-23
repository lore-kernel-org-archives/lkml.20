Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740737;
	b=IVZ4SAAAHgs1PVFkf/q+65Cf3jFC99VKlnzQyC9TM1vUDEr+7JVjBmV3OsYqZ0be672a
	 es3AFznvAn083roCjN6zI/4xfrY9Wlku3vjpdOYPb3ZN0eUmKIdVToqxk9+R+Juirg6Ir
	 KNwcIBMGlFSmnBwoFibEVMGSAOyHU7B6/3R5tAmjhaA7dB32IfKDc5wmS3g1qv380bsZs
	 lU9syRGmuIbndWdhSh5gJxW6ur5yzz2jbaVq9ji3Ra+z70V1ERIOYFrcITt4xy7ost3ZR
	 C3AkSE5sJFaCf5HmqUMHR3juZ8osOwwwn6s5lyfojUDEcCXsOLH8xds/BW+1TsD2mIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
	b=Lng1op1WsEKXQizfhDtwRKXsBAUEiVe5BD4XCFNGry7VIn/ir/iwTJz6VKnQDFr+mHxx
	 eeisvJ/fBGafudz+muOz4g6Ww5Kd+784wcB+Qc+U1EjSFvPviXAGFSXyL+tuhf0b6aQkA
	 G1oluaaV6LmZEK3wZX/3+k+jsXRORR1nalFCDwe3QWpBLKGTaEzpr6OIpeku1x2emhtTR
	 OD9/bXFalb3LsqnkrglSs5W2iIUzmERdgK3MlaQU1IWCJHKhUbP2V1ErE28i9zZ7FZP/v
	 kJyk3bYbuc8LhkXCeVsn16kAuVFKW8xIrgS6p3BjOR4CNtDjNIag0I3s627+dZ8JIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1+eVLMY;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F5606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6F5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d1+eVLMY
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e985106c0cso4445895ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740736; x=1793345536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=d1+eVLMYtXs0c/wY+D+8tqUVklOiPZV1r/PQ3RY7YaNYpOGlGBu5YWT9hIPUnww2eG
         757QD4qV6c7lJZJ5RJ5UOlExl+FgIi98uN3v8UJI7DNVTppGdY4WlABffWATu1IsP763
         RZZE941EiVPOjd9pcrvf/MTX9O3RH/XOaCq4sqAfkAMcAINYiciJw+lM2Z59dR2fnu/h
         D6FyX3YJXYYb9MvNIEpWgZaHxSGEfw8GpYWuWiwhyOgelg9KKN+ZNcTnvkMkTriGf9rj
         takfVi5mvcrHrKfp90V+ffHvQXZwdkHZWW5If72hirpLtbYLIEGlVkcG7+cl3jWNr+Ht
         kW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740736; x=1793345536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhnlngDTdPCRzQ3WfPeVfNn/5dfQaEbDCnTEYto+WIk=;
        b=LstFMJMkB7k3srgtE9fBR5mAf7WVbpRxybhCJpM5MTKYaXpk49iI7qXgwiLzHGAlBQ
         c9V+G4+0VeEzzPDir7nUmad0bV00FpN1IuxIAedw+mhM0f3unjBE8Ts+Q0ZOra4euZ0I
         9bTmftKbuaU8WLflnJYuFTkf746afJYiuL2iUEavUP3EhFcQHntw3IwWGrLappb+FrPi
         kfgTLZlfhNZz8SfEsbKGs/A6yEPAiDyQqyY+1dncgfsdmJ698QnC/VnjsNJioWg8Vf7I
         8yXnTcjue7XqJCi6G5RMN7YRvSyl/RciSA0H+hfy6ZmNP/JJyNUYmtl92VBarLkHUZ07
         /nQw==
X-Forwarded-Encrypted: i=1; AKwUvBxZJULFaKGEAeE6G/SUQntJmMh6mEP9VwVZelzRkSUjlvdSfuIcHGMp1yiv+I4YZK7WwFSSLCJwurryzWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeOoTE7DFc7jUd3DKMn05FWFRqFUgL0PHOm79S2xBqE0nTgBrf
	tO/z+FDFjs/Q/aCCtJbLYQfBFKYNHDNd/AAInX5ztZy8e5q7Jc8/Ji0k
X-Gm-Gg: AYBFou306vWhLJNZJvtWrmwwqyr9YOM3Lf8F3tPLI+msae8xw5pfB+iXdLXQzzs9vQA
	ZSsmrQgj8VYmQMOplRnK1JYgcjLt7jFtryrviF78d1yOk4CBRCD3qMftLXFaDkf9/wLk1aJbuYN
	8QCgm4hyAcQ0YgEi0as+pgcO+i6Xzrp6cJxfCMXwkltYnigrPWuXr5ZV9vPv7LCTrlntGkFJ+4S
	RzVKNfNZLawE8Gz7tfOc5yo/I0r4e7r9N8ONKZNwsWmcDVCEGyrTjzci6sI/VQ40xw7vgmnND6l
	kbdWdJL44mXgw9MpFbsZ56jA0u5L1T73FbP4jdMYxjQD1hbfEjn2VbWnhjBA37LpvhapVVOv7fU
	aknv6EbnRuXuUqpg8mB6LWmnWiaARbwm5Chnw3tbn5l/L6uP6wswUn2rqYdxgI/u0dI2vWdA1so
	fiEbmSYEUn5Jy0nmH2ie2rfyWy7fT+N6iVdWWRLBC97Ep2kiaNsCRzkP2FB6WP9BLzSqbXQBJM4
	W8XV1uPr6znPJc7uN4Y+pxM6CwAyPpJi7cx0S0KHPl8UIxnCGDu3/RahViccMIwK53Qj2kYPDM=
X-Received: by 2002:a17:902:e547:b0:2e4:b112:14d with SMTP id d9443c01a7336-2ea7d132e9fmr13812005ad.54.1792740736475;
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3a8cfesm6769735ad.40.2026.10.23.00.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:32:16 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: qcom: hidma: fix wild pointer stored in mchan->running when active list is empty
Date: Fri, 23 Oct 2026 15:31:54 +0800
Message-Id: <20261023073154.744365-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

While auditing list_first_entry() users we found two call sites in the
HIDMA driver that invoke it on mchan->active without verifying the list
is non-empty. list_first_entry() never returns NULL: on an empty list
head->next == head, so container_of() produces a bogus non-NULL pointer
into the enclosing hidma_chan structure instead. That wild pointer is
stored into mchan->running, and is later dereferenced in
hidma_tx_status() where "if (mchan->running) runcookie =
mchan->running->desc.cookie" passes precisely because the pointer is
not NULL, yielding an out-of-bounds read / memory corruption.

The list can be empty at both sites on entirely normal paths. In
hidma_callback(), the completed descriptor is first moved from active
to completed; when it was the last active descriptor, the subsequent
list_first_entry() runs on the now-empty list. In
hidma_issue_pending(), a client calling dma_async_issue_pending()
without any queued descriptor leaves both queued and active empty, and
the "if (!mchan->running)" branch then fetches the "first" entry of an
empty active list.

Fix both sites by switching to list_first_entry_or_null(), which
returns NULL for an empty list. This makes the existing NULL check on
mchan->running in hidma_tx_status() effective, so the paused-channel
cookie query takes the -EINVAL path instead of dereferencing a wild
pointer. Both call sites already run under mchan->lock, so no
additional locking is needed.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2


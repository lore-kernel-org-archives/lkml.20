Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4BF43F4A2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817762; cv=none; b=LYSJOqP+yrB89CcIJOt6a7J7n28J+vIzzixzzdQ52p3VCRXMeRqngJdXh/gamD/vGocXY+nTaPbCVUFOeI41mqyGopqFp1gvtGUC3BejmpDLNjS3C2rolCAKh9YaW8n2nTZjWK89Yi8fF0cWi2sCG7QcjggK5XaQrIn0oOQmfaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817762; c=relaxed/simple;
	bh=kyhfJowlP78+mT4TFrBLw/COfDR9mYJ+UJWh2YOktaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uNICNnqNipOb8bMaUXvGfs+jD9TejBtB3JZ2q/MtsKLnDRt5gjqU7h02967CWLBDhNWyeSl3f7vAI1Yr0QglydzKv3Byv/bMwYEZ56P4j/zmyjNDa9UUAeuMxwnVV5+EIOg9nZryRxknIYkYiLFEK18NVFjcTsSRWZgznJCHKuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVK7TpGO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVK7TpGO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6f9e2f681so42440745ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817759; x=1789422559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qjiHaibP4J4hTCPeapEW751w4Tf8EI2jtPcFZlPx910=;
        b=YVK7TpGOvSXVUXO8CbLPCjinNV/Rvv6qrqfk+39k7/f5DLhhuvYROa+zCY/mOiiATl
         X4OdUm9Dpn4/svR7ikHffj1rZiYAitkDEnUpsD5mF8vnYxWuAE0bdrSTpUpIs/GVdU9i
         8Gb+Z2Ccy8ox/+I2TgX2M4VgSVz/GxKwosRRTT0esrMgF6D5lswONZ1V9hwOOivVmSZG
         Mnh24timSSg+/+ygNb+JRht92cP1FDZsyQIYjDu2mmuZ/q6rh2USQ80+yJAhL4rpYdgo
         BltydYJeIjg9aFoPTJW2MlTgdtQN852Qu6P4uaS3/Zh02IR+lqiC/ZGnW3u02jmJ9KMD
         5hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817759; x=1789422559;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjiHaibP4J4hTCPeapEW751w4Tf8EI2jtPcFZlPx910=;
        b=MWZdizieJFSpcM3GKlo7cP81KzyAj1ib85RkL7zBqjNmEfKZZ8w23RCqtAMT9/CBdb
         I3+JcAgm9az4b+yMhjiiCJKouYQ8ZnIjoHOTYOZpBmf/SFzdX7P50afXH07gyKYEREor
         Y85Ij/hrkXHaUXQu4/TF/hJTVCmxGGyIP2EZFgJKTEFTyN3H7CK7O1YaK8EA/FU3bWN7
         MlzIawsPdKeNghC+MPX8y++htFLiw5K+FLUFg5gEiDt+RdZIKSVoEE/TR1xF1+bgti7o
         hxx81TWursHKCOiN1YjMStcGY1adezPMvsgIQ9WKpHT77F5pbrbYGAIVghqulp55R2r3
         2ToQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuM65nB3T/jMvzbWlJ8fdpifdYS1+Y3urr/cQE+eTJuGHqGBlUeRRQx/g98kwn6JnZAzNJKXaNRvvtNVs=@vger.kernel.org
X-Gm-Message-State: AFuF++lEu94uQu7nhbOgy0xcp+3VNO9SnA2xmOEyvpWPvcW9YwB591iG
	k2E1vcdGuwmig4lRcZ/ZdOwXIIwaIg1fVLDUQIVsxY9AB80IdaKsrc08
X-Gm-Gg: AYBFou02OEsBmQOeMlcuEsYTNsoebIjtCr9krfsGnRX13BVkxtlfsnomI3DUw2UJ4rj
	yUTzF0u4Xk8GomN6ZGG9ypDNbgBDgqaI/ammMbwD/xmMWFs6ze9u5KnL1eOn0aQVhZOOVh6NJR7
	BXpu5GT4SctcbOe4d/2B0NAvYSsABKH0fdRmrdjHCmZdhY6hZ9ObFfy0ImDmKQi+ycei+FRaIlg
	Yjp48rNDvwZjIOlFglJFKrtijorsg0b9B+pceWYwKb/9X5KlcCqG97PdF5cQhrcQNjPS2gjD3qH
	5QyALnuSakznfMSVcN053c34owz0FuJd1LMsXCsVzRiYerG1pGcZ6wBuLnESYgAYkIWjU8pv4IA
	opGmGc8qSONq3ak8HpZY1WW67RHmxQTMkfQfH+rA3kvVvkY46GQexoJf/QGUzdOwuMLcLTjsCM0
	KrauVlgE5mnkin1QOIU2ZOq198lOC8u2CCUh9/vFEAZBnmDaFP5l2uK+V/fDnC+MdDx9u7IKYXh
	UKctSA597/Zg0POR2QVEcEQr/8iUAxmQQL3fQWg4KE=
X-Received: by 2002:a17:902:d4d2:b0:2d8:d4ce:7e3c with SMTP id d9443c01a7336-2db12630dd6mr289758255ad.17.1788817759221;
        Mon, 07 Sep 2026 14:49:19 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841eaasm48794155ad.8.2026.09.07.14.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:49:18 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 2/3] Drivers: hv: Add vmbus_leak_buffer()
Date: Mon,  7 Sep 2026 14:49:01 -0700
Message-Id: <20260907214902.9046-3-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907214902.9046-1-mhklinux@outlook.com>
References: <20260907214902.9046-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error case needs to leak the buffer memory allocated by
vmbus_alloc_buffer(), doing so requires knowledge of how
vmbus_free_buffer() works. In a CoCo VM buffers are allocated
differently from a normal VM, and vmbus_free_buffer() handles
the difference.

Encapsulate this knowledge in a new function, vmbus_leak_buffer(),
that error paths can call. After calling vmbus_leak_buffer(), a
subsequent call to vmbus_free_buffer() frees the additional
resources used in the CoCo VM case but does not free the actual
buffer memory. As such, vmbus_leak_buffer() is callable in a
context where accesses to the buffer memory may be in flight.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/channel.c   | 26 ++++++++++++++++++++++++++
 include/linux/hyperv.h |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index cc86e8505ad0..389b27cb038d 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -648,6 +648,32 @@ void vmbus_free_buffer(void *addr, struct page **chunks, u32 chunk_cnt)
 }
 EXPORT_SYMBOL_GPL(vmbus_free_buffer);
 
+/**
+ * vmbus_leak_buffer - set up a buffer to be leaked by vmbus_free_buffer().
+ *
+ * @addr: buffer address
+ * @chunks: chunks array from vmbus_alloc_buffer()
+ * @chunk_cnt: number of entries in @chunks
+ *
+ * When @chunks is NULL the buffer is a plain vzalloc() allocation and
+ * the buffer is leaked by setting @addr to NULL. Otherwise set
+ * @chunk_cnt to 0 so that vmbus_free_buffer() does not try to re-encrypt
+ * or free the buffer memory, but still releases the vmap address and
+ * the chunks memory.
+ *
+ * This function may be called in a context where the buffer is still
+ * being accessed. It must not remove any kernel virtual addresses of
+ * the buffer or change its encryption status.
+ */
+void vmbus_leak_buffer(void **addr, struct page ***chunks, u32 *chunk_cnt)
+{
+	if (*chunks)
+		*chunk_cnt = 0;
+	else
+		*addr = NULL;
+}
+EXPORT_SYMBOL_GPL(vmbus_leak_buffer);
+
 /**
  * vmbus_alloc_buffer - allocate a host-visible, virtually-contiguous buffer.
  *
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 9e109d91aa14..6f60ce5924ba 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1220,6 +1220,10 @@ extern void *vmbus_alloc_buffer(struct vmbus_channel *channel,
 
 extern void vmbus_free_buffer(void *addr, struct page **chunks, u32 chunk_cnt);
 
+extern void vmbus_leak_buffer(void **addr,
+			      struct page ***chunks,
+			      u32 *chunk_cnt);
+
 void vmbus_reset_channel_cb(struct vmbus_channel *channel);
 
 extern int vmbus_recvpacket(struct vmbus_channel *channel,
-- 
2.25.1


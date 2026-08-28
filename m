Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6242F3621
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952251; cv=none; b=Dcqff5rPcYu2aKA1aqmpu5BOb/aSqLxj75i4guetFHW1zgpkK1Azri5NBOlUs8WQkehUo+8EneuTVvGbqpsH7RD+IzENh4FQwufgFuhsfDF9H/xqIIhq/P2Eswa18j1j/VcWiEUUoJLyRndwdBZHLQ8RfqKCYOs0Hr7Bl6yw1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952251; c=relaxed/simple;
	bh=/ULbZx8c81oVCQ7LPBL4CrQ8DswTvGnsawK+O79sgVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/qdT11pNMjfsNPognwa/zMlCBNh7PBEAa1usKqlTnlYt3B0S0Y9hTHsFK6TDpqR85SFsOwA6je5ifvMsNmSbW2V6r/nBoGWaFQwEBketShXJpA28mBxH8RZh/yK12/sXlnBQHhEbywzBSYSU9MpRUhLQXMvG7/2KNgnDdDLJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYaRXAh/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYaRXAh/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so13572605e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787952248; x=1788557048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDbfWy3mJvr3iFz1oWIhMN0E9yCNJZGzu22x+0wJipk=;
        b=oYaRXAh/3qcfP3BjPN7ACE1iIwfSg6+FpVYdHE7tJiWpm1wJ9IoHadLepyDWQA/EDE
         K+h36eoBXbtuK+6Q8WLpKdEgCWZu4w0R+eu7qzHuW3Pp/vp03oTn0pBBsosrA75Qgtx7
         PBrASJG/hOtHvL0901j+EU1TBE14zaGtALQZ9tUs7ZJe8x9yTk/QoJ3ryyeErulNL/PV
         sDKL5NHrsKnQ1Z+dd53JMBSAqlTgV/CPZhXYvNOQuzkezalgiAj/FAzPSd43jnwzX+kb
         Hr4EBVTq3jb2a1CJhm9A+tJMN0cuaH4NO69Mh/Lfouj7EQTNzfnK2UPzAx8iDAQJLErt
         XFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787952248; x=1788557048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDbfWy3mJvr3iFz1oWIhMN0E9yCNJZGzu22x+0wJipk=;
        b=mTvkA+TuGZAjytA+hcX00ejTZ96w163DqLSV6vQh6+Z3BkpVZelT0I+Am309w3MNrU
         2cdngyaHrqjHlmmHF4P16XODmjhHtyssHuS/b64XAFkmnrY+gJdUzZh1iHbHxScmyJQ9
         cSSeqUYww3bYeO9o+Hw394yjbvJ7e2YynNUcwe/EmFTrZY/RccLvwAZ57QSoZZPtWOCL
         KerZk8IWXobj+1m1QXYuqtz1ryILAXSQwFARUyYAEUJ9tqaNjK47xDMEPUeAZqyawSuE
         zHcDblik+rZKGI6XwX5VVgFdCcWUsNELHLYN5Lzw/EIcoiYOVayp1HHcJV/HQgEoiN5b
         J5pw==
X-Forwarded-Encrypted: i=1; AHgh+RpN+7NZ9gen4uxxB0gdyCANfw7sZGSPtDTcgfPiwfi7Drtqfk65zTh4qQAsCQQOsdA5QY5+WSkBi/IBIgA=@vger.kernel.org
X-Gm-Message-State: AFuF++nVpOxTQmnTWhOYXASVh4ua9wPPTaAgy6pWyuXUN4MnUqoB3phN
	D0H47rJCU+S4u5Iha6pup/s+AL+GltzqNxf+8PC5qG6gM6afX1VfWpLF
X-Gm-Gg: AR+sD12QvignRiJIui4B4OZ+lfHNT/hBUZ7ypKim99nwVRpSygJC04bf+0EPVWTPaao
	nrTnOv6Lrhke4oWX95G5Pn9m7a+cW9DAP85YolBeac6Mt6U9T5x0eLkCp9eIE7JU4c0oZZfVe9a
	xPRxTaaIlA3hl4liTxY+PkX0ONee9c1FwYSprsNIkDbMxJDVJx5A0muYCR5ihKw3Utgx0fT9cMI
	MP5KVuAhMzo4vR8AiiF4wItkF4wHfg5Db+ujzrSff0Xwb9zfzrCg3jvDdBfP2Vs8ceEuO9hK2ri
	XfUYfLFRqYTJzk8vkjQ3oTCjJKbYHTETMprSye7KcCgGevriYDPAQVj7MYIT779Fb3OrHyQHzQ6
	27pFGYdzjSr48+jl5L7VOW3/mabySD5oEgW/waHEyOfM8IsNihpX2q25RUIm+Y29X3hqJGrhnUz
	7hjiBZw3lzHRIMLa7fU5LCPGo/hByAIqdxovt5EdfMpxPINbwcgUXxY8sAPb5X+4q5C1fCL+csa
	qy+RfBWMRwWNdG/XVU4XcNvi5WMfgVup0+GDwCFmX07RTpXN+ElEt6tq3NtlQ==
X-Received: by 2002:a05:600c:314f:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49b91c38bcfmr136182665e9.6.1787952248132;
        Fri, 28 Aug 2026 14:24:08 -0700 (PDT)
Received: from drago.hgw.local ([2a00:1d34:ebf3:5500:6828:ce36:77ad:ae8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm86367475e9.12.2026.08.28.14.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:24:07 -0700 (PDT)
From: Deniz Aydogan <denizaydogan1902@gmail.com>
To: lizhi.hou@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Deniz Aydogan <denizaydogan1902@gmail.com>
Subject: [PATCH] accel/amdxdna: fix double-free on mailbox channel stop
Date: Sat, 29 Aug 2026 00:24:05 +0300
Message-ID: <20260828212405.13124-1-denizaydogan1902@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mailbox_release_msg() frees the message with kfree() but does not
remove it from the xarray. The stop function uses two loops to walk
pending entries in cyclic order, but since released entries remain in
the xarray, overlapping ranges cause the same entry to be freed twice.

In particular, when next_msgid is 0 (the initial value after kzalloc),
xa_for_each_start() covers all entries from index 0 onward, and
xa_for_each_range() with max=(u32)(0 - 1) = U32_MAX also covers all
entries. Every pending message gets double-freed.

Use xa_for_each() to iterate all remaining entries exactly once.
At this point the IRQ is already freed and the workqueue is drained,
so traversal order does not matter.

Fixes: 3ba13f5e7180 ("Merge tag 'devicetree-fixes-for-7.3-1'")
Signed-off-by: Deniz Aydogan <denizaydogan1902@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index cc8865f4e..271617347 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -556,9 +556,7 @@ void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
 	drain_workqueue(mb_chann->work_q);
 
 	/* We can clean up and release resources */
-	xa_for_each_start(&mb_chann->chan_xa, msg_id, mb_msg, mb_chann->next_msgid)
-		mailbox_release_msg(mb_chann, mb_msg);
-	xa_for_each_range(&mb_chann->chan_xa, msg_id, mb_msg, 0, mb_chann->next_msgid - 1)
+	xa_for_each(&mb_chann->chan_xa, msg_id, mb_msg)
 		mailbox_release_msg(mb_chann, mb_msg);
 	xa_destroy(&mb_chann->chan_xa);
 
-- 
2.55.0


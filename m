Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE14A8A30
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361188; cv=none; b=E9zqr3OE61afuCb2j2DTKBlkq5qCK6MJz792qq8PrV17dNVxmn2j16wOr6975Ba/2qAouCIKoNbNFoyP7IJXnVOfhkL1bUnGSzQ2oopw3pDUi2A4QZnHOSsP4d6RDquwHXtUxSSp4ufu8fP6t33YXQUiUS4AdnKGkdN0QPhTzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361188; c=relaxed/simple;
	bh=3jk9MR+gg94VuaJqZwFitBFG7fXNnuN6p8vbOCicha4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BX6ZcxVy1F1kneoDdFvD8mpojPhSFhmkJACsq9gRnSQMz1ZBrRpLgK5z8fpMbY+yRigfLvFsBO6g767UGmqVpggEakFiRHnEePW2P75DRElzBOgxdqlSJtYIJqhl06wxzkM75y7fnIRKnvTHTKDA8sG6x28f7sUmc/ZwGPtmfDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJCIrPdx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJCIrPdx"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so978122a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361174; x=1788965974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Yp/oXL3p1lajPvtDy021s7SwzqfNxCxh9EVSkIB80c=;
        b=IJCIrPdxknZ11SJzJi+ju2Nqy0YMekTG8G3jkW4E77GiEAtZz9e1ghPvI35RM1dlnP
         llVFTWxq/w7N3OgwYUgpIU/XuwT4aElFCe5GEVrDpwyqmW+VcChzcvgkRnKEWiiQF4bG
         hwOEWsdv1Uw9JpXy9CH5smxupcM+PqhOzJHkeigANQ1+RpaYr6VSeLPflStpapCGBs1K
         6+FdDpy4qWk5Qnmcx2YHc43d1WnZhQGGEWig7mh6gv3GCmQ6p04LsaOwzeZmkJXCwbU/
         eu8aZ7sQIxp6Fm6/fGD4B5JZj2PmmCRbxE5lecdWs0N4DalxmfW9saq2ASrsRrn9sN6p
         tW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361174; x=1788965974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Yp/oXL3p1lajPvtDy021s7SwzqfNxCxh9EVSkIB80c=;
        b=gAxto5RfkpnIFI8SRfLgPuyhLUvD8lzvCq/OcyIAP2s3LzgZUmlaoCEOzHGCCkXIh3
         AtT13CAr07h8RqpQsgmInwRWmZPtDvmBZDZd43PM44XON6qyKbQZNJaCK9F2/Mx8k+6p
         4Gm8GL2uIK04Wnwvvxebpp89j01f/jTDdDZgeemLdKL95SFoNoeC6eyzeCLOHO7T4NYS
         K2ypJP8bLV/MRdz5e2Oj2ELj0b8iFHhojB9wEo+jLXFF9azIH60wFXMA3Tyl4PDH76zB
         kqS51VoYdMGn1E/wrFIUidqVrxjoEYzSSEsqxnYxgNqSpqqH2TqddGr/rNMEuARTKlAa
         Wl6w==
X-Forwarded-Encrypted: i=1; AKwUvBysgHB+7+CLTjcLzov7k/QhfDg1AtEze/ndiQ7ebRYDc3ObF/1Ee/+CmyT7W3ZsAfxbdlnMXyO8ouuCXpI=@vger.kernel.org
X-Gm-Message-State: AFuF++lhqrRiVIlBPYiMYoT/YJDj4vh04pkpKuT/YZE9QWEHNL8DTV8o
	sFKAal0liP38QsVDmRo9+ZQfaE8KBXy6+LRiumzRAAkFJFv7wJqPjO0t
X-Gm-Gg: AYBFou1nY4g8Z1IJK0xZ3AzOAGnf31YhsymKR6Q7S5T2VzQLy5ASaJIlwxChPsPvNGA
	J/AdgtT8/JCL121OKolnEuMegZcJoIIVYNbBwZ06Dkxa8QofFu9PJaT2CT1KMEfPvr0PIFacWC/
	NFufeuPvGja6Z0X7awEyHd5B/GGP+TLuHHW0Ics7sk7ESZNT/rcxaFZ1rdoloq+r1dh18u0JLQ2
	n9grVhyJcKmH4DN/bA9seIM+f3MrQ9hxPL+cuvTUeMyLzTxori4nZopkh9BijGUokl42FBh3dOB
	F16jAW0PXqCH/pgQKzxAORLLarjGa2kXy1Gp8TsQTWuQ3WMvfQIxned3jlYnWFAKpyTSBn/QMBc
	FphBUAZTOOnZU4xGUy4gbn2wMrBI1fFK59aQEh5P5VJOrb2UEnDgz6J8O5CwXTTanYgsrwWWcjO
	GfMvmhQ2s8NsypHtOFuAOyVksLYDBmDIsfLghzl5a7TAQmv7xGo3CKWf8OYVf1ZJs=
X-Received: by 2002:a17:90a:d44e:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39aee1bdb29mr8533173a91.25.1788361173832;
        Wed, 02 Sep 2026 07:59:33 -0700 (PDT)
Received: from adriano ([186.41.178.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bd6777sm7534895eec.25.2026.09.02.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:59:33 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	stable@vger.kernel.org,
	syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com
Subject: [PATCH v2] greybus: operation: fix out-of-bounds write in message allocation
Date: Wed,  2 Sep 2026 10:59:16 -0400
Message-ID: <20260902145916.63052-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The incoming message size from the device header (header.size) is
trusted without checking that it is at least the size of the message
header itself, but a value smaller than sizeof(struct gb_operation_msg_hdr)
underflows request_size in gb_operation_create_incoming(), wraps around
in gb_operation_message_alloc(), and results in a tiny buffer that is
then written past its end in gb_operation_message_init().

Reject undersized messages before parsing the message header.

Fixes: 87d208feb74f ("greybus: embed message buffer into message structure")
Reported-by: syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
Cc: stable@vger.kernel.org
Assisted-by: opencode:deepseek v4 pro
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
v2: point the Fixes tag at the proper commit (87d208feb74f), and add an
    Assisted-by tag.
 drivers/greybus/operation.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd..df6daee4fb 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1047,6 +1047,14 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev,
+				    "%s: malformed message 0x%04x of type 0x%02x received (%zu < %zu)\n",
+				    connection->name,
+				    le16_to_cpu(header.operation_id),
+				    header.type, msg_size, sizeof(header));
+		return;
+	}
 	if (size < msg_size) {
 		dev_err_ratelimited(dev,
 				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
-- 
2.51.0


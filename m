Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951399;
	b=gCf1dSTCrr0xJK4IE9tAvkcJCVnEYoNZwtj9aZ/sWDTUYfMEMVO8H66TKUEAWKkMDNRh
	 l6ABWt1PzZgk7nTxL36i35QgoVwjJV3lM03arighJgxcff+lIy060+rar8PkoRUI3GRxj
	 47C60LWbgDMYOi80/xx0tIm/O2fXy05I1xcS92QdYCBJ7aCslaWyDbSVBvQzant1AZSjs
	 hiCa4ndyDfY7Q5O4IQInTj/HELOHxoK+FHks3ZlhkEvSAyffNDVOTw170YW4lMZU/FYB6
	 cDGKPWRKWBtoWnb/X27H5xAX5bYHl3stC2tJehYiViP2fh9HA6V+MNce4Yz4pc/rcNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ndd2z9h6FBXADx73BjEu3vuxAgpxEryIlqHxJjGkw6o=;
	b=303Wzp+gsNznImpvJYieBS87FHg/BqIiMteM35UpwX8tqZIZNNDOGnAimy91Xl4fBp3M
	 uiRerKflz4K6Y9zGwKHZv/+LDuiX1MjFnRsquQDci5p6hFlolirENEy0vxg28cjPlNxuz
	 htm1Szj/RXMUC31yvwng8fmc+RJGKmvWp/ua/nvbZzAN8zoSz8Ue0ErQrzaREbKNlAIyV
	 nYBy9llzDHa9uClqTPFG1UadVAvjwgJ51fo9AdH1g/F61BAgjRDmhOx/9NxKX/AlNgws9
	 NFLFiKl3NNHts1IYnulnoqNYMOzJl9bEWXDiBuqyHnoI2EkFfve57eA3PLE7d9VzZnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XwDrlpVe;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB3606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XwDrlpVe
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4511066eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951398; x=1793556198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndd2z9h6FBXADx73BjEu3vuxAgpxEryIlqHxJjGkw6o=;
        b=XwDrlpVeB43MY9fAf4aYqMQWLkZAmA+PBgH/t+S8ZRIGESaJdG5o7xaC7O4YKu/I2a
         HRH5VzRKv8op4AgOmKRJwkN5P6Q6Omd6C1/ThXaOSuX3OHw7VJ0n96FxeZ57u1CEICnX
         fTV5osF6Njwd6PEDPHAZbodprXYdlOfrW+poIllW2DspZZDJzPl8LBmlA9n1ewX1NU1h
         DhqCF7tBZMJLE3pPyDcWD4G8TrEyx/qkqZl/YGGrjA8FvjetXouW6yGryelZWOGiM9He
         Q73uYa3Oak4IiJhZSAL2hZSDpaCncRT8PecOI3oJfeFg18mf2/Z9tGTZuSvUCdRax0fH
         3JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951398; x=1793556198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndd2z9h6FBXADx73BjEu3vuxAgpxEryIlqHxJjGkw6o=;
        b=hjIrDdonJCFREsnG0G9zLTd53hC3hHsnK7RGkscXUEGUFq/7/Oi+5vGPRyDQi6nBkL
         kjeWZK0O/sf3PxNGYNo4lHNADB+7xBRhtWdkEB/GoZxysRI1ErymtW3YG51cI3ABapod
         vdN5KYyKQtBkHArUb/qB/qKIpD2yAFzvpbTCGkk267bqRsW5CHKziEvlWTwPdQljgTgY
         M+MAKYHvros/j3jm58br4rtx0agyxe1JQY+QO+KKBt0lMxGsgxvBpMaZnB9CXWW8fI7h
         vjOsmXcoNYiT+QmEGrrLoELZqh+mdNcNLqW2Txx4NXiWKC4lTBK0mwyFYQIFY31jNzQr
         4GAA==
X-Forwarded-Encrypted: i=1; AKwUvBwfv7F+0Fv4439Nx8RQBWpDyIXpil9c9EdBQsVtEPoo3XEeXJSMG/ieNOitVn4Q/3EIizcEpNtJv2p7Mdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJosBfM1hB0/jzeszS+LZq5T1io1DFotvOc13FYt0Xxu+EFZ1TX
	ZoF6Qe2GuCVNJPbuBWkKPZEyvGFoLfblYstzsVJcYmEQrLa/VHjO+Eqm
X-Gm-Gg: AYBFou0mHk8gr6fkvJejBV4WGwAYrmEOWKdZHFyKhM5bWSnR0zRkIA1rCv/V121cPvS
	o8AmiQ/tPgwyv6Zq6EydrP7k7dTErEVEEqz3BN71bKuErOUkaNwiUdlmuzZ3alle5mRigkPPYkZ
	+Na9VAjzFOd6G5Q5UxWyrNz1LKNEa1LcdHsCpOu/SM4v08pqYCgL3nP7RTkqxTrAJWl5lu/Bf9y
	EHD0JIvBOH8T7+be2R5ZmxCev04968/8jfaj2/hWzaUfAhK7ZgqfDjYhN69xOHIOwcqmUtSh0vZ
	DuBmHvuswYGbvXhx+bUiE6ocZpHCcLAroqSEr789Y6ffFefA6mcNvUvR7yJ8dGU9M1z+X8+5Qhr
	pr+1zUw2nIX3skP218WPKGfKhoB2oNF2Xdxn+PpA1FwCZwLVqKexH/hIRkbr3LWtCnUdMWyj2T5
	ZCPDbojydB8CkLeYEwaQ9LsHKfJ3lPP+0N6zV0VHGjv1qW/tCmre/OME3tGcxWhgkzLzwbUEuvC
	21mBvkNACwYI5SXsP/sl9rKx11rOD9z5b21PqEQus0BqievTZSLYjL1J0cMeOboJ1Gw+cwPBvFf
	3JhCDgMmhbkyW/Nkq84=
X-Received: by 2002:a05:693c:881b:20b0:36a:10d:afab with SMTP id 5a478bee46e88-36a010db09fmr715356eec.25.1792951398190;
        Sun, 25 Oct 2026 11:03:18 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm18543367eec.20.2026.10.25.11.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:17 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH] NFS: clamp WRITE reply count to the requested count
Date: Sun, 25 Oct 2026 11:03:11 -0700
Message-Id: <20261025180311.349348-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

nfs_writeback_update_inode() uses the server's WRITE reply count for the
size update before nfs_writeback_result() compares it with the request.
That comparison only rejects a smaller count, so a server can return a
count larger than the request, make nfs_writeback_check_extend() set
fattr->size beyond the requested extent, and grow the client inode's
i_size.

Clamp the reply count to args.count before the size update.  This keeps
the attribute barrier and completion accounting within the write the
client actually issued.

The inflation was reproduced 3/3 times with a fake NFSv4.0 server that
answered a 1-byte WRITE with count 0x40000000; with this clamp the
client keeps i_size at 1.  A reply with the requested count still gives
i_size=1.

Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/nfs/write.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 623e7ef..0dbcaeb 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -1467,6 +1467,13 @@ void nfs_writeback_update_inode(struct nfs_pgio_header *hdr)
 	struct nfs_fattr *fattr = &hdr->fattr;
 	struct inode *inode = hdr->inode;
 
+	/*
+	 * A server may report more bytes than the request asked for.  Do not
+	 * let that count extend the inode size or the attribute barrier.
+	 */
+	if (hdr->res.count > hdr->args.count)
+		hdr->res.count = hdr->args.count;
+
 	if (nfs_have_delegated_mtime(inode)) {
 		spin_lock(&inode->i_lock);
 		nfs_set_cache_invalid(inode, NFS_INO_INVALID_BLOCKS);
-- 
2.34.1


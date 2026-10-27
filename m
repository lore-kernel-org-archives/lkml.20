Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112064;
	b=T5X5GXnVHDOtgqTl0zj+jby4XBelX6t4SX+OBFhVwnahQjx0OllZq14Z5ZI35hXRWKcj
	 YWpIwXTBDUe1Ep5TDOfEZdqOKT81TzcYrk1aI/gCEGdOp009sd7z709w6dwTZWOcH/4Ma
	 u1lgUZCoDv/Q82wzOBARZX9Vp/WZ0DgCfLSHWvCNPHUWzwe+IBJn9TEuZbaDqIXiNhwi0
	 Swa/58k6snWPKFl7YeFYt8UWXVP5bHv5OllAK/8IhXCes1rv2AmNRVXaWinMp/eJWDJY5
	 ee9yRTY8/YCLNnErIsikQUFSYZGbef7h5ReJzd8BS5XWc9O7nw+RSLJQlNSegivDetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112064;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9u8QcnHucMh4QKEgJye1fTZXayugk1P9hC6VtHiW434=;
	b=OoIQvNYludaiQCp6v3SfBbilgB08IFXHlOJeOWcFX36tJDR/TY5p6X9ZOiMF3PiyrXoI
	 /YL+ODqTA/FywsW2W2+Tr29cZC8Cd/g8vz+QG1XUcbvt0u9bMQzb8wVRdlosGQN7wDFnk
	 VriapQkoKgXsWWUXdSu9Y/3szt3NSM8P6y8ZInyW8ZZCVxDh46XdGMjO7kC8G2CRAE05F
	 Wx3AJ6djX0gAG1HpOmC0hbvUImF5NnV9+Y3aI6DL6B82QT4J1Iwd4BgImAZTP4wLhWWXl
	 XgxMIQE6UqpFOGVytORyAETE6sDZCFXTnQu3t01MtoHlw5C+780kCR7z9OSEGmaxK/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="o4T6El/N";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52E606A33E;
	Tue, 27 Oct 2026 14:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o4T6El/N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369031F01828;
	Tue, 27 Oct 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112063;
	bh=9u8QcnHucMh4QKEgJye1fTZXayugk1P9hC6VtHiW434=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=o4T6El/NjzrnWOxPrk+sH/U1h9K6QptJkY5tyZD8r/HLT2oFpCNSeMtm/k8tCquFO
	 xXsxT6DZbBI0Dd2qkq5LfnYXX1409X34PVrf/mD7nurIPwtBigRpL8cXDzc4LtbUeH
	 ZgTmNW1G/kedjU3JJBEAINSokla6/c/q/vgpi9L4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:40:47 +0100
Subject: [PATCH 4/7] usb: storage: ene_ub6250: bound the disabled block
 walk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-usb-storage-v1-4-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2614;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=t56kY0GafRf8q60P9/la5NHf8vuxPkqG4zSOsmMc+Hs=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtn+q/fe9qr4qbNq7fzy158NWLWrNO/H462aLO5syn
 e6+Cjj0pyOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmouDPME8t/Mj07q2Tgy+k
 Ci35e+LgTVGj588YFvRe8tJ8wjzpjWKpw/Jfls+kAloF3wMA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

When two physical blocks of a Memory Stick both claim logical block 0,
which happens after an interrupted update of that block or on a crafted
card, the ENE UB6250 driver can spin forever in the usb-storage thread
while reading through 64KiB past a 512-byte buffer, over and over.

ms_lib_check_disableblock() reads page 1 of the boot block, which holds
the disabled block table: big-endian 16-bit block numbers terminated by
0xffff, the same table ms_lib_process_bootblock() parses with
be16_to_cpu() on 16-bit entries.  The walk, however, indexes the buffer
as unsigned char and has no upper bound:

    blk = be16_to_cpu(PageBuf[index]);
    if (blk == MS_LB_NOT_USED)
            break;

A byte converted this way can never equal 0xffff, so the loop only ends
if some byte happens to match Log2PhyMap[0].  Otherwise the u16 index
runs through the 64KiB following the kmalloc()ed page and wraps around,
forever.

The bug was found by code inspection and has not been reproduced.

Fix by walking the table as 16-bit big-endian entries and stopping at
the end of the page.

Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr to drivers/usb/storage/ene_ub6250.c")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/storage/ene_ub6250.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index bce593730187..e282ca9b5e16 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -1210,9 +1210,9 @@ static int ms_read_eraseblock(struct us_data *us, u32 PhyBlockAddr)
 
 static int ms_lib_check_disableblock(struct us_data *us, u16 PhyBlock)
 {
-	unsigned char *PageBuf = NULL;
+	__be16 *PageBuf = NULL;
 	u16 result = MS_STATUS_SUCCESS;
-	u16 blk, index = 0;
+	u16 blk, index;
 	struct ms_lib_type_extdat extdat;
 	struct ene_ub6250_info *info = (struct ene_ub6250_info *) us->extra;
 
@@ -1223,7 +1223,7 @@ static int ms_lib_check_disableblock(struct us_data *us, u16 PhyBlock)
 	}
 
 	ms_read_readpage(us, PhyBlock, 1, (u32 *)PageBuf, &extdat);
-	do {
+	for (index = 0; index < MS_BYTES_PER_PAGE / sizeof(*PageBuf); index++) {
 		blk = be16_to_cpu(PageBuf[index]);
 		if (blk == MS_LB_NOT_USED)
 			break;
@@ -1231,8 +1231,7 @@ static int ms_lib_check_disableblock(struct us_data *us, u16 PhyBlock)
 			result = MS_ERROR_FLASH_READ;
 			break;
 		}
-		index++;
-	} while (1);
+	}
 
 exit:
 	kfree(PageBuf);

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112069;
	b=DgswCvh/9Q5pgjhaY2krVyxadpAUGRLRcAIZmgdx/6Up7tb6iJ5UWTj/dj6PNisg28mH
	 UZoNQAE2Nm6cVQY96vlLXiX1JS7MhEYws9syZ94yLqZrZgFa+UZJzBBT24HYuxELcdR/Q
	 ZF8fNjiY1i5pvaZwaFlvCcJ/Lv3fSqZlzUG7S4MlJ67K31JRsE8VQTLPza5aiu1xj/k0Q
	 dYiJ+u0ILvLWYKLHJ7bpB0T3Aovny2YjnOQWjIwTYZU9QQ8zuNDTXv4plmFSYqYpSBpd2
	 A84oeWNIJ6S7mBgFUmYLFOAijjiQwSauXkCt1ESrqWi6q4PdN79teJQ0ZRVn3BzUnzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112069;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cFM+g1SiyPDumjwZqbBa+enhuUcW8n1bsZiLDhvDE10=;
	b=JCzCZnVI7hqu85C9ZIaHJknpgXf8pYjhTpvJ6Q/dVoXqlypkpUIzFGhOX0Rm3SxdDIkj
	 gBGZu3kzLyrh77/Q3J8qfHSJkG0QMAmBsFtekHBg0frl2hW3xjT8nyREKt8pQ9ip5S7Zk
	 22CeXTvP8GjdpuXRTJOPGg8RTpF3n8ASUKs7RIfdZWgOtPYmNqhq1AtZ/ROZgYbD+rydE
	 V9S8PBpVGNj7STJIvbpg3x3HNQl599Fa/8iMHjmy1bKHQ9iA3GLA1rmJLLvHXnAvxuU24
	 bBjOI7YQ+l21RpqySf5cdop0fRU2yzHa2WPXu9UCCW0R0h7H0oHpQYdYS9Ts1YaohwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lPOyHBlK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993FA60A3807;
	Tue, 27 Oct 2026 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lPOyHBlK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5B11F031E9;
	Tue, 27 Oct 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112069;
	bh=cFM+g1SiyPDumjwZqbBa+enhuUcW8n1bsZiLDhvDE10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lPOyHBlK98vaZ16+KAWlGToYkVzDHDTe7njGwNW1F7so3RuMuTW7mlEtRuvFqzblz
	 Z43udJZot2cV9YXBV+A/NzgANH3cMZIm0U+5g+cNwh6yH9wwE+gEpt1tKCqWlBkuwq
	 ecqavdiEO8Jn4JuybeLFcf2DWluxhyRi8sgYzwUQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:40:49 +0100
Subject: [PATCH 6/7] usb: storage: shuttle_usbat: fix READ CD divide by
 zero
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
Message-Id: <20261027-llm-usb-storage-v1-6-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=6gMRfuTxgw3LkZ5DJDio+vffqefSa7yvQeuF7YQGea8=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtn+e1qOzqqhb/cViva+qhRe+F/RkSbUeZX5YcyDhZ
 f3vvCPXOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiWrsZFkziWPxh9bVmub05
 hbZiT0rbjPT6JjDMFbsq9C/EJvj9E5eiy15Bk6at09TcDAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

A READ CD command of 64KiB or more with a zero transfer length, which
any user who can open the CD device node may send with SG_IO, oopses
the kernel with a divide error on an HP 8200e CD-RW behind a USBAT
bridge.

usbat_hp8200e_handle_read10() splits large reads into chunks of whole
sectors and, for READ CD, derives the sector size from the transfer
length taken from the CDB:

    srb->transfersize = scsi_bufflen(srb)/len;

Nothing guarantees that this length is non-zero.  The code right after
it already falls back to a 2048-byte guess when transfersize is 0.

The bug was found by code inspection and has not been reproduced.

Fix by only dividing by a non-zero transfer length and otherwise
leaving transfersize at 0 so that the existing fallback applies.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/storage/shuttle_usbat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
index 7e5424268c73..a1b64b10bbe0 100644
--- a/drivers/usb/storage/shuttle_usbat.c
+++ b/drivers/usb/storage/shuttle_usbat.c
@@ -1325,7 +1325,7 @@ static int usbat_hp8200e_handle_read10(struct us_data *us,
 		len <<= 16;
 		len |= data[7+7];
 		usb_stor_dbg(us, "GPCMD_READ_CD: len %d\n", len);
-		srb->transfersize = scsi_bufflen(srb)/len;
+		srb->transfersize = len ? scsi_bufflen(srb) / len : 0;
 	}
 
 	if (!srb->transfersize)  {

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112055;
	b=BZ08VnsVEgBHdUice50N5Ny8vaJRlmIzm4pMThWMNGsAKHR7IOCVoeOG67pfvYessZc5
	 441LbxZfMei3259kAX9WxyzofzJ6rLTVS7HyP6lBONc/6K+nasMms1KozRACOq5MpSRPY
	 Ih0z8aNMFFX38E60eu1s0wn6siuztkTCffqvkVfGYazotzQXiJ2KRQSdg3elptQ7+MKJy
	 toSpf4ObvWIXWatmf8JmTMzI1p/0OLfiTYKpHHxvu0cYEvN5AqqemYgkRjWuTurdCURye
	 b1ww6589PSTOcETR4I3lhUTs/xvDY5MMW/Yz1FnkNrVWot1f2HHQ496kgNcQFfvFxow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112055;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tWV+n38NPmzuNbkdGpvOIpv6BLZP2NlcEarfp1bLPOA=;
	b=lmvqLHq9mGsxqwey34OpjC3J90euFnviz+sh1cM/sh03LxDL6iLWu+u8r1RkI2bFsp7p
	 Ssxr8+IA0lNyKcl4YcjPmXFlI2oLDjLNOyX17a9QyJvk7dgKJXgsGQB4U/p+d3Fq+qQ/L
	 Tb+BptCXmh8JB7YRPXnEMIKtFHo0o/2TIA4rfiMkAVk06n/IS4KE0s6goZPn8mCVvlBGd
	 o5HEjQKKKA7q/kNDkLgY97HO+aHgd807hhLnSCgSHiTmmJ9EzZuc+Qp3kgF9qoY9OSVOA
	 e8SEthO9KPbWHkJAfkJQcYjQMoJMliUjXiFmyhjE/3qFqgkBO7FdoqZDnziUNiYkstA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EwK9gHRG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19A5606A31D;
	Tue, 27 Oct 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EwK9gHRG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56B71F01828;
	Tue, 27 Oct 2026 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112055;
	bh=tWV+n38NPmzuNbkdGpvOIpv6BLZP2NlcEarfp1bLPOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EwK9gHRGz8nFHC3Gu/DiKQhN0hvgggInZWtzW1RnsWdPwOkcqbmVBxtYN92D/Be2B
	 n/o5qB7TcvgMBHi2xLf/yTzKZ8EBsxbyt15sibdQzVrgD5mO1JHbNNmpnpY5ehjtMN
	 u/6f/r+Y6HEkbAWh5a9CWQ8rrerw/P/xTS49Ox/g=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:40:44 +0100
Subject: [PATCH 1/7] usb: storage: ene_ub6250: fail MS init on card errors
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
Message-Id: <20261027-llm-usb-storage-v1-1-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=oN5hI8pmZBRHVu9pggij26+NO2nPSqoodzFsZ4g2NeU=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtn9SZHnC3P95W1fNX2P/9DXi26Yt5BO+dvCW7MckU
 5UtxlPYO2JYGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAizNoMMy5vPKFcOivr/OQJ
 6bxv925RVFmwgGHBwT267pbt15y3zDfdpWEwS/3U0UUMAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

Inserting a Memory Stick that has no usable boot block, for example a
blank or damaged card, into an ENE UB6250 reader oopses the kernel with
a divide error on the first READ(10).

ene_ms_init() ignores the return value of ms_card_init().  When
ms_card_init() finds no boot block it returns MS_STATUS_ERROR after
ms_lib_free_allocatedarea() has cleared the card geometry and freed the
logical maps, but MS_Status keeps the MS_Ready bit the reader reported,
so ene_transport() goes on to dispatch commands to ms_scsi_irp().  The
first READ(10) from the partition scan then reaches ms_scsi_read():

    logblk  = (u16)(bn / info->MS_Lib.PagesPerBlock);

with PagesPerBlock == 0.  With a non-zero PagesPerBlock the same path
would dereference the freed (NULL) Log2PhyMap instead.

The bug was found by code inspection and has not been reproduced.

Fix by clearing MS_Ready and returning USB_STOR_TRANSPORT_ERROR from
ene_ms_init() when ms_card_init() fails, as is already done when the
reader reports that the card is not ready.

Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr to drivers/usb/storage/ene_ub6250.c")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/storage/ene_ub6250.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index a9358e04ab4b..49276ac79402 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -2110,8 +2110,9 @@ static int ene_ms_init(struct us_data *us)
 			MSP_BlockSize      = (bbuf[6] << 8) | bbuf[7];
 			MSP_UserAreaBlocks = (bbuf[10] << 8) | bbuf[11];
 			info->MSP_TotalBlock = MSP_BlockSize * MSP_UserAreaBlocks;
-		} else {
-			ms_card_init(us); /* Card is MS (to ms.c)*/
+		} else if (ms_card_init(us)) { /* Card is MS (to ms.c)*/
+			info->MS_Status &= ~MS_Ready;
+			return USB_STOR_TRANSPORT_ERROR;
 		}
 		usb_stor_dbg(us, "MS Init Code OK !!\n");
 	} else {

-- 
2.56.0


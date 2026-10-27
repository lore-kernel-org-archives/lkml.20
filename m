Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112073;
	b=ZWbGP/nvYFqwGxKerw2fbzuJdx6qBNa8GAiAelMDm237UlpD6xRfSEba5d5sVvporB8W
	 mWzLZXRkENt7dujQH1cjhE6WTIoZzyPK/Ujicr41P/jQVkDQLx7Ougw6/9sRFd9CjIZz5
	 jF92h/jKfEE6/abr4hLyqVljvulqywBD14WPGftiF0nDz8AwMyEk535VXTQzR6ox4kCvn
	 I7XUwdfujhHGifjfitVQ/cj4WTPb1R/i8qdchZVKT4Ln4JecWxmBjG3YuN/+AG3grm/bh
	 ShL7+rzhO1LDGDYsEV/QZpvmYTReQPb1mQygHzGDDGTA7LLZTvcZfD+EXCrDjXmHZ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112073;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=X+RmFDAROVwZkCrlpwtzrOtzD2qONhEja5LPD9eYkeo=;
	b=UB+aLoOCWAoXUVQjKPHX9dIIS9lH+mS0epd9yUvQpjIpO6SJImg7C6vqdpFdm8HIM4Ax
	 0Vd7/uH8et3mTYOegIU5ocvaT8kBevH9I3KheggKl5P2XZNx2Ni48ud6sOvko+UrP1mar
	 O/petjBSM54xxufPhlmCoOdgBEsvO3BZ3PeJAFbExs9Yjd9KG/qVYyK3Ym3gujCpHmbVb
	 tTnuLj3rTHp+Sm243HhC2zKYijfhVQ+mq1c+ZxIS7BWot6saG+MOmH+HHnmZTPF595Ou1
	 T9rZnNF1NdaZmzqgovu+jo461jro/zrBODudrL7Axm+/kHmWumO3zHhT826zE7GZ2Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ygwiIoaF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2BD60A3825;
	Tue, 27 Oct 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ygwiIoaF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E1B1F01825;
	Tue, 27 Oct 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793112072;
	bh=X+RmFDAROVwZkCrlpwtzrOtzD2qONhEja5LPD9eYkeo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ygwiIoaF0B9BffvezFoEZ0tODZikuJhT38QtFi954SQ71aMSdsSWtl63JStL9hb5J
	 o0nK/71ZaT6BuLM74zFjQpTJn3Ab5Ahd/wvRBAMA26NXMU3BM4h5rd7H1fvP2AUXfA
	 bKMzXKTySwk1Rv8nd9SAKzdrlXAu+YP5V6IuJx3M=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:40:50 +0100
Subject: [PATCH 7/7] usb: storage: shuttle_usbat: bound the READ chunk size
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
Message-Id: <20261027-llm-usb-storage-v1-7-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 "Cho, Yu-Chen" <acho@novell.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=XM8sIjIJM3MqrlqwHsq68IlQmKmB1uDm0jm58HuLutA=;
 b=kA0DAAIRMUfUDdst+ykByyZiAGrgt/OhYrevAjAj/oSeyPw8HyEcRxkzhrgUf3E34FhiO8+B6
 IhdBAARAgAdFiEE9LYMxb94wiFKMT3LMUfUDdst+ykFAmrgt/MACgkQMUfUDdst+yndbQCeP3Kv
 rHP+FYWGGtBGXc5ULL7rrWAAn32SrbQ9GrltykawEC9wRtnUjBjl
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

An SG_IO READ(10) of 64KiB or more to an HP 8200e CD-RW behind a USBAT
bridge never makes progress: the usb-storage thread keeps issuing
zero-length reads until the SCSI command times out and is aborted.

usbat_hp8200e_handle_read10() splits reads of 64KiB or more into chunks
of whole sectors, using srb->transfersize as the sector size:

    len = (65535/srb->transfersize) * srb->transfersize;

For passthrough requests scsi_setup_scsi_cmnd() sets transfersize to
the whole request size, and the READ CD path can likewise compute a
value above 65535, so len becomes 0.  The loop then sends commands with
a zero length and adds 0 to the transferred count on every pass.

The bug was found by code inspection and has not been reproduced.

Fix by falling back to the existing 2048-byte sector size guess when
transfersize is larger than the maximum read size, so that every chunk
holds at least one sector.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/storage/shuttle_usbat.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
index a1b64b10bbe0..080799029643 100644
--- a/drivers/usb/storage/shuttle_usbat.c
+++ b/drivers/usb/storage/shuttle_usbat.c
@@ -1328,7 +1328,12 @@ static int usbat_hp8200e_handle_read10(struct us_data *us,
 		srb->transfersize = len ? scsi_bufflen(srb) / len : 0;
 	}
 
-	if (!srb->transfersize)  {
+	/*
+	 * Passthrough requests set transfersize to the whole request size,
+	 * which can exceed the 64k-1 maximum read and leave no whole sector
+	 * to read per chunk.
+	 */
+	if (!srb->transfersize || srb->transfersize > 65535) {
 		srb->transfersize = 2048; /* A guess */
 		usb_stor_dbg(us, "transfersize 0, forcing %d\n",
 			     srb->transfersize);

-- 
2.56.0


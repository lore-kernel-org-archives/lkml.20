Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237822;
	b=XRFvfx0MhcbiXfeUlLs/gAcVCNFV6Jafr9ixMXYyBJFd4H35Iu+WMJaNM694QIPih7XI
	 CexTm5Xa/Xc7h+iHBOxfbQsIolkrstHtyne7G7VCK1HKOqPIRBZT4okeQBXUfBROnbmS7
	 BGrgOoPuhBMh+Xr4eOtj7BEls5nsa+fkQ/LIt6wIARMY/sYsvy/f19g7u9RVgWizwz7QV
	 fFAl1Zz/TvglIknPAzb2HNg7Nf4sD15GS5wT0fbkrI0vtF6MIpDdEdxHcuUyV6N5427aN
	 v1PSltQ8oLUeO/Dn7OxH3yfTuY7felb73naIn7DIn4zsQWn4aL0EXqo8l09EWM/c4zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ua8SQNKQwB97ZvUclO9jwABs5jUpf1CScj/ICI+TFtE=;
	b=n6D3lNxTEmzVt56v2UMd8S58dLaeXv2vKpK98aXlYFbQCbhXYC01sfAmS9d4NCfClZ5V
	 hnSQ86AyQvI3s5VGAH2xZdZtBXJ1d3eptFv3PuMhkpDsn+WM0NzVswGYDG6l94HT82+hd
	 o25+OxWqYnAwWLKE9yLEjuxDzMlv2lLWgsRg0fvnM0w9lo1UPcKGQKlBJ3lyGr4hKVqjV
	 fT17TJofntynpTWz7FyhQboFtebVjURW1UtfEeZ8yCFKcSFmT7D8DjmfY8SgbBCJoTpmg
	 6h2RWsucDxd2LYTNI56D5m9zVNhcOBv+ZPJEvW/thaZZiR3jKKeMjO42SB9VL7aTpfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljxymD1y;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06614606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06614606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljxymD1y
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so669357eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237821; x=1793842621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ua8SQNKQwB97ZvUclO9jwABs5jUpf1CScj/ICI+TFtE=;
        b=ljxymD1yStlqh6UJL44Vm0LIUAMqUQpeczGCuSfhhUREG/090EFtuULUqgQiIdCFuu
         ToXBRnPYvGky+gOlk5Tal9qXHxc2c5UqR1KadnWFLM8wDtF+h0JrvmIy5Si9OHBB0rrl
         /nkw4c17Ev85zYKOCFzG1zb11MEEGSWHYI2AS97XieBeQGh1GyYtgnf3x4L5iW4r2odG
         vgPdbUhBdKVqthVCAj/Xh1l3Z8EJnwFBsYHXR5ztEDYDfl19SGNxmYUtvQNHM9MkBKlV
         3IaiHtu8nNUaAacdik4p/w04P2JPhnI1hhmq974BDKcZ7qx2OvOaNrQS3Ce37KPbp2/K
         eDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237821; x=1793842621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ua8SQNKQwB97ZvUclO9jwABs5jUpf1CScj/ICI+TFtE=;
        b=jwKfvWg2KVEA7TXKf04+4YHOyFZHQRTRz8B6i0+gpCoImqp48Rybmm1FJyUR8H3YVs
         PLf2fP0qjqGTPjEt41NfIZMPY/mT/kmEo3+RW/2iiAk/xAnr/zpQB0iPX6ezN6mXL27B
         XBOcHhpPfHA1C3YWcpxkalmURl1JYzJTX4bQtYbtOzLGK76WshOZilbYdGwLCFNH4hBU
         v/p0Ro3UnwTEjjraJMtzZHbemqoNwuV5xrsVRE5qtxew6CggYjZmqd4TSwf5gsFgod9S
         Nj7kuAWCwgLGZPQhOpCrwd2HD93WZm5ARYle9UdZuug/CzaGrwdENnrtliWyKf93C8wi
         0sAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXgRy0486vdYLTxTQYUUOX46Gqgy6eazNjQifrf5YXlZVIfN3zSxzrTY2nuSudtoyjMAUs7lzmNp7LsYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhkKf5Uql4wHHkIPw5YIaWDq/E50Xe3E+LOGvR7zX9XtN/H9IG
	K9ilVliqVl86dYyVTHJD7eRsHlNQsVSZYOpMfhTa58ZxkCCW9AuQ6B5H
X-Gm-Gg: AYBFou31QWh4w7fdoCQ6vplgjhqwwk5V99r9j/m1t4im2R9RZYKPGVEYZgBx9tO0REF
	H8hWy1aeIYDsBDxiv0NlCbXfMGn+9tkIC7emGpbPBVRGc8oD4cUIr/kFML40QQo6xPZJLiNYPL0
	dmgR3GT6x8rPYHWtHU7IMOvpVZ/hARl07klLsh0SwtgzPwBBCK1UTVTBB9YFXHDbEQME9L0TajK
	dwj9VSZP24n8dadaICFTTpXU+PqhV+/gMUir6KSTpcHB+qPZ64vxlh9bcBVU8OPUwe9uyWHvsxm
	0ptDVJRcRoU7leA0xP5T6Idkb91QcV2lw7V/oi9YivT+JCh7DBZZOn6QQVg7FOuwhKyNwLSApYf
	B7hZyJyJeYAN5gCyccqzqSZX4mcmGXBTLP/IgwDZdJ2KYVbYJqdrM9xaFkrgymDozpKYipUzrPK
	erYIlt0w9wJW6B1Lls1Yp9Xz/9VqyZIPO94TcXtkbuWNoDXFxn95a86n1BC8sXfCf31D77ejKOm
	VriWpgI9V+z90w0wQ4DDm92i6rqjW6z3kDZ7mrA87eWA5T4u3X6ijjedBcPa1OgBYjLR9DoK4mX
	zWrDCuJQWO69DaYhGUpsRuqm9Whyjb6TAKawV84C6kg4pqegKigP2GGk
X-Received: by 2002:a05:7301:4d02:b0:369:a113:756f with SMTP id 5a478bee46e88-36a2046736emr5333281eec.34.1793237820781;
        Wed, 28 Oct 2026 18:37:00 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239198c9sm11307097eec.15.2026.10.28.18.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:37:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jack@suse.com
Cc: ritesh.list@gmail.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] ext2: preserve IOMAP_F_DIRTY for extending direct writes
Date: Thu, 29 Oct 2026 01:36:16 +0000
Message-ID: <20261029013616.97194-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ext2_iomap_begin() sets IOMAP_F_DIRTY for writes that may extend i_size,
but clears the flag after ext2_get_blocks(). When the write uses an
existing mapped block, iomap can then use FUA and skip
generic_write_sync(), even though ext2_dio_write_end_io() updates the
inode size. An O_DSYNC write can therefore return without persisting
the new size.

For example, on a FUA-capable device, a 512-byte O_DIRECT|O_DSYNC write
at offset 512 into a fsynced one-byte file returns successfully and
extends the in-memory size to 1024, while an immediate read of the
on-disk inode still shows size 1. An explicit fsync persists the new
size.

Initialize iomap->flags before setting IOMAP_F_DIRTY so that the flag
survives and the required metadata synchronization takes place.

Fixes: fb5de4358e1a ("ext2: Move direct-io to use iomap")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ext2/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 12ac4cfe1500..ba23cadb157b 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -805,6 +805,7 @@ static int ext2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	    (first_block << blkbits) < i_size_read(inode))
 		create = 0;
 
+	iomap->flags = 0;
 	/*
 	 * Writes that span EOF might trigger an IO size update on completion,
 	 * so consider them to be dirty for the purposes of O_DSYNC even if
@@ -818,7 +819,6 @@ static int ext2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (ret < 0)
 		return ret;
 
-	iomap->flags = 0;
 	iomap->offset = (u64)first_block << blkbits;
 	iomap->bdev = inode->i_sb->s_bdev;
 
-- 
2.43.0


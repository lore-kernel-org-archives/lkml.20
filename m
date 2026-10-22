Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712187;
	b=Xksj8I4oakJ550ecYp2lJkjTgohG4DnR59vy2QjDCA7Nzv2T4X2IfazYF/ToIqKU0yJI
	 /zxn77uLHZb3utp57Ckg+d9uzvcEPAjn6I6s1eAyvyLi9KeLBlTxc7vPp3sz3OLRgZKmO
	 HqUdhKRyBJfM/YacUk39nqbsQsk3OeNHbINCrkC3/GmKFf6sojYFJuN/EtpWQnbSqL6y9
	 HraE5MCxwyMFcKI9qUbd/fY+o4afpgtNRCxhRo0Uz1DmwrYhjSW4s08Y8gkJRxlMY8+lX
	 a1J//wnaS+Uzw5sjaup4+K8OP+re/aS7Ev3/f1vqbb2N6zZcHT+1rWx5z8rorYeiv7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nvdfVuToSAZdod65xO+90U5ZDL3fvzNu7MzlLs0W0tM=;
	b=Si0TL9f44NSN4Y62SdXeGwsRGZFD8pFWSMnVh3McrE/3VCRF3I8VVt9EGnIPmGZQp83q
	 9YeEUkA+Hv8Z4Ns6Id4vMGo4xty5/HYJeyUQQUo8W5cpSl6wkFz75zBgnLU1RaWMInphe
	 batqbNCvmntOVRs7KGgmVH24d+pJcS3vq6Xo1SPQCCjQWMB3UVK08jumvs5Quf0k5r9gH
	 tfFKF679ovtJrBnjbHukjT3IOKOgNYukkxEwXnLsAeZCQh1rX/P/zn3ie+YaH3U8GlKcY
	 IPRfZlVNjG8EL8KDOoxKEQ5Ua9ZSIsI0W+M0bXxZSerpCB1wHqrEnnBMSHhHmi79dnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=DkZw7K6S;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48D606A767
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F48D606A767
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=DkZw7K6S
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-676858d42f8so385956d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1792712186; x=1793316986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvdfVuToSAZdod65xO+90U5ZDL3fvzNu7MzlLs0W0tM=;
        b=DkZw7K6STYpK6hhebddOkVHapUhiblEMbumQZ47zkiyi1+yZ1C6GuilD/IeC5ObHC5
         c2r+bf8ARLQMqGpVTjbx8RaQbdp3r1Y/g/dxJOLoTp3yE5+4wNk0ewjA75n6AxVqBQCx
         zg0DmM9ALGmwO6NPXvwMXP5eVqtI35MLojF+Zr/7POXv0OkVxYZQw9vpNuUYT6qGt9g0
         yY+/NEHUusQhMDg9lbycnExzk1xKUTu92qfCw7U8KTAkqOshyYrrVSD91hkb1LeLQkBJ
         ZSJ8BUo6MRsemkgL5V3MV1lg2xwtmVR2vmbIeYvNRGBUabtjtJWOtSjJIqFxtZrISBQb
         uvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712186; x=1793316986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvdfVuToSAZdod65xO+90U5ZDL3fvzNu7MzlLs0W0tM=;
        b=MzupRTK+FQuyGNwIuLaLyJHN3V8L9oc4CBx+8ABc80dEQtrnQG5ak4FSUpXs7CaoL2
         oQ4oaH1uiBhywJNfFb+NFx0y2EDflmOQoSYHyXcSNuwXDd8k/vikoWbduItnmS+KBRov
         B6I4/k2bFIEOuzHrQT56utGYUhqe2kCcA4idzhCI914JmFF/0HLh4CpVlu917qT/etgm
         vkrpczYBnxZFCymZ1RuddQH6jL/QFv5iE8kNGT6zUJEgIYYjcquI5N4wnbsE9agp+v12
         GjIinKnBq0a2x0MJwfsRMygIof50ZNYtob2r8xNAK5gl/KFDpcOuy2m4p6HiDUGfsYnO
         INEQ==
X-Forwarded-Encrypted: i=1; AKwUvByvBuFsAn/WO7qY8xrnDqRSbFLQICbO9FvhEugHSfJVyELMMyNQpGm5AQJw0eXmfgP/QwRGZZbKzo5uAKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvSxKmhJ8ls3Krz+i2evwkODCd4EIu1F9ARL6DOse/lEWs6DyM
	e5auEH2RaGCOshJTGDPI9mkj0GYcW03WWfSCdZ429rPhWvHt63OqaesUpBJNceO3IoM=
X-Gm-Gg: AYBFou0DleDrjf7y/decAB7lK7oL5iE7SugGLnKEBlaU4WsxkFH2ZBvTjUk9VARtfdH
	CZueFhkdKFMZa08UTQu+pfiFd+XT5vAeWR784zElsJ4KdTkF4NT/E0dxJoMOW7Q+6oMNW3FUEeQ
	a1Dvq9CG3JvdyMquqazrU+dsf7KmXxR2qxh0Txmb+GiG+QxrZfX+nKrHhLcN6WlJO0xQrDPhLsC
	RJoWbUTRioi25FU+6ZtCSXRgdcohHwmluBfAS0tr56zezEF82Mg1m5HUG+PDwvfK1IfgT/ME8ac
	3TwkF+FwuK41JBoD/rYF2NbNvY07oSjAApUyt0DQHe6G3zq5u3f34y5ya+KyJ+0FK6d0z8qaoXs
	fV9MayFH72VPzM92tTumuWHcXtV6qvyw7OUy+mJ2DtP7DweYhXW3/aEzQg2qqy8uWoiAg5g8mwS
	t3S8mx7X1IPurBtNq9QNVjNcKCtH94FTSYbfSQMRpsPOSncze73PIOdUbuQ1cxJN7OK/IqviutN
	CHKtLgppRwwXyHu9ck6cni4xG89FkJMac+JCtN2NHDib/MZM0BP6efiHHc1Fsqi5VW3sQQswvzw
	Kae6Jpg2hCQU+64zJiL3iADbsOEJVQ11eoYN+GMgD4wnvdwdzo/thLS7foV6Ym0i0JkJaharrGo
	oTxM+/J+pnA==
X-Received: by 2002:a05:690e:1201:b0:679:b810:6e03 with SMTP id 956f58d0204a3-67a35b10232mr333790d50.27.1792712185919;
        Thu, 22 Oct 2026 16:36:25 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:5551:17ca:f374:dc57])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a34009247sm487643d50.11.2026.10.22.16.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:36:25 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH] hfs: fix orphaned b-tree node in hfs_bnode_split()
Date: Thu, 22 Oct 2026 16:35:47 -0700
Message-ID: <20261022233548.3481882-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022233548.3481882-1-slava@dubeyko.com>
References: <20261022233548.3481882-1-slava@dubeyko.com>
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

The xfstests' test-case generic/013 finishes with
corrupted HFS volume:

generic/013 27s ... [failed, exit status 1]_check_generic_filesystem: filesystem on /dev/loop50 is inconsistent

** Checking HFS volume.
   The volume name is untitled
** Checking extents overflow file.
** Checking catalog file.
   Invalid B-tree header
   Invalid map node
(4, 0)
** Checking catalog hierarchy.
** Checking volume bitmap.
** Checking volume information.
** The volume untitled was found corrupt and needs to be repaired.

The fsck tool detected that Catalog b-tree is corrupted.
Namely, the header node's counters and map node bitmap
have inconsistent state with the real b-tree structure.
The same issue has been fixed for the case of HFS+
by commit c1307d18caa8 ("hfsplus: fix generic/642 failure").

The hfs_bnode_split() contains a loop that implements
a roughly 50/50 split of the B-tree node's records by scanning
the offset table to find where the data crosses the node's midpoint.
If this logic detects the incapability of splitting the node, then
it simply calls hfs_bnode_put() for newly created node. However,
node is not set as HFS_BNODE_DELETED and real deletion of node
doesn't happen. As a result, the empty node becomes orphaned but
it is still accounted as used. Finally, fsck tool detects this
inconsistency of HFS volume.

Add call of hfs_bnode_unlink() before hfs_bnode_put()
for the case if new node cannot be used for splitting the existing
node.

HFS port of the HFS+ commit:
commit c1307d18caa8 ("hfsplus: fix generic/642 failure").

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfs/brec.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/fs/hfs/brec.c b/fs/hfs/brec.c
index 5a2f740ddefd..1ca1ee9f73ef 100644
--- a/fs/hfs/brec.c
+++ b/fs/hfs/brec.c
@@ -254,6 +254,9 @@ static struct hfs_bnode *hfs_bnode_split(struct hfs_find_data *fd)
 	struct hfs_bnode_desc node_desc;
 	int num_recs, new_rec_off, new_off, old_rec_off;
 	int data_start, data_end, size;
+	size_t rec_off_tbl_size;
+	size_t node_desc_size = sizeof(struct hfs_bnode_desc);
+	size_t rec_size = sizeof(__be16);
 
 	tree = fd->tree;
 	node = fd->bnode;
@@ -280,18 +283,22 @@ static struct hfs_bnode *hfs_bnode_split(struct hfs_find_data *fd)
 		return next_node;
 	}
 
-	size = tree->node_size / 2 - node->num_recs * 2 - 14;
-	old_rec_off = tree->node_size - 4;
+	rec_off_tbl_size = node->num_recs * rec_size;
+	size = tree->node_size / 2;
+	size -= node_desc_size;
+	size -= rec_off_tbl_size;
+	old_rec_off = tree->node_size - (2 * rec_size);
+
 	num_recs = 1;
 	for (;;) {
 		data_start = hfs_bnode_read_u16(node, old_rec_off);
 		if (data_start > size)
 			break;
-		old_rec_off -= 2;
+		old_rec_off -= rec_size;
 		if (++num_recs < node->num_recs)
 			continue;
-		/* panic? */
 		hfs_bnode_put(node);
+		hfs_bnode_unlink(new_node);
 		hfs_bnode_put(new_node);
 		if (next_node)
 			hfs_bnode_put(next_node);
@@ -302,7 +309,7 @@ static struct hfs_bnode *hfs_bnode_split(struct hfs_find_data *fd)
 		/* new record is in the lower half,
 		 * so leave some more space there
 		 */
-		old_rec_off += 2;
+		old_rec_off += rec_size;
 		num_recs--;
 		data_start = hfs_bnode_read_u16(node, old_rec_off);
 	} else {
@@ -310,27 +317,28 @@ static struct hfs_bnode *hfs_bnode_split(struct hfs_find_data *fd)
 		hfs_bnode_get(new_node);
 		fd->bnode = new_node;
 		fd->record -= num_recs;
-		fd->keyoffset -= data_start - 14;
-		fd->entryoffset -= data_start - 14;
+		fd->keyoffset -= data_start - node_desc_size;
+		fd->entryoffset -= data_start - node_desc_size;
 	}
 	new_node->num_recs = node->num_recs - num_recs;
 	node->num_recs = num_recs;
 
-	new_rec_off = tree->node_size - 2;
-	new_off = 14;
+	new_rec_off = tree->node_size - rec_size;
+	new_off = node_desc_size;
 	size = data_start - new_off;
 	num_recs = new_node->num_recs;
 	data_end = data_start;
 	while (num_recs) {
 		hfs_bnode_write_u16(new_node, new_rec_off, new_off);
-		old_rec_off -= 2;
-		new_rec_off -= 2;
+		old_rec_off -= rec_size;
+		new_rec_off -= rec_size;
 		data_end = hfs_bnode_read_u16(node, old_rec_off);
 		new_off = data_end - size;
 		num_recs--;
 	}
 	hfs_bnode_write_u16(new_node, new_rec_off, new_off);
-	hfs_bnode_copy(new_node, 14, node, data_start, data_end - data_start);
+	hfs_bnode_copy(new_node, node_desc_size,
+			node, data_start, data_end - data_start);
 
 	/* update new bnode header */
 	node_desc.next = cpu_to_be32(new_node->next);
-- 
2.43.0


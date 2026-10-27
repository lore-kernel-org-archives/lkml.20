Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135399;
	b=NphfPhTOb1fezod5dXhUTFtA5DLh96wbJWa8dvDP+oOvvBAInZktQuWUSkUE2AoTJBVG
	 Iy4MiZynt88ewFFP2yB1Owt84gxsgDaY21MQBI2uOiSSC9IVWsD0DdnFe9S/rfE24nPhR
	 BuqxCKAJ6pbBIvLF3iZO4dkz7I+gfNmqQx/jv41eYDKAHinD12OLgHuH30uvNOvrBs7us
	 CQDwfxalAESWb7e4PMBNjaa0c5eVReJdpH7McqGHQt9+ilCrB0orGsLIb0qrdbR8xpySB
	 9FIb7xAwSW/xCZV/C57m1nNNtaKoxeDCurRaPEoCawqktF8C1euBvnRBAKMdC2KT5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8XTqukn+/PdFzAXL20wPYgMgip7I7S+Jd3WaF/h9IS0=;
	b=vUQEXZPCDcZ/ReJnng05vTY4/22ojQhPHtVA3F2LkOMloNqMr21Tl32K5hyB4gupuw/V
	 Sxy71SM9WROxforz4YaSqDYJYqS6QD+LLX1hqfGkgOZZ6NxsGw1rld0uGYq3iV7L7RdNf
	 ciCfGwHRF7i056bpZf4vYjbR8OMWUsuw0jHJSUugDaBPEZPP9Wzc64kGxtoHwocO0szkW
	 NjJpISZs4b6ng03r5b4nefHhhMDtDOkNrGm3e2cyrh/dCkhmDQJ7T/A0fsnj/3LPmB7Xj
	 1N4Fb72gORGL0vPgi/VcV3FoK8HLzT0c51xl8+uoatK/u/mFEJnL42/GA7OWzXWv5vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=eEbcfiQG;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3251C60A383F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3251C60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=eEbcfiQG
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53bb57f1310so4195301cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793135398; x=1793740198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XTqukn+/PdFzAXL20wPYgMgip7I7S+Jd3WaF/h9IS0=;
        b=eEbcfiQGjzFQ9x6nQPhXVLRzbKSE6gXO+9Z5hVtZpIRVfjgzt97hbBGPhStuCpbaFk
         HBtcS/Qaqw1V2jy6iuchOm0+y+4bF+gkkEyQiZPXG3HM9sQtRnfYJOnIGcyR524ZyYKC
         SXLY6x6CIztbK4cY5DFfGdZ/R27IEUcWbKXutL0hecb8tkyjgwBSLY9R/AmHrR4T1P9T
         YY6o+hLTQ3gl+e/LoTiLorw0U1+rRsDByi9lVdQmcghMs9LduxJQrgLmKzjTZbGR8i2j
         wHVdZfvjSsJsopWsV3pEbTY8PEkdjSYDiMyvxLO2oxvYJKBuD8LH7GKJIn41/ENROCDT
         aeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135398; x=1793740198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XTqukn+/PdFzAXL20wPYgMgip7I7S+Jd3WaF/h9IS0=;
        b=CXF3Cj5ZqMaOvVmrPmfAm0c3VZ7Ss/yqIZZrfTleBMsp9qbMjs/HtbIC59X85Ly/Wz
         0zZY5hdet6m6pJQHOC5/AhcfSTS9MGnFrde/cnwfdrhboNWRPVCUchHymYwp9qTtB6Gg
         /979zRtQl1NYWNsLXhJmd65dc5RUvbsDba+ZFst052jeEPHxdyMrylgdF1r46DvVLn47
         DUYDvOYtwoz84SCHx826fcXaIpQvKtUau/APRCFVzcrgIGtITTj9GeuQnC6hwcMGyHbv
         KaFiI62A/YkCKgbwZIPfGewiS1cN95Y6dtSDLOxE8MYxhWCV/yDG/WGw5nab6BQg1eyN
         e//w==
X-Forwarded-Encrypted: i=1; AKwUvBx1W3Kyq9IlU7IAzVI54WvGXuJid6fwtcROhNAPOE+++eiQDng9WVV8i1X/OxSmYzD8D3qfFpZDite8svI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIILppBWu0E1ZROxJaRaoBvTHD19ONeLzakfC6a4apNZm6FnjLy
	DXKDpf3SUWi1mpdWAyzCFt1agPKRP05QaUPmgAnNeYDGH7dZG9YLZK5tWPYh9SjALqs=
X-Gm-Gg: AYBFou2ULDT9+/fyl/kCaeJEpk14qw0A1gDr7mTFCbRqmAZ4MPW0TM4AFBNDItlcRSn
	2zNBkw+Hobm4NykBqbqsu/RRkO/AXUYGChgZMOaOgYDnTYuU59Mdk9tX4QkAHNRgNZZctHBgPsX
	811+tY3dR5RI08ji2Llb2iUJZdgCgOnbCA3yaWK7tj3GkM7JYcmmjN6dpPu1Eoa0RYIggEIMTP8
	KulxPFn2VhzdlgroJ8gf33DU7pvCxGaYSS/F9/47Y3m+AwszVff/yaeNlB/Dz+Jr0cT7ttMPFK0
	gE63AgyApZaMH4h1Of5Ds9LvNYSpzl5pVrSJ+HIUhx07lKQArqfekq12b9942bN/ssJgkG9CjCZ
	U6MQHR22ETcVimhdBzSTQA3uUzibhUjearYryMNrZFrVTIc+FS08UHQQdBYRugRE2c5dAhQ4WqE
	672EfUv+lP3HwB82i76/PBSfUP8yGCQ8AxD+BEVnYy2akCsuGrHyMXYttVX7mIf4zjdO4G6LvtP
	jiQQDL8kQc0PXUZ9kfBh8YzHPN6sOUzV89o8CLPKZtPHFVsVcEhbAfh28JQA+RCzp6e04BB
X-Received: by 2002:a05:622a:1aa0:b0:535:80b:9911 with SMTP id d75a77b69052e-53fcb20df41mr9954961cf.24.1793135398260;
        Tue, 27 Oct 2026 14:09:58 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6158e404sm67573556d6.10.2026.10.27.14.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:09:57 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 21:09:34 +0000
Subject: [PATCH 08/10] ovl: cache dirty overlayfs' inode
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
Message-Id: <20261027-b4-ovl-containerized-sync-v1-8-802e512379a6@toxicpanda.com>
References: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
In-Reply-To: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Theodore Ts'o <tytso@mit.edu>, Carlos Maiolino <cem@kernel.org>, 
 David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793135381; l=1966;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=r8oWHM2R6WAXg8HrCjeXmd1r7eRfd1EeN8AmKGOIsRg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDOmYTnJJ8RTcwCBkaMmlMiKXlvPY/lOEDbTATIK4uc9Ct3JzTq+Q6a0CwMi4ne3N0Vjpvbl5Tm
 zBsI3Qp+k3Q8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <cgxu519@mykernel.net>

An overlay inode is dropped with its last reference, dirty or not.  Its
upper inode may well have dirty data at that point, and once the overlay
inode is gone nothing says that this data came from this overlay.

Only drop clean inodes.  A dirty one stays in the cache until it has been
written back, and is then reclaimed from the lru list.  One which was
unlinked is still dropped at once, so that its space is freed.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
[josef: an inode under writeback isn't clean either, no need to look for an
 upper inode, rebased, new commit message]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 0aec7059e9da..954648d41700 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -364,11 +364,27 @@ static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return ret;
 }
 
+/*
+ * In iput_final(), clean inode will drop directly and dirty inode will
+ * keep in the cache until write back to sync dirty data then add to lru
+ * list to wait reclaim.
+ *
+ * An inode under writeback has its dirty flags cleared, and only I_SYNC pins
+ * it.  It is not clean: ovl_write_inode() may be about to mark it dirty again,
+ * which does nothing for an inode which is being freed.
+ */
+static int ovl_drop_inode(struct inode *inode)
+{
+	if (!(inode_state_read(inode) & (I_DIRTY_ALL | I_SYNC)))
+		return 1;
+	return inode_generic_drop(inode);
+}
+
 static const struct super_operations ovl_super_operations = {
 	.alloc_inode	= ovl_alloc_inode,
 	.free_inode	= ovl_free_inode,
 	.destroy_inode	= ovl_destroy_inode,
-	.drop_inode	= inode_just_drop,
+	.drop_inode	= ovl_drop_inode,
 	.put_super	= ovl_put_super,
 	.write_inode	= ovl_write_inode,
 	.sync_fs	= ovl_sync_fs,

-- 
2.55.0


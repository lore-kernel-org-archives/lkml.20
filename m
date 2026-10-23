Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723042;
	b=EJySKIQRNcWxh4CnYRll3HY2PytcDyv7W75PED8mz6b+/Kq5Asu5xBCvPSaMRVhCvnls
	 DB+z6Yv0qQffx+aYAsClmEOBCmZHxvAO3db0Nusc7nNl5RJitWQVeYmMtZlhi6pu7pPfv
	 vNKmRL/VA64p76wsG4NqrWTlKgrUVtgJdkH5AKYN1nvrLfl8VJkP6bRFv35bzpOtAWo1z
	 AEF+te0u4zrhoDyt1C3Hktw3XelblGixr3cVBRrvZS/+auQzhE4Keh8EJQ6kWmss03DAZ
	 OVahsbraxVsx/I6HwVwm1RNmjCUbE9t9LPZgYQm5g6W9796/cc1H1teem/cvi9nZQJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WXD1UXa/1j2wgsFUv0w36GnGU79I5JqF8Ggu7ibN9oo=;
	b=38f+rsKVhKClosLEsobNJ+su/urOqoAz7ZqCDGrBjo+eVd36cu+xHttcpuYZFyCxxB7P
	 Lr/q1e1ULnrSHRrGpV/iaZcc3LiM7OWqne/Bpt8KlLz7hyc48ICk1ZvkAZDzoPKDgfcvk
	 JR1Xhhwi6hhQPdOn99FV9GX3SsoYuJHwc1TGaPgdFcA5c7OFHZsjLW6kDOfxCO8/W60bn
	 kro/+crMkqISzelWvHHYj7IR3LFjyAw9ak76BgNlsFUgAstgAjbnEyZlPlqsnnLtC/+17
	 yuMvECIrdW+nW4U/5dx2V2i3HWyBa/ALe0a5/7HZPI6IRMGYcbJE8DHcOMKsXeoFtuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H4+CJh4U;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B5606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB0B5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H4+CJh4U
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so331662b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792723041; x=1793327841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WXD1UXa/1j2wgsFUv0w36GnGU79I5JqF8Ggu7ibN9oo=;
        b=H4+CJh4U/XQB1x17laGpiGn3y8Ag9afkIWxee4g/X2XMGCfrdKdT/k/gt/eXaxDIL6
         i0AIVO2H8yi0JT3FIz/rsEAOfW54qBSHsCz8Wee3VVBke67Myew2Nnj/WlnFlqboC/Tt
         xLywkMVz25Oe15lVOLS60TBP0hbWN483AozsjKkGSBlViCqjYPD4iUp3cOc/sRpylXDm
         8FWezW2khsT6RMSccathtrgnQeVykvydGXh0xt64Loa+9gD+jxaDLbfCM9H2SJTo9yq3
         Ic9pGGndhaKN3t3YU01nMNpRGse8hdcXuvQXExab8gYYvSHF0xIb4D2rXudkIpigU1H5
         NfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723041; x=1793327841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WXD1UXa/1j2wgsFUv0w36GnGU79I5JqF8Ggu7ibN9oo=;
        b=U6BUqkw/cbg6xCr3LFIemo352N24i2wLUeX1GLTuUMRkZZAMaADiQRO3hskg16LuC6
         4GUsiY4A6xKW9IUBbIg0RgaKZv2g9d37IOHce2+ZF1wN0iQFYEkBmbv5EdjHhVVhizMa
         luDpsUzRY9fKzylIsvegVRpAH0vsfQeloRjxFul6eMWLsNUd4ciFKSfxdjKjwYjVGF6d
         RVbd53wr71mqVo2O659JCV0HGOsEMa9ZCwkZvvPE+bKnQq9ltfKpADolq7r3x++Sil7N
         N9DTziE4S7h0VmLGWlCNipjXNAl6rlgRXYsMuTURttjp5nRUIA47WpzVYsj3nuOV/gX4
         SedA==
X-Forwarded-Encrypted: i=1; AKwUvBweI7AFxY8+s/vMttqprO8eKCWrCZ0BQidIhP6IIUwVvggOJmip3NKau7IyCQBNZ3Va4fWX7sEy8dqDQ6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyc//MJnYxInsKLoerPtnsz0yu8diHcpeOaaoOAUwXzM4AiUCp
	guWboFPJUnd2ZRDkwYva+rFFabF3mgvQPc+lrpIGyfzZZmI1+d8tj9sH
X-Gm-Gg: AYBFou0SI7Agv3pwpjkA3gzJvykyMV2Jn2kU56SNB1XzXOZ8aKnsJL/Z7G0fXhlSacg
	ZGz8lqfx46eK5GnegCn+O4PB9MeCABT+drXUt1o0Cxk8mpKPm9jddSAXiV86aikmItnnzmxTS7o
	PldnOIaN1usQtN7e68ueuUXY2U/TMJi/p+uwO77LWOI7u66Mq4H9Nl64oy3w6S+XyaN6diAz3HF
	aFZK4JZ1sSCBNbs1S4RK3D3dAYYwzihdm0Fu1AZ63wyQDsvFwnkA9a/L9J+UwgRwn7bE9Vu6WAY
	OrHwfP/leOaROZmVosehQ8z3sLP1bbm5POfTSeIbaqJpldrE4Wq9nPxtfBOXtEaDsgQ/ZwWx09M
	EC+D/Ftm3v8LFqT5RinlQ/HI71WzzSqr6Q6EyrA8gtdqJdjI2Xvm+lItfM4nWq8+8opv/Qj6gZe
	gHa2z4VwP2EfOGOYHHloMZn9eKsp9yn89uHEWXNjdyGf79hmL5UrNZrydbf98QV/UYojFXB2/0Y
	CkIdpdVX+fE8QCoHePhuM78mua+sDxwvzpLJdx9CDYPQXIqqTw=
X-Received: by 2002:a05:6a00:2d22:b0:8a2:b10c:faef with SMTP id d2e1a72fcca58-8a2c66b5aa5mr763722b3a.48.1792723041105;
        Thu, 22 Oct 2026 19:37:21 -0700 (PDT)
Received: from linux ([103.155.143.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f2a01sm189340b3a.46.2026.10.22.19.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:37:20 -0700 (PDT)
From: Hongyu Jin <hongyu.jin.cn@gmail.com>
X-Google-Original-From: Hongyu Jin <hongyu.jin@unisoc.com>
To: linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: hongyu.jin.cn@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RESEND PATCH] writeback: don't requeue inode already on b_dirty
Date: Fri, 23 Oct 2026 10:37:07 +0800
Message-ID: <20261023023707.263101-1-hongyu.jin@unisoc.com>
X-Mailer: git-send-email 2.53.0
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

Since commit 846a3351ddfe ("writeback: Avoid skipping inode writeback"),
writeback_single_inode() calls redirty_tail_locked() for any inode left
dirty. When that inode is already on b_dirty and older than the newest
inode there, redirty_tail_locked() moves it to the head and stamps
dirtied_when with jiffies.

Append to an f2fs file so the i_size update puts it on DIRTY_META, and
dirty a newer inode before each checkpoint. Every 17s the checkpoint
syncs that file and redirty_tail_locked() stamps a new dirtied_when.
17s is shorter than the default 30s dirty_expire_interval, so kupdate
never expires it. Dirty pages pile up until writeback or fsync().

An inode that was I_DIRTY on entry is already on b_dirty, so only
redirty it if it was not. The b_dirty_time case fixed by commit
846a3351ddfe ("writeback: Avoid skipping inode writeback") enters without
I_DIRTY and is still handled.

Fixes: 846a3351ddfe ("writeback: Avoid skipping inode writeback")
Cc: stable@vger.kernel.org
Signed-off-by: Hongyu Jin <hongyu.jin@unisoc.com>
---
 fs/fs-writeback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 58a6403780aa..fb33a63710ec 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1898,6 +1898,7 @@ static int writeback_single_inode(struct inode *inode,
 				  struct writeback_control *wbc)
 {
 	struct bdi_writeback *wb;
+	bool was_dirty;
 	int ret = 0;
 
 	spin_lock(&inode->i_lock);
@@ -1932,6 +1933,7 @@ static int writeback_single_inode(struct inode *inode,
 		    !(inode_state_read(inode) & I_METADATA_WRITEBACK))
 			goto out;
 	}
+	was_dirty = inode_state_read(inode) & I_DIRTY;
 	inode_state_set(inode, I_SYNC);
 	wbc_attach_and_unlock_inode(wbc, inode);
 
@@ -1954,7 +1956,7 @@ static int writeback_single_inode(struct inode *inode,
 		if (!(inode_state_read(inode) & I_DIRTY_ALL))
 			inode_cgwb_move_to_attached(inode, wb);
 		else if (!(inode_state_read(inode) & I_SYNC_QUEUED)) {
-			if ((inode_state_read(inode) & I_DIRTY))
+			if ((inode_state_read(inode) & I_DIRTY) && !was_dirty)
 				redirty_tail_locked(inode, wb);
 			else if (inode_state_read(inode) & I_DIRTY_TIME) {
 				inode->dirtied_when = jiffies;
-- 
2.53.0


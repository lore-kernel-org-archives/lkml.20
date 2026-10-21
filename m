Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568221;
	b=BUhU6lYg0MXmUZafeII4EuvZgUh2AGIBByS04FwXvefyEfkIZgyaqw+6TOAY6Py9qlnZ
	 7pwOeeTiiml5oHe0eZYltoMiidgbAhW2Z09PYo5If2XOBVOThthu7IbybmohBisFwHktq
	 vgokDS/u6X0uyiEWzXhS290SLk+uPDKgN1J+teS2zuwjXPLplhAePazZpqDQ8AA70WsSu
	 7uCQDJ98qru2HL/naMH3KG5AwQ9P5FGKfWqRE/oi31C4/scDmV6Yasb/gTpeiQn9Lqn1I
	 eNmk9lnXVs+3m/JL6c4ZTEbgEz5wzUWPRmkqFxbP7gzA2jxZkIf4//AtgQq9ED711MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WXD1UXa/1j2wgsFUv0w36GnGU79I5JqF8Ggu7ibN9oo=;
	b=nl5t39GvfkPIYVj90NZneYZVw2Tl7K11iBFz+gjxR0h2mE0+ttkye8QhkOPsT1PHGGFL
	 yJ2QYU91ZR/9W6TwJpk26PYFcm7ok+yHOt5TEsSpYuEOgwLsrdEIXBDTjXrZXCfFP3SSy
	 SpwJLNXkEJ18qmY24KY3LIEbKtUK3KaMsG0BBdepSMyc0bOO4IJif5mh79+ak3o8//+bX
	 So37BhRQU8pYe9zanQP8KskaIByKG9gnMYVYOnJrfkjQxl5Mvz6hFhynx1SA1dFAh1phJ
	 Iok14r/YVsfieaxrmRmpMUftZmHo0S4XQWvWKjSoMWVZ1r73JL26XEO1S7vo6XxhFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gagodWgB;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DE9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gagodWgB
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-886e61fa30fso148609b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792568221; x=1793173021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WXD1UXa/1j2wgsFUv0w36GnGU79I5JqF8Ggu7ibN9oo=;
        b=gagodWgBrgFA2S7b38LrES3z1xTNxB2kePPhg4Th6LZJTOssH549Zk5x5ny88HFah+
         vKG9FKZnV8i0jqsHU6lhMf/+/L7XD3H8SwpN8IxefAD+LvQUGLoPK0PdLIz48F3Yqt+l
         dviCyu+7XfHzDAMgm2o1wULlGbFcv1pkVmalVRV1I4HdlY/B24YAu4pGy3DRbr+SDDtw
         QgK+bPW41dChCJRH+4c/gPi3g8B4g1ADLu3qF8/wAaFv7qxfbx0leJLPa0IbFlcKP/cJ
         NRHHvV5Tv7rsylfBuURyLghW2AIfF1efHWFM1r7lx1h8G8e6d2ipA8VifrV7coTzD6Fy
         +BLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568221; x=1793173021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WXD1UXa/1j2wgsFUv0w36GnGU79I5JqF8Ggu7ibN9oo=;
        b=g1zmVt6qDz3VELl5Heycm3uKgWbOOu+Fm6SOr18no8/RjMXjR9gs0t2Wsl7BKJrXHx
         5ZdBw6SEowhnWh+bGDXVsrthDKTt4AlGZ76R8azUtWkpTVScQKE6k/WSfYxLbheVZLlk
         GB8Yp0AHC9RYylxLlyq2S2Jqjl5VqdVNZq4KjxE5liOIHTXjnXRwqd8hTJH+OrE4lfYu
         Ns9fxUmMuRVRXZUCbq5QA7XcD3Ssv3l1YEzBcuu/CJf3o+KZQ3P5TLbFaPcrwUiZyLYU
         XzmfnlJmxC6fO5lzzLStYcBtCGYY9iTuKWSf63RhlzV3vhC8VkwyzOLLnz+oMrIvFdX6
         um0g==
X-Forwarded-Encrypted: i=1; AKwUvBwq2HO6/TYBLgLTLB5WPO/OpKxqmgDmlObB2OwhNjJADAAr7YDgJJs8PcbWQ52FrUlM0CqzamGfaYIKyKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZBErq4xZk4pVPk+363sjbUYux13KuFJPLWbtJAUIcQ+1u9tnN
	/CAyoN+2HmA647zMiiwNZxI9Lme84ocYZe3sAli3dmGW/ekCXC7e9PVg
X-Gm-Gg: AYBFou0ysVKZVWoB15ulrtpQhJR17vsPLs/tcGoIj2RwlyKtbcj+JIN5yfbwQLBcVa/
	AXwR0uepJTDFb/rwYeyySOINVuz/NCSTZFwhLIF9mbCT8FAqBzJ3BpwZn5wCUhULub91OpwmdMK
	omNhtZDmowOkFLspyO5hSNUekUbYxAULs4fJt02jWLXyi52AV8zs3EJ9DcvdQwBZqRbWhke7Xqw
	/4gINEDT+0kaFGfWYI0goGqncG7oOH7RFIthJTWoLuVa7OT7MSgmplscadsLcvh8KzLtZIxdoKx
	VKtH9meHNnRORbd6LwKXSR7KOkCcyLZ/Gilrv0NbLrjPzjzllqnRt3gjL0dp8L7O39AZZGGk27R
	nlW+Rj5p8/kaQDdKCR7pXe5dD1Qq/TJvyyR/H2wInKrwJZPn0vC8m0LkrAtEa5daVo6xsC/76Ot
	llXf7MDCw6nz/YVElGjBG2T8PeJnASjy0WyHB1C02LkIApeAvEATt4kdPuSe5UP1Mv3kpUQE70c
	IFq1/UaLfy//bwSFTQIS/orvnbe23acSvJbxYOx7CuM5wPlKaE=
X-Received: by 2002:a05:6a00:1c94:b0:8a0:20e0:b131 with SMTP id d2e1a72fcca58-8a089f250cemr919057b3a.19.1792568220671;
        Wed, 21 Oct 2026 00:37:00 -0700 (PDT)
Received: from linux ([103.155.143.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895dc12asm541962b3a.40.2026.10.21.00.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:00 -0700 (PDT)
From: Hongyu Jin <hongyu.jin.cn@gmail.com>
X-Google-Original-From: Hongyu Jin <hongyu.jin@unisoc.com>
To: linux-fsdevel@vger.kernel.org
Cc: hongyu.jin.cn@gmail.com,
	hch@lst.de,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] writeback: don't requeue inode already on b_dirty
Date: Wed, 21 Oct 2026 15:36:34 +0800
Message-ID: <20261021073634.132369-1-hongyu.jin@unisoc.com>
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


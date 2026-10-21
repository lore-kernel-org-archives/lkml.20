Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544228;
	b=RnZUHHCuu+MeAkfIZ4W3154JPrvLIldAKINMf2vLQNhPd+SFebpJxP/8m/TXbZARQlL8
	 e+zAgiTgU95dZ3ddbx9Y7azVn7Cj0f+geH0+DO7WbgHXmk311+/UHg5xI52U3pY1hYIyB
	 gp106AkEl0IAdEjDJl9IyQRCLLZSZY3+RFQC7k0qXx6/1Ly//ytDa0NJN9s1DbA6PjvUD
	 V8tJySQgJJsakRFZHBygybcwUb5R2Y3N0S3rjPHRoLlgaNBZCuF6wgLBIc+w4dFZZQK3V
	 j/DRLODSw8lHIdbybql4QrbPjcvltvzR9N6SIWALVkq86BoNKaWy9JJmuClgvLuckyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OsC+tMi3xsAaq7lYAEKUZ7THAxkpwlxVniOQwZXZmIQ=;
	b=L0uUnDQfIg6EUjTKJ7hjGNIYCMq3UVzZaAzj259Zb9iE6euaBRMviQLohM5QGkpZdyb3
	 7+T49SOLQp9QH160nOruHmhvlH2aGCCo5QL47I8IFeLpmWq5g28fM5Kc7keev0MYPPMtU
	 Z0JZGSZfUiPQ8QPjk5qWKROS9COMHYt2vttdAZfxksAltkgfr4hBVeCnf1i4pP4OI5ue+
	 qFJvCfmzN3np2cnE8fvEapivyT7bIEiJNQ3gT+lJbjfjDeWO+pNqLkcfBqZJRtZ7wBv0g
	 1t0ISy8qK5U47ecvP7/SjZ12w1XCBSFs1tuW9iAyEl9pOwsUaRss0Ukbai0NGzTFR6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=qw3nTdHB;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED278606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED278606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=qw3nTdHB
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5366463571cso2292361cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792544221; x=1793149021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsC+tMi3xsAaq7lYAEKUZ7THAxkpwlxVniOQwZXZmIQ=;
        b=qw3nTdHBFeejS7BoFVnPvWUIDGyBSdH7DgGRPZAXLm15a2e1qsCgZBVSo2FMxCOkHC
         ziTHWah0wRUcOBmi3GUgyfhztGFysS3GttEKfak90/wjsZiFuxrCYD15rDPqwXVvv3RC
         6ltS46eP/cCt1OomnCe2u5uW9MIPdfpdQ/WVeEVMhDuyoO78jlQXxc3HNZciYDzOuyu7
         PEWuGPK8b44dUf29TeojycLiELf3XuJe5CH908JdqR06bd7mkEUnzWVxAygeEZ9KiNd3
         gVpCWpgiD2ymxJOu2crvWju1jZDhiV1ttUtJ6qE5Rg13X/SrqIGa3xF+t8BmfjRhfpsm
         9Ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544221; x=1793149021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OsC+tMi3xsAaq7lYAEKUZ7THAxkpwlxVniOQwZXZmIQ=;
        b=aDYQuRmQzCk9Ld7yiReeDXOKFTSd4Xfd7eWj5PtR+YoEA1BmSmgNgYGzah1vNUgeC/
         DR6MU1Sv83hV3s17v+4QNAQu8GaujYfOhB03Eo1HEjIffGg3ZzBdxfJLKrHEM1BURhem
         Wc//usXhj2rslEnWdBWUWprj1m2gsAMf+CuGbJgCe6ShxjiGquoXNhZgDGYtut6YWVvp
         ybRr8EPV2DoHZiEPiaA5sO9uWj6RgFCsDZYSwriPW9/Pzmfi43WQrHc0jMGOY7+53IOd
         O7R5Nt+V12gLqFLfCz/osQPaM65RXs4HPK+6XA7hEC01UYfDKg7qeyaqkINl7ODUNL2f
         9Ynw==
X-Forwarded-Encrypted: i=1; AKwUvBwCP+RUVk1TSKHbMWHp2ElymqRO9rSKFfivUwzFbc8eAXGNucpBEgbCxPmYeQR8cuxcclryaJq6PICcr6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV3M0/Vts5uGP8cKY69yZ5OpZYv7kbyRb8JXqsNr+vrUF+P7Ho
	a/mEM4y79ztCp9V2bnc8WN8WBnMPpXJdCrGu69WrwobDWrgttbNNLTIDGYSwzBIlZxg=
X-Gm-Gg: AYBFou1d8UJ/tYKDPNgn5lBQ0HoibigxuiKstqZksXnE2HuhAeEUtxk4GO9F+B0AlEq
	TSTuNb3UZVVrhCqZeLctD7q6+FX6zicpUHA8Lr/eFrCsOxF3YKSQF8An38VxMnmIUhYxAl9I2zz
	bF+po34nH8yyExTMAAUxn9qhaScUADTIfZhmDucCC7k4HPWeLkIeAnv7MmBrHVgPXTEBgyca9US
	jwxCMsVpSDYfNYQdttOI5h+GRCuMs5qgEcNb4Q9+4cyAPrKXoUeqf2oclxDCB0f2NIQTUaW2KJV
	ZhQiiLqGMm2P4EJCmNEA6eRyv/mZabkhqGUMVFXiS0RtuXzgHpj//Ya8XE6cie3JDd/bCiUZAX2
	yLRavBVIU2vKctS7atTHyrobxc/m1WLP2zakiAhY7iNdC6VSObN2xzLnNhYvHe6FHM77Lkvjdwa
	FsJpGSVzWzGn/tH3VOptfnC7azW9VwSsDDTIRTgky6X3IchNg1HfbOIkmpP0m7XocGdmFBCbwZb
	gZ8Z7LIk826AfX1BA85Bmwt0uv7OPjBauOTMOVkGw1kGVU3/M3fPSNdAE3xXiK+I3Ko+xUo
X-Received: by 2002:a05:622a:353:b0:536:6d88:6018 with SMTP id d75a77b69052e-5369b8965a1mr8640641cf.51.1792544220916;
        Tue, 20 Oct 2026 17:57:00 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698ae608dsm8427021cf.5.2026.10.20.17.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:57:00 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 00:56:37 +0000
Subject: [PATCH 3/5] fs: make the block device callbacks wait for
 superblocks being shut down
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
Message-Id: <20261021-b4-super-lock-dying-v1-3-2b35e86706ff@toxicpanda.com>
References: <20261021-b4-super-lock-dying-v1-0-2b35e86706ff@toxicpanda.com>
In-Reply-To: <20261021-b4-super-lock-dying-v1-0-2b35e86706ff@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792544204; l=3377;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=D39p3y1yIDoZ+ep4D8MwYRO247+OyVwansyv+LMEiwg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDMiVjBndza+NxFXUuqT/hKXTGVF2xShNLpEqJnEeo3+3kEs52EyUv9fbeG93PgknNPwH+bF4TG
 XlvChBaqweAI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Three of the callbacks the block layer has into the filesystem using a
device rely on super_lock() sleeping on s_umount until an unmount is done,
in the same unspoken way as sync(2) and freezing for suspend:

 - fs_bdev_sync() is there to get the filesystem onto the device.  While it
   is being unmounted, the unmount is what does that.

 - fs_bdev_freeze() promises that nothing writes to the device once it has
   returned.  An unmount writes to it until ->put_super() is done.

 - fs_bdev_mark_dead() without @surprise is an orderly removal, which syncs
   the filesystem before the device goes away.  Going ahead while an
   unmount is still writing would lose what it hasn't written yet.

Have them wait for SB_DYING when the superblock turns out to be going
away, ahead of super_lock() not sleeping on such a superblock any more.
With @surprise the device is gone already and there is nothing to wait
for.

Only fs_bdev_sync() can be killed while it waits.  Its one caller is
BLKFLSBUF, and all that does afterwards is invalidate_bdev(), which leaves
dirty pages and pages under writeback alone.

The other two use super_wait_shutdown() and can't be killed, as they can't
be today.  Killing the task doesn't call off the removal of the
device, it would only make it overtake the unmount.  fs_bdev_freeze() could
return an error, but by then it may have frozen other superblocks on the
device, which its caller doesn't thaw on failure.

For now SB_DYING is always set by the time super_lock() fails, so nothing
changes yet.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/super.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 76101307da01..9baaaa3256b2 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1572,8 +1572,12 @@ static void fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
 	for (sb_dev = super_dev_first(dev); sb_dev; sb_dev = super_dev_next(sb_dev)) {
 		struct super_block *sb = sb_dev->sd_sb;
 
-		if (!super_lock_shared(sb))
+		if (!super_lock_shared(sb)) {
+			/* don't take the device away from under an unmount */
+			if (!surprise)
+				super_wait_shutdown(sb);
 			continue;
+		}
 		if (sb->s_root && (sb->s_flags & SB_ACTIVE)) {
 			if (!sb->s_op->remove_bdev ||
 			    sb->s_op->remove_bdev(sb, bdev)) {
@@ -1599,8 +1603,13 @@ static void fs_bdev_sync(struct block_device *bdev)
 	for (sb_dev = super_dev_first(dev); sb_dev; sb_dev = super_dev_next(sb_dev)) {
 		struct super_block *sb = sb_dev->sd_sb;
 
-		if (!super_lock_shared(sb))
+		if (!super_lock_shared(sb)) {
+			if (super_wait_shutdown_killable(sb)) {
+				super_dev_put(sb_dev);
+				return;
+			}
 			continue;
+		}
 		if (sb->s_root && (sb->s_flags & SB_ACTIVE))
 			sync_filesystem(sb);
 		super_unlock_shared(sb);
@@ -1631,8 +1640,11 @@ static int fs_bdev_freeze(struct block_device *bdev)
 	mutex_unlock(&bdev->bd_holder_lock);
 
 	for (sb_dev = super_dev_first(dev); sb_dev; sb_dev = super_dev_next(sb_dev)) {
-		if (!get_active_super(sb_dev->sd_sb))
+		if (!get_active_super(sb_dev->sd_sb)) {
+			/* an unmount writes to the device until it is done */
+			super_wait_shutdown(sb_dev->sd_sb);
 			continue;
+		}
 		err = fs_super_freeze(sb_dev->sd_sb);
 		if (err && !error)
 			error = err;

-- 
2.55.0


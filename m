Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601247;
	b=laoF1ssIL1aM1VtNZDZm1w2sP5y9yHBc+Qx+YMKHmMHY18KtvsFGDC8k6QK1NN/KgmOB
	 w3v1WXB9s6t1WPpvEWBiJk5s7lqgU3BYf5H4I7F+HAKzMzTdv1WYQ5C/wx01oEFKtH1vA
	 R5BLWVTMZEi4l93WGg+gdtqsaAc6mUDfJuETZueCUY4ypdxRCib1ON3dAJhOtgc71ytZC
	 ep0+Ekv6TbhY/lobk72Bipd2Yugl6Np67XlRpGBizopg3mtZU+fTR02DemmTpw9TQGO9P
	 MhbpfCFVpRggMVyhMM+gSxidA/H1/1o6CxvqtCA4JxAyQVyE3D2uRvW+pl0l2lsnf/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZZZEQJMItiqpnFGu5aV7NtwnGpNdzBOLgdMI4f1zBl8=;
	b=oOFKMa1hmq1E0BRNOiIZmlyj3OfwqH94gLyaAycxcnGjN+yvtyz3rUG4uWNdmLRRu47B
	 Ohleim41uFLP03ho9aaTn13BqJFs15czLsh1j+oLKj9YzsyduDNPMwcK/GbNW6vC0tHkT
	 PxbojXxCm5cFMj0H2arowjjM/EJzpaVrBMHjNFDkTYP4SbAge9/FdZXhaBx0frCmLesXJ
	 JQsNF5fdT6PHDbYffkLgaEOXWP0RuYuX3b3WXXGNvbde+cMnQuH9FbOuqu/80EerUZYJ3
	 np9xam4N5HM7HLVCSeG3HRd9IfV8sfUSIvnXYK++jam8ciY1w3OgNkWMYUJYeLWzSaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FRdg2YOM;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBB4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=FRdg2YOM
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917ad52d7b6so9592136d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792601246; x=1793206046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZZEQJMItiqpnFGu5aV7NtwnGpNdzBOLgdMI4f1zBl8=;
        b=FRdg2YOMBl/W7NmySpi8e/ApbFhgNz3TsQgZ56mcFIZgseKDBmNn8imA3YaVOI3my4
         kWOuuw0zr6L0DGmGz243kDzLoNes97mXbaWHA0myrzAUdrxkt18sqQJtNwLfhcAZbpBp
         hdWf/PnVWdFR6msiF4P81fal67bENGCztuWAB+L0IlXk51INkT8LAZso/m1kelGQIxu6
         Z7MuTEuq4TtrA6WnUqnSLFZavgNvWcyUgzXwCHT3/lblR2zP2+qVMneRdO9uL5pKKsUO
         atx4q7uM6M/F18Wq7WB6vZFXluwGrmWNBZdMJqB7exJrKl7a9xkpvhmMtMl/QZ3njojS
         cNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601246; x=1793206046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZZEQJMItiqpnFGu5aV7NtwnGpNdzBOLgdMI4f1zBl8=;
        b=vNHhiDYKEf3c3UXpbOThcc2MX4BSBVacAqKAqhQ/GftKqiE/r0tBIw7tzbCWYe0mJz
         yxqJ6gfzVXJ4l99/APNW6Z84HNfCh1YauxXUcmvGNTkRtKZjfh5tVaj6AXkemFVp0iux
         pX/Qipw2OqW6ODJxWTdhvUquuy82JsKMWGZs0Lu/ufECRB1GDtDcc22UQmU1kGJKZPLk
         BplYK6llhjjt4aIRNkQSAf1hfJx2VgM7FhkbAYaMH1vu0B7g/kVXwxRASmmrSzJMVEd+
         eO0yEt85aleT+sK+s1bdGdgfTx27ukQuHk/FtwvPsnmRJHXbOfg+LATJ7L8viOPLut3A
         sJ0g==
X-Forwarded-Encrypted: i=1; AKwUvBxwuez7fvXedKd9niL7D+yjbAfqT8ONo4mUKHEpgLyInNBHn4ULLERsdDxg//T84zeAbHouxXdj9F/lacs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDq7rPxE9UVTe+gD3kU/f2nwv90UphV2CRuWVasxheqnRbSRzP
	kUI7GTAN8dRbnmJ/pXwfFWgEfcHfmst5ac0fnNOWwJV8ptVOa1qQ0qN4l+w+TXxjvYnew2V+DN6
	fGLg9
X-Gm-Gg: AYBFou3QQ3fr0L58hgJZORq1XFlLMFgtpRZox1jxiUI9qt1DJN3oToWCHAzeX36rwo8
	VZiXuIb+iO3fAR9pULkMacZ2VcPd+s2j4Vj/+RubTtKP1n+3in4IobAwrfp8D/1sRAb8PWa9xM0
	3xXL3pOVWLRVIweO9Wis9hH8gjTzZeoFlgZmRMt5VCw+3s6ZH50klwSwtCAax+ERQh5a2syCGAM
	T4i7bYdKMYt4x3rsiKRXl6EcUUCJF5r5MuBun0hYzyxQ5EoYni1UnkCcocICiwGm281FyfXSa7y
	yaJ9LgBmw8K+hEUu9sKXaJBsBB6xp6fJ1KHP2NneFtcc8ymFzefckhGOeFbshgW2tWIbVcsX/Bv
	cNWbREBm8+ElvmNgH36OU999JwQh3+l9ySDFLmjj6SSzJZorCR3jTA0f+p2IDGY3Sgf5J7qrrmJ
	vAzy7DYYSIx+gHelwzyKK+OLjYR45NlO6C7D53XLY0EOJRiqSEM6eIgaRScD3q70N/XREl+09oi
	OwDw8fco1l/lY2yqmU+c1iDRpXSxWq29y8zWaOymt/IERlA2QEN0QxY2LyTy7XDejmKRCEuEQ==
X-Received: by 2002:a05:6214:2a4a:b0:914:2c9d:b376 with SMTP id 6a1803df08f44-91c12f0c309mr45509346d6.46.1792601246149;
        Wed, 21 Oct 2026 09:47:26 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10b74c01sm28740316d6.8.2026.10.21.09.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:47:25 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 16:46:59 +0000
Subject: [PATCH 3/5] fs: make BLKFLSBUF's wait for a superblock killable
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
Message-Id: <20261021-b4-super-lock-unborn-v1-3-0265eddb6dee@toxicpanda.com>
References: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
In-Reply-To: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792601235; l=1603;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oUk6uISnfWFRH6uDQHX+PYQKTdHZokFJbKYmrMDDYws=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ+Z3H3tEY5XZg/PqP8ScfgS76VfJrH15HB4kHDQjOPrm3mUAW2pDXZXX7fa4LQy9Xaps71vC0r
 zyeWkDqTJpgs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

fs_bdev_sync() syncs the filesystems on a block device for BLKFLSBUF.  It
can already be killed while it waits for one which is being unmounted.  For
one which is still being mounted it waits for SB_BORN, and then for
s_umount, in super_lock(), which can't be killed.  If the mount is stuck on
that very device, so is the ioctl.

Use super_lock_killable() and stop the walk when the task is killed, as for
the unmount.  All BLKFLSBUF does afterwards is invalidate_bdev(), which
leaves dirty pages and pages under writeback alone.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/super.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 40f92ffa39c1..ecba64ed0c2a 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1676,17 +1676,21 @@ static void fs_bdev_sync(struct block_device *bdev)
 
 	for (sb_dev = super_dev_first(dev); sb_dev; sb_dev = super_dev_next(sb_dev)) {
 		struct super_block *sb = sb_dev->sd_sb;
+		int ret;
 
-		if (!super_lock_shared(sb)) {
-			if (super_wait_shutdown_killable(sb)) {
-				super_dev_put(sb_dev);
-				return;
-			}
+		ret = super_lock_killable(sb, false);
+		if (!ret) {
+			if (sb->s_root && (sb->s_flags & SB_ACTIVE))
+				sync_filesystem(sb);
+			super_unlock_shared(sb);
 			continue;
 		}
-		if (sb->s_root && (sb->s_flags & SB_ACTIVE))
-			sync_filesystem(sb);
-		super_unlock_shared(sb);
+		if (ret == -ENOENT)
+			ret = super_wait_shutdown_killable(sb);
+		if (ret) {
+			super_dev_put(sb_dev);
+			return;
+		}
 	}
 }
 

-- 
2.55.0


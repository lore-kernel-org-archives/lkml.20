Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951387;
	b=PAkwWmcs2Jve1uoGA4J0mLdLAiyG6kE+W1A1O+9ygL0R3IpWDjM3CrJNvz4nYp5H0nWm
	 Ix9jZCiL3SNRiB+G/I/BrXIm7+4cWd7sAjaUXa18nLfSO8XXIb8N+XH1UmULXnSr7vuNZ
	 U+Feb5sABjdh1vWaV+06uEtMa9rCGj+iFodoIJZ1RnXmJ2MLmbZa2r+pXwlkl68mDijyK
	 P6BZqTJNCIy6mdCua53JZxJ6A3sY/3YcIH9fsPH0CpObHikAUKqpJhr/IMlj6DNmbc7ef
	 B/zL3ac0876uK0yXQX2GHbVbhbCIz0sSf5LZdnmMtxOuf/KdqorWgEAj6cT4LpFEs7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P+SFE5KlwHSbzSppx2ca382HQJ58fWCk3G4Y1HJ+92o=;
	b=2zsG1oytBlNbTjX9mq+qNIV6OEZ6jJa/+Dpj4OeVgeT7qNgRBpZzACpbJXNYQQt+VWHf
	 N7eL++cxaiKMtpcRR+KgUlAnwkleoRub89M2lCsbeJrGDFQxsKHFV5/e/wuCzIXrggUKU
	 tG+cW1YXW0pJorTzP2g/IO+X/0BmnFxAi40Hf6dDatJtf4VBphomdQO4HJv3PzZ8rN+Hs
	 Ngf8kLbMQSVIgm+2rV4HA4T2U9Ja3om3l2xk99S7LJzRLypc2wcZ3MTwYYlRdgZQUkXLD
	 d1xc6nmtc49KtF7EiHsWirPSHZTuz1sevP2y6C4bwmZmyr7IINqoqD1Uk6peEId0Wlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="bb5/zCB8";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F212606A328
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F212606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bb5/zCB8
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso1755043c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951386; x=1793556186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+SFE5KlwHSbzSppx2ca382HQJ58fWCk3G4Y1HJ+92o=;
        b=bb5/zCB8TnaQ4XKin8MIPuG11BE/emDViw0RrV6iuF85xr9Cp80GFsSZTEEDjOEFWg
         gcacQzdf8QBsKLpRT6N9GsJ2iSdYFn7vifeaB5FdPMdZVtr1JObbxh5k8VDW8abc7W5g
         UnN2WpLiTQluGUNw1ZSGKi/iiD34W8YOKSUIa9fEXqdOKEr9kC6GQe2gf922bLD84tAw
         R9VulzqnLOyMXb1uF3tPbK8Ucki0MrJ2uHK6haauFnrrrzSF1n+9Ugx0D3ff4YnNO2oC
         Pr1u8LKZORkeq8k8c3moIanPsIHmVZjK34heVdDID+YOu/KH3kE1lONUi/W6i7YC4CP0
         GIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951386; x=1793556186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+SFE5KlwHSbzSppx2ca382HQJ58fWCk3G4Y1HJ+92o=;
        b=WPjc+yO+kre0wMt0AxYGyUtyxboB3WB8IsoV0DrA6oANbK3LjjdDmJuFGZLO3gG78y
         Vv4UqWSQB8zGMtmdRRRuL/jcLxt0LqVu9tm8t1XsquVlT0ZJZmvihG9U2oJ7XNh6fRAd
         neTCBcmluTSCxw+gXakzITYmborhFrE6qbYzo+H9vRhqcQBtjJMm31grzp6R6J4Gxyx9
         c1iARhdh8a5CPFjVR7kuUeGKOpGzdrAP+wEL4Rt5VsF2T0C76XKYTKZQjqneQbWbwVEG
         TP8x2Jco9xmeFstzN8c8RmBiBbRfwtOlq/jmbjDK2QMZcuCUV3gzn4sc9Qy1InRrRSaS
         yTWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEzLJywXy+SyVzTSt4l/TdwRHWBf6Y6hvFjchClqC4NprG7nrmAx/fShYwaAUZb+BH4XdrtxzBa6OOEkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/wGQ/5plSd9ButkzN/R9gcEssAOULLiGo7Ej2O4CYZE/KVUS9
	Cjh8OSZPqu2WU1IvuGbB9gdIbBIJXZfvlZ/BHcLyUjtQfa6Cw6N7xrIdQPyo22qL7gI=
X-Gm-Gg: AYBFou3e3c0uEks9HPHGyGdjFACWwmPEjtMns4evnZ4wjK6yCPYNQkntyiZeKLoU691
	pA/woy47LbEV5R5cbLu4qtZQs24P71L5x7mzwWIIvvwJqqaO7oZ5G7hLkoAkDu8gFeNvQY54mA1
	2KH2uX98OT6EmiX36NsJYvQ4ixiXlopY7b+BjxmUzrgn4KzCJ9AuPKdLoYRg0tFKgh6RKDzmI2O
	eqs29phEzir5kZW9mOY2ZomVqC3/itt63DNlkHgxEwhkaHVxixQbCovYz3GY/w2xva/64lroADT
	M1/HSU567NI4G8a00F5ksh6apDJgF8g3G133urE4TChFUArhWQ23681SnKX34uXb8oKLKHiyc/+
	tc8fCuaUpNm0oErM2r9K1jXrCj64Pqgml1tTBrL+0XMKYaNpVb2U2fDzt0aPGHc2lktNt2IQOGe
	imlCQK4CLlI7tHm4LvnX2k9R7pOWj3Pmi7MK3BJfVbFVO50G5VfI2VYLFvmxkppD+RCSezB59Ra
	GkaG5czE8RLx1AID9XI/1YaA/VDhYilq13yV2yTE1fci1TEuOzcKgwLE1kqyesiB/JWsdy68v4t
	iqZkvAlcOPNR9UDasjQ=
X-Received: by 2002:a05:7022:c99:b0:197:1233:e9f8 with SMTP id a92af1059eb24-1994f68a910mr6198140c88.18.1792951385683;
        Sun, 25 Oct 2026 11:03:05 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm24500775c88.4.2026.10.25.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:05 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH] btrfs: reject refs=0 subvolume without DEAD in SUBVOL_SYNC_WAIT
Date: Sun, 25 Oct 2026 11:02:58 -0700
Message-Id: <20261025180258.349175-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

A crafted image can leave a tree-root ROOT_ITEM with refs==0 and without
BTRFS_ROOT_SUBVOL_DEAD, plus a matching orphan item.  Mount accepts it,
and btrfs_ioctl_subvol_sync() then reaches

  ASSERT(root_flags & BTRFS_ROOT_SUBVOL_DEAD, ...)

which is BUG() on CONFIG_BTRFS_ASSERT=y.

Return -EUCLEAN instead of asserting, and log the inconsistent state.

The ioctl BUG was reproduced in 2/4 baseline boots (the other two lost
a race to the same image's unrelated cleaner WARN).  With this change
the ioctl returns -EUCLEAN and no BUG; a normal btrfs mount/write/
readback/check regression passes.

Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/btrfs/ioctl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 576cd76..00eab0b 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -5149,8 +5149,12 @@ static int btrfs_ioctl_subvol_sync(struct btrfs_fs_info *fs_info, void __user *a
 			return -ENOENT;
 
 		wait_for_deletion = true;
-		ASSERT(root_flags & BTRFS_ROOT_SUBVOL_DEAD, "root_flags=0x%llx",
-		       root_flags);
+		if (!(root_flags & BTRFS_ROOT_SUBVOL_DEAD)) {
+			btrfs_err(fs_info,
+				  "subvol %llu has refs 0 without DEAD flag",
+				  args.subvolid);
+			return -EUCLEAN;
+		}
 		sched_ret = schedule_timeout_interruptible(HZ);
 		/* Early wake up or error. */
 		if (sched_ret != 0)
-- 
2.34.1


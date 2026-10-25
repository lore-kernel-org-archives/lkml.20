Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951393;
	b=q1Q0bSinrxGJmB4zF3voK0zZZq3tl1BF65hJDPzzQWfKanLwWB+ZyoGGEtijegt82iH8
	 C5kU34dFhgTUJ9+K8ZLK+4rr1rl9eZto8wkLXlivpfrJxIR1H7LhpPiz3082wYFbGY4Rz
	 Srkynd3/hH328GiyN++72UJ2okKBCP9U3bjPbek7oBSLwqCAygv42LFn/8kGtITWi7Aaz
	 Cx5KbMpr8MBaWYyrLH0QtfeDE24bdtzBlM8XtW/1eLje2reUuA+74HTJbYvZKH3WdFDbW
	 S8XOLUgNp8nJjSLyooXwx//ShOJKbY0K5bKAaqDTNN2rEwcvbbRehndiaAOPTG18dtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VG1kakSy/ebeV5Fcb7mxyA3cU1SZU5ucHZy7SeqjczM=;
	b=3XAdPFfg6Lza15rWsNBrV3+hd/xroeLGlTlD3B/2znSSl2HTmvUpTV23bq19770pfK4T
	 5/l3iurt/AYMkjFulG8LdO/zijtsHu4M7wda56iwXoDuIGKK8ncGftGQLimt/m23hCGkK
	 /mwACobUTk47B9GZNs5Y7PfE1U2hj4KFszReov7qQYUGYl3p4H1qUnVLF+CuQ/nyvhObO
	 PJM5aNrZ4IE/uC2QI8ikBxbvBTnBd1/324hP5DNElKjJanCwqzEP2qD/9KGQSMmXoLNo7
	 q2FGLCnmFgoyoLjluP5g6kEkUKiR8CEj4G38BjxtSc2JXT5EyzdRk60ZVfwxncDZhmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QJzyqzmN;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26013606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26013606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QJzyqzmN
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-353804b591eso4287113eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951392; x=1793556192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VG1kakSy/ebeV5Fcb7mxyA3cU1SZU5ucHZy7SeqjczM=;
        b=QJzyqzmNSSDEj/DOGlwGG+4c7WgmcTkkbyWvUHwvOjDPxGmVDYZUkHuYJmeNxB4Xqx
         kmphu4T4TTx7qVzj+/JBEmCUOYRhpXX6kQRGEgfUJn1ICoY6sxMaoAih/bFPJpl3xzHT
         4OmKGdY4WEHqyMLIzXAko3Z9zUhVUKtcqLx7aJQkm1dHi8WqKvldaPviiDLtZJwI9+wP
         TLQbYb6wTRs+Api6ghoi+guDvptaThK3pK1S1Rmu0IrpvDEifFLmCtJq7rUFkZ4OxCgw
         gnL+AKpyj+IYHfqlFgecU0orKweeCrCyTWotJHsj6oUCvhAnTF1Xs0Xe3sUGe1ev9MAd
         EZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951392; x=1793556192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VG1kakSy/ebeV5Fcb7mxyA3cU1SZU5ucHZy7SeqjczM=;
        b=KIurUIKHGdQd71se2S3n31ZAf910dv6N/MAQcUbry4qza6gvnCioe7aa/80Q4QI1Xa
         UIYDk4vER3a45zoUezu9cZZXUPTu0dRlZpckcLS0KxG+n2abvFPh9KZ1Oofm/u48GC4W
         UDVA5Ho+SZtn331evZR6b8JpTjcZ6I4vsg0z8cZ+tVWg2pa1CxoCfSDbWGrBHVwYlHma
         5tP8gsb5YQNJTgzNAQoA0bWTskIlKhETeWeh751PmWotHIxmumoFrIMByWXYLHa9/oIo
         cdnRgChLUH5TjoY6ltx5Qv8giSkhws1iP63yZ34tZ0dMwdF2PsXHH+CReMqi2DNnLP4x
         We1w==
X-Forwarded-Encrypted: i=1; AKwUvByuH2jV/YN8u+ZHJMxD48Y8CKfQDdPvdH9/HjKPlJHsZiPRq9LajcNIjGrSp2KIxmljwOVCAVdKV40cAvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxsEtn45dkK58+FZY+2+idGngqP29NuboKYGBQO5dDNWiixX8b
	m8cqYGDBr29WsvI2BPFGPcP6lEry31GOtLF+u5171BK0oQvoNLw4mB5N
X-Gm-Gg: AYBFou1QI8tj2KCsqgNMMsLQXYX/tRqS/X5LXOTiQdvk32n/z9DM7kydXDfAhqfJ2eg
	Urw+FM9nRUay5aNQAG0HkFYwQPUBAKV8gOmqz3pX3KXpwyd5C1a5N05cQssr2XJuKkIIrDk9nCY
	JZbSUediCkh16eFIl76U5oduvYFpBihhT6rcQWMrbLFWOXA6l2U6PBXx1Hnwkn1zuBqvkIWbe0U
	Yy6hpXePGNZZ+cnDE/rtGhd4Bjzv2/c2+ncVLwKJi2CUB3ni1VtBtr9v8LfhtMdK4vKCgx7K8j4
	IfQmOuAyLuUx5BazonlSyjOFOGT4f3iAskOdAA2RWzewr6kfzudSjQohJd+xiZZjQl4aIhiRNf6
	0fZcVccGUbqSEW/AbMyZ7IQONSSvNjYEoDfDMwqICRS7Vpwi5k22oln+36Nytku6MJg3vgcpe9d
	q7jLkqcbcmBvB7O7TK63WzH+hjk9D2V0+zeDfIYHptWaCv4M0gi6pQC2Z3F2h85prL8O/YKDkbi
	4UnYsPFbVKa/ohLaUM/kT3NvHpzDQ3dEZfUg6EwPulygI2PJAv3ROVkG3DKsCuf4NUBWWER78+Z
	o6sdRbH2TtFEyP5a09FF
X-Received: by 2002:a05:7300:ccb0:b0:366:4c26:2968 with SMTP id 5a478bee46e88-369e84e560emr7285982eec.26.1792951391990;
        Sun, 25 Oct 2026 11:03:11 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm24657672eec.19.2026.10.25.11.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:11 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH] btrfs: return an error for unrepaired RAID56 scrub sectors
Date: Sun, 25 Oct 2026 11:03:04 -0700
Message-Id: <20261025180304.349254-1-teel4res@gmail.com>
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

scrub_raid56_parity_stripe() returns the leftover value of
scrub_find_fill_first_stripe() (0 or 1) when it detects unrepaired
sectors in a data stripe.  Scrub callers only treat negative values as
errors, so the unrepaired state is masked as success and P/Q
regeneration is skipped; a device replace can then copy corrupted data.

Return -EIO so the unrepaired sectors are reported and the corrupt
stripe is not treated as healthy.

The masked-success behavior was reproduced 3/3 times: baseline scrub
returned 0 with "finished ... status: 0", left P/Q unregenerated, and a
device replace copied corruption.  With this change scrub returns -EIO
and the replace is canceled; healthy RAID1/RAID5 scrub still succeeds.

Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/btrfs/scrub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index 479c0e0..ba2e27c 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -2250,7 +2250,7 @@ static int scrub_raid56_parity_stripe(struct scrub_ctx *sctx,
 "scrub: unrepaired sectors detected, full stripe %llu data stripe %u errors %*pbl",
 				  full_stripe_start, i, stripe->nr_sectors,
 				  &error);
-			return ret;
+			return -EIO;
 		}
 		bitmap_or(&extent_bitmap, &extent_bitmap, &has_extent,
 			  stripe->nr_sectors);
-- 
2.34.1


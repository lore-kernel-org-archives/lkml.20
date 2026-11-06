Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988493;
	b=Ie4eSI9xG8vSM72UfnuxErRcslvKqanvW1uo7Ukb3OOs1cB+hSydVCTfozRgYESNI6Du
	 pCXg/hUTS1kzGD/curURfm+B3CzioQV99jYLjncQ6VvfuhdOPdqY9iS9TCIQWdr0kk5Gs
	 mkvcBrRMDJ6yfG6Uvx8rcpQcpWuNSEyggfDiEeh6Tus5qCduf/g0G7/UTFrSwK7LRgsNN
	 ZC1RyGVZkfhb78loNbl4Qx+yrJ0cYrv6bMjwmNZxZzpZWQaaPvP2kPoblgg/kv8+sKpVC
	 M/wrWxTldxtZxgas5eDeKjGML4KCGlA9FV3eVxH0Ekr+/6wLxsin//2L+6F9olUCmUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4SY/KgBc5jPjR7kY6LZ58uTUj68rwgS+h0034ZsmJvw=;
	b=mzBKNa8LXztuvK4or684gPCBXlJrttdDsuRNmuk/MfEfFgc3gg2F1dgJ9YNWJj8NXSG+
	 nSCTAFd1PEReelp5V3XNwdC/T2nmyT7RrqfT1rNhcJXbPZbY9fRCWvcyTGOKs5A0VuTrd
	 mXHSdyZFSI7cKeS/qAST6TSY6lnbofkm6+CAQ6k8rguK+LIzDZgniHytI4b3DuYZ/rYvd
	 Ry/nLc4hSp5cgIPmG+CDjna7kqDzqFVhAnitkP8c5bHLMz6QGAWd0Etz610WrM/MGSVNj
	 lAKX8ubpuvrBIZdEiUMkS4lOy19fKpO7umjI4OgsraYblwBMs/YGa5vYsmfuEQIb3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eg3g87tP;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606AF606EE8A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606AF606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eg3g87tP
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so601383f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988492; x=1794593292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SY/KgBc5jPjR7kY6LZ58uTUj68rwgS+h0034ZsmJvw=;
        b=eg3g87tP5Bh515faKrCEqgJd0gAd7dhAmq53sTBq8Yr8HcVOUMAaJpogGoG3dXhm/O
         G4QmKXoXySuj9nh0JIbFuGxW7VcgSl45SpHMSZ8PYd0XU+EXnEWca1dC6+2TTFC8dg0F
         clW3kJPqtYi5NWWLR9iP/7CAzJFhshKFlVHKa1C/bvpcXKiyoRrdoq86+Iofbh8/TfF6
         UhpubSHgDbp3OAiynlOuFY+TeDpycXmp4uTCff8aTBOioOKzgyZFVR0SjioKBuUehMbU
         CiLjYkgsYHbEa+Y/H5eMMyFDzt8r1FuKgyk2tTDf60VtEJ6v+VPJQyV57kQPHiLsOisy
         XiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988492; x=1794593292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SY/KgBc5jPjR7kY6LZ58uTUj68rwgS+h0034ZsmJvw=;
        b=BplTzkf2Xa/9N/l+B9YAkCdalv9ok9rqez2WTCeKHd8eBn9kt3A3PyLQoM+NEV+WP4
         /0TLgFTFMfi4FX+D31ISqzZtYSS+V3E82Rqo1Oah1yKaJQv128mazjrO0Py8OnkfXKYO
         V3aeu2IjMR/frBJaAsSHEDvRnzkIztyvm1IyO9IbGmhRQQ+1EByuikPyI2yKm+1iItSm
         V3Iw59tLHWhKeq1XG8cRavsxG4Cu84lWSXUqHJ7jT6EFpHV1F+v0koGUuulwyy2tlOlF
         vRWE8zqeKAhOKM5TdVDCzopKEwOGuBCaFPdLxXVKzCzS7DGj8qKsyAvE8/eahPONiMba
         cRiw==
X-Gm-Message-State: APuU4Z952E0+bi87kEoghVsF06BsS0W5+b/5QFqqtVDKfeodcqpBxAdJ
	70TlM3kks1ho7i1umxWdqi6tZ+8US05kCrTs51wtVpIwSuN49tTgogvD
X-Gm-Gg: AYBFou3SyfHUN9Iud//piYVT4fxJtpcJyccMkI9a9Uls6XYu38ieoJRKF4RkS7MeeHZ
	/4YUkJAvZV9E/Lz35bNCLXJuHce0YXL6KXLnbxvB0WteGDzXY1zifK09bA9zJuDvE85YbwFbsMW
	1f4gjsEUVUKE8Rxvdj7AVGouEJ0VAxZAJNOaQMHfJkrFaeBYzMh3k8YxQDnATDuROQQseWzcnTd
	ZUA6KTUglMC/08G4Rv6D+LFtWSdlGmx70FBs/Nr8/utmBYEo0smzHNvyf+xCwg0+LAxlii3pWWY
	2bY+dAbVZ5TUAFyh5NRwnVOCYCy5ZgPwiCxwFVxjgY2nJRt7l8OVS5TcvYv2JW32XbsnabLuA0b
	85tFY+SawO1qz9gmb65Rh0WLVvmi02icOgkvORfbD4z6Bm1C0lH1rrG1no+PaW7jGNiNoX+bwlT
	s0iQzDJQQ1+zvM2+463HhYBdMmZ3wvDkpHBqxXZ1oSHH6eGdOlr7YEYS2lBLVPNVIc3z5DKfnrE
	WYstadRtOHED5Lvntjpqky0/qwqRfMee+I71v4NU8m5Jq+KdHVk84zacNZiqw5qFJpyS7xkshiq
	u6JOSq3SJJjbprV5IP9Ou/BACZbAyRkhZvM9mq12Px+cRQdxn61KhEwGAtMf3D2MFCoJPL+AGWH
	4fALkEyyrQUOMuoU/2EPgyZ7Zm4rnAbceDiOQAFHZC4kZLDWKY+zIjErU3BfO
X-Received: by 2002:a05:6000:4818:b0:492:820d:5e6 with SMTP id ffacd0b85a97d-492820d0d4amr5606669f8f.49.1793988491610;
        Fri, 06 Nov 2026 10:08:11 -0800 (PST)
Received: from DESKTOP-IR7J1S9.localdomain ([105.99.148.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7232832sm4830636f8f.25.2026.11.06.10.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:08:11 -0800 (PST)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] dm cache: fix divide error in too_many_discard_blocks()
Date: Fri,  6 Nov 2026 19:08:08 +0100
Message-ID: <20261106180809.1419-1-drifabdelmalekmohamedsaid@gmail.com>
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

too_many_discard_blocks() uses sector_div(), whose divisor is a u32.
discard_block_size is a 64-bit sector_t that calculate_discard_block_size()
keeps doubling, so once it reaches a multiple of 2^32 the divisor is
truncated to 0 and the division traps with a divide error. Smaller values
above 2^32 are also silently truncated, giving a wrong quotient.

This needs an origin of more than 2^45 sectors, which is unrealistic (this
is a thing still in 2026!!) for a real device but reachable with a fuzzer.

Use div64_u64 so the full 64-bit divisor is used.

Reported-by: syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3e16980543e238b95bd1
Fixes: 08b184514f65d ("dm cache: revert "prevent corruption caused by
				discard_block_size > cache_block_size"")
Cc: stable@vger.kernel.org
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 drivers/md/dm-cache-target.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..2d40d6047ef1 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2383,9 +2383,7 @@ static int create_cache_policy(struct cache *cache, struct cache_args *ca,
 static bool too_many_discard_blocks(sector_t discard_block_size,
 				    sector_t origin_size)
 {
-	(void) sector_div(origin_size, discard_block_size);
-
-	return origin_size > MAX_DISCARD_BLOCKS;
+	return div64_u64(origin_size, discard_block_size) > MAX_DISCARD_BLOCKS;
 }
 
 static sector_t calculate_discard_block_size(sector_t cache_block_size,
-- 
2.43.0


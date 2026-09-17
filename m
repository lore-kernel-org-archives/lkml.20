Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA713B14C2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687629; cv=none; b=tSfeWJ0wcWqIBxPAbdmliUi/CkEV8iH3Ld7PjG/p4or2CDG+ERLYhYVMj0QXhT64L8zsnV5ccO1ZR7NN4QV6RwoD4Ko+qO/9bJrw9nj9OGnKT7vKIUwxKMqeNiQ/m9Dw3Vo5q5e2Ij9xrtx1qlqwe/P13rdX/JM/Zdmg6obi47U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687629; c=relaxed/simple;
	bh=yBKr/eFWCN4LJ8fao7hTzzhrSJaRfcKNa2vNZ9IH9ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jp5KJRCzcbInxV/QU2I0Nu69YE8RzvAxWeFqidktR7qbnWdcctPWjYJqh0+fpO5nmVBTTu8icZ+j8tp8pmBggUUfSvhAehSvIKviZev3aPRXKR5gjZT4p0e6g2rMgVe1gwEWy9iUQhQ5dBbiIm4NZyDA1HzOzdgcMLsJTyOiR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSCmdgHa; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSCmdgHa"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso88646b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789687624; x=1790292424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRMvyEtwaxb58dn+Goh2wKcYLRls4e3sN7FSxEQqpqs=;
        b=GSCmdgHaF4j4IZ4l390Xz6j4vRJiA9p5JU8AIEyYMbV/0DbG0yWLB0nLWTrWDS2jGf
         XBVzZ+41TMt1uujSmHL0+o/rzTnTYutveJ6aKmU7ptbtV4Gqf7hv4ph1hHfW/pa4pqZc
         ENSkIJoWLQjj56Nnr+K0CUfdYH6bPXS9xEX/CIBM/WEt3cdYMeOH/LBbP4oH9nzAHkwk
         dpyAbkUgS98oLAisaXILyWhGVWccy7lUMZr3zYrhkjhx/EE10Fu1y6z4iGKsxO0KklOq
         iZdcJpqp3IxS8H06ozpsWeNl/2z4Wy3jsgDY8k4E8MzHTWnRl/ONc2PAu9PSFJzloxDc
         8S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687624; x=1790292424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRMvyEtwaxb58dn+Goh2wKcYLRls4e3sN7FSxEQqpqs=;
        b=HfmBGGMqGeC/bjU6Bh1gVQDfdomvgBYx+kn/5V2yq9LgVYATFW2gZOfpl/I/IDfEnc
         IsdnA2jr71zUEdrW+BFeqFxXzhLqaYX6Ka6Y9cj+olcZyYmMrtobeTlWC/zfz1F0nsIa
         ELGusZ2xbzWnix2OpPXrE34+9iVxf0GGiPHAo3CcdxMNHnQ7pa3HLsqRM71kOGnKGzkZ
         HFFuEDBHBtjJHMiD8qQxst/i7I4IiDBylOOcl9YZldEIK9RGufhjo9jvkOTr4FzCl7fU
         NtvoIYgIJs4k88S4/YRHCRVO+E9K9x9q4vydkLmQLIFlkYjUMBF83hMSzrhWZaywfKU7
         vcqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPoleS/H14FNDTjErqOhZVIZgCTtGruAwLLDQ3JFgDDq1/DuqPHKgy0hG3WaZ167wp4M6lja8Jfw1ofa4=@vger.kernel.org
X-Gm-Message-State: AFuF++nil2nE2oXTjMs0IvOm3DtewfzVSxNs74LqfgH2qn7HR+6Z2GmI
	SzcPvOC2WeeGbBw9HdGEQJR1s+xmeSCyiRSgbp3Kt+HIQ6OFxYx/Dp6X
X-Gm-Gg: AYBFou0gEfJ9u0CjlDkGfewd0m2mfcJWZ/thQz8QkWqcoa2x1cFRFsppNC+g523ksy5
	Znai72+gWGkv9k2D6TAYVGR3G51P6JFb8b60IyyVyxRNMcGedz/f61+PZ1BVYw7Rm+rEbbr9Vtt
	PKl+4fsTSVA/HvG67P8Th4o5b6g7G8uEPkKpAOeokd3o4k+t7n3uyur29y3em3k8LLauxijPt2A
	lSZqw7hmQ8XSX2ZZjuU5zu6TjBp35053jE2sP6d2wZx93GeLvIMZ4kw1b+DpJusdfzRLs08jfCy
	17LEhWV43fJKVZ6+dYLO98kOBp5JoSBXWgHE43ScJ81eCBMyWthwe6GWBuJ2sfxpaMK4Uck+Ql8
	f+NphPViVZA8zN4dlNgYXXvxgC8b3VhtOdz0z7EMPjBfi91dvlx6UajnK9TZZRFYeIArwNoFp6j
	5mWcPBMGSsWKMRMdJvjLlLr1uB9CGWpExxOt3LHVP0jR8tpR+drT0dPCZgDcyt8Jf6K0xd6cTii
	7bSULOb4IF20He9PyiN+uAho1RxFPR6BzLf4/kF0ee4Tnq+dToPohODbmz3OtnogyH05nBAAYBJ
	SH25pctIL27c/f5+NtyWHC6PfkD8+dNQMtivCk6LgO6tpGs+
X-Received: by 2002:a05:6a00:2192:b0:85b:8606:627f with SMTP id d2e1a72fcca58-874de70f424mr1059860b3a.26.1789687624373;
        Thu, 17 Sep 2026 16:27:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-874b37cff50sm353903b3a.19.2026.09.17.16.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:27:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Stefan Roese <sr@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: mv_xor: protect MBUS window access with a spinlock
Date: Thu, 17 Sep 2026 16:27:02 -0700
Message-ID: <20260917232702.127923-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv_xor_add_io_win() reads and writes shared MBUS window registers
and updates the shared win_start/win_end arrays in mv_xor_device.
Multiple DMA channels can call this function concurrently via
mv_xor_prep_dma_xor(), leading to races where two threads can
select the same free window slot, corrupt the registers, or produce
inconsistent cached state.

Add a spinlock to struct mv_xor_device and hold it across the
register read-modify-write and cache update in mv_xor_add_io_win().

Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use guard()
 drivers/dma/mv_xor.c | 3 +++
 drivers/dma/mv_xor.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index c4e0dce3ca64..da8eea8789ae 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -494,6 +494,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
 	if (xordev->xor_type == XOR_ARMADA_37XX)
 		return 0;
 
+	guard(spinlock_irqsave)(&xordev->win_lock);
+
 	/*
 	 * Loop over the cached windows to check, if the requested area
 	 * is already mapped. If this the case, nothing needs to be done
@@ -1345,6 +1347,7 @@ static int mv_xor_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, xordev);
 
+	spin_lock_init(&xordev->win_lock);
 
 	/*
 	 * We need to know which type of XOR device we use before
diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
index c87cefd38a07..034db4d0bfb1 100644
--- a/drivers/dma/mv_xor.h
+++ b/drivers/dma/mv_xor.h
@@ -80,6 +80,7 @@ struct mv_xor_device {
 	struct clk	     *clk;
 	struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
 	int		     xor_type;
+	spinlock_t	     win_lock;
 
 	u32                  win_start[WINDOW_COUNT];
 	u32                  win_end[WINDOW_COUNT];
-- 
2.55.0


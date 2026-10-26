Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011859;
	b=xZNaqLOf1K+FjOm3qdhKNFwdgCHAiiM5BK+G2EAS+vNeH5C5JFXmLRO2fVuHUJcihK0W
	 l74h9ZaL0imE16p69vnRpu+DGN0PgPoFsMofjx7J/+KtOfPGOitVKiBcVzVJ/9a5gyPwy
	 MossMKopFND6IIXsdOAHi1ZOUjKHsAcf13TMvZWfvsTxKLPm8+a+76x90dvuiJvBViE6b
	 H527KbHquWFIaf2wa6KfZGMmOXPi0hmM6t7zbA63EKXSizxxYY6Hd7bDpOjD6uCkhsitE
	 FgYfn8C5IthrODXosmK/+JL89YlKEVu/iIFNjDeZvJHUJGglpGqIXV6TZeFbulpxKPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=io9R/T28rLxuixHyPNzGTDg5gzAwHn6Z3f+jZaKGnbg=;
	b=xrtrBnhXiYLxGSdsNED8HuQ3dIBGZStDjb7uWE0S4ngp9Aq2oAR8kLlTksITifP2eTLT
	 793w5WBnFSo3R1zUYuuMNkaxGO4aiXfO2zhUFEFyumndi4y/KICvZTUHoEp2ESHXgVo9P
	 JrF+WVu2xUrxO/GBW+/I/zpYPFK2zG3oPT4ged+hzgiJuirbOm/ouWYs5MMGTYoG66FHo
	 7h1k1rlhrw8eedd7kD7yF8EvL15qCyN1qBcJKO8ozljiX+Tv/Rk1N1e4uHuI/rwV/fsHO
	 UxzLirINia8aGE1qsIa+i/kJ1vlU6MlmVUS5RV/QZ/uL82lvq2XUtRaf9CTenKu1I7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qdsfYTuN;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1B60A2600
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F1B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qdsfYTuN
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1846bc43c28so2805562c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011858; x=1793616658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io9R/T28rLxuixHyPNzGTDg5gzAwHn6Z3f+jZaKGnbg=;
        b=qdsfYTuNVXaSoZFC+xuqtBgzf7JsipLUfpCI8/A3IvgWPe04Q5JdgSNszJtTypor1A
         fEjXmOnj0I5sCkZS6QeNfXGsy9dR5dWjEc9/vkL2/hauyN4tRhupYw2uBkaJDStkaCwL
         RCrMmRzEa8jj+k4JlelRucf+SBniB0xKiQKtXgzOgfRoJSYHh2TBe0fp0wkLDSRVIGYR
         HXWaQaUldWt52Rs2jk6WvXUSR7FOf6bhLB109yxyDmIQl+uL7fGRyM0WqlTw0uYNR1j7
         6m7yXMSI1rTvyf6jgIe9p4dYx6IBTbyZw9H56iEeaoCa+K00JmAGodm7L6dU9kByzvtS
         DBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011858; x=1793616658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io9R/T28rLxuixHyPNzGTDg5gzAwHn6Z3f+jZaKGnbg=;
        b=kcVfK5XILMEGJmDlT7mLStX2a9y3CMhqgHazjCookaJKMhEWo9RzJxrqaX2xKtyvot
         +9MEl8rM9oPqz5apFMQVFTz+ZCkvIivTYpww1RoqbuB9KioWzB36aM7QNzw0nc4iRMHO
         9lDv/VuddWuh9Cqjv/1X3YFyuHsbcKYwoNUW+f58YBBfEPHn8xTVmq6g66+h1DTmR5t1
         lRxfOEf4rh5NxUia0ldnabA853rNu6mJShajXSe7GSTltAQO89ZAUdakiS97xiC6yIfF
         iCceOuTZoCV/77MvH6m779QLY/DED97+L4LDiaCpDY3Ud9WdSHZhmR0/djsETlWzp8JD
         l/WA==
X-Forwarded-Encrypted: i=1; AKwUvBz02FTc51NpUAQcRWXyC1cncIviwqn5Fc4sPG6KRVbWv560/Ei3vQAxN8GqtEzF9/hEVv7DPFEfh3hH3F8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx0MCTNIdPuaKHdFhxQdaBH0RL028NgNntXkLpJjszahbhitsL
	zDNhW1v78RtT+jLg990ym34s5UcDNV0SaZla62uO6q95aNfuHvMkmm7w
X-Gm-Gg: AYBFou3DuD5FqH47Bo+5aGhdzWeRv0EJO3zuKqweAacBOceG+JAf98tWP4SsDkr7YIV
	Qbh/JMWNMncwGhs+rY3Vg04y5jXb5IpFniBdZfo/ATykNcItVxmIJ8z1c+5ePXRMQBTlpibKoZ0
	2AWfvTAOVKkPcFfQCZSVUFSr8D0txZbEvxA65idkLYOIPzhPPmhb1PhMGcyCsX8BieaSi9zC+kh
	84zy2TNCLY2d7JLtxnvhDZpqtkKMvsUeBjSNABy7p+JeAiUoK1KFe72AzuamR1y9r+Ls6VagSl9
	M5OGM/9mRR8d9GuEA9n+I3HWBALi1/jX3NviChrnvK/d9u3IVlQtL27jnse+L1jAMblXY7fdZ9X
	EfolHaOSr7sSEBjRuro8qFtMCxBDng2/ofZ/krTaTOUGGefXjnugZ2aSvmIJXPxCEVz9ZzSh9s8
	9LMcmSe4tbOglyHhnIOqR5RloQjpbElmUapB+xf9IkGb2rgwVDLmkcA1yAZtvcgSx+UwBGEYwlp
	/RNq/BFrDA4UCoctAi8+PrLV4gfjgeCouwnvUU4ylwS7hL0AEs0/g1rr5zyymkxfoItVNtVzxQN
	jRNC3CMTHhadwz+KO/4=
X-Received: by 2002:a05:701b:428d:10b0:16a:f5cd:365 with SMTP id a92af1059eb24-199292eea46mr9977300c88.5.1793011858226;
        Mon, 26 Oct 2026 03:50:58 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm27897863c88.6.2026.10.26.03.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:50:57 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] f2fs: reject MAIN_AREA boundary underflow
Date: Mon, 26 Oct 2026 03:50:40 -0700
Message-Id: <20261026105042.1148554-3-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026105042.1148554-1-teel4res@gmail.com>
References: <20261026105042.1148554-1-teel4res@gmail.com>
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

sanity_check_area_boundary() computes

	main_end_blkaddr - segment0_blkaddr

as u64 when main_end_blkaddr < seg_end_blkaddr.  A crafted superblock
can make main_end_blkaddr smaller than segment0_blkaddr, so the
subtraction underflows and cpu_to_le32() truncates the result; the
function persists a wrapped segment_count (0xfffffffd in the
crafted image) and the next mount rejects the filesystem.  The
same path can also leave the error workqueue dereferencing freed
superblock state:

  BUG: KASAN: slab-use-after-free in f2fs_commit_super

Reject the underflowing geometry before the subtraction.

Fixes: fd694733d523 ("f2fs: cover large section in sanity check of super")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ea2d218..b90831e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4004,6 +4004,12 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 		return true;
 	}
 
+	if (main_end_blkaddr < segment0_blkaddr) {
+		f2fs_info(sbi, "Wrong MAIN_AREA boundary, start(%u) end(%llu)",
+			  main_blkaddr, main_end_blkaddr);
+		return true;
+	}
+
 	if (main_end_blkaddr > seg_end_blkaddr) {
 		f2fs_info(sbi, "Wrong MAIN_AREA boundary, start(%u) end(%llu) block(%u)",
 			  main_blkaddr, seg_end_blkaddr,
-- 
2.34.1


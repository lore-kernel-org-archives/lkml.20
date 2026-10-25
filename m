Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951347;
	b=LyYCvF7X95cKRIopaSECvvxQQ0MjxTez0BeXeR/akafwmTmJmI4wzHHKrBtJqYaEspLO
	 McLdTp3Y/vhgHmMxgUaYESgRM2n8ugQNPvrSE0ZGuWXh76J3XVek91+ExXfwjE9eUKinA
	 WE+5spiak+ZGnt7QE9E3U2Mtl+EQ2jHVTqqHZFOSX65MBzcfi2FsnuWhgAJzKk+FS19ju
	 maUm9UgDeOpSLGhAt2H1x8GhZhmyuv1vm7yXJF+jBej65pCBI2j6pqqOUGik/OtQvKpx3
	 jBUYz4kw/PeJpSIqagevyY7hkNIyJ9TNv89RkGnDkh690mwvXMEzWYeFA/zoa3lT1mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HG6p2VhYaveHd2iyf+ain0rK/+tVMy3ciGMFej9wyxE=;
	b=dW3HgiNTvIO0CeGeRJxroFEues8hpySEqIB05px+3EcBdGpNYlFxJpDEcXKuulr3XQho
	 lkFqbnIizSQhbuuh1FL/+yJQiUbEBvJgJPuC9PIfPgbPLRQ4BJJzD9XdeO9zlRFg0KCM8
	 hy1jfYGaMQc//9QuaXjmg1sSlj10noZVCCkrAVmp1tidML7Hm9tlaCAOm9DAsDHEV63Mu
	 ZEz5D4wz4AG3QPOB86azHPR1MIpvS1a9mO9ihmNDaOoEeMfUp2xw9xR400ubvC1joQoCy
	 y4Up7ONvkcQ3ePGgpGW6lL5PPKQD50mmVqumZW/9CAFPIWgptx3288DUpBu7ElISnEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=deZ4B0Iw;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360D4606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=deZ4B0Iw
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2736958c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951346; x=1793556146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG6p2VhYaveHd2iyf+ain0rK/+tVMy3ciGMFej9wyxE=;
        b=deZ4B0IwQh88uFCyS/zDW0HJBZemNlpCeNaA6+jJJAS3kXFh+eb2lE7nAm1+tWmJGN
         KZ8MNh/1d+42xvakiZMLBe04KKo9YUk1dQuDqPjhHslY8yPOYEaSwZT5uxSIJSEsShNr
         LC4WQWv3FDUKdcRlFVDxla3CgAxCS1ZpW5U4blLJkBVN7S92WheCsNeII5ahOdsjp73/
         mMxQp0fJD9VSWdZ04gaBY6mmrG3perfBZRM3sSjSDUJvshCT4o1Qz+t68zxCVb6EHw5y
         2IyjorCdy0ziZqyHkzDNtq0zaQ1STNHNOt9QR9v1bqbx/ois+KWCTaJ1/u7sQpNPMgDH
         QfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951346; x=1793556146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG6p2VhYaveHd2iyf+ain0rK/+tVMy3ciGMFej9wyxE=;
        b=0rAG/A5fPq9h5p55/yVUhEgI1zpDaXTEQugKToEGpr4gPwfVpJwwBKHTEXW6g4iikP
         DEThhvp/2G0E6zrePaxrVf9tsXUdFIQQ+TNsxFNsmpmZ9YvVA/cweFFhfJfNgYnp6AAC
         RxUEZ8f3ezaGffrw9+Xr1pQxVmn8WCl50+glNBI0vVE/8pJN/9O0qFD6n4uJKEsMbCwL
         iyBTmTFGp3FmO9ZVNCiC72t9wZA7ER2jlW73MknI3QZyGIr64m3WDrobq0urwZWo8dXa
         y+kD3rhYPOwyLQY8Y1Zl4uoHj1iN+N6N2uecP/W4YJQxb1SbA/OE2O3kMhPxuX4WSYi4
         RIig==
X-Forwarded-Encrypted: i=1; AKwUvBymA9stBfnanvRdmDK4TnXsfNYJqj+ExdrWoYPDAjUlGUN4diJuIkDkh6muqzhw5zfEtxt9mQZ7Tnf1AZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTuLFt7M38UCrld8+kElmjA6iyqd5KhXP0/HLjeoiNbjvMtSAL
	BMyvBbYQt3j8sR0o333q0SYm4p6j7tYiLZdKcNsoefa4gwe6sT3f0MfZ
X-Gm-Gg: AYBFou2DPCwut83assHshqrJOBGcFxyejuyPw+hv3d0lsIFhhPPOseOQr+Xn1MV7Evd
	tGQdBbY2cFd56GGISR2fBloZ26b5f8pLCfODxKqo+T62P0K0tJfpcuaupYM5Me6umnVcPOyNcQm
	QYqG6ze1SmxncHIEjLdUyQugnDPz/7bY9+NxXbNOcfkq2QT4oTavmFbDBzinJWhqTgG0TrZLbJK
	WJg/0O91221L3PheEsxkYeagYftQdFUw7VACOZbLXhDvsuxGs2HzMeuZfMaFiGt5o4xBOGK1/ua
	keBAhcqEBR5aQjlqQA06N+/8ir5lqMfkqM6BOO9+OeG6O6dr4dKLYPPB97AwVXkHR2qpqRQPfFR
	CwwPgV51GkFxP3HSGJu5ahDxCDH21drZZklDL3g+6tVbR22lxdV6Z1/7CeBCQRHGlOOWp/LfPNZ
	HNOfEIziVJSBJKOIZ0PZ6Fs1BAcDaCc+Xe/bvEJxPSCMo4cGCXfGrqo2YHQKVrvdqg2XZP+Gl7/
	uj1FJTq3y3YeM2oZTFaXVMdSlaVmjkhpZRiw2o0cYVuJbakRwvVD8ZWPqD2Q/9odOO7EpDhXsVU
	2aXLNMSbYWeeo6HHq13g1CN+MzcBOW+KYtzHyRls
X-Received: by 2002:a05:701b:42c9:10b0:185:4ad4:3d15 with SMTP id a92af1059eb24-199290fe3f9mr6829045c88.1.1792951346125;
        Sun, 25 Oct 2026 11:02:26 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm16099227c88.19.2026.10.25.11.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:02:25 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH 2/3] f2fs: reject MAIN_AREA boundary underflow
Date: Sun, 25 Oct 2026 11:02:06 -0700
Message-Id: <20261025180207.348498-3-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261025180207.348498-1-teel4res@gmail.com>
References: <20261025180207.348498-1-teel4res@gmail.com>
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
reproduced image) and the next mount rejects the filesystem.  The
same path can also leave the error workqueue dereferencing freed
superblock state:

  BUG: KASAN: slab-use-after-free in f2fs_commit_super

Reject the underflowing geometry before the subtraction.

The underflow was reproduced 3/3 times; the patched kernel rejects
it with "Wrong MAIN_AREA boundary", leaves segment_count unchanged,
and does not trigger the KASAN report.

Fixes: fd694733d523 ("f2fs: cover large section in sanity check of super")
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532044;
	b=HirB7Cla8KnLfc/G8D8Cq7/Lj/d8rqPWLaNEMlie3bpPghejQESDOHUiv3oBRj15dM+q
	 oL97Csc0IZUM1b+qzymhSzUDMkpwzsfP5DgRAUT8x5rmkW4t7dbQN6xZOPdnl5PqCzNjH
	 1ydS6pb4wT7R/Krc/WxEIkvzfe41ESElYDGuz1Ox4zWPMaMZyJmGic40+nWLcNRQzLA3y
	 iL2A5U63tHOLrcIBkl3tdnw4KnCaCg15uriMiTst7VSnL0vYv000uaBUDREoGxOoH7ACk
	 IDhmdHaaUoEHNrOwCzrPl8ms7fNIPVQ6Xf23Z2PjbFlCXTX74ZCSqmUe6tBR2qF+U0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WGufi/bwWbbTIvdyXgqACjmyq7Tin8ajjNPLp3luYgk=;
	b=qEhEkpVuttCUmycwrPpWFUp457rhZ4CJuIYfEbFRZHVC4JNHimVOpfLv8QprcWFP48k0
	 mjFMY3zGDyPJyqP+GW1NIIjsealec8+XKw9Dj14pDnqjvsUkl7noRWStOKOhkkDzDJGeh
	 fHyCJJ2Bsq/CuFIg0HyuT1oeFEL+6u0kizLthhQbN5Am/QMN0gz+OEOeBpTdpVKIBlYTF
	 pegFwDGNZ6vbARRC3pF8Ix5levCLNmDD1oCJ0+lvWa3SyjS2ZAA82lQDp/LPFypvZDyfp
	 pw0vVQBem35FFpFAPXfkxZHBkjp/LxxhwOufgJM51fl4/D9KCrb/qpuc2fiLCAk4oVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NqRjbK/f";
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C348606A896
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C348606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqRjbK/f
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso15466551fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532042; x=1795136842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGufi/bwWbbTIvdyXgqACjmyq7Tin8ajjNPLp3luYgk=;
        b=NqRjbK/fV5njaSKSCm1+qeMv0xerX5QotCPee1e81XnxztzDBjjhbSOUua1bXvlhrv
         fcS2HjkvV/cMtjgrJj4edk7G4QjXsyCZ3Hrptrprj5C/u3pQn4UmqFTpMf43oSH3n399
         c7cH7YDf6W7CBqa8fxPEU3Dfi/pbGUj31ph4fjECGVEn6LXBrEx6nI4MWypaFc1aje91
         6CHwdGPDlkZdwBqTcOdhMS91FnVJ1dl/KfpUp6B/Fj30/RxGjfV+rxN31tpFTYj4jn7Y
         A6DPure+lldZKRz52Q4bVX7Mh/0eJ1vpqJJzOgr2pjIloBfW6gxvL0wQXvEQ924Kd44y
         mIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532042; x=1795136842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGufi/bwWbbTIvdyXgqACjmyq7Tin8ajjNPLp3luYgk=;
        b=Ml5N7YxR1iqohL0XN2my59lULw6ZQnIfNtvHY/8f8JIMbeaNmowbrJ9Q9+m9gPHzEh
         ETMHtvMTVGk/3R7rCd/JQzB302cUUnVfgpft3MZmiJIgzOACLWdvA/5diSoaEM0ufGNd
         mReANRdsiEAaF6Ed5Xzu8CSxXdqyfcUt1zmAEWdTvRIuCk508v5VSulKbzvxqSSJhRak
         z7pTGyQpc0oKzSq6ccJrj4RZK2VJCnv0AT56HXNW7l4p2KvwNP0LrDz8qKXW0qnxTmQh
         EthIdi+pIQAiv7wz/vgbFUQxSH31TPOubkSctHBo4COmn5oxWXeoY9ddq5kvslYQ07vH
         WDsQ==
X-Gm-Message-State: APuU4Z8d8JOsd9y3fU7mbBHl5lBFAOjSpvPhJFCsDu+3Uzh+ywYpqXUm
	8AmZ9kGO3RpPgw7qghdS4t7ib2NKZuEURaAyP4goh0uZlhMDaWsb+wjVF+TJDM6wZCM=
X-Gm-Gg: AYBFou3TrdADTJbw3SlmtwfVseB+iisn6M8bdi0IegnD4YCewOsSznMKHSZAe640nGN
	YGFCVo83B7JDiHcIkfF/I+WvZSS/gRiFGHJ6AuNhDZp01zY6kg4iy/6yWJLH5eOs0tTMwY5ZlUe
	XQd85LiAYW2s5gV2Jf7+Q4XhEwPkFxGImnqSrIEcsNnk3E4PnnZeiTfZn++xMb8Rp1wwgPvjdmw
	44r52lEwY/Pz1ntkxBpl5oDrvAoN1RZRhygQgGrTA9ABgL/eDSmseFEeZsgXvW8GjRGEzxJw0O5
	wkHZKtuLxshGjzg/1Tx1bijHbzo95qoFIUvFiznYTbJsdQDA7tF9uTQE5Q5DDTCskQeZWVfjMiQ
	1Olio324sgsxFoYEjuDNs8Xs728UrpCzNGOkJbzsJelM7073i7J3JTPsmKqf2dcJNbBApK6eWEn
	xnCC/QYVpfBr0wtDyk6lXIY1f4XerMDbDSwO84kY+IoZA2nIvcUHbHf/f6MGHhTPz4C6YKUPRW8
	yVfinQl0/1iftyQ7EsMVRgslERxpGGdhuc6aCFTf1e3aW92OgkoiH9qFM6vHG/PkC+l4Cnh0aIY
	YMNMd2SjY4Qr0XKp3ZqpvbcgUTjSh1AeMhnP8xSvDNWC8IMboPgy/DJApRZXAcpZrnGtaDtZkql
	mZTLKYRTs/A==
X-Received: by 2002:a2e:be24:0:b0:3ab:4e70:6959 with SMTP id 38308e7fff4ca-3ae1c0008bdmr10989291fa.19.1794532042255;
        Thu, 12 Nov 2026 17:07:22 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:21 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/10] drivers: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:13 +0400
Message-ID: <20261113010631.139191-9-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 drivers/soc/bcm/brcmstb/pm/pm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/bcm/brcmstb/pm/pm.h b/drivers/soc/bcm/brcmstb/pm/pm.h
index 17f7a06a7..041b7ae96 100644
--- a/drivers/soc/bcm/brcmstb/pm/pm.h
+++ b/drivers/soc/bcm/brcmstb/pm/pm.h
@@ -64,14 +64,14 @@
 
 #ifndef CONFIG_MIPS
 extern const unsigned long brcmstb_pm_do_s2_sz;
-extern asmlinkage int brcmstb_pm_do_s2(void __iomem *aon_ctrl_base,
+asmlinkage int brcmstb_pm_do_s2(void __iomem *aon_ctrl_base,
 		void __iomem *ddr_phy_pll_status);
 #else
 /* s2 asm */
-extern asmlinkage int brcm_pm_do_s2(u32 *s2_params);
+asmlinkage int brcm_pm_do_s2(u32 *s2_params);
 
 /* s3 asm */
-extern asmlinkage int brcm_pm_do_s3(void __iomem *aon_ctrl_base,
+asmlinkage int brcm_pm_do_s3(void __iomem *aon_ctrl_base,
 		int dcache_linesz);
 extern int s3_reentry;
 #endif /* CONFIG_MIPS */
-- 
2.56.1


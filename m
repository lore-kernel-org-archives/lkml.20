Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A152DA74C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510200; cv=none; b=GG1zpu/OSWqgei6amNBidav3ss/7lcMdatcefrw9NRvLYv7gzGGXxJexOMTo/UJ38eFexusE+WchkM/LEDII4UCs2NfXhgKNGUo7hns2ktKPWK5ud0N+rBT1j5sILtKPT7gK2FK+6GrleZBJnBsL/Ym6WeGwn3kbcLNGFRSebbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510200; c=relaxed/simple;
	bh=l6K/sFQv3ASRbSDCtexMzkpOqNFTR/2cH63ptPimFf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUjPZ+6WkbwZ+PLwIzkv5ybE6jjU+uTVpfuGwmETISWgqkDYdpesJoSKHWHmiar09G4wy9kQ0cy6HvjE9l3PhmgrolVCQC0POoP+0TGVwTvsFdpO2ZrP5kcgrsQbzl932f3ejwWB+o0xgyuMqmPtxUkbubJwkEU7IyUvQecLEWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMPwLFFK; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMPwLFFK"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49e6eb11e9cso11269485e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510196; x=1791114996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=msADhsoRTGj1IyLzsyfhlBSSlDWgsH8eeKkmP39j+1U=;
        b=gMPwLFFKSRIzpRhyLea1d22A5fof9BcM1j2MHW55Wm17/qvxSHat/jXmuYvWNwluHa
         QChFb5tq1L8OCfymfu+1KyyffrQlY/WMiPEWhg4fd7hLgaEBoFIfdDNPoUaPBAkB9RCd
         RwuHoFLEiv2e11M18nmYxBfhs++ZMTwi3KQvPBVovIX48JZUgD+MDL7tuCdwCOJBeU1L
         S34cMhIRwnjFY11KXz7gawn3YwrmI43FuNchTe29BeCtjZskCw/EpG/MtaZRrDbTuJ6F
         5xTTteFxtHBI4rcjoxN1G2v/MDxIw4aO47OQ6P8qfSzspHReDjg1Kxb+FJS1ZQec1erY
         Te5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510196; x=1791114996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msADhsoRTGj1IyLzsyfhlBSSlDWgsH8eeKkmP39j+1U=;
        b=oLr0KzrDxYQvFDzYsba6FogkX/7YN5jPws3zfWdRkmYFvLMyXjj8j5UONk5rY41Duo
         46b0ap+s9mX3WnXWacJb01bzxZKTnNMkx3Pk7LGH5cDFhjKjs91fGxZJ535iFpsaZn0D
         QXDqyWkuGKztiRKt3PIURj3ahA76BdQ6FJJDr1leF1194xgCQYKihWVRw2kH26c+HXpE
         NQm6GJaY3XLzmJIinLixr9muoq5pbkNNZkzK2b5JRzmjL6VaT1ywHsc27vxjdAts6dOK
         Lt1ZzDFOp4EXTjVrg6YaV5ok5jBlcgbpojGvdTV5hMWHDpdHli7GKzYknluHtyEQIv03
         Qlkw==
X-Forwarded-Encrypted: i=1; AKwUvBw633Fbr1eKh1rKzoAWhqWTfSvLrqYU5MtFPNZiaEobJnGe5TA1a0S8FGiuLlo4yC+DtM62NiFPzzML5oA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTerS/Tae4H0Z/tSCXdgaXG6lw/uN1x+ZR1+8FJB1ox9q0kjjD
	vKdgjzaFm/8+rf/QFQS2Pms+qIPsvH4kGIZW+L/bjKE5BA27IXhAv1mk
X-Gm-Gg: AYBFou2EE+wRiFqQ/1Sd/Rmt7penyFev6qovS2JE4TR5mLhp5HYpyhntgKWup0+a+qg
	KIVLvrvlU2/0SYEf5rbYmyRn5KCcOEF0marf15MvoDgdD5jjwdmwLoXxdkSUHFwMHge2pIxUvqB
	+8fMSZDUlOChY6ksu1l2/8nYY17BgFBS60b8GqiO7a2iajdjuSFQlqGIYn3BIqMvykHurcxXNCd
	a6fwVt+3jwcIJIKiFb88EtrAxFl1782N0pam8FTWmpdeVkBBP/ZcBuojEn8458PnqC2b2QwR1dZ
	+zeq3ZenO6IIhR6MD66Typg43kZHGd8y++kjcyXT9i+o3Hsh/YjW4GZKyEDA0b64YcU0n5q33cI
	ylq1ylILkilsQcSEldLgKQdw0Q1xfQb0lQSuZGaPjqVxjxRL/JD6A6dVv17itxsCURKZwSR3ILl
	dUtc70Wq5KfF008Jap0nVfy/aqoy9jxdq3T04HdjyliRTpgS8HgpmNBG6csWMwsX6lCGlUCUxTn
	hKveUcGKQ+C6MjoEslmuAMUiw==
X-Received: by 2002:a05:6000:4684:b0:488:764c:7a17 with SMTP id ffacd0b85a97d-488764c80c7mr11867759f8f.1.1790510196208;
        Sun, 27 Sep 2026 04:56:36 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm21926084f8f.29.2026.09.27.04.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:56:35 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Bernard Metzler <bernard.metzler@linux.dev>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/siw: Fix length of first chunk in siw_try_1seg()
Date: Sun, 27 Sep 2026 14:53:51 +0300
Message-ID: <20260927115351.12245-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a short-single SGE payload crosses a page boundary, siw_try_1seg()
computes the length of the first chunk as the amount that spills into
the second page instead of the amount left in the first page

	part = bytes - (PAGE_SIZE - off);

Use the remaining length of the first page as the first chunk.

Fixes: b9be6f18cf9e ("rdma/siw: transmit path")
Assisted-by: LLM
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/infiniband/sw/siw/siw_qp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/siw/siw_qp_tx.c b/drivers/infiniband/sw/siw/siw_qp_tx.c
index f7dd32c6e5ba..54c9d97015e8 100644
--- a/drivers/infiniband/sw/siw/siw_qp_tx.c
+++ b/drivers/infiniband/sw/siw/siw_qp_tx.c
@@ -85,7 +85,7 @@ static int siw_try_1seg(struct siw_iwarp_tx *c_tx, void *paddr)
 			if (likely(PAGE_SIZE - off >= bytes)) {
 				memcpy(paddr, buffer + off, bytes);
 			} else {
-				unsigned long part = bytes - (PAGE_SIZE - off);
+				unsigned long part = PAGE_SIZE - off;
 
 				memcpy(paddr, buffer + off, part);
 				kunmap_local(buffer);
-- 
2.53.0


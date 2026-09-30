Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014745FFC3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756397; cv=none; b=RsVd0kc8cw8Pj8jT/pyO2X3EY5i79MlQpQsw2mZwB0NC6qvuE8p/EmygRceaDtBeggM7uidYEFzVseOw6LnfvgaUfpgs7o4jwASjx+3IN3LFwlRov9lbLarZOV2fKeHyMTy6OgFAUkeSWn26gOmQyVeHKbthXEF6QVYmGowwzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756397; c=relaxed/simple;
	bh=+y4xSMYmkh3bFalgboi6xyjy2Uegz5ftgAeqbMaePrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0GQ3sKBbMrWosiEL8Ej4UDvcXjWbayha0yfeOgEvj8YjRYcV53oVJbcQh8grsac2bsAzjbBE6vMFGxBzJqM3JjM4dnbAzYXXI5HybYupVm9YEMMsh0KiEFDM0TmHkCFGM201P6jOFGMwNUJr39nPBmF0EuI0Wdtwv9UMmxSiN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gthhM9a5; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gthhM9a5"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso1396739a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756391; x=1791361191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtJOE7/gGMS3z1mCUhci+rV25ZYpqBSPOr5/pEn7pO4=;
        b=gthhM9a5ododqIOnLL2lCXP1x62HROLuzZliVC/3SbivvowTybghNJ9uz/QTiX4mEj
         ulc8yvJ8IkXxDJelDMGIFuKtxNZEWNoVSD+6TOKVS0pJuKoqLwyHHWMLsnkricZ4Mqup
         XP4UrHvBOVP0+oDIiTM8DITqh9evcvVd2tDgWiOp5Zt8mPhSsG4gmC00HjHvPCNgQP21
         S9Z1eLeS+is4asSaPkANL+RBpUIUA/Cj3DMhSr1uFjhI4i/uZOW3fPwCpgM+fwuxxBkV
         s2Jgqpr56voCG3V5/L3SHEkLSG/tLFvZg6c4vBUI17PmVtB7LXL+IajVFxvHsUZ4fD1t
         XsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756391; x=1791361191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtJOE7/gGMS3z1mCUhci+rV25ZYpqBSPOr5/pEn7pO4=;
        b=NNm/EVNoSp10qKfjd+cxzc4vIXakrR2XTg/WSeg+P0hX/CHZfv6gmK87rv02kYrLwo
         COJCBbNHmWN/Ra6G4ng5GGnMfE1ABTXVqu7JIrmomjIwcnVtgv0+8hQaZKdTStcGIbhb
         6k4EbaV8DaT+3li4yJgJUnPSwRJpySWXv00P/9vmt8bGHS4nDdaj+n4iuOelY52IwvFt
         Q/KvPyeVlyLSVHyQ+qPDd5M3CvHuhjgGKgpfLybN7iBy7qK8hd7inw3EZsBg6aQB2dJZ
         /bRzxuHEP06gLRh0x32KVsRFuvFiHea654r+u/911QQ/knLC5BHL1D5zLpXNowae+ZUe
         pXSQ==
X-Forwarded-Encrypted: i=1; AKwUvByFB3lENuLdH8GthsQYO47glzY0pT+MJfzP/dbluFFKu+khVIMQTzB98QrKN5Ad+EF3NX8AoSwIhcSJKt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk6wpP6H5D1eGgKrI0+IDYjFidodU6LSGr0/h6Trirgaroea/l
	5Ss5NsSxrFYpmrVch4NT9njZ6zsu8ETfI1Qx/Hg5j1yE5XbJ9MAgthxi
X-Gm-Gg: AYBFou2KO3FMbk7DIDxwU7yUA4PlCdWsBC/6isG+asSKY5Kqrtbel0HN94kSZX3wg1+
	mMGAnl1YHSW0kEpZvju9syaFlP16TmboOxfx51HzyXHrSIk8QAg3sd7AtrLqX+la4vHUALt015s
	Tx68NUiLsoDMNh/bOeg7p8Z7gCXd5Pb3wXS5ngKBeGNs3QfXFPb/1rTgwa3DJzTr2L+mqkJw47+
	MpCcNTn7Vaaby6AzV+pHbWtJbihWyx+p5V8c/pLHkQtAvwChmBarmednXg/IZRjdw1vhaULmeAa
	nT1Y1qidcN1DhrEEBSaaw4Doi7wV6lAWbDHRNC9VZdnmVqTc3kzKrStvOec53DeViPVV9294iH0
	Yn+svhBDSuodz8L0x/6TntawtV2gx4D0BoYf96zUHwfexJGIsQoIdVUWaZVLoQ0Rzhg/OqEApg6
	fJS6DTtlmZ0kluT+iYXrBQsUCuoyNl3SeA6+cwpM1W/nnPpR4DXoNjsEWr3LLVNGiJIlpTFLiFM
	o+M8+N9dRAbe+YDF68n+JzcUta6FAfVOQrioesNFnSyCD3zGO4SwkXn9NKOecbKJcwXuKfSaGgI
	/DKXrfZxcCc=
X-Received: by 2002:a17:90b:3c47:b0:39e:6c6a:657e with SMTP id 98e67ed59e1d1-3a4d1984829mr624739a91.65.1790756391173;
        Wed, 30 Sep 2026 01:19:51 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da126a49sm453319a12.7.2026.09.30.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:19:50 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Anders Larsen <al@alarsen.net>,
	Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v5 2/6] qnx6: release bh on error path in qnx6_block_map()
Date: Wed, 30 Sep 2026 08:19:43 +0000
Message-ID: <20260930081947.511613-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930081947.511613-1-benquike@gmail.com>
References: <20260930081947.511613-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_block_map(), when sb_bread() fails during indirect block tree
traversal, the function returns 0 without calling brelse(bh), leaking the
previously fetched buffer head bh.

Call brelse(bh) before returning 0 on error paths in qnx6_block_map().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 fs/qnx6/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index eb6b5dfbc599..3c880854c867 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -242,8 +242,10 @@ unsigned long qnx6_block_map(struct inode *inode, unsigned int iblock)
 
 		block = fs32_to_cpu(sbi, *ptr);
 		bh = sb_bread(inode->i_sb, block);
-		if (!bh)
+		if (!bh) {
+			brelse(bh);
 			return 0;
+		}
 	}
 
 	idx = (iblock >> (level * sbi->s_ptrbits)) & (sbi->s_ptrbits - 1);
-- 
2.47.3

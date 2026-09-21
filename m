Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB023546D9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964718; cv=none; b=k9NPpjermD99ANItEoE8anzPqkl65O9j/oEHWIXxyV8aRzz8rby5wVi/X/mNKpAeJBf0lLEowDWdMNicGe57FajXawEji/aMV8lDt3FXoDiPyUOhCnyFfttm2gM7nmdBh03vM3NKFciv6g9sy87djpbo7BDgtqzo3Gk1GHonzI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964718; c=relaxed/simple;
	bh=o5a8cwchYptTJ18OlpOPh8cxQZIhxGe/fRbf5AoNx+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LcxGCVKObNP1mzGhPSrq7LLXYp4UvCQed5p/oZfA28o2ssB08kwro62xeFGwDDqTIQymiySjvrgdo6QzMBtnmGqeklc7pPlXVpoEmyvM8dpklX+U1MyNHb3L/Owgxk2LkyZe97rnxAlyxRbg++Suor2Gdc9B3yrWqbmRdD/83As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoaHgwix; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoaHgwix"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so1692685a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789964716; x=1790569516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2auV0/VE1Iheg/PPPrS18TZ3S2aE13Fg8YmU7kSPxk=;
        b=aoaHgwixZOjyjCqvmfFPYxEbMTisz/Yi+Bf34aEjdnP2oIKqn5odWq+AlvQ9lRrj0P
         HckDteinIXc3NWUN3e0K/FwXHLLy1bF6OfQtcIQgrL1Y0FtcMJEwHKxXB2P3ztEW9YFO
         XYZXmxbfOgXnD35EHhUtEJiZ+YB5IFoKtLhn1ejzDmSKKib1bynlRaM9HMGnQ201wOrg
         u2KL7UUPxUqdXlkqAErDcRhfuLyQyzium6ehP3vSF7T/rdH8RKr+KFC79oe4B4CJubz4
         4qoiAvrHGOOtKDH4/Zw8G7FExo9i+HGkrYKBaZOTK/vr38+0oaA+VVO+8wN9b/U8m5QF
         wRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789964716; x=1790569516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2auV0/VE1Iheg/PPPrS18TZ3S2aE13Fg8YmU7kSPxk=;
        b=goLLr9FRzFb+cWmIlwjfThf8DNfyYQ3JT/UE5/9iSvZ7tpm75D7xKPhIaQXMj64A3S
         QerU2TsO1eSUyseZRycICUPgp6HtOywnyDB/WYiFHjJAdaSS3tx4SgU+uhNFV0vD1ib0
         2zjhslxZ2aaY3ngx+vaSsRSVBEguXf6Naa4TgBRsN3j2wPpVEZ3bEjl5OytKi+xHbTm9
         iXnYiyE6VMocrizMAUPjFxuH1pi57riQgk5apAOH8KqgWox59xOplrnOyXggBg+oBaoj
         usuuGtdS9Bb2xQzsUT0+CqaRAPw5/+I8BcD7GACV1OJ1bHGCAwbMuk/MWQLjLqlZTlBQ
         is0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwhx7kVvb0AHbSyJg+IDFcLfc4E2hN+NUniu0RJSTYstWIf1o34IHNf/OXFiE6Ir5MuKCEpcVTGHT4HVPs=@vger.kernel.org
X-Gm-Message-State: AFuF++kokvdxBA8HNkIrhpVJdzrdr7zUZJPj0OmKjMkJGs1KlpkD3fy8
	Qi1vbG7EfRcM+niA91+5mrv1edwLWq02XvpIbdhoO5aqIXVtb/qEVbcq
X-Gm-Gg: AYBFou3+p5M1Ocg2KjZ8UbFM1LZIOixyMLx+D+QBb4zglUvzeeHCpXriq+jTdlQfcqT
	TZBRwEWGeDPXQPPy9rQz3F4PrHXTdrIoftQDfHWzGChbxasPmuwDyz2X+YqT62rw9xlBkl79e9x
	2MPYN/T371Oh5UknJCIzsvvJ2hr/4DB/fG+KSZKIWU0Dv6QZGCTCuwW6lmxVBtNFLReSkFEwGSE
	QrRWGbxGDLpSLjJ389jc16vEMGVnzJ1LOhOicXrlE+j/PPww8b8X0G7eL/l9ilYTo4LWQkLx6kV
	dC9rhUjje1Aa8KjBdxzVRbzXAKxaawuWO0j3CJCU7AVQ7D5iELc9ac2mGumXpSoePnJvhxp+UUk
	hORqslmEdadRE8/N8FFhtfIJjat9DTmbr3tmHB0sTr8/sq0ADZFj3mCACDPyxHb91uxZnCtN23I
	ruJgYDRCsdy1SM0G1Mb7e+lkhnTuIqKymZ9KXxdTuP/YybqiuNZu5NMEKYohMk+6w2hub2hs+7o
	j7boDft8LDXbbFkT7qP5SR0dk+NBKt+slzDcFxZM2IUQiuzrzAZTrJiCx9xOaHL0zhWgbCMbdTU
	rcOmATat8Q==
X-Received: by 2002:a17:90b:4cc1:b0:3a0:3d1c:2dc6 with SMTP id 98e67ed59e1d1-3a03d1c38ecmr3528951a91.66.1789964715575;
        Sun, 20 Sep 2026 21:25:15 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c5b3932sm11742139a91.13.2026.09.20.21.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:25:15 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 6/6] qnx6: validate sb_blocksize before dividing in qnx6_mmi_fill_super()
Date: Mon, 21 Sep 2026 04:25:11 +0000
Message-ID: <20260921042511.1473629-6-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260921042511.1473629-1-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org>
 <20260921042511.1473629-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_mmi_fill_super(), QNX6_SUPERBLOCK_AREA /
fs32_to_cpu(sbi, sb1->sb_blocksize) is evaluated before sb_set_blocksize()
validates that sb1->sb_blocksize is a non-zero power of two, risking a
divide-by-zero when sb1->sb_blocksize is 0 on disk. Move the offset
calculation after sb_set_blocksize() (matching qnx6_fill_super() in
fs/qnx6/inode.c).

Tested in QEMU against Linux 7.3.0-rc3 by mounting a crafted QNX6 mmi_fs
image with sb_blocksize = 0 on /dev/loop0 and verifying that
sb_set_blocksize() logs "qnx6: unable to set blocksize" and rejects the
mount with -EINVAL before any division takes place.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the qnx6_mmi_fill_super() sb_blocksize division ordering fix into
  its own patch (6/6) and remove Markdown formatting from the commit
  message, as requested by Damien Le Moal.

 fs/qnx6/super_mmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index 18298e273a13..28cb9322278e 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -63,15 +63,15 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 		goto out;
 	}
 
-	/* calculate second superblock blocknumber */
-	offset = fs32_to_cpu(sbi, sb1->sb_num_blocks) + QNX6_SUPERBLOCK_AREA /
-					fs32_to_cpu(sbi, sb1->sb_blocksize);
-
 	/* set new blocksize */
 	if (!sb_set_blocksize(s, fs32_to_cpu(sbi, sb1->sb_blocksize))) {
 		pr_err("unable to set blocksize\n");
 		goto out;
 	}
+
+	/* calculate second superblock blocknumber */
+	offset = fs32_to_cpu(sbi, sb1->sb_num_blocks) + QNX6_SUPERBLOCK_AREA /
+					fs32_to_cpu(sbi, sb1->sb_blocksize);
 	/* blocksize invalidates bh - pull it back in */
 	brelse(bh1);
 	bh1 = sb_bread(s, 0);
-- 
2.49.0

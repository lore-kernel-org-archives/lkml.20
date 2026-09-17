Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C984DE737
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656836; cv=none; b=mSObrCYILkvq13ilbd1V5cqzrJiqK18HnsR+rs2hool0CN5I4WfRAq9Q9KOpW1uyai3LciZrtFrYgpsKI7WNLyTwT3j6tqcLc9RasYEeBBRFqgREGjXQN5VgvHYPmKWRL0B1BqDzjZ767eDgT3fOg/zLVxqQL+gyw65pyRajHxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656836; c=relaxed/simple;
	bh=7ohNtD5OcVop+vmR21aODVLWrXHyx4prPieiBlgesvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJ7ZBJ89ND7bI6hRjR/1JUIcM5pm3TH/1J2+udK3TSjW/8YUOHLGTnogI+FCWpky9uNa3UVq2CKrWqDiNWhV40Wdd6wJYEZIM11UDsVq+QHEpo9xMwMcc1sQTBxvve48e/FdsAkrm7c5oyZw7yMVuVMNLJRMmlRP1CKZ7lf4WcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7KPNBt8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7KPNBt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869C61F000FF;
	Thu, 17 Sep 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656814;
	bh=Zme1/j//8hVtp+4/QWWa3g4/McE5mzwvHjuUv+HdYe0=;
	h=From:To:Cc:Subject:Date;
	b=n7KPNBt8BssW6FjCsgT4HnAFxsE7sITGXB31GVgcqwajO+DfTErWNwVJSJy94EzC0
	 RJAmRRdTtYMIIT2Ddf2S3Xn6EmDVd6Sl2Ql13BAnu8MXPj3I7AoxxAa/gcQsDVEKfm
	 XMzU93nnERkAs83o0xTW8Cb0fBWS9iVaFHcW4KyauigE9RZ4Mae5XuAxVZA4cfUucx
	 M4ZsWx9aUsYLXF6SrF3n3FKYIRFZ0vXGwXLMDoRysrHBMInW/tl5UbrVnZ66pknus0
	 oDFTnMVy7zp7/GlyWubCnlaTsQieYC36pJTQgtQA4IfghmGaOKqnRUK0sqL+d+btV8
	 +1s9Kec9+Ggbg==
From: "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	miquel.raynal@bootlin.com,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: Call get_wunit() on the master partition
Date: Thu, 17 Sep 2026 16:53:29 +0200
Message-ID: <20260917145329.380628-1-rw@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Weinberger <richard@nod.at>

The code checks whether master has get_wunit() but still calls
it on the child. Fix this.

Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 16629382a787..82b1e6392b16 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -563,7 +563,7 @@ int mtd_pairing_info_to_wunit(struct mtd_info *mtd,
 		return -EINVAL;
 
 	if (master->pairing && master->pairing->get_wunit)
-		return mtd->pairing->get_wunit(master, info);
+		return master->pairing->get_wunit(master, info);
 
 	return info->pair;
 }
-- 
2.55.0


Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1049E39478B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521301; cv=none; b=GsyT4XX9gAnK6qvBs/ogNumGo3KboHa2LUOg/FKJTQ3YgALfj+V7cxE8vMf2tydsRHUte3mCEpFi/N5itu7f68y/3ZMBssnJXUhU3Yu/GoAFgYkZp/XFoGTl30gQYI+fmxZl75zC/3RTZEVRPxyZLGKKaOnnsSVX0gTxmpQhkWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521301; c=relaxed/simple;
	bh=qXHYWU0R/4Pnp7Yf3UOK2FhGhxVUvbkSvsebkptITDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jaRotGslGZ27T+CjVBG9/wtahV7idKgUaLJgGPDIZhzeXnmYP2VJAF/w00sA5gCZgxu6RexUNnxyXX+kfwkw1K2Y6cPzU4QsnIP8ShoKky/nCwg145/UUFfPMRqKg6Nuw9w9wRH6W3AfE4AR2Swjib2akwQuriTY9z/hVoQCqOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUlByFwO; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUlByFwO"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so687855a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521299; x=1789126099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+UaSlxxJLcYKsp2FD1tG5uc8a4SQbta1aiPoRmuIHg=;
        b=bUlByFwO91qWjTi5+6m16vvEY+B558zLcp8iR4+umDFAQem+ezUc1m8ej7TdygFhCr
         F496ZTJMg8HXQzwitD/HmTizrktKIfCySpxGFKsJJjpOpCI+GUnxBDmoxfki5RFtu+Xt
         ViQRc3QBJLfY/n1HAqqzHmXj+E8udODo2tPFTfIVWz/JcEVWOWFJEfqBDyNsz2gF6Qan
         FlKTciSKuiFlOszO4O0uCKRA8en9nGO2Ju6H0BzkGKgMY8ayReERKMCdKCRmRXbEyl0l
         K8trpQTpbfSUS4Ak0ZqGzUlC3bzWO5BuADA/BfTe1+YFg7ENrVhrBuhGDssaMQWoeVd/
         PGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521299; x=1789126099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+UaSlxxJLcYKsp2FD1tG5uc8a4SQbta1aiPoRmuIHg=;
        b=l079vLV3+owkd22SGK0eZ6AEqBtgY7FbwjKnm4SgzOpO24IMtSPCyP7FqcB9RB7nDW
         FCPy7WLwj+Yfr8O9IV6O0kQqWAbeAWD8BDJnAUGFxVA3DTKW6/yZZhcmnn4pKMpEM79i
         aZcvGy4VFD2HDxVOi7gdeJ2AfupcPXIr14JKkQeBATsCwN6oOJPLI8vdFT1ozsPMtK6t
         f6dyrrq0xZhA3GkcW6I0HAUteVuBW4q7tdIQXvEYzRpV5OleEdMP8lqzxhRZmlNoWrJs
         JXMKhMyzuLjXqKk9SDVz3OKBtBmdpTeQNeBkTMTywrQPwv7N3L6Rr2dXPPYckblgd8Vz
         ubOg==
X-Gm-Message-State: AFuF++lLgNrM3jPx80EHvrXiIL9Rezbty+IZHbRu2+z6dEVDh45wnG+A
	x8pHZ+EcAanfDbeSwmGvLtyE3SdHROaeV8bNRhStPupm0xWDoxHN7Ns5
X-Gm-Gg: AYBFou1TYmqhE0iOk6jiaCmCUYia9Ut5/VucZEuxl60qYlMNsZGh2W2dO1lB4d0Xm28
	bnNuNyRuEUyQakJOX2M4ofgaZC3hBrRfHSOx6Rdb3cCgCfF+1OK1BUAwe5vPbJ5Q6I07bh2G4A8
	d17n9Miey2HIwqfi/okmSXir629YylWGe9qrFec3HzKdrvpqTR/EbQNmM8BQiD6EPwXgmIzeti4
	rCLpb+zyUdj/zFj6CAPQwGeAfWNlsGhP5L6hZ8JQ9O3zyS4I4fuOdFyBqp19C4r8Pspzz7o6z++
	CJPZh5q4xxNwZFjo2PwjCOSh+BlrlI0qVUVlE8DAxq3fd7ztZryhs2BIGYhY1LyqgnD0P3vuSvt
	j+gDPbG0hYWFL6wkWPN9+vzdOH52JoQNFakwmxwMBovcQ6+bfxX5bIi33VR5q8tFxTa8NyQrF6V
	OYuleKN8TT+OQ992B89oL5DipSCi4Lu/qU26/p3Xs5J/MZrXzHmnHP4HmKSjQpSeBtjck24VWAX
	0oJPh+0hf/0/28=
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr7839413a91.0.1788521299198;
        Fri, 04 Sep 2026 04:28:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6005996c88.10.2026.09.04.04.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:28:18 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: fix typo "informations" in comments
Date: Fri,  4 Sep 2026 16:58:13 +0530
Message-ID: <20260904112814.6768-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "informations" to "information", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/jffs2/xattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 6b4f68593c29..c91ade74c5a8 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -39,8 +39,8 @@
  *   memory usage by cache is over c->xdatum_mem_threshold. Currently, this threshold
  *   is hard coded as 32KiB.
  * do_verify_xattr_datum(c, xd)
- *   is used to load the xdatum informations without name/value pair from the medium.
- *   It's necessary once, because those informations are not collected during mounting
+ *   is used to load the xdatum information without name/value pair from the medium.
+ *   It's necessary once, because those information are not collected during mounting
  *   process when EBS is enabled.
  *   0 will be returned, if success. An negative return value means recoverable error, and
  *   positive return value means unrecoverable error. Thus, caller must remove this xdatum
-- 
2.48.1


Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D612BE02C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006624; cv=none; b=VBvaVYOHZktWB9LhGV2yeTsZmZMRxCxxkkpQmdE6FG6c0Q4cdkTMmUxMPT+AMqbbNlt52T8ZZm6OKBLzRnNL2ahI+K/SJ61JaCvibSikYRk6N74ho1ptTh4H+8RjSakk16BvLZRYzWiv3eRD4LNKPXEtcpLjoMyEffKAMLHLAdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006624; c=relaxed/simple;
	bh=FWJ3KjePe2ZLJX+PXqYTB1f050jq+4dzetuJ7W8/VgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xgud4phPMOpxkM1+tc+8bjUY7aoKrAUVUv0EA2y1VpLfAt6Kpnz7M0Mg7mgO7opsm2209sYIPQMzzctb9SyQ7exya9ju0RO9ZE9Ui/i/Tu+ssA3+2ajO1bG5sSl+arT1u284LlChvYb/xb+gcx/GjPhkUyvAHT10A6nyru+UQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2/WIv8F; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2/WIv8F"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso7278642a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789006622; x=1789611422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/mwb6kq711o0zLj40CBuf88fUtmxTPuXCFlSp1xnBs=;
        b=d2/WIv8F2Wyd2NpGlu85AFM7+zqEdoJDC1N5u7bJc7Ra+t+o0FX2vaJ9d2ivROLgQd
         XagkQFwQNzsMILyedMHoaaoEiwoBXE1cp4+jEYZq2Cpy72PHrtn+yZ49zRMKm+edK/+G
         hqaA1+1yQXQ4KkXYM/jwsMrE23YCBAKPVLC67/BaSUnbCrjtZ2bC/twKraybG2IMV9T5
         vvORzSaZhB147JPy8cJlLqs6UDxxj1swYqOKsIc32kqPECSNqw2//EvoGmkeeoXgUgd5
         pEfFBi8MutP5nAesk+axrfnIazrF1G8OaA72QP5B5ABGonrwhe5CjkdJ9CP737f/wf0N
         1yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789006622; x=1789611422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/mwb6kq711o0zLj40CBuf88fUtmxTPuXCFlSp1xnBs=;
        b=p3tD1z6CE6Wn4G9g7ZLYV/tsRbgdUfPVY0/hdB8QmRvrdOkNL2B4b0Z82uyR62WaIO
         ZfnrbI7UE0e4e9ctEiZhic7qAa6yrZ+pDJj4E8cdMnx9J26CX3rFvtqP3m3oFCyOIf1p
         3ozLkOGn/R6lL2wvuifOzU2CmtAT2eqC4LrfQRyABeO7ji5umcjGil/NqSZX4VuoOtPG
         RiXUjc3axzkPqVklbjXOOGe8t1LrjDxt9jAkAXQsVXpguD+hZo8j8qiN3/O7zD187cTN
         KYWToxUcgcJ8C+LuTCcnT6YoqgX2ZILqm+nV/biaNsPAt6eGNqvXVQ0WJAOyw6z54M19
         5QhA==
X-Forwarded-Encrypted: i=1; AKwUvBxM4X83Jb/MYF23WWweQ/WdVGkHPNsifD2u4a/oMyL6Evv8nrn2rd3y56rJPRSTP7mQmaIqnFrBjByXqnU=@vger.kernel.org
X-Gm-Message-State: AFuF++mxnUTWscPnNNKap/gexxBjQ9vIzIxMuzlwfjSIIT1C72lYS+iJ
	h/RKvMyJHK+IubkY7quEqVXmup62bJqBxKISIPnKhbMW4Ol5zzTcIDxe
X-Gm-Gg: AYBFou3MnALrDXqNNBpEXeetZwvkcXB24M3MZPc7BYLn7hZQqRk02+mKhKRU/yIcnTa
	NDpnVotVVEtAuvfI77F4L2yK0VqgU2Tm/Y8FLCLmO0HsIXKDBADyd2dBRPtQR77Q+I0Eowt8ono
	94f3NXb5XNsmYmbfH8hV2CYWD9D28mfHYXMNm/iVFBT1MdqzkNd19ecrSGbmFcX0nbP+ExxoSAp
	9mCcW7U636xrv5ZixvB0b0M600DTuBuZCW5gGPE5swXFlsv1ItpJnlJRGN11BwW6ORDcVXkJTca
	Y41I2Q6Eae/zURBJC1OBpl3hd3Cg0TBpKDYTWycpK+oKgPBXsHRAKUB9voKmvQo4j+j4L4BDdFJ
	FzlD2bj18OveYfzi6WUNWJm5HPJ90owu8jZ8wN7W11rimGimzaWNhSizr0lHL6aWjPcIXPAYqoZ
	QSv0Q6+d74Zz4E8o3+vyxIj64dCRRSUb+7U9HGEjp1pZrvyhDfEYNdhGFaWY7qTAGWTh0v1RdUO
	lk=
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr56840843a91.21.1789006621810;
        Wed, 09 Sep 2026 19:17:01 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d775c02b4sm2499630a91.14.2026.09.09.19.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:17:01 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v2] dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()
Date: Thu, 10 Sep 2026 10:16:52 +0800
Message-Id: <20260910021652.1296640-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aqHJKbBTNrreoMuI@SMW015318>
References: <aqHJKbBTNrreoMuI@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
putting each entry into 'sg', but the entry length is read from 'sgl'
(the list head) instead of 'sg' (the current entry):

    for_each_sg(sgl, sg, sg_len, i) {
        addr = sg_dma_address(sg);
        avail = sg_dma_len(sgl);   /* should be 'sg' */

Consequently 'avail' is always the length of the first entry. For
multi-sg lists this causes out-of-bounds reads when a later entry is
shorter than the first, and silent data loss when it is longer.
Single-sg or uniformly-sized lists happen to mask the issue.

Fixes: c8acd6aa6bed3 ("dmaengine: mmp-pdma support")
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---

Changes in v2:
- Add () to the function name in the subject, per Frank Li's review.

 drivers/dma/mmp_pdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 386e85cd4882..e90fd2023af7 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 
 	for_each_sg(sgl, sg, sg_len, i) {
 		addr = sg_dma_address(sg);
-		avail = sg_dma_len(sgl);
+		avail = sg_dma_len(sg);
 
 		do {
 			len = min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
-- 
2.34.1


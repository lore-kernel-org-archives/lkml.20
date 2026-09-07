Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A2403B13
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763871; cv=none; b=NA0La/mdWqoXqy+4OeQrWwtkwHjpCKAq4EyeQdmWTcaQApucGEmsQXMg2hN1jhENUNI+nl2iXNAU4GHCwv3QfxCQU9+q7Q1aw1QLYmuN7qdL6HpbAWKoA5uLsvP92n5+An7Ps1mhZJv2+vKKU9zGkQwUnndFOo1FZ1likAeqwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763871; c=relaxed/simple;
	bh=ujTVo13mhtQSZM3dZ1D9Y4fVcKanGUzQzI+aiyx+F9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAYo1m2e4E3VQbZSz2vLFnysWlZllI89HGjZBo5z8SsZZcZxbM7oY1FW53GbCdR00T6DnKAPbu72GoICR+PAkq5Eu9/VNyRTHgZ3ZU5BIbfv/XXD+DF1nfLXjoJdMbcjLCuAXTOk6Tx2VhEwaiOFLCe2e+U9rQnkOMXrtCcic98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uiv37xkO; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uiv37xkO"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2749654a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763868; x=1789368668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPgV6ur+BwahojS5JHPO8OPhQae5Mb5F4foZ8st31o8=;
        b=Uiv37xkOTuYB4niihzkiwal5/3fhViVNrXe54rNBSvAiEVyzy37eV5uf7fiCXhnn2Q
         xeRnMS+k6+4/+sn7vtwltLRcITYKmFLPIYHEtwPcNh2h04FjeazbUkTkFEjucXu26KN4
         6W/WgmSlANC+nKiBP2hPrT1mQlN9gCG1GkDalmNLszvZG8X5D6u5ytKwAcTfFhSzm/1H
         jYN96zUO6/EDC53mtAmNCUmL4y04Dqy9LzXxHVoHBOjYBTv7Mdiyz/nNqEEB3OfJjNci
         qq+RpHf9bMd3PGHeUqpFbXGUZ0MnEy3HzDHf/R3Xjz3jST/au1U0Q47T2BUYQR8fe6l/
         P+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763868; x=1789368668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPgV6ur+BwahojS5JHPO8OPhQae5Mb5F4foZ8st31o8=;
        b=ehrvV+0h4u4g8I6BrWPM57DiIl1+adaifUSkhaxrMyuydXAUxA+kn2UQ/mbc+gWw3Q
         Z7RojsZijzJeXmsBDlzS7pbGAf9FvqBTjZxSBuVakGoRBdQ/mh057upGnnqZmd9SwFb0
         wudkQTAzCt9+Yhpa4/TOAP6DYJ0AgMxXKS3uQD+MsIYhvbNQ2y/OagwA8WwytWpJwoXJ
         z5oAdXHyuSbmXd1H53aKApDaqXEFRjkr5fPhffZ2zuHgNAhXlVNQRdL59wbZbLnWpgfP
         w7HHAs0D0TH5csQFXEx+C3aU1yvfgCKyzF0KODtNsGUSkg7duHzxJZNVwcC/bZ/RkfTL
         A0pg==
X-Forwarded-Encrypted: i=1; AKwUvByAzYf0v3LzsDODmNYnDmwiR1eZbeEsFWKCWXCHSRf/JEh6PgQ35Kk6pwnCJ8LGpgAqJ4PU4e5M3dRTbPA=@vger.kernel.org
X-Gm-Message-State: AFuF++lJr8Hb3IxXtVcGaC/ME8eEZJYX1XZQdwG8+BlyXIiaX2AX05JC
	31jd4WPuRWxZYEuvDLmMMqTswfajpO8ySTcICy+LcXvmKpsSNZukbWPR
X-Gm-Gg: AYBFou36CFsHoDsxmIdiRq2v1zXGc/8m0HrxCKxsjayDz4gsE+nElcobQWs81lBAh3a
	LvlCC/zN5WmeEWzxJXybIsI0ZlAbhFfmz3jmAcIPJyJScjvSQVNpCQSxZpGqh4ig5Bgh6Ih+H4D
	9CcGNDc1+Rj699fi84JfEgAN3vvS2Ahigaa/ZykmFsns5QXgHjuF7RnoJbWYq7gFWmzwiBkGCm5
	ONle1PmfB1tf+KJi6Z0arRLFxiEBl8saRomnzv/vcL1yousk7BcmcrXzxY1N6Ju0V1+OHSHvUDp
	qO9M+Eju+YwOcmKUQFj+aLgJGlOFS4amagFh3OZRGAyIdgDncKypEAwxuOOEBEX/e0e3rscSG+q
	jJbATAqVN5rOEl9m/WNyx7CtvURcWp/eCqWT600PvrJ/aBod4TDkAsnvcDX3BcvCztIJp4yzXmG
	uFm3qbOtUyQ77K0dumcFO0DuqEkX+w+mctjcWqobt+7H53/ztEBerJLs2R47jWNzUMEtjCRmRA1
	UdDg3wCwzM1FA==
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32amr29338566a91.21.1788763868106;
        Sun, 06 Sep 2026 23:51:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm473120eec.31.2026.09.06.23.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:51:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Selvin Xavier <selvin.xavier@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Cheng Xu <chengyou@linux.alibaba.com>,
	Kai Shen <kaishen@linux.alibaba.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Michal Kalderon <mkalderon@marvell.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Bart Van Assche <bvanassche@acm.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	target-devel@vger.kernel.org
Subject: [PATCH 2/2] RDMA: fix repeated words in comments
Date: Mon,  7 Sep 2026 12:20:47 +0530
Message-ID: <20260907065047.26773-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907065047.26773-1-hemanth.selam@gmail.com>
References: <20260907065047.26773-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/infiniband/core/iwcm.c        | 2 +-
 drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/iwcm.c b/drivers/infiniband/core/iwcm.c
index 0b7246ec559e..4b05867dad89 100644
--- a/drivers/infiniband/core/iwcm.c
+++ b/drivers/infiniband/core/iwcm.c
@@ -936,7 +936,7 @@ static void cm_disconnect_handler(struct iwcm_id_private *cm_id_priv,
 /*
  * CM_ID <-- IDLE
  *
- * If in the ESTBLISHED or CLOSING states, the QP will have have been
+ * If in the ESTBLISHED or CLOSING states, the QP will have been
  * moved by the provider to the ERR state. Disassociate the CM_ID from
  * the QP,  move to IDLE, and remove the 'connected' reference.
  *
diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 7197d95f2216..43c3ff1ad8e7 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -1888,7 +1888,7 @@ static int srpt_create_ch_ib(struct srpt_rdma_ch *ch)
 	 * We divide up our send queue size into half SEND WRs to send the
 	 * completions, and half R/W contexts to actually do the RDMA
 	 * READ/WRITE transfers.  Note that we need to allocate CQ slots for
-	 * both both, as RDMA contexts will also post completions for the
+	 * both, as RDMA contexts will also post completions for the
 	 * RDMA READ case.
 	 */
 	qp_init->cap.max_send_wr = min(sq_size / 2, attrs->max_qp_wr);

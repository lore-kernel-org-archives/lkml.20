Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790FD478E27
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814380; cv=none; b=anesA4jfzs/aV0a+xoViEY7DkalXeWQ3lIoH+QJyPU8uzXqJm7Z6m5vEyfdjWS8uRIy9nYgwsY3Le7JrOpEYvRZr/bfpQwr7zbNk005Huw07G04wHwoLmyV8XE9PUNKS1OZ0F9R8wqqfZFIoe1o7q3NiObRQ5wb4nR4sC1Mr8dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814380; c=relaxed/simple;
	bh=wrx+CrA4nefwJFZVO5mqtqhzKW6sZMVWT7xnGsdPGJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1vuo8fA8a5cTCf44dOt2/VY1WOY7eGwsqPDFCkD6SpIsXyJKVf38rf+VELM/oiXAjEXySv5CwnLjCUE8F9h9Dnsh8VXWI1ZJPb0FVPTbKM1w5mSZhgVddyhaMiL4hUwCVU08lwp8oinwGDrSsEMw9N7hp2G12BPzrFpQ/Do7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXJwsjkg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXJwsjkg"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afe75f055so1816354f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814378; x=1792419178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1VyDhzJgUHMA7Wq9U/IKLESFKx2atIdhYsLlTj0K8E=;
        b=DXJwsjkgB9Ysd2X0hX4v+LMvBNo7lIepxckCGEQZebaw0ELDjX9eD4BLo1gWrre0E7
         FrXLtaAxfVRHCPeCd3cQdzRe15Lq7rMBsVLkS+eiCC+fsgI2gQcZvAM9kWN4dLPOujzc
         1NclSRYIWVPHpkBFIFqbxuds+i4SvaSmA0Lhh4eP7ZwVdZxjXEVZ1wDu8bacggxUQ8vh
         maFxY/Xj20dZ0QzYDja2RhmXQyPY5pmofKfP+NZo5HYj5cvJTDvavbf6xvyA316gCd/U
         4fEvaXs0x1wx3yHNxPgDTatf+Fqp6JqglsSf0ZZpkfUthbFXwvPBzWcsBngi00sMzsYt
         BuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814378; x=1792419178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1VyDhzJgUHMA7Wq9U/IKLESFKx2atIdhYsLlTj0K8E=;
        b=j27TXpAzZh2d4rFa73946YxZWrTfCUv2rDr3SmFxr3LIeIb7MVoOynV4vVxPjAqYSv
         R9TXfQ+mKNbM9o8TFzPy0g5bKurFBZUmPz8HBLuye4uiUZ+QYM3btLduRXg4Obl4LiKj
         qdKsFO8ue6s0mX1fbtu4ITE0fXu5RcH2C98w9HCOgrP7WZJaoJmHpjJwmbpMQH13/OlH
         s6etgL6it92kkhk0Wd72ghNkwU7rlO4/rAIz8AsdqEg8rWhsunJkMLuj8sSc3KxTezLa
         7YEUO8hrBKhh1oyJ5ZoYJkSqZpArxfTUzWRm3iUQoNn+4yDvHFN0CKtaa6W1AzgCxuJI
         H8Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxxe4Q1oSIXKWoGpdE9949s99sDSck2aapq6JRReBXmvHQv+GF6h19KjSqCklQI2qWjTF5Lf/lzwybOAvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs7+VijLv+UIsA4BPUaY7x1dTyYH8zsflGzqr00YYKle8ipZZb
	tZjjJYMTh5qzMbts1VYqw/7YeAQqfdn3oeQiQHMeMmwGmax924nSZ/2z
X-Gm-Gg: AYBFou3xJwA/+GRZ7wZTmROLAXWZQuNtEofeyoHYzlg54N37IrOI2nHsbSiq+bZNjj6
	E5VKoOVpPtoLrV6g9weLjRSk3PlSyzMIyDPsrDmVpks64Oi1yVIbgXYuvPXeC3iIf7s1lndYTJe
	fYCry10VHAMWGtnpDtO/oENAAuJ3g9EW0zG4o8hWK6gwadsmGFdW44EcS2B7It+h6vlgy+vPdgj
	03LAG4MkCkeNRyUsZHrQVTrB1lH+iDIWNBZNDsCKgx7bogdK4mDwD9fMeuD5pigrC9en0XCPNcg
	MHh5QgkEC4mUFKA1hi7U/5mWGJ7+B+4f5jiHhB2NTDQCiDk5KcDFYlWv7upOl8W77rt3zGgWB28
	QKlTm3/u2s0TWnz+YxOy1zOCkCN5J86EYEO9YhRAcFP2JtvTrruagFurEnZJG6Jbs9rQnOxiJul
	oqnMOOOIlgJwAfVigOMjFevQinNDwKTW1qkMLl8AhuoMWklMObqCVJO/zmA5iTSicLtqNzwrOAF
	1S+qWviG7u+S2JUh+dMN21XXhMjYEm8w3EbQljfLdvt
X-Received: by 2002:a05:6000:389:b0:486:e707:42eb with SMTP id ffacd0b85a97d-48dbacd93dcmr18590413f8f.33.1791814377415;
        Mon, 12 Oct 2026 07:12:57 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.59.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac02cfsm18703035f8f.39.2026.10.12.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:12:56 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	James Smart <jsmart833426@gmail.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/5] nvmet-fc: only send read data for successful commands
Date: Mon, 12 Oct 2026 16:12:28 +0200
Message-ID: <20261012141239.156408-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012141239.156408-1-parri.andrea@gmail.com>
References: <20261012141239.156408-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a read command completes with an error,
__nvmet_fc_fcp_nvme_cmd_done() still pushes the whole data buffer to
the host before the response. nvmet_fc_alloc_tgt_pgs() allocates that
buffer with sgl_alloc() and no __GFP_ZERO, and a command rejected by
nvmet_check_transfer_len() leaves it untouched, so the host receives
stale target memory.

The buffer is as large as the data length in the command IU, so the
amount of stale memory returned is up to the host.

The tcp and rdma targets send data only when cqe->status is zero (see
nvmet_tcp_need_data_out() and nvmet_rdma_need_data_out()), so no nvmet
command can rely on returning data with an error status. Do the same
for fc. The ERSP then reports a transferred length of fod->offset,
which is 0, matching what nvme_fc_fcpio_done() checks on the host.

Tested over nvme-fcloop: a failed read command no longer transfers
data and still completes with its error status, and successful reads
are unaffected.

Fixes: c53432030d86 ("nvme-fabrics: Add target support for FC transport")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/nvme/target/fc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033a..44bbc7d26f07d 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -2484,11 +2484,11 @@ __nvmet_fc_fcp_nvme_cmd_done(struct nvmet_fc_tgtport *tgtport,
 	} else {
 
 		/*
-		 * try to push the data even if the SQE status is non-zero.
-		 * There may be a status where data still was intended to
-		 * be moved
+		 * A failed command may not have filled its read buffer, so
+		 * only push data for success, as the tcp and rdma targets do.
 		 */
-		if ((fod->io_dir == NVMET_FCP_READ) && (fod->data_sg_cnt)) {
+		if (fod->io_dir == NVMET_FCP_READ && fod->data_sg_cnt &&
+		    !cqe->status) {
 			/* push the data over before sending rsp */
 			nvmet_fc_transfer_fcp_data(tgtport, fod,
 						NVMET_FCOP_READDATA);
-- 
2.53.0


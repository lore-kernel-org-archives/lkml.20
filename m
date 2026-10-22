Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675794;
	b=z0/OeBqa/5WbIW4MYrnRvQVsefhFkNyhk4lsmToIxTPRtbsQV3ikETAKc9Ext9SHyxDG
	 Rw6X/h0w9Zj+gwVWV+8UDGh94Vozd+9MjZbwpwiyXWkUE6WtlVZhIaiwhOGyQ3muJnksX
	 3H6iDU4qGEzQhWX+IWP5TmdjzfCp4z85FYoCAQ/iOd6I18XMuSKq8Y+O1/+ObFKuU/Ibf
	 vq8andnERQxv3J9LJi2Oubd6m2lUCGViQa5sbF0xaagsh8V05cfJ0HO0cD7Nsub1MzIfV
	 tQOnlRi8BKLMSlG9224fJ3ihAEdgfEgj2XyTyTiZIaB25gtludKxcHyvxluJV4s4utA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYSAYLomRkx00Riws69w3PNAb4pgR9omSPOZniDwcNo=;
	b=Fz2ta+iiQN4rR3KL8H/FBexwTzYDItpu+eGcktzEvAOCA2tIhy2fAmx3sQrj0Qgo+ldZ
	 iCWDECZpHrVRahkZrgK49pTqGUIWyfsDp4KwKGTygPGgA3Q4B1fvfY99eMaAv+7yz0AJR
	 /myXYs+C//0W6ak8S2aV2tGYseNUYXJk50H2EMfC2i8LEmU+If2R/i/mOuyLWsUmZ1nv4
	 dy4eckikM3oV79vAOFJMv3XYpXyHD7ES019deO5HhUZ5uxWUHgcKeMM0bBToqO1FauTp/
	 YS8k/hd/hjbqA/rtOOWR43oPJ1v39b1eop9UA6xiQeJjrOGyt+ePf9g35kTVavBf7IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pgLmY5uE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CA060A261F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CA060A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pgLmY5uE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso4935695e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675792; x=1793280592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYSAYLomRkx00Riws69w3PNAb4pgR9omSPOZniDwcNo=;
        b=pgLmY5uEZekQrJHGJMzmkVwIFwxV9g2Wl06y3Lfq8rRju14DgA9LrBO4YbOw2iZRiV
         NtAQJUCsSGsFrILH7/rC+HPDESBfDOPMlwJJHe4s88WbzGgO5lC6Ukv7j7KUhmnWq5fC
         uYx+oHyB6+HIO8n/8GkEOEV1tr2b1KziKiHTpt8Va72RRK6crd6zi4vdAP6xOJ5veZVJ
         xZQo3aQXKp+MSr2iAeQ6sP40GYGEAJyC0VRlxfeGHf+BfXw45tsLd7JDA3mIwOZAgy7r
         1VZHH101qwu96cVOVOZbw8mn7Pki2SUjWlIhCW0qYs6vecHVwgToJ5Qm4WdFziap36VH
         fIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675792; x=1793280592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYSAYLomRkx00Riws69w3PNAb4pgR9omSPOZniDwcNo=;
        b=nTB1OvHE+1gwMmjdSVhrI+M/wg4s3jXRnzMPaAXhqkGRl5DwQCJYZ3GiDerlokGh1m
         LMgTuImw89qJwq70sr6YACRRILEB3/64Fb0FMnuTfV3fs/BpLyi3veTmTboU/g87GxE8
         ofXK9dQP1X/Hq9vwZfRs8ggJ3ITZiO+oNgIy313hwR9UKODZkSSwzK5veHDgdfc/trRO
         MTR3sGieOqBUwuJRE6ZI0IhSVL1h0jL6ZY7nXpQiVIvEG+Y1uIX72xkty88q0lfC8EGX
         6u1zAIU52fhqwqha/xTt8OoWXoo2SGPq10zfY1z+k8gCQfzohzJmoyrGa8pE1fsel/dQ
         AAlw==
X-Forwarded-Encrypted: i=1; AKwUvBwnAUEJ+SvIwkm5vINEaBcWzqRGLjSMhXf8aqfeFuUfPPig78pafGt4MApDmfHB3XhZbPd+w2jgA7AmYds=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbocPkH6q1+6SLHzVaEiHM1kK+7BIk72rkeLid7lfeEtDPQaeG
	JQaQXhVXE0nq/zA/7hShQ6gP/xbuoRqExA56qhErzH/bNYNf6k3z8lt4
X-Gm-Gg: AYBFou2kD78bQpx0EdliOX3oOzKWEdBPGVwU+lVqcBpYgriMhIKyHKqb3ajHBq3me7H
	lP2du2A1DHQu4Cx7a9JYi6feW47c5g9Y90gPv4cv1+Ce5k2zWiab8c2g35jBMZpsGEBiSQPNpsL
	GwoAIiOlpAsciasHbwIDNJeXzHY7WGSkU+cHZexBIpPTFgOvhqgnpHIkdTC4CVK+yCby3RjYKgF
	1b7ArvhBbF249R9dfTJcqB+yZOxmOXcf9cfOPjtd0xeoNMeS6oxA6zFlfd9R2ULk165iUYuz3nj
	BJGcU13d/2gsmEfC4seTbJIDk9zDPvJfY6gCkQ6ytokJ+/x9NjzYp9tmUS529Hw2pw7/Gj4cHxy
	nRvgCijZ2twT7Hvw7mm2L493kj1y8v06iqNGSKdRfMg+BdsVrg0/RSFf20mNNN6tRBuSx4+mOw/
	YxUkMkM74PV9kD7s/O1Ia3iF3lJzFr8B5tlsZkBKuiojgTyY1ltBgJOFYEKQFnPWsFG2i7I46dI
	YVauhZQD2Z33XwLclY95Li0zDBYSQ2JWRekUviwJKFL87D1a2b9LHpKezIDvOO5r+KORa2n37EJ
	VO04J5b3AaRL42vJHkWBc9yf
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr40185675e9.8.1792675792204;
        Thu, 22 Oct 2026 06:29:52 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm108832715e9.5.2026.10.22.06.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:29:51 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] nvmet: zns: reject a NUMD whose byte count wraps
Date: Thu, 22 Oct 2026 15:29:31 +0200
Message-ID: <20261022132934.3592924-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132934.3592924-1-parri.andrea@gmail.com>
References: <20261022132934.3592924-1-parri.andrea@gmail.com>
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

Zone Management Receive computes its buffer size as (numd + 1) << 2 in
u32, in nvmet_bdev_validate_zone_mgmt_recv(),
nvmet_bdev_zone_zmgmt_recv_work() and
nvmet_bdev_execute_zone_mgmt_recv(). NUMD is a 32-bit dword count, so
any NUMD from 0x3fffffff up wraps.

The data length check in nvmet_bdev_execute_zone_mgmt_recv() sees the
same wrapped value, so such a command can pass it. A data length that
does not match the wrapped size is already rejected by that check, with
Data SGL Length Invalid.

Every site agrees on the wrapped size, so the target zeroes and fills
only that many bytes and nothing leaks, but it answers a command whose
NUMD asks for 4 GiB or more.

Reject a NUMD from U32_MAX / 4 up with Invalid Field at the start of
nvmet_bdev_execute_zone_mgmt_recv(), before this handler or its work
item computes the byte count. A size_t computation would still wrap on
32-bit kernels, where nvmet_check_transfer_len() and req->transfer_len
are 32 bits wide.

nvmet_io_cmd_transfer_len() in core.c, which the pci-epf transport uses
to size its buffer, computes the same expression before this handler
runs. Return 0 there for such a NUMD, so pci-epf allocates no buffer and
the handler then rejects the command.

Tested over the loop, tcp, rdma and fc transports with a zoned
null_blk namespace: a wrapping NUMD, sent with a data length that
matches the wrapped size, was accepted before this patch and now fails
with Invalid Field, while ordinary NUMD values still succeed. The core.c
change only affects pci-epf and is build-tested only.

Fixes: aaf2e048af27 ("nvmet: add ZBD over ZNS backend support")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
v2: check NUMD at the start of nvmet_bdev_execute_zone_mgmt_recv() and in
nvmet_io_cmd_transfer_len(), before any (numd + 1) << 2 is computed,
instead of in nvmet_bdev_validate_zone_mgmt_recv(); this also drops the
over-long comment line (Christoph).

 drivers/nvme/target/core.c |  3 +++
 drivers/nvme/target/zns.c  | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 291d782ce5442..2e4e066ef6bac 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1093,6 +1093,9 @@ static u32 nvmet_io_cmd_transfer_len(struct nvmet_req *req)
 	case nvme_cmd_dsm:
 		return nvmet_dsm_len(req);
 	case nvme_cmd_zone_mgmt_recv:
+		/* The handler rejects a NUMD whose byte count would wrap. */
+		if (le32_to_cpu(req->cmd->zmr.numd) >= U32_MAX / 4)
+			return 0;
 		return (le32_to_cpu(req->cmd->zmr.numd) + 1) << 2;
 	default:
 		return 0;
diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 78d82b6ff1214..92f5c1435582e 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -322,9 +322,17 @@ static void nvmet_bdev_zone_zmgmt_recv_work(struct work_struct *w)
 
 void nvmet_bdev_execute_zone_mgmt_recv(struct nvmet_req *req)
 {
-	u32 out_bufsize = (le32_to_cpu(req->cmd->zmr.numd) + 1) << 2;
+	u32 numd = le32_to_cpu(req->cmd->zmr.numd);
+
+	/* From U32_MAX / 4 up, (numd + 1) << 2 wraps here and in the work. */
+	if (numd >= U32_MAX / 4) {
+		req->error_loc = offsetof(struct nvme_zone_mgmt_recv_cmd, numd);
+		nvmet_req_complete(req,
+				   NVME_SC_INVALID_FIELD | NVME_STATUS_DNR);
+		return;
+	}
 
-	if (!nvmet_check_transfer_len(req, out_bufsize))
+	if (!nvmet_check_transfer_len(req, (numd + 1) << 2))
 		return;
 
 	INIT_WORK(&req->z.zmgmt_work, nvmet_bdev_zone_zmgmt_recv_work);
-- 
2.53.0


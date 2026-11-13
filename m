Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559235;
	b=w6bryNQ3zqR+j8JfLfaf3uMADYy0sy5wLmIeaKQweBCPiUMA0a+K0qYZdarm2T6UXKT/
	 NcnhKEq3AMJQPk1VU+fH1ZJ3YhlqbPw3hRyeLD66wzbqQ0D7g3A/zVaOTcgVcWWXodqeZ
	 Aic9jjfqv8JzVyhWMxDCN2eMXS3ZHaDi6lG/rVkgjfNuN7dLv/Q6m7IziI7lB4Wgd+8UL
	 5LR8Q2dExmKyVxlCRk+YjTYrdL5XmhqhZCZk/fb+P+aM1QjRj6rVpAEr1RupSUkLy+4b+
	 u6K50H3YG1APCeOU6K0+CwlyNlWKxbw/KCPNgeIOhV8jVL9HHK+UEuG+ERoeuQWVLmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BBnWWtBKdgI2TAwNesV0oCYOVTkjWDyFP80ZcpwkwoA=;
	b=hL6jMtPr04Apn+rEPH7Rc+FXSftjRcIgsJh8KE0wmz0mIBQ2Qsde0cG19vcF3DIpHBRe
	 c4zIks3o0bZqRLBOuCn/Q9JHwsj+ZLlNrM5vpwJ+3UgJWsZf0GfZ08lMiAxpPTjAgve8G
	 AZZskZDum4rW4dxm7mt88BUOSeaaqlkDHvCXUDJH2x85UoKGMWzc07/PLY0SeuWHThlpF
	 AV3phg8SHASWCQTCt7R7RZMTkt+NV5Ag8rFktDgqSzDgozY7SUPq5ux8KRUiVqKSgOyCF
	 DlmleJy9lEs7fVrDQ5DQ5ENK80A3fWlubOccFtWju2m4dJvdC1nqTlaY4iI6dcETqvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gV4GU//8";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4D60A2636
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E4D60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gV4GU//8
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso293734a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559234; x=1795164034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBnWWtBKdgI2TAwNesV0oCYOVTkjWDyFP80ZcpwkwoA=;
        b=gV4GU//8b5UXX3fB1poHfcWwaF8yDwgTfBZ4FxVwCSyE/RGh9w7pN/L5D3TScLNDi/
         2Hj1ADK0phlUcLRUVdPQusQbLg1Xp7NyLGLcWQSxKZIaPr8x/OlUnwChIPoPIYSYCMXO
         atg6k6g1mVkciyLuzJEAg9vUaqGj0+Zg2TvFqWVw4hkbfVOTKHHwBeNG15jcsimGwakG
         yNuxR2g5R1lScr84PeUGpjCWwF1rNWq44FVyeKuZp+A3puhg8VWswtnqHZwRa1Ur0z9Q
         T1TzaiGy2U/3HBaK2ZwVhrT8EyOR5WWO/si+Pq73UfiBk/6+dJwzYqw59ZR+ZDsyMXC3
         G47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559234; x=1795164034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBnWWtBKdgI2TAwNesV0oCYOVTkjWDyFP80ZcpwkwoA=;
        b=mN8wPRtSQsvh8uMbKxW5r4w/uKB3badNkBvGbTzpeeVg6eb4ewDbbAzshmh1iN8XYm
         9dcjj7b86NKBo6yTEDDw2CCP8kI4Ezv70/AwcmyVlsIaI3pqPu552ImnQXOatO4aPwPR
         SLLqbM8i/iCm7es16xIqVtcjIiJKqqO0Dus29oNjCG+XHY/jj2v1iNep3W6ozuFVI3hL
         8wmutbDF6NGsP+oxqvRGNcw5LW2Ou2rPP9FWqtnAJ0zjUo8QGrcI25tJ+Ul3wtwDoLLM
         oSSXm/Xi3WrF3Fo9yUdpeA1Auy9nZmQHjjb6W8sSBJ8Sp9pScubkbBUgt6+DTWMhH5rc
         +zCA==
X-Forwarded-Encrypted: i=1; AL+hErEgkEvp1krEpdBVi27GI5njuvf1KpY/SpjNSzBfdeJGZMCkf54bnJbiHDnMjxoAopq1I79AWFX5K8Nztuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z90QCFmzhf8wBcEVzxdl6EHiYYFRO7ws+eEpG4MF6LohX/O4OZ1
	+EiclvgEa6VK3YbzgQ3cgLacJkP3oAAxEPNWJoDVnXlN5kkmI4XQ+Vdk
X-Gm-Gg: AYBFou1t2lrze4EebvKfPILtiSYyuz3LStHZV/ltAFlqU2uAjQq9ZklXELRnIZsDO1a
	pRKYiChC+37ZJG5Jx1T787l1Zy7W66KKcLYbBOSgC9AbVKo4OztpbJeTZlhGrV21cmUIvIk88sr
	61RNkkfh4M7PNeba9abLiy0uq6B/ciOnUWcjhElxaDsfoD33dUbMvguhwxU/U86CP3QgYYrdZZ8
	8YvZ6RzIRDbbP135opN2X5aBaC4JEdnmGvVV9tnHWzKgitdcfKT6wR43nEJadtVHvnvFUfsYX7J
	6I87Acvtk9xFJJ56GNdEIObCH+pKYSrcFKQEi4Y0V4E/VJAfb5xlQMyX9ggY+2Y8wcnfaEU2mi1
	Hj7oHP2RSH8kH2HDHkwhH7h1fuAEDLWWNT8manFTBJXY5FgB6nfQsclFBC4pAO17b7UjC8ixIim
	bgcGSnRvOv7g37SBHx8jAzJbyePA+qKVw4ttOOiDQLT5X65hw/Mqy9EY8464Vu1ka2kjxfE3uNq
	+IU6wlMEH7vedhybyOPdthzHexXxKVJfBZQXwxYVxMxUC7vfG+3tAZ/FkbNHIu1UkiHFnjCmqpb
	uWnL+2o/4arRNFyBEfuqyAU5lCtQ/0ggtjhyr5fouQ==
X-Received: by 2002:a17:90b:56cb:b0:3b0:a9de:9880 with SMTP id 98e67ed59e1d1-3b1b0a3c5e9mr1581124a91.33.1794559234473;
        Fri, 13 Nov 2026 00:40:34 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b25a365asm1264855a91.1.2026.11.13.00.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:40:34 -0800 (PST)
From: Yong Liu <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH v5 3/3] RDMA/srpt: Prevent uninitialized read buffer disclosure
Date: Fri, 13 Nov 2026 16:38:42 +0800
Message-ID: <20261113083848.1517595-4-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113083848.1517595-1-pkfxxxing@gmail.com>
References: <20261110030809.913063-1-pkfxxxing@gmail.com> <20261110030809.913063-2-pkfxxxing@gmail.com> <20261110052827.963143-1-pkfxxxing@gmail.com> <20261111065342.1282709-1-pkfxxxing@gmail.com> <20261112094138.1390409-1-pkfxxxing@gmail.com> <92a82300-a454-4ee5-a191-0ce5a2ee58c7@acm.org>
 <20261113083848.1517595-1-pkfxxxing@gmail.com>
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

SRPT allocates read buffers and creates RDMA contexts from the initiator's
descriptors before parsing the CDB. When target core shortens
cmd->data_length, a backend such as rd_mcp fills only the shorter length,
but the prebuilt RDMA transfer still sends the full buffer. This can
disclose stale target kernel memory to a remote initiator with access to
the LUN.

Reject indirect descriptor tables whose direct descriptor lengths do not
sum to the advertised total, and log the mismatch before allocating RDMA
contexts. Save the original buffer length and zero the tail beyond
cmd->data_length through the chained command scatterlist before posting
RDMA transfers. This applies to both data and control READ commands.

The issue was discovered by Qihoo 360's Tulongfeng multi-agent system.

Fixes: b99f8e4d7bcd ("IB/srpt: convert to the generic RDMA READ/WRITE API")
Cc: stable@vger.kernel.org
Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Yong Liu <pkfxxxing@gmail.com>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 17 +++++++++++++++++
 drivers/infiniband/ulp/srpt/ib_srpt.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 127f256c6e..fc530ddf48 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -1115,8 +1115,10 @@ static int srpt_get_desc_tbl(struct srpt_recv_ioctx *recv_ioctx,
 	} else if (((srp_cmd->buf_fmt & 0xf) == SRP_DATA_DESC_INDIRECT) ||
 		   ((srp_cmd->buf_fmt >> 4) == SRP_DATA_DESC_INDIRECT)) {
 		struct srp_indirect_buf *idb = srpt_get_desc_buf(srp_cmd);
+		u64 total_len = 0;
 		int nbufs = be32_to_cpu(idb->table_desc.len) /
 				sizeof(struct srp_direct_buf);
+		int i;
 
 		if (nbufs >
 		    (srp_cmd->data_out_desc_cnt + srp_cmd->data_in_desc_cnt)) {
@@ -1128,6 +1130,14 @@ static int srpt_get_desc_tbl(struct srpt_recv_ioctx *recv_ioctx,
 			return -EINVAL;
 		}
 
+		for (i = 0; i < nbufs; i++)
+			total_len += be32_to_cpu(idb->desc_list[i].len);
+		if (total_len != be32_to_cpu(idb->len)) {
+			pr_err("SRP descriptor lengths total %llu does not match advertised length %u\n",
+			       total_len, be32_to_cpu(idb->len));
+			return -EINVAL;
+		}
+
 		*data_len = be32_to_cpu(idb->len);
 		return srpt_alloc_rw_ctxs(ioctx, idb->desc_list, nbufs,
 				sg, sg_cnt);
@@ -1304,6 +1314,7 @@ static struct srpt_send_ioctx *srpt_get_send_ioctx(struct srpt_rdma_ch *ch)
 	WARN_ON_ONCE(ioctx->recv_ioctx);
 	ioctx->n_rdma = 0;
 	ioctx->n_rw_ctx = 0;
+	ioctx->buf_len = 0;
 	ioctx->queue_status_only = false;
 	/*
 	 * transport_init_se_cmd() does not initialize all fields, so do it
@@ -1607,6 +1618,7 @@ static void srpt_handle_cmd(struct srpt_rdma_ch *ch,
 		goto busy;
 	}
 
+	send_ioctx->buf_len = data_len;
 	rc = target_init_cmd(cmd, ch->sess, &send_ioctx->sense_data[0],
 			     scsilun_to_int(&srp_cmd->lun), data_len,
 			     cmd->sam_task_attr, dir, TARGET_SCF_ACK_KREF);
@@ -2914,6 +2926,11 @@ static void srpt_queue_response(struct se_cmd *cmd)
 	if (ioctx->cmd.data_direction == DMA_FROM_DEVICE &&
 	    ioctx->cmd.data_length &&
 	    !ioctx->queue_status_only) {
+		if (ioctx->buf_len > cmd->data_length)
+			sg_zero_buffer(cmd->t_data_sg, cmd->t_data_nents,
+				       ioctx->buf_len - cmd->data_length,
+				       cmd->data_length);
+
 		for (i = ioctx->n_rw_ctx - 1; i >= 0; i--) {
 			struct srpt_rw_ctx *ctx = &ioctx->rw_ctxs[i];
 
diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.h b/drivers/infiniband/ulp/srpt/ib_srpt.h
index 506c11b843..78bba74148 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.h
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.h
@@ -204,6 +204,7 @@ struct srpt_rw_ctx {
  * @rdma_cqe:    RDMA completion queue element.
  * @state:       I/O context state.
  * @cmd:         Target core command data structure.
+ * @buf_len:     Original SRP data buffer length.
  * @sense_data:  SCSI sense data.
  * @n_rdma:      Number of work requests needed to transfer this ioctx.
  * @n_rw_ctx:    Size of rw_ctxs array.
@@ -223,6 +224,7 @@ struct srpt_send_ioctx {
 	struct ib_cqe		rdma_cqe;
 	enum srpt_command_state	state;
 	struct se_cmd		cmd;
+	u32			buf_len;
 	u8			n_rdma;
 	u8			n_rw_ctx;
 	bool			queue_status_only;
-- 
2.43.0


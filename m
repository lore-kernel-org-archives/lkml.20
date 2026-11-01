Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515095;
	b=e9D7mUWUQlZcG9c98RsW3XqnEiSY7uhv6VKgzZgTpTJdQLXvir5QS0aBTYc+N6huPKEJ
	 75YvSYW1t0RgrtzmCtbBHQ3I6+QLujZOuQWJ9PK9ndSuVQ8fhCTstK2H+rmYl5mb3t8TV
	 gCjpQA2csVP0OdjXy3tWWki2muBlWWLsLHJx9o0iLz037T9x9Bes2F6Bx15X0iuI3353V
	 z3AHmz6YO2zaYP0vklbTPYFKg01hHF351+HrwoZ/ReA1vFZ8+pe4lYK2qqkDMcHrV4ndF
	 TUafUdvRZ3z5pD/u1rYdp3GnpvEy+Owict10EkeGbTXh6vpuj3CeOfsCK9No0HSgfgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RWO+QUyZGGT9JFrisetKTbapr5TrQxiyv48XC9q2SJk=;
	b=0oxmiXEm+L8ji8iMIEpfZqFwvgmJqR7zm3UfUq8NW+yVlo4nNO5IRYxD7PXaXpLy3+2C
	 4XTWm0QGIfkdlni/CfXe4ypp8Q3JaH6yrZiyLMp8Y2o1GvgUCTXkA9cNfnwqk28CKQdKM
	 x2hvr6vLxdEqt/BMY7qaco+egbj71aANSSaUAwGMVkzqfgxwTYUWJjZGQqsUtk7+XCabd
	 RhCVrqv1f8uZTZmvtOby7vpnVskSZzVVnD4aG+cpPJvD0APE8PkjY2i/odT91BoPyGGA5
	 1ZxiuSkpMp0wfirGwBQcZLg4l/vU7C+4FdrwQFTgZlqQOsp9PsHCKTsPpXPo8MWN/pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRNw301s;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDB606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EDB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRNw301s
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1606527a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793515094; x=1794119894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWO+QUyZGGT9JFrisetKTbapr5TrQxiyv48XC9q2SJk=;
        b=NRNw301s7/fyH0SOi6Xnd1gRIt61R/gpMLNfP/dtdxe7cN54Yt03X48wbjZh9GWkdb
         UGIXoTe1KlKn7LTMuo3zIhA5tMAzmFpiO3RdmD+JygbFJfOUNBIf0SK2pBTtXoZDjz+P
         LLA6XX1Y8+D0GMixI5NLTS6Qr+4r/ZOYC2wG/xqJOLzO10n7OYXDpGoBN/fq56flFDlD
         a+JrQB2b752icPtg6zmV63j3gy3DSni2aHGauyt7ZKdKraDsVcOx4UhQRc8pqr0OFIrw
         SlPdiqtZA/o/5Mvgl4MWqXhl5++nDh4AxTEmpAqRv/C9YVjh0CyOxmxT34l9aTnvIc0T
         2GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793515094; x=1794119894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWO+QUyZGGT9JFrisetKTbapr5TrQxiyv48XC9q2SJk=;
        b=KeCLtD2aM1squSxvQQ07hwiOJH0bSkOePW80vaF2aoO97Ivlg8CL3sjIRXjTsPA7wK
         KDBh8bR2EvWBvgP3ECigj6yr7jGF7JhrNvjMZTB+aw/NH+kE6wvZoWk2TpigUm69vp56
         IrB3UHw7sYK0RFGDzN6ZcFSvKEOZamwvc2u3Bl5/lnNLk7gPZoAhJ4zaluFYjvQydj9L
         SRj4MUjgYROB4OLP5KyiECKEfWqTHgrVfgNMsvxmlZX9clIJKRsH0+D/X/JYaGY/k6+A
         prsYUz9LSiNLKiV61HDwJF00SAn4M3Q55i4t9eCFLoj0cDIdcYFguwx5/DgCjnypNJiJ
         t66g==
X-Forwarded-Encrypted: i=1; AKwUvBzfQUn+LGy4Kra3sFBvmmI8LxiGYzUE8Gqtomwd7jIXMOaxizJpBzAbGsMrkedm+hFDMJ38D7MNffAq3z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qR/6xpfE8E86RUM8aH6dRoI+RkSTP1w4Tnxv97FPyD+Sv7aPH
	sy9e8/y1UldYkw7Q87sd6mDdBKR7qnC+9r9z67ryu5Mb/NrUNqHma38s
X-Gm-Gg: AYBFou3QeVAE2GraZ0FjRrVMzppY8CC8mDjbOmrKl3huNbLhUy/BgCXhy4Z34QJO0QJ
	WHlQqkEfMYw4ZBivnaHmntB2hi5aXPd9zz5r1VU+RT1bi4BxITD4WnJIbi8XFQPY1gzyneGfYVO
	U//+kg+a8UDIAhkK86BRnIuXH9v/1qYfy1AYeFGRK8uBZ/osTPk3eouucwyysKTNqPgbqzblvE1
	wTQyW/dyBOPCr8V8l+ugzvNp01KyUgM8h/X75nxeHaXhsKgDI5mtaxTYb7h3HCOgr7PqShZQIeS
	YsHXFBc91JjNp7/Iyl1sKMlRCZV/Ln3LfoZKpouqV/ccTAMgGpwoJu4P94hsRCAYkXw5eph/muP
	SOY2qh8Hbia6mkDuUOXQjDP4BfPMZ7zNt+a8NSp3/yMsyAVJJiISCosrSXdsAhdlJqJVxefSesN
	rLk/ipduR26algSke7iFYsjosdtjhvReM1GoTa2/Fgj0HfSt626wY3tndoZ4cb2rGiEZySKoqPQ
	5VNT1tpP+9kucnCLSZRZ74lgnRr1tqlRgLr2Xa8WXCFKzDGaF/ElMPFdPZr222yzdiS5yzI+7sq
	yP4rDwVzSIQ6wRTMy+dXxvvyNWAjDRATijtlj2migOW8z+0=
X-Received: by 2002:a17:90b:1b0f:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3ae897f55e5mr6520493a91.29.1793515094108;
        Sat, 31 Oct 2026 23:38:14 -0700 (PDT)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm14036712a91.9.2026.10.31.23.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 23:38:13 -0700 (PDT)
From: BeaCox <0xbeac@gmail.com>
To: Ketan Mukadam <ketan.mukadam@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH 2/2] scsi: be2iscsi: bound the WRITE_FLASH copy to the DMA buffer
Date: Sun,  1 Nov 2026 14:37:54 +0800
Message-ID: <20261101063754.89598-3-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101063754.89598-1-0xbeac@gmail.com>
References: <20261101063754.89598-1-0xbeac@gmail.com>
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

The WRITE_FLASH command derives an offset from vendor_cmd[2..4] and
copies the request payload to nonemb_cmd->va + offset. The allocation
contains only request_payload.payload_len bytes, so a nonzero offset
can place the copy beyond the allocation.

Check the offset and remaining space before forming the destination.
Bound the copy length by both request_len and the payload length,
matching the existing scatterlist copy limit. This keeps requests with
request_len larger than payload_len valid when the actual copy fits.

Keep the existing u16 offset interpretation; this change bounds the
memory access rather than changing the firmware command format.

The analysis, draft and validation were assisted by OpenAI Codex.

Fixes: ffce3e2e8ce4 ("[SCSI] be2iscsi: Adding bsg interface for be2iscsi")
Cc: stable@vger.kernel.org
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
 drivers/scsi/be2iscsi/be_mgmt.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/be2iscsi/be_mgmt.c b/drivers/scsi/be2iscsi/be_mgmt.c
index 3b8551a1f0..1b95161cf0 100644
--- a/drivers/scsi/be2iscsi/be_mgmt.c
+++ b/drivers/scsi/be2iscsi/be_mgmt.c
@@ -41,6 +41,7 @@ unsigned int mgmt_vendor_specific_fw_cmd(struct be_ctrl_info *ctrl,
 	struct iscsi_bsg_request *bsg_req = job->request;
 	struct be_bsg_vendor_cmd *req = nonemb_cmd->va;
 	unsigned short region, sector_size, sector, offset;
+	unsigned int len;
 
 	nonemb_cmd->size = job->request_payload.payload_len;
 	if (job->request_len <
@@ -66,11 +67,19 @@ unsigned int mgmt_vendor_specific_fw_cmd(struct be_ctrl_info *ctrl,
 	switch (bsg_req->rqst_data.h_vendor.vendor_cmd[0]) {
 	case BEISCSI_WRITE_FLASH:
 		offset = sector * sector_size + offset;
+		len = min(job->request_len, nonemb_cmd->size);
+		if (offset > nonemb_cmd->size ||
+		    len > nonemb_cmd->size - offset) {
+			beiscsi_log(phba, KERN_WARNING, BEISCSI_LOG_CONFIG,
+				    "BG_%d : WRITE_FLASH copy exceeds DMA buffer\n");
+			mutex_unlock(&ctrl->mbox_lock);
+			return 0;
+		}
 		be_cmd_hdr_prepare(&req->hdr, CMD_SUBSYSTEM_ISCSI,
 				   OPCODE_COMMON_WRITE_FLASH, sizeof(*req));
 		sg_copy_to_buffer(job->request_payload.sg_list,
 				  job->request_payload.sg_cnt,
-				  nonemb_cmd->va + offset, job->request_len);
+				  nonemb_cmd->va + offset, len);
 		break;
 	case BEISCSI_READ_FLASH:
 		be_cmd_hdr_prepare(&req->hdr, CMD_SUBSYSTEM_ISCSI,
-- 
2.43.0


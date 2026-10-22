Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675800;
	b=Sc8pG/r1Sk3NuB2j8giFIdANkPbJDrCH6Hvyh9wLPw7uSFKj76Qi1p4OnLFgfna4sFyY
	 zX6SsDkklSSapIzaeVXJwkF6/lUzgEe15pi3xFNYPDhkzupg6WCmrUvxagx1yoFrcT98J
	 COnMBPF7/YDvVU9ZoMFKNINXHjmhZNXmX6pT+5ZoMPnOVtB+gRfxDZR4XFvnA3EYjUgjk
	 OAaEVWPT4yybLqdE9uazSEOjfxd7wcqdmX1EVzqfQsJkis4RZbsKnp4DSO+DR/CPdrm3x
	 dSRB0F09enDHjadjGSO6R8SU/3ho82HOVjMibOc6SqpJzJvbnIm5u5hXASsq/+ESInQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HDUAmNZcPxPev48FOk/77ScD0rraPEGB2IzDMOiukPk=;
	b=Bvz4rpxtt4ZX7PtCIrWlFHlPZf4jc0GdM++FCLGcsE1x33yl/emnmIGGqgwxwxlPwAX4
	 LrzyY1psda86KE7bH93ncCj/AcLd/SG+zJnsS9Rxi8XcC6pcI5RSWAymHybjdwm5DDH41
	 tTVZjoZQF9ze1MHFiVm0GZ82PVXc5Eu1cmcEeBTzH6YqhhBdWllTElXgxDIVbl3PnncSS
	 WTrLyBEArwdcARqRBR3N0Wr4M+FYQkGE0y0ZdgSjXhBymrOdv3gEHSdZ8cJs4dH7YsRBm
	 Zb50d8G7LLOoIpICxaY+LGCLXg4dGNrXY+e72TLn6uX3HLXRqKaoMwZRYYzafmYWhJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mihQV4ct;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9DE606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A9DE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mihQV4ct
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5074295e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675798; x=1793280598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDUAmNZcPxPev48FOk/77ScD0rraPEGB2IzDMOiukPk=;
        b=mihQV4ctF7GgLgksS9/Md+9MgDcXfHQfbOKrD52tlOEglwuCnB+pgQRmUXixjX+qr+
         EnKdESBUS/u4VWha5ayK/H7sQeHUwKnPhYnqcOmjcLqq1q3g14GTXPdbXF8vWuEL+ll/
         TU43ZMCAeKf/ZCM0T4YVjv5px/8BxK9CwXWH3kJlM5oOv2EC8Hlu4945qa9R8WH++0Ir
         n5GQ//TXwYtZwbGKbk0K6h1ZuIkMutRCeoqHd26oR7gLvR5Onw9zkA683Bk9WrDO3+uD
         2XmPCzL9K4yJiUjn+GAYedGK4ydGmsJlPOujdirtHNkZGr+m0POrJRzP248yIUN4zOgg
         YWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675798; x=1793280598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDUAmNZcPxPev48FOk/77ScD0rraPEGB2IzDMOiukPk=;
        b=0mzUSQM0C3rnsgANQbZEFkGKD29bEPL0Bvm7fXe9JnOn533HejJog3wJHOS/CNvAAn
         6rMJpfIZh+eKzuGkyuRiOHj7mZDd8J6TuOc44CdtCBYFDZ5SPV7nGhIeVfvU9AKiXvTR
         hysNpRyEDbxPVAeJybQPjA+iraJ+kA4xQpgoowH4Q3hnh/g9loM/C5uAgCAkBm9VfBcV
         6TbCBjdBL16IIQTdBtK6uCdFm1genDKa03zf8lUWQOtUgeVW6nvtxTL1qbh8GS9QKIV0
         af/xMu3GLIfLRhf2ctD83ksP0UFMOia5Z3QT8mBS906KTH3cfYkWpFr1glTeL93iEZ91
         UTvA==
X-Forwarded-Encrypted: i=1; AKwUvBwN2mTcY41f5Y6D6D2OzUHly/qbqkNqw9ApkvCHt8S54FiT/OIiflTcOKAkegDT08sKTfcTmAIMjXvSUu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1AF9XkaoEN8f+uhmCDxnH+Wx3xFb9CqCk1xFUxzJab2apffWT
	mcNv3Bv5AA+PdO4K6CB1c7sI0Be0ckCRadm8EKCVLmSfFDVLXVfE9gOW
X-Gm-Gg: AYBFou2vFrhytG+7WaKwvx0VIk2jVN6Z6hfoKPHAQl33uTuytRUAGN9ohtyJ04ZpyyL
	L0owrn1KurvsWIYcBWi9RUBrW9knO2cMs2/UB85eCzr/WC73GL9wtO7vvNhvFWPIuNjd7bKa47H
	XC5nPGlY4KmOWYPro+lV0Vv0PVE1O4pHzT6XrJ0jPtoGlsXTgQQDpDLSRVSRj2GegAEZUtntGZS
	Y8+JpnawmRL2pDIDJgk98JyepcET5+Z9frVIThhSN7gR7a7Wz2cqhnGopf4erMfO0Gdd+4Pg8BA
	bU97R8LNq7q84otX4CjE4O2DvzQo8juPMIktKGPV0XUhaXLiu25qK4WHXo8FsRee8ILwZx+B7Fz
	fS+qNN0zmG5eMHOE9rXgzjrMTwuAkXY7Bp32CGUgpREuol2eMeQPAYQbjLvKXVHh6Azw0qe0aiw
	seQAW+BVOXRmfF6KFjgLrs/QB1vijVFN0wntmYZE71Fi53ZsOE8ufWuYZt0aYaQMk0DNGB6tG56
	QXpOqDH2izRh4t0DfI0z/ZyLxbDd0Hg3FgMflqaoIaLukD5tvOHLPwh+yA5JDpny88pxLvsjPTM
	mhGCe3NVLbGNC5m1MgtKizF/
X-Received: by 2002:a05:600c:540f:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a1fd8cde00mr100975265e9.4.1792675798292;
        Thu, 22 Oct 2026 06:29:58 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm108832715e9.5.2026.10.22.06.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:29:56 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] nvmet: pci-epf: require SGLs to match the command data length
Date: Thu, 22 Oct 2026 15:29:33 +0200
Message-ID: <20261022132934.3592924-5-parri.andrea@gmail.com>
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

The PCI endpoint target sends the host every byte a read command's SGL
describes, even when the SGL describes more than the command transfers.
The excess is kmalloc() memory the command never wrote, so the host
receives stale target memory. Any successful read can do this,
including Identify.

nvmet_pci_epf_alloc_iod_data_buf() allocates each segment at the length
of its SGL data descriptor, but sets req->transfer_len from
iod->data_len, the length the command implies. Once the command
completes, nvmet_pci_epf_transfer_iod_data() sends every segment in
full. Nothing compares the descriptor lengths with iod->data_len, and
the MDTS check only bounds iod->data_len.

Fail the command with Data SGL Length Invalid when the data descriptors
do not add up to iod->data_len, before any segment is allocated. The
tcp and rdma transports take the data length from the SGL itself, so
there most commands already reject a mismatch in
nvmet_check_transfer_len(). PRP lists are built from iod->data_len and
are unaffected.

Found by code inspection.

Fixes: 0faa0fe6f90e ("nvmet: New NVMe PCI endpoint function target driver")
Cc: stable@vger.kernel.org
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
For stable, this depends on patch 3/4: without it, the new Data SGL
Length Invalid error is still reported to the host as a success.

 drivers/nvme/target/pci-epf.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
index 099e8766f6d40..0cc198f87dec3 100644
--- a/drivers/nvme/target/pci-epf.c
+++ b/drivers/nvme/target/pci-epf.c
@@ -1070,10 +1070,22 @@ static int nvmet_pci_epf_iod_parse_sgl_segments(struct nvmet_pci_epf_ctrl *ctrl,
 	return 0;
 }
 
+static u64 nvmet_pci_epf_iod_data_segs_len(struct nvmet_pci_epf_iod *iod)
+{
+	u64 len = 0;
+	int i;
+
+	for (i = 0; i < iod->nr_data_segs; i++)
+		len += iod->data_segs[i].length;
+
+	return len;
+}
+
 static int nvmet_pci_epf_iod_parse_sgls(struct nvmet_pci_epf_iod *iod)
 {
 	struct nvmet_pci_epf_ctrl *ctrl = iod->ctrl;
 	struct nvme_sgl_desc *sgl = &iod->cmd.common.dptr.sgl;
+	int ret;
 
 	if (sgl->type == (NVME_SGL_FMT_DATA_DESC << 4)) {
 		/* Single data descriptor case. */
@@ -1081,10 +1093,23 @@ static int nvmet_pci_epf_iod_parse_sgls(struct nvmet_pci_epf_iod *iod)
 		iod->data_segs = &iod->data_seg;
 		iod->data_seg.pci_addr = le64_to_cpu(sgl->addr);
 		iod->data_seg.length = le32_to_cpu(sgl->length);
-		return 0;
+	} else {
+		ret = nvmet_pci_epf_iod_parse_sgl_segments(ctrl, iod);
+		if (ret)
+			return ret;
 	}
 
-	return nvmet_pci_epf_iod_parse_sgl_segments(ctrl, iod);
+	/*
+	 * The command executes on data_len bytes, but each segment is
+	 * allocated and transferred in full, so they must describe exactly
+	 * data_len bytes.
+	 */
+	if (nvmet_pci_epf_iod_data_segs_len(iod) != iod->data_len) {
+		iod->status = NVME_SC_SGL_INVALID_DATA | NVME_STATUS_DNR;
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int nvmet_pci_epf_alloc_iod_data_buf(struct nvmet_pci_epf_iod *iod)
-- 
2.53.0


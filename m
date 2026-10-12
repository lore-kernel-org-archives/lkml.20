Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC37486B83
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814388; cv=none; b=AvRvzw603fX7Y1Od/G0GsoWDCiYQH2lMDyY/NHtexu/7HINhXoet9TFVGB9VLeX2dz1HW1Kvg9Zmjc7hDFoupicfAWpuy77xupIcVlfi6KPS+FAMOXcTXukSeEigu1rsb6U4KV3vK7D4Xfwwg1MfJ2Wmss1mhbtjRAKoufXHsKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814388; c=relaxed/simple;
	bh=CasR7lNwDWX8gQTBDlswxykj5EcXNoNdJ8ashzn6Ffo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCxf7QXg4nn+FFoloCTDDNEpHohptegjDZPL3tqkBlrEGNXbM+t80bnR03VcdpYOtoz+wpIn3zaCm7fauwwd+ZQViyFKUJUYTa8Crr7Zf/dFQTg/7J0goWghkb953QtqeDObrY1qM6g35FRPL1bgVftpvpri4J/lLLifJszMH6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM2A3GJt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM2A3GJt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0759so1450207f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814385; x=1792419185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZoOoHAtBKyUqJYvkGqSuamBRb2ixZoZPiDn5D95M/I=;
        b=fM2A3GJtXvaAOfnmWHOxqf7axmTeHR7bsYVuXwizEWFzqgCEAWtSc9UUffDLdWvJ4J
         68Y8TqBX9XY/eC83CQo/rK1HiVElAkrAdgE/fNnElJqOw/aEdihSmIb81+pMaAcVVdWl
         qo/zcmB/rT3b2BxP3uVT5+N+ZN4MHRWPAbeuBpTP/2vcXl98jqossU4jE47RtF4gsJ1q
         A97pZlkuOAtfImX/5uDY+dGnnhTsGo0cBdThEQqmbEuCWi5igeBZakKUpSGeRW+fN1NR
         cu9vuofwyKRXwSkVpqJbohoKcFIrtCXKpREH/3DFRA7IbA7tK3OR9v2Cph1lgnKoUisx
         ijQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814385; x=1792419185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZoOoHAtBKyUqJYvkGqSuamBRb2ixZoZPiDn5D95M/I=;
        b=ZPDIAaqh91Uaw8n+ZE8fhcnvz12lmY/DqB1I2V1xRjDvuLwrivKrEMTia4fdrsXOpP
         Rz1m6qb4QvcxAl6k9cWQzWP5UgRCGir20UKcLAF5PZ4TDYQBLOKwklVlXp9IJ3kxezD/
         QqI6jUwKyY3YuL5AmOlyiUxYzx3bzo2+y32FVrhgwf5qzfZdYQ/+U9zPazLLGIUv/3yX
         5oHJSHyhy2hRi7642IhVzVeGezH/pNPuu4M5bfmrxEQWNMcUEvIo8Tr03v7H5Dpwbgjd
         ZKnFxzqLenOVK32A7WVj+fwoPb88GNFeKW3lNxuSErFIT5r95MWxrVBpil5xX9VN82X9
         qX7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRA2EDXn6RCI5a+/I5ViGEv90SB0/8lC6GCwnXct6/+RSqJyJp8dQ67iBfW8oqx7c5gwpscbK/FFfYxjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgWPGLhRCtUVTm0cFQkWJ036tpDInWTJsmiiTvLjgakUxfYn1k
	zyh5S0fnLQAGpzXMq/gUHcp1bYCJkrxrrAOd4cdWrikKVT4fY6V5655f
X-Gm-Gg: AYBFou1QXJksgTL2txZ+rZ2RGavEamLKoLNO4ld8j7LixE7b2wzLyTfDMOh0KShRsZI
	BYgU4wf+1phowmB5COIAu5lDPQl2wiY7ku5mNBD15VDnYzMAKvQ5hn4tGoTG6UOOc/2VtZgugTu
	ELTl55aqMn2oaZyRqmY5ijUKeSa+q5NGV3qgj5Ov6QA2YDrjhq18iUJBoX680UB+HoCQepMur1a
	uJgeM7fZz0k/OPGyNAWaO4gClIHyagUqXXkqAUD0V5vpeS2l0wN86DdtYy4QN3/V/Hj/DXi/LRh
	ILTUKDVFEwVEisSI4vA2PNdxDbpDTbaWgEyKUNtSsHY0xYLbsLQoV+ChbGGoLKCALh2ZmwSFx5q
	6EJ+QqHe/MlVhXupYghSxtYLzfhwa/qXo2tAF9hdpjuAVT5PQVKqTbhr5CMNFMMmauPc0qybgOP
	cdHolMgj6BoBXsrhm4ZrfPAjl+EaWAPQFqpTjDHM0wNAD400SiJ4Q1oik2Fw7jr9kVRLHmpW+My
	JRKiW+xcXP6VCqQNM7JfbRmHNxG/9F94UQw6lNM0bUw
X-Received: by 2002:a05:6000:491c:b0:488:8a5d:ffcc with SMTP id ffacd0b85a97d-48dba9e6715mr18187313f8f.13.1791814385235;
        Mon, 12 Oct 2026 07:13:05 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.59.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac02cfsm18703035f8f.39.2026.10.12.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:13:04 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 5/5] nvmet: pci-epf: require SGLs to match the command data length
Date: Mon, 12 Oct 2026 16:12:32 +0200
Message-ID: <20261012141239.156408-6-parri.andrea@gmail.com>
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

Found by code inspection. Build-tested only (x86_64, W=1): no PCI
endpoint hardware was available to run it.

Fixes: 0faa0fe6f90e ("nvmet: New NVMe PCI endpoint function target driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
For stable, this depends on patch 4/5: without it, the new Data SGL
Length Invalid error is still reported to the host as a success.

 drivers/nvme/target/pci-epf.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
index 4c5fff232fb99..a8df176c1a574 100644
--- a/drivers/nvme/target/pci-epf.c
+++ b/drivers/nvme/target/pci-epf.c
@@ -1073,10 +1073,22 @@ static int nvmet_pci_epf_iod_parse_sgl_segments(struct nvmet_pci_epf_ctrl *ctrl,
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
@@ -1084,10 +1096,23 @@ static int nvmet_pci_epf_iod_parse_sgls(struct nvmet_pci_epf_iod *iod)
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


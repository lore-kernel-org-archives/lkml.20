Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698094;
	b=01ty6UWcCH5kHOWNnR5YfTx/Hb3MnXPIqZG5xIac+cdO/9Gz+l1wosVYL3e3Hl2yBP8b
	 sc+dZv17Q4oa9ItIy6DXRybue8j4YxfUAP517/4yi75GFJ4znUpXsZ9Ct+sC2eSdOmXl5
	 n1YrHliajYAQPhYKm8LIVOf1S867ImaXhKwNEG3XTMVyXSPNlw3XuO+iI8d7MmiYmqfSj
	 BY+aqfrW97er1D+uF8vASc+ffvxHYjFc8eCPJFD0mK3uZTgBVKwUcfLaT/rA/lnNQmhNY
	 2n1rDcGx9/G3nAZ2s5OC/MRs/8Tl6qQt18NXeD5ToBK4O6ku3WT0NepfzfMFpbP8wLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=61er9QeVPVsW8SmLWAXAoZHj/tiPoV/UqELvGm40fKM=;
	b=YWVvKZ/vsbui3A5HXDvgIFkT6p9ycSGtNZcM83Eet6LBYXJg//ch6r5P4xojsdzoyqr4
	 +IRQv+ZLo9inQrjK3LjUUztaCVYhcehPU3q1sVwKb2gDl15SY4NQIXeJUjq09eJeEceNm
	 WyF6zZqzIo/6KVhyGXzqBVeoZRGwBN6pC88V1l+IR/UDk//MMmRgh7ZivJA9kJYsuXZJa
	 8q7aQYFxC+NqY12xPHEasMbOT4OxifsIcB5fWsAOWfBuHFupi5IVmQUIlRGS28YKWvhW1
	 umMx8YkLzZpfIjXvWMEM4sc1r4qJmQ5u0COMYcZBvd2xWV3pu1I5liGTDYBU/4LJIDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHLfiiOu;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71277606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71277606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aHLfiiOu
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36888ae05e7so46766eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698093; x=1793302893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61er9QeVPVsW8SmLWAXAoZHj/tiPoV/UqELvGm40fKM=;
        b=aHLfiiOuW9JEd9Fjw6HHing3S240DPgGc0eY8xOZdCBUF9aJklbrxX1LreWy0PNtmD
         DcOGynTziQz8IAAmCXDC8WlrtLPAycEX39VhIqDK6iYis1VypEAefBa0I1maDYe40OKI
         DzO3lLXq6Lx5iIdUUpXBNNotRHcNOkCQUrFIaQLtUDboieeWr2m/4QbaxOpxyl0dqH3j
         o9VM2X3VQko/mte2hH1hVE1s138Li88yvvKXxV4e7Wi1ABIlEj6Cak2EPruBCNOUEQUO
         IoaMOFBDr/ZT/zn0pCY8Bx1dcnnWqys4AmE50fbnnl+SC2stzwe7/b9zSrjlw+iQxz0/
         lVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698093; x=1793302893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61er9QeVPVsW8SmLWAXAoZHj/tiPoV/UqELvGm40fKM=;
        b=cKmPcD2y2z530Z6I2kYxjzF9Oj6XWt7R/o3bwHP3uTH7ZkPaHawbTUGrdWepLdFpIE
         4fgXfkXVIZ3dPejLNwrF/gHfNjc8JH5pK0VeWkHD2EzYqmvkaA/miYsems4aqBHzBoDn
         OwmcsG0aTbswkx48jSiGmPGHqQiB4KCx5fDHpAVZGPf0l18PWAA7pCCwAg8yCQXNAnyi
         r0fX/f+fM/nqpwqylHwcocrQDKGBl2WZyHNFPQXdNAZnVGD1NiigU/1vV08oki76JFp+
         EwvRP/corgvwUPzo1NcXCGE6eURct9xMhju0lbNLPkiLJdW/91lCT1VpNpe1HpbUZsKH
         hYVw==
X-Forwarded-Encrypted: i=1; AKwUvBxOEveH1ATz2spn0d1kwMfILEmmm9Nz634VQKvStbOj7BlOMZRjp+otHhDXGt9lKhpzse5tUVPxD8Fk0c4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTTmteEcJ7wWuEQhLz6wKhkzDRZI+x+wZlZDAY/yYz9/jOb2P3
	2CCfsE4NsjzJ7/Q8tO4sY+kCwrUUG/wBuh/HCnB0YaMJTe/6Bs7vw46k
X-Gm-Gg: AYBFou2P0JC+XLSC4Yadeqps3LHns0BZhmcSrxGa9K/r5+AqxgkEK2AY0WFbPStKw5i
	ap0Ep1xOEdIbC2aAycgBo9QwBGEyRg/cYyUFpU6m+/qlex/SJV4qmY8hQSQ2wOK/sbVDs0MQuN6
	GdzWwQGou+ifwiYpKIp89YEp7coRs8oBNwchxeMgnC58b5MURY/Om+5tRiY1JgfQrK9pCkrNBed
	IzA833LCsuOPjDzK5ZvQSpSh2+3QDjs+We0mN/Y5ZwedN2sj+15fjw2DvT/HF31w0OaHQom3icx
	pISDm8szq2J2H/LTttgO1EZm6Zl9fI/YBx+yNG0+96HQIIqaGqTmkr1OMreVLJSi6W72c+ijfyR
	gULYQOeg/BIhcxbQD31tW5qniFf3KrYorB+OC+b5g+m+whtdIziGYIDAzhnagqMOAU43p4cQ+Js
	+TNBQqvLFKeMWFCJVz0w+DU5hOQVyJlzwDuog5rayJSiwSOAn2UQfdhAWM3f0RhmZPoNUm/8MUP
	Zkdw4XzssB+nh0XGILR/HDEi1NHlQXKIUjn7HFusmyA+n7FnOmGhaioZFFPkCzAhsi6IMAhDTHH
	hrZt6uPyYfFF6DUKraaU2Sioh2xAoXnBBz32L3Or1rzRIV5E72HKYmlp/82k8ZFWSOPaMjCHjan
	PF2aSfGL9+MZ7m3YNbODqga7ie5mnwi+778wS
X-Received: by 2002:a05:693c:4187:20b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369d97c9a34mr172851eec.7.1792698093229;
        Thu, 22 Oct 2026 12:41:33 -0700 (PDT)
Received: from wang0.shina-lab.internal ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea18sm96845eec.6.2026.10.22.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:41:32 -0700 (PDT)
From: Lianjie Wang <karin0.zst@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lianjie Wang <karin0.zst@gmail.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: virtio: bound the buffer sizes read from config space
Date: Fri, 23 Oct 2026 04:41:29 +0900
Message-ID: <20261022194129.2233880-1-karin0.zst@gmail.com>
X-Mailer: git-send-email 2.56.0
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

With VIRTIO_RPMSG_F_BUFSZ, rpmsg_virtio_get_buf_size() reads the rx and
tx buffer sizes from the config space as u32 values and checks only that
each can hold the message header. The probe multiplies them by the
buffer counts in unsigned int arithmetic to size the buffer area. An rx
buffer size of 0x1000000 with 256 rx buffers wraps the rx part to zero,
so the allocation covers only the tx buffers, and the driver posts the
rx buffers at offsets up to 4 GiB past its start for the device to
write.

Reject a buffer larger than the header plus U16_MAX, since the 16-bit
msg->len cannot describe a longer payload. With at most 256 buffers in
each direction, this bound also keeps the size of the buffer area from
wrapping.

This patch is assisted by Claude Opus 5.5.

Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
Signed-off-by: Lianjie Wang <karin0.zst@gmail.com>
---
The patch is tested against a virtio-rpmsg device added to QEMU. With
buffer sizes in config space that wrap the size of the buffer area, the
unpatched driver probes and warns in rpmsg_sg_init() while posting
buffers past its allocation. With the patch, the probe fails with "bad
vdev config".

 drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20b..de4af75ee1620 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -91,6 +91,7 @@ struct rpmsg_hdr {
 	u8 data[];
 } __packed;
 
+#define MAX_RPMSG_BUF_SIZE	(sizeof(struct rpmsg_hdr) + U16_MAX)
 
 /**
  * struct virtio_rpmsg_channel - rpmsg channel descriptor
@@ -851,9 +852,14 @@ static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
 		virtio_cread(vdev, struct virtio_rpmsg_config,
 			     rxbuf_size, &vrp->tx_buf_size);
 
-		/* The buffers must hold at least the rpmsg header */
+		/*
+		 * The buffers must hold at least the rpmsg header, and at most
+		 * the header and the largest payload its 16-bit len describes.
+		 */
 		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
-		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
+		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr) ||
+		    vrp->rx_buf_size > MAX_RPMSG_BUF_SIZE ||
+		    vrp->tx_buf_size > MAX_RPMSG_BUF_SIZE) {
 			dev_err(&vdev->dev,
 				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
 				vrp->rx_buf_size, vrp->tx_buf_size);

base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.56.0


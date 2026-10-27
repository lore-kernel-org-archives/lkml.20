Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092566;
	b=WNZfDqeiQABntJRnG0VxiLvjzCTWHFOfhmtMZ5GQ8TH+4eyEgzNNDqBE2h1g6ZD9Bgp4
	 Btm8RnNGeRC6SeYeAC4X6CmrLSAuRKmzYW6HFMlorGTzzIjFHGBW8LYlwyLEi5a5w8hWx
	 ZG3VHF+vvTFV4nYvWSPhh871s+LZiX+QSTP87nWvalMRoxxJUDg5+bUu3cWcN4yIlIkAE
	 z13K2tEZzg0MTzwslTDFyMgcFcZK/wQG9JJrE9B64dJtig4YA1vfJ+DdprL2nKC8DxEDg
	 v45wdf/GRKKueEWudCEOQmtdlQXNMG/y/vq6t9LCfjDMi1oITzOw8GSuYzJ0ZrkdZQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uvIjmI+HRIAkGOyGjy/GnDVEBAcECg6oog9cRdexHmk=;
	b=Zae7C/TKLTYO8Pj0+tYOFkw0ScK32t1muPTLScSzVlsWH9ZiImdWvDvZHVoNesHmWQdy
	 gM18A/Qyp4zT+XD6QRDyFy6enBUTBYg7Wl7dHiupR/22qow7yXsZ/Xb7GVWn8FNJvjAhH
	 VAA4s94BPnzrpJHZM6btPjc+Cjj9Q8Q5VDCMNyRfbHtM7yK+ekstT3IhsR1L4+5exFkiE
	 BzK+Ir44Pl83GZlTr3g6nOX1U6XX7Rx5kv8OBbp5cUqvQvaQft+2A2fFx2t2A9xoOH9hK
	 3kL4bdT+hjqX7dpqiUpWZ49p9filiWg2htO9XJQDAkCw2U8KfjEFaFpTGSKfREkw0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tAkgNglS;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E96F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E96F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tAkgNglS
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36661f953e4so7165511eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793092565; x=1793697365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvIjmI+HRIAkGOyGjy/GnDVEBAcECg6oog9cRdexHmk=;
        b=tAkgNglSz/+ybvpncEJVs1gO7yn9HYgmP0XNkHiEkJjFhVm+DYSgT9C6sAEWqkXtZt
         fZJgBvZWCrX5u7ND/7BAaa4Cu2+0hPN69tRHVe5s3KwCH1ljo+hSUggL5+FZBqnBDX38
         MvX1WQSghE6OYXMzbf/KlQJIHTr3Bv2/+L2Dw+yLTvAKAvVCIfg/MzFr/nFUncneMkN7
         jl5AS4hAnA9XyUMqBBEXHTXMcu2ubQjGjFe4ynLum6ibXiddWJAqNF5CAJ7Km1WGka3z
         Lll80hKtKAH+2rACEGl+3JEijyvX2JCYPvKOfmIwfGjTw1uVfsoy/zaGF6dDyyzclypo
         VMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092565; x=1793697365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvIjmI+HRIAkGOyGjy/GnDVEBAcECg6oog9cRdexHmk=;
        b=Zh0+vaa37/sLERUz1YkzGz7Joc6RHdyhvbSmIIthOSHecPqyQkAOG5krbkzZLr+sq9
         E67FHQyjSnCOvxoDHbVF5tLmdNKkYijHlxWyLsSYVmVgRFsyoWEyf5pJH5h8R/hgJCU9
         GvQWNOBjMOYIPe9NY7qq2BtxCd3WfT4g0lQPc6V4amCxUQ8MPotNJ4luESJT+tZgnEn1
         yJUgDBX0AUF9aRqenv1JdSu/puey89AwqBeRLmo8DSfbMrfkueabfIAnXemeLtII28Ro
         kxeAsDayBZNQvmYrlcF+5QzYZqvf5iH2XigOhk25KBX7UvD/ZPEwuDwx5ltUAcfyLahJ
         gtTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpdkOStvKEnKLtuJdQ0lgq1TH3D97faIi6C3Sa5UC11HMITNt/tG3zkWYDHbPoYX0YGWdvQ/975Kuat+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKciTlthsLaEeF7Cgp2TAapjJxYb9whJYPMBlWe0drf/z91DhRt
	YGkMahHSY7N5+JT4DxdxGq7mYzdtcBHpRs58vCkZw/ZZcL+YhiV7HinD
X-Gm-Gg: AYBFou14zjeMU6e7xx0t6dN7mLUVmGQAyelc7rocD/trTwf0Wwyaox+50skGwge01XL
	iO8YuvKS3WStygjXHxcqaiwDaN33kqo05bKek+c5K0CdOS2CMNL6w8NSazqCZUNeRWLXy3jruyS
	2bpd47kXPwbFwbbwc9dlzdfMlPhWpK0fM0qVIoMs0Ob6aeuKKjX9i9mo1m46aAyGsxomfDdaPwk
	IWRtm4GgzcGpEfSqFns0qTvAJVrqgR+otpRX5iQPwGrXDekTytVXVmLXjEEytCEPQp9qgmAA5Vy
	/rVklazRS4OZm8qdlLFMgL8Z4sAet6r/eJtLveN/qA96w2mR526/j1rIiO23DIzQ0NhAD6OYeo6
	n4DFSogc9Ir9anSbLaLQsnQJP8EghCT4sjtvXTxm9AhDI/eZjM+qZXFEZm1bWndju4wh5ZRc3Go
	V/g8bq14LSPGCRG2Qt1WN/0PazhXfVT8XUC5493Fuzxp/svmvCCC7mbd2J5KCnylrl6W/Q7lZRx
	kOGLTt1pIO0/FtQGuXn5k4Ew3hSXnDoaHhKIY15OM6b3kVfcY+uTWOyIwHnxz4a5SEOjPNOt+p9
	yqnGy4Ehyg==
X-Received: by 2002:a05:7301:fc10:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a10085e66mr2611715eec.5.1793092565123;
        Tue, 27 Oct 2026 02:16:05 -0700 (PDT)
Received: from Zoro.lan ([2409:4090:2022:b00e:72eb:d31b:8aa6:1b54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm41232082eec.28.2026.10.27.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:16:04 -0700 (PDT)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Daniel Golle <daniel@makrotopia.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>
Subject: [PATCH] mtd: ubi: nvmem: Fix device_node leak in ubi_nvmem_add()
Date: Tue, 27 Oct 2026 14:45:07 +0530
Message-ID: <20261027091507.130294-1-vishalsatleit24@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ubi_nvmem_add() calls of_get_child_by_name() to verify that the UBI
volume device node contains an "nvmem-layout" subnode.
of_get_child_by_name() returns a pointer to the child device_node
with its reference count incremented.

Because the returned pointer was only evaluated as a boolean condition
and not retained or put, the reference count of the "nvmem-layout" node
was leaked whenever an NVMEM-enabled UBI volume was registered.

Assign the child node to a local variable and release it with
of_node_put() once existence has been validated.

Fixes: 34a5d8525b6a ("mtd: ubi: add NVMEM support")
Cc: stable@vger.kernel.org
Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
 drivers/mtd/ubi/nvmem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index 2dade9727..15737d511 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -61,6 +61,7 @@ static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 static int ubi_nvmem_add(struct ubi_volume_info *vi)
 {
 	struct device_node *np = dev_of_node(vi->dev);
+	struct device_node *layout;
 	struct nvmem_config config = {};
 	struct ubi_nvmem *unv;
 	int ret;
@@ -68,9 +69,12 @@ static int ubi_nvmem_add(struct ubi_volume_info *vi)
 	if (!np)
 		return 0;
 
-	if (!of_get_child_by_name(np, "nvmem-layout"))
+	layout = of_get_child_by_name(np, "nvmem-layout");
+	if (!layout)
 		return 0;
 
+	of_node_put(layout);
+
 	if (WARN_ON_ONCE(vi->usable_leb_size <= 0) ||
 	    WARN_ON_ONCE(vi->size <= 0))
 		return -EINVAL;
-- 
2.51.0


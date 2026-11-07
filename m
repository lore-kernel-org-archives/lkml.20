Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089716;
	b=pqKm/aTeD0lNvz1aN0ai59H13M1rrbJ5OTtQN+wKQiDjVIn91AXJ5kZ8cBdtAb8k84C0
	 CunVd3xqbUVcl9u65QG/n71SSljz58FYSz3GX4RTVfwLSsB5f2irfZvEK0yyTSQxVb1zL
	 fOMpLtNMKeaITp/cmfM8vRaDebS/bjVsWY6neYwgmRtlqDq8lindWbu7nEE5QaDr9d6AC
	 wINltzXWwpptMBJLPfbE12M/DnhKS0HCMtUqC2Tfv5+JAi4cpeWQT4tKSorDb0qdjrJUT
	 djfsI7DwpTQTormeeTZMDaa/QP/6NpBgRckZ62YoPuc/C3KB8zKh9jR17ciMP2UqbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
	b=X5OCPZRevD4zeNbT5fiaPyWSQxPkkSeZ5FkQZY1Nu3xSGySnrA+z/5PuucJo+E7H9qfI
	 fLhXPFnsFNM3WzzRfqeHCkYkGCdKR26aLdZLfOc0TT9OEPA0NI0uM2nHsspi7X4djsuoo
	 2dFSHqPitcDs8XREbWLnOQNASnB9CB17+fHPRlZV6WSnnEm+5yybzgJNnqwxPGA2CJdUb
	 C7LezP7voUMT0isoSOQkp6NAsUWC4WzTpU6XCgcOXp7YC0QlVDDsbXLpiOk4IhsWSrtpV
	 e1x01RQL2g943ZusPLGMYSLWVnqF2fqF6DG3lJ4goFrCjgU0eZhipPR24o3wqkcNHlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTpmOR66;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B792D606D818
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 22:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B792D606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTpmOR66
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-370ebdde89eso100976eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 14:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089710; x=1794694510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=kTpmOR66dBAIZkOKjeV1xswlTFvCGfcB1D5HxfKVUivRzVFMkk/UcARm7blrsZiYwZ
         isqPtifc+JRwjb+eRX0uyk+d8xiaSsOfHL/MH1ezmplm0akBw+v6bDmQdO2DpfCGDH0m
         2IDYRwjzTSqsgXTWTs5Ix5qBq4g83lDPefss02DtmhWSPRzZxxTP2oztUTWWW9D83m4d
         5YXjrxqut0QXpRhkvz3YRAX9vmlqnkpKGdexKwYEvUJdkn67VaQWvHpjApQ884/2VK/J
         ioGgxSWAMjcVBpKkgWCCT8y5dyAjyNQeIdpoz0bmLnfMorwgk1wEwb1Up013iZzd+8PY
         2ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089710; x=1794694510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=DW7kX5/cwkVGp3hhdU729Cr8ueAOusrWmHMxYnTicVsCFFETaFxMDBt1iVCUKwbJiV
         cUX9gRZvvgS388aIwv8iM1FwJV1sS/A0DnCtYusRd60f4J8gSgmmLPoIa9UNZD0Zb212
         PHhCicCTC9IzkjxNrFavCsh565Be2XZe2/F1jdc2SJBZy8Ksl9MZn15f7sYXg0PPfdy8
         2Xw3KDcbTOxUYMVhjjQfMQoNG8erEigCQRyHWXJGe6iX/P5vtzQTFiTYXyH8qUKhu9qb
         NmE0dmGpVPw7X0uRl83YBUJFZolsPD1Mn+cLC4aQOUflKgDepYK+Lb1pf2sSRUC75XRh
         +s2A==
X-Forwarded-Encrypted: i=1; AKwUvBz5636t/ltmCOQc64uQbVqMUa/uptCPvkznj9yoSlX6c/MbzGkbsrb+aG7ObKI0GnV6g7CMiFBIsHtsnpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mzuo6S8Tj3mRjnlLX4LrseB54tsALPe/IClNQomyrW3DdT5OV
	4zIgkho7CF7/gRqSRWCZgHfAd1ZOQ9d/ZQpgnmUhSDZZ9bty6QZ8Uxtg
X-Gm-Gg: AYBFou1wpzvFhMIQ05lFbGvWJPAYvFw2i7Ngln0zIk//Rbj3QogSPh8DWgYcLWsngIZ
	MwoetYzrYdce+wMVKimJOsBHXH/PgdnEn/dfL8W5qM3KjdxuBuQJxDntj505neKalBjzu0q1ZID
	CIRVPRBqlQ3vClIUPHS8MDlpfsIRHYkaIzjqAf1C+BajuFg3mL5zSXZ5zVnLTQbxHiD+FzbaU8L
	06Tx+hMc8cgMd5n13aPrga1oDjh4RClUVFYnH8z5AHSIB4NrurUcQoCv47lTy9LfvkZz46W/eKV
	vv/iJsN5JF3cwV8AX9zicRp4mlJwDqUfRSCGBajUkiuWoJFWe8PGx/D62nkPQA1Ue11HeyxnlSY
	NSS7rNRtjmxk1cO9IyC4kkV+Omm/1Uj1rkVkfYUVEWaNMRxWSwBHmkEiLfJeQASMjngJIgB6HQI
	6f7zSHQ/pdqzIt740kjbVkKVHpFrr/inb3HBIGO56uaFzvOhEZHuVTQX43OA7cxWRqIBTUcvyw8
	YNUVgL+MmHoeObAVy8yEE04WGVNuNxwt3xjkIX0Na+BzGEtphthSLAvcTaJCXzj8Ld46IugqNFD
	uS7/uRbqiQCG0W5M6GVfPQQDc6Fh8rpxlPLdCoOjXuk/g/W0fXGVmoWpOECjC0PH/7bjUiHZ3Fi
	2JGw1ti8o1N9LJb14WyqdV2YKHjz662McVLne8w==
X-Received: by 2002:a05:701b:4348:b0:163:bee9:b250 with SMTP id a92af1059eb24-1b25d321963mr8857586c88.22.1794089709615;
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm1465914c88.4.2026.11.07.14.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Sat,  7 Nov 2026 22:15:00 +0000
Message-ID: <20261107221500.96825-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hidma_mgmt_init_sys() creates the per-channel priority and weight
attributes with S_IRUGO | S_IWUGO, so any local user can write them.
A write stores the new value and calls hidma_mgmt_setup(), which
programs it into the channel's QoS register.

Attributes declared with __ATTR() are checked at build time by
VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
two are created at runtime with a mode passed to
create_sysfs_entry_channel(), so the check does not reach them.

Make them writable by the owner only, the 0644 that __ATTR_RW() uses.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 9672ef9ee8fc..53b991752e80 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 	/* populate parameters that are per channel */
 	for (i = 0; i < mdev->dma_channels; i++) {
 		rc = create_sysfs_entry_channel(mdev, "priority",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
-- 
2.43.0

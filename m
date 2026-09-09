Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE958492E38
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936663; cv=none; b=NC99u3ygYiVEh/7XTvFeGK810m5p5hwZ/gk5y+pNyj0NmsH6gFpYBaGCIGcc2MP1FTL1HyjN/S6ekDKye3otLcV+hM8HwRf4YhHBfAIOL2SOnDSmAt36Fen4k79sPuBtLnlbJIANM2Vf5+qq+hyC4D+lSWVdOpLvWmsUEZaFOPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936663; c=relaxed/simple;
	bh=oDkqqmtTJtGBZvqIfArxzM2jLkVcQGCEqnkrKRG+9hQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=So3bvkmBAarL5v81lupYJJ23YL66sOdVPeFIhVaSkZZV5iwaPGSFFjAETI9+6oExWtnxiUvvm3zJTWBLiwUNijAlDyqPXerJFpC/mVBw2P0wJJA2BWmbwBBs0Ml7O6GWornkPe8OhbE7pWziAlhQWWcXLWWNNdO/8euzLPHZcA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpjPaFeY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpjPaFeY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so43679095e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936658; x=1789541458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBhD6t+tB+9jZHU6fZGAeov1ImNZWGevF727s90AjNc=;
        b=mpjPaFeYrPuVnGhRT2SHmF2qxWmwmIFYujyvIHUB1tFA5k4QzomzqeSYnV0n66E7aP
         I7UtxPrR5AIz4U/PlWoDKBX9yQJ9yeqX3MZr04+jia2wsWzw6AMB6UxS93FjWkQvLE4F
         QqvBWFWIu2DYuZ5gJM3Z6MMYFYnVQCJynnnz5xsB6q4pVJwKZBKZsSV3ZGjh/cNGBqqp
         maVWFf81cyjlgaGFR31hX1cnjMXY0Gv94TEcmuv9PqdKMLNrVP7wA94t/ojXC4aL0pJQ
         pcUSuYmW9ulBhXK4bVaFdd73bS5XI6Zp7zy+cSPXAUxGqJcMzQjUqSaSSm9GCPqEXDdu
         Wiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936658; x=1789541458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBhD6t+tB+9jZHU6fZGAeov1ImNZWGevF727s90AjNc=;
        b=FLge4veOPBs8gNW9GtLUpl8c6O/20z206ZVZz6O0IlrDxj76PA6b/6fyzgY6zp/w3u
         dBNm7R1XFgGKCoG8GovYD+jxdilk7f8zjSap5glHsZSLe8LK1J19voZkRcCHjRzLg9Sx
         n0fLu7TAU023jPzlxtgcdhp38L/dduLqxcbuyfld/Mq+DOTb9OfOuLWdAYs+DWtj5HJW
         wF5ZXuGt6c2cX4fAhfgObVhAPWnqQU28a8iVXcZ7/kfIS9olGfmMJSHDpP77kKFVN9S4
         hlCB9bVGfUC4exrTBJZmrLA9b9mN+G3kR7CXTpcB4jilflPB12htWpIlLZqDbYXd834+
         25+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3JBLmlCSWbBBHasw3/jKV7vlcydQwsY4J47hvY+yyrjM3bPrWPVi5RMIEkoMISmK8/3cqjneFwPTaRH8=@vger.kernel.org
X-Gm-Message-State: AFuF++m5CSQwUzK3C12gRjIKxohEuWHPXwds/R31x24dV2jzWiU4rUjt
	V/SPcKfH01AbVnEhGzFcrcBl5voj3KOCgHSoz0O25V1gWK1MwZf149v+
X-Gm-Gg: AYBFou22mg6Aqiy23vNxUFRObZbDfROUS9uJ5/p8FvbW1ETZlrDnb9tdrU2+gCpVfHM
	uMZ3/UDpzyXT+T2rRxuSYBJ5gjOmFsXlXElUzxKu69/GDa0D0vXP8dhg87JbEM9OxrJ7xoiMtm4
	XymSwp/GFfgVDjYP0CrLsyefnnJ7KmMIWkA+P3tbyUR+D+NLRL9S5gyIfXCqt7XxVucbZKMWoWc
	EsgzToRawK3h83Y3Dkc82dHRFsVFs2c91rE6EtasUKINQJl1IuKNdKINIxC2TUzoPkGr8Isb+4Z
	TsL8gQllu6UnnbcqKu3mIKOSkotQC77FvzTwFVq1xhYi8EYjuh1+KlTo/GT1R49dyIFlyiqFqrX
	ubYHC790rIfl6s3Gi0fGQ71OEG1dzuGRhv6F623N+XauaLuWKgMp9KhoeykykqlU82BGEWEZYS7
	4OEvp+0UpSoHfJpM26S9VLCCXK/0VE5MytFSSHQ+fa4gdFa60tcN5LTAeREZ3xT4UD9j5SGT1QA
	korUizgBzbJJyx4dWFyxkCBK6IaqCPAn8Tm2m1hWxVf4QS1f06axYKrAWFjvKA5YCzLGc26S0z4
	nWwZJu/cQzyTVUyFo/oimbMwBLG4/HakBsrHN0ty6aGdQZimTy7p
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr346389645e9.6.1788936658088;
        Tue, 08 Sep 2026 23:50:58 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm443222705e9.12.2026.09.08.23.50.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:50:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Haixu Cui <quic_haixcui@quicinc.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] virtio-spi: Fix virtio_spi_config kernel-doc
Date: Wed,  9 Sep 2026 08:49:38 +0200
Message-Id: <20260909064938.90995-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct virtio_spi_config contains max_cs_inactive_ns, but its
kernel-doc describes max_cs_incative_ns. This leaves the real member
undescribed and adds a nonexistent member to the generated
documentation.

Correct the spelling.

Fixes: 6a1f3390fafe ("virtio-spi: Add virtio-spi.h")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/virtio_spi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/virtio_spi.h b/include/uapi/linux/virtio_spi.h
index 8ab3c970cdd3..459c2276c938 100644
--- a/include/uapi/linux/virtio_spi.h
+++ b/include/uapi/linux/virtio_spi.h
@@ -73,7 +73,7 @@
  * @max_cs_hold_ns: the maximum delay supported before chipselect is deasserted,
  *   in ns unit, 0 means delay is not supported to introduce before chipselect
  *   is deasserted.
- * @max_cs_incative_ns: maximum delay supported after chipselect is deasserted,
+ * @max_cs_inactive_ns: maximum delay supported after chipselect is deasserted,
  *   in ns unit, 0 means delay is not supported to introduce after chipselect is
  *   deasserted.
  */

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0

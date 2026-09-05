Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B335B64C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788623364; cv=none; b=dKJymSobQ0hD31nunCbp1gTrHYqizB9G1x4N5RLsfLDPDPs6ntkDBUdduhzm6xsa9aLXxycpQHKITktcRvCAnFRiY9tJdeIadRt+R9LqmtD/LRtozSFsu00U6opwME+X6grrgoXTLF+6dOwQ4nTBDEPUDeJ5Rx8GpcsyLQy3eLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788623364; c=relaxed/simple;
	bh=O2NCH6fRzAKfFcbo2g+YXWIY+g3rn0P+J4It7kRFVQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4EF92xuaW6J3iQgaWyGhM3upjQ/8PAC1e3sZ4lPfDTh3/pt3wQTqLy8qr0qoKJriHvjKd32m70O2nex9Anm24U+PPJWrStriXV9ETBBt1nSO3I/dirsNN9/iTLpEQhMsLu0lWUGt0zizZV1Paj0QThHRvCB3hD1N+xmAhfHYXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJSTLiua; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJSTLiua"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1337572a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788623362; x=1789228162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPGHJlBhOsIhfLZxUC9HYvuAsWrMr3CvcXvz/1SrJ+0=;
        b=WJSTLiuacXC6goW8iC89g3AA0aieLuVkvQAfp87VEKu3dQrD0/BcYesT4p/fsD6nEJ
         XCeYuRr+pT1p9g8ddXLzQCqdEc7Fdcd/v6PPDiTVp/5L9CpHP1Ff6W8JAL6h7UxJ9Kl5
         QlqBOTrsxzE/ZJXwISG+/1cnDgjougUayg3hAtZp78v5r6mVU04lV0tp9kNJ9QL/HplK
         JqnHpCBLDtY/U6Skv+fwh0RITQGWV+C/YMrFrzjeiZxMsxuw2GTIWD1O3Xqmz/0+MRU0
         It8y/hhBiBNJgRY+AEUC/Lx3qZsup0cR1BTbd68SxVTvBksc3MiML5QWCgKaWaXzyheY
         zwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788623362; x=1789228162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPGHJlBhOsIhfLZxUC9HYvuAsWrMr3CvcXvz/1SrJ+0=;
        b=HSmYxxAtsIxfIsm4YK6NIAdp4Aka+SOWhl0XQP4orsfZ2MGaTKEmgx50TQcxF/iVc8
         fnoEFv8LU6yNN1CBTXZ/kZplfd+4B0DSHHkFHy2UIO8qax/tiCAVIOD/zr1OXctQ/edt
         Yf+ivXvOYQzRzrFQVy7F3R/zg0A1ILPAX5OMsaHU2FhauwZUsUgLCrqiz3+ZNSMMf/Zn
         efSbS9hEmCTZ+lO7I1p9N16evBMjnCSmnxIRa+FTHg/fech0G6QW9GUy+y+0whn2cQsZ
         U4i3qIdq/ABS87ePQuZd4S06dElTuxfe4WykRCWmnn1xmcz/DfT+l/AT9iwZLbzxQzds
         Ur1A==
X-Forwarded-Encrypted: i=1; AKwUvBy0qByi+ctz5ITRRBhDaCaQ686UP4TFupI6S5SQ06SIPsTH0KhJRmRxase/wZ6B43IMFOvU8bmtMMYPHYk=@vger.kernel.org
X-Gm-Message-State: AFuF++kAtYfM97LXNW4MBJ2LvE+/3cjh0MCYBrxuCen6K83fA2pvJkjj
	gWSI9Qll+6uodpOE5MoyxzXEfw/DiyaKp7CSVCJPchEa7RseESlAj9Nu
X-Gm-Gg: AYBFou0MWoANaRDvG+EobcE5NN0N96DSpRMB3Ze8jbIFvS/RimFgHuqG5jxOFCQX67W
	4r9/n94HIkSlgxuQfXa0k9Bf6+uZT2A/bXoiFkmiyPu3cvIhZNKriE5spV9gbeeq66iklq0n3kR
	GDOYpgNWEOLezqe8/fsbt5MXCv833682M5gbw+s7/T8ltTcPddcdq6viz3Z5gvqw/HInSMRhwXA
	25gGlgehoxrKt0gUUpN6R08FTvBjUNtnq/XV63KCUf//LjQgYXLK0GHR6mlmGVUNXMdfQbgi8yS
	F0TdtaOCsCDW8SaYliL9I82y5HzrFC++z8d3mLnq6fyZe6NM1O1lYdsqyGKa/lisAgzHFF7cJS7
	7P8ssaiQotYA1ZQ0tjafMZydBnhWfWQNGANItGlA/u8PDXdHVOTrtbcTmtVxLjraTUGBK4y5oFm
	6zemuP7zKwH17qdP8P+aWjl1w8OfK3jWSwt4lkkFA1YblUMHQz+WfPn4T5H3eBNYYN4s2eLe6N3
	OQ=
X-Received: by 2002:a05:6a20:5681:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3da39eacde1mr21820617637.4.1788623362575;
        Sat, 05 Sep 2026 08:49:22 -0700 (PDT)
Received: from MSI.amritanet.edu ([103.5.112.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm14555211eec.10.2026.09.05.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:49:22 -0700 (PDT)
From: Daasaradhi Mannava <daasaradhimannava@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daasaradhi Mannava <daasaradhimannava@gmail.com>
Subject: [PATCH] MAINTAINERS: Drop the nonexistent vsi-iommu.h file entry
Date: Sat,  5 Sep 2026 15:49:00 +0000
Message-ID: <20260905154900.1272-1-daasaradhimannava@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 917ace84b770 ("iommu: Add verisilicon IOMMU driver") added the
VERISILICON IOMMU DRIVER section, including a file entry for
include/linux/vsi-iommu.h. That header is not present in the tree and
no file includes it; the driver in drivers/iommu/vsi-iommu.c is
self-contained.

scripts/get_maintainer.pl --self-test=patterns reports the pattern as
matching no file.

Drop the stale entry so the section only lists files that exist.

Assisted-by: LLM
Signed-off-by: Daasaradhi Mannava <daasaradhimannava@gmail.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fb50c3ca..95b5a3bc3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28608,7 +28608,6 @@ L:	iommu@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 F:	drivers/iommu/vsi-iommu.c
-F:	include/linux/vsi-iommu.h
 
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
-- 
2.43.0


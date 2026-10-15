Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09700318EE7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025875; cv=none; b=VvVFOfITO5ctWehIuqCkLlssnaf5lGFTYlFXxrobgktjBKh81MDaOUxvoAE0LXgdIUywAAwbw2IhBdadwEHAGdZf/Vy5E0fRvmDHwiTpH+/OqafK0HMH+2BvPYMye7VIn5jmsWC0pbv8I9V/5XlDKHLnKNEQo86rUfYWrb1flr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025875; c=relaxed/simple;
	bh=2Ma9GnRZ1pfxKss3kXTKJt7xWTgrbB9CuG2Ct5tdYxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWCWYDFnYvLbW/WkqQY2ZFeLefxGq1mjtNN7jwrNLQUv27tblBR8T06oKAUnWEgRmvhRid5elctcodqhRfGDPyCqmUxbImjJqxLDZw7Euey99ZIMCqL2XvdOd2joPY18YhWZndipHtvmjJ6E3+aOQ7r30q3td0U0ALCn+N2ylDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=SotAyp8Y; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="SotAyp8Y"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso660188a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792025873; x=1792630673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vF71tENdAwcc/5EFA5/ur+3tYq0jtuBokrygU53hPlU=;
        b=SotAyp8Y52320RhY7JRNVnL5jD+Wb6ofMBdBCkKYgl//1reWVVtUukYi/R4M559RJ4
         MFaLidxe+nCp46cPAh2kyLUVbmN2eTpAqNWs3vJbq3Cj6KP5ykg6cWOBcHWc31tNuCNU
         xMdH9YYBptYu1kdfOjOvHXmBB0UPkeXrTCc+8iaKmK5ujCF8gTjjJhx2tGI6jsZOhLkp
         VT/+AzrjYnyzfndG1oQMVbZdNB90ABv5XwdDezh2YRBC8PJ3SOWO0Qr71YVPeJBA7+fK
         5iQhfqc1jIo3gfwuHkpy1zKq7sQ0R9LiOhbXd7w4vrelmy2woj64hNEi6vVkvq8oK0L3
         7oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025873; x=1792630673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vF71tENdAwcc/5EFA5/ur+3tYq0jtuBokrygU53hPlU=;
        b=y/M03GfluF7rfTU7wj8aAkJJgv1zzQLeUGvz8mlIhu2ZlcQChUkUXRSm11stxoXNPk
         mRgep8Wj5LtWkVY1nz2jdtTAmIhnjQZYru5cEpyp6c3eQxNM53up3FOm+PQBzJrcehyL
         VAvdg6rQiL6KGczYETmdOc1mChhBjp4yZ5/GK0xKStCnnXmcBdk6nmlvpCYsJVUISUBP
         GF9nW8Webmby/PsbHssnA4mO+P8hYPej6MkL4cUa7lOpXj41OoFU5ACE95EI5eqk+HOr
         oMftzTomj2w8G0FEExUMO9A5z1vC7ZgXRWUfVYyWrwv0D5QbO6ZZOXS4t0n6h2I/6TcV
         E6hQ==
X-Forwarded-Encrypted: i=1; AKwUvByv/P0/xcsSc3GnMBOV7XgvyqYu2oMCNCnuG4nc2x0K5nBhGaQmSMUaovdiThSKEn2oZfKPO/bGUTJMKac=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIh0tZ/sCtaz2vWLc52vP7LcfaRyXM3kN7wCHxSc25uWUUpsx7
	wy9c2tKB9hmNQNgSkjV1NMCzUmPOVOYkjVphRgkEyEH4nE52Y8zgZReVuAmwxPUZPng=
X-Gm-Gg: AYBFou0co/lhiTIFN4YdDJNi68oZA6fjcvqXP/RvITLajdFHLC5hmUqu8VDQYTMUmn9
	wA+FwL70flgAPtS0arZeyrXKBYJYoXDjvmoNF+VHXC8a7MhVk2gZlQi0kxdQGkXhXYUl2rrK/sv
	9Kk8JySaOWIqsC9xAb1LJxk8/L+LHPI7aLQehJvPJkPgn7uzFE3QRGPJj88WPTic9vboTjIQbbN
	W/r0ysddLZezq84qzhbD81JEHzdnY4zgrGBte6T5K1u0QLRx1GKwlF3wdlldFM6p1v7hennNSP+
	RzD3H8Jjo7zgo7AJgMkl/ZLD50NMRCIAv1bYlXTYb4KDtF/Zoi2C5hUaKzNBEicqkLT6+2R0/J2
	2S2s/hekzXHvuEhpAlBtGHkSeLDUmWD7NFZSh3CA8moh04ftmabCJ38lNnf6QAXYcqsf55PsVzA
	kzzjYY9z+MhKRQ4La7Z5UQlaefcCFqpb1a6cCTXA4aLFpMwiSpNswT+74JyOMaAKNG/YEi5ouKO
	Dnt7Q==
X-Received: by 2002:a17:90a:ec8c:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3ab3a9a8d8dmr16519426a91.25.1792025873377;
        Wed, 14 Oct 2026 17:57:53 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm999198a91.0.2026.10.14.17.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:57:53 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v7 7/7] scsi: mvumi: fix the DMA address rebuilt in mvumi_delete_internal_cmd()
Date: Thu, 15 Oct 2026 09:57:17 +0900
Message-ID: <20261015005717.3719956-8-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
References: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_internal_cmd_sgl() splits the address of the internal command's data
buffer across two u32 fields, lower_32_bits() in baseaddr_l and
upper_32_bits() in baseaddr_h.  mvumi_delete_internal_cmd() puts it back
together with

	phy_addr = (dma_addr_t) m_sg->baseaddr_l |
		(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);

but baseaddr_h is a u32, so both shifts happen in 32-bit arithmetic and the
result is zero.  Every byte of the upper half is dropped, and on a 64-bit
host whose DMA mask let the buffer land above 4G, dma_free_coherent() is
handed an address that is not the one it returned.

Shift in u64 and cast once.  Where dma_addr_t is 32 bits the cast truncates
to what lower_32_bits() stored, and upper_32_bits() stored zero, so the
result is unchanged there.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 2410d2aa147d9..bd1a8c1d54aeb 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -295,8 +295,8 @@ static void mvumi_delete_internal_cmd(struct mvumi_hba *mhba,
 			m_sg = (struct mvumi_sgl *) &cmd->frame->payload[0];
 			sgd_getsz(mhba, m_sg, size);
 
-			phy_addr = (dma_addr_t) m_sg->baseaddr_l |
-				(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);
+			phy_addr = (dma_addr_t)(((u64)m_sg->baseaddr_h << 32) |
+						m_sg->baseaddr_l);
 
 			dma_free_coherent(&mhba->pdev->dev, size, cmd->data_buf,
 								phy_addr);
-- 
2.43.0


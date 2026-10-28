Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168491;
	b=NnF7zYf4F7702OwBNhVoFkCcCCaxU0QgQTFaYMdyZp1RigTZEf6MLmKTXhMriUKQovO/
	 3MgjFxYU+BYkGvKC4MLLBwVoXhruAExblzGujntZZTPr5DJL2fe7ExFPWxCIAEIsSofIh
	 h+amNWnOkDn005ng9iudUgNQ9ElkWSR+9HXWQcU+JpAQTJsZs7mmcHTkZ6aU56bkEra3o
	 4QJ2+vtcS+WzRZkWpIJiskn+UqZr3FTaeyknz1BGWLB6sFd3YanF4lr9zbA+KO94oaKAt
	 zsjafHZsGfxPRqlAToDRue1eh1zOthU2NbEySXqZ41cgSq+QdUz+hlqH40GN8fCFYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/05ZaCRLQ9lx6QfXSfycpdBANncM/d6CKhfzXQZzHNE=;
	b=MPSW/csVo13bjStzqyQDqjmYKDXrXuKWTWEIlqo79CRiYZuKoj2vc8Vaoq0t3DYD4Qt0
	 LJNRsrPRhDUaC9eQaVPy5tL3VVss6T4hBtyleEqOVB457noMG5NAGFx+jbPKctJAcCxzC
	 ALNnym8Tdnulsz9BD5lh9ykFubljrwnU2/VetwnghDOfT98j/tTQguej6pV2zzNvspyE5
	 sY44o1ldn9Iex16+lVaZwismmmSeF96Trm60pnSRiXbjeTH4Ey2OQj1LKa9vzJlm0GdnA
	 H8JS2IhHlSELBQkJz8zzXuSmTTHg094oPIICbMXcSe4gdOg5Mg8mRVNQd7oeRv2cjiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hOlg+nA/";
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOlg+nA/
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e651c30dcbso1712235ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168490; x=1793773290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/05ZaCRLQ9lx6QfXSfycpdBANncM/d6CKhfzXQZzHNE=;
        b=hOlg+nA/4j3I+dum72siK93wRo/zZ5R0RYTABviO0iUbEAPzLR1Cn34yl1rcxDv97W
         u6sO2IoTkPGl4Jg67O5IQCEC3OXgZFKcL3YLDqfg9+Csvg2pw/EijY9vfpOPmRxSYpy8
         v0ElFL5/4xliuJZdTng6X8aCZ8GEi0sfl2DQdFPnD6QO3ZHEZepapdAC2kS+vLHW8C/X
         3CnQEOqinnayZ0ydRKNX1+BkSQ4iDh3097DIQp9VZ0rRyQBKgcH8M6AkNtK8uYQGowkw
         spxxCmzFxggsJ1SjimGPxJu4Bu1t5bHpn9679QGR9+OlSh4OnO3mDlUBCedmdiu9C0NF
         rYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168490; x=1793773290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/05ZaCRLQ9lx6QfXSfycpdBANncM/d6CKhfzXQZzHNE=;
        b=rwwsmCOOjsqmbSfyX84jGVcAuxAMcDY7jiQfU0jJxzIS8cmXZA159e3CBNCIIVPiaV
         ca+tChMXAlKqJz/1FH2sKoJjRTbfFdZI+vzvnmJacOEtzuvjCMdbP6RDSnHBAV/AR3IS
         sVYXyDiofIcTqNTJ4iOV4YK7MtDOP+iUHfqbFlk+c4/P97CEpz1koYL1APOgEM03qhBw
         zR7mE85Ncy3HMXN9au7nDLy9pdlBZO8a5kmzSzcz+Jp/xjtNfjgyXNLcGF985e9ahJqE
         9yjuBATJ4h5Mb8vDqcIbblMifc2+ne75hOM4YXpr4AxEDrRMojaJyCYLeSctkZOHqcrs
         NI5g==
X-Forwarded-Encrypted: i=1; AKwUvBxwSBMwD5MEz6aYDVBQudbiBvxyfYwZ+hodDc7yUAobtO/6qVEGWWbZeaikIqItARLJvR4MzdJzDFhosG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRaF6se1q/3iMnq8NFHwtv6h5nMmGky6T3RmqT0jxCuuwsL5lw
	d/N5iNcwwjOMqty5+ql3T4/ylXNVXsnDatJkwZGPSh5XZuSQRHZSJlRT
X-Gm-Gg: AYBFou1J8xqr5c7nANJ+SV9y6RJfSqIlWzFVAPByz1szRUY+Hwr3Rxw9Kola8gyeshE
	6MSRGjMPwN562bULqiDDEhI3+h2L5nEwMCFfMkbMA1nNUDOwimxyA9syb1OsOahUXPpTAP5+am3
	oW9+IxOCA1u0xhQdBuMLblhiOmqty2Gz3v9J1j3cjlN69OWjHenfeCEPmD8UWigCODoNh53rjCE
	ZYw8VcVD0zVo91FmklWwWFm7eRBLRh77blA6cj+6gnLkdjA9ZkSJ87HAsrnq2HBBgn20FLJpLNJ
	wDvB5bDp6BWO3qTrNlm2bRQt4VOsE1QALpXqogyXFWfUMDzXG3UtyoABiRBZwp2BOXXFYkd4BCu
	1P/+VaqEtQlPGo/zqEVwv9W/U9lnsDeO9qEh+O6v/OqXOsonWig8mRFBggzE8UC3pDl+grAIgHl
	0UQFQoJwS7ka++mLp0oZISlBOBqqd03NjaSnDOj/djV2UuE5kxSoGBhw/CFU5cs2mUfVFWWjnfD
	Pnc7MipPvyy26XtLGySkJFjj/9oIqVI330MZS74imfzlnxKMSwiqz0bUaowsGojgQx5CLlPhOlz
	cTGhOUe8YwFe4+SdwXRWlDmq6z2h9tJeFgPZWKkap836BqGi0S4=
X-Received: by 2002:a17:903:324d:b0:2e8:3d48:4d8d with SMTP id d9443c01a7336-2eaffb1868bmr15283205ad.0.1793168490216;
        Tue, 27 Oct 2026 23:21:30 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.179.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c33917sm17992275ad.48.2026.10.27.23.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:21:29 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+4a4f9998e2b4b490@bugs.sh,
	Boyan Liu <yymhvert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: sd_zbc: cap zone report count by buffer size
Date: Wed, 28 Oct 2026 14:16:51 +0800
Message-ID: <20261028061651.110435-1-yymhvert@gmail.com>
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

sd_zbc_report_zones() limits descriptor parsing to the requested zone
count and the device-reported ZONE LIST LENGTH, but not to the number of
descriptors that fit in the allocated report buffer. A malicious or
malfunctioning device can report an oversized length and cause
out-of-bounds reads while the descriptors are parsed:

    BUG: KASAN: slab-out-of-bounds in sd_zbc_report_zones (drivers/scsi/sd_zbc.c:256)
    Read of size 8 at addr ffff88802c8d2610 by task kworker/u8:2/37
    Call Trace:
     sd_zbc_report_zones (drivers/scsi/sd_zbc.c:256)
     blk_revalidate_disk_zones (block/blk-zoned.c:2354)
     sd_zbc_revalidate_zones (drivers/scsi/sd_zbc.c:566)
     sd_revalidate_disk (drivers/scsi/sd.c:3898)
     sd_probe (drivers/scsi/sd.c:4101)

Cap the descriptor count with min3() over the remaining requested zones,
the device-reported count, and max_in_buf derived from buflen. This
matches nvme_ns_report_zones() and preserves iteration over reports
that require multiple commands.

Fixes: d41003513e61 ("block: rework zone reporting")
Cc: stable@vger.kernel.org
Reported-by: co+4a4f9998e2b4b490@bugs.sh
Signed-off-by: Boyan Liu <yymhvert@gmail.com>
---
 drivers/scsi/sd_zbc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 56e455fb5add..6a2644a67849 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -222,7 +222,7 @@ int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
 {
 	struct scsi_disk *sdkp = scsi_disk(disk);
 	sector_t lba = sectors_to_logical(sdkp->device, sector);
-	unsigned int nr, i;
+	unsigned int nr, i, max_in_buf;
 	unsigned char *buf;
 	u64 zone_length, start_lba;
 	size_t offset, buflen = 0;
@@ -241,13 +241,16 @@ int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
 	if (!buf)
 		return -ENOMEM;
 
+	max_in_buf = (buflen - 64) / 64;
+
 	while (zone_idx < nr_zones && lba < sdkp->capacity) {
 		ret = sd_zbc_do_report_zones(sdkp, buf, buflen, lba, true);
 		if (ret)
 			goto out;
 
 		offset = 0;
-		nr = min(nr_zones, get_unaligned_be32(&buf[0]) / 64);
+		nr = min3(nr_zones - zone_idx,
+			  get_unaligned_be32(&buf[0]) / 64, max_in_buf);
 		if (!nr)
 			break;
 
-- 
2.43.0


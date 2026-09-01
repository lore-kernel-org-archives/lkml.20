Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C643945D1BF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248352; cv=none; b=Z1THYBni9oBPLpsF+lA+3E7UneMaNLdxiQ5FdI4Ls0tjcL1Z0Y8oRO4Fbwnx/7qYSp0q2EQp2+VslrRLrEfChkmNZSG8McglxX32E3kKes87YOGr5uyQe6M7gNXYlWdhtdpqNVbrYT9Eh6CyFwdoHRAGt356znoF+BbcwlL2vGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248352; c=relaxed/simple;
	bh=E4N9s6q44nZ7rlATktcHbNV/EanEgOqvGGncM+WppNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FSw32+JTIU9D479T/QTNz0FyrLIY8fTk7lx2b+YtFoUqrlZneCvs+IWoHe1dEVMrW+9QTY7fhaleucfilNw2Efn7qnlLGobhVR9RzhaIcRofNFmEMfRst/jeX6pO486I4NNBgR4uZbdwbszRLS/0V4aIuRAgCIGpOphn8E4FIkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMipeknt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMipeknt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so2109306f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248349; x=1788853149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjZHkrxVpcQFOwJwauqd2i3GemqcaPp8+D6Ys4sNuvs=;
        b=OMipekntUCok2bZJ5Q1WG0Y1Mn1pIKsGsPCRX9m2/71yM+y7uhuQr/azFNqZSy8e6C
         eQk3iqqt8lxoHAGJzPSj3EEPjNDvu+rBMOeRHhEQqDnRvK5DxjvkXUv8Dj+ujWvdZphl
         BYPMcMxmGZjab2CfNPtH4Q+3+qSKSW/OCMcztTQk6AHHNbq4u1FCuZetd6EO82U1ZHml
         9Z2GaQnaUMjSvK3zqARe5HcbbxXDpNStFblTv6pGBiHkCJ+aMxb3tJsV7lFE99ycQ9d4
         kVqYUGfp+c6bJv9cyniGwkVLMlPPbfLBAI7sTUaj4jRQ6NR1qWEMRTcuP9cRTXHrDXLG
         Ywog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248349; x=1788853149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjZHkrxVpcQFOwJwauqd2i3GemqcaPp8+D6Ys4sNuvs=;
        b=T1jS/OzbNZCIMsuDdvJLuwgFLVbzqrYDT73Q7k/yoQbGRgUQByVMkklXTrqR2bI5Zt
         Oo52lADoMuUdf6GzT4tcSiO6aT7kLIL5CKqOceT/eLg9Yn+NrhOh1vbVUi9OPJP/jBBX
         Qc9zA1t/aFkiH1Su5DukeV2zpKNBPQsCf/hgqLClarUVCjr2f0TSa/w6dMsNSy58I/oY
         Gohw5n6ZnIspFYWYBiJSzQyoGQ7cqkt3rYFecdhFY7FQ+nHRDbWsPl9SAhyj7Jkzg9lu
         m7ftZeaTlQGt93Ck8F5wWHyY+FonuqWtEcS2BvWMIamdLnQokXRPbhA7b+Y08yr9fj3z
         oagg==
X-Forwarded-Encrypted: i=1; AKwUvBy7FddRp6FEjeoxzhNiQdKQ5Vsil+hAv5+UHc/Vvmc0/k/PtU36m3IFC8c583LMCvsUuUmmBQVa8ln94L8=@vger.kernel.org
X-Gm-Message-State: AFuF++lUNYC/E1stAJGZtFXp5Z2MM9AJVDOxKQvsugTVwh5+2i4iQC9a
	QAC8H+glTCk89yum2fFf3fF0APiLpAXWIyBQJndX6HCZm7rzSaECvgTE
X-Gm-Gg: AYBFou1df/+oEcsCuL2rS8qvayf5wDCNW5khzGsJtbizYz2+XM9rDNlr9t4N0kWsZIk
	v4G1/TT2Jxl9ISedbnhflaZVL39dhHiObcEli9glCkdBFsTJhFHCbk7bU3gepGWHnEuH0uQWACy
	OS5TRSnN3hOowtwHVmc7dxTA7qeXoyZCtDZUnAcOziqssjftp5cQoADcHXw2cNh9+5rG1vXUVAh
	80fX6TeVWDCE5LjIGOQtD76YWK9hBDK+017BFauLgdg78QzYez8guCVZnUZlQGoCV8KvMX/C/O7
	wqVP56v+3TkxY35HfbgimNpnbh8s9fs5x8oDdz7Jv6sjF0nRlpZaB//E6DEbsTman2Zzsh2ikM2
	1jus8h8pLugiPcS/FkzILifBlzzc0fHDVW5/LYDzSz9/nMWogGDraxxS3scLYSzkH78oqcXoTPS
	3sRWrbCo40WC6njC73JdMcmbg72FHCZiFyGmC6M8/oMDNyJ3PWklTxAxmTfDCF1VOvqA==
X-Received: by 2002:a05:6000:4910:b0:482:a8b1:aa6d with SMTP id ffacd0b85a97d-482f79c1923mr50050718f8f.10.1788248348682;
        Tue, 01 Sep 2026 00:39:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm3014790f8f.13.2026.09.01.00.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:39:08 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Tue,  1 Sep 2026 09:39:05 +0200
Message-ID: <20260901073907.2443698-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The driver only implements the 64-byte OOB format the controller
transfers, so chips with a larger OOB (the Colibri VF61's MX30LF4G28AC
has 112 bytes) stopped working when nanddev_init() began restoring
mtd->oobsize after ->attach_chip(): the parity moved and every
ECC-protected read failed, including the BBT and everything UBI needs.

The detected OOB size stays, the driver gets its own mtd_ooblayout_ops
computed on the first 64 OOB bytes, and the data paths keep
transferring exactly those 64 spare bytes, so the on-flash format stays
identical to U-Boot and to the kernels that clamped.

v3 addresses Miquel's review and the confirmed finding from the Sashiko
report: ECC page reads now fill the tail of oob_poi with 0xff, since
mtd->oobsize bytes of it may reach userspace while only 64 are
transferred. Retested on both boards. Colibri VF61 (112 bytes of OOB):
BBT found and read clean, UBI attaches and the UBIFS root mounts, 8 MiB
write/read-back intact, and OOB reads return 0xff in the 48 bytes past
the transferred area on every page sampled (6000+ pages, written and
erased). Colibri VF50 (64-byte chip, tail fill is a no-op): layout
unchanged, corrected counter stays zero across a full dump.

v2: https://lore.kernel.org/linux-mtd/20260828085337.3916199-1-mehmet.fide@gmail.com/
v1: https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/


Mehmet Fide (2):
  mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of
    OOB
  mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages

 drivers/mtd/nand/raw/vf610_nfc.c | 85 ++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 15 deletions(-)

-- 
2.54.0


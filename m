Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9964119F9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363188; cv=none; b=I7I4uW1x6cnW15jAb6kqHuTz/xoAzGAOCjPdiWduiq2fdE6C76r/c0xJzh99abBVxiA3knF2pdwKIBxvGzfpB2bgddlXtirxfuFUvmz2zR1I40B3aAeBPkZumo3UMEXdpxeV3zGQjc8JDEPX71Mjj1on38F5vDXhFiICTEhtSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363188; c=relaxed/simple;
	bh=22OIZAAh7ibjcvrRXB3CKQNHMedxOCRyHyT2npXmdEg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gLilKoMzirCYHHAfyvZgfwrs2MrWoWZ5Vv95hMYHNNy2YwxEFhB7uB2YwIrWRp0Afpk91I/BoB4XICixc3DW0Z5KkdcrxahNMuQydZNPfctThb4dvIL6DNQ5TyrkVJ/aQuqXM2m3nwRiznyroBMB8C2voD81yjWIjkNlHEDRScw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncnnCgee; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncnnCgee"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so95310f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363185; x=1790967985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/VTim21cUbONkR5xr0XPo1pElUY4th2lja5IDVOCpg=;
        b=ncnnCgeeWQNdaPYRhNG8aMGVrYAntJHMECbpSYae4So2L6lErAGM2OTZaAhZ7jvxEu
         ZmtXZoqsydSQvA5vXnP7BJpjyTlhs6VEC4K8i4OyPMzm3WXiKpqPVqrPk+9XJPc0qpxW
         Vw1yMUy6/t9q+jFT61aTP0uGA8CKFI1hlezxLT0iQc/xfVFLw7BfFB9Tr8m1vbkXcoEW
         9/ytUoFbBr0LKkMYJYBkf+brMIMn7at5LJF1i4T5h6YN3QXtvq6ctPVrlGNut5l50KpK
         rC8qvFsgQPXN5q4bezDNEfcEzI1f6uxxUDGunE6GOwVeLbPQdnCNKBRKGNm6zEedc5lk
         cbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363185; x=1790967985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X/VTim21cUbONkR5xr0XPo1pElUY4th2lja5IDVOCpg=;
        b=F90DaBMJD5b1V6zSsNaztflQx2G2zRoGTTin0JK/JYxGlXhF09ySvQvQyLV2Qpj9sS
         gtaSRxsBzeiPVl76PUeKBgvpgWIdp+6hdtwv0qTeI+rJe3fAMtRLL2Rz0GwIoemkGzwL
         6JFsKIHD3O7e/8+nH/lAYWQWf93st7Bqa7SeA662n6IHKuOLonG6cXFjptkJaZGszmtA
         c2wZbz3gBeqNl1bmW73lENqp6hfydy0mo/hX0hS5mgLugy1sSR0qdg7NTiDbi/Fcxi4q
         WteiQKxDyK5F5Gv+aAqAUbdzBOsjnRWnXvv9ijiklt50slYim8eKtM9PcMOjwjXY6F4i
         ARig==
X-Forwarded-Encrypted: i=1; AKwUvBzmg/dsmsnQLQf7Tf8jSWxNFYj5jhDcGnJv9n24FOz5wE+olTmQDcDpP4q28j/fbJfaR14hJvE2zQrTCTI=@vger.kernel.org
X-Gm-Message-State: AFuF++ksTC4o2KOJoFdmK36+620lNUlkvFnSgEGGgaFYQivb8VSLVngp
	JF7h9UUC3jz2uwa6kIIO2l2V27+qpQ69ik8bD28RVd4LumKN4i46806M
X-Gm-Gg: AYBFou08qs71j2hsl/Y8Sq30DnAtsW2eR2ZGo7hWkpPvqorkQXN1qL174eqDQDpAEtY
	4EM6Nc1bca4SHDW0RS5366zatGpkRfUFw9PBw8SlSbP9tn8aT0nXIZV6ulBfeeSUG1aj82QEXBX
	o/fA80YaEMXr9GsXX1ktQ44kmjqUsJljKuKgOpqESa7onrJtSay6cMz8MoUATEqybvPYvbdvT+8
	LHp1Xqy/JVEGLjsxzArsjNVFEzlXC4wo2LO/3P4YuCfu6mHE4ahbfTjAYSMxjthK67eZWGJz/25
	111jvBDHjma5HnZJJZvulzo5hXhpADBQc7HU9qrTyutIkMFYrZ6BAgUlAe80FevKnn5gdZAJRQ6
	jGJyF0WImjV6lE1eQ29jzDb5PkmeLWH2o1BMCDg1rRTmoOK9hhq6EdqmeaFKkpEJh79lkRUjK4q
	l7pSKdtSEDiLHnZs58BUmZK0Gqs66Mu6V8bDQSfR2Z4JIGam5XKyiKxcLqIEsNKv3dN+QQAKZEX
	L3KUGFmt+VGfJs+lprIHlal/QEqmZuMTyva2FA=
X-Received: by 2002:a05:6000:41c9:b0:487:f31:8037 with SMTP id ffacd0b85a97d-488716c227cmr11887423f8f.14.1790363184973;
        Fri, 25 Sep 2026 12:06:24 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:24 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/8] mtd: rawnand: qcom: share more common code
Date: Fri, 25 Sep 2026 21:06:09 +0200
Message-Id: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQrCMBBEf6Xs2ZUkarGe/A8pkqSbdsEmmkhQS
 v7dWPDqZeANzJsFEkWmBKdmgUiZEwdfQW0asJP2IyEPlUEJ1YpOKXzYMF+99oPFNOlIOIcaNgy
 EjoyxwhyMPhJUwT2S49cqv/SVJ07PEN/rV5bf9qfd/9NmiQLdTkglu87IVp7HWfNtWxfQl1I+y
 pDnkMQAAAA=
X-Change-ID: 20260922-qcom_nandc-share-more-code-febbc0b5ba8e
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

In commit fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")
lots of code has benn moved from the 'qcom_nandc' driver into
the 'qpic_common' module to allow using that also from the 
'spi-qpic-snand' driver. Yet, the 'qcom_nandc' driver contains
more code which could be used by the other driver. 

The patches in the series generalizes several functions and a
simple structure then moves the generalized code into the 
'qpic_common' module so it can be used by the two NAND drivers.

There should be no functional impact in regard to the 'qcom_nandc'
driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit messages of patches 1-6
    to match the actual code (spotted by sashiko-bot) 
  - Link to v1: https://lore.kernel.org/r/20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com

---
Gabor Juhos (8):
      mtd: rawnand: qcom: make check_flash_errors() more generic
      mtd: rawnand: qcom: make config_nand_page_read() more generic
      mtd: rawnand: qcom: make config_nand_page_write() more generic
      mtd: rawnand: qcom: make config_nand_cw_write() more generic
      mtd: rawnand: qcom: make nandc_set_read_loc_first() more generic
      mtd: rawnand: qcom: make nandc_set_read_loc_last() more generic
      mtd: rawnand: qcom: rename 'nand_stats' structure
      mtd: rawnand: qcom: move common code to the 'qpic_common' module

 drivers/mtd/nand/qpic_common.c       | 131 +++++++++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c    | 184 +++++------------------------------
 include/linux/mtd/nand-qpic-common.h |  17 ++++
 3 files changed, 172 insertions(+), 160 deletions(-)
---
base-commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c
change-id: 20260922-qcom_nandc-share-more-code-febbc0b5ba8e

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


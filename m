Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018BB3C3F5D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280278; cv=none; b=cg/HjxQhs1FOmrfuzYp04+feoJiKoAKudOiZx4809kEgo1ieixmIYg189Gzdko7k1DOCe4nIW/tAYub91Vp7uEkxSeQs2LjrrlPcu/+fyZ3/2OaTSrAol0D5akwEJZJGClCQBYwsBKwFbs50XTPsd0XixCvOWqi7C8od7h6cFkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280278; c=relaxed/simple;
	bh=VCnyWaZgqZCjMfLHMZPUwLRxFzn2Oig9hajDjVY7Bgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NDRUnKwowsKZSl9tybiQVw4hnSkfJxd1aPRPKhhEVXTsm949vNwasTlLRBBN1/GIgZhj0xk+EyMx9SmkxRuyvUJEPdPimXxCOnM7+jllWtbjTgnSdZoXWyLbcB3IV1fRCcdGLK00S5JfpNAly0CTsFPJtBpY+ZXjugdaTg+95yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0YztkpH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0YztkpH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so138719f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280275; x=1790885075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2R+nn9u8Zi1z83iJmw6e94KrJSKxHnyAo2dWuLxx3Y8=;
        b=J0YztkpHZqZYthXItoe3w0hYrWbJOWBTIBkmHZSSXLTPwIalFOgIgtYaFTEPQDjv6k
         RoodkIaE3Dmu7KW9GPcJQ8e09MJYJlI2RNP+8IWp0fgE4JkgY7VkAfjGcIxb+U03G32q
         YEdtuYCNUgBR0+xS8HGI4ihm5QOhh0DUCOjI++ZGN9SApwBzVKgMpUS3QGHFDTYbqNmv
         d/M79Q8+6eNdcNIBIS/MTRCgSczyDfQRi1Pqp8HKadIGFdUmLrl7aMpF6BoYSgyn1JkE
         7NZugNzo4TnMhLbiqQyAjcR+WN2v/H9cKa/QYw5IPlnb+Y8cdYnjF9IiL5xttoh5+FwJ
         3N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280275; x=1790885075;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2R+nn9u8Zi1z83iJmw6e94KrJSKxHnyAo2dWuLxx3Y8=;
        b=EiwzfVapO0Lgz2s4xlMvSzPSNJZ6O8Bn6WOLO8AMaPyxw2AWtNmVGSb70LGtIwCTRw
         Atb0Pcv5JZNsJbdjopjVDrXGlbcJzxZHu25RNG1xyJcQaPFqutYlh1bu49IYF0q4mvAu
         Rrfp+VJzeALv+VcAKmAv+YPF+lClbchdKt5eB1f/PkOfPxMZK3PPZxbIaAvEZ4gr4QNf
         swF80BrGsG+AGzYvjy3S58F96CXvq/wjB4+KuTNZ8pOxjMKrDmcNHkBfztMAmgYQB8Zi
         DQj4cIUNh++Ty2jhpyogGe1qh85W+yXKAV40ZTTMk5Utw2mTaSdlQ7nny1Mj3LBS6Lo2
         FWrg==
X-Forwarded-Encrypted: i=1; AKwUvBxGQznGjzYUhmybo5R249LIZQjheT7sLrB/RUKnBuFXJlpBo20m3H9qDARe/lg7JFjP6T+QneQn9GTof0A=@vger.kernel.org
X-Gm-Message-State: AFuF++lYz7ZUDq7i06cNYmIrdFXz8khGx4uKJNPeY5Tg57EGot1mcIW8
	bPL86cyggLiNCGyRRw3QfOtIqq4UN9zPfu1JGEFWOdmwIWP41FLphED4
X-Gm-Gg: AYBFou3qIidBTkxzBpBp6WcJmaRZFP6jf3lvbmYV1SJGIqzbYyonASVe9vmVX87Vjru
	Vq6R/kg6BndxAXyHozeyhdT43EQyDzgpbF5DpK8HpVkXHFkgi5dUe1nohJ8K2xhg7juz5Cp+CuL
	fVmU+IldwaUeogfxBeL2R06i51BIhTIG/i02sDMAgI/jUPtVS+rJkSWjxZo6xuU5h8F7TMvtN+p
	CmreSjBvmU4/ESxL8JeQvG49msOzDBoXIS3kvsgMgxrHA91t2MQWWxmgCefqdJ9HKDJCrKhQEtI
	uaYloaIM/fe6KBye7/yNvwMmlRsFBjM4rGXKz/lfMwECma6Gau2sK1Fl6upPtA3udlBqseyoqLH
	1d1LRz9t/V2Mynsl2ryHsxH3rDWgmgmdKG7tEGlV7ddrj5hgGAK18M35tP/sN+GDsx2ULH8Nbmf
	iwHr3URYjjj2ZCYYRhJm6LYBhGs9VNFW6x5ltwGnwwVBNoaybT9mEZCNo9j2Qq4Uv+HESieAgHA
	q+MW2D3V3Wukl3Y8xJFtcI0G9Tbqr72OisaYw==
X-Received: by 2002:a05:6000:3cc:b0:487:b4d:8810 with SMTP id ffacd0b85a97d-48872ac72a0mr5781371f8f.39.1790280275102;
        Thu, 24 Sep 2026 13:04:35 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:34 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/8] mtd: rawnand: qcom: share more common code
Date: Thu, 24 Sep 2026 22:04:15 +0200
Message-Id: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDsQA4r1KiIlmfzWWZhoAiKId
 2/o5sG3eTcVZEWhsbkp49SiKVa0r4ZkdfEL1lBN1tjevK3lQ9L2iS4G4bK6DN5SjaQAXuC9GN9
 5N4DqYM9Y9PrPp/l5fk2hw31sAAAA
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
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260922-qcom_nandc-share-more-code-febbc0b5ba8e

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


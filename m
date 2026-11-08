Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177742;
	b=UJ20Vcba/dSFnkbxcD6RmVq/3hINF1zF033eHNCYzdfvkOrLkeewc/r9aAZu/VHWi2IV
	 Wz//6NY1i2E11V0zq8KHVZ80h8XJIIxpVu+Uz4T7XivMu0EzfTu2ZBn8Z0+PwHwmHVSu4
	 bhN6/RpQx/dndEgnKus70ou0MMiU4JoT516hqbvABfXdp0GFJEBwWY8n45MT8t/PH8KPT
	 5tjFxRb1IuEw/dKRNIGSHxW7/K4xQ2dsdR86yU2vOBmYC6Q6GNxnI1JCOxApIcf4Mn3YH
	 ARgUNh5KsSXnUEHxrmRrzfn6F2egFwc8HrQMkRljIBMOU7tdeKXrMimvixrVQv7UY3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
	b=4rDNfSc6yRJ6JODZFJgf7yUaRyDXCUeBysS/sGh2aj06QYJmphsA9bBmqAPmvrIoiaAs
	 4X9TYSOuobkDgHP96+mnNUrQOP4ZSGTHwQfxVsN/3J87qFYmq05KpJ/AY58NHNi3dSNot
	 td413CsXdmeaNnE/XGVyb+xxaKruTxoLavvFfGXw6oegIoVAaSZXSzM8GLphAchvDn2AT
	 pJhFM1FogcvRVmhxgUjxS30r17ltNcJny9CaG9ciMZ1WQKmS/wbi/iVpTAKQAePlioxkb
	 Ck4tYuh+i1DbqGCmee7Vi2vz4cEnuy0GtTBv3IVCeYsa4AS/u3SnMB0WGEeLK1ox3Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xJT1q/n9";
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18650606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18650606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJT1q/n9
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a76f63b243so304338fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177741; x=1794782541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
        b=xJT1q/n9GOguRU28bqvGuRagX2zSp26ZTA51clxFlNZK2ZPQwAqkPBuNiiZer5WA+M
         Updkfe1W5t6vuT3k+dnzacyHK1cJ2LP5H+0/fUOdwpeRs4WGo2p8PpmjPVd7/3FIVPXN
         vPET8tp1/BrLYN7pEhlEXIbxKnmCGoCXQG2nxDmIGrDtTu33h3HXdqsDrtJQQlPkywBI
         vD2UVuW98P/NNZG1qoksgn7M+kLLXxVqQx8ZWKyTYkKewfa28vQxqmHKM7+xr+QKqEdd
         Xzn8S2kQiIonEejA8cKwCe3z4/bD0a9vu/m9jSsdJMd13aujGPBnLrRawAsP/y1pflNm
         h5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177741; x=1794782541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
        b=t6TGRSPWrXXVYN4XKtcTUSHsggm/9jFYfOwCAkxBTyO/Nwgy8mBsJQjGABVh/pGC7+
         LEFUxckObuU5V/6MGyHoN62X78JVqhoxWqmYY4vXpx+5zL/3kt8BfvrPH7tLd/Wv5A1z
         D43ZTTRbdjEKQSLA8d9paLt17V9LzQZcxLLUG1yICGbmZIQ2pdXnd3o77L4h+VBuj5b7
         HKYan3Js0scCXi+wGzxP31Ef35p+GqtmDH6G/+A8PDFAXeooEwjmtVqmDS71ydxjxdtt
         5+avO+DkK1J3Jq8YLQEspwvAC53GicuDt+ENoe4V7xNuYK8SboOJ8oYU3iedhiGL6JiG
         ltZQ==
X-Forwarded-Encrypted: i=1; AL+hErGWXyZBmhcrsGdko8IcO2Rq0OfP2a0DVUfnZlUoywwnWt8uJ7xEDRk/EYatKjvmEOTKIMoh6C2l+7gUkUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UF5JtsVuX8eKRSdZJPT297jmZ8F2ok0+QUrbq20KUH4gvs93Y
	TtxwW39WEiCcb4THmmH9JAO258G4/WzYpNk3mKJCqIaBEfxhBnhTdUJ+
X-Gm-Gg: AYBFou2AvyK9QfKvi01gZiQDRwugYoVFIbzRPfm7gPHCB7M1v6ney27BTZSHDUE8//v
	1FFLRq2PYjIbHMV3RO2OJrk05/u+2vRYmSjSfBfIkFoUNHxJ6p3Y5HtvKA38dWFOQztwoLavZK5
	7CphlX69bKup2gFfzy99lTTyJ2+kmlbPgGFtnsVS14JNUjAGqtJVU5mxt3Rx45yblXWH2YKbez9
	+8daCmzkkT8ghxb/4lCcFZZ5ANR7oLPbcHehQBzcl8CdhEmemThFr4xaMEvqRLSfdELQm2QKHSI
	egm05ROfb9ztpfzNemCjyE1T/UweKV4JSAFUm9BtbVqJqJJ9p3v7YpbOMz7N5bkmUXI66EX4i0R
	GPscflxWihoS1fJ/2w+LuZ8ntIRP7gR7F7o6o12R8x+e8O9PsI9XV/uYGymDDqelR/DRoDfplCY
	mXf3YFNQDKn+9w31WMjuBImafx2yXJ+nTw2G6W/isr/jL2HUPpc0p6rolYc/XX1slN/SZvSa+O+
	Ht8/9VXqcG+7laLAKJxUOmhggXPIR//G/JjURrDZb1ia0IIhfycAH7dQ1f0h4+bgFvcwZv9/GPD
	J4FS4p9T9J+tT9hbj7L9vZKcNP0xYAdSr5O94OXRaxAgvhw4x9Qo64A9E8aWQ6sIFd+UomEigYS
	gB1SgI5ERdnXnicY4ZIfwEpj8uHnfdE1As3C/RdXrobsuTBuxCQvxKHBbzEt6luWJ5aajmj0ap3
	u0g4OCngVLbDIf8dPdZCwXPPG+qdyAXQtPrU8OObh261LYCHo0cLHfgg==
X-Received: by 2002:a05:6808:50a1:b0:55b:f88d:6e84 with SMTP id 5614622812f47-567fd57f184mr2789475b6e.37.1794177741024;
        Sun, 08 Nov 2026 14:42:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/4] mtd: rawnand: qcom: unwind failed child
 initialization
Date: Sun, 08 Nov 2026 15:42:07 -0700
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OPQ7CMAxGr4IyY0haSikT90AMaeJSI5qAE6oi1
 LuTgNiRvDz/PH8vEZAJg9gvXoJxpEDeJSiWC2F67c4IZBOLQhZbpWQN4dEOFOFu/ABOOwump6u
 FG/sWAZk9BxgVdBUWtSy1qnUlkuzG2NH0eXQ8fTmZLmhitueNVgeElrUzfW4N0a6zf+1winneU
 4ien5+ko8qeX6jdv6FSSahk05VSN6g29nAeNF1X6Uyc5nl+AwsHQcIOAQAA
X-Change-ID: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Keep the shared BAM transaction usable when resizing it fails, validate
the boot-partition layout before publishing a chip, and propagate child
probe failures after unregistering any previously published chips.

The first three patches fix layout validation, allocation failure and
controller-wide probe unwind. The fourth scans every chip before
publishing any MTD devices, so initialization cannot race with I/O
on an earlier chip using the shared controller state.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Add a patch separating initialization of all chips from MTD
  registration, addressing the concurrent BAM replacement report.
- Track which scanned chips are registered for probe-error cleanup.
- Link to v1: https://patch.msgid.link/20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com

To: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Christian Marangi <ansuelsmth@gmail.com>
To: Sricharan R <quic_srichara@quicinc.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (4):
      mtd: rawnand: qcom: parse boot partitions before registering MTD
      mtd: rawnand: qcom: retain the BAM transaction if replacement fails
      mtd: rawnand: qcom: unwind registered chips on child probe failure
      mtd: rawnand: qcom: scan all chips before registering MTD devices

 drivers/mtd/nand/raw/qcom_nandc.c | 72 ++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


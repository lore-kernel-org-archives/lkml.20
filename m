Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187771;
	b=V/Q7VYvyQaa9y6gH2HKSibVcrLePkqInWsNvVdN+IkLhU/hRATg27uVf97ZiDIryLjzg
	 o1n6l8lhlzqm/a0SC1Bv/4SFSkdZ1YY8YbllnRa8ob/1rRSXww/A50ROS2TvVClkogzED
	 H0WAuJBJ3z3tz4aWyRQz4zDIJYR2dTM8p3QyxnZMKw44KnYpnVxSr4bMrYwxQAj//LVhv
	 sqCr44CuurwobJxIbe+CEnVmA1zuLfnC9bo0jRms0RzSgwiJ7LDF3EqZbWhd7FPq2Ufuy
	 GBpOpMr1G26vf9om0U3yUqyi6ukF9+fe4TLAAqIn0rE8ceVbi05CVJBKg0aSsFIvFzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vwaqv0RwpQdofsLvckQnMd1MHOnW+8febEpuFJFq6Z0=;
	b=1qiTbuhkeiqxpyhn9XHAqc/oBaXrz3L24wLoWlW0FusVnPxZTkiwkw304Wh2pdkDbr8E
	 69AkRl5c3sJKwpgszUIAZdXnZH2gZ1o47c8k7uvKW6pmNTSQUiGUHTM/br9YEcgIZVc1P
	 aquFZAgeOywFdhNxBu+kk/EZrK0cT6kbOHe0CU0nv2iracpaImmPue9sF0LbS8fx1AQlA
	 SjCykclbh0UByIDl5CIwI/vTjvtLGVWwBlntyizV097oMuVDLwXRqILtJujK6TnkjbW66
	 xvST4sgXqASGsjML6cp+1HqHMbdMUEts/luHjcW8+biUfVj4gv68Z6wagLALDBP4Row==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrOgFll0;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656E606A798
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3656E606A798
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrOgFll0
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-563a0462094so168824b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187770; x=1794792570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwaqv0RwpQdofsLvckQnMd1MHOnW+8febEpuFJFq6Z0=;
        b=xrOgFll0qEqVePCZJdJngiYJHQMhBeUhj/zyRfNtgWtx1QaTzb0tUCo978ZZORSWDw
         qjOIsad0WHYh1iVH53CXWvNObodiQUidTSeL7BHEWwyybYK+fktaxGO3fMwdXIrX89sg
         26EUNF30nH5yJwvvBqLFy/xe9OdK3wpRvT5sgxkXTMbODDZl0vt6uqQ+a/l2d9bwGMlW
         AeKcBAWyG7yzLIAhrYWHAw6UC5EzLk+8lA0F5te9L0zFLbzk0wNXk45M179Af+6i5lxw
         9fVmYmPMvpUJatJb1WXMOSJkqTeFldNU/Sl027w1R7Xr1rFFNJvlrQwEPhfKckjou3Gi
         yJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187770; x=1794792570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwaqv0RwpQdofsLvckQnMd1MHOnW+8febEpuFJFq6Z0=;
        b=FHdsjvcMHVlt9cSftyQve+EsTZy9eTwAleNRiSWyvCtLcehfE6egjpsL9ueUxSzGLN
         Cvj+D/37MoH4dZH3jNTVGsFJYDuDTRgDIGDzZHfHe4M7nnj0i/eRLdd5MVlIRd3zVWmY
         yOLJIpPvy2bTI5W2DEsRMjzIHeGYhpa9AEcT3BMQxrI/GGw5FF2W7JAHQVXMpK62ZZDB
         A0hHmuwjh2r3DgHmGxaht77wVg7jbi7YmVozs8hZG2MCzdtnBUHq0EnhJf+E9qd7rhqJ
         DPRiTa2memZPlLHMCkYn4sD5G1Sz2D+REIFQPcDHfn0UiiPPD2kH5HtPVuqQBnWhqZbx
         cvUQ==
X-Forwarded-Encrypted: i=1; AL+hErEO9iKnL3s/J0xJKtSdaNkkEP2ZPQrlLY284cKIGAKYsWDSuXClzFt/3Oh/oUjRgCxOQxPaKL9WsFfwbkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SiKcogQh1Mbnx6FaZdyY3MMPEYSBw9SMARZiO5pUZP3evJBGF
	l00DfQySTkWZ/5poH3VtJ5tav2/KGQtmlocAWLSs9Kz/F4FY7vXxXxsI
X-Gm-Gg: AYBFou1vocC7s2nocr+SSSIvhVjoS9D5ujr1QuJRLdaIMxiSIw9RbNpE3qUg3sI7lIG
	N2QHP4QjZqB+nHcePcmPnjaZ020dcl75ZNuNsSzmaaVmitNOuH5g0mOJtysmmBjdAfn9/fAZE7q
	0uC62UilWCDMW/zXHJpW8EAHCzc5mQ+4oDlR179L5xFk++6xKaGqZArlkomoVfoHCAUB8yuoXMe
	tUXtgfY3/DlimHoin2yWjcDnPi2QLSGExd2CWUUtADxD/7oeB9uHLRCmDqjMQ8Lf0SXZJtmKeJ8
	/y4oHOmN2bIhr0rCvGXYmhf0aZPBrAy3sefV0Auge9wlW3JENbkv7JVoUgrp5y4plUoc/A4HGWL
	29P5E5Wk2eQ6/MRewOZgVGffUNdZLGHZ/koh7OBymVtuuTp8z5KOtovekwvjuv1YQ8hbxyMSj0R
	lL1wEC7N8nZrg/L69WnMp7TK3qRsmw7Zj2jo8lWdNbI91FtA4LD+76OtcystmYxqyggh8EzH1sm
	2qvIeS5tPjeNuVTDo7pRx5JiA0zfVlgD19oDVlmtWDMy9MO83LJ6kEsnmfzN2Ag6rWgBd1eO/C+
	YS6QAdJDa8qksMupvFmCOWAooHi64BekEG3P7alPFkGM6oj5Db3ZbFXkopVM2OIqjqo4gg6Dylg
	wAJUTox/K4rP3fkWRF/eXD5DM6s5+B9apCAms0NsEtE+c0A9+Nk+NcZbavdNe4KCDaJuoY+LjfY
	5sx961SXviuftDUVhBzkZBMenWkymmjAQ00CVyxItiWTSX+AV0Xylj
X-Received: by 2002:a05:6808:191f:b0:561:fa43:1b17 with SMTP id 5614622812f47-5681460726amr2343413b6e.42.1794187770252;
        Sun, 08 Nov 2026 17:29:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:22 -0700
Subject: [PATCH 3/4] mtd: rawnand: r852: use the standard OOB write
 operation
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
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-3-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

r852 uses interleaved ECC placement to transfer a complete 512-byte sector
and its 16-byte spare area through the hardware ECC engine. It supplies a
custom OOB reader but leaves the OOB writer unset, so the NAND core selects
nand_write_oob_syndrome().

With one ECC step and no prepad or postpad, that writer starts programming
at steps * (size + bytes), or byte 528. The subsequent 16-byte transfer
starts beyond the spare area instead of writing bytes 512-527. Raw OOB
writes inherit the same callback.

Set write_oob to nand_write_oob_std(), which writes the spare area starting
at the page's data size. Keep the interleaved page callbacks for full-page
ECC transfers.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..e78606b97b42 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -833,6 +833,7 @@ static int r852_attach_chip(struct nand_chip *chip)
 
 	/* TODO: hack */
 	chip->ecc.read_oob = r852_read_oob;
+	chip->ecc.write_oob = nand_write_oob_std;
 
 	return 0;
 }

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372355;
	b=FPpF4a85U5222qbVxKeaH2lRlGf7A67l5cEoNEvJ5UmleG7CPz5YuCS0dBp6P25lbSvg
	 aLVsZYDk+Zlm7InJGboCK9AHj/OLqayjAsY0fhaL0cNaitB6hMoDllCHWleNnb0AyHi9O
	 E3Om/fswjpqacSlVXQZ9fysOC+nZytrnG/+0EZZh45m+7fs9q/kJ+licfoXHbh9RC5ms6
	 QBWnjWr74W2CGNs0HsovozSgeilVqYjDcvwwqlbhZai2MoX26nBVMIlyUWpFpMCekyJXB
	 fDGLekMqfMDXNZL52uQBR9Fj9twmhkHIPqdFZkg6uBs/TbbTbS7GONq1kIgmkf4H+sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hVkmZ1WIXgJlvQFHDNtXyCBnlHJBn9Ta4BIDwcxaHN4=;
	b=fzluW4ZxUINU+MLlX8tbOE8AgoLrJuy8N/Dy+u59DCHmJs6k46MM2bYtVSexLb3P+Sm6
	 Slc+RaCew82yiPQhGF8T8uzJ29qfwW60OwBcdb+rh5lPNyWWL8x/3cjCwbF8p4GX5QAqr
	 y5uRSGwiv6MJo2/dtI//bVllozhRlU7mweDurB4pjO9rzk54w631ADtSvgXut33eCp4xE
	 g8m+4w77ymZ3EWnETe54iCj8I/grEHXFLfaxDTnWF3JnqanL/hsn0I5RPXj59uY320aPh
	 avJCpFoyMsNmfuzvWZvpSmlO5ACHO+i5QlKi3AyYAl1C4V6Vuoib5YZcEKmz2AOO6OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmDxv0Do;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA3F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA3F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmDxv0Do
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfb76b304so90630f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372353; x=1793977153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVkmZ1WIXgJlvQFHDNtXyCBnlHJBn9Ta4BIDwcxaHN4=;
        b=AmDxv0DokxBAxYbXPzlUeaUdPj6tdb+jyhsHSgcFGXoFqssoXxLGA6FKNIdvPZRdBZ
         5SMmdCPeejpwS9iTYvJe+VMM7zDCcPb87DTjDR+D3I/1+BYOGsho+BbDn+8UTLQrMZHs
         rnf/ZrwDplNUo0VFmyR7v4TLZdDKDcDMUm9RVFjn1BbMQAbp5dUyYrH2akDeVDbaqcSE
         bncUOzNvQMq8jiEWy6RY91ShRc7j1cfL7wlx3+6AzJppF5sk0cXGKeMF1ucSDrbN8LO5
         1tCT33M4yqlq8Ikjylyf98XukrrEcx1oaYLF/gXjSBzZwAH4PU13DlUeCQMjjslRndBy
         IikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372353; x=1793977153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVkmZ1WIXgJlvQFHDNtXyCBnlHJBn9Ta4BIDwcxaHN4=;
        b=n3PgdzbjNog3XhaqXhHyRFmSPjGKGZiJ4yjM185JcgiIBRI5pSp68aLuqVLzJLCz4g
         1Nptd0fPEJbhXV6RIKluDgqvTP6JY29fjkMUWMCPfX3cNPSnFdCEWlNJRB3Tyq5vzWFB
         BHQgLluKIRNHYHkr3noTF7s2i7sup/qzvoEzBWyRkleJRrcYIqNqv0G40FyR9b+/xPw1
         F+L/SgmbxhVkomlUhDKyMuRv1Um49kHajqRfxJOGRyBm45tJbvEZuMicIudUFXTKQ87n
         gF3ddE4eqZZdyYV4ay+lqTVzuNGC25gdMCb/bk+JjYDxF+zPVhXem65WOKrjK4F3ms6q
         di8w==
X-Forwarded-Encrypted: i=1; AKwUvBxdekRlQjuU0M0GZ4JIKKFzH59QbcTxMnCXFXUxv3GCus0gswzUC7cZER2vJKeNMO8zAWz6DPRV9HMvnYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF1lWhIGgPHwlbEYH435NA2kiHHWJjai7tfUC7IJRLCvicgLZW
	7pjXUjzZqMH0znS6qBdoGTHMTWrrIMgsaN851+NQ3RT2TqUI/dGsTkLp
X-Gm-Gg: AYBFou1BUbqeMYyyKdKIua/giAAgaXfIJ6wy3Vd3h25CIiSoC3f3pSK+ov6kHFPkUG+
	42dVPj9/kAT2hmP0XdpqaT43psA/WRHIquaoPvUBTqazw6WXuYEap8mssSx5xRp6IfZ/eTVoFNg
	c6Ox9MW/05idefnwtm8FzUBXaMHWE+5ap5fWBIBG8mYPEhzEz0CcKKsCR8slVvIEU0bXlZRfrZl
	yhmzSJr+1YEhVmGzz+66CSr1dETyxbAAVbWw7Q/Mfq9RdgO/mAZCs+6eqagefy6/+FQkBac2kFm
	ZsLIIc+TUF+633p8UhqNl/mWoVU32W/1thG1V04yyrEtYk3UOPgtnRIoY+Fxq3KIkvDQppHPych
	SB2JpjyHHsKRR4QHp6vuIcM+wSrSMPDNSHUUSWmvJ3N5EQsAonpoa3nostjS4qXINpKC2Ob4/Zw
	RNN2M16BbZpEV2WiJhSLlhxt05eaL0Hr14rM1u+dcjxtKh78TLSbQ/F97dOYLTFCHcj/CaRk40a
	ZNoGNMWacslkX3sGUQwNZuBBmF+k0yE7hyf7+Yn5a0q0xWOmKFk0JaN7mVIHfvqyul9YCIIeFpU
	e0TCw3q6++iUhwwl5cYMfur+xHAQejAbI71HVya8OeUIvEPnkR3Wrqkn/YsvsYGimTV/Vsorb6A
	2grVJ4UKeKiBlOmHtHioGQRFMdAb42Ubyb1g=
X-Received: by 2002:a05:6000:2885:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-48e6e2c2536mr5889612f8f.1.1793372352925;
        Fri, 30 Oct 2026 07:59:12 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm3584086f8f.24.2026.10.30.07.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:59:12 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jyan Chou <jyanchou@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] spi: rtk-nor: Limit exec_op writes to one byte per operation
Date: Fri, 30 Oct 2026 14:59:06 +0000
Message-ID: <20261030145909.285144-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

rtk_spi_do_write_and_cmds() issues a single writeb() to the data window,
so only the first byte of an addressed write reaches the flash, yet
exec_op reports success for the whole buffer. spi-nor hits this when
writing without a dirmap descriptor, e.g. for OTP security registers.

Such ops cannot be rejected in supports_op, since spi-nor probes page
program support with an addressed two byte write. Clamp them to one byte
in adjust_op_size instead, so spi-nor loops over the buffer.

Fixes: aca8cbecdd2e ("spi: spi-mem: Add Realtek SPI NOR flash controller driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260930071125.529791F000FF@smtp.kernel.org/
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/spi/spi-rtk-nor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
index 75856c31d2e6..55ea7c371854 100644
--- a/drivers/spi/spi-rtk-nor.c
+++ b/drivers/spi/spi-rtk-nor.c
@@ -357,6 +357,18 @@ static bool rtk_spi_supports_op(struct spi_mem *mem,
 	return spi_mem_default_supports_op(mem, op);
 }
 
+static int rtk_spi_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+{
+	/*
+	 * A write through exec_op is a single access to the data window,
+	 * which programs one byte. Let the caller split longer writes.
+	 */
+	if (op->data.dir == SPI_MEM_DATA_OUT && op->addr.nbytes)
+		op->data.nbytes = min(op->data.nbytes, 1U);
+
+	return 0;
+}
+
 static int rtk_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 {
 	const struct spi_mem_op *op = desc->info.op_tmpl;
@@ -449,6 +461,7 @@ static const struct spi_controller_mem_ops rtk_spi_mem_ops = {
 	.dirmap_create = rtk_spi_dirmap_create,
 	.dirmap_read = rtk_spi_dirmap_read,
 	.dirmap_write = rtk_spi_dirmap_write,
+	.adjust_op_size = rtk_spi_adjust_op_size,
 };
 
 static int rtk_spi_probe(struct platform_device *pdev)
-- 
2.55.0


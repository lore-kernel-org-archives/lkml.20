Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388698;
	b=fW1EbOrsPY+9cG6PGZaloDjMcq/hzENtdhd2mMuC+/Sh5UrTNbF28IMcksk7/Z6p9hk7
	 XhDgrBg7+XxLhzgSD8V7K+L2INiMIqJl7zP57tV/me+vVzTem2JpPVKCHtNyC0lp08Hyc
	 YQ7JtMpBzMWl9hkowMYD7LTc4Exro20KpQC1AKnnb0A7hK3KfDq2pDqrU75RbZLptC2BI
	 OT25DoJ+YcVGz7po+KivbiN1tQu+MPwFmpyDimuiNE5KK81Mr4/1K5gIL/PyUfra2246l
	 j5PonZmDCekqMeeOS930rTih9sPf/Rqa+ERg5dpaBhi9GX071RWy0VIOPpI6ARY+ZOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=if2lsNwuFNgP9iiP+gqcgFzaOaNYnTJU5/abbjeRaD8=;
	b=xOmTCs7j/keOHehQpa4BGL0zyEss9Byd+Q1kDt8+Vg3HfMD2ho/RvF2KuWuBYwXtYKnq
	 x4rAaIFt9HEVao41SEJBODgLG42dujiyc7Qr2CP6pVSoK5bYfJQCCwJjSoHc4415hplLo
	 /TQ2zs5SNUFNp82TDbAR07F3ODAwTsQKfTAWJnK1/L6WNyGzcxB6nwpqnDr8CISXXLn8p
	 C1Z9J/Hl9zVmbid60bZ2yX4AO4NH6TVy+sUpEnmhowrjKAYwS7ThggYXhGKOaenwFrpdw
	 kFhR9cW0+WTiZOPexPXDdkSPit4uaNc+20AqUKzH6fR6FCp90u2oyV0WO22cnTwVn/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8Yq7Q9R;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0C606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A0C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8Yq7Q9R
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso267066e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388697; x=1793993497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=if2lsNwuFNgP9iiP+gqcgFzaOaNYnTJU5/abbjeRaD8=;
        b=b8Yq7Q9R9sqFjCVOktBmyhjKXL1Vf4v9VIfIHqJeZAEKwFqFGLiDdLEff1vqscpzGO
         rjRlccjbwf4CIVsLtInbTqQmJ1VNeljPg7ZFgRNCv6mgzyVfmY8BI93Z+8P65gx8pBhd
         Q3fKeGszXYO6fi+pI2yqg3eA+QnoCQvQNpGT47pZw4yTwzvCE/RYiZ29SKEF5Hnv9CfL
         vtWF0fKigSTyp7ZUUnQStbvyAXbXrGzamd3DqN1dlEPULFmmJYPp2JqcXbWx9YEV5JKR
         uZcAv30VyEqLv7T6/KjaIQQBU/9xLcTKz25bkEWVsxzoRehRHBKJpmT9LWnRsYEEhGoM
         /RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388697; x=1793993497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=if2lsNwuFNgP9iiP+gqcgFzaOaNYnTJU5/abbjeRaD8=;
        b=LCF1akwkO+Tvnx9BoEQbLKhwRmT1S1K2GQ7j+X5ABU62K4RmQoJIlc70sKoVtZnTl2
         LHO/rXjOE1q+8/inFGOWRQ1uVl0X69FviJEYDnTNHTrSgMxMiHAjXu+gSxjO01O9i1Sy
         8xSJVlX9qrs/fPmrZ0idw9bZSR6QPAASpggneTBaOj2CD8npD6Izo2zb9ACAp34OuCaQ
         myelIAHO3zBJyBAFAeeampAeNZuDACsjyKqCC5reoZZHfaCQdzdThO3lECVricQxIDc/
         5QmRlsn3q+fLwQr2Sv6ZteB5aS9crv33V/9ZxGnZzcRnoC0KHtFcPYSPYYDGxYirkgvI
         08WA==
X-Forwarded-Encrypted: i=1; AKwUvBxvKne2cTVxS//3VTfcQm/4tPlGTRHqcvnOurk/8W5l4uRca9OTSlyCafOMaxP61tg6AXhUBCfRiuhg4mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXvUHjL0hHwGalHfo5H+GJXFM2c7wSawsOEZNcuPvZTEuY8oGG
	zjuPM3pr/SCniE8IrCgY8njynD9XX/wOrSilpmtHGHxeuqZBATiXGrWp
X-Gm-Gg: AYBFou3JVZfJr1OE7dUA5Lpz2Cbm33jhwPmmPPVxFsrlQLjqkcYFPDDIIMqtYSL8PVl
	nteawwrKVF8QvbzkE6OE7/gKy20dCR5LPwAA3RUFTN+00mRK+l98ekcLAah0YAHs27gU5UkW4PD
	xy1mBOaYy3Wpz10cNqAkeGGZLSAmRZrFD/XUwxfzm/sVKV8HvCC6bneq+9vnYtuH/BKEs3tv6JQ
	CxMHOX2Uk3M9RW3caLP/xzXavgfS7o/wNBJ85PED99AoPTxSZZMgA5k/9Bnd84c8lrMhpIlg3/y
	fg+myxKgElfKu6QK/TApls8Uh9ZZvrKFAgAA1hzOratpufmqQRdB3YBLJJpOKyz/G1/JbpEyuyQ
	eDhfed0viLuhrfEFCMGGvAAiuIgYGkWtFxL9EseIpfteCj27W4EpyGpKCSMxqWpW+dENIwSOcEo
	QA/i9hFU+wz3ExAB/+BMiljo0QQCxPclMRyoUUFZqat9+hG6g7h6GtByJkQjDQfdGXBqMLGqAdG
	sUizCB+K4MtOK71/ewKOrOkEOS8Ebea5e9W9SNkyviGd7rAUnR3KfIwNSnAuMSXG63d7R4ZBgFt
	BFedqtsXIOYXforf1Rg3nuAnBm3GakRW2fFSQ8s6LG+AExAmsHhiWL6NiBfi
X-Received: by 2002:a05:6122:8b0a:b0:5e1:c1c8:9ff9 with SMTP id 71dfb90a1353d-5ec68515f92mr1845617e0c.2.1793388697480;
        Fri, 30 Oct 2026 12:31:37 -0700 (PDT)
Received: from munique-a520 ([2804:3bf0:fe29:ac41:2d94:706:4bfd:852e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bb872dsm3671250e0c.6.2026.10.30.12.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:31:37 -0700 (PDT)
From: Munique Feitoza <muniquefeitoz4@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Munique Feitoza <muniquefeitoz4@gmail.com>
Subject: [PATCH] ACPI: processor: idle: Add DMI quirk for HA0QING A520
Date: Fri, 30 Oct 2026 16:31:28 -0300
Message-ID: <20261030193128.19493-1-muniquefeitoz4@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On the HA0QING A520 motherboard paired with AMD Ryzen 5000 series
processors (such as the Ryzen 5 5500, Cezanne), entering deep ACPI
C-states (C2/C3 mapped to I/O ports 0x414/0x415, corresponding to
hardware C6) causes severe system instability, random hard freezes,
and memory corruption ('BUG: Bad page state' and list_del corruption
in page allocator / LRU paths) during idle transitions.

Restrict max_cstate to C1 via processor_power_dmi_table for the
HA0QING A520 board to prevent the processor from entering broken deep
C-states and ensure system stability.

Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
---
 drivers/acpi/processor_idle.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index e113bcbbb..49768b176 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -105,6 +105,10 @@ static const struct dmi_system_id processor_power_dmi_table[] = {
 	  DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
 	  DMI_MATCH(DMI_PRODUCT_NAME,"L8400B series Notebook PC")},
 	 (void *)1},
+	{ set_max_cstate, "HA0QING A520", {
+	  DMI_MATCH(DMI_BOARD_VENDOR, "HA0QING"),
+	  DMI_MATCH(DMI_BOARD_NAME, "A520") },
+	 (void *)1},
 	{},
 };
 
-- 
2.56.0


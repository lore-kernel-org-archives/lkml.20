Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721207;
	b=ixwgY9ZTCOO8fTbl9aT27LVtC/n9710wGs5B2YPjzKwFs5imfdrCV8d5ZwQR5O3MT+AJ
	 TEpCV2rgWjiR2C1+uXBO9hGtuyKvHdf2sILiWpoDf56O2aXI1ZAM2AFzy/o7lsYs0avMh
	 0x4jnizin93/wO7KAfqZCJV2Q0gLsU9TELP49O4o/kTakt0CCieLttSnRTTpCF8pflUM1
	 KrfEVPYi5epeKkjydEvQ+hTnglkq/ft0trU34Jc7+y59CALQdq/dxf+FCnhlBamhYgPh2
	 JxR5s9JR6LKI/xqbK2Z8hLbbSImMtcxjPaKjwc0+lz3+LBvvat4SO9JJBh16b2fU30g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
	b=4A3IEQ+ypUZfWlO1bLD2ydtyu7XozlPVZLtn3Mvm7kSXrNqafik7TURcq9ocUKESWM/C
	 uObZb94opd6hXny/2QiBpVzbjfOnfDtBTJCPpzrUE2aAIkv0JZVOjdt8FIiWJOKBnFRGg
	 XzzI8WAS/jxaEvaq7Tlb364yJSuy/y0btB6Uff8FlhWE7aH94kQy2LVOnRdxdQpZx/Wxq
	 x2dyjO6NG/K90cO03M3SnckH0W0U1Fm+lxnmhgSlzMsaCgll0d1Sr0qUXJCW63hcsBcnP
	 ry6poUutbQr4HcyLvKT9+ig546xd7v+dfQTk6nbolSsvVjjD4U0r8OvQl0sIrPZI43Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yecahwDX;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF5606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFF5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yecahwDX
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4af52002471so9253325e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721205; x=1794326005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
        b=yecahwDXyL4ixwjwAtwXtbzFW4oCartcs77hkEkNndr/+1B9/2ER+Goy8hgElFvZcp
         4PANlbS+T5MWn9GWy1sLu/scTX+ZuZsledXUZo4y+t4NQmFj+umbmxqoXieVvWXPC6JU
         kajMYHvs72ea8bvnsPsYipzb//43xDBUPNWjBH8vwMHfzTYNiC84PTbnWcF5/mPc1Ozo
         3fcrzoniWqx7iUdoVWz68jjQn8ILPVp4+b59gw60wG1NwDvWybW9x3BSTCZzthBA2/HP
         xrrkG2zyPVLK2SYxovLADOzd5fP31/EDWT1OHTOMgF/RG1QuZVcIaKCLl4hK2PsXb4kO
         Swbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721205; x=1794326005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
        b=PX3WbCpieQfQcV2h6eYDznixggix7iiQ1yfj79vtZW8ap/uIIp/AjF3V3Tri8lyDo+
         Y7nhoYwvUZLem84I4eXIi/+KFUqT7tEAyhmP4r6+cDsAc3ariq1lkUse2eBsgM4JoxMH
         xfqrEplKBsTk03HJLBIUb071V2cGTrE2PIAiw5bd5DhArGOjyMr05B27HPvUkGEo/WIm
         ZpwVadGrpE0Tn1NKyDC3f55DwLA/IA+c70dzNsOMR5Uppzcj6uWBVjeVCq48QErrFcph
         v02pCSH9j7oMLFWdZxlRodn5Kixz0uLCubeao79NyKrdP6ApmeiMfPqs1jFbEsc6Cdd6
         f/gw==
X-Forwarded-Encrypted: i=1; AKwUvBw/LXrga8odhW9b9DpiDry3b/QxlQa+V4QTTnmTbfKwaAtRAtbTqmd0F0jVHdRCVd+cV24ONENm7xGQMYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bYlRGTZjAaiOYHJtoBBbEjCO+etXpd0ZHmlZ7Um6OGE5OAFua
	p2WgbY0CXqcHeuxx5Lyqo2uVuDufWD/JKkgIvDWxDSxxEqmed8KxZNNS
X-Gm-Gg: AYBFou23Mcf9LddFpv7+CyToxEgUMhUENCVjUGlNpCfifcH9jx9FEa0Mkf28ErPXY9+
	2bdAgtn4SiVxRSTjd0gwjLpDmxIL/ywMDh5D3FrplZkcFS8TN9j6S1HegZpMmp6qy+8i1vGjjLQ
	7DFvatqaEoYXsyYAhwmVn8VCQfyU7KVvSlRMwjYDKICjFtRCi4+cbBNqUryGNbzYheiYUYjTU2m
	twwVFY+DOT4g8dCdpCAAv4UaB/9tdrbDndPFRTUTFQd1OXRVWVUOH/KrehUk/3YWQ8rxyBd3RSy
	oKBBGLbihXSzIljelLLgHhk/vO8LtSnY+l0wk6zbcswSyJAybWGZkehsmZrwi4Yi2NIEjvz671M
	UzyGrMTtM2ZUJmUi6jPvzhAb9E2UifQqRaWZV3CXBusILq2xic8KUoENBRG+/j+ZKURiJSBUE20
	kVc/umCznuzs73BnahFpCiX/gy/QKjAYdzMaRB7H5HfLfuGj7MmFCOB9o/fcy9Be8GW1E5ZY+T6
	rvyGo3d9cdoxN+mUt3ycs7qkeg2z/jcuEqAC1K7omJIWofy+5Wk/DEhkySv7fZ1C134R8Xe/Ao/
	dloHV0nVieu2lYx+n/U5KhxXlZAUJc65k3bHS7KUvDvaL01cYlQ=
X-Received: by 2002:a05:600c:4897:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ad5ec2d3e4mr152905945e9.1.1793721205339;
        Tue, 03 Nov 2026 07:53:25 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:24 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 1/3] media: i2c: ov13b10: add an I2C device ID table
Date: Tue,  3 Nov 2026 18:53:11 +0300
Message-ID: <20261103155313.114347-2-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
References: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
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

On AMD ISP4 platforms the amd_isp4 platform driver creates the sensor's
I2C client by name ("ov13b10"), with a software node and no ACPI
companion. The driver only has an ACPI match table, so the I2C core
does not bind it to that client.

Add an I2C device ID table so the driver can bind to clients created
by name. Nothing changes for ACPI-enumerated sensors.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/media/i2c/ov13b10.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 242a95834..d33fb7032 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1706,6 +1706,12 @@ static const struct acpi_device_id ov13b10_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
 #endif
 
+static const struct i2c_device_id ov13b10_i2c_ids[] = {
+	{ "ov13b10" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ov13b10_i2c_ids);
+
 static struct i2c_driver ov13b10_i2c_driver = {
 	.driver = {
 		.name = "ov13b10",
@@ -1715,6 +1721,7 @@ static struct i2c_driver ov13b10_i2c_driver = {
 	.probe = ov13b10_probe,
 	.remove = ov13b10_remove,
 	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
+	.id_table = ov13b10_i2c_ids,
 };
 
 module_i2c_driver(ov13b10_i2c_driver);
-- 
2.56.0


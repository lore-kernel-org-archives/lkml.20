Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082571;
	b=f32/NUDhd92hkE1tSyrgGNTFaKay7irUW3GhxaaTMjQYwhnHedUIqlSKf9Zrgw7RDdRE
	 nNZq/gGQaToKQhSymldNfttpK1TvbgnbBLj6+vTmd02AidWiNUwFy19qznNA6EggvNNSv
	 XjtAsg9gY/cjfko3SRFLM7yd7uYsHwoMWrmCgdmNt6Gw6P5Nt0SbxvnMcjsLZ7auBrXLA
	 zCcw+7dZffu56YSlLsR9SbSHSNxrUSfM7ViHjUu/LgaAG3vi+9PKBDB1uyT+t4vKJM5RH
	 AwOnrkPc48oLzDSv0Z/nDEZKQxAN8/kFGHHdzftT88kCJJcEe7LIm3nRwyim7pwpC4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MRGtR/xM2hkitb9/TQ1LM0e/3K3eoc1ThDALVep6pH8=;
	b=UQ5/gFo9A+yXThy9IH9nPmWTi/h3DswTfdWWLOXWy241q89CX4G6hq9e0uSfxMyG0xs1
	 g034F/NLCakNNmHv10aJRk7n4cW1tAqDvs5kP0qwS7vL0jR/8tbgiug/L7R7DtmLhlklG
	 DJcnYO6JRZlgyotoL/poKL4fx3yzdL1Mwg0309XneE9y9X5FyTuCsBTNRlD8oCzVwsGA0
	 8mfQ8oSc39/i8k5TIUZmJ6ZR9k3Msj+DwA1WKrTe3vsStl8GlL2mmhyzjNbQ0bbDuKSR7
	 QBqpunNHDxrHfc5nPrKA2Q4v3kW9rFcZ1XiNhet54kpy5zRh6xxCm3wuN3V0aj6X1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZVhQxWN;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55B606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B55B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZVhQxWN
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11105e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794082570; x=1794687370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRGtR/xM2hkitb9/TQ1LM0e/3K3eoc1ThDALVep6pH8=;
        b=MZVhQxWNfMYU5hB8FHNQ2thbUux2qMhFmANkktLXSu0oY+V4uh5CcMcXqT+dDlQ/ix
         en5kHuRMLHLDnHmK1Y6M1Lc6Tli0+2hKtnNnmOEToXp8AWy3HbaUP8u3adql60MovtwK
         oOIXtCDeYKxdnQ3au4PcWTtrV+FOpAm/pHTvSs4egqY+RqwRAxCiC09beKmeq4VpzBX+
         zresHB3NeTfWKhhg4PSnRaq9E70uuY3l51ZjvqVJ5RGHaRPq9hrM29vznWVI4eRxpMPo
         of9sq8+UBA4XsXdkY09BKnZn71uknKv9e7koMO8jbe2dc604VjdmtTce3h5aO3jEx+sW
         g1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082570; x=1794687370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRGtR/xM2hkitb9/TQ1LM0e/3K3eoc1ThDALVep6pH8=;
        b=H6pSsWY+yu8UAbgvxm0z6T3YwcA8W+vTLItzz5V9SgHJdNNVFyevIgQME0bvA/zYmM
         mbZ2kHKLs7WvOBfH0ZcW0uzZWNsBDot2RKOne94vHFo741fWO9RlsW4J1FYV5qjvN/i6
         GV4ZsM8fjqvUrdNHcCp93xGiX6Na5Ua5Z8EAw9Yd9BknqDsPpa9rPLEuCWBXXgYyzU0E
         1KD/GHcKdzFUXotueC5kzfS4lfYxtCM/Hq9B4fWTLb4uzNOfej+ArVwBzDupNct+QtH4
         7ag55DFwjiaNuk4nOw3pE5rlnLP5v7h70pB9cnaa0W6EiLgDwHznYqcGCADk2ki6V6NT
         sEaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqe69eNu2XRylX1P8srztEiVc8tFDNFHPGUMui/84XTiBxJ23OxA+ek+y0NKehzbeChLoN3vblB2qtlHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vay7A7inN4zCvi9VUvW/rLG6xprxYwqeKt01vccxEa8toFaEu
	xqLimCaeYAAFkLKXeUm747waznKObznP5L4iMWet/EEc5fDRiGpVvGqY
X-Gm-Gg: AYBFou3qMNBbU7M3jzg7KZse6JAVBVJKB+pwyfhBFZD7vqcNcC49b3AC2s9WQ5jfX43
	LkewgZsOWHE2h67wjL2mvq+vLBZ8siq2/0XSxaznciGUgV27tCMqbyg+yh7SiMkt2MTyVv4Z6MU
	iM45lK3MRmEOznTG62DGfiGpL/CN6R142maKk5bZztA2aSvB4kApiPNB6Yty0ZmiG1IeHW3h2SY
	9NpDHqkdgvv4CtONLEjxJWf517k/F6mpocjXkowGRwSHCfRsk//pCQ7WvQYl+ilNf8eIhLvSAWj
	nUsBQPFxO7SZmqcadiKkDeyWVryUNmWVeT7DT+RFwXlqPqs669wEpRd12ux7bIXmsA76J88ZbyC
	85dPu2CfWEDVL5vIapKMpz7tmoPYcSeLvYt7vD78YmCUYwusBF8GgsUsnqRCyr16+3YT1HVCGjV
	Sc5RYXjWsNb1w139Qq0XfNkNMwKfhcqIAT+FRtW/ZFnb6StXvU7MVldlB+WRT7M6JnoMcgNrhe9
	uxhDci8pl5BqBfPLpQenTlYAvGouZdCRqkBWE/6MrFiKX2mfI5WHXFSOffxOuRbZkRv9sMT8775
	kPPFfEJw4HmJEbqofTfdbad/t0PwFC6YlHuy90wVqD5kRpQ=
X-Received: by 2002:a05:600c:138c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4b6df6df5d9mr103278195e9.32.1794082569692;
        Sat, 07 Nov 2026 12:16:09 -0800 (PST)
Received: from Amir-Yoga.tailec48ed.ts.net ([143.58.202.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm230762005e9.3.2026.11.07.12.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:16:09 -0800 (PST)
From: Amir Sabbaghi <asaba90@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Sabbaghi <asaba90@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ACPI: EC: Add quirk for Lenovo Yoga S740-14IIL
Date: Sat,  7 Nov 2026 20:15:53 +0000
Message-ID: <20261107201553.9268-1-asaba90@gmail.com>
X-Mailer: git-send-email 2.54.0
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

On the Lenovo Yoga S740-14IIL (81RS, BIOS BYCN29WW), the ECDT
advertises GPE 0x6E for the embedded controller, but the EC is
actually wired to GPE 0x43, which is what the DSDT EC0 device's
_GPE method returns. Since the ECDT and DSDT EC share the same
command/data ports (0x66/0x62), acpi_ec_add() keeps the ECDT GPE,
so no EC events are ever handled:

  ACPI: EC: GPE=0x6e

  /sys/firmware/acpi/interrupts/gpe6E:  0  EN  enabled   unmasked
  /sys/firmware/acpi/interrupts/gpe43:  0  EN STS invalid unmasked

GPE 0x6E never fires, while GPE 0x43 is left enabled with its status
bit set and no handler, so each SCI it raises is counted in sci_not
(about 7/s, 1.4 million over 55 hours of uptime). As a result, EC
query events are lost: the brightness hotkeys and several other Fn
hotkeys produce no input events at all, and battery/AC notifications/
laptop lid event are not delivered.

Add the machine to ec_dmi_table so that the DSDT GPE is used.

Tested by overriding the ECDT through the initrd with a copy whose
GPE was changed from 0x6E to 0x43, and later by applying this patch
and removing the override. With the fix the kernel reports
"ACPI: EC: GPE=0x43", gpe43 receives events, sci_not stays at 0,
and the brightness and other Fn hotkeys work.

Cc: stable@vger.kernel.org
Signed-off-by: Amir Sabbaghi <asaba90@gmail.com>
---
 drivers/acpi/ec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
index a89f10256..7c0643d5d 100644
--- a/drivers/acpi/ec.c
+++ b/drivers/acpi/ec.c
@@ -2007,6 +2007,16 @@ static const struct dmi_system_id ec_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP 250 G7 Notebook PC"),
 		},
 	},
+	{
+		/*
+		 * Lenovo Yoga S740-14IIL
+		 */
+		.callback = ec_honor_dsdt_gpe,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga S740-14IIL"),
+		},
+	},
 	{
 		/*
 		 * Samsung hardware
-- 
2.54.0


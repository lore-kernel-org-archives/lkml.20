Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B36D4A5EBB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439246; cv=none; b=cGCLYtqjK9Z6UoOgKVmo1Bwy/6WoHYjROQcwGGM2sF+RlA84TTDAbdzCSbzcQ2pmh91X5ueaa4laLc8c/h32Qye6X8C7Y4j5GgG64KjRCB8lh5SsK5oVfIJfsm5gYvsqfBjGn/7O1bOYoyj2hY5JC6MmgGN6nPK59R80qenBvc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439246; c=relaxed/simple;
	bh=MzLoYwkeZwxcJvYp9xUeN2jYUVgOx/RH2raq9hcPIQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZ04uexgQXZaaKHEdSAdyLFEzPECIMjVKUy0suBexDXZeDbLHGFklmgsuoDW/PGCxuVp/Q2XRcpJGQLqBMhkG8bFgus1Rz1qyU7yB4SNbmdBh77rNJPJ59BST2euX8g4YwQUqBrWT8A49sruUWbZwI4TUT0Mvt8c75Lv8bh0pXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dq6tD+MQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dq6tD+MQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47de0093c42so2309421f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439242; x=1789044042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjAsvAsIopDSNBZub+7Mzfif4bOB6ySUi0hXqRqFMrk=;
        b=dq6tD+MQoj3DWfP67/9AZGZXKg8GJqep7XHXkPM9pYbx+NaV+K6WBRRTrLzUVzQlt0
         w1R2yrfv6UruGN8ocS8OsXrGVZ6pHXD2/Du+wxmaF910st3h1oudDH0cfaKaR9sOzcsP
         OgTddvUoQ5Mt48ONV9wQMYEC4YJzwB6PZN1d56Tw8chnWLhf4szYTwFOneudoKAnYhNk
         jhgWdXvuuZ9ik/+HFgcDwGI+9K78ZSFe3jiCRcsBK/1zD3XrI/uBFI4s1XxHYUfI7f/D
         nd5y5IoGZSB1mgzUfGT6tKhwMtb20N218Ki7R+EgAOD0Gribh5G2Nh4HJSpY/JMttfmO
         PMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439242; x=1789044042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjAsvAsIopDSNBZub+7Mzfif4bOB6ySUi0hXqRqFMrk=;
        b=GX+CbBkT3A0ZJl3KIlDZkMU8n7r4PpgCBe85d4d+T7RMxSCq0fg1/ev5i7oubH+arz
         f8lA9FDABEwR9vLkAK+mZGdYIv0xcyq07iQwbo2YrpzWSu203x91AjsV/cyiBmeUeIQo
         hC8DO8wSqdUMnGJKYS9akBtk0+NsqJTc+GL7x2S7PKi/npdmN6UM7HUkmiKiakXfUqZl
         uyTAavPD1Qloc0lhSKauvEZy4QYlvRZ/O0c7Rc0UXtk+F9imTpf8ID61ss8qhvy9SMsJ
         FWgrX5haww4Iokp2i0oOfzh9dheidiWvhy5s+nTsFUzun+uxWErUuEdvV8k1Ui0uTwDl
         LmoQ==
X-Forwarded-Encrypted: i=1; AKwUvByxa1sASHGsvpSzRsfpRiJiNx0blttO9PmmFNkSrWtYM+4KKOSWuznuuzXHtT/EagMagugT8v4S7FNWxLk=@vger.kernel.org
X-Gm-Message-State: AFuF++kfFCsroTcYj0fG1+e74nm4OhhE4EarY04UOdUdNo4IToJLGKIQ
	xeoT9uhku0Dut1svIWsspsdbGFyNlPom999O9AEwlf4zLZ3IU+sYIIakqFc5SnuySFQ=
X-Gm-Gg: AYBFou0AEJICLeIaCyOI2/6jVry3wdLYV7IdGg+NDDaXOBX7NKMDZsWyHIN1u2pU8Ft
	Cqpp/MVLfXNgXEBPsYGtF3Xc1c8pvL/fDhrJVgh7d8geK6hI6nSf8XQejf5wl5vlq4dieGEYc1W
	JdBdsh7SD58ZeNO05wuaY6ONE80z5n1Tt7tm6bphAe/Edszhr2QOFoRy1xwxWNZKbaWn4GXjPiV
	5/2k6beeAc/hwz3WqUzmamfJHmGyej0ALchPzmyVeYaKwBkrp5GOcm+txGsAroS7lL6cZA2IcYB
	SLHFDNLmYo0ZA6r2uYrVym7lZZLsZwOvRzIqoL1/OKJHmoxRGndSnTykq/SAKoF2gAQDxqN2KD2
	ebEFquO54HEauPyesFYCQD0V4Ss9HpM0Ld9ohG2puxYZw4j5j1KusGBIowTCD7B1zfSKrIim029
	TDuwelbD0NhOa3o0Kuu/gvjRTILKU8lOo1NYyOuc7Oab6ek0k9UWn0ekdOzQ==
X-Received: by 2002:a05:6000:2c0a:b0:482:de48:c445 with SMTP id ffacd0b85a97d-48488f07dc5mr19505275f8f.11.1788439242322;
        Thu, 03 Sep 2026 05:40:42 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2e9fsm13847089f8f.20.2026.09.03.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:41 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:26 +0200
Subject: [PATCH v8 5/9] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-5-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=msp@baylibre.com;
 h=from:subject:message-id; bh=MzLoYwkeZwxcJvYp9xUeN2jYUVgOx/RH2raq9hcPIQ8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWXNnyy58wzOx8QufXPfrYMnz8S9Pd/zelbPiir+Ww
 rM57oe1O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAics8ZGZ4Eve7sexM1mfX2
 mibeSZvvttsoqpiz2Db0Zs+OWMNkOo/hn7rl4ZnStcuOXL+/7Dj7xKUTzT9cLvXv6r//t8dpwRv
 BSn4A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: b05a6c145001 ("arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d..b8af9ec81b0c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1d08000>;
 			no-map;
 		};
 

-- 
2.55.0


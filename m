Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794443339;
	b=3dHflMP5sHL6uQXSarAoAmW7q1ogQ6mxL5eEfyDwJkq277paMyXq93bIX1k2bmmvXwME
	 89eWhD9wbczGI13ZDanShFNjn4xvH4jM8OlSysznsP3i1gSRyU/8XKKmVnTnUxxk/WDxv
	 AqQuGeuudnP9c4m3mhgen3WERh4yTSv4kMMfgjhDKwXlY7y/oYM8naucgiCCIvXWcQRkd
	 3CIijesIp6j8GtP/PvpLHZFu7y/OertezXvHvPle/VOnzzPEZW/jhZtSY0JV1DyayMiza
	 QwHT7FbkudEz60vqhM4mUjL92uO+K0K5RUqCHV3ptQAjFgsyP0VMs2VTOfcyjgnZGlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NrSzbFzhb/48pQwefucbagWYjcsLjKvWanQjAidltxQ=;
	b=i+VjzbRksWKDowR4P5aaBBZpo5DTjJ48dhNDsMNfsLAiYduTs4zTGpBIGuF8JrbKySgS
	 /dkRnLIXTf/u5FVMK+cNwCuK7ljquohNhlMyncb2DF2HoHIyf4Jzx6M9PUr7r6/ccoWTn
	 i3nN7KSOZh1xDnjxtVycn+uCdM8WmxiSpp0K0oACzpteVoQYLUUgi26djzFB121H/H7Nx
	 Qw+WGuargVanZ8dJhlGoKRyTSYhqBtDGIKEAggEjoP4HVkSU/jSEfk4cZCmpv8MHv2dMK
	 fqw6WojDB1oqrsIk8p4Uo2CuWvKnmx7zbsb0VRzUbRmpK2LHHJVsZ2YEvQWJIYamWRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PAFYordc;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA2E606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA2E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PAFYordc
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b32b2e691aso4008997b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794443338; x=1795048138; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NrSzbFzhb/48pQwefucbagWYjcsLjKvWanQjAidltxQ=;
        b=PAFYordcAlFwxsujOd7fSn/4PQJ6fa3zPVS6mw55aYy5QF43dixpt3/3X0PUtkRqzq
         Un0sHWSZJcdTv2azHZrdTifJBVehAMUfZTakao+ijmw9SiJ4wy4CF+IXYI/JBLEBGQzZ
         PGDmzt8yGq+e3VAqiMx3dgyeWoGZRnUyCyWJmu0RPIvQEMkt0KVjs8V4AtRcd3aFbrqo
         HnqvhDjnevub0HGIGBNQ6wq2w9w/4T1ny09gndrXUK/+NyFrJh+ofxlhZyh9xMY7FWNg
         ffnW5N2qqx6jsey4o9v1NtDC0B030Obxowvm99m3FQbkALcAJS5yePSk21EEhikrmkPz
         AiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443338; x=1795048138;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NrSzbFzhb/48pQwefucbagWYjcsLjKvWanQjAidltxQ=;
        b=r7lz4RM+V7ikiqLC1g/1iGH1NSm40kksuT+8bdlXh1RjaQGhtWDvHuA+mJAZddy+Qp
         ZqBxfp70T7GMR0WS39r4TysBJuOcS2psKeQvZcDf/V0TGt5PJ/XvikQkM4E/MhU2NxX0
         2w1pJdoy6qODqGAzXL5yeiwLcdKztevsopgU30yFNK2ApuUQgbTJYsdzuuCQmtDU5666
         /9z1EgyrZ07NNqW6W7GYUtsQ/6nUy2f6q4e2e1VwRTI/vjFw/In/Aq7GrK1ZJzfQDtlN
         kPfpd6+rLjODlOj+ooHctSSdSytwQEouX+709mmnqqAogYvsnFc0ibZbRBNchZM4dDHM
         QdHw==
X-Forwarded-Encrypted: i=1; AL+hErEmkMtI4+Oy64obfLb/cSFB5fp5kWXxAaTlqnC1vBkxmBkqyq5VVyUMjVP/YaYG6AnhtsoxJp3HBApXTQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z81zMN6lZfTSEqaoLoLUfMbw8wRHLZjbdeVVg7YAnNIoRwbYXOt
	l3wqR+yc457KRvccWsgHaCCeRwlHdMZZfXtQuCZ19a7GqUEItGGMtAml
X-Gm-Gg: AYBFou0ifKzvHfXby5YCttqDLE/l9V8PJHa70lvFqhENs13JDK0pxPKyZS1uJLZiDuU
	40+4ons3UhFO/AyxDn6ODWP2VWBcr4qnZYHOmiAquS/0HW/DwFRo6RI998r8y2K4RkSzMXC0ykZ
	CEWX1jRWp7T7RIrLePA32wCs7I/4VN1a3tjgWgFa0frTx66H8+5Pj39aTfihdpjRAdQRU+kXSrW
	gNEFK4pxmUoGx6Y8aBQ7v5uQbJGzQBcEzl9ZjpgDvNT5i24P/0/WAgpxLWfsvx8u3wmdcqSTkxn
	uHDTRg2CG9++HjYz6F4OEbBg/GrzcUHGnTNh4q6ZH0X5mwpfgRWkce5eoRttHLtjh9Fidpl9erH
	PfwuIjxBGRht57GzasV0ZOQqvrimk1vKEPiuioUnpXNnULCDXYkJ/Sd0F90Z2LW9iQVs+31NvQe
	PPNWUyEy1/p7uxnDeIqcgrv2+Ctauh7lPl6G1yk5wm54f4k2Hn0LM6RsZp2tJHmePa+CkwWL4wi
	pEzRxKNcpJXSR8ASpBW24+FXjVeuZZsZl4WSbAcU2Znt2r0Lz+dA8JpOpLGDmS1NMYEqK9saPfR
	apYZmRGlcwcOZ/aszdGfISEb8xzDzcYL8ocgipymAaeNFjnznjEBTOIkIbWBmU91fpWogaKkzNC
	MdIJSRhwyu5UdBK0w9Hw92DIYzJV6EyWuKsF1YFs7u05jDuHTz/+AD/XKuvLPnw==
X-Received: by 2002:a05:690c:c0c3:b0:8b0:6722:6734 with SMTP id 00721157ae682-8b3bb155926mr6839747b3.34.1794443338082;
        Wed, 11 Nov 2026 16:28:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a6554sm57571227b3.12.2026.11.11.16.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:28:56 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 11 Nov 2026 19:28:56 -0500
Subject: [PATCH] vgacon: Fall back to the dummy console if mapping VGA
 memory fails
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
Message-Id: <20261111-vgacon-ioremap-null-v1-1-6dd05bf390ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrE2iIoiriEW1gxFaaRFJ4+6Kt
 /sW7w/gyTF5aJIAjk72bE2ESBNQkzQjIetoyLO8FHF4jlJZg2wdrXJDcywLSl2oStRFX2cVxOf
 maODrq7bdb3/0M6n9TcF9P4NsHx93AAAA
X-Change-ID: 20261111-vgacon-ioremap-null-ad4c7184b807
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 stable@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=br3GFCtz3RXFRK3DsA4LkWP9fcwbxa8J0zn4MRkuUF4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLK+criL7v37qOiykO8rawfHuuk+WyP0ikzsHuj9nsVwQ
 sin7fCvjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmUTAjQ9v1oF3ZfR
 8OxC4xawm0WOOg2hj571rb9g/LopWvnRE9dpPhnybXhpaPzH/zz0vn7L19vfNZ3UWnSt4l31dM5
 BKapXb7CDMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

On Alpha, setup_arch() registers vgacon whenever CONFIG_VGA_CONSOLE is
enabled. On Marvel (EV7) systems whose SRM console is serial, no VGA
hose is set, so marvel_ioremap() finds no hose for 0xb8000 and returns
NULL. vgacon_startup() then probes video memory through that NULL
pointer and oopses in console_init():

  Unable to handle kernel paging request at virtual address 0000000000000000
  pc is at vgacon_startup+0x174/0x910

VGA_MAP_MEM() is ioremap() on Alpha and powerpc and can fail. Treat
failure like a failed probe and fall back to the dummy console. If a
VGA card is present, locate_and_init_vga() still switches to vgacon
once PCI is up.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 drivers/video/console/vgacon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index e7e6750f1f87..09f7c376b468 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -324,6 +324,8 @@ static const char *vgacon_startup(void)
 	}
 
 	vga_vram_base = VGA_MAP_MEM(vga_vram_base, vga_vram_size);
+	if (!vga_vram_base)
+		goto no_vga;
 	vga_vram_end = vga_vram_base + vga_vram_size;
 
 	/*

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261111-vgacon-ioremap-null-ad4c7184b807

Best regards,
--  
Matt Turner <mattst88@gmail.com>


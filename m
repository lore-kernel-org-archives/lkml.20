Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190483;
	b=EkdGS2CSY41apF478TjUzwN0BRcmUkWF4AkkPYyNK6t2QGEJ5xY3abwUdB7XFNTT5C2Y
	 EliccUTKeq17ncS07ZYAxvigFB3RE14Xb8Muw6LLCF5+//pgEnVC2RBIF8l/gbCSMvkNp
	 c6L933UOFvIOEadRz8F8e3lBrQ3QrvBOftHiSMX/WY/B+1DfFIy5NVPDVdl+eDsZAqsjk
	 chFbSepf/CWXKQ13s0n9nOd8G5kdJ1o1MYlkhCuNayAhVdvhx0zuqpW1oOn1GgCqRul6K
	 U9z8i29v0Wr8ATPuJKxIgNBdo+hxeMKYQWUxW9AEuHMJjWd7jftQetcCss65BdGsPwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J+h57vEeYMsDL7q4YjW7EJHuQlkp7BLgFsx7/CAjkpU=;
	b=4fqwSYAZYtJh/SKcEydlib7Dtroj9uSycqohL1Ds+fbUdayZb6FRyJ3iW5gXRdR4hYzR
	 SuhzQ9RbkCR4yeo9xjwq2N0awjqEk5C03r7RF9hlce9lsedSRFl0EPOTNzuV1vlOR+1kb
	 5PZXryt0gHaLmIRLKWlNxSMlWVxw8CV3lt+LoNV9+fkQFVg2/asqknHgHV7miNWbpGWfw
	 xH6f3kyXbwfJ/4hKIOQl0IOJ+fIc52aEqH91pf/D8RLYmj6mSwHC31resJxYH0MUi1qvc
	 dojlEvXLG24S6gylOf7wPF4f8RWbcJStpfko7yicLBxLZ/8j1MA9jZ3qsy0JEwiT7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=UfmvNmLX;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EF606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=UfmvNmLX
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so956963eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794190481; x=1794795281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+h57vEeYMsDL7q4YjW7EJHuQlkp7BLgFsx7/CAjkpU=;
        b=UfmvNmLXs/Ja5fQ8ifnw5Tay+od7YLlFQ9zOGWBljFb31qqvAYjwnSkk+JYsPkCcHK
         1qakyi9kUxfmgXZCA8S3dtjkEB+B40tikfmzOD2VZMmtsAbFha6OMLa1koHA60IfGweT
         oQ+BWKfMcwUEuAfVaPQvUaNSWuiHVSJFbgLzCTl6iEmSzV7aqaQc3L9vCLFqoHXOewJR
         E/te70g3D1Wd1TKVVMYj34qyKAxda+Plm1SBzvQurtTDjdb2WSzupC5fQ0UUeP7G84/m
         Evjcj0dt7mfhvyjFTKwnWAOqPS4n6Dns4hWwkyVscuNMicu62jq6H11xVWxSfBN5tSSM
         p1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190481; x=1794795281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+h57vEeYMsDL7q4YjW7EJHuQlkp7BLgFsx7/CAjkpU=;
        b=edD48WCyk0fnsikJp5ndGHMkbMQzaOpxd6CPgfAb1YzavY3isEhXM65jUjva0Zqpcj
         QchMZeqloakhoK/gv1G5XESJStOhIgSqjNrTE77ZAKXYnmZlC2vfFNjvSZOuz5gowk2n
         R7iGEvxj7uqN3pAvRszt+4U1TmAs6p+vOA8hzQe5ysqg0HW9aL3Zl3j5BgmJXc7PiHMP
         t78ujlFNJESyn1nLuFEcSgtyxE3PfQsBc1puqChhS3XPNyGcrbAqvokCc5pv66O5cAbY
         62+5IalzCutOsZvWxFrogoGRO3nMzadVrnzet4Vx+9pDvz5W4bcOfsOmBhFRp1u3kxsi
         xygw==
X-Forwarded-Encrypted: i=1; AL+hErGXv/GugO0bpvJJvJ2kqGt/a+rsD/fjoppi5Mc5CnhcmqpJV7SZjyUuSJW7MqGj/SV2f7/rX2ql+MYRly8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8gh6ylOMQHD93s/HH0nLEJuVvb0Pglg9AFfrTW1dxhjJ27sja
	IQSyEzTaG/4DcV5pC5mDw+7A8nAgM7pNW9bVMSIvU/auvzKMVuVdphvNaKN28PeyN6hf7cQJ0Kj
	Bnsh6bg==
X-Gm-Gg: AYBFou1IAVcpx068N/9D8Lcuzt1gPTquI5+2/f32vAijf7bt4pbaZIFtmFDxWhBzXSn
	t7NHGpkoujZfuE3FC5gS6HkBSvxl7qPU82U+zV3l8NVdzoEfiHm9BuCSZRTLMSY+2bxoEGdff55
	PMT3iHY1uDb9tSC7RdpnzhDnPRexz7dnGdpeGNrrFfkuvcrownh+oZNllTw3nYlxMbw6ypsURze
	RT8C8XK+IZk7/+YUg1zJnflivKIfiaATZERt3BPrL6cCA3In5zQxyMmFBG9Iqfudfj7tWXp8ZjJ
	IWsrlP7887nJmjrECLoABmjeTRwww06MviA4SP2ib7LzcEcH3ygzLNjR3E45aa3gCjk5MKPgZva
	443zL5c6f+BmqjIlQn2Going4l/LbQ1hIo83KoiHlJkkGrofVNbLf0TqI9ngHFcF6SiV/yb0UBv
	UEZbJLcfRmrVO2Ov7Lb92bl6DkuDVn1R4yeONnHstpaV/F+r4q+hB+Z5wID2tS7akcvxOG9VCGw
	b8wE3WSBgTdNA4oOAQfdWlRY6C9T9h+9MurzTC1eSQAz4N0t2qiFoRB8tML+ODXV1+LMuLZjkE2
	z5pK616glhg7cIIcCcpRVmk0xR/Uz1v++Z8SHzVJRSMWgp+oXxk++4HZ+jClm0Sc
X-Received: by 2002:a05:7301:6492:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-372568fffe1mr5590031eec.19.1794190480709;
        Sun, 08 Nov 2026 18:14:40 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm9392155eec.29.2026.11.08.18.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:14:40 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH v3] mtd: spi-nor: gigadevice: Add support for GigaDevice GD25B512
Date: Mon,  9 Nov 2026 02:14:35 +0000
Message-ID: <20261109021435.904625-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
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

Add support for the GigaDevice GD25B512 512Mbit (64 MiB) SPI NOR flash.

The chip exposes valid JESD216B SFDP tables including 4-byte address
instruction tables, from which geometry and opcodes are discovered.
Status register locking is enabled. Status register block protection is
enabled using 4 BP bits (BP0-BP3) to cover the full 64 MiB address range.
Read, write, and erase functionality across the full memory array have been
tested on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
v2:
 - Drop .fixup_flags per modern SFDP discovery conventions.
v3:
 - Add SPI_NOR_4BIT_BP flag to .flags.

 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 6a2e6ebda148..113db85f7bd2 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,6 +64,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
 		.name = "gd25lq32",
-- 
2.51.0


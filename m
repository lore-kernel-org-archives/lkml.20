Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877125;
	b=J9Lg+DP8gwMWq97IqUVBHvcUJsFyVhEYagEU/U23CMZNUWbdgU+SQS2st/rbDIEN3pxC
	 3456BA6ledYj0vBnGWIcUy2Ls1ZCp/FKq8fTUOtxux9NQFTqlIKQ1qLF8BLV96ix9Rh1z
	 s3jrM7KtWRotCtQWzPLop+XwCtjjGuy4WvgTkroT9CEUMxc3++L5CkTY7tlT4U8KqhlCP
	 5YzO3J7tRl+hLjNoHfN8U+DYRWeRU9Iy7LaVPq3YCGjy5bfF/bC4TUPzk/yUviH+K4rWw
	 JL5BFQVlMip3zyErp6PWHLK5MCzd9bsCBu6ZCb/H/LW7yWrqqyGxk1j5IE6hTrQsbOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
	b=l1zLOALbl/t+e3H16177tRcW28tn4rRk5xV7DwzNL7oD0FJl7v2gBZlJZf4Qoh5MZ2j+
	 nSnj99SP5KLHPYFwvW8MAud8eEVILl1eDQ6R60lvTtAHaUhBlhX0YksV422H7tzdCYGQM
	 SForZQAdPcDE8HjVQci7pNJY7ir49DWrPk4AsJQU7H1FSu3FXV1um3588q44RQI1XkbjQ
	 Pz2HF7+rj/JCz1cDV04KpI/oIDCbtQN5alq/0wYBMnuTIKyPaTLZaiuCRfIqNtojBSxDz
	 ZC/trNerHbyrkbiEmJ/qejez9WFpf98DaQGzYnvIzK1Bl9I8sKavRdmU2BW1OsfJHFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ywz6jNWt;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137E606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5137E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ywz6jNWt
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so11976335e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877123; x=1793481923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
        b=Ywz6jNWtzsxRtkyFVBhZshPwrQunRMgUPILFsH9evTboAM4skABoL/yKaEo5E0o+tb
         xAOll3XcJQ0vKhHihRUGQ9EE+WJRcspfcTS16eR2rf9W2Xq7bRyS8PGHjbDfaeNwfgH4
         j+GS4ApmTH2N3Y5F7Z8RtqhXrJ6aQMOj6fMBu2PZXsetcmZTcl49d3WO1AuJcxueokHr
         AdCWEGD22+1xV1Q2b44q5EYWs91G/CnZVa+ZKJukfEt/Jw8bIdQtl4VjT1XGuH5oPa4c
         FI8JypqIIwpUQ1LORLO3eE8dMNrthJdc5qJjS8sffwuMx0YrrTGDPF3ZfWfEkz8gVL8r
         dmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877123; x=1793481923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
        b=2Qc5n6GI911oGNCqU33yRy7cR8LJ7o97pMHCYM5LXlG31wt2EJDX0X5KdzihB1nOIi
         O+cR/IpgZRoaOIpfFcUYrAlgPHZ6WFg98bcpxO5eWrJ22KJHT87HLQk6oxUxgjlVxfru
         SHSiRKRhsmcYAm3LII8bxEkQ0W3VU8DqqllIr+yGQZt1Xkz5b1FW2fzYqxvBzjjalzxW
         HFKeP6J18k1lG/rny3zl1oJHplU3bShh9ho/zMTQdQoW+UcQdeVyNZZUqgH+tOsjhvhD
         iEonrH8qZOHop2EEZts7+3vvaxJ+tvbStoea5N5BjYS+BeLqInl8ZqrPNjG8zGIf4M36
         IFow==
X-Forwarded-Encrypted: i=1; AKwUvBwmERaTxtHBYmdEYyBw54XkwspdSxlHegbRam3DtgeDO9y2KrZ0l8Q2YOIk3FMcZAXT7vfbvw4DqyDdKCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT8d8C+nI4ZjDmmIShyg9Dgnn8F7ug5z/wUPRmV0U/PSK70DZ4
	TYf4XaS2BhkT72yA9Yw20n/J22oTultu2mSmwMy3LhK4VS+Dkgg7TndIUPOwnKMP1NM=
X-Gm-Gg: AYBFou22tOs+dDX1+0fdDYpHBUKGWMUhNyENYg9G2hT3icBGAW0XAmDupN5owGz1uiX
	X25EUJ72ujCcsoyEuhVoOlN80NTqNMMb96NR0kNdsPIOkAvO3HTFgK4uAaIQpSdYFqo1ht6KiHb
	oY3V8aGX+G4o4R7UEKmvG/dawFXvCP5XbT6WK6tpyZwqBwqQ9AWsffL+333rsy5x0RFBXCgvsMv
	gJZ3o6awRbGXotR9PyF5PmhhfEPUMv6wW3sKVNHszW30CiUl/YrQ5ARDQxx628GN4Ds5ek3UQ1Y
	qI+vKyCR76+hsirZhYkpY6HfpcMXIhb1f3v495VtKojVBUjpOMHP/wih9S1cqY34iEHav/ySwGq
	U2XIv5Cq/YV/UVoRiOUwMjWkFA6ZNvUcpOIv7AQ+NdH/mT+jv34NNsZSePBDNWooi9QugpUji7z
	TNg/NnR7xfKnqOpg5aqovYAJHIzv/iyy32OKJGQMY/qdvv2ZmN2q26V15nzIfMd1o1Ed6dSCjkY
	Zw77GMziTCgYABAaWhuvR8DgYQMDf3vuTfdVzpoL0EngH8jqJ2HIWK0eTzwmWlrpsl6rWSMJr2G
	V25QMhn1pjQGdp3sN5Lq2N3jnQwYNTzeAom3K1TPmRPM1msjyKcYMVYqPnyWp0Fl9RGQczRUmOd
	5+Um1P14WyIz10dxAJv0=
X-Received: by 2002:a05:600c:a00c:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4a35aca4b9emr44250765e9.20.1792877122809;
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] i2c: jz4780: Program the spike suppression length
Date: Sat, 24 Oct 2026 23:25:19 +0200
Message-ID: <20261024212520.91401-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024212520.91401-1-olivier@mgcrea.io>
References: <20261024212520.91401-1-olivier@mgcrea.io>
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

The X1000 and the SoCs after it (X1830, X1600) have a spike suppression
register at 0xa0: I2C_FLT in the X1000 programming manual, SMB_FLT in
the X1830's, FS_SPKLEN in the X1600's. It holds the longest pulse on SCL
or SDA, in APB clock cycles, that the controller filters out. It resets
to 1, and the driver never writes it, so it keeps whatever ran before.

On a HiBy R1 (X1600) started from the vendor kernel, the register held
116. At 400 kHz with a 140 MHz APB clock, SCL is high for 102 cycles,
so the filter hides the controller's own clock and every transfer ends
in a lost arbitration (TXABRT 0x1000). Driving reads by hand on the R1
with the filter set to each value: they work from 1 to 100 cycles and
fail at 110 and above.

Program the 50 ns the I2C specification sets as the longest spike to
suppress in Fast-mode, rounded up to whole APB cycles (7 at 140 MHz).
With it, the R1 reads back 7 on both controllers; after setting the
filter to 116 by hand, the next transfer puts 7 back and 50 reads out of
50 succeed.

Suggested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/i2c/busses/i2c-jz4780.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 695be3b21460..d1bb75d9a102 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -58,6 +58,7 @@
 #define JZ4780_I2C_ENSTA	0x9C
 #define JZ4780_I2C_SDAHD	0xD0
 #define X1000_I2C_SDAHD		0x7C
+#define X1000_I2C_FLT		0xA0
 
 #define JZ4780_I2C_CTRL_STPHLD		BIT(7)
 #define JZ4780_I2C_CTRL_SLVDIS		BIT(6)
@@ -253,6 +254,7 @@ static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 	int cnt_period = 0;	/* period count of the SCL clock */
 	int setup_time = 0;
 	int hold_time = 0;
+	int spike_len;
 	unsigned short tmp = 0;
 	int i2c_clk = i2c->speed;
 
@@ -356,6 +358,16 @@ static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 			jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
 	}
 
+	/*
+	 * The spike filter keeps whatever ran before left in it, and one longer
+	 * than the SCL high period makes every transfer lose arbitration. Use
+	 * the 50 ns the I2C specification sets for Fast-mode spikes.
+	 */
+	if (i2c->cdata->version >= ID_X1000) {
+		spike_len = DIV_ROUND_UP(50 * dev_clk_khz, 1000000);
+		jz4780_i2c_writew(i2c, X1000_I2C_FLT, clamp(spike_len, 1, 255));
+	}
+
 	return 0;
 }
 

base-commit: 03a5cffc818695157414456dec695f7c30b9ffff
-- 
2.39.5


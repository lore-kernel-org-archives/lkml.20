Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727219;
	b=juVMLVUIM3gBz0jxdKLS/FNbd/kt1MaVKjnLlhiCZ6qsfVjJBy8rQXovqhcs56CU5koA
	 JhkvybdaXS8hKWlh/zJ9l80nO6rA4AEJiTo9aQhzwKgWNmWhwtVUCytZzd4HWI9Kgf7zF
	 RLJoDiSmON6HezR6PZKIWNiXb1SpAw0QfHjdwIjyYR663TiB4cev0Y3/oDUibU6VreYWI
	 9CR+mst/grsfXcfFzFRs5UmjiqcCGXie2my3uUPtnpzWh4AcBPpctstSqc+CmW+BHNN0X
	 LVlpG7UtLZ+Vr5ScLtsT3QmR9HVSiH2QzFp6omvjFl0u9QlowFjS0OpQuB35b3rturw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KroQIiuPpq62ASZ4V9uK0JJ0eFDYvcn9D+kvCdldZig=;
	b=Nd35wyZyee/UfH4I12fnpIqRDvrIJvozw7XkejWKIzt3/1/yZX/3kmc2pAeJWfWdJcWo
	 JB0Zx60MdCbhxc7NESqMoOXNYkXGTdtqto5f+s5NFidbkwOTUSgtwA+FzSBWeo+qXaEec
	 5z/8SW5e4lbsee4CYbxzHg8KcSls2IV15e2IGgCAoqDNrgSWB3oooat8rJYgumC4nBDG6
	 twyhgrQ3MvATvI4i3Nub3gN+jvyRW8af/wQbLV5IYb5XURw8/hz+P1/zIO0pCLw2WWTKr
	 y98qVHa5paLvynj+RvLcKh6Zg7ydS9/ne2tqXR3jjqy5hSqU+HaLJEHKP23PE/5ceGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DORECUVP;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63040606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63040606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DORECUVP
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1259245b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727219; x=1795332019; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KroQIiuPpq62ASZ4V9uK0JJ0eFDYvcn9D+kvCdldZig=;
        b=DORECUVPZxuI83HPH73zVsv/MqxNQTEk83AE7grYQK5dZePulOKCkWylLquGBzZ0p8
         NFUwKm2THBYjPyUWNjUKzpujR91+LVSPdefLm8OaJa5DUQ0NCWE6RLUUniquBLinz4+k
         TMSbTBwliesdd9oGl8KvM+HDAsdT1QX0Vx7+XrYuDzHCpHGX3EKW4gEZzFSDpECerfIv
         XJKmzc9mUW2tT6IdhkfxsCnLIzgHKvWvwGqhK/TWNkP64LNLndTcu7p1WqwEzc+I3yyR
         NUpmISxzDhHHndX3UqXVsNBdymP9Lls8cE4rAtWozcgWM++uc/MazfmuljRV4jd+XSkP
         47hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727219; x=1795332019;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KroQIiuPpq62ASZ4V9uK0JJ0eFDYvcn9D+kvCdldZig=;
        b=u55QB4UpYpW6aqqxdYf3GyIHCMmFEvS/PP8O9I2KeKvBBTd2voA6yYVpT41pbQG9A7
         nL+GabqLTF1KaB85FfBbxycPO5jO+tsL1dzQjXvf7tXksoC34WAxzN8XRa1UYETWChBi
         fRddquTw8ukQzSnL/ThepNn8OoNYqWrmhYdCD2RQqU2J5bd9AGhbNVlHseIfZ32mZJDO
         cLuujsURzOo9WEqxJ+vzc792ZB1/3P4WxgTHDi+QTchKHtA3nujuz81lWep/Ec4MZkZ4
         i2VwCfriVrfPzgNWfg0EL3chYqJiDJ2JreemjChKqaIpPXXUgBD0T2aI3KWgd8C9DAeX
         Iu7A==
X-Forwarded-Encrypted: i=1; AL+hErGvEMJhmKH3xLJylNwQtSzxtFDCgLd7U4AgyJnaOCzfusZkgb0pEb6tzholst871A9JM82sCpmn+Qxh4PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cMxr01W6iUFKZqfYas1gWGMJSxQG88tR66r3r6+uZS+22p+k/
	zpLXfibEezAqTsxNEVeJNtFEfdVaxpGpWPlLdvF32q0C0aWeA/hGR5TT8Ufz6ADL
X-Gm-Gg: AYBFou2UFdy1fFw4VIskb496XvAcQfpRJbi+XA2Gk1+PLMqPTq2y5X3/cj7ceweaOX3
	zIJpcl3qhI51VBkvHZpUqhX9hCs84PGibUAoQS57RduJvHZXUM1cs8zHYeNfR0B9BtaJ2hWoaAr
	PHhCMUj4O/4cbCl7iuSPGAWoCchNQPfE5YmUQenvqHn9Rda9+uPLEp6s/JbUBscdtV1TGhzGWqa
	uS0T5cpycmqsvMMyLD/oILBckmyqM1X9hoyyDkNL8n3/zATUz3RrGF2q2I39QtzoXF9hWCtZDo1
	QmcrI0rFDvVTvit5rJnfMc0t1twA8keN+dK4NoeGyn4scJsM6HxyidJyvqPMzyd9dVgrey/Kfk6
	nPbN4SH6VHqAB9ku4wpacHEEOq/b3uVWUraP2+4kfNTa+A8eSZhdL/Yfynozp5tR6UqR9J8E+IA
	WGYKg7pD6n9uByJcjvPhRSSWNaCI67DDHpAghjhmZsfdmDVFE+MT4MvtxtW3R/zlPuX1i4DaL6z
	3CX8UCM7ruiaa6Vgy2YejvZMeV6qIdARb+XotQo0DmzKiDt8M0aIUbwnvQ59Omn2kTfTu8pXk5p
	yuKiwletOf7AMPfHs9YQeSYmconbR5Evrixm/UUn6qBNNE3kFFMywdtODVBoxjXL7jpZ0NdmHHl
	hKtnlr9pEJovWfcTzObkwfJ5Ztvl8
X-Received: by 2002:a05:6a20:9c14:b0:3dd:a197:735a with SMTP id adf61e73a8af0-3f7a95f0de0mr6394154637.51.1794727218625;
        Sat, 14 Nov 2026 23:20:18 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2::6a87])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8bed2055031sm2720925b3a.39.2026.11.14.23.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:20:18 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 15 Nov 2026 15:20:01 +0800
Subject: [PATCH] mtd: nand: qpic_common: fix BAM transaction memory leak
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
Message-Id: <20261115-nandc_unalloc-v1-1-65d849fa9998@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA04oYr2KiISJ6NOkVESLQXx7
 k3r8i3+PyFyEI7wzE4I/JYoqyZgngHNTic24pPBFrZCxNKoU0/9oW5ZVjJ1ibap6gcNzkNqtsC
 jfP6/trsdj+HFtP8mcF1f13DbU3EAAAA=
X-Change-ID: 20261115-nandc_unalloc-85129684cbad
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794727213; l=1169;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=p0lMH4v4LyjSNh9wsFd3M/eshEtUTxninjjrG0SXaRc=;
 b=kCkyCuIAfbccVQxaiV/0aW6/6Kz2ZnKPh3J18rFcPaTifQsbmHvX1rXBFKKbD0YWTWQg1gd/x
 ydvwxHE9/QVBVspNoQGKWMCE6+qY40SWmt9bI5rIFAG5X+VAB8+pvgd
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

qcom_nandc_alloc() allocates the BAM transaction, but
qcom_nandc_unalloc() does not free it. This leaks the transaction on
controller removal and probe failures after successful allocation.

Release it in qcom_nandc_unalloc().

Fixes: fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ba3b41c6-9de2-42b9-8205-67454e0229f6
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/mtd/nand/qpic_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index e97043b866d2..0f81303ae8b6 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -657,6 +657,8 @@ void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
 
 		if (nandc->cmd_chan)
 			dma_release_channel(nandc->cmd_chan);
+
+		qcom_free_bam_transaction(nandc);
 	} else {
 		if (nandc->chan)
 			dma_release_channel(nandc->chan);

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261115-nandc_unalloc-85129684cbad

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


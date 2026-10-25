Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896535;
	b=0WaYDEEqkpv7/akGQzb+zmCbYQwKoq4XvthuPlTwD+KQbiTgYQqcpRPYH1BwLs3mlx4E
	 ePGdscodLQ+2cp46KSxB9tEBsxiNMNAysmq+/VT4QRm2QfZosY748l5/cRuX6KBHbK9nx
	 r1yTRcWP3vfVcvCagYFVL4+znxWnVVJ2gOn1EONZ1qN0RkT9AtK45pBkfFikuHB033kye
	 K3O6U0JPkhnLjrhAVRXhHaizDHOVgF0B0O+t/X39QMUPuHAiW7CJKr7T0ceZIqmCeEGLx
	 PEJfT1btrHlr2DsG7bMQJ8Ib2FjKxagTTK/EMlVtwuZRC99zwhbx1WsmFJv8VZKWAcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2WNFFspM+rHRPvmlX/IdB/mvBFJYspViUI+mUu/7+EQ=;
	b=tXeP/7A1hbu4UkAbT6wuoyEmvVwVw71ubOo5B0R8dUYLmSEUe32TD0Mk4omwZLeC3kJR
	 2c3WDfYt5AYLQrn84Hzz3qQs4VK0CrLiJ2El1t86S7UV1hEEyt4JSLHFZklMZOgrby6tt
	 tW34B6N8SgRdPbqKn2IrT8+d19gwSxdR7PR0HmMW4hyHt6MF2byKW9YhkXX3QLpNwGBwE
	 +oIB2mLflNHsOEGEjwJjIs0cYZSMKiQ7XQ01zuSuCL5O+boXhkdDUiWRT51bfWQfG1Q2l
	 UZvazJw/zb/YRXJ+Mkj1dGhjB+gTRfgII6aAwaIY0r3fSlYXqlmPpJmoIoY3Yxe67/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AogBztQa;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8284B60A2601
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8284B60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AogBztQa
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-19305bcb72cso1160025c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896532; x=1793501332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WNFFspM+rHRPvmlX/IdB/mvBFJYspViUI+mUu/7+EQ=;
        b=AogBztQaefRHxqIf7r7yyiPJ32TbkKSI3EZbJyc0kM0DrFhuCiEAqIV7SisQG5g01m
         lP8walfX9nQXhaXidqzuNwI6Liv8Yr7pKoxYww/l1I3zNqNPsE0AbTEz1Y9/wA1xXQ+u
         pQ6Bjf0E790OrznGUopeKOQszZ9uwLfYdMH3COcZyZ4oSsC6QlaWXUQep2FG9atErDPJ
         rLSXwIHURFU/vZ1FggsB7lHTTHi5Nztr+uIT7tAjeUcGHkirI6ugimoSrRGeOsGzaU7p
         Ogm+9BojY6irQAwGPPBCC/Udjma2QscUnzmO2cmOitOQmo9ottCgL420ReMargrfLKyq
         LgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896532; x=1793501332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WNFFspM+rHRPvmlX/IdB/mvBFJYspViUI+mUu/7+EQ=;
        b=I47QTvSSfxN3v6fEgj45mt8DrT0h81JXjyP/eMYMH8dAY0GZmA2uHpJqUr48mhiWoH
         tKFbZhMKH/MpOgBqg/1jNuNhAFRw0ie6tBxjCAYQlGaj+OPuRiZoufz8F8f6OuxRBNbY
         0KoHzDphIvEVW/VYDU6AhrNsuZ5xgRkm2NwKj7BSbNgeWesykjBIK2UzvuhnWs0gOfji
         ifp4lLst6o15W1XjkaXBVS35jdoe0eOIxPBXY6tgsElOHJDSrmI0pJGZJ+gBjdwFg+rH
         naSHtWcFH2O1In4mMLQETt++M4YVMGfMgu8h6cLo4EplMtDWBF/gXXbadgUh0tOz4y1Y
         a0FA==
X-Forwarded-Encrypted: i=1; AKwUvBzIHmC6ACgxePPksAv5/1iyNzJfs+A44nuBum9P3oMCEjV3mmQihgqOECnxest0cQqbmxjJk+G8S62z3xA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHVcJsMl57gjGGE4Xi8qd8ppKkheqbV/1PT1Zp9loF8QV0xydc
	01aOZYYyTuu5SH2zcltehYXTt4vKwpxKZ/9bt5CR+vM5sz8HUcIcq2wt
X-Gm-Gg: AYBFou2Nnrp0E5nQjKFBmjIASaLTDwZTi0lq8B2NeZdQ4MXkfcdwMm2UK6+ORBHZzCG
	agOwPASr+iahE0GzDBd+O+isFuJKrfV9IP9je9DTN0NpXlGpA3RBdukcOH/XKzhpTjUkq7NODwl
	fXBJ4bjK7Q8kTjfOBPaqMljyJX3KRawjXHYRUmPsw3gQ5kpPCJh/I2y0NUHAEgrDEYiw/PpWCak
	z+xWQS8q5SRn6EnIJ71rIP7VtSJJX20jo1XWzfQi6PmR3Ht6xMHCksDbretqTH5X5RC558+MZPr
	HTdcfmZjUs4MIH7NkqPQOZF++iH5tzNxwvHMfKerzgO698RlLfAtBijdkE3ZFKMdpr3mJeccO5V
	I7ZB0EOPG/ua/WSxKmXNwPxsqZ2CuNBHpXC3Oj8LS/DZ0XHSJwn2OxIJRiQ4E/vl1idSDqABA9B
	IaQBMuyybN6D2ojq8mocddKfCh67gX6HImrK7dkaG28dONRTF/UF78Run12ZlaEqtQNeEiRhsBF
	Cgu0RdY5MopCNt0oe2+9jRScRjcBarLYjXrpPiCYmypPAx46KqxqgHzS5OpFMoUa499TQiWRJtm
	BZRloR9yh3sbpkg91nM2OQEdPMFnK7sHT4r8FQiGiihBiWSsELOp7MM41kVzUzLk
X-Received: by 2002:a05:7022:ea5b:b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-19e1ad9061emr760295c88.38.1792896531619;
        Sat, 24 Oct 2026 19:48:51 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:43 -0700
Subject: [PATCH 3/8] Input: cyapa - use 4-argument
 i2c_smbus_read_block_data()
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-3-19bb97467982@gmail.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
In-Reply-To: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
To: Mika Westerberg <westeri@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the transfer length to i2c_smbus_read_block_data() in
cyapa_smbus_read_block(), accounting for the final chunk size.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cyapa_gen3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/cyapa_gen3.c b/drivers/input/mouse/cyapa_gen3.c
index fc3fb954523b..0cdebf2c34e7 100644
--- a/drivers/input/mouse/cyapa_gen3.c
+++ b/drivers/input/mouse/cyapa_gen3.c
@@ -256,7 +256,7 @@ ssize_t cyapa_smbus_read_block(struct cyapa *cyapa, u8 cmd, size_t len,
 	if (SMBUS_GROUP_BLOCK_CMD_MASK & cmd) {
 		/* read specific block registers command. */
 		smbus_cmd = SMBUS_ENCODE_RW(cmd, SMBUS_READ);
-		ret = i2c_smbus_read_block_data(client, smbus_cmd, values);
+		ret = i2c_smbus_read_block_data(client, smbus_cmd, len, values);
 		goto out;
 	}
 
@@ -265,7 +265,11 @@ ssize_t cyapa_smbus_read_block(struct cyapa *cyapa, u8 cmd, size_t len,
 		smbus_cmd = SMBUS_ENCODE_IDX(cmd, index);
 		smbus_cmd = SMBUS_ENCODE_RW(smbus_cmd, SMBUS_READ);
 		buf = values + I2C_SMBUS_BLOCK_MAX * index;
-		ret = i2c_smbus_read_block_data(client, smbus_cmd, buf);
+		ret = i2c_smbus_read_block_data(client, smbus_cmd,
+						min_t(size_t,
+						      len - I2C_SMBUS_BLOCK_MAX * index,
+						      I2C_SMBUS_BLOCK_MAX),
+						buf);
 		if (ret < 0)
 			goto out;
 	}

-- 
2.56.0.257.gf7497c7d27-goog


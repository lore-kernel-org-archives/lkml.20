Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292866;
	b=eFVB15Rxn2vgQqA2xnRil2W6QP6/sL1vY65uZJ5j4YN9Tv0W2pvkRamwA7ewdPfhnT0i
	 uuGrF0xz39wRh2U9ZvqapaG9zoNL6F6eunki7amqkgg7Y2FcfkWErBYjmDgzDaZbfNU5e
	 MDehz5vVJS/SU1E7MJV88bfOeDBT7mMNm8QRe4W/1Ya5tn2XlBALPMbOGookTsBCq9Tct
	 dCvoOLvs/2Kbaq3+YBA21jJjQN1HZUvaAN0HrOOKDTsDQGiNhp1hLj16R4o7ByNJXIuZw
	 2w9GCAC1JlaEkFLLWSMlD6wSYBSjqrq/CkV2aevfW7qI0rs0uYMioGke18L+4gde9Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Xv/Wsic9BdqTGEwyOS/26vxDRJvcspPIySQAk9h2YQA=;
	b=4aiY8RPaLQKtaNFpEam/j29R/Tm0MVtC4xpbHcu5YjK6sEIt3PJYP0dix8rOMkeqsQlk
	 SFp5n7LBdt8BtUvCVh6C1LaNfWrtkdfYyxk+wQeqct72xWFm0KY2dkj3XBpaiuMLOQv/O
	 zo2wTJZ4z7zI0rS3lupB4h7AZ1taEq5JoGYV833PURxd+9oaMMnFYzd6irTLytr6AfvE3
	 Kn+miLlv03tJNT95W1Uoc7Pf8N5VqNyhOh1ptlmFSWXKrzhPhZcA0g+PXG/t4/tLptpxb
	 5FOHaJfTaG2YM/MSUKL9eewHcK7PXUmRNWLR4QTiRBXrUeBqUKCLLSOXjUewwWmx6Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oGMH3GTX;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2E60A2604
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A2E60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oGMH3GTX
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1741065f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292864; x=1793897664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xv/Wsic9BdqTGEwyOS/26vxDRJvcspPIySQAk9h2YQA=;
        b=oGMH3GTX1z/pW+jg8tLErb7okxpGEPfT6Ab7gffQLPzUmwyu65LLNqvIBp4LYvsvIJ
         g6+G5abQV4DQ2lmaExxrXBNVq3sRVdOHf88uHaafFqinY/Uaaa5ekw0ew5qzhEHz3582
         8cwepirnyVtootBBKEDJ2oj9sDNmut8FHpiHZ2cQda1uiNB1DzFuSZ2RZUnz4WerPky+
         YUqov1YAghC8i4wDoQOsPZ0jzBzLTC2VL4tGXxdf7wuekleeGa++vCL4GzezatASMcYe
         Zuy9JGyJ4BQqXvpRk/UHMoNP2+/8TZd00JiZGQoAZe59OmdGpMEQXx0cEsKqga4Uv8E6
         yICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292864; x=1793897664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xv/Wsic9BdqTGEwyOS/26vxDRJvcspPIySQAk9h2YQA=;
        b=iK2VXaT6YciNmK2QrVHihDbGNw9Ubc725gf6DCXrLdwpBL7PhHUBQoH/7VZvA3b7+W
         K/OgxmH+jnCZCOKeEgiq7dNKquBrdx6mqsnWPp9ag59Nv7a9Jip7KfM/9AbaoWVgE3Ji
         hMMGGcfZK53sNO3jfnKfqrkH3nQMoJNAkcQMOiUMGMH19UNdQ9J3dowSa2GVlzN7Vep0
         kXKt7AMkbPMqeIhdCtqnJny1+1GVO+XDelYbXFaPQGkEcdGKoyq/Y8zmsAZup6e4bW7+
         ZAGskMN9ASSIk89XuZML0i+KfoNQdvKipF0imSXuoORoRNhwNt6STatlAcFDb5qQMr0+
         67pA==
X-Forwarded-Encrypted: i=1; AKwUvBxOFZvUCLkO4TInwVCDsgyPAVvfozj2TikXukzysovPdtIiFHAO7LjpRz10pGQ4XPt3eVTmV5Y63FsrOFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIuqtAwA2/lsyzvIn5IUBpTpOB8kJV43s3/F8yzzdMqUeHR23B
	/PzufVdKDiJhU2i8oGS4LoZuVuoD6Tgb4vXZACiE5AmVuMqs0dW7a5Z4t2fhIdJoob8=
X-Gm-Gg: AYBFou06CF+/VoDxCRwIy+vED/bOyhdsttoBLu8+WENxhoTtPeQX7wn/nj2D5iTdzK2
	z8TLV2xtzUwRMUoQMMVCd0DNvTJugaoAEcv2IHDpddOjViwE7w2nAfz43wwXhDONz4dyhFRNY2d
	4qQUmyjkSMmOZxKfsKyi4+Og/pEr7j08FstGnYxP52q4xltvEEKHDLNSTFnC2AiF2ZqR40lUT2N
	rdgLmaS32pF2JmSzvbjc3HXZ7L5a8EVu8ES124OuoSOMHD9MuK86iDY8WyOrXNttTsOHxB1FXNZ
	X2HwG4ZyB7L7NI+cpCeU7t03/AUk+3I6ZpXjmOvYIb1VzkgqYhngrR51LXhwYJgCDyoy/yEJ1xJ
	O252OE+FkfSZ6witVAX2bfNnSHbHVhtp4QuO8ZEx+4OxF13XTZlG3riuyDBJmPaDsv79//vFuCz
	dGgelXd9d6Wy+HHl0gOb6HJu9GkeaGEjeTmNyrA+NS9SmA5dyCIDg2G8BGNq/ga693qU9wx/hvY
	Prl0Rpc2gHIGaFzSVJLD08oqut+mgFBpNBi7/PpMdh0KRLXLxzswuoIxQ2kIoyllGEou30xarkb
	qUUYZO2Daf+l/sevhB8dnGxK4n196bZPW8M8mqDRmns=
X-Received: by 2002:a5d:4d4c:0:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-48e5d5d89b5mr9359625f8f.40.1793292864179;
        Thu, 29 Oct 2026 09:54:24 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:23 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:17 +0000
Subject: [PATCH 5/5] media: pci: intel: Use named initializers for
 acpi_device_id
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
Message-Id: <20261029-acpi-media-v1-5-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=954;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=AFbBBnCTxQZ1izxPgFNYFCBvzIPYR4UFZ2HYCI7UK7M=;
 b=i8KokLaGr+Ex829OUisNCzM6KX/hsbRTYUDba+KCdAtYoZTJqbJGHxyVHAqneC/RZqOije3FO
 dNtvpNxJFpKAP3JdqIu1hVILzH6k+AaLftyTdQY5XZJhDgMzj7xFaIQ
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c4..31a0161e54ba 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -325,10 +325,10 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
  * this list is complete.
  */
 static const struct acpi_device_id ivsc_only_acpi_ids[] = {
-	{ "INTC1059" },
-	{ "INTC1095" },
-	{ "INTC100A" },
-	{ "INTC10CF" },
+	{ .id = "INTC1059" },
+	{ .id = "INTC1095" },
+	{ .id = "INTC100A" },
+	{ .id = "INTC10CF" },
 	{ }
 };
 

-- 
2.53.0


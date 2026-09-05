Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581735AC13
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613781; cv=none; b=ug/4lUvvWNj6ko1hMuZfE1XptaFM4s4HulhW0CNUzRDo3ii26gAuDr41Gakdm7w8HFwo9aYqD9SikMCZTa0rnSMuGTDRErrEdF2PO1ZgtkUTR+CFs8EyQ3pjmenW4yH9SqQCknVIGILhvw3RVdrLJDeCB5U2FsZRf5mqhih/uSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613781; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+TgjJ4dHBsfTcImtI3NqxtjET4ABZOFFMtUXibYrm/ssU/g7VOIURHZ3l7+PmYV9kGSPYaXAGhDO5SUfsQXzRQ2MGkxFQ1LxibuCj+XxTcXU7saGszBTTXzBnSw50g0aT5hiMBxCE9OKgx5+wmojv1+TOlvloEr8ufFTqAmaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhrLub8r; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhrLub8r"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-754ac74c495so680903137.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613778; x=1789218578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=jhrLub8rGB/qkgko8StWC0UXVk/WLciRA/XMwFYKEm9ml7OzapL/CINgFYhVGbU8yi
         HySjr88fwH8SbE1onfmVm38Kh/Gsj0xVGrGoU4cLWY6EUMf8lSmYFb+4uFPwXn7krrje
         +2qns6l7Rq7/htJz4u3UaeTBNV9IHtCe4S1G6BRXQKXE4cjD+aJXxM5TELPTW0l71Vg4
         L3V1oJ0wGxJCfBJ9yo1MoqZdCHXd9uWys7tR58jnbvnIDQFVdl+vd93LoqS75tNRpU52
         ZWpL1btHyTeCnqvxSO1kMXOzk2bq8x6Q7RHBt5A10f1WlCdTGCaj7qin8OYPcSbhIf9Y
         0QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613778; x=1789218578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=HWF1KsohkMFsaEWwY1tuhcXFrWiEFqv/F34MQSrY/UEPL6s9iHp9o300lBLAuTGJ9s
         Zdkw8iWfe+FhxpGpasEH7x5oUgA1hqEFYcFprYgMT6EBQ+CcyhtojaMx7GOOVVUvxJqs
         uzbSNog7DjWmGbn8xKxEIUFdKYNXxJmG37wnm/owqSZhM7J7oqbICemZLA9yIik2Nqoi
         Vw2cI7trwBtypcMM8oxhUpErrif9F0BW220HkxODmUk3BOl/Fr4HVKWIqR0fhUHvKxfG
         1aqbB5huhbvl2cX2dQpioTADXRqylIb2TbRzkBGg5KhyI6UY2V2p3fwTn+27fSe5L0xE
         b/Lg==
X-Forwarded-Encrypted: i=1; AKwUvByOt5mhs6kudBKPge0+NAaV3HTeKrg/ir33OwGN24UTRuHUeEUSBhQzY9x8uLg/MlJJDUxbeIxhK89qUfs=@vger.kernel.org
X-Gm-Message-State: AFuF++lxgMiZg7yKWZMi5Dj8QCKF4icVib6AllLmTTnydR02g+XLaRVr
	6TCXVbkiE3Q+40lJyuAcamwChYL/3gnikgbEpTIYkJRe3RTEa9UgZkIp
X-Gm-Gg: AYBFou23AGbagRDqpeyXg+IdMCTIyPJv+0gYSctbQJ35SdU5R3aMW2Uh29hdzs2OAsu
	nYBZ1NIfoBVzroeYOorji/SoOR3RWy72yzrVty00HhnvHPbzq9oU+tuQ7t9akyi9Z3Cx5GQYgLo
	b0CDWYVzfVNAvAXgQl/KG6GPXDUporOov8X1PSlAhQvHdJTfHhF71XRC6HxFhL5ZF1Yn+XT4LaR
	bqZMdxMZ8PV+2bRHEz471Rj7MqN794+/WW/qvEOC3ZlJymbyVV0c/z2ONhekr0ag8Xud3gVly/h
	6xwMOH8IO7JwiYRm6sfi3w6eU/egiFyI1TOzTBvy94gbsRkmgq6Lt/KOZkLQzskMhAbg0WzPYHW
	X5naxiQGpKteyOeMvGyHyJPOGH4yGLzkeubO3tqgE69nm/gnZpvVxS9sNVb+/HHLXM5zavIO9i2
	R5LWKsg++HLmGoih1WbDjcS0pxUACH5NPE3IkaZKPYdtGcFrUOcVsGevJ2KVF5gxFhwKtoIAIaI
	enh6A75nYIJxtgFNyRfPDPn6CSY1i32Ah88g8/+8Cc=
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr3774484137.0.1788613778353;
        Sat, 05 Sep 2026 06:09:38 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:37 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v9 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 10:09:24 -0300
Message-ID: <20260905130925.7115-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0


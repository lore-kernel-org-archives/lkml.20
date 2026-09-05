Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D393DDAE2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613046; cv=none; b=PQQWYWEqFESGzEiYiSt6GCxU1qXCPIohJyH446BOg3PgWM76/p1kWqiSAB8PbuF4LVoSZW8UBxhYJ7wAsyMvtsgeCTebArc15Ox4NVXBUy9SemwgYEEgRSpsqamUeI6KSBEm08hC/UH5TzjCVRSvlVlMK9gMxGMWERzrszzXA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613046; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+ZdWzNU7SAi9KeAa8qGqmPkZ2YCA9fDiFVXkQTwvWsnfpsfYUn7DdCfzbT5JugZHZFGH1xi92ttSO/JTIZ1UpE8sRj7MBt/E86tou6eic5+OhcsOj9LibsT8RbSjP1/D91sdEYw21ytJRn7vucj9NCQPziV9WlDMsZuR6aiSfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL64eJiy; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL64eJiy"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso768960e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613042; x=1789217842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=oL64eJiyZHx/JqXDa0DLvHL/BUopETrEFGRWlFErEtn5Vzcf0K1vZj5bfCjV0JTq5V
         wh9HWgh/Be4BkF4E75rIGN1PaxFiOM/a2z4Wkt+cGz9ucsTKSW2SPudorALbIM9YuLc0
         0/rMSo2ZsqcwuOKWbDecJDkcudLIJKxxOSF+EN2NhgZzrlPtP9aYhZdsW6sBI9OWyyUL
         zybdeZ9TJqBDU9IdHbsfUAWKFmiv5naM4CY2HTJj/oHoBgX3P9VfuE90DKXyEV8YZYE0
         uT0tLKEphUgSKWBDq5O05H82PZZj6CXecUWWtxF5ZkuyDmBzP1Fau+7xvpG8GreBgDkj
         UOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613042; x=1789217842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=MNP25g+Koc8F/kvsOYrGn8xARO1A16hxu5jfdkNjNJhu6ZN+P9tAxy1zTtSPA9gwgG
         6/IAV3CbdS5OIwCe+/Z9swRj6tZdpJjIz7k14R7D1PAezOVxKhKLmAwe1uOzBWyzQeH4
         x1MhEAYlGN/x2Wchz69ndaMo0v//lvEuW+EE7ygXPNgO4EMiY4k4SzXLIiPmeRV1B6l9
         dELg6Gl524qAtV5nPXyvGH/YbkMsgaXSRhZZWOGV4XSZSENTO3fhXGmk+Is29idcjQJ/
         94FXjwltUMMRP/rbt3iHzBFsXNUH4B+DYWp5agCWcuBjWc9aUj/duNvNFJT5rNo6trOR
         Cxzg==
X-Forwarded-Encrypted: i=1; AKwUvBwbt/832cVmh13SxjVPtk7MTuLUVtWG3zq535nLbNvuEu1oVjRujHhku99fp37CoBaz8CePToot7bNdq6M=@vger.kernel.org
X-Gm-Message-State: AFuF++mFOWnIVkBCWxlfMEeSyqrIljPkL8qI1z/EKQ///QU/fIIaI6gA
	rcS+QXNsJ9vsbjFXdLUd01O4NdTu9LfLthMdfUeQgAJUsvpfA+JLBImT
X-Gm-Gg: AYBFou2YluBD+f0balCR69i1fscL+jMuQwSsImUzTJMt9Q+vRNl5HvFpC2Gtnst/78M
	aog3XwZEnfNe82diyzOP4jCZPV8SOBYjLLtBcYuEpXXnZ3vBgDoTEOso0kJXQHYNnTiw3nayk0h
	w3Mu7sOBJIkeeewQDBP8dpU+1NdXAhmArCdpmy1aqURX9nus55YgP34KI98NjyR8cNvZHGy02Kq
	qcDdUwKAW3F83/TAKY2SbgFBFQmYDSOnswJYpPjWpoARS0p1oYoGN4FofcTfJjYUCq/aZkGg8F/
	NNwg/LFkU9Mg89tjNkqR5QY9lB+/63NlzeAa6m2+4f42zn7pmRajQF0cI88vcJmXv2d0E/WK9lN
	8DtNJkkcwPspEFs+yetimvumQPm65pFjjHWgLqv7g2Mmno93pIIeicbrQo9Lah08uKVLAzwoC82
	ibqaU5QHm9f98jtvwqNgh4b7PmF8DwutZjYficjtEwJUU+ii+Ea7+WtWk6b75ABlNPVCw21mH7M
	a2A/V47Z9UT5Wg6KLY+bK7LDuAlVNU9OYYlxX1k/5A=
X-Received: by 2002:a05:6122:4fa2:b0:5c7:c666:ec22 with SMTP id 71dfb90a1353d-5c7ed407509mr5471080e0c.6.1788613041673;
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
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
Subject: [PATCH v8 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:57:05 -0300
Message-ID: <20260905125706.6550-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905125706.6550-1-breno3011alves@gmail.com>
References: <20260905125706.6550-1-breno3011alves@gmail.com>
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


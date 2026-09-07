Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88611DB92C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756883; cv=none; b=Pmd/fJoRoYZ+OIt6Gt9MrvO+Jsnv3rW9dCYTK4lS45sN7eD5nSy9j+/WKDuye1rA4BlR10dShQbQlajRIrZV/N42vq8o84PW80Z0UCss6sNoXPkIy+7WvsX0TMXf3loWOx9b7dIbom/pl9B+Iwo71eKTDs7dZtTOZ/MSFB2aMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756883; c=relaxed/simple;
	bh=nGLX54WD8ZYhwyYfjF+NbAYQqy/IWOhlM+QLKa4hUz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PG2xWlV4+b3krtzT3PV0+kB3/87EWoi3oaEsXuD3/JN5GskrBAciEDM1dAxsvx/JQXnqAOSGk5jMApjMH4wVtA1vWrsM2BlWSSWlFGKNG+ud+ZxBnz1jyKkWGQLLtykextZqMUQwoRlVz9j9ZHoZ1QVFc0mnXJbDAkeENm1aNsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2/54wA6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2/54wA6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d58efc7356so38933295ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756881; x=1789361681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+H6PCme+LwtltvMdPx7okQil/u953epHJoMAFnFvfvA=;
        b=I2/54wA6oB7qqEfNBCtUqeyMVqnmjFj+Jmg8oYx5HS3FZyhse00ea6VnfUdImwi7U1
         7F0vo2NPMsGgN/ZAbIAxmh3mw0SZehnW94lr9j8oDvtHz8nIz5E3dUNk1d6Wk/VIl9pM
         WsSWDHqdFDK/9UJmQ+DyjTNhkjkeL8XBokZJ02Z7VIyFGdPpSCQX31uW7LJGIyZ//RHF
         KhWEw+xbWtlC2gUP/VvT8nz3XQy38STV2Ikldxf/254e9T395gqWNGzHYAq8JUD6fBcO
         XdR0FlG+VPwwVgrBg9iQA1n/aSv+j4T4bY1kBSSKuReHt/jqleMh2VjE2RFyCgYhqBaZ
         XbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756881; x=1789361681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+H6PCme+LwtltvMdPx7okQil/u953epHJoMAFnFvfvA=;
        b=LSSsLOCOVBkiJaAl3WX0jG9uVnCeP0oYppbnUfzpMLDV2qZzQX6iZ+DMA64ZZyGysg
         sGgw259TJXUCZbimaYAGf/I7vg2SNa5sRwji1Zf3yjWo/ZkyyfF8+BjiM6eFdLZG/s1Z
         UO5yiHz8r8sUP9HxSnlcZR9uUjqAo8plGPXdOO177uql7WBj4Ftc10/7dTPOPHZJQ6FK
         P6A8jjDQGJYk9ejqV2XmQPx0ZjEW65Pma8/j178enm2adOrLR4EVBQ8P5paNt43e+CRF
         jOZb+ueQV1IHfdsllui0FLNHsYh1mxehSqc1ozIAVQQz8OmNTXY7kaIzqX3fhQAmkY4o
         7vgw==
X-Forwarded-Encrypted: i=1; AKwUvByJfuht3hpBXpxe3F2RIQ9vQS8V6CZdFFyl9JZRWgUNELmcuP5vS3mddg/vbHSTW2kv+V4s36XltGOBrc8=@vger.kernel.org
X-Gm-Message-State: AFuF++lS+qbjafuSt+75yL6Ngi2pABMKBN9/bpD0DsV8tUN9lNkKguNH
	+DxpArJXRD0EH1hfH4k7w551eP42DsjioJKRGMq+TyC84jreO8ZK8+jg
X-Gm-Gg: AYBFou2/moYKQVCplf1qqzsZHVgFjcd5ReVEqZpSMVKNjAgcnZZQrsFyHEqu0HjNDkY
	B5qHZJWU9aZondlw79lzHFimWqbnjChHAfbe5wDReTxNdPVKy8IUzcxK1uBxAAABFQdKsXjl1Nc
	Qmm76zZrZQq+tVB19sgZFCD3I8Cd1/N4oIjXARbldc9Xu/iXbxcUUu7K5JM57Df7Rv0+9xZkELz
	tq8E6EQg39nLHMztqneOmpneUTM6n9NuPGhy8E934es3gdQb1MVTRxqW6ZXOHYESpH9hPBuzbuX
	9s4Hw1i9PElIh7EPDcM0lQlpoHscWbyzdXERvYEA1XNaatmNum9gKIZPU0aLsrlDaeB7D9Kvmfk
	1EfEHoeCc9edVWKvQCD3cgyEeCrm0R59uSh0ox4ODzJAR3UYWXtjLTJSm7R/KWe9dVJSwiCl/x6
	2uAecr3YMF3aSUyqHivN7ve6/l8+Q/EUxcfDiT2FmOMOEgHJm6xf75lA9iHqE3nZp3DgzxXrb7u
	tbEs8KHNBEwCQ==
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr31580282a91.15.1788756881269;
        Sun, 06 Sep 2026 21:54:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm21933483c88.13.2026.09.06.21.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:54:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: ss4200: Fix typo "retrive" in comment
Date: Mon,  7 Sep 2026 10:24:36 +0530
Message-ID: <20260907045436.18039-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches a comment, no
code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the LED subsystem convention.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/leds/leds-ss4200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index f24ca75c7cb1..c782339b1330 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -339,7 +339,7 @@ static void ich7_lpc_cleanup(struct device *dev)
 
 /*
  * The OS has determined that the LPC of the Intel ICH7 Southbridge is present
- * so we can retrive the required operational information and prepare the GPIO.
+ * so we can retrieve the required operational information and prepare the GPIO.
  */
 static struct pci_dev *nas_gpio_pci_dev;
 static int ich7_lpc_probe(struct pci_dev *dev,

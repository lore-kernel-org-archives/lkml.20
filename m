Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06AA35E1A9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695609; cv=none; b=qAW1XkzaeXSOJJ3Ygk5cA2RcSREy0Ot9sK6cpDb4/TZ0gGl+Y+kf//et8Bb5Q4ozCjzdVaVNpRoaKIRQ5+k38bW+YsNnfG8K5MnPJG97WVCvKQgoJg3o3z0ZVxjvoX3MDV503BbHQyQhs545ShExB+xwYnjGjdPjRu4YZt7Jv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695609; c=relaxed/simple;
	bh=rKVQkrvlKxZErMl62PyziscJ1x3B0r117JG0Jg7t32g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIdjRoloN429Bnko8fv8j1/ujLhOuNMtmpKGuvlcxnNBv3A659EP/BhZ7ra5qUUnt/QUCMsYTczFs0jAv6YtVNtUuy9hpMlsofM3AqtVzTBf5WGEWJl8jyB9yCmgvvIL2qkup72mMoe4fSx09UioIQUTQ2a5GWg6MGSQKBOri7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cU6yFz11; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cU6yFz11"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d0d5ae11so2693091cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695606; x=1790300406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idpqljwjFAkaCsozxTgUjb3fkRVspfWwVpLs7VsVxlY=;
        b=cU6yFz11LkYkLPJF1gL9iX1UubBU/8hivNrBDNTc7kgDmTIJv7i2+9iboYPrRca+5i
         yIzgYhfwA3hcJrh9QSHx5eLAZ9oEJbH1bcaPTN0xmpu5xbqfBt/BOha4wQS6GZyNmWvS
         7uK0P3HXwWpYuuqSAaUL35qtZYKhN7ZCbUoWRvFKHTcA7nim4F8EuYlP1DSoiaGsVhAT
         DLdr8TKJbfaOQyogNLLiOkG4ZPSL3fokCQfIHdhb0046Jf0nxHhSc7e8X9behqI63h1U
         u8jmYFEMjRCLd4rKAUWMeDGkAJpA4GvcpoeHLzk4oN1/hKisxdIcUhs3jMCNUSvUvU8B
         lamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695606; x=1790300406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idpqljwjFAkaCsozxTgUjb3fkRVspfWwVpLs7VsVxlY=;
        b=DLSqYjcIOWsj8SsrSqB1AKE6mrDTrnfj3REb/THHePC84cZ8syRNPIaLBBaBhra/pk
         d51kYZZFFUrSGs4oPBGwjer29ABgZ0Hx3BFFFhNhuqTp5Sn8B+f7vLABfGX1zgxpBjoJ
         L0j08x9fP/4Y4weNbNMhKNS5OV+TTRKueQtNsOkSWUnp9v7Ve2uWzSyzNue+Wn1g0OWw
         tPM8P5Cli3bQKtQTzJ0btgvlGmSld6ah8YUHfeqeqGnZmf251mn49mD1hk72vmFmYbh8
         Sza9XXILGQ7/CBB8Rm9lftedK3dYQXKcDiDQJqHPgrONGtFu6LsZDzvFkLrZeaOw1lK6
         4Auw==
X-Forwarded-Encrypted: i=1; AKwUvBzDCJ/CnaQToK90aTlR+G6zo+6+7tNuyypXvxgiKnwxlbmQ82o2FHaaqBBCGda05PqKshERLRIZRwwoLow=@vger.kernel.org
X-Gm-Message-State: AFuF++mwZwaxW2yQGJ4Ed2mpJqPcI5XwGfpfQDBKmEMxYbHy5eZrKc9Z
	tMlQ08opuxA7Z2No4P/wWoumvtSjLM3mXBCF42HKWJU0bjv9Kj58Ib0Q
X-Gm-Gg: AYBFou0PqPcjOhn8FMngMqykLy1jcwNdIS/dMJlAWuJd8FTFzV0/+XY2fIa7VPKu8nD
	LdL0mIUXe4SD+xixRxA/YDyB7ErD3aVRzyJ+wEcYsgZrWc04SpTmaoNFP6TXf3aCgsQLEsoLHYE
	zMz8lntyNtMLCmZnNAD8J2k6YUw2Hu8MUHZSkZNGhulF9Y8FoTeUkedxhahuX0ZM8+5Ez24ttfk
	a2Wo9DZ8vih97msaxdSEs9aE0rA2wpcn0LrB93bJ47PcM1SUs0cnK9c5y1REFEJuAgSmajWHmUC
	YvNozqC3r1RuQ0ndXYkez2JJ1VmqngMJ/oYts1SRuaXar2oE3JKd58A3R+dYErY6JEiVDSlt+Ka
	FgPYUCYyAbTIxq+Vx19ent4JO3zmpWWsMWnPrX3jQCFUHOIEhw2LOkFMg5gRXe3BLE10koUmpyU
	PnE0t2BR7VWkdBPI0lvdPSu+ZnS3e5MLSiISeYW6Y78B+IQI+QyYgaBZhEsIjc6x+jJ3gGcAXfO
	MPwWeFsfcZj3EKPDEEXANP0dK4zQimQ
X-Received: by 2002:a05:622a:17cf:b0:532:9ca3:a409 with SMTP id d75a77b69052e-5329e3ab307mr19151701cf.24.1789695606384;
        Thu, 17 Sep 2026 18:40:06 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([148.222.209.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532a185be6bsm2157041cf.1.2026.09.17.18.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:40:05 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: linux-block@vger.kernel.org
Cc: axboe@kernel.dk,
	linux-kernel@vger.kernel.org,
	emersonbusson@gmail.com
Subject: [PATCH v3 2/2] drivers/block: integrate ramshared driver into build system
Date: Thu, 17 Sep 2026 22:39:55 -0300
Message-ID: <20260917223828.ramshared-v3-2-kconfig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917223828.ramshared-v3-0-cover@gmail.com>
References: <20260917223828.ramshared-v3-0-cover@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Connect drivers/block/ramshared to drivers/block/Kconfig and
drivers/block/Makefile under the CONFIG_BLK_DEV_RAMSHARED symbol.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
---
 drivers/block/Kconfig  | 2 ++
 drivers/block/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 8e49b12..d3a5e81 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -375,3 +375,5 @@ config BLK_DEV_ZONED_LOOP
 	  If unsure, say N.
 
+source "drivers/block/ramshared/Kconfig"
+
 endif # BLK_DEV
diff --git a/drivers/block/Makefile b/drivers/block/Makefile
index 28cb489..f895c11 100644
--- a/drivers/block/Makefile
+++ b/drivers/block/Makefile
@@ -41,3 +41,4 @@ obj-$(CONFIG_BLK_DEV_ZONED_LOOP)	+= zloop.o
 
+obj-$(CONFIG_BLK_DEV_RAMSHARED)	+= ramshared/
 
 swim_mod-y	:= swim.o swim_asm.o

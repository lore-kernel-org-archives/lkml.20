Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A86345CDD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814186; cv=none; b=QvzJUOk5Cpxu32qdAeaJO6TtRxb0sJHtQXxmq9ZlaPo8Ek1oHaxIuHZ5MEZZEE8/8uOP5LDZo96fR8u5bqTjN7RVV4GMRcw6WuBslZRdJDEziYb310Y73wN4/z0WQ8MVVYXGi06MQ8JDq+rFrECUp0SGk4wfsEkXSmyc1gfalKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814186; c=relaxed/simple;
	bh=d7V63ETqS5KwO2JLJJ4phi9OeaE1qr5eUbFXnwkj0e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZz1YTNJM01I55njA/OcQtRNeicz7Z2rqqwk8QRcT6eIEGqAKl2qLoQ6mMibL+oOinM5B22JMsvIMIKTrk54EMz9pOb1magyTY4F83cKYbmNgWmQ/ShyEXDCSyy6dXjov66onsZvt674vSqHI2RL5xZdS2/+mkh+e+9shEZnqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPEUMmlH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPEUMmlH"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so2458264b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814184; x=1791418984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H73SBua2th6nVmJcdyFkXeo+q0gSIw9BBCqcFccuS6E=;
        b=dPEUMmlHwRGbXCh6Wxgs1tgs8VGv3iIZQvRhI2tHU5Qw+Goz52NJQisBNELTJFIWBi
         +xMEdTCHOfl5j0z/0ObBasFiuHppkWBGjAU+tyuRfZs/VWkpN5t5zsuOAUykjpkKO3EW
         tYmruUnVfUZhvVDadnsycDjJa4WijuaAX4Txb6qgJMnhaSlaoWlSSWkCjQ1d6Qs+HcBB
         R6PbFxHnhft8cwmk/4EQu9kNOMyZW/k5sGjcfVX9zMky6QdANsTfAJ6h6I9eGVQCu/0B
         Ry4bdRvHPZeC/VTDlKAHQ7D1SHo7zg5er4YBVBJfCyZ4xlrmBcS3VLx7AeTU6NO+mluP
         6r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814184; x=1791418984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H73SBua2th6nVmJcdyFkXeo+q0gSIw9BBCqcFccuS6E=;
        b=ctC8xzg2uauGcbBepCXpk5k9TV6lzKwAmBV2yMAn4VkRPdyfDjKcpgZCBsZvwi6iNT
         bazfoMfcz5qlVX+Ofz2FoXGvudpuzVbFNVzXheoUquQW+GUDbdLx0ifzlBeJe2ZKGXoj
         1/CYiERjyHyv2V9bKIHEB4RILL9K5VBvha8jeiun8LcAlWWLJj0+zwWi2dU9mIsnWVX2
         IPzhsvRc7YB9HFSAFoWR1DTZ+/zkbGHvDGfI+PZTaToHAP6Vv3vSIw8Y5H8DaPPKkP6x
         zRsBrjH6WadFJ7AGIrn7IuKRqX0roPc1y+J6kFLpi7NK+0zDhvjJN3d3e6oskKSCoM4M
         LkaA==
X-Forwarded-Encrypted: i=1; AKwUvBybnsWfitkbIiitvffD3jTSc1tm2tpVLsmDZZ2cqSLkS6c564TKIiywnyULVQ03yyE4uZ5JuZcmWSag/Hs=@vger.kernel.org
X-Gm-Message-State: AFuF++nUsKBTPCsQocugZCH/uVK3prFJeZaFrtjM2AQlufH0CE8h+v9g
	0J2GZuObdonnJ7D5O6R626PzLgjGhlavl7tVli8aRjHWBz5W0ozIFjGc
X-Gm-Gg: AYBFou1tyuUU3yelwFeJWTBhqsa3IXIhXF2o4teG1RvhMZk8t98f4HD43DJo6H/EhBl
	ykJXSGu/ak8vgXnkhJjG3BANNcnDTtYHZroJOtfmHGo4j/dPIvF80xE6fHvyIkS7bV4aMfAHPCP
	Lk5jvIbM/pYU9o0K2EtRDzGFa7Qc+l4ocex25VpQvZFNHFth1XS8jJCTBx4YH9tqdGGtU9mkyPY
	O/CbodwNI317Qyjt9l8REnh2yCwDTqP8IAdfpgeUcD15M6sjjMSRbMEP0SvLU9FS9VSkHyNnLc/
	Rp1gueLd17MMTakjhZRYhBAWU69b5rrP7sd7cBW8A6Zy3svlYuJAGmkBS/KRuvlauVTp9JGGL4/
	8wzq6S/lUqf5ldrsRZWjEwBz08KW1e8jXEr11iMnMESUZEzeWt6upKVv1peAwdSithT/VL1/zmR
	89VfCpScY9Fn92a9t1FgiKfbYX8FQT+fRzpdD6DjtdJ8CwrjdiJ6Pw
X-Received: by 2002:a05:6a00:a257:b0:886:360e:c0b6 with SMTP id d2e1a72fcca58-8874ab8b044mr2320692b3a.14.1790814184225;
        Wed, 30 Sep 2026 17:23:04 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818deef3esm247601b3a.29.2026.09.30.17.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:23:03 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v7 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Thu,  1 Oct 2026 00:22:35 +0000
Message-ID: <20261001002239.31461-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001002239.31461-1-qby140326@gmail.com>
References: <20261001002239.31461-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d55b637c32e1..c0b657dfe11f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23042,6 +23042,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Gladyshev Ilya <foxido@foxido.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0


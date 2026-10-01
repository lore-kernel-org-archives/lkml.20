Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD21F8691
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814769; cv=none; b=c+uU+6ZxnZ9BxlWiHbiTKBw20OVxVXpIPj947r3AUBSipukRCRYe/7jaRzY/4RgSYi049PuJIpQ5aDzdNvqtR4liI471ennOKMU+9nRbZK+FydXQzD/T5j8uEV7U/z0kURJF5vNR2Hiw1ii70uNLSoPIKKJzy0VC4MIL2NNMTTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814769; c=relaxed/simple;
	bh=q3qWhoHCW0OCxysSDjAVLOk4TgRNoDkbod4CsnVmnts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8F27INk6I1g/gZ4+1NPZFxJwKHD1Lx56VbdX+U/zaS186rQmAV5nI+nzyrfUo+o1m7I+zSmzEtfggHt9+xWBvKI8tjk6fRbh3hm4Uo4nUktOQSNrYU5UrbznS3ZHJtiFEMm4JgvZMIkbwZs5wjSThZdw7qe9goSZsIzuHrGEjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2ePpMq9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2ePpMq9"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so26703295ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814757; x=1791419557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=V2ePpMq96+7LfMb6HIe3N0byqXHnxV4I5wvcLqyNvkpvfCxTDudpYHQe+bAxF2rbop
         9vS+L69Fyd46Zmk+LHg6Y1bs9MbfHcYEZT0BpcqMnhxt1QeQ5xpbiyPbB52Enms4Eh2W
         G+jVxEmu0dqBtKfr5dPiM7NwNX4u2cBdZb+2LKMgeB4x4QGRjqyBJvv++35Cw/8yk8v0
         CA6dd/O9o3wzYHiMS2jsvsWwqD1gEuM+YOzeI01wLOphP8SD5Ke5onHbgRXhRw2GIUhh
         vtJ77LtMromwT22WR8Rpt4JyVUIFp6Mo/VkCqxO3RQVPYrA14FGbSjWNOQvVJnAveLzv
         XsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814757; x=1791419557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=ri7ZlUIVqKwjB+LIU3CcxijFNbCP9BfQTNiyq08FoG3OxhCtgzAlEQMp7T9V94ordG
         hTD6xVnkzYA0p9Nqi7WhNf4HEE3VJTO3OqbV2lmrgM3Vkz2nlz0pfI8UTQYrT4Htjtj4
         vLQUZitIeVecr1V2gE529SPfu9iwM1RMd37UWzqHsOSLC7YpTJooYNGXkfbRA26uHXhj
         NAYbOoPEBCzY8VXxJioIv1pe90HMyOMTBnUTFR/H8h+Jt5RTpATtM8mqiO3s2RMQayXh
         WTlAEJFEuPPvlFB9iaLPnZRCIivcEwwkZozp26CjRjPhxe94SiUyhkKfCQoE7TIm36dA
         lzHw==
X-Forwarded-Encrypted: i=1; AKwUvBzefmOD/tp1J9ZvbTDtXXQ8Gt+wYSS0gJJqETsfXvwecTMlM9Tk6lIHTen16MTPtuXLh9kBxopstRHOKkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsWkZUop7Xm7ihoeCRY5SJ/kvdrnLqdiuSEeQJ7pKKNbHH0xbJ
	w3xV5396dKbQi2e9HE3fQarxHuFpZlehoOzQC/1+4i1P25jQQHH5k5p3
X-Gm-Gg: AYBFou2CP/l2kghqc5RPjbNYCtpQbCEfzqlZk8nIrj/LmpXMnzxcMvMGq8vmT+/v6IQ
	W7bbmxeb1PDN7r+fNiTPzJPAjqMXsG2WXkTHL00FR3UFJiNw/DtWo+kY2n1whV2Dwve5kxkjXZH
	9qGSGPbNSu8BaYTM9hymdbWJP8PdfMr/jfOHW1+6Xyme9j8xJKNnctgHZu5D08aWbwkXzunrDBI
	d0aQi969i/eItc5RThYm1X4L7Cm52kPUcQ7dwoYktqJZv5tIzDM6TGHdoEpdDGltxCU5dzb80LG
	tl396clEhcsHoazMxtA7WNq9Z21eA+NhD6v1VG97Ce4DSbKOBt10/zmiXoAhDXugw+85CxJ5ChE
	p9bn1J67k1ecDF+9nDQ+DSQg1u+YSILEovX07d1E63WyrUzIwMU5qOk3k91yQnDme8hRdFrHyrj
	VP6Uda7VJRBu/IKvYA+k4xVKkvL8PTjPHOqp+THvmjJlDBaS/p8HR0
X-Received: by 2002:a17:902:ec8a:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e2e499dff8mr23868575ad.24.1790814757114;
        Wed, 30 Sep 2026 17:32:37 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b58345sm3161615ad.66.2026.09.30.17.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:32:36 -0700 (PDT)
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
Subject: [PATCH v8 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Thu,  1 Oct 2026 00:32:14 +0000
Message-ID: <20261001003218.39421-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001003218.39421-1-qby140326@gmail.com>
References: <20261001003218.39421-1-qby140326@gmail.com>
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
index d55b637c32e1..7592bfa24062 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23042,6 +23042,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0


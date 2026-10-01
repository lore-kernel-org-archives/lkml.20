Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FAD4B7162
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861852; cv=none; b=TYN51t7V+MOQPlOF3XoNiTpkiOw3IHfJUy82St5648HshrA21FJ6wZr5W7Wg26F0iiIVypXDgxb8KbaJPd3cRV+7nfSF4fVjDj3vzjJV49KnpEgORFyA/Q+RXKzSrdtzWbQldzFHSiGgqY8Du4coEBosr8au7mrAZZW15Dwnf84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861852; c=relaxed/simple;
	bh=q3qWhoHCW0OCxysSDjAVLOk4TgRNoDkbod4CsnVmnts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIQlUNErApi1stpc7FPG0PkU1nW5a7FCIXP6r3JB3mbWVV9Y8bNJV9Z/v8bOp6SwJV3Uw6voha3seS+BaU6AetGBELFGrgkUblUPB6dNAmoqLlOGxRWDF7/01fp4i6i1l+as/t+18kLRO+/2Z9Z7boVBNnHlel4P05XIHRq7mG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMcXOdJO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMcXOdJO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1989401a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861848; x=1791466648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=RMcXOdJOswsLb5CTzRKQWAW5l7/Dd9aDuKH7gSLuUok9fvXTqnOPl9UzMfJpLgZrn9
         SXNmXJYmbsnoXlIuC/KNlWiEC57ia/4Krla1odMzyYRAqaeV2gOmc2W+A309ywL5ydq0
         fEi45uKDEFh0VLpiWhnURdPTLFh1nbKqoQoshkPcS97S4MLEoDs8zhs5485upd5t8Fhc
         OenzM/JtvebrpzVqmiy5EZ+PD8avPS3O/xqLVf+Na156QMqJ0rcaBuTRVaWBRhwvf8G9
         Te+6Fsh2y3xRnL6y6CnZL+w6rHqNYZ6rnLG/Q3Yf0aOf52icGVgo9UBYP1gNq/SzIzUv
         RKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861848; x=1791466648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=tgCTUI6TT+etYMwgIRyTEx//wAyi/+vxcEuCj6AlzW2WsF+/xdgg70b4HNFUBiKXyS
         nhcJgYbaNakpgD6OK6UXxKs0YhcjrEvwgide1a28GDcLcTr3m2BkpsbIuK8xahhTO1cc
         Ufz2N8Hch5Xc/oIvSMr/Ss1P7E7bDSP3PEH5FZqOy1nqCQPIFaOC+/KH5yTBkTlKeXY9
         TykuQ4sR0ZXKu81pgAOt0wqZ3ut/kO+Oqc+gyJYf0rce5GbMIkjq6vp6BxXg90nGByKt
         RLsd+73mYsMGn30AeatxtyBm8T4pLhrgH2IZczi9ml3eOs9J0L+ibVvdvcPS3PIyKYsd
         mrbg==
X-Forwarded-Encrypted: i=1; AKwUvBxrIIA8B6THAP0udRKTgXz52E0Ae718lNiEILBjxbKdt92S99IeUQkPLeYpuOyoHRLtwpkrKGsv47JfqAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN4PB77otiGU7w7V9AoJhE3rliQ2YGOS6wKJ+BahAb0QWH68gT
	kfnqAudxNGcjFpGgnF9mIFMeHjHHfwjiepg2Qc1e+601+Xl4mAwsy/o+
X-Gm-Gg: AYBFou3qUAjoqO1Ecl43z/mcRCQx7w3KyS8K1culIJtEO7mJQtLUVUMGTI1gZrUkJyA
	T8GUUhwyx9ZzepwogAw75RkUfko0osUK82xXiUsDF+vqn7gcBJ3CCM0jxtESA9RJlj556WyN1SH
	YAVuMOVwMj7m/OXpJXdRDiN3cNSOoFhEWxaI0RBIxeqC/DSTLWrIkKh6/hoGB/x2ACxDL1O6h5/
	6HqbSen/zlXuazVG1YR5/mEGu1cdpWLylVMh7UIYn1jRFFWi6tZdazpoSm3FcwPyScs9vP6NU9X
	qThOTMgZPswscIBCBUcp5XiIipxNGJyTaKmGOZhoM3KpWnPo4IMBJlqP1ukzlkQfU/s+MW70Gry
	urlfVkbxO1c22H9rZkzL+Urco01CMzq1htcA4qsMW+sEyRwHEZl9a39bO2D/nGnSG9Rc3N0tIxj
	Pfj6iXY6cmLes1I4a0g0MEf5VO4/oTKHAXsXlNYRy+KLFOLPjKJF9DsTb9nzaoS9XzOJZU36o=
X-Received: by 2002:a17:90a:ec8c:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3a4f32d2c17mr1550221a91.40.1790861847715;
        Thu, 01 Oct 2026 06:37:27 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm4715737a91.6.2026.10.01.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:37:27 -0700 (PDT)
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
Subject: [PATCH v9 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Thu,  1 Oct 2026 21:37:01 +0800
Message-ID: <20261001133705.69244-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001133705.69244-1-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com>
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


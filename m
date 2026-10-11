Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10176443302
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727095; cv=none; b=l4FSPXg2vRKyw/ZNA/9E4PRBf6R7eKVGvvaSJ4DQj9PzmaVv9gD7wbPFp8Pua6Ny9KNsjWDhpHd+tJBSpLqNBe138AoTHV7y4M+5D/hs2KxzF42R59ERAY3utswfn2r8xpIWV5rFl+YXT5BXBaGTXAOT7In8ujP4b437YDdeBvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727095; c=relaxed/simple;
	bh=mD6dZoP3ZagEhLT8en6JZ2TEnxmI/QAwfBdTaspPZtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTP8ESNB4AIMnpsq7ezUWiSlL9qTjB4G+fP8K2uqD9DwKius84ePVRzYiYbUxXD2HVNj7OtZsDvYKlIBxfANp+OzrwoUB3i0xQjM1tQanZrdGc/igwfkE0yUaxRSVTNtHspfJjjlv4YAhId053eCPW+5qSmFOaHS3z2sJ3zyHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNyGxobr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNyGxobr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so1017552a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727093; x=1792331893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=KNyGxobrICBU7Vvtk1Wa1IqWTLHaJzUiQg5QRnzOK1eC8WMXu8m5/fSH3naUUuc5pw
         5Ifbml9zvmHY4BDSM9D09MonxzfEmPZy8uYXQJGjrUqwTM2ltvKjsVbgA8gvOcSKoZUe
         l0sEk3C5Q4lpYgT6FbBj6jebxaC5dbeWtNQIT8s4kPp2qNVUxD9oltJswwIF5bEC+cjs
         ZyKEUqn1i9Kw3zf8GyMwagUMXMWD4PI/0vE6HnRR2BKodBWiK480I8viq07i8c+RViek
         GWk97y12ZThWJP4JcUbvwarKtnht5J5R6gF+qbuCrMFmnIiz6dlQH9x02LVz9Mr9TkA3
         urNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727093; x=1792331893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=WFrdwu5WIsyej3y3a/Yunfs8oQeJKLoeLiO9qiGcXlySr0mZaI6aKgkiNM3uipQzRN
         IqJQJIO/sDmjKvJIROPGbxgy+xw0Znmp7lZT2zWg97zq/0aD5fMO6/U+F9fIjHe7Sx4h
         4369Ey2pl+v5gm/v9ZcLR5hlxsENZhn9/DvmUA1IaePWAjcs0rqyGIcVKwXzADX9m6SM
         Dh2EeL7apSYlkeUIg+2WSAOSjTUO912QTzl9rEylaO+MTAgQavJlGoUgMDWr5AjKXaJL
         zrf/6shHatQ89h+xqAhlSkJYgbEBqwzf4ElYZEfEz81WxN5eb0aZjTJkoOBz58U3v3pl
         ta+A==
X-Forwarded-Encrypted: i=1; AKwUvBwSgkd3PAWsfkgXjdY7gGYuzYFAJV20ON8YDpfgJI2lVUuNNS+YGRyL7va5qAo7zlFyaSJ4ZvW5UdZUfXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbnkfASc5bGKk6Y4jaLFyhv3+c3cdBgfi/7DW4h386fmckNh36
	lVMrCuKS5CuSa4UX9IrruAq8lz5qQ9mJ8H3NGrjKWyTWH2KeIWYZticb
X-Gm-Gg: AYBFou0FrS3mNAIcUZZO/LcP/Y9pYrd+xHKzPUQvV14RUDFnFQbc04cWTyqPFI4tyJr
	KvYkProPRLakQH0szT4fcRo05Kh1Bs2KenIsgPzyUIF4mQNn5e8xqZZhKg0CaXqBFpSnOP4vW8e
	+52qSU6mxsHzAYPlCGDZ5OXK1JC37wA/ggvDtKPLWNfIe5PrFcpPKXdEtEwNsj06TmXkItaGUKh
	+EZsqq5+dEnCgu44UEmsj8SwGDCv6k6r/OqXpVbVJhwVyqdBAm8Bx1jndWmXeiW9SX0IqxXXJdH
	pr2ws7WToqy3KyMi3URK7nK4CHi4P3wifeB+FKmNGudwBv6i/Ov8QiEjCP1ASVFcgbGj/iM3zpT
	fWly9yrhcj6rpPk29HhWEoaRkYX5F0BHqkigjxm0ShwNtZd4Etspj14+GNOoy+xBOxB7oJai8J6
	9ziZTpSNw8DCrimrCMgDKcJ/X8N8NCKfp264AWZvn9ycCfnZkQ7+MyWSpJVQSPwi9TteDBJ2Vn
X-Received: by 2002:a17:90b:2e08:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3ab3a979396mr6672820a91.60.1791727093298;
        Sun, 11 Oct 2026 06:58:13 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm11831648a91.16.2026.10.11.06.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:58:12 -0700 (PDT)
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
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v10 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Sun, 11 Oct 2026 21:57:44 +0800
Message-ID: <20261011135748.11792-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011135748.11792-1-qby140326@gmail.com>
References: <20261011135748.11792-1-qby140326@gmail.com>
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
index fa0571a5e479..0874713f262b 100644
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


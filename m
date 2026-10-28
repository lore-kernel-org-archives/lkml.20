Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186887;
	b=Y44kUnP8LgS/emI1ECpc2yyBxO0+6GrUDRZsEWh+78Tm1IY3F+k3MEhb02g//0qu0eMZ
	 Pnp/9emJ2pklXjebOaX9+LOEjyNvNXLGv7NMKoOc8RF6qlnUc0ypVaRyXvkTcDMfM6NrZ
	 gownPGfegUw+2mqZfSdf1ihF5aFl9hkD4WSYXZqZCw/Vk/nNx+Th0lsr5tYSz3+F9wkQU
	 cgom8B/f3elAyymI8ppgTbzBMbUAMKctkDZ4U/g19oL2BoJbtGCuk1aYuQaEQoF6MNENf
	 M86VJSdim91JJI8RIoZjrmwvVkVaExXUYhbZk4Xa6UEW8kRiZAL1giQIAGWwlySXatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
	b=aXGGLlMzelNVuxh3hJ/prFq32USvAE3rT/A0c7RSGSFsOOwlJrF/OqevD/lbmMCYeAih
	 4QhtlVhngtv37wHXh3KwMIWPFqE5NcdN5b3RRLSqfen2J2yhGMIs0pMPQklSy/3uHmV13
	 ai6xJP4YMpkfn+mThiPiOKYW/1yDKwTZf5Ul59pHYd7NANcAW1T3Nu2YM7ZeJfNp6Adna
	 priSNbXcWcSI2brPh+uIFpYjD9nX6xKkuzqvO1MIZgkyY5tEXry3KlMoNyuYeIsOU95Z4
	 29v1n8yKbC88F8fDSPGWykjw+q/hwTaLMqYWeybKg1cVfFb6q7ePpfJYiZduMYTx1Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pHF4cm/G";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A87606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHF4cm/G
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso5038855ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186886; x=1793791686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=pHF4cm/Gtj35Vl/HJPbHyddiIIeIKyQtkvmg8Yz/kw3scBHhEbCLLbaiZevtUNMcfw
         7ckAt/0xynwqqrjNNzojtSMyZqrHq9DP5tP0/Lbmp0ihkMOrng3hiGkb2gq1EAhaXgO0
         FLCuVutUGqbm5G9Kuw8t6pgX5uFcW4v39J7lIn7qVnejyhzyonApnoyVuVC023oUwmuC
         oaZI1CkndmSSxTy3yQfCVv4lyaCATaTUVcfhsygygf3H94O3y3LfFUzjEy/uSdNOtnWX
         CFVfI6bYnTxyrP1fVSXgGAAx96a94P5+DLTYca8EBc77phaqvNsWqnl/KENso28W1PpK
         /Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186886; x=1793791686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=Ys3qnOFVTjkJysxc/7pI4M66aWVosX+QHka+nktZHxBx7jaFnxmGpSQh1kYYR7pYFQ
         erqRNWd1+i4yBOwUIP6+TrT8oLMymZVoqMIEFerUlRDkEV1zPTYIZhh72XUI2JlPJreL
         aDJJcfkIiZu0mDkf5110Mdi4T2S9tBWcaECiqIDt6oedaZW7608TiLaiPcu21cIb1x4M
         0wuO3PNClGG9svYpYfEAM0WDKkjPUugNjdBqA4tUMgLcxIDvd5+tvsdUx62eQG11HFV7
         +6zfSZ/3DfI1Ix3tJrm/fti+mjGQsaERoLgJ9NuVd0c7hrEaAjVc1LcJ9T3W/gm5/k+7
         TvWA==
X-Forwarded-Encrypted: i=1; AKwUvBzfabsh3pLfm4BhBYZUbvxrHvarr7bdn2DgjKnvjYmF8Z/yHafdS7djbfHjlaQG7y2XI/nK0tHOKEwLW44=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4OY12lx6N0//F3YSC3qHKyvfE4HBfnKANsMdF1PoGDVJzXXx7
	BJhPY0B/Uy9pRbXedTT4XktjxcoYy4NxI+cuuQHTWbKiXunVWFdbRJEd
X-Gm-Gg: AYBFou3qPiT7VLwnj8QyfpoV9NTJYGEbV8dJAbR9F92YuHnXFVWi6GN6BQBkpdfZAat
	3YZXsCqiURY1Sks0f9lOddhWYlQQjAXvBMbPzEctPsN5/pGm/8ol5fsNxmZD4Vs79tOuACnFhQd
	uBc++qWIrmSi1ucT+S4BTTeyEJzLA1/wWJQL82wd8AToRzEKFC7S43td7uFfgo+1QXqHcYufkus
	A2qZ11iFc9C/TyN8g39+s5t9e0MzgaOaYndH8tLXvqjp8Jtgi7JQ1JbbhHaokvMLN0aH+UBf5F/
	q1z+L9G5YHHu4EPt3UN6FfAZT8HAQV13Iq3zrnWtGeyCDA9CttyLnw6GhXIX1BWULQLQ+9zxxqy
	GUkQFO/DdNxBrtmKsqF3vzGFoM9wil6uo2lEATug6+K8gURYsi4I9xHK6bVRT6DdvIgfD1lLs2V
	/MdzsqDaPuBlK68GZFl/8D6CsCGZJYG+9lSiEf/98T8O2xFqCefVIfNVdLPC/au5JRjFtFD5mlT
	17VOCtbOuEd525LeJdUqHQhPJGRLrl9SvTf4h0BEeeV65MtMKdwRskSs5lMrr5ehe6fHXVG01xE
	qbhVwNcWnPk=
X-Received: by 2002:a17:903:3d0f:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2eb00338be7mr18248175ad.16.1793186885470;
        Wed, 28 Oct 2026 04:28:05 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:04 -0700 (PDT)
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
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v15 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Wed, 28 Oct 2026 11:27:37 +0000
Message-ID: <20261028112742.674847-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 508912fb4e54..250c471e674d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23044,6 +23044,13 @@ L:	platform-driver-x86@vger.kernel.org
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
2.56.0


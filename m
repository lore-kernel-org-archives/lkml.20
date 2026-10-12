Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD068363C5E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812299; cv=none; b=AJWL3EV6mWFu+IBunPtmjG6lnF94UDCaIp0svOrKcGPjFxvp3l/EG2nRCyXUFwnwVKWNwkQ6ZhTdSwEdtOxDq3z1g4atjiWbe5VoPIULeAGlDvin22RCnIxuM2gS7f3iDp4J5tnhV83Ey5Rbj4rdND2CGfLM+qimUeUALa9hPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812299; c=relaxed/simple;
	bh=mD6dZoP3ZagEhLT8en6JZ2TEnxmI/QAwfBdTaspPZtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvilgLmuJqBT+u8mO3X3/7tTTPc5YeG+0amy5b3RF9wCNbqw3iAPHxJmR6jMKGdr4m256jqiw71DneOsTcViS/yJgJh7sQD34Ws0UDc9ljTM34GzRIOVdWrCcVzuB2CM/gMGIb+0xcCrCDKRJsDRGO2+x9BA77ZQb034JA+aIN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0JjcHvY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0JjcHvY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1090362a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812298; x=1792417098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=b0JjcHvYhCIGiefd7rVojDLDSA1A2LuiRnS/8TCYwPJzpH77GJHE/Dhdy11aFNpP4z
         1nWjkpynmOji1bCmxyDxnccslXXDyUPY7AJLG0+ys+lqWAwwuieKAw5oXe7tkJ1Tn/uM
         tdpGNRNWHTpkhPZD4sBunlJBpPl1HCbSJSXCj4/R0ORGXClPY7SHt+PWVm9ri+LaKEAG
         wA1CvHg5tNfCtLUlCbHgglUQQV7hTBsnNMTnJFJcSKJqheAdY2EMy5kPGfrikYWeUWqS
         d8Sz4ngz7+IXSWbW35mP4GplwwU4k1bgyqgX8ZkcaKHJmahhEtaFqn/BtBrXFcd1DY/Z
         aSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812298; x=1792417098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=Pv3knhz3tsWDm3lMzYx6I0vFWzKys0PuGSt/eeVJBw8TLsZt/uGuuvSTYJ4vRZMJe8
         wqvJWrz8qayHgXNW5BA0HrBPWnsVO0+I9R5NXlg7DpDFUBjlQqL8ZM/gf2lCHUTu5HJe
         HsdafcaZBUKCBKnpqKYTV+4T3QhtmVK/QIlrAOwBeo6rgGJu2Fufzq1XrjzJ2gMxQmMH
         zK600S59zDN3sj6lKeD5cTOJcmvBrX0PwlFQvRzsECbNmAOTwZQOaKvzj5zUnpTkWia3
         jLDKvQpA37+gs28eaAwTOFniTyTw8VPhJYF5Kx4OolSsUkQk6kMIiTfimszgKZxL0EYK
         O+RA==
X-Forwarded-Encrypted: i=1; AKwUvBzZG76YgSqn77vO5QKKD3BPRLSuOZhZzJgmtZyh3Di545tW3Vrps1mWWRDjZYax5Okq8W4vYunwwSxmAao=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB07TJQ4IEm3lnRBsXoVMwkqeDSgM681o/MVvUpzEZ/ijZY4fO
	KA6h8dKxgkrdZFo9G3owGXME0pHdY/H6muWIf/Q1UFurPUf+hmzdEuIn
X-Gm-Gg: AYBFou0r5vxiuBXf5GGpp7YILruMZUGQYLiV1tRgVYso81wsFQlknwN2dQXQFFkubFx
	wMQrUB4EmkKLlnexfFhjv3vFIWFevv4vCoZjF8CjPowAZmEBhKj9i/bkQAuI1Z+MeDKr+evZOnK
	sqbYtPrOs9KEZl6XmiHqQ9Ymy2WT21TyXAbSPAImMwUmR9nQStd96m1YlCtaM98W5sl/D+CXjxT
	n5mbNUi4TpE4Jq3QUtO3h3807LpGpsWFGsBfqrfPqVaJTMjZLFkGmLZhH8+t75yoUYJaZ6ZuTiY
	N7xjgF+ITvQ56E7WYM4BJabsdVHLUKIfQ3xKiOngg0joqNp0lK3jQwBq70IhEvJ8MpqMi8B3N6T
	d7JXTxhAl5w3c9LGMCxp9+/Y/cu3MwOxbWgnUeni/uwlSeFcFV4PVWjY+dS5p7aZBu68zIzqCfk
	A/eGctwJlBddkLv5wZ9qpz2y7xPcywVjw+X5u75vemiHvCx8481uccKh5qTV0MZ9RBvF/ML30=
X-Received: by 2002:a17:90b:3b90:b0:3ac:17c:6e72 with SMTP id 98e67ed59e1d1-3ac017c6fc4mr2086992a91.11.1791812297979;
        Mon, 12 Oct 2026 06:38:17 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:17 -0700 (PDT)
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
Subject: [PATCH v12 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 12 Oct 2026 21:36:43 +0800
Message-ID: <20261012133648.132363-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
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


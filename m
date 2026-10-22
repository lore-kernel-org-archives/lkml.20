Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651190;
	b=myihebza5+yAav5l0TCQzCMmbyTZRru+fN06VjkPPaHiZpgQ7uK30/deFu++FAdWf6a1
	 rwgbAPp1pTvT39Qzr4lC3a84YUam9n/iKjcORhnhZUoA/BDo0mLb9h23rXwCOY9bL2l/7
	 7X8Bc/Y3cSMz3EQUAe1Wh4fqdhQILWrmndU8Pif7Jui5nNZI/JCljaQVplQO57neAIJZT
	 1fqj4bxkjQ7sQ5PrWnmWb+Xh9XCCEHzjOg5Uroie+F5/UQp/nPGWE4r8xf1gedFP2VbJa
	 gNc5cUmUnMe9SMKt39O591V8GjulNs5MIWsS1ljrkQcAtVYD38J2zPpjCX2xLXXXAJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F5xNpfAD02cdt0fNkq//IluH1XyFdn8v8eKHcwoQ9gY=;
	b=w3zHLMuFSDqZ0vxG/7IEujm8XKwSaxO8yuTU98KUxEOSGr1o9JEiT4Fn5wc81wbXU0Je
	 nC3zhkzABPuVAuyO1KOb9XVBDtgFgQofulgovd7h2ilvEFH1sVpiuTw3blOMsT5s1hvzw
	 sHdgrORg846oX5apjX5WpwhutJQAOiWI3C2TaJCnyWV2YqI2clCswst/TmI1yeT5PNjRP
	 HRnwsTwqlxrdeazu3doAkjwtrd3AkzOdM5tC9Sk0YH3zLpoTCYYLoDJUedq+ENE+awJA5
	 +tzYTnPDXJ8by0owzBD4v6qw5uINu0tSM3NfWVKW/7Yh+W6sEiGk1C+LVOsR/RwFS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+FhUgHa;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96023606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96023606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+FhUgHa
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1200389a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651189; x=1793255989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5xNpfAD02cdt0fNkq//IluH1XyFdn8v8eKHcwoQ9gY=;
        b=S+FhUgHa7+uJvTERie8Eh+msu/qTG4smFNLP7wCxYwDWhkeJbRRuAkaHCtBDkN2fEL
         vTIyTesqVTz5mj+Kj5pqX2in9paYHMVI31pf+KR6BhS80h24s94OxeoGHU1EhzUzCD4v
         1bYTBaxHGRJNNe4kVXyokdUyndbRv+JcWmgi80V8XhMtZK4rcxdsHVh2HHE460qnLyZZ
         m0BJm0oSk/veJuxGfR31bNOzusliR9hLo1FznTK9+BFpAsDjaLnBbkt0nvzhgdYkvF+9
         ef1XE6lJv215fO7aJDmVWCGij9Jormnc4lhs5dvnaOj+FxvzBPK6fQVvKQyBSBJXVUoe
         U/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651189; x=1793255989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5xNpfAD02cdt0fNkq//IluH1XyFdn8v8eKHcwoQ9gY=;
        b=e7wqiPxQjmWNbXGDC2ggdutnmQw0uTh3XN/g8zM0RkFpZ7tq1x654EfKIYX/dyJTDR
         zgNnooPrxCJn3bKoVEPsVtYBRqfcx73HwoI2Vz1CBCjnQKlHnS0wikfctNy8cikxynPx
         BQVvBXPmD7t21UVFqUKeGztP9OGF7Qu9a/+yc0cjivR1QydjjLi+P4t4hAUP+XDg+fWR
         NH3jMYJT8AsrwE81tr2/cB8hNIO36LR5eggFfM7vODlwyu8JZYmkIcna9hPlaewUimn6
         WoThbtI5Cv5Ct3L82zYDGXr+INta5wKRIEhauV9Dxc65cTXiAJ98kDajaUQGQtuUny0d
         0mXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0GVwfWhhqbwgnoLDtip3LtObYKl6UyPJybF+mY0U+UDOc2sobBC67MWKCCCuXQyrhntb2Cm0R6HDVqVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2DCHoU/fPWjjbA2VrMsnvSOo73Lk7kR6ukj4TjwRNyrhul2rY
	4tBNBoYnkdKY4cvCMwzJYlKOw3aOYRZSrIzqDYBxVzCOvbUNW9DOnXcSM4kUmnEZwq8=
X-Gm-Gg: AYBFou3tn1GMSgPYw8J/+YPCej4bQjKJQ14h5g8NnhMsN7GHeyp4SELhWQZ2sfyKXbE
	GbPXdBUIbkGMGk1UJ6JGtECKzihvOHSg9mmqexUNKc0cdymI8mj97yQa0r2GikXOquaLKSbtsGc
	Pw9xLoUzD6ZYyhWeB5aVWzfG9n1pYXStbxDIhLzZ/q/5ZPH8spXodSfD8OJbOu9VTOGyzavjzY+
	vHYdnod8Md+KsglKQJGyXPJx2fvVHmreru2qmkug1h6awnvX4t42ZLC5BNf+9WBbUlx9F1PEFV9
	5vX8C0P3G9jOg2QzvTMnUjbOXTLE/rYZc8Dl0u98sEglijJqNagku0WfNkXbitZ+6BPrANgtbeW
	uFu/cXn7i+FDYO0xM0hnGtx0GpTSeo/AWz6rxSwxsT1X0w8XrlcdvHdAnQChJfhYXsCdah7snd4
	hlWfrl8JqMla+bNkSViuvX/ZpcbucFG0W01e32jI7pZfZJp62CD9RCfeEZvzo0WA6xT9RdoOXCH
	oP4OmyaGucDK9apqCs/crPIoaihBj0Vf1wq+eVGRC1Uc5TDyPhyId3NY2KFHsBWWusdx+vKmHGV
	iHeeie4pLhykRw==
X-Received: by 2002:a17:90b:17c5:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3ad86f44ed6mr4102493a91.21.1792651188958;
        Wed, 21 Oct 2026 23:39:48 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm2784741a91.2.2026.10.21.23.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:39:48 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de
Cc: dalias@libc.org,
	ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH 1/2] sh: dts: add Casio fx-9750GIII board
Date: Thu, 22 Oct 2026 00:39:35 -0600
Message-ID: <20261022063936.472520-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022063936.472520-1-artem122novak@gmail.com>
References: <20261022063936.472520-1-artem122novak@gmail.com>
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

Describe the Casio fx-9750GIII graphing calculator, which uses the Renesas SH7305 processor.

Added the board Device Tree and its DTB build rule.
The description uses existing SH7305 SoC include
and affirm the calculator memory region.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/boot/dts/Makefile       |  1 +
 arch/sh/boot/dts/fx9750giii.dts | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/sh/boot/dts/fx9750giii.dts

diff --git a/arch/sh/boot/dts/Makefile b/arch/sh/boot/dts/Makefile
index d109978a5eb9..4887fb16dbf2 100644
--- a/arch/sh/boot/dts/Makefile
+++ b/arch/sh/boot/dts/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_SH_FX9750GIII) += fx9750giii.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/sh/boot/dts/fx9750giii.dts b/arch/sh/boot/dts/fx9750giii.dts
new file mode 100644
index 000000000000..bccae22e4899
--- /dev/null
+++ b/arch/sh/boot/dts/fx9750giii.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2026 Artem Novak
+/dts-v1/;
+
+#include "sh7305.dtsi"
+
+/ {
+	model = "Casio fx-9750GIII";
+	compatible = "casio,fx-9750giii", "renesas,sh7305";
+
+	memory@8000000 {
+		device_type = "memory";
+		reg = <0x08000000 0x00080000>;
+	};
+};
-- 
2.56.0


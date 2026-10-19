Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFED3466B58
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792384009; cv=none; b=NuBiKYseZjqzjHQuCDpafZv9d1mUYzgf9ABayFXyASw5HFuURhc4s3BK4oOOpmU9wPXjenElUIVSTnoJno2HRNUkSEWt0sP8Vs1LawFPkMGsxKVa6mapco8ume4FeJtQPgH+AqSnxVr+FAQxUU9fn2b0/NR4KsJPX13DlNKi+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792384009; c=relaxed/simple;
	bh=wWxNX5aBIk1DzM7QX6OS0Fz4jWbzbM41ORw6D9EFpUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c2bqN5gNxQsSL7bHPCwSPVpVmiCf4LKgG+/3MMKQ8fpMbVmTS/x1YwzOlp/Ol0js7GFjhGIFO+BaAXzFc4V8VyHfBcrKIgvrxvP+I70fW6ZeUu3aFz2RuksAjegm2etuqSpnQno98n4dujGBJ2g57qmSMxZtRNoT1+JimwawTnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpKxxBes; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpKxxBes"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so1930964eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792383999; x=1792988799; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=roSFG50KdVzZVyQ42TsjlKxifeyCNK7WeP72SJwZy4w=;
        b=EpKxxBes1/VF3EyutQem9bfFzyNmQXljxAr0f5BJ41nbN/IDkAw9UZDoRdjgSgk++E
         a4KGGf0ikTPJS5AkMH3TrgW6hnkr1sFbLGv0ym3YKUM1HXVVoRFPwl7OWuLgqBPRpZGG
         9y0tAHtljaugeVmHL/kdv5JDeCP/rP0OZ4/oPVozr86zub4c1Yuwf3xno9SMGCY28BSi
         6cSDhvxlFI0LHH9uQQVl8Pzl4RbpjJSJzF2Q1aqCinwtra0EgFWWzSEK8yGYHsW7jneZ
         5diYYQ/PjD1WAZuz4HmxV/153EgMZGvAGnxCnJp3k1+LfL84EBu7+1x3rUaMM9qSLB6c
         5Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383999; x=1792988799;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=roSFG50KdVzZVyQ42TsjlKxifeyCNK7WeP72SJwZy4w=;
        b=wfqjLwGzhJ236URiRHS7XQnXWX8mbIW28EyyIDryctea8LL5+n+TDqB/44Mj4Wntyo
         vHDiQtEJZ+1VMq/BokxvihbB7qvBwyV6kQKB9Ki4mzzdc1qryub8Y6xvBqIEVhlRCPOM
         7HvOabH8G6bh7Kg6lfxUhLD4zaoKeeBlZnugf7JS00bpbdTRVp+xEOE3oIfNBLD0srir
         XbjnqX8gVlnhDKpCDKvRjw/+N9QVfZ3xhzUT4IpVRkq/TgkE2ayARJfc2TTiGg2JvdDg
         D4hsjJQM/kZQ3OCU5Cjrh1BQXUuJ1ic+tujyMZT0GMMHSiJz8f9VfY+JDngjKg2mCf2X
         1ulw==
X-Forwarded-Encrypted: i=1; AKwUvByTahJN8QteGhoCdRVQQiiqvBDpVFrY1UOfx6q1VXYP17WQ6QaeSd3Gq5OW9QoGbi2jHtsYpvj2qZH2OPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmj/Fb5hF19G4hM7KyDKo0AbtrGQfr/tXF4LUfbQ4FBhk9AoHO
	RPpmnbr8r51F5JbdTFSeLgfijKD+Ce0QtjOMlag+S9tNnVD/hIZk+QCH
X-Gm-Gg: AYBFou2SSSLLQ75eoB63lj0hwb7pbF9OI/YIAvX3HFrCHHJvYqmmQsvsJqQLx29HynW
	pKXQr+FEs2VHgvylMhCXpYQf7aleTLyJTgP3I10XQfTUQFH01OQQHwXSC/BurRauU9v3f1veJqa
	WY6PIy5OfMWmsknq5cXjNgCKuqNRdURuBdjcZU+LaGLHlRGSjOZ7ETDLUq4zSonNVRyfcGSx4Tw
	JnE1AAW/yAA62xPgCMY89gHcwjzeTMgxWxGndplfVkm4am57WgWX1QaOAgI8+g0TN+fU0a5gNBr
	UiCe4fwxmJm4+BWOgtPo/I7SiQhmlHYzRP7YZpa9zr1nUbYhCo8phU160E1cDeospVtrwMl2p27
	ULvMiiRgKyBUIl8Bq7iN9YcTr8jPcMV7hi8EAN/oAW+lhJWY+V3wDUTkJXMdmsh37k9TUqxnlj0
	4Bw4jQdv98mLbrEHeiynY8r8DIt8Sj3ANc3LoHf3umay1VwJi8sTRxF043qUInUi8LOEq6qc+TC
	2Gy5ZfaQ8VxEDs=
X-Received: by 2002:a05:7300:7a9e:b0:361:1dd6:531b with SMTP id 5a478bee46e88-361a2052bebmr8842130eec.26.1792383999414;
        Sun, 18 Oct 2026 21:26:39 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm27203851eec.29.2026.10.18.21.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 21:26:38 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 19 Oct 2026 01:26:27 -0300
Subject: [PATCH net-next] net: dsa: realtek: use <module>-y in Makefile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-realtek_mkf-v1-1-3246a77d5782@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPKb1WoC/yWM0QqCMBhGX0W+6wabglqvEiHqPu3PWrLNEMR3b
 +Xl4XDOhkAvDLhkGzw/EuTtEphThv7eupFKbGLkOi+NNmfl2T4jp+Y1DaqotS2rqqg7Y5GK2XO
 Q9X+7wjEqxzXidpiwdA/28TfDvn8BXZ3PrHkAAAA=
X-Change-ID: 20261019-realtek_mkf-380d67738b1d
To: Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
X-Mailer: b4 0.16.0

Switch from <module>-objs to <module>-y to eliminate ifdefs and simplify
conditional object list construction. Drop the obsolete trailing
comment.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/net/dsa/realtek/Makefile | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/realtek/Makefile b/drivers/net/dsa/realtek/Makefile
index 72bb42e80c95..0a94a619b2c1 100644
--- a/drivers/net/dsa/realtek/Makefile
+++ b/drivers/net/dsa/realtek/Makefile
@@ -1,23 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_NET_DSA_REALTEK)		+= realtek_dsa.o
-realtek_dsa-objs			:= rtl83xx.o
-
-ifdef CONFIG_NET_DSA_REALTEK_MDIO
-realtek_dsa-objs += realtek-mdio.o
-endif
-
-ifdef CONFIG_NET_DSA_REALTEK_SMI
-realtek_dsa-objs += realtek-smi.o
-endif
+realtek_dsa-y				:= rtl83xx.o
+realtek_dsa-$(CONFIG_NET_DSA_REALTEK_MDIO)	+= realtek-mdio.o
+realtek_dsa-$(CONFIG_NET_DSA_REALTEK_SMI)	+= realtek-smi.o
 
 obj-$(CONFIG_NET_DSA_REALTEK_RTL8366RB) += rtl8366.o
-rtl8366-objs 				:= rtl8366-core.o rtl8366rb.o
-ifdef CONFIG_NET_DSA_REALTEK_RTL8366RB_LEDS
-rtl8366-objs 				+= rtl8366rb-leds.o
-endif
+rtl8366-y				:= rtl8366-core.o rtl8366rb.o
+rtl8366-$(CONFIG_NET_DSA_REALTEK_RTL8366RB_LEDS) += rtl8366rb-leds.o
+
 obj-$(CONFIG_NET_DSA_REALTEK_RTL8365MB) += rtl8365mb.o
-rtl8365mb-objs := rtl8365mb_main.o \
-		  rtl8365mb_table.o \
-		  rtl8365mb_vlan.o \
-		  rtl8365mb_l2.o \
-# end of rtl8365mb-objs
+rtl8365mb-y				:= rtl8365mb_main.o \
+					   rtl8365mb_table.o \
+					   rtl8365mb_vlan.o \
+					   rtl8365mb_l2.o

---
base-commit: 98c2ad4f5d805dbc1ea436a334ee59311806a48c
change-id: 20261019-realtek_mkf-380d67738b1d

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>


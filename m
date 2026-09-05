Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228693BB117
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616914; cv=none; b=KJdZ9UhD6nYO5RByLdD0Ywqb19ZWS9SX9Dcd7kaNH9ForgvBuxOZSCXu3j3Wi8UwxVXZIaPy2DdLQs5hdbd1J6JxH8iN0vpxK893FV5MqDewTUyF8ka8nYWFuOfPJ7A+tW0AMIVFpiqU/+UgtkFgIE6tqYxoXab71XMwPzQdoNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616914; c=relaxed/simple;
	bh=EizzPFcHBTIh2Y7GKphJQqpoh7RMlGuXmOyHqJPayZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6jcp/gOtOjLy91N2gLlN1+WZRyBcj92zB6d2WoydZCUmEVVgPCyN7vgxam8TFJgrguUYQgYYjKO3/7ktlGEozatogOKddyNHUM117ZpoWw4w2dX1pi1zlJN/Nhq5aqESlvTGQVl80xwr9h3EDIDDjQ1JpRlpRyIID9iL86Ydfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAWHDYpH; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAWHDYpH"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-77bf3334d14so1466387137.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616889; x=1789221689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=ZAWHDYpHOMJ2pb1rznJGqWziVaas9dmvZpinpC8dpdVqj28oQXoc8EcWh4t0vpBJzr
         OfhyVTe5DH/gmR5zTbIvGvTij3vy5znr4MnvveqiDbMkf1FnVpTTGTs6pPzlKhmqp3sz
         3YkwoIj1bZPG4c5xVmHJvjO423C0j8ygBV7y8w96COK+Mrg6bjL66EJZ8f6zhaipTXCA
         shq6D7fnizDyjnuKBYcpdih1sLm8oHZjgJYRBxZorjypAjnKdQNVQabQdDtTPlev5008
         KLDjEmNRmj3wxviz0WV5c0/pYxoL+Vd+BAWA+ZhPGQWWDpR2WZGmObxm4RgatpKhkaDT
         jmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616889; x=1789221689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=iyYAi4es0+MABvhndAHqgg6Rt273HlMhXQeFfhoCs/HHxA09dVysvF9u2JhCfJTiFD
         7G3G+UYFrK2o6sZExG8ePqabOg62ii3ppUIpj1NQOY8nwOwQAeq71hZXPzd+tq2AU6JU
         lFyNXv3J8TcdbyOkrPXAE9fp4cdr4daxpTezXs9wVfw6zr3TZZAateoTGrz2SkLblzJ+
         ddR8zVLXea9vxQV3QJ94JTTSD741KNQCP5TglvFW1eXTEZiemTFMqETorQ59e5nbiDoA
         W22w8vRXdoWE2wphr2Ft/cNgLchD+7pHaIvsfhFF2KT7MYZAQJhUNKC6pZBOLu2GKiqo
         am4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwse9m42n0syNLuDS2z+Kreg8cuzDlW2gJJIMjppVDRFG2FqKP6hZYKDIqsd34QPSab8h/kKA7TO8xQtbo=@vger.kernel.org
X-Gm-Message-State: AFuF++mUQHzt5AkTkFt+teMpwszxYCVnMpmp5Wh8TSYnUNln7WEqisSQ
	vuiJ60Uhc9hxbBCycUYTSPEJRtCeAJJ3k++kgu/xcBq4LuiYWdXXrRfL
X-Gm-Gg: AYBFou1W2hc5ZRkNquHTHxRk1QNM5xg0U6rISAITAkA3vPapvTz6DrXdgY0IfFJx8ub
	2NAPXmUxsYiJjYWT2iEtx0C73DBymtVbyVEcXg70Roq0NrCk4ZdFeqUcQPb7rJVfRtMuAklhLh7
	T5Upt3a2oTZRlg9FQr1qK/ddXqYAy/qp8XnT8rTPP5kUjZvc7bYXET8yd6LlDwcCKbJK29P/kfl
	KcSEkNMDpRHM6/luRehsVGM9FhTQVxN1DqCcuxMTl4JZWYd9KZetmO43jSTOj21cgUjfkMNR+OL
	PUcXautZa+rVRYQs27yR2XpuqnU+Kr4+u10JesxvJPSdC+qRAK4JRQpvxFnBk9X7Vg90AtQ2Fyz
	er1Z/C+taHGJ56dNc5C5bn8mZ3YiomUgzotNKbwXdhUhUNoff9KAW4r2Qx+a7MKSCT8aVjU3zmh
	Zm7U2OuGc2Rh0yyOxPETez4gT/uiPp4hL0URIonJ96A8i29porKbEor/nJZLctUhAM8mIt20LEl
	H4oOPeJAQrta9T3EBbuTOpXJFe3hwhf
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a4a90fdd3mr5362480137.2.1788616888537;
        Sat, 05 Sep 2026 07:01:28 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 11:01:12 -0300
Message-ID: <20260905140113.21638-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..3a0db1be6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316) += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0


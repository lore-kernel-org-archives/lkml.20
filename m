Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E141E32B10F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577673; cv=none; b=Qfwyr5jBp42P9SzoJbcolzh/6+2fuhNQDDmCxtek2QLypMiZFFxXT0OzTMuigJUhI759Qu1hobExRYZ6HeXeNqsXdRz2VjYcdktd766U8MpFO55yu3iya4pUiPB5wvwk2rI2Uc0VidJTZCZz4hntwLMuVmohwJjTBU83agI+dhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577673; c=relaxed/simple;
	bh=KtT5m4r4TXXxrmuudh3sl5ESBo3/BpcnMRgfe6/V4OI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aeuf80RCMpxk2fBkPh/+gqUeFSJNGUqDvg96Jg4dhutkKnK/HcCH7zagYWlgyaJHmg4xQBlYAKjR9og9bId5JSBRnNaT5etqAsGrPIWPg33OhNKDN4AwDqvzYzOq8tBWUAFU63CIwxRu5jPO1xCLB5iBzrs17Q7NNCXdaAElwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIREVHVy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIREVHVy"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39266382df6so1397846a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577671; x=1789182471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Up8+c7t8FLhOpjtV9V7ggHhViPAp8JRhaSYfeghZNx4=;
        b=IIREVHVy1+K2iIZ9NG4FTgbsmDhoA5xeP2obycTbC4UX1AGCEpDwgMNQuf4cnmXJzf
         DFbFJaXe+5xMRFIt6SrzOh8X8YZzzc7niE6mC/lb2nFxl7Dr78vHVTtu+dwuAplsyb4B
         UUuaP9MoY8Lt/3stSJDFYPx6GdPs/vNxH6tGlCj3jkaYJlLhQBNxR9nm+YoUd9d+w5Tq
         fuZtqgwRhHOTHTdWdwiFItaHu2EleH4RZPArtkcEXW/bRLMx2DrQ8DRtjWlmFmYJVnQg
         p8ITUP6uMJk9AVJPnqGmWw/yiuks0/ISAspTjA4qWsUZIKXYPSqKolvb8zmPhs1Y2a/m
         RaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577671; x=1789182471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up8+c7t8FLhOpjtV9V7ggHhViPAp8JRhaSYfeghZNx4=;
        b=VcEdcUdPYk5DfNejpwNo+o8osE1xdNOUiOSJ2Jt/ddNB3f2Y30XfnsC5RUEmWqkiib
         NryfOfVvxpw18qKMwuoYxy1/lu36AchcLMEMgXAKlBBNH1Z1ykSgTxHxlp7Ok5BzEV45
         v5NopwathdVmCA/LJEAMO93ok5to1cmLOiLSen8ts/nSFOI8gYkXqPkrcsBUVnzquApy
         thMBtdwYuUnF0mNj74dh8PGHhjaOZ48ZRDQvHneMnqLPHdylzG9owbEAEnJTDMCOG4NT
         C7tAumLsPvnpw74FEBboOxOh1WmbOZPN8GNRibKfYKndED0FHZtobDMXpXau2hWVMOSN
         4atw==
X-Forwarded-Encrypted: i=1; AKwUvBwMgaMVl+EsmiVEwUWVMxRMq35aXZAa92mkbf6iCOy++DKiA57LmqQXbjhwzZ3yF34kVlM4dxsXjgOcGPs=@vger.kernel.org
X-Gm-Message-State: AFuF++kdxY7lIACgCF9RhHw/mC6GIu3JRIkGbQr4jvcllJzXqwr2/mie
	UkgWqLbSUQCFw1T5Q/q/kO5Qu0pY5CCpI0ATD1YlvfzRuUlpc0stwehD
X-Gm-Gg: AYBFou3CnIwrZ4w6A1tmS/DUEsdi0VdpjmidpU8JdaZzFwV3t5Nfe/xTPzrjz1jHbOj
	2dH4fViRl1pP/8cpfnxY/5pBk9TjwzamkKp+/mL3dzUlIvxo+zAVcMRc8Ld2OkQL0iHu9+0ofmm
	nd274+kJcrklZifl0avxxphP/bGpqxhiAw962YNtjgVW3yk3tv1koRNBFkcToJs/+R0HZKps1e8
	VWx/0dAq+fdvFGad7B+6yG/IVgQhBY5AmdUBZU6DgHgaVvfUbicmb52eQ93OhUtkHUx616eIkuH
	Te+MIVYbrtFDqOXWJ9Xk3i+ZaT1fqolrDsefQagSYx+3atcBQWuecr/uKDqNYRJx/e0E7ilC7tA
	gP8U+vndCoK4es88fhYfY8o4QpojuN1SvNMd2x1cXnQjTQgVg2BFVMfgvdGT9Xd4DGK8CbaZC5E
	urNjgyGc5L0DjnbxyeldYf2DkgQ9577lOpWMYk+59wDKBmoHcOoGSw5x2Ujski4LIUWNRZZ1CG+
	pw9BYoZySWpXPaMuGQmT1a/1g==
X-Received: by 2002:a17:90b:2b8c:b0:398:9be6:f995 with SMTP id 98e67ed59e1d1-39b262aaf48mr17356406a91.20.1788577671347;
        Fri, 04 Sep 2026 20:07:51 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm10344142eec.13.2026.09.04.20.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:07:50 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH 1/3] media: ov02c10: Drop duplicate register write
Date: Sat,  5 Sep 2026 00:07:30 -0300
Message-ID: <20260905030732.39196-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cf93d3603..6220461fd 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.55.0


Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A63D45DE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210485; cv=none; b=GRxc9/CEaRtJrg7XqtowKqHHSYatyTB0iIBGXND9Dbv7t0dvj30FGJWn8C/mfEqT9IvTO05B0fbVSwxoQYcVD++/UjyLFv+M4QaOcH/Ntf2y+beA05/O0DinLtVhgd+Yrt9eIeey8ndcqJQy+1CLU/qBEaQEKjzBCYencsp/8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210485; c=relaxed/simple;
	bh=giq9R9eqXmt3OIYtNymBZh0IZK3MauoJ2kjbep0I9gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9rtpgAxN6AWKxhLe6SjlAmAyU1z/2V9wsp85XsTfbaV9nnK7sECV7gQ1dhuvmitWBZxIemOBI5ALJDrCXxTpw7yj8nmyjD+67hh9KBXNsRn3Ze6mpZ1fWfXma+a31iwiiv2rZAZHIbpZIHbBebb9Hucl04cX/s50/J6MA/r1Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=G2PhdGUc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="G2PhdGUc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso2412785ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792210482; x=1792815282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4P0SuxHGLACHNAbcWpcrEkq+SWEhLrJUpTGxCsDDCE=;
        b=G2PhdGUciInIpQAIZwk9Sfn7hO7UuFPKU+LpujJRqm97zO/I6aGqWb1vOeJiCZAzcc
         84DnfCG9kmNVbuOa5M2G8sX9U2aJelG2td/e6G6SwC5B7Raygiv/XKToN4XBhqvYkGvv
         42cazovtA/fSvYIadRoHJ+Acxu6wtJb9duumg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210482; x=1792815282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4P0SuxHGLACHNAbcWpcrEkq+SWEhLrJUpTGxCsDDCE=;
        b=Ey1HiUQqa6I8AYrzchR+QayrTM1BWIOmXC824fyVlt9ZFaJ2ZIrSspQr+Juuls/G2u
         ZEPCPGNOC9lWYQpdrF5pEeFNeQx3fFLsOpIcWyGpueErmEjGdA16SGkvZqvjJ3UhWCQ5
         EOFsJuLT1LmZu6LjH6soahNWc4MnK5VJr1Xl+uRJsQXLdrrel7WRQxH05FmVuPu1GrvS
         1CXctlVklDvjmjkmnKr70a4pwU2fBr69YDHhGY6qO3QJTmWMDM9iIQrq6Kq5iJhU0QX/
         Pv7axsqTB1uozgIYyXNei08u5DDKq4LA/nCrHrlVgT5efyoL/k1gv2lTmZh+IRZCxDyl
         Tahw==
X-Forwarded-Encrypted: i=1; AKwUvBwnKL2kgef3L8Z3DafzttDVnDNND0Ud4I9NssSDc41D2HsgBn43qHRdPMyPFT+hv+MpTSxgDBs55i42jw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK50B52hJLu75LE52ZHmP+tTeGtsFKlQcxqdAZh56+Kstkc1AIi
	pO2HO/mUMVP/zxCnWAndfXQCNXgyGAewd5u+rwyWkfrbTOQO6SpRrl3P2Ns5jtdZsB4=
X-Gm-Gg: AYBFou2LVOFf9fRRtW4kIZTIggtBs/BrqaXVk0CHBN2qjfIaAw//ky6v0b77oUAIcsL
	D7ovT8F6gF7CISjtb+u1tbIHZXgvGpkf9lQuvHa9qKOEXh7fI/n5WgJQZvq5XTI+ZRSJK0sd4Ji
	gsJLQM0ltRbCL7qTk8I1bDjTMp/odINQ8nILzSznZIFE5xW1gP0LnGz8ZI4skZBP50b8Aas/eOi
	TXXJ8ttGM8bx+UbV1x8UdNOaQwXEoWJzpxOAfZmSgFHegR4gvo1c5pgOYMlAac9QfojMiNgxszt
	WzYnQQi/15upk3TfSRosYCnqsaU76GcKPuyNgAJLpv0V/fKj88aUPovi8MzHHOMDR97pL1k/RN6
	85Qz7dLgp1suPtbmrxYV2mJJSVRdaQl3ZoXiRX43+1kDFq/nvym0h/Ru++nNK687kkiAULOeUKh
	AlJdd+Ok15CdYZZlhVVIjSkTszteCLFVsK4LuQA6N7QBguYrejk3QShyQXqPAP51EPYqyaK/qOZ
	qgrm6tRDLlzj4qCFZGIo/oit5FiNgbNLt8tS3/R3wzECt+5SjY=
X-Received: by 2002:a17:90b:4ccc:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3acee2937ffmr1451115a91.4.1792210482363;
        Fri, 16 Oct 2026 21:14:42 -0700 (PDT)
Received: from shiro (p1722188-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.166.142.188])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ac945e72c6sm11609714a91.5.2026.10.16.21.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:14:41 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linux-sh@vger.kernel.org,
	linux-ide@vger.kernel.org
Cc: geert@linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/2] sh: landisk_defconfig: enable PATA_ARTOP for the ATP865
Date: Sat, 17 Oct 2026 13:14:19 +0900
Message-ID: <20261017041419.311921-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017041419.311921-1-daniel@0x0f.com>
References: <20261017041419.311921-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The landisk defconfig currently has a similar but incorrect IDE
driver selected so IDE doesn't work out of the box.

Select the right one.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/sh/configs/landisk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/configs/landisk_defconfig b/arch/sh/configs/landisk_defconfig
index 2b7e10c9acee..6b5ec1f3ad71 100644
--- a/arch/sh/configs/landisk_defconfig
+++ b/arch/sh/configs/landisk_defconfig
@@ -28,7 +28,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_ATA=y
 CONFIG_ATA_GENERIC=y
-CONFIG_PATA_ATP867X=y
+CONFIG_PATA_ARTOP=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
-- 
2.55.0


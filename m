Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BC3E024B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885435; cv=none; b=PJXDeB0+u1FEvs2fQmo+qSU3pbGezE1WzkYoz8MXcc6nw/9YpAekyvd3FMD+Ch1SmC1da3dUl3g7Tp4X3lE9hdGw8bGc0iLK5lOn/9tssy/hVqvV1RWuaAgrx49NHCxQM0O2sCxqxZn/plHzuIa4lhP3Ghcj2+8gVSddw5NsVb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885435; c=relaxed/simple;
	bh=3abKAhIkx78dcddudfnNcTjPTC2m93Ecx/g3mCrvIXA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Es/+dgyjnyC6O1AP+/0Abbx2HLBj5VTr8a4QKsZG7lkP/ifA+oKQS8iETnBbO2V+iznZnYmwWVK7uGdmTccjGmmb2v8RCij538Vu5Vr/VQYGqaOjmeDiNdN/UqMrL8Tf5VbmAEbD7ob4fF17MEvhLVcK+HXei6blCo/ImAjASLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZj7fXTe; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZj7fXTe"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e60f9af6e6so22910005ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885433; x=1792490233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PxcGxjYizPXeuPKAi/3W+fOgW1EHAMoCbtXdC0dqqY=;
        b=NZj7fXTemd3FwIdCzbH1u/+9FZlh25O6xVetzf/4AyjbPX7IlmyMirqlvrYsITTaBm
         upLkG6jmM9zMQPHw9BIq/hr0ZPwesvXcS5FVzeeWmYx1pdHHpTRTmlQzuJG9gBE13seG
         fZluWV38mVPOxtKHDd4mwYgYK+PQCaaSIp6NAfKkqZ/SUcOPE/42ht3T4Z2J7x42xWqc
         jVCFGVqu7EbkC2UGS6XFgLuPEuxOTvRw6YV1GIfTVzvzsWOVrWA4S63+GydnwOlEjTPY
         P6UCvXTMQ8IqU5Vdf40r7WAntDo8PhnCPgGerUXxe+wEtyQ+wlLc/8ZNxePkL55g2N/z
         qizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885433; x=1792490233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PxcGxjYizPXeuPKAi/3W+fOgW1EHAMoCbtXdC0dqqY=;
        b=ygZBN1/1uLO5x/GvyyO1SvEqcm95VO5saHEosgjSuzTzPMjsRYeIGO2lgVJCNyCm50
         FAwI/j1EaeRkyP+jwwqJi2671t0GHS9Zz2DyHG5OznwNqFs2JshB6dCqi9M/9/sAwM8K
         aQKVqdPoX9g8socpNeCvUnU9tZG4CeWJNwwd3e9iutbFQ44Ftl5JK2doRMB8mh93eC8V
         SEPTGy6bsp5o2XHVJ1yD65TZqDVnbhr4O7gnyyOn6M137rzExG+BisMS0VQgjCVBlOPX
         UAMQsV5pkUmo2APxgDTBd92HfDsKiHYnlu3l3CetMdktlU1OgguCbvb0rhFgO3VeSiwc
         b8gA==
X-Forwarded-Encrypted: i=1; AKwUvBzv5JkqGNMxNSDxP4+BRYSPo2/lfte66V4OvGJmDCUGiyl2zvwq3Wq7fggdft90+YYqHOOoNJMzJdx0cZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoCGlMVmIouyHfMPKhQJj4nX5B7u50j88MvINxiGX51fXCCul6
	11/rccIFfxoUaNjlQBd/sUvsbquxhNqjAmAGOTRRQDI4tYrsvLzLvCo=
X-Gm-Gg: AYBFou0oDrHUwAdQZRXUprR7uz25fNpwL4h1/Ftczrpj25vPXYVzWunmjrCNL7pbZ6y
	kr0CVfEio5WxwvzHhPH6/j4jaE437IUgNt90rLv50f9RTrHrqo+P249qrTbuJzUpf+klxxbrYL/
	yhRFsIXAZVBAknaOPKx8xA3ywc0udGPAJDnLTBbH/D9TQqpR0JHyzqkVSf56BtH9GGY0M4aWBaB
	wO/ihLchv+YfUuSTUZQZKts18O476X2PDTvX+xda5xJcdcUApCaN+GwgksjunAB57MySos+UoV2
	+AcSpTnMquF4fY66hDjm4w93sdpzI6PmJyXv/6QJwZaZ5oskffk5lG20cfPccd/f+J/yx0fcgRf
	Mn30nW+hBcjqElTPkzFPaufpaDk3p2eEIc3wKVg/2l324c48srZxox4xJzI+cYGW/gQRT6BO2bI
	HAll4+Eq2Za2ukhmt5UAI1A5dK30C4QVBgkNPLkNYjDDNOxDQRzTAeOcKlYW7vuEziT51NZfRr9
	EbuAKJWMw==
X-Received: by 2002:a17:902:e551:b0:2df:8430:a580 with SMTP id d9443c01a7336-2e876ca7075mr85664185ad.45.1791885433158;
        Tue, 13 Oct 2026 02:57:13 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e6aasm51797055ad.18.2026.10.13.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:57:12 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Adriano Cordova <adrianox@gmail.com>,
	Azamat Rakhim <azamatrakhim8@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused defines in odm.h
Date: Tue, 13 Oct 2026 17:57:07 +0800
Message-Id: <20261013095707.387341-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hal/odm.h still defines several constants that no code in the driver
ever references:

  BAND_NUM, AFH_PSD, Adaptive_SIR
  ANTTESTALL, ANTTESTA, ANTTESTB
  AUX_ANT

They come from the PSD and antenna-diversity sections of the vendor ODM
code and were never wired up for the RTL8723BS.  The "/* ANT Test */"
comment is removed together with the defines it introduced.

No functional change intended.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 3532f0d79363..8a357658fdb5 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -29,12 +29,10 @@
 #define TXSCALE_TABLE_SIZE		37
 #define TXPWR_TRACK_TABLE_SIZE	30
 #define DELTA_SWINGIDX_SIZE     30
-#define BAND_NUM				4
 
 /* 3 PSD Handler */
 /* 3 ============================================================ */
 
-#define	AFH_PSD		1	/* 0:normal PSD scan, 1: only do 20 pts PSD */
 #define	MODE_40M		0	/* 0:20M, 1:40M */
 #define	PSD_TH2		3
 #define	PSD_CHMIN		20   /*  Minimum channel number for BT AFH */
@@ -46,7 +44,6 @@
 #define   Smooth_Size_3		20
 #define	Smooth_TH_3	4
 #define   Smooth_Step_Size 5
-#define	Adaptive_SIR	1
 #define	PSD_RESCAN		4
 #define	PSD_SCAN_INTERVAL	700 /* ms */
 
@@ -56,16 +53,10 @@
 #define		DM_DIG_HIGH_PWR_THRESHOLD	0x3a
 #define		DM_DIG_LOW_PWR_THRESHOLD	0x14
 
-/* ANT Test */
-#define			ANTTESTALL		0x00		/* Ant A or B will be Testing */
-#define		ANTTESTA		0x01		/* Ant A will be Testing */
-#define		ANTTESTB		0x02		/* Ant B will be testing */
-
 #define	PS_MODE_ACTIVE 0x01
 
 /* for 8723A Ant Definition--2012--06--07 due to different IC may be different ANT define */
 #define		MAIN_ANT		1		/* Ant A or Ant Main */
-#define		AUX_ANT		2		/* AntB or Ant Aux */
 #define		MAX_ANT		3		/*  3 for AP using */
 
 /* Antenna Diversity Type */
-- 
2.25.1


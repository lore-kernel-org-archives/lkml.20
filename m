Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2C516179
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908192; cv=none; b=CCBP6jKvey9nrAciSqGlH7ETefaw8tsv1sDReR9tlICBwtyVkoQ666V4/PmrzgoXhaEmItRLxLYNuPyny3j8QdIn0yx/BKyGi67CmVtw85Xzi4RBhuN+JPgnhSOZ8CKh01TLyklV4qeSzD60O/HuLOzTtvAZuXGgFxVfvuUuu68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908192; c=relaxed/simple;
	bh=FM29EhJVqrYLAqj2i7juSb1dg63c9N3PNf0p5C6RR1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chX2J2P3smvosHiEEOM1fQUZQrL4Fdd8N47YkVC8m+cS8OdRflBz4jxOmj7suu9ohYZ8//Jy9sAdm9QiMR7zxn3IAtjlP6LTaZWc8MBEgmWPbKKYlwrtZfDpS/LETkm5M10oby6MUQTiXkCM4eJUvcIJGMlibwjfHSxkgd/35Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=FQcp3SLr; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="FQcp3SLr"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab33730821so1834608a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791908189; x=1792512989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgL+W3U7o5OU8BRm9L4xOZKWqaV/qLRw6ZW40Aj7xuM=;
        b=FQcp3SLrSY5NEqzb3tgngcXIBi00SIlpeXyjWSj7kXUSSeHj5izzS0Uzjhvgp6zdq1
         9O22olE6fuC9LHX+9Ka/jimBlxlbeu47WnXOThqbWqs8hdgsCKvH0geRj2nxiAWWPohq
         WnUHJaWykLKO5ICAOJihW9KmYnbS7cO5s7Hkst5wSFXUjnorb3E4p6FHS5DDo8boz/wO
         LZRFRyjXL1deWzGpGlLExLevVVzMIBT/vaJ7QwbQmo6JcnRw/WpRy9nklADyspVLWnIP
         PiyySg4iDErDjTh5SFZws7OoCD8Hq+x1XSnHAIrWFj2l71tRXCfFsnlvZtwBvI22wI9Q
         iA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908189; x=1792512989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgL+W3U7o5OU8BRm9L4xOZKWqaV/qLRw6ZW40Aj7xuM=;
        b=s3zKSBkLW4R5rWjOU7IP+/YN6UbtqTzsfDrwFMeLYwKHGlSMDFn+KSciidb61Aaygf
         OmLmyc44S0R4c6F1gUGOoo8UXb30R6Lx2A3v7d7x6HYtxDMnUmNDw6n8u7a4Sv50V1xJ
         DlCmOSfT83/TrN7yj3D+X1PXeW9wNphPC3cMhg7jVoaLG0qe4CAEbG3A29/7K8pFNDTd
         lfnuroGf4myMRNuW6c2mshT/x88udOipu6neZTV4hSkFUh+ngNasckR3GUWNuxDrARXv
         VFda2IGBYe06aaQ1qWuaVmJhJQ6xLbpLW3oTSSHp98Lmg6UnwBEVxyxa7AKYzFoQndjp
         gRpA==
X-Forwarded-Encrypted: i=1; AKwUvBwTfaznoiy7LrLDbMWhmhZs+O3voPfjG9luZAfRtO725vtURr5TdrrpTzRnzGTGZKpH3hnKRclRftRNcZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrEKU/3SanhiYE//zJZh66VWNnB1sahYtMW4Oa0KaDOM2WLnLC
	EhF8W4q3NVLRVzmWyU6ccEz6geCGfGjj43Lc40IVHNcSybLsKgJnYHRuOqYq1euqPpxxU3kVdeP
	fAnOpprL1jQ==
X-Gm-Gg: AYBFou2Nr8b3uxXApXb/QrZmtzqPQ3dZ1zIBeqyqMOb4rrQQTxf5gADs8GKISf7BSx7
	piRrtNXPD/xulR7GgmzNN6jRE/Z0WE0V36icIuqSHXVWmj0ROER6n3jq0lj8GE7uYQBAvyPXsv6
	jJ/fLZzP4BUIKLPCcofzBJCx1BUEcXjU9pVfIRRa4I+b0RcC3mvSe8HJOotEu3jS4x/Vt35DDzP
	cqCdKOcBp/oNPPjIZvsGUHEwg2CWurHGoD4pMKdE7RW7NNDmNkcel7kUPYv1E2s+XCoPxrs76hI
	vDcHHHeGzbMQqb1OYejBELJtAOHOvRJFNrNyJOqIkc3CTTYCEuEGGKi8EIiYongwfre3NvOGWFj
	dO+L+7m/oQp8Y+jNPSE7VrqpN7rccO2Ot2rm/XpkyKdI3wEfwtckouP6Zmwi2WzaWpIhgdu3jiG
	grwjMvOoSbD65HT2M7umrsrHh7upngrTeKxfPUHEWApcduqOEOLw41F1SfsZMN1IKFL9kjbnvwH
	sWMSHVzT1xjvuhNXSH3
X-Received: by 2002:a17:90b:1d03:b0:3a0:9640:8028 with SMTP id 98e67ed59e1d1-3ab3a8db035mr10114932a91.59.1791908188836;
        Tue, 13 Oct 2026 09:16:28 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600642c5sm202607a91.5.2026.10.13.09.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:16:28 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 0/2] scsi: mvumi: bound two firmware-supplied lengths
Date: Wed, 14 Oct 2026 01:16:18 +0900
Message-ID: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two places in mvumi trust length/count fields the Marvell UMI firmware
supplies and never check them against the buffers they index.  An event
with the maximum param_count/sense_data_length makes mvumi_show_event()
read past the 512-byte event buffer and into the log; a handshake page
with frame_length >= 256 makes the checksum loop, which uses an unsigned
char counter, spin forever during probe (shorter over-long values read
past the page).  Both date to the driver's introduction.

Yehyeong Lee (2):
  scsi: mvumi: bound the per-event parameter and sense dumps
  scsi: mvumi: reject an out-of-range handshake frame length

 drivers/scsi/mvumi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0


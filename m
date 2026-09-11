Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B9442B3E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154320; cv=none; b=EmK6NydHLDoKcLOwMWvXKRy04YjE4dy+822CgDjypSYaOG6f/jSIQ/e2Vj5Bs9e4viCRgcKJMeKM2zo52gcv59KMB//nIq5Rf+S8FFJwy0cleDrRptbXprGp/GpSeTkZeqFKbAwhfPJjPZnMMHaCNy0nRSuj1cUohhFCJAhBlcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154320; c=relaxed/simple;
	bh=1Q/rIhx0THYuTBbYEtvYk7MPD7tjZ93oQIYtC0rtD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YiT960Nz289/mjSg8j0CIfoGA5eYAKBcTmV98hV2JXT0Tz05IU6v63ZMisiuO2mxSxLnDdfeoT21qqZBhwdg17ZoeMgopCyXCR6wyZYY9537KiB49QUxuDfh3PMdOPBIAC9uO0UI4Il/YPgrp2r3SvfRXp11qDDQl0WxUP5oNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTTDC67C; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTTDC67C"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so3354915ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154306; x=1789759106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8Ujftbx6uO4EEfstLR80Anc3hrjvDuwmMLGDrkFX0=;
        b=KTTDC67CZHsWK2lzjk3WaSQ7D9irSlJLBELyKvjzXEO4qn0xX2kpAILXmJQN3PQilH
         5gj/jcd/yQwOgHCdgNnXpCj8qvqVbPuqVb7ju+Zg7vKCmyShp+8bFcEe3d6j3Q8pMnhB
         KPfWdFx7AJGZnlGVrn+7YJmxg8RZdgo/zSHwCVFg94JMbMP+q3F/ImnGxyjmMIcqLKqM
         JkOabx34kBuB00aeqLOICfC+t5z3c83r9RKnSuuyQIkazrRmKWD+4MdW/l3/TvXEZQq4
         1Eof9o3613CqzTLKZ+nIVJJBseiWo/q1KglWtYjTmo0irvfjs0RwvChtxD5j7DPvBUBd
         MJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154306; x=1789759106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz8Ujftbx6uO4EEfstLR80Anc3hrjvDuwmMLGDrkFX0=;
        b=hd8Skv1AXwP6IHgcjVw0wmbGt/ahlyCum1mZmg7anEFnj/Rt/smS0t1FTSvMsYkZA3
         G1nv9KxsWAYql00AayfMWWydWi69PhJWeyw+Vo0vmj5geKXg013U+dUXchL2QoDrvYNc
         Z33XPV8+D7/2w2vXorjmZpymjE3CfwBy24JhJkdJadJ1zGdn0tFsat2yFwtv3iS7/KTe
         gbCyf9QcJi+GOs7m8pEpRm+E0vseccBWTefCWH0gNn5O693Y/R9dMoEO6FA0NIniSUJJ
         yVpe+fexGtZCpwUcKoi2M7h8c0NQdF9FL8KQQkHjESDwsraqoyKmtmxEyBtCLMDMfi+H
         iemA==
X-Forwarded-Encrypted: i=1; AKwUvBz3/DfkXNDUQcqt3pOsTQFkgzjjCPQLiV0408SX+VleX2UkIv7whiIhVF7ldbq7AH76HUv4V9riPgAqhD4=@vger.kernel.org
X-Gm-Message-State: AFuF++nzPJsc5aTPSZCLCJ9rkLxqL33dqsgEQyTK9wFmxr1JXffKYabr
	BNnqDzYV3iRtYADTLmrMPaSDKHszkV5s6CWXmyp0ogWD7iok4Bbth2Gy
X-Gm-Gg: AYBFou2IhPaFaHRZUr9/KdWdN2kKySQZi/st8J79SIVuznSt1h0YsemXY7bFQIrofHp
	7xdJxKB9bxhwVF1dCvNZikPOyK/Yr9SmcH2M7M3Y+aF+Fi0Kc95o5hwjws8e3/pjDQ/HLTIs1zm
	J50nTbcVgf2MjeuK5nby3CNvzvdD1nKuc70v9PRpLbTWMnuuJlWkrpTS3sVMS561xwz84Ylnwjs
	SfSLMd93xnlK9OwKtz3uuT2ZCkcQW7DPD3TjZf1qWxvd8hGwhp7WlqlD1N0UnCN1KdAinlGXc8a
	dcyiOaa8FsUx6owqj6m+acQaJJqBW0wWDJyBK0KqIyKWb8XT1zP4ikNCJshFcwLIcIk8XB0WwPH
	jeyyUhZ2nNYnUrrZUhh6z83dbc/vsk/DrulAowlktFZGnigFAACFONjCXC3C7H+J/j0J6HVi3Db
	ej9sGDxY7Vb6RW4yN7rkFRfUtLShWLAWhOWojK6Uw5aNGCGw/xvf6WPNuo0ceIi4dLMFBl0/1cj
	0LWcABJCdByXq0mbePbu6pkWHvGEtuRnLVd9vi3uL2253B8Hjqf1xQFEPPSvBVZP++j4WgLOLJn
	32WnK0VrIPlmFBbWhR43gEA1MnRfuPS6hRiZ7Ehg16CSNMVzCmkxtRYcoKA=
X-Received: by 2002:a17:903:198e:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2dd2a1ea2d9mr111775205ad.6.1789154305684;
        Fri, 11 Sep 2026 12:18:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcf48dsm16472115ad.57.2026.09.11.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:18:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Fri, 11 Sep 2026 12:18:23 -0700
Message-ID: <20260911191823.80631-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set MAC for gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 MAC instead.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..708599f8c4be 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


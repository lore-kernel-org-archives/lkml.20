Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7A4FB9C5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575101; cv=none; b=qKtz6GSAoBP0h6N40oZh3jl2UV/4g+1ilrpCg+DCDL4XxEVOgJSLsCWcATvckqMLumU6EUJ+jk/VO+KUoCe01TWcyNI4U6SgpQJXUq0lEBMkG2dNAn2n5cSiR3AIS3jkqSC1QLt1BRETl0NZ+uqRAZgwZCJLlXtLV18Gn2yT7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575101; c=relaxed/simple;
	bh=L3vc6anihw9NuQdcLcZ4gFYI/0/LOL9Q755uzReuYQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cDmxJ0XaGd2JZFDuMaNNZkL94DnlOMT3Yrwq4ouZTa0PNeEor9ooom7AIgkH4k5/fctGzATfSNtMo3IJ+cfzcDnMrdy1THL7audP567gehAJpCXVHVDoiFwAXUP+qvKJJizZf0W6AmOEOjEmSrKxsg+nca4KVRiYkLbYNqLbnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd2T0oDK; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd2T0oDK"
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-9367f27ddcbso3871485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575087; x=1792179887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n5sVI1GUHdT0XZZxczYNHjQkkrtpSuPJARpcgHnshWU=;
        b=gd2T0oDKeX7OtKr+ppX3C9jOOA7V7S/djhYo4Xg4ODK1qDdTRTWub1UJlvZicbA7H9
         +CrpNnkHnohBSTpv8zcvSLu+OS7zPsVn3ziaGw2g5ITK3gLfVxTqcxMTMuTdnCXmgaSX
         z9F12Z13hCNvlVDviczutAPJP/MUluWeN1ai/ZE1CAYIBC5J58hs3oumMn+d0L8/W82S
         bm4bC/Y0XOQX5Pwl0IzLb+6Ov14IW1iUeOOFCnMi8/6n13ccycPGZUeoCWb37wzKXVtS
         qonUE0E9XHmBTVyKn3mBCNHTSytHbFIuOX7CkBcVzflIXZRPtsenzuZQ+pWCcdEuyF2P
         flSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575087; x=1792179887;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n5sVI1GUHdT0XZZxczYNHjQkkrtpSuPJARpcgHnshWU=;
        b=AgalDSj3+T+ec0zijcvtvMggvX9W7iQ9wmFbdjn9dE0x7qazS4qDbN7WhKT8Jk4Lw1
         ty8Ys7Hnyf5lD9UFLJd+eydz6jF2CN3VVM8+A0kTBxoBbaz+kKhiXB9wjJjAsQ+7y345
         a1dzSy+A73mobGMW7gP8czLUJ2TS46sRA5o4MrpQ5ubjjy097A3ZRr6Qeyu4o1E6Ih9y
         67Tb/gDv6xWWfgymLWkA+7eBVZ9RPNeGCE+N5iRe8cKHW+Va5gSRLmGrt/8zIS3EORvA
         5ko+xXA+nSMqOL2ydJaZ1OGs1Ly54IWbtGsPA2mJF2ej/uehOhcze5x+nuZ0N7irtq7n
         TUGQ==
X-Forwarded-Encrypted: i=1; AKwUvByCNjczGOP7HL8Go7oGzh/t/oXOBhvaGOINckVOmeE7pGYruOW2OQWkHzckDEDL+N3I9K4NeXxqJxoQ7YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lS/shQszA/LGvH81P7PlUEGovKXUwu1uKH1VyvXQBQ/U+QqyzK
	ssQ56OhRecYtgpF8UzyGJu3HDWGOUH81BleUcL1vk9q555/OruyhSVFO
X-Gm-Gg: AYBFou3MHt56FW0IdYNah4Qm/UDmkeWLf6x+LPUCam8yRDTQdaETWm/E+acy+UTQ31U
	qi2hiK11CTXQjwns4dlzgHpjXYZ3t4+rMpBLkKYt6UinRpQTAxWfSw9PUhGwXhK91qwrobAu0iB
	FtJXVOQLzuMnpLnDkh/D5I3SThh0sLyGv1C3d2+hUIYqN5o1YC54147BQWsuZi8lnHo2hnGxTZd
	z/820rGlrF6TEx6uANWYX07B92pPT/gKSDVroQ85pStgj9PjwHMhv3b/IKG8g3CqN6VZMo5HWJ3
	bKPMff4b677ELa/51VQKLsNghFBGnEWuqLr5nL0lGpPniYc4W4Eszgh11AlADGpZpov/ZzCv+Nw
	a7KOLdmPTXr9PLbD0Lpk/gWYGFbECKSqs3zd4UoOPiBbj7sok2Vlr3vrW1VnWagbMJpH64NqVWU
	y7n+fZWrIEjdLVwFZbcMe1MPNS2cIZPGTxvd+Vyg1uVKrpt7RnoEOcmFm/9DFW2Y9uCN+GOMIK4
	Xof+nt84IQ5qLmrZhwzMkyqGoGVvvaB1cTlTQqaXSu4unGT+rVcJgGlDyFbAzhM6Q==
X-Received: by 2002:a05:620a:3186:b0:939:b057:daf2 with SMTP id af79cd13be357-93ebd26c06amr503914585a.45.1791575087187;
        Fri, 09 Oct 2026 12:44:47 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:46 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/2] cpufreq: mediatek: Suspend at the opp-suspend OPP,
 and mark one on MT8173
Date: Fri, 09 Oct 2026 14:44:42 -0500
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNQQ6CMBBFr2K6dsy0MUBdeQ/DAugAE22pLSUq4
 e5WbuDy/Z//3yoiBaYoLodVBFo48uQyqONBdGPjBgI2mYVCVaBWGkIbEkFM9IHk4xyosewGsPM
 dOp/6QM9cRk/OwOQ9VNJIZQosStmKfOoD9fzahbc688hxnsJ79y/yl+4qifi3apGAoPOyL3V7x
 gqvg234ceomK+pt275iZ9WU7AAAAA==
X-Change-ID: 20260929-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-81d12d60671b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=2772;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=L3vc6anihw9NuQdcLcZ4gFYI/0/LOL9Q755uzReuYQk=;
 b=hRi+Wn9i8/fos9oTP6rkL2wurMq9Zk3718GB4hzvsxAUVc5U5D9CmncK/Q5GUIoL8THYrgpiG
 pGp5tGoInymCtt/2+7TOUdLSu6ggVJojj74K4eEy/FIuaTSyF+cQksX
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mediatek-cpufreq has no .suspend callback, so each cluster enters system
sleep at whatever OPP the governor last chose. On the Amazon Fire HD 10
(2017), an MT8173 tablet that is not upstream yet, entering
suspend-to-RAM with both clusters at their highest OPP (2106 and
1703 MHz) measured 63.5 and 63.6 mA, against 52.0 and 52.0 mA with this
series. Those are 15-minute windows of the PMIC's coulomb counter,
alternating with and without the change; one count is about 2.9 mA.
Earlier, on the board's previous firmware path, s2idle drew 210-232 mA
against 158 mA.

Patch 1 takes the suspend frequency from the OPP table's opp-suspend
entry, as cpufreq-dt does, rather than always using the lowest OPP. That
keeps it opt-in per SoC: this driver also runs mt2701, mt7622, mt8183,
mt8186 and others I cannot test, and no MediaTek table has opp-suspend
today, so they are unchanged. Patch 2 marks the lowest OPP of both MT8173
clusters.

Patch 2 also reaches elm, hana and the EVB, which I cannot test either.
What they get is a switch to 507 MHz in cpufreq_suspend(), which runs
before any device is suspended, so the regulators it needs should still
be up. cpufreq_suspend() also runs from device_shutdown(), so reboot and
power-off switch first as well; on the tablet, reboot -f still resets in
1.4 s.

Patch 2 does nothing without patch 1 and is harmless on its own, so the
two can go through the cpufreq and MediaTek trees independently.

To: Rafael J. Wysocki <rafael@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- Add the Signed-off-by missing from v1. No other change.
- Link to v1: https://patch.msgid.link/20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com

---
Ryan Brue (2):
      cpufreq: mediatek: Enter system sleep at the suspend OPP
      arm64: dts: mediatek: mt8173: Mark the lowest CPU OPPs for suspend

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 drivers/cpufreq/mediatek-cpufreq.c       | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20260929-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-81d12d60671b

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


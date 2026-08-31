Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83401406261
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219371; cv=none; b=sX/r4IjJtRf/olwawjqhoX/3lk1NQvtQRQf3hU2gFuVfsJwSBciPsIQPF+S34q4sNeFWqvJS11z6vk6fjNHd2biSGVjJDGgTGRQsrxNv0evCSBlo8Yvm3koJioLuXi0BfwyoEcChk/6v4RyAZPPs681nXBXsvz/V/8p5cKxGQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219371; c=relaxed/simple;
	bh=G9OBNeNLKj+d4+MpvACIFUsr3cu8iGhmiCN/G4h/vVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YI1B7FmZoJC2AIwxDR+uLLQ9b9/HCqfefc4kj4SNoxFTTLZ3Q/U61LvL/81/vHKgcGvuUK2zQmm9vzlJVVLun2sv6jISPVGG4b7LOouMft9ne8FJY/nEjfLf/iZrWs4PV1sZTv/FQ4pMgY0nZ3pt4UnC0IGKiG4lYAbVR2T68NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hL/Feo+N; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hL/Feo+N"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so3479315a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219370; x=1788824170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wR8+vVM1L2fpbFVOZYNJRkYYqPhCGHqA1jwt2SE8NKQ=;
        b=hL/Feo+NrsLDxva0v9CWrXa1HyvYxsy2fQ58v895XUMmOTDK4MSMNqxIwPgQQqI9Pu
         2rFDg35ckHJGuRnnr0gsjsxI0cIyvmlmqL/CwDsMFjFtT01mfGxNBUERajNAjWVZS6AK
         qfuVs7URsSgxxE2IMkGCl3h+1w5smQd5upj0FQuE+4yI2bgKgZIAQUNWYoSY1shGU7gt
         MA+QmQ9+niDM5K9D5RfxL/MD4gOTUilNT3OHo5hR/2fiziY50NTs0IQIS86GM4+EjQ+9
         HMjntnFE8AMLcU+fK8o2Fjbl9cuP2Sp/kl+YQXgT2ohhudJ9jfGkBG5XDpl0U9bpB0lr
         E/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219370; x=1788824170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wR8+vVM1L2fpbFVOZYNJRkYYqPhCGHqA1jwt2SE8NKQ=;
        b=syLk4acUa3fyJwLQ/UiVY+UtUYvcPvp3AvPgwaamoGF0mkv3FforqZGS4b3B6qQSUK
         nEf0txaT3AJn/G8z5Nh0W0Jx9u5moRjqIIOHWulBKAYa1GY88ydZdItignrDuvZtnwZi
         8r70eB0kTr459VArOqVWAkb9oW1l8O2IwBv65yVadqi0qifV3H3kXZH4gm9EjOifqjAF
         fwbQnMdk5c1MxRMq7WQjVHLkqGknZaV0K6EAQRtR311iI29wu60RVUg0Zzzx0P1lQfoI
         z1MN8oTSmb0kRVNCetnyl9LrZWPkYACeQOiyz4nPT1enDf8TZGJn1C5MiX6hYmh4ofJn
         oldQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/JcpHwcf3TspfN3KN8hhazmjXFfjuXoQoa101XBwEJ1fGkEmHNXZ3mCY0hD6SSbQXXsyzyXtpw62+EMw=@vger.kernel.org
X-Gm-Message-State: AFuF++lr30yAmQBWKHqOlpI+MJKB4zwn3sjurrpf2wD+aa9U/bd5uxvF
	b5yvINxaaNoKoawdTgTnqra7HJ8oBd5qybNcKN30yWb4Od/SqXus9dwu
X-Gm-Gg: AYBFou2prlp9tEUx9uRAmlhkoM/OAE8qvZ96dOTqav57jSaJLzG5nCWdBb2755PYOHK
	FJZtsJAJ7cuxIGFhidt40LgePsAo9riRCy+6UjmdVUN0+7sblWG+6FuX8VEogV8/PRLH4SOUlYP
	Q44GO5YQD8hTUioNDU1zH+pptdnt+HbMfsjvSLuAp7g5TAOomRmwCpd9lqEsLJ1w3HD/Q/vKQH/
	vsVbfEIZdq3PSqKR1NrApJTArCJ/i/4qlWs4QWY2Okxd/m+M/0hHDOzIQKmbzPaf1NRmmF+y3x6
	dO0Jf5C0RrtRsqDWT5Nfvc27eexTksAk/IJK3WCxBIDI1K96J9R08U/duwzqnGDF/dX1H69UlAc
	WaBMuhhexdQJI0IfFV5WRK4xt4X8VeeT6WlNp5C5Z+ccUN/NIZdpeA5+pH73CjuQqZSUFFGZ29m
	yJJ/Ry9P9NlovHTpd3sNpg7d9J1jRnA/SPwhCHsPeLZuyLdjhP8MBFkNeG9nLRtuV00isIrz1i6
	/e8tj0VpYac1C+tvqNKpmh52476QImpCykBFtyTEF+pf5U3pXXPVSpSE3QwwrlfvIPGBo8/iUkJ
	DMhKuXyElY6hsCSKtBY9iivPmJBVrxubkeP1pRmcjKGlbZ7K
X-Received: by 2002:a17:90b:54c5:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-396d0e5ccc7mr47398358a91.3.1788219369668;
        Mon, 31 Aug 2026 16:36:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4a1732sm1992599a91.7.2026.08.31.16.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: use national,lm75 compatible
Date: Mon, 31 Aug 2026 16:36:07 -0700
Message-ID: <20260831233607.13729-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The temp@4c node uses "ti,lm75", which no binding covers and which
dtbs_check rejects:

  temp@4c: failed to match any schema with compatible: ['ti,lm75']

The LM75 was originally a National Semiconductor part (now owned by
TI) and the lm75 driver binds it via the matching "national,lm75"
entry. Use the documented compatible; no functional change. The i2c name
fallback ends up binding it.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 548fb92ca811..39b2d4fa742c 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -200,7 +200,7 @@ usb3-ilimit-hog {
 				};
 
 				temp_sensor: temp@4c {
-					compatible = "ti,lm75";
+					compatible = "national,lm75";
 					reg = <0x4c>;
 					vs-supply = <&reg_3p3v>;
 				};
-- 
2.55.0


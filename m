Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486043D7D6A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182731; cv=none; b=VccV7lHwCSpsTuH40V9ZLzNYRgXSj5dfahSOTUV/AVzuO+oRKYNXnTIlzJT7We2tiLBPG9sNAFi8HYsSyFwYirZfjqUuVUAcU29OWwjLTMVy+/4uMcqcEyx3c81866S4QUgDIFEg1NlXI3f1isdAix0XFJ7NqBNNkf6K6eIxcCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182731; c=relaxed/simple;
	bh=yoP7TPV3CfSEpC5ggJdNPW/TQcphN1bT3N/Au7vURZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eNv4feVIMmnNP+8XVj74QZDi1uYfbI940oG4tIKSWlLRyhmfDyje4yDijGmI+x6ou8kuW8/rNrrYSl10Ck2x3wJwVPb0DBSReS76kO/L0ATRQS8GH7XXTpAHcKLrmokXNzOF7uByo0Mk13+aC4nk+YEm2euhPUpyU6KT0elBbp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjxRRMLI; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjxRRMLI"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35f1f76ea84so470936eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792182727; x=1792787527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2QKXRBmpYUkyqYMuIECl7wkBgS4oNFS7MDH6jop3jQ=;
        b=SjxRRMLIm1RtJTMPb+bC0sALCx68fKvL25ciFQaXXd9kCeyrZcwhqoCXFHYeluFB2W
         03f0lxQ9jB03WwzbDE5Hdo7oQdpB2cJFpBSiZnXx0dN+ZxyUNyEFp814yNbTA4VpSwbi
         FKbPXPTk+UDvLfqVhScWo2GNPtf+4HXOMzGJbu3iMkCFrRqqB+z3v5bK7S6ajDtrDVyP
         NWzHeLhWuBcSUzWvi8ujaqz7jyHmMRwMAn0L/Cx6CcDoSo0q3sAstF3/P33CjmgS5u/2
         tw6qQAoXTPCB9piZpQdMbTCJC/HWuU7q/3IDaE1yoAw8IsKTGLwU2ugdaahiUxWvq2aB
         Yj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182727; x=1792787527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2QKXRBmpYUkyqYMuIECl7wkBgS4oNFS7MDH6jop3jQ=;
        b=SVgCBnUUR/ODScFKR81ZIclo3xlEbXKShF7yD2zG1LHO4E1PibSjmJxWbrdZo4m9pA
         SHHxQmiKJ+56LJdyaF8dY4BJbWfNmRqpIX628elmIcIV761OpRrYnH8klgZ0cyoPTbd/
         XuHQsAjmLBm6osmbUV3o6ivQhBrJJGpVixr2PoPUUHNC3agosunkNhlC8hu5Troq2DKb
         /4GU3PtaH4OI3+VPovRKBpWFmXu4PYMdBZxRxWuY6maDMn401meX6sX7dx24xjq4kD02
         HymwtT+wn8PAkWSTFFPw7SFMYLjD41ipl0vnKF7cEMLVOqwD6IGfo+MPbsy0qHWrAZP4
         vpPg==
X-Forwarded-Encrypted: i=1; AKwUvBydheDD7Noi1Y/BzPJC4DiJraQPZRzJx9FOx1tG0p0SkKmQXcvgXesHd47sz8OLLnI/nScHCUcWm/egaNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPd3oFmVJWfz8skaRkgfGlArAUuN9bzNoXE7SIzy0/owLGagRo
	wOpXVJ7eFl6aeuD+tLuOlMdAX/n0ms3Nicqoc0fs1hyAu8LYWcNacUGU
X-Gm-Gg: AYBFou2OQVahG7ARkFmznaTeSsZJTvLAa04sZvpwqng8qvu7NWR/uIcnOa9EpcwUvNo
	V15HBwFafWdalEgpNInZ5Eta8ZBjZCxJ+v7WYzisL+Fj9qkaUSz8/a0Wf2IiWFK5DMpT+6QPtxW
	8EmtBQX387Myl76KR02/kQL/BugtqoC8j2q9b3bMXRVlf/pJHe1zceIwmUC+7BlW0kJ3nJuEh6T
	x87mfFHF6ARBqj52P0FOs6T0np3SVwzwf4WpnxBqRXGO4SupKiuFQo/bpeVxoGfbNinRD6p8me8
	FNb7H2Y4/ia2W4d3WHz3kbxRmpwSlWZ+mcZ9l94B363hRYunUDQsSG+FWq//r+s3zDHO/85zlY1
	dq43Rdpf6kV+TSlU61Su4SbffSKMJq0m1GYMydBlLqblp9rVf0M0j2Igo81BOhYfMA+1X4L+iOZ
	pQmqqYAS5Gdw4KtWbPRjnzrQBmPjIKtAPJlXsCdOURTEhcMzUG37ueTNS8XN0NZU6SS3xYSKaAm
	JW4xQZZDhsWDaalnqJFUXed3V9oTGpv67S+A9embb95zMa+
X-Received: by 2002:a05:7301:2710:b0:360:b8b4:840a with SMTP id 5a478bee46e88-361a2747820mr1223282eec.39.1792182726979;
        Fri, 16 Oct 2026 13:32:06 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm8351620eec.26.2026.10.16.13.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:32:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: input: ti,ads7843: Allow SPI clock polarity
Date: Fri, 16 Oct 2026 17:31:31 -0300
Message-ID: <20261016203131.454640-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx27-eukrea-mbimxsd27-baseboard passes 'spi-cpol' in the ads7846
touchscreen node, which causes the following dt-schema warning:

  imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0 (ti,ads7846):
    Unevaluated properties are not allowed (spi-cpol was unexpected)

Allow spi-cpol so the binding describes the existing configuration
without changing its SPI mode.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/input/touchscreen/ti,ads7843.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
index 1b58fc263dce..24172d206d6d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -32,6 +32,8 @@ properties:
     description:
       GPIO handle describing the pin the !PENIRQ line is connected to.
 
+  spi-cpol: true
+
   vcc-supply:
     description:
       A regulator node for the supply voltage.
-- 
2.43.0


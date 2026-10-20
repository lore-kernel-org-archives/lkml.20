Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510105;
	b=1xW4eYejf3dMAfgvoAmh8/R4vnAINjIUTCLuI85IpbWfSZssFf/8YbsvYYWb76MyPq9I
	 awA6ECbZQsuNTeVntBkMnTk9vCYdDjtk5a/emf2gMntEBfb/UCv50qS6sQj/1qeb2tE9N
	 z5LLpP+VGc2EHw+QywTr8TVi612LIsbBnbToSZqpwSQ0/KhEreHHBiyL7kDc/6l6/OyaU
	 TVQQAaoJehKK8GnyibWl0yFKz3D9elKTDf3Jq9pFIvngDeTg2PG9wBuRWGyEs06aLqkKF
	 MYm6DncZ0SqvVNquZUavaJl+ZQvTA33iyStmbMcpb0PKCHsHFsyHhooUk4VId8GJoBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QNgYq4tNaExyuZph3mH3214p58ognuDLQpFfS39BZ/U=;
	b=XGEfh3T2QywCKSVb4PMxhKbDAJ5lC53L+CFKW6e+MLtjRxOZ1tqkL2usw1kuNzv5mljh
	 71pW/YddA/pFvycJaU+F34WCkL2aDs67D/vxKrpBihkOddWlspny9yvF4+c/a6Ea9uyQb
	 YZ7jh2w4hTTu3NR4q00QAgmdxlSjMsp/t3e5V9wepz9c0aa9t9uOMSMZ227othB4koTib
	 41OUB9RlHvJD5mbUDVh7etUJQWhmTJfHzlBtoh+InvhjWBMqIYA2eDG5UXKXioPmylViF
	 2knbvtkQhfGU/LSXEyzcS6xJodaAtxh8DW7LxTAR7yoMJUNVp+l0QrHIJcqGZ+ZOWUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pghdQcwl;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD959606A335
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD959606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pghdQcwl
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33c10faf6easo374226eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510104; x=1793114904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNgYq4tNaExyuZph3mH3214p58ognuDLQpFfS39BZ/U=;
        b=pghdQcwlEqnfctzczBTAIRCLD4gRCtRZ5nI/9Lh/9OQhZ9ClaXwzpyONuC/7woEnUB
         fkd0SmI8V8rm216FmJX4IEx//otXiOmW3WGChoMzhd+nV0iqj3UR3ACFDjQSJR0ApA7r
         1u3Fnew44IOUUWPLoe3JfTyYqjq/dqqVcbaM024fVC4Da+IR433S7BmALAPvA1Oi2ucl
         Uvoc4cRHf+fmkiuNWByfdrUsxEdwq2l/znnWEBX9dJzFAfLWe7u7+KK9H6tyjneR0ogw
         bsKE4bdeNxcznMBwdDCnTm9pyj5hZa3FpjW7lOEHADuxmyBRG8pJRLL+BaQaqHUxJDxb
         CUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510104; x=1793114904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNgYq4tNaExyuZph3mH3214p58ognuDLQpFfS39BZ/U=;
        b=yOBY2Bb6yHmwqkNwd/IflI7a9HPsh7r6jPOzNsJQsuO/FXi3o4J+9ldMy0zBAmwupH
         tZIYQ3tVi91nFIyVE4i66DiTsjzsPJQSmrpbr1GcB/C0O50QdibcDxHbH9iPKsK8TL6F
         zAYklRO/7ZEJ4Ckjv3cmF2sj0dWU/vKPQ6BRPL2pg+I93e+SzcfWU24EWCDEY/6flJfW
         DR1ije+5i2r9rhA+l1nk7JtZbHEEsFyHnm7ZKdRfmoRTJB+e9fXlw4bj3IL6Lg6x0zY6
         rf6gtv3r7ErP3oQQI0RAVR7uxxYd0LQcFleDzPev7Xt85+s0LAW9OzfW73dYy2FwMSx2
         uERw==
X-Forwarded-Encrypted: i=1; AKwUvBzPHur3hr5ENsjI3RXNzXYELO6G6Wh2OahjdEHF5N0e+0ZrdZgv2s2oR3R1jre87SUSy9v71M/a6VISX1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9PiQLg/aGVaerp3wiHeg9ptROfRMmuZB/Xj3IQUxcIzrjmeS2
	L8Of/0dTyHUKEzod/IaUejR3vUb+HVVre4w0bzFZFSVoVrW0mkFER8mCreq8UEUX
X-Gm-Gg: AYBFou3X+q1ag7eQOI20DMXzGlR4jotaHr3nKShsM+pcYsYTMTiyl2RISeqnL6yha1d
	qY95xo++iFRLCVa1+TuX+85WbvSp+jQzzAxEPWRgYnG6/8Y7AyKYxYvSKbZrKPhgmlNeEdLo/7r
	Sv6SZoO7JU/Zs9AmPUl6RMljamMXjoi21yRgU3Q+3vBu92HDXy/cr6JAozI62XDVbSG3rv7ePjb
	II0DE/I5hKwUFicWUozpKuIxPvNK3lBc6OqtY0Uuxvv+6HBEk2/Ka0NR2LTTTBm3EP6HuH8wNOx
	71JGR5EmqlYpi2XBAbgRXTV4tGKg+Gpl1PpiwMEE24RH34iypwZfLVahYIWN8TJD08VU3UMso+L
	0ICpb00pZxmqwVECxzQbAEEUvzK0EfnJUiSEoI/3+mpM3v7bpfJOTkNfsyucoX/GxoixkM805YW
	ub42I3rCnk5q5CCTm1XBUfVAVJ2RP/Tl9cAo+ca6BXGzV057ZcgaHaNnJWtTebcZvVrUjJzH8Qe
	qSpJBYSurw=
X-Received: by 2002:a05:7300:7aa1:b0:33e:6714:3945 with SMTP id 5a478bee46e88-361a0898c20mr24289096eec.2.1792510103684;
        Tue, 20 Oct 2026 08:28:23 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm41629029eec.10.2026.10.20.08.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:28:23 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] ALSA: pci: Kconfig: Fix spelling mistake in help text
Date: Tue, 20 Oct 2026 20:58:15 +0530
Message-ID: <20261020152816.16820-1-sarkarsubhadip604@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix 'useable' -> 'usable' in the Kconfig help text for
SND_AU8810 and SND_AU8830 (Aureal soundcard drivers).

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 sound/pci/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 6366f72b3..88b88f88c 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -104,7 +104,7 @@ config SND_AU8810
 	  Say Y here to include support for Aureal Advantage soundcards.
 
 	  Supported features: Hardware Mixer, SRC, EQ and SPDIF output.
-	  3D support code is in place, but not yet useable. For more info,
+	  3D support code is in place, but not yet usable. For more info,
 	  email the ALSA developer list, or <mjander@users.sourceforge.net>.
 
 	  To compile this driver as a module, choose M here: the module
@@ -133,7 +133,7 @@ config SND_AU8830
 	  Say Y here to include support for Aureal Vortex 2 soundcards.
 
 	  Supported features: Hardware Mixer, SRC, EQ and SPDIF output.
-	  3D support code is in place, but not yet useable. For more info,
+	  3D support code is in place, but not yet usable. For more info,
 	  email the ALSA developer list, or <mjander@users.sourceforge.net>.
 
 	  To compile this driver as a module, choose M here: the module
-- 
2.43.0


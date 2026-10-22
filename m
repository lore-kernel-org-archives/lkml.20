Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687907;
	b=TKaOT9dYDqCpTzyhE1CZ2AXSj91qkEN5Hkl9HdlxQJjhJYGfxLTQl1MaF3kXQS+lBUPt
	 bqTJVCeYASVvkMbb4Bh3y7XfznvQySOI/vMgYIrrNhnJuZvs9l0x/KhAMqbs4GlqE2gJP
	 RoZpAdSDHRZMpUF7iDgwKZdMFR1bbjEeX3aSgon3i5VrceEFaI0Rrwf5h5+LsKBlDQ6zV
	 0lKzfn1/ApQ/8/U6iqmz/jT3i26kqLJOpidGxYs+lg0wVlUDSarLCQfJSjsmUKxdOW8Si
	 zBZuY/R9gqjffFM+m9QWs0M2yuuc8cuiNYdMVh5bPS1x8i/gFjsDhRjHqxV0HrOrquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
	b=T+6ScnDsZQypBKA25qhN1tZycIgJMNqLOohEti/Eh7/03y9Mk2JkZ5vgMgTvApP0mRKG
	 I6Eozt8ZAuj04YIMZz0SwA+MR8Ib3Q1Qdeu4sp35Fywp7YAcfs5qfWwFiSH1gr2k1YCvK
	 zhnh/urOfv9bxLcuDtID3dTXQPRXQSmtfKBg12jxdGH1QdqLb/zpos1qxSEvWrMWwPBNL
	 0WTMy8rfdLDe4xM4GKjD9g49kvQrWi7ny9zW4D7OCWejE6Ljn4UI8EvhjpQx27M/IfrDl
	 MI2v1I66suo3kRwaazZEp3IdWhBMAa8R41k9+7Noz24Bc+NriFHXvMf1YcVr9j/pn5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBp3mBBV;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9663606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9663606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KBp3mBBV
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-185fd3a4ca3so1330245c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687906; x=1793292706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
        b=KBp3mBBVD8mfQPf1xPzMq78aeOa7OjwZrfrkFTLv2MOomwMfKo99PpbcsyR98PDW6g
         tlLlCzCxgP+Il1BNJNs21b8d88NZyIipvWgy701LcDZjekp2TPyi5kfoqZfNifcoLnQv
         pCVLLkfC4iJTo11uUocrgB6P+bNIQhMrcr3Cv9WAYYPQZkoL0MmkkQ7cBgqIb1s5+SD/
         LdLxXBZC6br+p7I05cm4zZ1V/+dSp/OcLLSiBU5OkH5QNaEfFB4qR6ZPQX1+MzBum8nj
         vJ8XEp1KCdtY9mQCDytv2jub6UXE3/+3BsU17StIu8Qf4QJpxIAuxzHzaPZxmwuEzTC1
         UUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687906; x=1793292706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDRQGAeJLdbef9dVZwQAv7nGIbRRq1DpVqeg51obZuA=;
        b=gtZG21tzjJ+N2cV55kmnrmdYslSTNeeQs0GGDd9DBKbSFr1pmfQI7III0eefc6Xyvq
         Tz/Y9/f0J6Qlv51d1rmTGzkPuoyViVIBsAok7jDjL6achyKQCZ22OoJXFIXNzJxaMRYU
         gVNcQP8lx5FYQsrr3/co866xj4wNNtV3+/EhTcW74gUkAcj21yhEPgjljrORG2kGQCUd
         W/U+b0sIVbrS9o82pryoB5yG4D0e1rxMybbBWt4SieIkvAklv1POe9Ntw68t9wWPqj0y
         OftnotRUwunzijduWpetNdMB04XlukyJ9vOscG8XnTNAI3lBTBqdXyllyRq1sZ4Fioyf
         npLw==
X-Forwarded-Encrypted: i=1; AKwUvByY/uiEL6VrFRgi1fHjA+GbhFIIiJ/l5C4boGo7xqfPXg+p06SzjpTX3Ed4Xs44TruJ9n2VlaxpAwA06Co=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3iRfR5HLocBVJTSvf9DNgXVL99CXo29UMXnAxLNEIxVugIS5i
	7QTvalh9+aaeIam3Crx/WJkha/ovvY+u9h0U2eZ42vKb9K347hRcO0U1
X-Gm-Gg: AYBFou3ETTx9RN525mRKTxzVLmD70F8OJFN5i6s/o792UdtSMA3/475Sl+akbYcTAui
	E5XinH8qZcUjz4rUPplBaOgGMegSUyRv8g8VSe0Na1fUSLyFAVZy7hnTuGO/esd3GJn1J5vEmgX
	JLhweDb0NrUKFyvwtgNbMFrvOK6ijxgpAaxfCvQk/stT5q5+gtoRZVCwfkj2rc8WZ3Azmih1vBl
	jP3IeecqTdVem6jHluzkZRSSYUNo3P5wklb6a3m/bH6Bm6sY9kUZENlt3XHiBnL/F681Ao5O/Yf
	ayG2qRmTo4Mf/wkkNpaGEZUF3a1SOQf6UcSzNA6n2Yml/8OtG5M10Ozz9a0cnOFs3ZQylaf6uYf
	FWhc8t9J8wciUbLwykVjjLNuXyRGfoGlZvZiBa1/oFd27/jZHCajCVBaIlfxjPIN/UVpc6nVe7u
	JpIJpYCZqDqMBmSNqSJQ236QXTdD0lJejSeIQsRZcqamsobqLWrdFhOkco8DfuI85Ho5TobH90G
	c7N+lANSX7CRwiGX1PASA68zvwKaDBteHvVVUrXFJIw0Jk0MxUMxGN+jmNlExCx30N84w0=
X-Received: by 2002:a05:701b:42d4:20b0:191:444:425 with SMTP id a92af1059eb24-19104440440mr6489634c88.2.1792687905761;
        Thu, 22 Oct 2026 09:51:45 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1959dd144aasm46566c88.0.2026.10.22.09.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:51:44 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: neil.armstrong@linaro.org,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes
Date: Fri, 23 Oct 2026 01:51:43 +0900
Message-ID: <20261022165143.1327-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

DisplayPort pin assignments C and E give all four SuperSpeed lanes to
DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
assignment and stays available. The FSA4480 sits on that pair, and in
these modes the driver turns its USB switch off, so a USB 2.0 hub or
device behind a DisplayPort sink is disconnected as soon as the
DisplayPort mode is set.

Configure the USB switch the same way in all DisplayPort modes.

Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to handle more states")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali; out-of-tree board
support) with a USB-C monitor in pin assignment C: its USB 2.0 hub was
disconnected when the mux was set; with this change the hub and the
keyboard behind it stay connected.

 drivers/usb/typec/mux/fsa4480.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index bea0c1deec94..e05ab3c10c81 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -93,16 +93,9 @@ static int fsa4480_set(struct fsa4480 *fsa)
 		sel = FSA4480_SEL_USB;
 	} else if (fsa->svid) {
 		switch (fsa->mode) {
-		/* DP Only */
 		case TYPEC_DP_STATE_C:
-		case TYPEC_DP_STATE_E:
-			enable |= FSA4480_ENABLE_SBU;
-			if (reverse)
-				sel = FSA4480_SEL_SBU_REVERSE;
-			break;
-
-		/* DP + USB */
 		case TYPEC_DP_STATE_D:
+		case TYPEC_DP_STATE_E:
 		case TYPEC_DP_STATE_F:
 			enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_SBU;
 			sel = FSA4480_SEL_USB;

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0


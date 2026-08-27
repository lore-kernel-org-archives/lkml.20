Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5703905F0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853436; cv=none; b=RPFlbYrSrRhL858chwVrnPy90l7xo2wJm5pNB8gOVBm2fro1ClwFvJ+WON9EfFQlDwUX2jQzPoHkEiW40Y/f5P5uBLlcIAqDjmleXgXkSz9J1zr5xrtYyUGH3ZZ28rYUCrEoRYXFN0LpREW8N/uLZkpavcM9As1L2TSTcc8L1IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853436; c=relaxed/simple;
	bh=ErDkx2iyQEuZbMjHNFnxMQebJBQaigVzsGOKEKGfRwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJpzus0BTkKt6kjNWvIzXjTq0ezfg6hlpzs+vq3MPEjt9svHeGKJ3oXqUdkV/jlX2o3KYRAKqe1jyVUx1MvA7qiUwiMQOhNQeZPI7Of5O1WuwvM/5RnNMhnem+iTdsoB/D0U4iDzUeZQsNYPQMaj5tQfQGN/iXk0kQzj7jG47lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRhbs2Kx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRhbs2Kx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so705285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853433; x=1788458233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNXzX2LjDvZcxZQqc0tIk0RIG7mCEmpN4a6lNUWarzw=;
        b=HRhbs2KxlbQGfZ+miGEUrNeZwkvH1zykLsar0c7OnUaWfVff+BN2lrXf/col5Dcocn
         xbzfhDA+Oqdat1Ylyck6VdZ4QtxO7EZJa4Ca8FF+v7EeJpFlqw0icEEPSWgFz33n4Qo2
         GJY4R7prpqwam4S+bskUWxWUubz0kcuB5cc6ojmnj27MDMsQ0FjmlQjVvS10o7dlF57X
         gl6nXagfM4mVhdbuiM6+PqyxVdHcQTlBTX60QZgLM/OAxkoF9SKnaaIYl87ahIdm31yh
         XBxupiQfxxHYiKsCL8NDqZohkIBVvgWWonrrR6/cT6IMebgyWf7QhAFiy8pBh/EydKFo
         9hXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853433; x=1788458233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNXzX2LjDvZcxZQqc0tIk0RIG7mCEmpN4a6lNUWarzw=;
        b=pE7/6Tu9zp1eeyaycClRvxl0912D9mezR2kZUzeiPfLm1dzixweoHIKEmwCFhgSjZY
         MIXg4597qbsS0aIzHmGNQoUDqFvH/I4kgU/K9HfdzEefCxUvTeOrKvpY8hlKKHMZMuP/
         h64VUJJMcOT3kaBXD1Zj3ucmYlUXyYeI64uEOp4aNfYgyTbumzDb3NMp8VjEae3D65iv
         61idYsPwyaA0E6IDwsR495NwpE42DVmq+otla7LxX7phGuZz0pasOda+3psLl/w9MeC8
         0AoRhDqqiXSlKiSch1fZhCPtN1NS9GJE2YQAR5rvN0bcHkhdOjKY72V9AJiOq8uB8r/k
         y2ZA==
X-Forwarded-Encrypted: i=1; AHgh+RqkGXoF2D10mOAGAXp75xuFRVU2vabtW61DHwchcPDO8004q12B/aHP2eg4zpLISAMq6gwCAGg5CzSreyw=@vger.kernel.org
X-Gm-Message-State: AFuF++ni3Oui4us2TJkhxRkm8ZqMkB9de+52ljhLf02E5IDIGHUmW4bK
	kSq7RoGhJjLTZDAl7SrgcTs+LDXly5XsTg5S6R/mh5O5iI9PbreQ/rGU
X-Gm-Gg: AR+sD12lOhfpo9tl+B1wAQmt42yWjMI7vCn49+2x4EaETq5kAOovoT1guNKfsnSh5Px
	uCv3dyAWuEvGQENApEQt2tT0A9y7LQ20O+WfKyE2bM2EgbOInWeMQfgA7+eYqz74Z8ISrf2Itsl
	2hvUb2vvDlKnHKcu35nHfEdBdCsmedLMNZrLGCeNhOq01CIk+90zyOWAmPotcLBiwLYOgOoJ9XV
	kEX/bknyOAEMYzndzhahhmRTYipScY8cmCLChtcwfJRhbUeyuq7DqezZneszndMRXZVrqFfypNU
	R8ttaU09AlUBbG8pTvKM1yGGbqrFGREJ6nGITvpPlRJ6/DkLbOwEnjWoB1LqMTpDPWbTEpf1s20
	KCzOsmf2OrvMKTba2EohBqQKpEDY3O42rYngfuiNqQlbTMI07bxtED0Nagt4crJZ/DZvngMWyhe
	/dOUUdw/3hf270GMUEjcYamWUSRLdqrUvpZCSTErJ05zUN0Xz3cZrR3ruJa6fc533t+o85QijLm
	t+55Oqgw3QYvnCs4JRoTWg2iGnuU+rfTb4PJtC0u40e
X-Received: by 2002:a05:600c:1c28:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49b91a5899fmr16419615e9.3.1787853432548;
        Thu, 27 Aug 2026 10:57:12 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm82921295e9.4.2026.08.27.10.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:57:10 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] usb: octeon-hcd: fix the FIFO-flush timeout computation
Date: Thu, 27 Aug 2026 20:57:00 +0300
Message-ID: <20260827175703.1549-1-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_wait_tx_rx() computes its 100us deadline from
(u64)octeon_get_clock_rate - the address of the function, not its
return value; the parentheses have been missing since the
CVMX_WAIT_FOR_FIELD32 macro became a function. The cast makes it
compile silently, and the resulting deadline is effectively infinite.

On a healthy controller the flush bit clears on the first read and
nothing is noticed. On a controller whose PHY did not come up (for
example when the reference-clock configuration is wrong for the board),
txfflsh/rxfflsh never clear and probe spins forever in __delay() -
observed as a hard hang with a soft-lockup splat on a CN5020 board,
where the board watchdog then resets the system with no console output.

Call the function, restoring the 100us timeout the code always
intended.

Fixes: 3e195a80e096 ("Staging: octeon-usb: Replaces CVMX_WAIT_FOR_FIELD32 macro with a function")
Cc: stable@vger.kernel.org
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -578,7 +578,7 @@
 	int result;
 	u64 address = CVMX_USBCX_GRSTCTL(usb->index);
 	u64 done = cvmx_get_cycle() + 100 *
-		   (u64)octeon_get_clock_rate / 1000000;
+		   (u64)octeon_get_clock_rate() / 1000000;
 	union cvmx_usbcx_grstctl c;
 
 	while (1) {
-- 
2.47.0

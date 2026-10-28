Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197121;
	b=iJExntqs9gJCO6bOHIAt9uwM66wzqt/alZrdWFldZHtr6pMdTjaYbqvjyZgCnvvPEbwW
	 zZrs3k1xWnVZykQRDu7pG8PtJpI3w2X5ByPsLmK+wTtcGDKXXN0pTacXjXspvlW7PwF52
	 sZ354ZJQWLjvNP0axboQrm5U11se1cNkiJsOod9xO+zN3sxMhOnNLRz++JhQUEP24pIm6
	 WRFW4XnIJpnnPoEH8qSLM0SDl4nt9FGrAICqcP8RTCDR36TVPSGwy4mf0i2XOKj3qgSDq
	 BJNiUDfczUJGZEXsqLeBPxYzgl6Tc3IHEc0KBLplhnLtVKyrxJwyaFaVjW6d+bUnwnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uhged07YjYHVSfrcQ8AV5LddG8+yWyQJ6mwgUwS9Twg=;
	b=sNAqeJnzxGCwWJqklPw2Pwr6ZcADZB/L67sEjTwgCv/AnBf24m20xLlFpRSpmo7LxexW
	 C/tqKyJfG4dI3mvPagozzPl6fw3rG+6Zvevrruh/sRaZ+ACQETLVKL9uxZJjYv/1Iifw2
	 k7iBKsvAZS+AtM1K7t4tGeZMLns7aXNWI4YZ5B9Zks3U6ouBzF6Rz28ataEHVZGry2yIr
	 lVSUF84TDLo7fSmfXL+PhxWuYvj31FUBdjQRYee/FQha66VGlvy6h0xVhNMNdKrivfhKL
	 ZuZ/g3FY6VnLQOdTb9upC526IbjLDI+JXDTcsCB/bhEU5BmQ0MwmC/39ykHUz3/ajrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyQTjCIB;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9562D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyQTjCIB
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab41538192so777817a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197121; x=1793801921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhged07YjYHVSfrcQ8AV5LddG8+yWyQJ6mwgUwS9Twg=;
        b=LyQTjCIB6nzqoYRvuAJddT3ibncTV4Gsil83rGFuES/5IOQrtYtaqkBJ020mNZTPY0
         lrR7WliJAxZB0IwXX6lUGzgvq9LG8qKYJ4/bU2aAB7dinRvp8EDnk3f9/IbyLneqENKo
         Rz+c88Vju+YomHtLDeJRs5ah93AVAuP8f2XdJFYoc27LqQIrKG7fW6ClUO/KIiC8X8Aa
         cYzu3MGAmZcfv9gv86WkwOJqLwCIqCFBbq4x23QA+rCbZUrmRMINE0qVwssRII5FqEyf
         fnB0hoTlcNrNbLCuIY9j1LAINM2pJvH3wp6xtmjHjSGlRUIcI14c29hPx+75IXd2ouwH
         6eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197121; x=1793801921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhged07YjYHVSfrcQ8AV5LddG8+yWyQJ6mwgUwS9Twg=;
        b=L57HHfeSVz9ZKaVZXTciMVWqD5tUiMmXUWkL1qP7ooiuJVfNgPQsH/hy/lqu/JlJaT
         UgjY4WgSM87wRGFHVx8dGSgLDI9iQilx7dLoEO63l/UOWk+ALcA70WmYgdIuIOzx10FD
         RAHLS6MkkEhkN46RYpPt9YBFkvDv3FLLME2GZk1/LtGrjpogGYMzbBImy2JdnQAKfBHT
         6sQ1ObWpoqOx9GgPNYdAYo+HQVCTMtRvpgOlPXbuOY2HTXDa8Odtlg6iMKLhepJs6LXk
         fsXPI0nofWiS5eX/m0P/a9jP2aUKJrMOCGvLdEn260zZdjjcMCoXvYQI6O7ABFMLMZZV
         So7g==
X-Forwarded-Encrypted: i=1; AKwUvBzZ1mWhQcQ5guu4oT/I1MopUjjrbnVIvVpuzrABwoNuS+5VXwWRDxJgMebtgNfwWpgYO0EYPn8C4dyxVGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8wPQHKMFH8FPU1Mz/+9Md60GCaL0C93Ks/8A2sQfy7a+52ahd
	nl1jx37Owjr+W/0mqDSPmOBajDFHdu6Z0VVRK+oWYgTToJMxQlkuZwmp
X-Gm-Gg: AYBFou1ScmuTyNnqC2mNAOfw89CXe/dzTskJplYUXVS+O5hrmHY2/yXlsDifBtTExwB
	N9nuIozn4nJkLjHO/b/B8ciyJ5xdKI0Do+DHnBk1bRfCb7pxntoA/bOOMvRQAdxf6irQETJS/2U
	ZHIppUnAn4M4ALIKtu3X80FCjFVdRltKNQ0oZFGEMzOev6Np5gMbrrkH4fFXX2/g3DovhEu6Dec
	l/cuCD4OzPjFJukkKkrKjF/7VJ2DCQjKPUmU0V2Yo9h9k/jc3sR+OeZRF8a0yeDfniu0JFTJfZ4
	m3GB51Gv7JJhXSNWZc4vzHccbGuxPNEOvyxx1zh8S7kyR3I6HjewEvtGkcazStJWelWQQr2Fk0W
	YPx1aa/nCxs8cr1QsLfKjRkGWHk+gprVf6TpoXYwrivuOt+pQdv338C3kc13RL3sCVMmF/1qPe9
	1uYnd0LBUf7Ng8B1kcPr/LZ01VPPc9Zem9tSHy+zX6nFP4MCnEJafe1VaEeqRcx1Hdg4ZjD/rZd
	etJcPYIzCeFmgot4ve7iwqPqpvPEzcSD1f29cbXid5UhDQxvkc/2cghfkScd3iXSIMTtOuJzwEZ
	ATH77ePJR7kOAVVBZcfNS5znHD4No9atPPkdwq61/FotwbEq75tvq/hLq0D5qcu+zp7s
X-Received: by 2002:a17:90b:2c85:b0:3ad:8769:8741 with SMTP id 98e67ed59e1d1-3ae57e4207emr2104742a91.4.1793197120513;
        Wed, 28 Oct 2026 07:18:40 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a0482e9sm3437223a91.0.2026.10.28.07.18.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:18:40 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] wifi: nxpwifi: fix AP channel-switch lifetime and failures
Date: Wed, 28 Oct 2026 22:18:15 +0800
Message-ID: <20261028141819.7556-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

NXPWIFI retains request-owned beacon buffers for delayed AP channel-switch
work. Once the nl80211 request is released, the IE parser can read freed
memory and copy stale bytes into management-IE commands sent to firmware.

Deep-copy that beacon data, cancel pending work when the AP stops, defer
blocking AP traffic until switch preparation succeeds, and stop the
interface when delayed work cannot complete the switch.

The series was not run on IW61x hardware. Testing from IW61x users would
be helpful. All four patches apply without changes to v7.3. Patch 3 has
144 hunk-body lines with context, above the stable tree's 100-line limit,
so patches 3 and 4 need a smaller reviewed backport.
LLM assistance was used to review this series.

Zhao Li (4):
  wifi: nxpwifi: cancel channel switch work on teardown
  wifi: nxpwifi: stop AP TX after preparing channel switch
  wifi: nxpwifi: own beacon data used by channel switch work
  wifi: nxpwifi: stop AP when delayed channel switch fails

 drivers/net/wireless/nxp/nxpwifi/11h.c      | 22 ++++--
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 74 ++++++++++++++++++---
 drivers/net/wireless/nxp/nxpwifi/main.h     |  2 +-
 3 files changed, 81 insertions(+), 17 deletions(-)


base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0


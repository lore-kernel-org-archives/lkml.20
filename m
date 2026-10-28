Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197191;
	b=EhIybMP7eMB4VmFsaPJTUGIFwTTI9wdpruplCyj98Yv8hp2KdMG6RUi9cigc2QqvWwDn
	 wAHMYL/mwML9RY9wvOujKa2MZGw3xZuEJbcAAPKiWtneKkaCzOTLkOdHUIo8151aa6ITv
	 b8ursQN++n7pTTL/Hk/jQGs4q8TOL3QjbddbthuwjLhGBPtu4v2VknzillSbbKPQEeuHl
	 ZQH8E2RbJrYoU/NG+l11HsMo3dJM39RVgOKmnCju0VbvDEq9oNtUzC/3psplxg0jNdqjC
	 u4xkPrSTFeRSwrELAEF1s/ms7xoQQ3I/cJ2UrkjlVIRTclk354B0LxNKyyczO/zgffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kMi186sipMCPPAOY1m8cGHv9pOpCV2aOI05mfiXBJnE=;
	b=r/Zrp/3mOBwAA1zlr0IyCL+gJxruegvXkEBJX5c2hwoKjzMApz6hXNzcZAwV6Sa2ITgr
	 UVo/+ygFFIPSfrTSbvmB8MAHbde8bdwQ93Smu/mI9kNddP6psX+XVGpuG680gfw5op2Oy
	 YjhV3d1jmQRDvtIz8v0xduA2eMbvwrx1D+zQtBb97YVTFvh0ah00DIkHXEwxCrfiJAlfh
	 Nn66+RcPpEzC8SvqbcX9vu///aCoQTzrbnXwiog6XIC0PbQcr7dsGOKdtNfjJP2uYoTN9
	 lal2as4wlnxjS/fTxAD8lDnxMrxsN2ZjZ6t+cF9HT5tqzdCaMypQfvC5J04fFI4LpiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRjSWJOZ;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578D560A2609
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578D560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRjSWJOZ
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so843194a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197191; x=1793801991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kMi186sipMCPPAOY1m8cGHv9pOpCV2aOI05mfiXBJnE=;
        b=wRjSWJOZYZPdAY+OE4XZV6r4KDrZeBQGkQPzFoJKC6gyoSpl4N13146XbZQieY+k/R
         rMLaJVOE0sNqZvjZm3LFL7LK3LyjWYNLJaLsgnUNSBy6N9oZXzKSPQCaUatNy66mHwP5
         eU6sctMtl8WYVOiM4R81RiQSdr0nYddco0kRuwRExbcR3oqJ06t4tKqoDf6Oyja3DxB6
         8yx7khBA5WHLVJ97nkIU9oUx/L4BLX5swZJfK8GPIpZ8lLsV0/haKR8SKwAO2pbaQdHK
         jYHOzz7UWZJE6IMQ3SIQ/bVUgU0UOqYuRdHMrhyFyIQ9huonKkcbZaE22jN5qilj7st4
         ee4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197191; x=1793801991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMi186sipMCPPAOY1m8cGHv9pOpCV2aOI05mfiXBJnE=;
        b=SXS/X4RxMGlrFteAUoUZNOW0+ueNKtuD93/t77OreSNVnNgkeHJaTf6jbhHtRrV6su
         B9X0KEWqHkAzplJWUFxs3i1Xw5VYel194BW54NpWYZP89k50JX1/RqcId5u8GMmL5cBQ
         FR8Ji00y2OzpYteVnL2ur4zcWw8ItpqddF9BlQ0YtduZcTxa2hGow6b43OwTpqyzIPFj
         Q2JLUMHjYZfCEdubvHTppz8dgprC74MshsYflVZOF8+6G1FbZv641y0Zvutvtzcs0NDA
         +dDQMHwNnaeCrQF1uWagaz+NhHH0Pdb1WXzt3ErRaBPcXKLgZAQ8S2d8i9mVhQj53ERl
         K6Vw==
X-Forwarded-Encrypted: i=1; AKwUvByzF23ZznH/39XaHIic5MCn30vv3XMwMABCcPM1dMCdBWfKab1kAUDK+BFRzBUIufM+zu7tST3T1Y18t9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP65i4+XwK162HA+CiY9tfdhXSpa4F7wGua7dcKkKB34Ra4pMy
	1LGVyaSigayZ5M39ik5hTQja3GDAYD+8O7qrifjeiWY9jCmVxS+Zh9Be
X-Gm-Gg: AYBFou0e8YBhT8zYV76QrzLpoJY0oT43PmSBRgTx3+IHH/Wu3cisx5gX0Lyr1HIiLKh
	m1aif2Ynpz05loRfP/jizXq9n5oTw4EW5xcNCH8mS26kIN4weUDTaTvgU78obLSbSy4i0oPTRH5
	cn/z/I3nAn0nS+79wAvnbp3dYa37Wn0/XV85A85rLpQHCLRjYDLWmJkUrXIdPblGazc8lvktBTk
	TNyWATVd2qjmEKClbyCy1iKNWvqPxSKm8mtp3xwashBfjWoaMEkwgG8zqMMteAolmnkaWRh2hDl
	2TIYmQu0MbVCdNl+eKivGmhck3bj4yb5cf57wk1uw+dM9YZTeyEWW138qHlvT6CdLsUVCcvqihb
	MALOfh+URQMTvOKuDuwZTOzaADwLtmU7KWvehSA7vL0WcyDqNU28++JYX3yRxCvknxLAEACt9h0
	u3a4jhYA7vXWdMbVCr7Q5eWYzT+sytmZ1pSaJ45WZ4sdXt3hJE2t/cQ5VkfmaUUYA1SEUodaKTF
	GjMjzH7p25wB+QW2awzIjpoEzU7DVPbkF/H+mAemh9RZIOZaWabsZezNJl1hlVwyPAislPyLgtL
	3vLfmHsOceDpgMx+gIdDc+HQHb8aE1wt8GH+OBrdgKszoVyYSmfDsXmS5d1/8Ls4doNlXgLVhHu
	m/Ufx1rg/No6Zng==
X-Received: by 2002:a17:90b:3944:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae580d0513mr1943943a91.37.1793197190592;
        Wed, 28 Oct 2026 07:19:50 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f286fsm3290141a91.15.2026.10.28.07.19.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:19:50 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Marek Vasut <marex@nabladev.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Stefan Hansson <newbyte@postmarketos.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] wifi: rsi: fix background scan result and state lifetime
Date: Wed, 28 Oct 2026 22:19:24 +0800
Message-ID: <20261028141927.9306-1-enderaoelyther@gmail.com>
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

Initialize background-scan results and report cancellation as aborted.
Report command-preparation failures instead of leaving mac80211 waiting
for a completion, then serialize the saved request with cancellation and
firmware completion.

The patches are ordered. Patch 2 clears the saved request on every failed
start; patch 3 relies on that invariant when it treats bgscan_en and
hwscan as one state protected by scan_mutex.

The driver is orphaned and this series was not run on RS9113 or RS9116
hardware. Testing from device users would be helpful.
LLM assistance was used to review this series.

---
The series applies without source changes to the retained 6.1.y, 6.6.y,
6.12.y, 6.18.y, 7.2.10, and v7.3 trees. The retained 5.10.y and 5.15.y
trees need a context adaptation in patch 2.

Zhao Li (3):
  wifi: rsi: initialize background scan completion data
  wifi: rsi: report background scan start failures
  wifi: rsi: serialize background scan state

 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 50 ++++++++++++++-------
 drivers/net/wireless/rsi/rsi_91x_main.c     |  1 +
 drivers/net/wireless/rsi/rsi_91x_mgmt.c     | 30 ++++++++-----
 drivers/net/wireless/rsi/rsi_main.h         |  2 +
 drivers/net/wireless/rsi/rsi_mgmt.h         |  3 +-
 5 files changed, 56 insertions(+), 30 deletions(-)


base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0


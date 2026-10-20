Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457436;
	b=ge1o2bmob8pok8bBUwhOsaYUaJmFkgckItGkCkBvIpFGIVSLpXiWWQvYEzBUFdMFWTYp
	 Ou/n7lUKefj6V5gT6FY+nMO5ZZjICqhGW5/do00RvxgYCayGEgz5elCXbbdNC61LozkgZ
	 KzUFLACdK/2C/9SfNgzMq/Ofz+bUW51hfu7OpNPQKF9XdfyAdFHwDZfX81xSSSesH0kBV
	 nxFnLsaC+DFL2WuBYmNblR14Oh1S5LD5QVzkSNYeC06v/oSDpqYc8gPWQrsJagWoVCTSl
	 PWylbxVtlyMpiRy+oGJtAqnVDoskjZTG18uV/nIpCWnL4D+Z5VqvxIdLYMzHj5fJHTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QBQ41uNUL7QeVuDF5bJBKPFqA1U4nX2UmaFaXr/UJ0I=;
	b=ggn+ZdC421VLN8Qjz3ir95iLXT66Q/RwjlgEsGHUCpz6WWTwFn019ZVbT8V1c2aWJcjx
	 n4yiGQq8VWqqZ2NTlr2y5Y+rVI1pqfWp1iEiBqwAZjt4OF0BgW4+ga1qmaCRvI3hs0WOw
	 D+6tJgfApeFR2APpJuRI+KZefmZ3/YQXfvcrZw200d9isefVR5JtjUQyOgolGL0WIIIhF
	 L/QYb79fQomB/HcU4IrBl/ymiTdJuImy5Kv60zrVrXSzoBN0oRRuiDFRlxOufr6v4d9jh
	 8s1SU9JcQhkxIYkh2HlJhclYGg1/7tZkRrZPixewET1uZG3FC4ooqORlJPBx3lynsJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xaOBRBmd;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E79606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E79606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xaOBRBmd
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso793545a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792457435; x=1793062235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBQ41uNUL7QeVuDF5bJBKPFqA1U4nX2UmaFaXr/UJ0I=;
        b=xaOBRBmdO+wJXqajcFST5GfWQLqomKnTphjim9GO9GQF4Ks/EKrhhqh7An2Yq0/RQz
         FtS4nXllTReUyPF/UC1+pmHJHMGbmeYDP8blzfke0wSKsRVXo2Q1ARq7RNS/hmYho3eo
         HyzFYdz4zxVtjbeTKWidx/X9DQOgBvkWHxSUNiMNveo6MCPR9cbdkScWGgZ/nXriLxaG
         HM8PaaRGLYQ9Bip/TAruc7dy6KSJeJiZivUV5dXhOqzcrCuw2TkPFpCgFlEcg2DxErHD
         Kq5tfRrDGsZWdMujRtJCm1Ro39gT07sSMfmBYrsKM9rbydoVAO9aRzqBy1SXb3thK8TC
         g6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457435; x=1793062235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBQ41uNUL7QeVuDF5bJBKPFqA1U4nX2UmaFaXr/UJ0I=;
        b=RZpvQ6C1oS4V0aO67oyR/L/eLPHbNdryXmjOw1wNkM7OeUI3L2BURrK9nQvIKez/eW
         2y24w/3mMSggyW6YY6LRuNkrlWWDgh9D+8neYxs+E6gfu4ak/J+CFNRFtBiNRoIDVPMk
         YjuaDKvdGN2Nf678Q8z0MZV4q2Z6DMdRDaNGazD79zlD8k+4l/OEuBx9eqR23SpDAIfp
         PEYcG3V/tTpmJQQNfquxOrohuY/VGAA7eLCwk0prFMrURBC0/ntx66eSOWxpWGVrdgsi
         9frgMFwY05Rzzf3z6dZy3jOvCj1MyvuIbO9H0LN3vVyudlTKjh/cGuoVk0iEzQctQfYQ
         d1YA==
X-Forwarded-Encrypted: i=1; AKwUvBxMUjiYI2gCE0ZMK9n5713krue2l0gNtoIV3gWxV0OxdDLVmlKGrg0fdctYIIiujsJirI3iZusg+FI60AI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgK8utcElwnBId7pKuPrY20PGXG/zXmueRPfdXA6XFHrk/2VJP
	Z49po2ERGiowiosndPfHY4NRpkOBe2xEiW/inbukSJSoKoEFjA5TRtMs0ULm0a4Celc+iXPq25T
	B6rtO
X-Gm-Gg: AYBFou34hSNKVs7r1xHpVis1y2xjqqNa7ZagwaBFD0ihRlsYs9Xdgw8YMFjLDAWxZKq
	i4Q1D95AvU59ddr8sAenzEqxl4MnKHDGgskWnW0ifE4bf+8zIrllTrwWIr/nAFgCxMwkMhP6TLY
	kux4bRtQfljdNOY9NuFNKcl+pBFGMAzgh4eSt0D62SKX7VA1nBf8UdY5JO/D9OCnAemeJEgNZjw
	ckVm6G1Z7brD7/FDKhzxviMvWkCA/pa4o76gLhd949ZmJa+eBAIZnbZ1IJVSZ9qWteQ1DEoEO45
	V0P0i9c8mkuTr6B5gYQtibp9nXhK5eC61SUNsKvVkpKKaP0BGVIm9zamGcAni9sNvnpR3XvbQH8
	wIk6uWatCdIdoxBglQ3C59L9+uQ4AdIFZ+YY9awNqj+f/jssj/r66kd4tGnIF2CRi+pmxACTOx7
	8Eicz2gN2gz4+vEkOTKIhkP7uFtiG020OVWdxMnFSGSiG02psBFOzZR3gBZlQvevT3YUXStU+O1
	TC9FA==
X-Received: by 2002:a17:90a:dfc8:b0:3ad:6738:db14 with SMTP id 98e67ed59e1d1-3ad6738dc0amr599730a91.55.1792457435069;
        Mon, 19 Oct 2026 17:50:35 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm8520499a91.2.2026.10.19.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:50:34 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Aamir Ahmed <elb12345@hotmail.co.uk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 0/3] wifi: nxpwifi: fix the 11AX_CFG response handler
Date: Tue, 20 Oct 2026 09:50:24 +0900
Message-ID: <20261020005027.1105121-1-yhlee@isslab.korea.ac.kr>
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

This supersedes

  [PATCH v3 0/3] wifi: nxpwifi: fix the 11AX_CFG response handler
  <20261016042542.773945-1-yhlee@isslab.korea.ac.kr>

which should be dropped.  Apologies for the churn on v1 to v3; this one is
meant to be the last.

Three fixes in nxpwifi_ret_11ax_cfg() and, for patch 1, its two siblings.
The order matters.  On the base the extension ID is read one byte too far
in, so a correctly formatted capability TLV is never recognised and the
unguarded store patch 1 closes is never reached.  Patch 2 is what makes it
reachable, so patch 1 goes first.

The driver has not appeared in a released kernel, so no patch has a stable
tag.

Changes in v4
- patch 3 selects the destination buffer by band first and validates that
  one, instead of checking both unconditionally.
- the three commit messages are cut down to the issue, the path and the
  fix.

Still open, and not addressed here.  Patch 1 closes the window where the
response path reads curr_cmd->data_buf after nxpwifi_wait_queue_complete()
cleared it, but not the one where it read the field first and holds a
valid pointer in a local while the waiter returns and reuses the frame,
because nxpwifi_process_cmdresp() reads the field without
nxpwifi_cmd_lock and calls the handler outside it.  That is the lifetime
contract between a cancelled command and a late response rather than this
driver's 11ax code, mwifiex is in the same position, and I am not sending
a patch for it.

Testing.  I have no IW61x hardware.  A KUnit harness injects a fabricated
command response into nxpwifi_ret_11ax_cfg() on a KASAN kernel, 12 cases,
each in its own boot, with the TLVs in the wire format the send side of
this command produces; it says nothing about what the firmware emits.  The
base gives 6 ok and 6 not ok with 2 KASAN reports, the base plus patches 1
and 2 gives 6 ok and 6 not ok with 6 reports, and the full series gives 12
ok with none.

Yehyeong Lee (3):
  wifi: nxpwifi: guard the 11ax response handlers against a detached
    command buffer
  wifi: nxpwifi: read the 11AX_CFG extension ID at the right offset
  wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response

 drivers/net/wireless/nxp/nxpwifi/11ax.c | 67 ++++++++++++++++++-------
 1 file changed, 48 insertions(+), 19 deletions(-)


base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
-- 
2.43.0


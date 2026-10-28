Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222597;
	b=AzPq+rgq++ky9WUQ2oOUPi+TBpeo87BdAu4kOFKWEMahjUIGxKlh/tYpR+6SZEQssdol
	 fBEhii9l2gabzkCJ7ZT98Z9AFJplgj9p1zx1H2X/8FTe80xPh1oBrqQTI6bJRd9c6yKt/
	 W5JNRdLxrpxv/JIpLAJVx0GlTkYnBKVnEiJH2bCUlkzyEMNMZbQqPRsFSNe1Nvf/ygnWM
	 k6v05LDZvmEb+vAdJ/48tacUXc8KL0k5q9iz302WVzYK6dRH8P27IcFN+NtsZvyi0xKUh
	 H5+967SmyFw8U0R9uAqY6NX352pbY3Rlu9s2oLGnL7jKTgXusAvYB2uR0aNxe/f6rZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222597;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=H/q3/zf/nmcGLoN5H4ogmMMXauB6rTKmmZVIQA880V8=;
	b=VQKwfqg9F3vTNT85aj8cZ7ei+uGpOyxt/R3BG14aw5vNF1UFzZ2Ii/WqMl9wcPInz7xj
	 4G1UfGuYEcMI/ImY7yX/tmCw5Q2ek3gPyJOjaQ0VgBkrNYtxm181HPYiBOqz0NG/p0uRB
	 aIKPD0muxz2X8HSs4HlaLtekHz4I8gZqjFg5l914d0wYIndh52DjJS1973y59RqbJD7vd
	 Kn8d682WDZ16VswK67Lvg1Xqk6hFQXJHge1gkXnuiK0c/559WhYWPcKaP3AAK//+SXXrG
	 /H+ThZrti+mnyRsNybs0RquSodhh9gO6TyCMUscGw17WQ3H+gHqOKaBnQlHVobzOHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YmtFMaeo;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5AB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YmtFMaeo
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so928489a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222596; x=1793827396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H/q3/zf/nmcGLoN5H4ogmMMXauB6rTKmmZVIQA880V8=;
        b=HLxrrxOfbejnp72aoMknyD5Hk/Bl+euYlAuIYtf8/hY8ll/OivW4J3S3ZFasOtGz3S
         yOha1IT4UC7YtMuEB+yuYj8uWV8GRNR8NzODZPDqLMM+P4SwgoFPzXytHllJo1TIqbaP
         25MdYastAIq7ao7TEMitGVg+H3TDeOl+vLSNg7WSNYdGvZsSdSXWXWyVqjHeTFuN64OQ
         M5NoIvmq6jdgrvlDKn/IAWrnQ4x/ORlUfcmhk2ZqiDCAfmG2TyrWDrdwo3458ZMkjJrg
         ghoCEcGiJBpHEnfNl05rm7+aVnDOVxrvHS2NXfDNhdcsHrajNtvvBDr0s5WkLoqlwYnV
         0Opw==
X-Forwarded-Encrypted: i=1; AKwUvBy7c1D8cO5KmmgovlQR22STZPbgFx3gcZEvCOD4enn6V+aAzrzafw43b4JvTfA2Txz9sVL9Sme7tRNtmng=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOhwgBlDqSFhmrcc0VPO5gozbJC9nOSk1i3JrHJHnjTbYgrYc+
	8A7oiMGoKWCauHLphdi4DvRUtfhjunyjP6K+Z+mz8rXSSK7oKddVp1V8PVl7q4YooaWSXX6y/IT
	GvBVV909ENuNz8/VG5C2cDgjsDQE2kFVINUjXX8ewabYgBzC9hsQmdz4DLVBkDj10VzWM9eq2zy
	p+q4mcXiqvUK7VQbOng/kBaoH+J5wuZqODl0YOxzvcidbB3XtngSj0Ea82sHtj9eCmwLeNgJVdG
	c9UYoI1gd7PHr+tOa7l1nPG
X-Gm-Gg: AYBFou2K+bnVQIbBC3MB5dC9/mogql7JN4vZFJlij6aMmldZQgjg0zv70yParAIK/qN
	DENGPNuOeXMsK8PZE0kaXUSsvTG6CcuVeqpupyNaH6bpUsihsdemCI47MeQ6iplhpydLMES06ih
	rFl6tCqPsdyJhAXi2Wg96R6iXSTJ2mfhZY4U3Imk3+CyW/NOn1dHI8V5IUj8VcuDxzGC6K52577
	Fp4E8AooDLST7puzMF9YnPw9OGxHJTLlJ4BW54IGj4YRPwiTvVMXtcUUSQCjiV5TN7BrZdf9FHt
	Dnrp8iv8twWEhRpu42Wf6fC8q/pAx5J9wJMG329LCJfGfxAGwLtlJ1MsA8IcW4DgPHFNL/mhTkN
	Kn9BK5yUiF6NY69npHsis5YNJRlXYi7mLhRFGg7ha80H5epV4menIdcZZYr8zseT5SsZ/bHHUsk
	vnvwUtpAFJqVxzjJIQxxqAUEuGYoEJWoqfQ2O2K8td
X-Received: by 2002:a17:90b:17c7:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3ae5816ea9fmr2737083a91.17.1793222596104;
        Wed, 28 Oct 2026 14:23:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5799c093sm997414a91.2.2026.10.28.14.23.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:23:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7886e8dfso31428226d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793222594; x=1793827394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/q3/zf/nmcGLoN5H4ogmMMXauB6rTKmmZVIQA880V8=;
        b=YmtFMaeoLqAwQia1pSttjnPgF3mscZpzhguZX46Gpk3eDCvS1xwoN8qjntCpWWiLsw
         IfUGuErNCTY2paypz5U8q0cfBrmZdMu5PdyMmekEoVFlW24BXAaJ/8rsXtTHTO56dEge
         nnagDA4LVbqOF6PxUfnH6e3G0M2u1iqlEwgA8=
X-Forwarded-Encrypted: i=1; AKwUvBzIEO4/c8nu4YjMLXrc8ONb7y7O5LokYBoDshi8PJehEl9mCS4vpLZDynQx280Gagp4P9oyxgnl1s/0slE=@vger.kernel.org
X-Received: by 2002:a05:620a:4106:b0:93f:565f:e40 with SMTP id af79cd13be357-94408d9cd0cmr555383985a.65.1793222594413;
        Wed, 28 Oct 2026 14:23:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:b0:93f:565f:e40 with SMTP id af79cd13be357-94408d9cd0cmr555381685a.65.1793222593993;
        Wed, 28 Oct 2026 14:23:13 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm1368755185a.10.2026.10.28.14.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:23:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 0/5] net: dsa: b53: Preliminary fixes
Date: Wed, 28 Oct 2026 14:23:05 -0700
Message-ID: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series contains fixes to issues reported by Sashiko on the
b53 PCS bug fixes being submitted, and then some more that came from
code review and testing.

Except for issue #2, all of the other issues did trigger in testing and
needed to be corrected.

Changes in v2:

- collected Jonas' R-b tags
- corrected logic in patch #3 to propagate -ENOENT, memset after the
  debug print, translate -ENOSPC to -ENOENT when deleting

Florian Fainelli (5):
  net: dsa: b53: initialize the jumbo frame size register offset
  net: dsa: b53: fix the SRAB grant timeout check
  net: dsa: b53: clear stale state when creating an ARL entry
  net: dsa: b53: reject conflicting mirror destinations
  net: dsa: b53: use the correct override register 2 Gbps bit

 drivers/net/dsa/b53/b53_common.c | 44 ++++++++++++++++++++++----------
 drivers/net/dsa/b53/b53_srab.c   |  2 +-
 2 files changed, 31 insertions(+), 15 deletions(-)

-- 
2.53.0


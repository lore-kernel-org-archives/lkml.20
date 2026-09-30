Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A938E8B9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744605; cv=none; b=UqsLQwbWi82oAzmO9mP81FoTw9vzRZUnuTXGXyOzMGkn5XWrv79wc7ST4ByfFRFWZgFXKuPS8XfvJiBQs7N747nDDCILjjpi4glk78q/RJxpFQITG53uN1Leg4y+wpuxaCzW5lSEwBpgzmCz/x/eXD+gALEDyZIodgnoN7QABH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744605; c=relaxed/simple;
	bh=OMwLDiOjOB1/H5Qk3yiRuT93np3VlMrQ39SNlvAqQeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTZkoCgglsUXDdtk1tK/XBfzr+02GKtNIQd6JRIn4SiSKOMNd+d9X+VGNUoSDP0/hoWXf9mZ1hte2+x127Hq3HUQp/IdzPCfaBz/7ddR+G9QT6UbzgMaf8lYLbCpavGtefugWxsl0vxL4aOChFYGNEIP0bhK5wS3cOPnMz7JQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBNDXMyt; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBNDXMyt"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4709562eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744604; x=1791349404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAeiNx8SHTxJ8mZniOpzlgJX9x6mLwpi/G4jTr7vIVg=;
        b=QBNDXMyt8qu1aQuKfmro+HyWUjOM+7w5zmf83zacInQ2VGq0M8Q9WQoLHsnDjYolGn
         fOgyjc5ALB167iAYfHKCuTtgnvivxPS6oAuEccJNCilU6PYnNGsnwqlKOzhZinZRZ0gD
         3Ek8/4ReVhDstZ5LUNuh/RRfRDQC0OOzIG1zCIyvWq9bzmt8XwGwwKXMC8epeYZC7Zay
         uT2Ha/VFVl68LyGXR30OQuercZ0+pktzs04g39TtWJP9eqr675guvZRDFx48+ndZ5txL
         rb3KPC6bzy6jnt5dp9VQskBggFMnpSyGrTZWW8KlROv9beNjCfO6M8aBpl3o2mOPlt/T
         Fkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744604; x=1791349404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAeiNx8SHTxJ8mZniOpzlgJX9x6mLwpi/G4jTr7vIVg=;
        b=RVucjXpkXZVTSryr5BA32PvvrSSz1Adlb3ERMqOlH3xHrVB5fV0mij5RBVEA2GLzF8
         Xrctohu51mEfQqhVuDrOxjvJaSOOrLHANwtumMvUUf12scsdyRocnrgKqS1baZQbl5zC
         W+DnnZfi/kn+iEbc/PTBCJA7Mw8m5eZckZyRZiNbAVREKo7bi8X33V9aAlV/+5gcY0CR
         eEb1zfQKvabwrpxRXhryxkvibfymLDbcVTJLjw1dspCxnTW15Se1SEH1oG2IwCMqAEOd
         cwOsmGTSm/IrZ0KrwBgWsXl1qc9DU1lGmFzXe1vmc42MbU3uuof+EDFUmTHXoNThqkmH
         8abA==
X-Forwarded-Encrypted: i=1; AKwUvBxu5W+QD/ycs5blMJkqHZ40mvui0i9faVysfap3xbCEAjaDAXmvo2SXWIJqSx8O3kcemDaVttuFYnTY/hc=@vger.kernel.org
X-Gm-Message-State: AFuF++mVoqQqyzFb6BblOa1u7S8HMWhwrvGwDRuO6/2vbhxDRBRbtZ89
	i5dGZN9s00xnX6ai7Of8NI4C7+9TGLiKmHezMvN5PJFEAnAmScSe7glc
X-Gm-Gg: AYBFou2DVno3/2hiZGKTbnQtLacXFrQ6iK/zYvlZTRKzydDi1Cxjzz7cXNE7QSqbh7m
	P0PgFduAdqoaNIrLkTjs1vyAYf6/LUgya6meRytSBDWsrdemSKbQNRGYUqcvCsPIiROS86XVKIH
	XKQCxkg9eW3LF1vsYHWtPBDQNoePoufJ5ftGzQ6JNEiaEjR2s0DLOylyYHRRQnx7NOOL/KQJ7XS
	BkG4WCgykg/HtT8+qJJ7AlCcbrS4nZ/odWZ0XPQgStq9X2r8Vmdoalfj4uqZN4yet2eUB8gaTt2
	0lxQ/2m/l+hZvoPkKwucm67Tcx+TNO96rJ2ultFifZ5qamjbza3UWsS5uY3b2LbAPao2X3k7sRv
	rvqYck3wmI3jX7LeVgNzPstai4ZewwoTluBI5PZUn3x3HEpvcAO8OHnbwgCM80spYfwttpkw4wf
	ZGGOTgzEQFPMIqAGLvjmlSJ3eSvAL2jwrkcps3fEyrd2gazLCaFvOiUPZQ3yQ4
X-Received: by 2002:a05:7301:540e:b0:34b:34cc:bcf9 with SMTP id 5a478bee46e88-34cd90763ddmr495416eec.3.1790744598988;
        Tue, 29 Sep 2026 22:03:18 -0700 (PDT)
Received: from fox.. ([43.242.224.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a63ac9sm772160eec.10.2026.09.29.22.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:03:18 -0700 (PDT)
From: Roshan Kumar <roshaen09@gmail.com>
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	chopps@labn.net,
	linux-kernel@vger.kernel.org,
	lilly@aronleigh.au,
	shubham@octane.security,
	gio@octane.security,
	robert@octane.security,
	paolo@octane.security,
	Roshan Kumar <roshaen09@gmail.com>
Subject: [PATCH net v3 0/2] xfrm: iptfs: fix queued receive state lifetime
Date: Wed, 30 Sep 2026 10:33:05 +0530
Message-ID: <20260930050307.1978654-1-roshaen09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IP-TFS can retain received skbs in its reorder window and reassembly state.
Two lifetime problems interact in these paths: the shared drop timer
does not track the two states independently, and retained skbs do not
keep their input net_device alive.

Patch 1 gives reassembly and reorder state separate deadlines and
always arms their shared timer for the earliest one. Patch 2 holds a
device reference for every retained skb until ordered processing or
destruction is complete.

The unpatched base reproduces the device use-after-free under KASAN.
The final series passes the reorder, reassembly, SA deletion/expiry,
clean teardown, and unprivileged user-namespace regression cases,
including a timer-overlap test for stale deadlines.

Testing on x86-64 at the base commit plus this series:
- KASAN + NET_DEV_REFCNT_TRACKER: the 10-case lifecycle matrix passed on
  both the regular and lockdep/RCU-debug kernels;
- stale-deadline overlap regression: 5.155 second close delay (minimum 4s);
- runt-created reassembly regression: 5.152 second close delay
  (minimum 4s);
- PREEMPT=full, lockdep, RCU, atomic-sleep, debug-object, and ref-tracker
  scans were clean;
- GCC 13.3 and Clang 18.1 W=1 object builds passed;
- x86-32 and arm64 cross-compiled W=1 object builds passed;
- allnoconfig W=1 full build passed;
- allmodconfig and allyesconfig W=1 xfrm_iptfs.o builds passed. The
  full builds stop on the same unrelated lockdep_proc.c and callthunks.c
  GCC diagnostics reproduced on the unpatched base.

Changes in v3:
- split the shared-timer correction into a prerequisite patch;
- keep the reassembly reference through xfrm_input();
- track reassembly and reorder deadlines independently and arm runt-created
  reassembly;
- cover all reorder, completion, abort, timeout, and destruction paths;
- use netdev_hold()/netdev_put() and document reference ownership;
- remove the incorrect bounded-lifetime claim and self Reported-by trailer;
- add the required AI-assistance disclosure.

Changes in v2:
- add reassembly queue coverage and state-destruction cleanup;
- add the Fixes tag and independent reporting team credit.

Roshan Kumar (2):
  xfrm: iptfs: track independent drop deadlines
  xfrm: iptfs: hold a device reference while packets are queued

 net/xfrm/xfrm_iptfs.c | 151 ++++++++++++++++++++++++++++++------------
 1 file changed, 108 insertions(+), 43 deletions(-)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.43.0

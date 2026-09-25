Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E53E1723
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363819; cv=none; b=jN7URqgk7XBR3gOjCSnHjZSKE9U2zZe1LFhAULYCsglk+wLtF4tulXjhzrmv09iwAgRiguyPvmcthINoELHopFU75EVPWv5Il/9UPbMoPfZD64/0RX+iBtXJvrsucqqRrU6K06at0aYNsXVNhUL0BFhL0ONHHwdcXENFNabj1Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363819; c=relaxed/simple;
	bh=LmDohTXcxb9m7JrOrmG+Y32/Ci8WQptcCIicn5s+8/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JF0RVGe2pRx+1UStu1/32btJJXkVYT+O5bI4Y8r7BZIfjkAVxNIFor+B5qTCoCJzR+4oPrXdr8m3dSTianYiNtJl087AXeLHBH33oHXraf2rLzPgArVnFEjm7ko6FGPh2B9I4Cc6Es3ZgcybufqGAJb7kxm06hwWxPpLhO11euY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUVYScKV; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUVYScKV"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-9142e0b0668so13887286d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363816; x=1790968616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8eF+kTesN6ABi4qFLszfBvuUIZqOPzgqacuEmXgYpA=;
        b=rUVYScKVOkQ+m70+eLmvAMIB/ImF2v73gQ9pEpToYLj5QwB7jotM6uUW/o/HTBh0KU
         Fy4vOjwkEzR0+LcVIGPIHkAbSGlD/2RTxW9QFvRTwmnneY9RY34nNVVUVfZwLEOlh0SS
         9jCOvalxTp6xfiNqOSUq8jGhVqoJvN3UXPC53QFmxwVbrLUZ2kCATrcbxGMEko35A34v
         I0xQboEShNyQYpLToACbCscxBG2HlU7ouUxssWLCdSzLR/uVxF688DvtaG+L8NHvaCwX
         LCu7+LKTaH/pvC9RM5TxsNofZ+WCXCZOH6ADI8kkfwG6UhtLtKy5ueD89wKjhhn9fjLj
         OwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363816; x=1790968616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8eF+kTesN6ABi4qFLszfBvuUIZqOPzgqacuEmXgYpA=;
        b=ny8AuJB+G1A3771tKk15cvj1a9JUbVvqXEE4cqWrXg16QC5SdMRFC9ihq8e+P+Q1ne
         YYf4XwW3F+aZ+cXNL1pGtjzjOr1Ylu/cKpm6TBhhDhOGCpj35S5pyO3Pt2gbmxfo+a2S
         hCNyNz3wbU6sTDPZFGnA9fV/BlM/1MRjr6iT6ytpK/XGd/xCugUMITtLsYedqb1LYGA3
         pP9gL/HHpmyrfmzYM56NtrrPzI0NxDgWVEjTIzMRuSqLYJ6/U7toP590WXv4Vsar7ZOd
         3ibOWMI879ZJTHC/kd2TjGfKh+s5NlTJlAwMfYWQ5bBtR7kPGiwROKOgg9pLQE6+Ry/6
         pZuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYSgttpKLENYQBNKpmdvsKwE4LzZsldCwFaFriU43/BUO5nRb3iM24Kdo3RKqgKxCNIgP480wEYwurMEc=@vger.kernel.org
X-Gm-Message-State: AFuF++mSCM3vjZNFySmeC/sJNG1iwRD50cHywFoAJeCoa8p51AItZgvY
	fPxNvrF2tnYKzhApmVkL3iZBJ1pJLfQaRbk0RVq8UuHqyWnCPnd/vRA=
X-Gm-Gg: AYBFou3WwrgZvOQNc7kecr6m8PYwY+sWcC4QLbUg/DWNSuQzmTHgr/QILzsyuMlncn8
	FdUPRnFLUp68ghNPN6tBfP/Foddjmng8JNep+HP8Nlzdz2/UoRhuJhwGb586irmPHCxvnblduVA
	JCYAlaJj7Lvce/euKy1nP7UIJbACoO4iObgYJTWew0u00/MvY7YTRjqBeu3Wco41tIHiXi+m2Yb
	Hsv9OEwgF0Q2D7hk0dpKinfsxyxeLv1ki6SMxa86kqlQ98xPWwoyzaVSf1lr2zTrtLB9FKKbQ2w
	Oton0mlBsG9FGEz/RdrUP3wgbfuLgqKEbqhAiNrsE/JZ4qbFeRLagbiSSJP40E4q5qB19ORg21F
	DNdx4iqbUkptw9dBaytgjlLUGcoQ+NWoEJleXFev7C+WVa2QkISCIs1oJGY4gWsVIV6IrW8paXn
	H5QniwiKVR6MhllCW4MnJWQzxHcpKQNPxCVY7XjAXrpTQTkOwrNN2KAmunLNjIa6XXl92ZkP1cf
	oUos1t0xitxb0OnuixqAuWUbUhVmp/rVpqihUQ2knDGjrkWmUpkdBWAdU92xYYfA0M9wFxmlp+e
	Wea3UzbWJ5o48ehc9nP82c8WypMf
X-Received: by 2002:a05:6214:4004:b0:912:5836:82cf with SMTP id 6a1803df08f44-9142f797f41mr59798056d6.27.1790363816086;
        Fri, 25 Sep 2026 12:16:56 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a24c4sm24142666d6.6.2026.09.25.12.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:16:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: venus: fix HFI teardown races
Date: Fri, 25 Sep 2026 15:16:51 -0400
Message-ID: <20260925191653.3144006-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Changes in v3:
- Send through git send-email over SMTP. The v2 cover letter incorrectly
  said git send-email was used; v2 was sent through the Gmail API, which
  still wrapped the diff --git lines before delivery.
- No code changes.

Changes in v2:
- Regenerated the patch files with git format-patch after the v1 mail
  delivery wrapped the diff --git lines. No code changes.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580161;
	b=UyEYnkEuXf+ZX8CKfuLCdpxtRXFHTT+2qQOwHqzTcgecg2xr45AgL4SJbN+otuAJ0eX2
	 d1qt5ADbPjASzR10xDBoV0NCvJwwJoH/IwIGDzmObSbjfYjBLotMi1sMtdeiP9Ak0w4Kk
	 jMfr6skpOtgoQfxAJqgRWEeZ7nm4GRnK5it4LPtjES/oiQA2OSqmNGYiSVjWMoOpq2E8c
	 UkDnhh5MCWD/HM3g1DQQa2CuH3zV9XZmPCM02CFUtfYYLZqrc7ykqGnmWvubj4J8KnFP+
	 GneE2Z1Kt21YY42hCCWE9qQiSosb39gveu+4bW8Dy2N/EVfUj5jYFDjTnyifftsvrvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
	b=3+iD98n7sl8sTeMjW2Z9oLpVUsVzeoevP2yZhu6de3HExApNiZJ8+3cj17/cFWmAaazf
	 kUs9MvSKjhqy78F/3Gv6VBdMGP79Q3ynRwzVqDsZ/D65txRj+2A8/mWnp6/1z3GSu5XDQ
	 i87oAPiAnykKLB4SwoRCf2TQfLQgNVMh01HJbr/jGu6kmWEPhmOXqLRDgSFdVrctiRyUR
	 oMHVGUyZlTp09tfwT5LWpgVZKVCcoovzZazR5vhDC2WREdAvfwSeBtYqGZ1E6vvaZNkNb
	 meGvUJtNcybLnbnvQtHbjMlU/dyxsjLirqEV4xd+zN5ztGqNmw1vySyuSKfqrj8QKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5Wfyz1+;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99945606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99945606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5Wfyz1+
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso8239775e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794580159; x=1795184959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
        b=p5Wfyz1+aOhdni0i8oRYNdeaB/FihhXMOA/hsI0gZ6rbVCzONfqA9Xl9iYkcY1FwWN
         RLBzMAMRG/aZMRBqdCLYCentT0hGBVfCq7AGv2f9dtZOpvi01PBQFt7y4NmqQHXL6poe
         SYD9Mhh1eE/kMR2O0R4HeDtWvCNKNuNjYtwLyHhj4JKqIMumA8Wcv2JILtn25HIUOQtE
         xNBlqCwRGvvUpp3konTq9sYZFr6+sMFW5grY8x13KBYYqq9en3famQyQRQ4/gSmrmF4g
         4C6UUdLpk8rc+wwiXI10YkS1lSVwZvZlVVb/vSCo2ZPvAVD/TBjwc1EBWuaM6IqAePYd
         X9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580159; x=1795184959;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
        b=sOoW909PmTf0Prg/TmKn17iAqXlxHHxK/bW1vrgxECTxkiZLqwpbpezPK5OGTQAjN8
         QALqHAa12ZCpStI9raGwQheKyxZTTUIYd9UMnsV/yBBDZdUxNFtU5T1CPTfLJ0OWZtgm
         KLWcm3PBOKGMWfS5frr1GaN2+INd4bpMVlv63A+EnEVYh8q83cFlGQ/6VLcxKG13K5b7
         1IlN8dIWDejaQe/fcvMSAbu5pEVSduI+EqAk8pKRRm4Cqv614UjpYu+WeVhKUeKTQ1XL
         LhzEyzdnGPJe0eDum7vRPOde+7jeeU9a2Xxu7j/n4mJ75VNevBklQPmqf+lXmwR9IUiS
         6Q0Q==
X-Gm-Message-State: APuU4Z+XqsZAGtzTxHZLQ5LiOhUus9R8JMtCNUrZKrOhxEvofWUx+Xy4
	RsCV9Naa6QUbCdPBSOIe81gBOX7DYfCYf+vkaLF29tsz/Zc4HfpT+esAkAC4KVvpUX14gU1c0jc
	1AFZzkZ/D/oImF6u+LU5TPq5wED4gKOm5ol7eRaQAslKsBJWCvILzv9s1kG+hg5OR8I1FTKNk/T
	KNUe+11xN72M9kA4/dmRW6FxY9Er1EQAfPvxVkkadRpn3Rq1QH2i89Y3Y=
X-Received: from wmg12.prod.google.com ([2002:a05:600c:22cc:b0:4a1:989a:a866])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5852:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb55a832d4mr36306945e9.14.1794580158523;
 Fri, 13 Nov 2026 06:29:18 -0800 (PST)
Date: Fri, 13 Nov 2026 14:29:08 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113142910.3477757-1-smostafa@google.com>
Subject: [PATCH v3 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform [1]
to assign the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

[1] https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.com/

Changes in v3:
v2: https://lore.kernel.org/all/20261023101536.3965344-1-smostafa@google.com/
- Rebase on 7.4-rc1
- Collect Bartosz Rb

Changes in v2:
v1: https://lore.kernel.org/all/20261020180804.140766-1-smostafa@google.com/
- Collect Frank Rb
- Drop call to pm_runtime_dont_use_autosuspend()

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.56.0.611.g1030f0b940-goog


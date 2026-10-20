Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520351;
	b=oITx2dFpjV3hxj1YSnqiJScb09/nxDRxWUzA+QKWwSwJf/ZjnP1r5RYan4E8pYYPrhuR
	 SGRk+6ejwoHKpqpOwIRPvTWurOKX7OjIADwattud4F9drOjJyaKOdlpNv6wMAAHPADuXO
	 9f7z4TdjCSjNOnhyzShCVyOSBh7bRyINo9eUcs/hgCHv8tjHbMUJ25vOdTYHIpKdPSGm8
	 6Nv870mhq+JcZWleDvNKxK/IjaTw/UNXiNyUAIMkMfe3hyP3DPXWul56v85ZUNX8qFeFN
	 K7D/dq3AW7dMQj25zdpkdqYq+7LqhkiCvuZblUe6dgJrKw1z87c8PKyrlpACQSWHE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
	b=rlDnzf5gUC7WGplBjhj18lj2sEu2zUPhkfGYrluOTi3xWJnbYjK+M5d4CyNuEsWQ9eta
	 +T6DU0LTrgZiZF17+DspCIEsXP9iOzoeXDiPgUUzd3v9x85tD83jtVAK1d/O4w+vjkB4j
	 oIKbteJBdHF1TJq34NXIVxeo9ZT/BjJPWW6D5oixfqCy3h3pj+1q+KXeiFo6G2JzRQVob
	 OKDjbN84uKZgV3QT863aYc8xC7wXXCOi9LmIw0PeT6Ulf9UmefDlWzJaE3tyPd+sAazpA
	 vPZX+gZSHBAQYQpkMSfrfd9Z5FoYXreCXFd1rkDBIXEw2wtHcbaDoeqqILLVBJ8bxCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bBHb6tVs;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3597160A2615
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3597160A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bBHb6tVs
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so28502175e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520350; x=1793125150; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
        b=bBHb6tVsiTYjAP6Ij5YjPDj3I4ruTc9GK8tSeCPSpdo7nWUVzqR4z+8l/37jfWlQ53
         FgLO7X5rua130E9MfcR32Sv6P3DicMlApPBL0HdBZtfFctiojChV6K0+PF8R0QAho2gt
         NpDB8L134NmHXpMtlUNkYMwmlIVbnPeQwI51QqKCvOKwxZeBOJV/LwFC0yV2CFXfBJAM
         uWz/umTrIADSM87328fzihtMCtEGma7g0v3aCR6rhKCYqsVdu8e5rUn9ttPlGX+kEPXu
         0oh7MPqpvRIq19cytldPJGZ6lGWecN7wbg0/cDgCM/hsB0bV9dQIqg4xe7trZvXy41I1
         q+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520350; x=1793125150;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCCi79U62TfjoHNQ5t2HSmD5JiYlUlHZEpd26/8l3k0=;
        b=zQjoln97X27mgk+d5aHan1/tKV0IsFeHizRjf72DxY75A94rbyo9fWGwsJyWi8KSXd
         nrJtv/BPeoKrC6datFBvgjlrj3kDDPXidAnK3Wuv3L5yiYZTig9ZznSTVqQg2GJRi0Ui
         zHOLTfDgsab8cn98FLEiu7K0Yw6K68XhbFE6eIWGFntLcfvrnBlJiX/bps1wnxWln1fm
         kp9mNgnKOPaBRdXC8ReVSLiiGzAVLxQfULBKaxqmrWMjwQhBiOoDS1q+sa6OLlBwQTNR
         6dcMNvyVrw6Fawq5GPuV4To/6Y64fEtRY7u8UYldBnfzgoZsNVQTPPi8tH2rcyRkzSoW
         bJeg==
X-Gm-Message-State: AFq9FYIyvOXQNwwNXbVvhWnWZ1SG7/eEWfsJXb+AJ34S4PhWNtmWjGKu
	b+HyFd2gjT2UAlkGNr15HbjM81GCao01NgFRmNxqUCrDyWx0GoBTnfvVwTEWhAGmT+r7mmv0tR2
	g224WSZHcjTldqA/yQ4y6J0Gz4mrQUTS+wtvKk1LtxngfPyxCbL7hm9hxOC1tlQIobAdlJ5A7St
	H4EIcSnnDpHJRwfB9FYCj9lEFtyadY0j9fSm2Kv2GXbZbRuL6pBVhxRpk=
X-Received: from wrzq5.prod.google.com ([2002:a05:6000:1365:b0:48d:ed96:9428])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr249704165e9.0.1792520348399;
 Tue, 20 Oct 2026 11:19:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:01 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-1-smostafa@google.com>
Subject: [PATCH 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
to assing the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

This patches apply on linux-next.

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog


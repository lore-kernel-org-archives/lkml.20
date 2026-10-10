Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2914381E86
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673093; cv=none; b=QcOIaJJOtaH3ktXiSINdOaKnZ1ucFTjbk7a8/lCeHYnI229lXR5ShYMlDxG/eBZpJrLgslFuc8NzqijYxi/n4CdKxF+4JcPhk6WsjfbC+jUMYMwMWGaUwvMYBmPw301rBIRueey32y1HeCf/msbwWYqE6EYCp5R5gslATJEbk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673093; c=relaxed/simple;
	bh=WFPbXKjO6TLw12mAP6vLlTcCrT1MH/2+rxFy3tIZpkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ukZq8dcZcNlgzVLX7g7PJTCWLiabkEQGFRcnIjHTyZvVE6pZXDKSxmqWtZ7U9+BGFugPiLmbJvvAyIkxGO6Dn9NeaM0n+KKTy0Wo7ztVnubikIBxP6YLmHUtbd3LT4fvbgU2VjWWV70NJp24TMXXKfC8k69xLTpZoouYqZIBSyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=wv+b3+xN; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="wv+b3+xN"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91986c5cb75so12047976d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791673090; x=1792277890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ai5X7JtaQUacTHU9H9PAvi537MjNeFiGt6V5Xj0ZZcU=;
        b=wv+b3+xNJKlrQ+8x9nmS74tCCVBXCCHJH368Tq0P2Y+MT84a8snSg8hdM2ofaFhju4
         qHcsuxMlst3gN6ucGocB6G5CufMRL3BnGbBn95Usuo6291zDV9UxACPcbuHezi3f+0We
         bTheggQxM3Aiq+nmuaidL9x7VlOD066oKAd1ALLVzXUv15i1NgaVS8r8bCeLLRhvFkDu
         dd+vMYRETBS/KbONsFr6PDuijIdt9F/4jeUvDad/C56Z9hmFvxKEqlBBzweyf9n9STYA
         QCowlnmo9MHDgJOjDs2vdnre+VxtsNQBvVakdXfiIGU1IR5HfkOenFQFa/sWCHePYqwM
         4B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791673090; x=1792277890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ai5X7JtaQUacTHU9H9PAvi537MjNeFiGt6V5Xj0ZZcU=;
        b=pwNSQMZJLawJP0Ctg2t4tIvlbgjWvEMo1i+Yd2r28WLnMSXNUj77BsNJ3t1dqTNB6M
         vmlRjG8vJs5b7Hy9+GOr9Gk9ximqzMOXa91Vtd16jFobvaa/tkleXC9N67ohiRwq5fYv
         8ikOrXC5//JormurrjgG/WG1+Iys5n91bkoBT6CEx3Hmv8NdnO6fbM60CR1STIYlTR2O
         BcaWbZOaLpsdwTMPfU/4UdZJrml2GGcpv4NthxjhfHhgXrL8W9NeP/1jVqHEmwuiKLuj
         JabhFWgaqI+6dHFh+IKZbm/AT2dyjm+ll1o0JDsftS+Na5GUzWVFp8MKexFojzNUGeBB
         +Opw==
X-Forwarded-Encrypted: i=1; AKwUvBzoJEPViV/M8AMXVezSL7JKdvd4+c9k8NRi9CeOD9tD09T+DUVivvsxA3e7pOX2h4XBae7urxT/faaeTQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLup1MBTwRD8lG4ffrKD0xZHmlOzMc6uWbqkjxKDVVMZi5NFeDL
	/gx+ANaRQgJCb4hHSYhETdsx5eh5taxkXaEZiMETr3Y4md3qRjpEucN5RUJEvHpF640kw56NN8F
	W6wq0jZQ=
X-Gm-Gg: AYBFou0gEp/kl2kDD2fBuyrBcDV8H9EjKBzP1IK5u9E7kk3q7EmvupY8Ip0T/XcnwQJ
	91cPmOrEVdPb4fRbbUtRu+N8mU7uyF41EdDJvcJgoY5NSJU5fMY3hq/rPV04rTKk0M2hlW6L4Ll
	h3aaUpgVHoHB49R0LUG8pC3HctLydMNj4RAttmE9PmMNoKHaaj2Gf2ENosj0M3NByvp/3FXwqcW
	xbZWZSQ++qeRojBZA4PGRxdtHfUhqE2uuYOdu0nb1O+FIIirY3wtpgFlGa5TrNo9vh/nJ2otqVP
	90TCPRe/eDCca2RoqeyfDUv+t6KMoajwwDa9Csm7qyRJu3mDZMlWeahFd69MAbBEckxUNOVcR15
	8UwdPyzei4P59J2936DOM6bYgQkxsc5ErsbC5a9L/qMpe8INfBn1ZnQcxYIAuhRZejYVR5R5CJx
	Dh0xXkbKGEcDaeGbglTAc0G0VdT79VXttTWZ1ftr3Ggfr0bk4UYiCpFa80qxvUA5dDdkZeVvx0s
	8hqjaDB2ZNFMqZZVJEtH0Kaj+ptwAEKgKvimiM9TA==
X-Received: by 2002:a05:6214:4906:b0:917:8b9f:d62 with SMTP id 6a1803df08f44-91b554f1babmr117225666d6.18.1791673090373;
        Sat, 10 Oct 2026 15:58:10 -0700 (PDT)
Received: from boomzilla (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55092ca8sm55498256d6.37.2026.10.10.15.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 15:58:09 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH v3 0/2] Input: discard pre-registration events and test state seeding
Date: Sat, 10 Oct 2026 18:58:06 -0400
Message-ID: <20261010225808.36404-1-kabel@voidship.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series prevents input handlers from receiving buffered initialization
events after device registration. On a ThinkPad T14 Gen 6, a later LED
update flushed a stale SW_RFKILL_ALL event seeded by thinkpad_acpi.
The fix drops the pending events and their timestamp before handlers
attach, while retaining the seeded switch and absolute-axis state.

Patch 1 contains the runtime fix. Patch 2 adds KUnit coverage for
registration with and without event-buffer resizing. The test uses a
virtual SW_DOCK device and performs no real radio operations.

Tested on mainline 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0:
 - V3 with both patches: all six input-core KUnit tests pass under UML,
   with CONFIG_PROVE_LOCKING and CONFIG_DEBUG_SPINLOCK enabled. No
   compiler warnings or lockdep diagnostics were reported.
 - The unchanged tests previously failed against the unmodified input
   core: four passed and two failed. The non-resizing case replayed one
   stale switch event; both cases retained the initialization timestamp.

Earlier versions using a scoped spinlock guard were also tested with
QEMU/KVM on Arch 7.2.7 and on the ThinkPad. V3 uses the same underlying
lock/unlock operations but has not been rerun on physical hardware.

AI assistance: OpenAI Codex assisted source analysis, the fix, regression
tests and this text. The submitter performed the physical hardware
comparisons.

Previous version:
 Message-ID: <20261010191033.23577-1-kabel@voidship.net>
Review addressed:
 Message-ID: <sashiko-outbox-166847@kernel.org>

Changes in v3:
 - Use an explicit spin_lock_irq()/spin_unlock_irq() pair instead of
   adding scoped cleanup to the goto-based registration path.
 - Include the spinlock declarations directly.
 - Patch 2 is unchanged from v2.

Changes in v2:
 - Check absinfo allocation before test event seeding.
 - Unregister the test handler before unregistering its device.

Karlos Abel (2):
  Input: discard pre-registration events before attaching handlers
  Input: test state seeding across device registration

 drivers/input/input.c            |   7 ++
 drivers/input/tests/input_test.c | 171 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 178 insertions(+)

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0

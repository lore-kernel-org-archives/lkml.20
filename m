Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461693;
	b=0mTTWk2+TJG2izXep6WzRqgS5HjepukvGlCDRl6dscsskAaDE1auYvEAbMgmCpxC4aOs
	 4QnOmiWrdbmFS2RH7hVEn4thEA8vaPP42GMaa3s7+psrWiVxVRSflqgv1hVWr9cGBqCZp
	 x3mXH/OrWP2qfNq8xTB2lsGW/azZ/EYipEX1kJiRgpk854rEERKqh6akDEOc/An3h97MN
	 pAnNQXVCdNaUak6vgbpiDHJ+Di5+K2/YuR5MX0YLK15pyx6VwDLqe2GOp3aj3LlbeCAT5
	 +sJDq2KRSauymXGJ2dO5gkSz0Vs6FOmUQ2JPFWyCDj5epySUZQvMzdiZ6U2rr7IETRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZBzb0jWFuu4WC1vXCF6cW6GE7gHM+sCU4Tmo420Ip/c=;
	b=c/zTKA1E1MnszF80Wrh6RHiKxAFdJI1KNoBM3UBVrVu48VOtQIBWr+AT9aGubT/D4UBP
	 esemkJ91lplLoQWrjxZfRjuoaMN0GOAYEHIcCdaFdm6JLv2gX4+fPug1AKM/qIl8qWDET
	 6x1fffNwkqyZANDbBIEB/zWg8p8IvYIuJLScKTw1tpKnXZJE3kG40yJk4kdjXwy0ztdZO
	 xfC2arEtkB3qD+Ir4Ly9jKKRaB8YwpD1OZvuX3RXSlmzRzvDz/GCmFO+Z7dbGQwmQ6OEW
	 gVHXbeEFeyXLhj8Q+YWHD9N9eq36BFdkzeMTBS5VWuV3sKH+7ujWcFT4ucGUpV6Jyzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKLyEyvl;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285AC606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EKLyEyvl
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so5941727c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461692; x=1795066492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZBzb0jWFuu4WC1vXCF6cW6GE7gHM+sCU4Tmo420Ip/c=;
        b=EKLyEyvlzMKSq6OEIIQREfxshLeZnru40IjQZm2aIj1zYNJZARALaU5lfOvdaOuQ/+
         s3D4BNuqsfUo7HUW1p/H93MshLd+ofXu/Onr/ckGkw/DkFWziumdVNwFrf/Mwyp9B871
         vXdGkZVtI936EzjXpH9JPe3TLoz+PioUyyA0kNdfhK9I+9vrSTbPPI1OeJQR6yIYrmbR
         Q/Kut/BV0+GvsD9JHH/7O6UeGnR484jCWrKwFxGK8zYz5Uc4fq5RNkDuQ7a39uHSukh7
         5PQ6kTV0j+VGp5VFkErFaAGEKAq4jul6YcthGobHE11aDzOq/zxk1EP8TjrCddivdi8x
         fHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461692; x=1795066492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBzb0jWFuu4WC1vXCF6cW6GE7gHM+sCU4Tmo420Ip/c=;
        b=RDWTPfeLf/XR8fr5EAkW8ey/EfD0xp1xFIl7DGSNonuiCBOWVvCdEdNHL4g3skrs78
         OOUL+7t1aLQpktLC5nwym0fEdqilVWs6DnXY1K8356YfbL74mo1aMMNnXwh+yz9yBCzD
         I+XuBs6nW9UeVx4OuMJJCJSK4jPNZbadCxgsqxVEAtbFQo9AJBFNLKnCek+j4ACVw6Wd
         sQrYvQAkVMo7OW/ZFqcXC/YKpxrd0qAIYhwpJ5dy/HrGC3ZEEUq02SHR0YXzyiUHycgH
         BEIARTaqtP/rcVr2Pmv9jtlNtsXCiuwKvGuO/6jo6wT/qUmX3GiDtDPRRIwR6DdRmcPg
         GNkg==
X-Forwarded-Encrypted: i=1; AL+hErGhbgU99F6gw83VpJN0bS89S1EL407iUA3Neunki6v3k/RNy/ob8tJ34QBimseq8LBuklioS5gIARB/6IE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g6k9gjc/8x4atO2REakP6QPflvvUN2E17vRca2Mr9UtpB6i/t
	KBLhUnrAx9d6tl6CeGMTIrNFZlQlAac4RKjyuTOM4B6Vozw7wSqWrUZw
X-Gm-Gg: AYBFou24tpt9cX+PWw3JpbwqNVbzoBDToA3+OC3BXhWx6foaJbu97Y0qp6/gf11tyyS
	VGPKmV09OALCNLwue5XLidYBGMBE6Wy3z1+GxV0D0tCeK2SvUsdLTEDto7ZUupJTPZMbwf1uXu0
	gPL+9FBpOSoa8diyyE4YCQr4r+uBRfilGMWtw1XOrKVL3tFhsJmtuMTpjW5jWswchxtY8vq7/S7
	ZdI9t3+Lko+kHJUMIMa8YsamArduPp0QRLEd58RXZsyvFDPQnEFLzUOGWFGyGfPXmon8xTjcY44
	2kEQD2Ml7gSJ/2ChvJJ1Xtg61ayq88K/VOoqcYs3WWwq1PpykqXcuLEKjUyEWRiCd62BtowQHBI
	HR2ogIN+lPH7mDctk7CooIaSeXSsNhZ5ZcR9979gROFGHYQ/k1wLscXsgt0fpresafY4ce4rPTr
	r3mA5RJ4BmG3mzEBw94kyqLt/VLg+qi2CcHo+z95jjniuqTLbx+TqnScRAuI2QUj/yMgBn1tDce
	tlcFvADS2kld+x+rCDWH49cNZQIaN1QZMzYdzzaecblwukNhK0Mulw78rhbzne/44bSlC7WvQP9
	gRoi0TFaIEkOdaMngUNvuygYWKPz+UyTG3HnKP1PSydGVGzdm6EezSYLNkLhGDrB+es8o5xTara
	60Lzq6pTjnx9EYpgfa/EeYQ9AZpgjAgk4aSymGJGlsIbBY8pHs9Uc2NbrB9IpOxv9q64t
X-Received: by 2002:a05:7022:b0c5:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b3c27a7bc3mr2652841c88.10.1794461692054;
        Wed, 11 Nov 2026 21:34:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:51 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v29 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 14:34:29 +0900
Message-ID: <20261112053446.73504-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
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

This resends v28 in full using mynameisjune111@gmail.com for every
message. There are no code or patch-description changes from v28; the
existing human DCO trailers are retained.

The v28 documentation patch 14 was rejected by Gmail. Sending that
message through my Workspace account made it available on Lore, but
Sashiko grouped it separately from the other sixteen patches. This
revision sends the complete series with one From address.

Previous version:

https://lore.kernel.org/linux-sound/20261112043516.37010-1-mynameisjune111@gmail.com/T/

The following describes the changes and validation already included in
v28.

This replaces v27 in full. Apply all seventeen patches directly to base
commit a4311e9447bbb219044db38897f95be112f46a8a. The previous public
version is at:

https://lore.kernel.org/linux-sound/20261112004704.49758-1-mynameisjune111@gmail.com/T/

Changes since v27 are confined to patch 12. The other patch diffs are
unchanged.

I reproduced both capture findings from the Sashiko review. If request
N+1 completed before N, RESET could leave N+1's already completed
payload eligible for later delivery. After an external XRUN, rejecting N
also left N+1 buffered until generation cleanup. PREPARE cleared that
state in the control test, so this does not establish a permanent
recovery failure.

RESET now marks valid completed payloads present at the pointer
observation as discarded while retaining their ordered placeholders.
This lets the commit sequence advance when older requests return.
Transport-owned requests and data arriving after the observation remain
eligible to commit. Repeated RESET preserves the discard, and invalid
response status still reports XRUN. Rejected completions also release
returned buffered entries without resetting the sequence of requests
still owned by the transport.

The failed native PAUSE path previously reopened the queue with the STOP
quiet boundary and capture_stopping flag still set. A running stream
could then accept an empty completion without the normal XRUN check.
Rollback now restores the prior flags under the substream lock and
checks the reset epoch before reopening admission.

ARM64 QEMU tests use the actual driver functions with test-only request
ordering and STOP allocation-failure injection. The v27 baseline fails
eight affected assertions; the candidate passes all thirteen assertions,
including normal reordering, post-observation delivery, invalid status,
and STOP empty-tail controls. The running-observation test invokes the
actual pointer-observation helper. Full RUNNING RESET ioctls are covered
separately by the production regression.

The production driver module was built separately without those hooks.
Its ARM64 W=1 build and eight QEMU regression runs passed with the
matching v27 KASAN/lockdep kernel and core modules. These cover RW/MMAP
capture, PREPARED RESET with DRAIN/reopen, RUNNING RESET, and playback
PAUSE/RELEASE, HWSYNC/poll, DROP and reopen. Capture includes 70-second
RW and resumed MMAP phases. The independent backend-sequence oracle
matched 7,104,000 frames across seven capture phases. No KASAN or
lockdep diagnostic appeared.

The kernel image and core were reused unchanged; the modified driver was
rebuilt. Fresh KCSAN and physical VZ tests were not run for this
revision. The earlier v27 KCSAN and Scarlett results describe that
earlier build. The controlled tests use synthetic requests and a known
STOP failure before submission; they do not qualify transport
timeout/uncertainty or demonstrate out-of-order completions on physical
hardware. Intermediate patch stages are application-checked; the fresh
runtime tests cover the final candidate.

Review addressed:

https://lore.kernel.org/linux-sound/sashiko-outbox-210240@kernel.org/

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464693;
	b=4exnN04yslbApUvSdMh3SwZ5udc8hyuDNouqcxO4MaYlaDQ0Py1G2TFoLpuTgQOgx3pf
	 PIY/MB+/vvtrlqXYtBTv0kr60dKBWRBAvZ/dxKwMD/646qxQOJggkgVIjpYn7UPivRucT
	 r4LlNSl+4yZfPWnSghEBanN1gaBkmXBDwoFXSXyl1g7HZZCBXeThxNHKFCuFnPCfjItsB
	 eTIfU817GOzGknFPxFK79D6aRdX0agJokfJyEamMQEv6KkcTUfZc2IUopbOIYbxt/GgOf
	 3hPEtjz6k/qS8sh/AUJBOORet9fl8X1TSqQRkHhIYtWPJG9EVZEvvOTTOfz882fkCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
	b=2EW2YAgtzx0uwDJChSjvXrLvvUSOeSOx0eOD7cyatGcCw7TBUojr14rHlkppGgtCsYad
	 i9cmxvaeh+rX03CYxaaso2aaUHEutHh5E7vv7mWOrZwWVvw5exqIoZwhLNj+P8MVbgl/Q
	 PgtwaZ/Kc/piTyjd/PpR5uKegL7g/baRelSYT4MPuqtidLjAvQ0UwU1aBpZLO60qZyNXa
	 hZ3g4day2uJ7Segh21wl4SfwmuLtHM4khZZSx6i+ea4fHTE3kcekNDyf0fkzuVETGIU8U
	 44E1SEU/t3fLCOZer4b0hnBVdtYYDqcYZRIqRcBNV5UxPvB2Jlra1d3Ax0eZyjB49rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YaPUHdyE;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E95606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E95606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YaPUHdyE
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d7791b00so32974065ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464692; x=1795069492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
        b=YaPUHdyEhUEkOcR6aPnH+zXrYeNOPl/EbbDIJNEAh8SJMCPUXOIo+ikMQJQfH9zp7h
         GXErPCmTGuP8DpP82P7tdRliwFgcwVcqsNS++xYzyNjketv4tqDWRkDnVhJeeS6GjqKP
         TAISUyVmXsJO0/Xouf1WotFCU95eSPJjeyZi+7GvTLgNWXViHPjCF5Qj7ERNTOVz+UAs
         hjQf8MsCuD7gNyHPESmt+Uqz7G4ZloiUZYB2pOGl3zcCrnFntv2ngTPZcUEwvzlsqP6m
         ArwvOjjSlwIf7rh/99g7c91QcJIBtS3w8pobGnmAsE6abKlSKKJS49SFfeq2XYFXV+hs
         XADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464692; x=1795069492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
        b=1NXiU0AvwlmQg0h/9LlNQNa1dRx1UGPOqHNP0RqY+URDDnnZ0opfhLMa6v8/KOiz5F
         PFajeYAKHuUceaeZlZv4OKeNFx+7EzksjJ2UEhyWj12l5FsKH6uu85ifLXHmxsaPn2Nz
         UKXd7MFzDKc1n1mBBOcAvnBZP8/Q9N8haaP9/D7z239sqpPNFPPLCh3M2x6GOj/zT8PM
         hxqaiVwcyNTn3rAVpWeTrzlbXzWJw3Z2UwKbm8SGBtQFszyaPNgCUtOk8KkTpcb/0K5F
         YQWlAOD1/Tm+AkzOHa8xQt9fHSViciPEsRsFrLT4EMU2Q9K/uDQmdjkr06lfYHna99I7
         eeCg==
X-Forwarded-Encrypted: i=1; AL+hErFj9K+ZhfW6r/rP4QdqqcTJVcIna5/3ZoWYESN9OQlpaSkPO7sGX0fh5UwUooKVU2Pb2X3OBhic9lyW1AY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s2tshJuwKszapE/mBjzRiTTZadQQFkN4a0UoHwiprjCt+1KBC
	S3hnuUWEilVm+GR1K2WKxODwMu4hzsL+forNr+r+pQBIGe6Mi8+WzACTaQZ5cA==
X-Gm-Gg: AYBFou1rjenxa3dLo4aZkF3VtJbwmS1IWBnMFb6MGTT8n2mET6bxe8fztStPbljhJ0d
	5bhklyq6agf2B2mHDass3E6nJQEwmmE2h4gjxidXxTLHYSq81uyXYEDwAuQcorBblMniYvZqn00
	RlGt3vi0r874KZbzh4O6nqNRd6vkJNvAwdIU2uYitNrFIZLING/egSh2PU7ottKUHHdGo2IW5Bw
	4Awv3DwjxBgoEayLmRAhJ22pMFWMtq/v88lIdoTAQoqkDYd5uAA25N6+XGYjdbkEXux1AK1MWZb
	zbk37yAs8PDEk+2KawuUTG/YC3MDqOTmz4+vpGWdHG8+7iPOCa1/kokVZhrvn+WOgwTGWdxQOBz
	xoVRctwf/lFhJfIfQT0zawKoeNlOy/rhMVkv/nLESGoReUPm6p0qurep0fS4v3nPQ7NREpnjrzQ
	R2mh3lBNxGjLvP7XyfaByIB6wBIiOCjH3PMcYLltULJM8WxxMZA8MdYoFAgVLI2hQ7y0Pk9E1RK
	IGd0rzoRL9gmyGoX/PJeeehNTDuSRrQZnZUqI1u15WkXB9gePsf6Q6zMVwYWKkbueeibUYb58Rq
	j28EaWZeXWX9uE6LES2sqYtFBQYQPxBq8ivirIZs0mIlv3UzKVbMpeF/Q5x0+CLbvHkOwyUBuQc
	qSXddZrSzC9iQahOEV1CkLzUYOLw/78cqWXq3KlnKvM2kZY8=
X-Received: by 2002:a17:903:1a26:b0:2e9:4e83:1969 with SMTP id d9443c01a7336-2edd7b394cbmr42229315ad.34.1794464692369;
        Wed, 11 Nov 2026 22:24:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:51 -0800 (PST)
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
Subject: [PATCH v30 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 15:24:29 +0900
Message-ID: <20261112062446.159-1-mynameisjune111@gmail.com>
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

This v30 revision resends v29 with no code changes. Patch 17 clarifies
the commit description and moves qualification limits to this cover
letter, following the review. The other patch messages and code are
unchanged.

Previous version:

https://lore.kernel.org/linux-sound/20261112053446.73504-1-mynameisjune111@gmail.com/T/

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

Playback validation limits: The one-period reduction in the TX queue
has not been qualified for worst-case scheduling tolerance. The tree
through the preceding playback-completion change was inspected but not
run separately. The playback gate tests used ARM64 QEMU; they did not
include KCSAN or physical audio. They do not qualify the full series.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

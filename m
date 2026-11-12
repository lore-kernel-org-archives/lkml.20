Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466176;
	b=ZUBaLhFvty3oen89U5+OObHs/ObZTi1ixEA6GwTGQUQViYKjinnRYJOk+IDo4mhENfM6
	 B9C3robGAxbo5jrIbT6VpDDtegO3w2MLtIKdWL0nhxs5Yi/cj6ideekVMk+0gpUN64PZr
	 qGksZtEaBflmg+7BIU12vBzOK5efNzsk31F6RzXzQKQOJvX3RD0YbTglSzmMeKU0fbx0W
	 cmDA43/5xDgKlKsg5mJd/pgHUpXHIOQN9XnOD381UVOsZ4fmO4JRHEIHJuPO8fwtOAvvD
	 D9Bx642nsG1H2a13NIQV0Z7I6dNCtvCyH574gHlbyPsqe/CC37jsaDNyilPs3hAQ9ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
	b=vkvQaJI8+UMLi+o6tUQRnajb4ZPUZLcDy1f/OX0rNca2/QHpOB3rkMlZ5N+qhJfe8nTf
	 cqNITNU65km8JC6wCbOAibeb+eBS12CEm1Qd/E1S2+trKtcXsQt2AuPmJ7s2uNaWFbFEJ
	 2+VRSKsLDRCRyLNnGg8tAIsz9EyqasDXRPOzIN+bvxm+3BRaY0ZS/wgkkxNlKdpHqXeXY
	 rbUuN3nnI6mYohbRdj2ZxpPauq6RHKc1KADYX8HsRSCu4Pp+t849AEGU+NlyVgcOb8Ln6
	 8Rzkinmv1kQAkKLkofK7910MofOxEsqW6WTzgL9UxzCnhUKQnM2csWajWxQBtqY8/ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrJs0ywH;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrJs0ywH
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b2382bf051so2256006b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466175; x=1795070975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
        b=NrJs0ywHxwQmYxpFgdUE4ovjEw4keDZ4vEs91sDaR4ZOgo6GsR/kGgwoExi7uYiVRJ
         raVKFiUVvvurjbk4wYu1M/3iEgw4YVVQvU/d/VBpNS6Y8qA53+JS4kJYLZiPV+BkN38t
         2sL8/Ullur6oSL0dB39+0e8EwWmJxoegnY9vSXEMcTP7uwLiQhm9UwSZKr7FnIJQqCLY
         e9+QjwDYlCTT8wyfDPoucwCK4UEFF+/AQM/QbhTcv8rnb0hSL6YAqB+awj8VB+kzFLvA
         CKhFJY1J5BAJS1vrhfuHwBrfuOt9PHzQp/XDsqfuGiQbTe9xeIuhTMB/9cNB525WSKAH
         aqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466175; x=1795070975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
        b=EnQjfHL7h8kGf/MeB0XBuKXe+65QAfoyHxy6YGI48yfSL4zqJ46Y+8GVx7qh+kOaC4
         ETCeiyXIGWNMDuCk0RJzcyM5QfWOf/6KvjO+r6lvreUW6pnBZWqLGWe3IDxyaxPvslFp
         Gxu9bZPZjgPinmXCd3jJ25boahm6pZg96AJoM6BbFjrNNxNIEjo7CjnNksdNR5ZLDEXP
         GmcAGiFPotxMtmW5kAPD1l+aVFkDI74bS1bmNHCMkGZwqqBgFkEl67Ok+mSmLbsm2Vx2
         i/VFD+6YIEPQcrlTIX9sGT5aQo5PSsY8J1J3DSryzJRkc0Px/5m0fXgDNz4Z0frORWcO
         y+zw==
X-Forwarded-Encrypted: i=1; AL+hErEgaxiYYbLTN1z3vby2Ion3JajdFUkX0dxQL9Pn0nUWSFqWhed3N4wAar3xYBc4atcUbo1Ndu/Qthv/rrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P3/amyr/FtWBalS5VR9NlxVOS56I6dvLglM9f9Q0aPRPH90pW
	6jZbv+nuMzb0PP7WQeWg7xM8KFUl7hE0Kg+cH3G5R4yW7aMz0ddOwk1f
X-Gm-Gg: AYBFou0nVskJj3ySpUqDfQHJmuOSKta3QnZqx4/CYDJjRu9jtibltZf0CSJKSZsN18g
	Q6WuxcppqSxkUfVI0dijrJCl29yQ0auIVlt2F5hR/s8MYS/VYscdWSoYeiKGvnExa0YZCHrE2dh
	L9uwJSDOy0FRWuf/619SvOF0mG0g6vwn5JAwLIS7PDH1vh1jOhco+2bnj9VEi6MFIWEE7/P44Rk
	nbApeZcktrd4KpwS0tKeKG8EF56TYD3rMv5vkyH12umHovbx2r5nAAU5DFLVkzE8WQHnyCU6hnA
	ehE7WMSwVRHe4WeAqSuPJIxDSMjp3BHG+B5Y5Sn1Oyy7is/VBu+QLJOcmSTS636dqb4ElJQTfxy
	+xQRSBhsvJa8gmmtK2yzSpJhBtZm3p1Fv3tr1xeBs346t3zno2hCvRJAwe7DXgeElaKHfU856yf
	eL2WUcRqiPWJpV629C2xV18AMdomp0WRySdEbX2GROhBE3Uh0MALN+KyFozXe24MI+yWQq46D2Q
	oaNhI8CJjS1cmL6hIpn+YmeM1GP1femWcIfY3vwTlRDh+oRxNWgzHxU397jVLxiKFZH+eiLdBxF
	UsOWHsnkLtO4G4NF8nsrPPHjSVlkI1VNKb7QitHRkUJo7P15DPfQEC8+Z7v4X24KcshXePLKZr0
	3b+PL6WWBr5A+S9dgUYDUeB/leec7QcOX7C69qxyXXrjzbg6pWpaPKdBYIr/kbMSXmFgp
X-Received: by 2002:a05:6a00:1786:b0:8b6:4eec:f50d with SMTP id d2e1a72fcca58-8bc1c49c6camr4569616b3a.12.1794466175471;
        Wed, 11 Nov 2026 22:49:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:34 -0800 (PST)
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
Subject: [PATCH v31 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 15:49:12 +0900
Message-ID: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

This resends v30 in full. Gmail rejected patch 4 after SMTP accepted it,
leaving the v30 series incomplete on the mailing list. This version has
no code or patch-description changes and retains the existing human DCO
trailers.

Previous version:

https://lore.kernel.org/linux-sound/20261112062446.159-1-mynameisjune111@gmail.com/T/

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

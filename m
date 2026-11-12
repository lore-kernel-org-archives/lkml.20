Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458122;
	b=1y2kkDL+rICldyLxtZVkUUrnh6lQzXIIyRBhQTPgp5wjKfFxWf7erHcTZQq4UXlnAXEO
	 tfSpEu+ykJmmFuchFEfxyMA8yo6DuGJH2ibFZGBEhukpZlQgX3+wCrK++zZQFA+ts8trq
	 rNOjUfTtCY7TGae5o5zCXaUQ6x848ouEAh1kQMpTaUcIqSH+5uv6MA5X/SiZHrO3Y/vDh
	 G13RZxEv+Prr7R5DIT3u21Unl48R0+gdpNxWZg3w+6CExZ8H1zP1ji/2I7WU0EgkrpnbW
	 Cm6NNejJKyI+56a7mj3hpUqlQqL6O+1KasG6YI9kw/TdFuSoLd6IzFsbgniyudfFEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
	b=Sjl3ahsj84nPnCs6fxBcvQ/z+H0zYudWpWk8NV1OhKJh1bGnhKBYvdCZiCI+WkW/YPMD
	 G32tx+2LLNEwTVBM+UuZGtdV0RXxxj3v0UXpPGwpO2DcEzqd/Mkb0MX/fa6gDjLP5bsd0
	 EcByK7j2B4fbwx0mpmLVqGZOdTJhfofJq6JYfZmwkKC0BavW23qSDz5UCnQxNS4hKYK9U
	 Ff3tgmXfnr7dO2K6fa4ZwvZtP0e2RuCEWMb4wORcODwoq2S3j9wRDecEwn/HnRaJCLx/t
	 dK99lSElD+TvVkUtavx3a81rRCggAoU7pVk5BFOe4kY0aLhorUd60LRsTQtPy/A3Dxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qexJCdgr;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE3D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qexJCdgr
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2856544a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458122; x=1795062922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
        b=qexJCdgrKqu7iz6QsNmvZZTlpEDaXePtg3UP9eDE4jqQDKJ3v7quaTmb6YAw+YgFoF
         meo/8gibEag/NyGmmTi9D1gu/k6Tcq8Uj/TusOsLsOoY7mY2jvCLdDRMDejmpyEWgGyo
         WlEEgAHuBg2VzidkHQ5nxYdARDKkDx3bmad6I1yMJtgFOB4VDCNqkmAqfxNghH1/hQLP
         r24yjCiiGctQTFBsc4BLHyEmf1Z7iyatcBhzVpcCVxfbu8WYodEm/MXCLc9yOLlvlg9e
         QsMV+h20SGwWWbon6Oq/ZuvUJBQjqW27lebZ51vLDu5etYNzPuJQtqNjPcw4zeyBP1mM
         7PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458122; x=1795062922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
        b=ksQ1s7RDFgmLxFux7vgsUkjnLUiVXllpnfmx7YEtXofyOXgAsdLAq2AhVGHsfF/Vrv
         HaxTG8Emfq6KmLDt5xpO2gx0eV3wi+ssPJ+nPUqdnRjQiiv6KPkkIdppT6Rrgib29OcK
         czymkfM8GcCc2+IivcSrDNLxeuDf4lhAeH51tvpeqm4rMmr5goCCCLKbVL0bI/jL4spG
         70fN6tEYi65c1Lqy8Vhz3ojyilZm/N3mu7LxWd/F9qS47h0cOPiYjobLQqwNosUWElx1
         W+wkEEMGRuiLQVqnwZB7gUAZs2P5nAc4QnUvw63hKn4sdAXayEPArQrI1dl8uwjhw08k
         rimg==
X-Forwarded-Encrypted: i=1; AL+hErHgAHTJLEQT7JF/2+g2gw1rv6ThSqEpYVfxVeHWc7uTQuRy4ot9n7Gq/RtW+nLvxdYm3V8zkOPUTeIAEBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R+emnwHLtXtXgi37zskvnGmj52xEwZnjT9qiLrQumTnrrvSV1
	FHNXg60VwVnE5U9/KAMEiqARKAGw+6rFqaMi5LxlIxR6yQE164pQLx6Z
X-Gm-Gg: AYBFou0+eAi08hV14vdRCe53vOaAb+HYRKTx9OvrQ7VG1jJwuzNALOz5Oi9YGOEUTWI
	U0btrfavM+43nPQWPOsN6hUhx0OPocvCPrZ/vjbjDIiGYoNXPKHFgBFvkbK3fijqVJ8LXBVIfDQ
	yE5i5QizIyuIVIFflV7VYjQJ7YWePD8t6nx8SWhAJwEJUXxuzfRuHWN2BMMk4IPo5H0y6Zto27w
	Xea/e31hkRDfORBe9dZWQroT5DbGSHPSatROKRTOpoD5SBBrL+eVPa5ghUZDSxRmpb3a4pYtqK5
	4MkjWLVlt4BhZBRFLewPMN45h0JLlxKDWtFg28JAcisvebc/N8kV2jJzsBDGiwuSwGC7j+66zLQ
	s6TGW+chm43S/OyoEsBQdckVbtB2J4KyRJP0ADpEIrVXa37z8LHFb6BsuYsoXj1OpwSjetlijW7
	lmqElbnzHlaPVg4/qFl9zAweRNP0CUjPG96IGI9ZHa6hIq2cMKPVzTVp82gRtPzzmokITTNhryX
	kuCyd87cPKTCjLJkFYlP/in4MxwekaWScX0XdWeaLrHgcW6RmgnmFKv/3ZyX5HOXKIcHRdLs6jH
	zMlwIzf4BhNljxzZQg0/1qLXg99e+VvNEqUbg/AMsm0gXCs9keqJaKSXyvysnRYVc6xn+E9uRHj
	BvVCMUGAI9PK/dWjpCidZ9dlY87rpuKzQm0xQqr/XoNAiQKg=
X-Received: by 2002:a17:90b:510a:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b182efaa1emr4409006a91.37.1794458121795;
        Wed, 11 Nov 2026 20:35:21 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:21 -0800 (PST)
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
Subject: [PATCH v28 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 13:34:59 +0900
Message-ID: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

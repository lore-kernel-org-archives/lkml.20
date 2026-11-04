Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758673;
	b=1aSYuvkeho8fNkApILk1OAmfsGF0hjCQECzdj+hjW0YQALNVq5iJPRmYsfmiIZ1lmtAz
	 UcOepU+29+cLq53xmrRiJe+p27dKZFiR4AeRGY7A5uXrY/Uvl4dhfxtoXsey0xXpQ1++I
	 4/1J8l2L2XPpzo/kBARMB5cLom1NNTt2sb+wafokLgjh4li91oGYZkQGzXd8PqKeFPNUv
	 n8Wuv1gWTw3RLA+KqbUmG1/0QWWlZabeaxLkAmQLa7p+pLu05rEXuxerdAiVfuH+BkkUF
	 W1L/3cWBOnZR4hdkpvsEPcDxzZWKV2AFfXjIDemXGhv8sYIW6gb/oL7eVo7i0rcDCgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BSQ05M0oQxNJQnOx02JpbWwvcminebtNWNNkIq7Oztg=;
	b=2Mp37lJdrLSJLKs1nKu67ZLgrSADFJ1HSl/Pmp6C+73OKbEa7eUrxPvcZO+uI6T4xsA0
	 KTydnKCIF/dbnJinGWFw8CC88fULPSeNDOzM4wzepFSSvCnL7pUvV3ueMEY2/XcDxmcgs
	 /rNUfrGq+CgpqK8uRhf6XMLXOBjtfyueY2UebMzs/FL9NiaQxSKoCfPabKiYv2r9L9DDO
	 8Br3B7A/Ny++IUFY5yEC6vM1XWQ4MGzRVQn4u1VxUjGkTjhxAYlD2lz5HyDOQS9aUdoNs
	 c78f7L43al0PpArnMdpYSLwFJBuHiKOZ7ysAKTvpu8eGtFLcrbVJIJR/0CcIHXdJ78g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M+EClprh;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7CD606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7CD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M+EClprh
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06210b29fso126610b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758672; x=1794363472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSQ05M0oQxNJQnOx02JpbWwvcminebtNWNNkIq7Oztg=;
        b=M+EClprhYi+x/aX7h9hnE0QRdMZYpjBdbB9//qVL2E/tWcV+hqL7HpUZl4HD/l8fmU
         yrov/g3eNNWlu9xKNTNXieW9VIWGMGhZgMGE1uohAQiLHZY+8F4QsRuhAU7Q/LSmJAdG
         gS+v6TPUaKcO/TKH93Af1wtCrKeC/FNbPAwXpwo68vrbw4GB3yYTAIdiFIjCTtht8XJD
         AsIeNdMHFFcXqjZ2j+Pi9U36TU2kDD7GtzcveINidgfevSfITK6+ew9NbzQKL0cFQdZf
         BuTvnnQTqHBP91h32T2Y8gkrtlZ19cflNVFD963jajUL8gJsJ7hNMntSxwavec0y6TJD
         jIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758672; x=1794363472;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSQ05M0oQxNJQnOx02JpbWwvcminebtNWNNkIq7Oztg=;
        b=scHpwtV5ARqYz4xrNXDyxV1kvWHLcFYTZDWpR0FdrLSIWZaxyXnbUultmB/KAQk1VJ
         vp1ix02ONyrMe3Fw0FHXFZF0xiqIQhXyPmMPW50fdDjy15EC2/FBMPT+xBbXLa/9qiM/
         rFV3vC+UnFG8HGXDO6yuYz/tcKllFolj7MjppJWOoYWYSEqpaVED1ZXjsGWdDCQjmg1h
         j5w3TbcPHWe6aR3gx73Ytc2gQpXiyvpmHUFtg3VIinNyxam2Hz0R77U1f3iBC9cIR5Ln
         hKwZSvo4KjYq5VuErhy/YgVesDCP0VWM4y0Nj+4JiBDw4kHiV8QHiUxu4O6o4lMubWSx
         /Npg==
X-Forwarded-Encrypted: i=1; AKwUvBzod5kGTt/c0QiZw7DSvq2sDS2RFDS6HhSMlV2Vo7LtblxLhMVirTYqtixZVcw7D1DhjD0dh97LS2t1T1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JSYfevJe8oq2KMkIcsGDZZ7VOY2GKTga1XT8NwIz7pEmsHhp4
	NkXgt+pTcVPPLysZDNh0PeYf89Roc9dMxqb3KJ4u0FRjTCmqB1tJHjU5
X-Gm-Gg: AYBFou1H0B2JrPr5LZh13BMYHQaVZbsrf3jGXkmZZB+d9xqCM4RbNgfaYM85inYqdOk
	xa77NxHfWv1yYrkuNwxufem2y1r8WbPn4iMUzwPSWJvMYUMXIC6JjVvXEKDfqtSo4TrOmyfVW/Q
	gFpEttmsSx3yf+vUzusKHPhZp4C4xPjUIcPd6WzyyQd+I4YQgIKEXcKysHYETKlzSc1nmbJBm5e
	KMakVaNY8DbTr7rIZZXSRGLEhl/cFHHBKjkhzuGCudhy6hXYf3q/TIWf23WucewSj+lXZ3pSKJV
	m4eoiE9CXNf/oLZg9l4YBKMsEFaEZvcY8BJCkO/EJgGEayuuaZPEI31rfapNNmY1VS/kJh/gvo1
	MUbDNlZKYFebdIhMvXContsxJOyfLznZO67dtB8Ewj5lmjFsK+UVBMzTK1AdZWFoJ2Rn7MV3cmd
	CTgG/9b4Js0xPtdxLVyTskCz5HWdHUpguLOmXMJBgM9HxbEgPsDbOxW85rsG701Y/QWUqwBdfxS
	F7v+sbfS7Dy9I3NCKzROABZyHezj/itnHZjS/zxVMCyIG/EEZJhBFvilBDJiugiyfWQf3nIyfZS
	g0GjQDHD0INoVxEjzXWhMPZn57bN4AlRqlVIWBhWKrpOu8Cwi1UHEsYHoiIyZF1+cKRKnQ0+gJR
	RcCvWoiLE2sjuTBdAre8hpLR1mXdwEZDORUT9f8PqtGwCvYPGeIjhV7GFtIQLsDO1DQDvwQ==
X-Received: by 2002:a05:6a21:4903:b0:3e2:8fdc:a6c4 with SMTP id adf61e73a8af0-3e928d14803mr13026535637.31.1793758672044;
        Tue, 03 Nov 2026 18:17:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:50 -0800 (PST)
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
Subject: [PATCH v14 00/12] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Wed,  4 Nov 2026 11:17:33 +0900
Message-ID: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This v14 series replaces v13 and applies as twelve patches to sound.git
for-next at a4311e9447bbb219044db38897f95be112f46a8a. The patch order places
the ALSA PCM synchronization prerequisites before the virtio ACK and teardown
changes, so the driver can keep ACK admission closed while the core resets
the PCM pointer. Targeting 7.5 or later works for me; I have no urgent
deadline.

The changes address the 16 raw Sashiko findings from v13; several findings
share a fix and its validation. They close ACK admission before teardown
waits while keeping prepared runtime storage valid until device-owned capture
requests drain. They prevent event delivery before ALSA objects are ready,
preserve XRUN state through recovery, and keep capture accounting consistent
across RESET, short RX completion, sub-byte ACKs and NOMMU post-STOP copies.
Failed-probe cleanup reclaims event buffers without dispatching them into
uninitialized ALSA state.

Playback RESET returns -EBUSY while TX requests remain device-owned and leaves
the pointers unchanged. DROP/PREPARE retires that generation before retrying.
Linked PCM RESET retains its first-error and partial-completion behavior.

Validation includes 21 selected QEMU runs with expected fixture exit codes,
module hashes, unchanged inputs, VM cleanup and decoded kernel diagnostics
checked. The callback boundary suite passed 24 cases; ACK/START failure to
DROP recovery passed 18 cases; the forced ACK/teardown race passed 12 cases
under KASAN/lockdep and 12 under KCSAN_STRICT. Fourteen ordinary and staged
capture segments, totaling 14,208,000 frames, matched the independent sample
oracle.

Separately, all twelve ordered v14 stages built, with the recorded source
hashes matching each stage. Four targeted intermediate-stage QEMU runs matched
their expected exits, module hashes, unchanged-input checks, VM cleanup and
quiet decoded KASAN/lockdep logs. The linked-peer checks accepted baseline ACK
3/3 and rejected candidate ACK with -EBADFD 3/3; three control cases per
version and six candidate recovery cases passed. The stage-6 event probe
dispatched one enabled event, blocked pre-init dispatch and passed rebind I/O.
The stage-7 short-RX case published zero progress, latched XRUN and reopened
for 96,000 bytes. Capture-stage host checks passed 15 assertions across
stages 7–9, including the teardown gate's prepared-state lifetime.

Two physical VZ runs used a Samson Go Mic at 48 kHz mono. Each run included a
70-second capture, three five-second reopen captures, RUNNING and PAUSED
RESET, and normal shutdown. All recordings had nonzero input and zero XRUN
errors. These VZ runs used the experimental capture compatibility flags.

The NOMMU post-STOP path passed 22 assertions in an extracted-function host
shim; no CONFIG_MMU=n kernel or device run was performed. Event admission used
synthetic events; physical system suspend was not exercised.
Docker Desktop, other input devices, and broad load or format coverage remain
outside these results.

LLM assistance was used for review analysis, implementation, fixtures and
this explanation. The patches carry Assisted-by: LLM.

Previous series:
https://lore.kernel.org/linux-sound/20261103080821.16983-1-mynameisjune111@gmail.com/T/

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

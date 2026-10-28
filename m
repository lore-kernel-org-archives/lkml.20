Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156003;
	b=JibeGbzTxrhzbRPmjRJOgsaWpUoekBuYBE2Lj5BA+575Ab8zegsI97s4565HriL9XzIN
	 OllHmbWJdms0FhV76nPLUowZP9COUCXnfEpx0WEfSyULYsdI30LoUMHCSIHQLVItTFmsR
	 MfbVzvR9pmA0jFpO6jg1syTee3MlyoWOW8fa/mYlUEtfTsXKdlHAl8P7UViQ7G/1CEVZB
	 Vtvuj1ygH6/zh9cgeNMH9x4u++FofUL1R8iqe9YPCHkZRXjE5G3Qzk3og2bvJQn231QY0
	 DUikqU9xQQXPnZaZiVxqH6aIFPKl4R6FDRNZEmrAMYTnDQqsniECp3bldjAhy7SFrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MFltAnN4KbJLJHAjYR8GHiau2832NVeS+N4nXWFF7jM=;
	b=Fnp+X2RdPcI6pyqA328M9tv6V1AV/20ntAK6iSwsls94govpgaSE7lJBqr6ltSOxqb4D
	 eY5xIeQ+xU5gwdh1SIuDJRyXu2ZQN406UXMM+sU5Me2+QUfxrElvkuO/Wytu0Ux/3hV+x
	 rHsE1hKE69ci3ZzA5L66ald73LdUmVEsVHxtt2e9tCzNd34z+MVNkjQGqOyLnvMEuf/Xk
	 on0bQG1nwdnwPDShqh2vG6gHtAtABBDeaN89R2L9ZZekQ7zdUdd206sj+fGvuSsTiC6Tj
	 AbabTK57801GZxyx8NJ5JGy2WRzOz3mc4rOyH/fcLCjQ+34NBztG1Dy+MGjlSvdSmLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cl96z0W2;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDC8606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDC8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cl96z0W2
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso974825eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156002; x=1793760802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFltAnN4KbJLJHAjYR8GHiau2832NVeS+N4nXWFF7jM=;
        b=Cl96z0W2+p/NG4GS6og+oX5YT0/aiv5M1fEt8p74BMN0gjZESdsgzugC0IPtL/6SOx
         MmTx+CNWAUP0wnLUvbXFmFzn0eegQMAMRijcJKGkxDGnZ9PJ+hR2ufU2AoRXlgD4lynL
         Es4X01vmFES9M80MF7ipZMsuS5i827BwKXzhba/AiJ+PNa9SJnUIeHITw9E6t9i5XIqd
         4mcNvVt01TBynXWGrrTt69ZjNwLLjZwlNBR3FZ2XiTCBB7oSJd9wmPmq22ZM4RkINzsg
         AJtvgzIiIBAJDT3DoNaRXK0rwgaxi7W6pd2Pg4R70TRC8qyw4v4GXfAcivqy9W7B9a9c
         fT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156002; x=1793760802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFltAnN4KbJLJHAjYR8GHiau2832NVeS+N4nXWFF7jM=;
        b=jIL1vDC9fX2VIlujG2BysqTEZWjJKx1buhUNY9XS8HCCh7IDUaRCEeCdHTGOp6xg/X
         DuyXFcx8aQre0kwBvYNV6BV5Uyd1Bd/vttGez8TwWazDNK8a/F6aT4/ppw/w5Dt+qhuu
         FGIsDcwBGyE7ssFxvHVF20oag9SaJbSEm2+vCNw2+eaH1w+fpawcirddi9Q1v+wF1xlu
         7PH0rRQzqz4Ak4i6kkbdUPwGMODY5PSM3OKtBYfkGjyoeEN9UTTNfmIgBf4yODYE2bG0
         NUR63Nb+mFnk/26pmaWSUa1MCA5ZdmJ/uY0jEW4XUbsLUzpzIEUVhvwppv0VgOKXzlcF
         By4A==
X-Forwarded-Encrypted: i=1; AKwUvByCCPBXmd5GNlhXzsXanWx6Tdmpa5oUlw5oRolLEk1Pdvqc4F6jLVME8UHFfjNd/HE7ApuQeamE7TJi0VQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPYLWSumKfZOroAwOOs9Pk8NlDKHY6WNsHDFbRpGjyRwfe80+N
	/v8h28QjE7EuvnM2/1XL/MEKVYlsuLeQPSTvO/a+epmYAHCRPy/k/Z4M
X-Gm-Gg: AYBFou24gyWwDgHGOyNoc6E610Q6pEgMQSo5mLTNoSQ4UFQbv5g0EAqahSVD1PLOTDT
	31rLkJXfChzNNE6O5+GtTPbZQsjug40yqeHRL434FRoOEP+rd5Iq0SKl8zySx6Sbekm+I7WVbWV
	ABMV9zUE54+6dGkE7NhCG00EXBwY8UicrzMk6KglhmgvOUdyKvxnZB+rHXuMRj183OVatk4jEx3
	+l8dA9pKIdxzMQVp/f8ofDw8WH3kB4mtzsTi2Id7nlKDZUbWgMPJnVgpJx8rmmhifhCOhaFslY8
	HWnmwkACMY5u51gRAg21l0PUeELUJos9cjNZV8XQsQacCkYhiWZOYtzMx4flDdpY3jeOr7gVt66
	/d8Lk/QRRn0EmpeAW62A01ZBneXcQQerauoHLUFcUZDc3Lgc0fqLByhHFxy/rynM6xyebil7iNd
	0sfDzlCC+oW7TNyvZTN1f7eMXngPMxF7229kaLZXrJ4zyfi1E8Ie+H1tvgCJkWZPpN9CRsc97Tm
	LbRgiPAeVr/B/LvIaIK42qx5Scs1lWFJB8elcRxdXjQtofA4Jzkyc0nVVLnKw5mwTP9zkMQ4cb0
	RJzNIVRGTzdorN0G+a57NfzeL0GY4+Kjmyw/yqYPeBoxjU4ub08QOsddVDMvAvtlG8UsWXfFGe7
	EALV4/wZYtY8fERyc9Pa7bEQGK6n7C4sdcnzaVpvSkSh1GfXcQ3Mt8SEXVwDVWESylwcm
X-Received: by 2002:a05:693c:240c:b0:369:b75e:d24f with SMTP id 5a478bee46e88-36a20108feamr1659593eec.24.1793156002025;
        Tue, 27 Oct 2026 19:53:22 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:21 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 00/14] ALSA: virtio: staged capture and dsnoop recovery
Date: Wed, 28 Oct 2026 11:53:03 +0900
Message-ID: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

Hi Takashi,

This revision addresses the Sashiko review of v5 and includes a closer
look at two intermittent XRUNs seen during the follow-up tests.

The series applies to sound.git for-next at
bcb4494239f57c98a8ef576566b03f2935b3000f. All prerequisites are included.
Targeting 7.5 or later still works for me.

For this review, patches 1-11 retain the v5 code and commit messages.
Patches 12-14 carry the review corrections separately:

  12: control-transition waits, aligned control values and capture drain
  13: prepared/reset state, failed-open lifetime and pause/ACK recovery
  14: documentation for the five capture compatibility options

The earlier dependency chain is unchanged: 1-6 cover request lifetime and
error handling, 7 adds staged capture and pause restart, 8-9 cover ACK
accounting and period work, and 10-11 add policy sampling and dsnoop support.
The staged-capture and device-compatibility options remain opt-in and
false by default. The VZ compatibility assumptions still need review.

Changes since v5
----------------

Capture drain can consume its remaining tail without queueing fresh RX.
PCM state-changing commands and pending-RX teardown wait through signals
within the existing timeout. INTEGER64 values use aligned response storage.

Transfers now require a successful device PREPARE and a live queue.
Reset fences transfers before resetting the device, cleans up the queues
and period work, and makes prepare re-establish device parameters.
Failed-open cleanup cannot leave period work using a released runtime.
NOMMU capture copying also accounts for native pause.

Pause recovery distinguishes definitive command failures from uncertain
submitted commands. RELEASE_SENT retries wait for RX drain, preserving an
existing XRUN for prepare recovery. Pointer and counter reset is locked;
ACK cannot advance past the position observed by ALSA. A successful
partial read while paused also arms cleanup when it crosses the stop
threshold.

Validation
----------

The corrected ARM64 kernel was built with KASAN and lockdep. The
non-staged drain test changed from -EPIPE to a successful final-frame read.
The paused partial-read test changed from prepare=-EBADFD to successful
prepare and 48000-frame recovery in both pause modes. Queue-failure,
failed-open and virtio bus freeze/restore tests also completed.

I compared v5 and the corrected kernel using the same QEMU device,
48 kHz slave, 960-frame periods and 7680-frame buffer. Delaying a bounded
to free-running transition by 120 ms caused both kernels to reach XRUN
before the transition call. The test had already used half the 160 ms
buffer and had about 80 ms left before overflow.

The shared-client fixture also started clients before creating all reader
threads. A controlled setup delay caused client-threshold XRUNs while the
hardware slave stayed RUNNING. Starting each client from its reader thread
after configuration removed that startup gap; both kernels then passed
three repetitions with the same delay.

Delaying only the 96 kHz reader by 240 ms during capture produced a client
XRUN on both kernels in three repetitions each. The 16, 44.1 and 48 kHz
readers completed their requested frames. The hardware slave remained
RUNNING. These results give no reason to weaken the ring overflow checks.
The original intermittent failures lacked per-client timing, so this does
not establish the exact scheduling history of those earlier events.

With one vCPU and two guest CPU busy loops, both kernels passed the
13-case mode/lifecycle suite. In separate VMs, both completed 70-second
captures at 16, 44.1, 48 and 96 kHz and a subsequent five-second reopen.
Each client received its requested frame count. KASAN and lockdep stayed
quiet, and the loaded module hashes matched the intended builds.

An initial combined run exhausted the QEMU fixture's finite test signal.
Those failed runs were retained, and the long capture was repeated in a
fresh VM with enough signal. They are excluded from the passing results.

Physical VZ/MOTU, KCSAN, 32-bit and NOMMU runtime tests were not rerun for
this revision. This round checks frame counts and recovery, without a new
bit-exact sample-continuity claim. Not every signal/late-RX ordering or
RELEASE_SENT retry timing has been forced in a runtime test.

AI assistance was used to examine the Sashiko findings, prepare the
corrections and diagnostic fixtures, analyse results, and draft this
series. The affected patches retain Assisted-by attribution.

Previous v5:
https://lore.kernel.org/all/20261027234334.32551-1-mynameisjune111@gmail.com/
Sashiko review:
https://sashiko.dev/#/patchset/20261027234334.32551-1-mynameisjune111%40gmail.com

Thanks,
Joonho

---
base-commit: bcb4494239f57c98a8ef576566b03f2935b3000f

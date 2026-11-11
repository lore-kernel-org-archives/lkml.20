Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365823;
	b=h8UTbgMiiznfM53Gvt/YoN6fZe8U7owzbc5a2EEfTlJE91G0iNpZMpymz1AaIRlXMAuA
	 xMmuC0JuRxLcXzdcXl6cKFvBLgyrTkaetRyVpvcQkP43m5P7fI/d36u3WrWn39mVp4jjP
	 0GXWalecTpLusIiYWXwJFr74gkFU/4gttCHyaeI3AeaLWg7WCm9gD5D9PDwr8YhP7jESJ
	 1RDOKJjfzPwgad1IujfVGKEXz8kuRq9YiUtJUuaP29eE9Ks/eewLaegxFSZDgiExD6D7h
	 TQxzCiU80sEP9p5MMmPn8l/CwBNjHteEwo7ZLyftlteznYEliqWcV9xiXOL4YVDlnFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
	b=cCRCAaIiQEZ4b3YfzF9uAsrlVxA0bEs8WPb2AQ393NN5C7TkGjxlq3pCpVcmOo5o6JeI
	 fug08vZPzwx9RjglihEE5q/ZrsNcY4q7Gr9yskLqb7dNktAGFy28C1vtL4v80YplcpTi1
	 QnPKN3bsi2OvHjkzpoTj37PRUMIveqj3qV9g7JvufhUPbXUxPQjBhxeaHWNpSdeeP7mqp
	 UfAihqfkr1iGz9ZjlAGqIVwu1Vuqp9UyYgMAxdg0DwE/cBH5QvXv7kJOP+PWNeDGhKKJr
	 tH/D3QTq6WNk5G/7gMfTfW8RvNd5A3QMNiZMdSb8DYIjrED/Ckgfs3nShm9D/tyOtVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRnwyNK4;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA543606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA543606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRnwyNK4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3712b6d9843so2587943eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365822; x=1794970622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
        b=nRnwyNK4+QgxDLZzdUu9b73ahM2d1sl08rYnO+5mpeJnI+ijjzki+f+1wpSUL761PG
         X08xPA8vR8t6+HjDpo6t/3TsOwlJfgO++OlIxFdQKzVrx3R45DnjXdl1HSeODB/K2JS6
         OPnaR7Z4Bssb/aveSf6xD+p0pVrgqGVvdi9ELDhTb+ny7//QIXQZDX5/4Jqj3mvpsaPY
         Jfk+cNqvhJ1jGZtvloRIaZsWi690zZi92IhlzA4EXMj3/1ITfdNk+O29nKxM7sTlJ3cx
         ozPVl/u/cXtkcJLYfwLaR3QinTV0TjGLVhuv3K2Xw1uEBsQbeyviiJiRo+2t55bXj0SJ
         UgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365822; x=1794970622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
        b=pa6ig0a7XqUkVHavHWtlYAIiK/KL4rwCwYZ2kSl7YnPDDcu6GU70bEMEe51Xi4W1Rn
         7oQ+HbuL5pOzUwMCxMulnmG6grR+cxU6josEGgJR8g6XPQWrq/3E5sqnsnetYNwAVmcS
         evjWAmMSKRcAET/XyPjesscjrzhFxQcnAj1dClhzdnvkurDncOo2HAhxbWmzNO92FO9a
         3MqFil6Jst8yOpB3nQ/LEAWc1EPehgRiwzHBhxlTsJiBKLqp8m7009RFSGLIy69S1Vax
         mSHoiVbOorVaBes1ckxkP/1NJVVB7v2E5Jsbb4ChdeIzd55wL3zpOf9QRE2lPTLi1XFs
         is3Q==
X-Forwarded-Encrypted: i=1; AL+hErEI4mGwpyys22ta46HZw+eI0lMQLmTqGk03IQ9k2/1sF/fGckk6GhcUd62+KiwkZoENWvoXHTeLO+yfJRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uVKWSPH1hGCsX5517vGGdQ+l5Q4C+/i4+Kyrgts18y3PW5+hx
	yPySBlX1nlzxrhJk/cHH8yWLP0oDoMP4CRvmMz0AHGtAvOtVQ4KzQmLw
X-Gm-Gg: AYBFou1D5rsH5l3ozqplSZXqI2f+DYE1rljhfAe9s23xE37XX9jp73UpPIPKIE94Iui
	K5kPVVja7lI4SUe+HUGkoQY5MPYyWhpZhLxHMfxtNG0AcoBCN4pilDZrltySw3tIgi05Ge2uzj5
	5MWe/xAQJ1JaXNMyxVd8ov7bYLQEEJojPSOAaTUr5k8N+UXj6htQRsjL97pD6jYIYa06Efrmx39
	HRvPi7ArTI/0hyiNJXAYwl40kZ1Dcuh8C9uTXrwhnsTFiQg9gH4US3pvRof8FXurMZIHXlfif6Y
	EwF3uCdopzFLvnwj0hcQIlZG/cBUHWE14sowBYxP+Mzxj3r/apUVyPqcXgoplSdwcsfWSNX8PVX
	I58Svzcs+2EZ82T7C0sIIlIc+xNVJ07mn9YVpfnjgFhXaTzbrPYae/SaVGTxftzA+zhdnNO/+NU
	jpwEXLK+u3h1Ag52Bt3NCYBVG55McfIQZOcERh3OEMI2/SnUUVAMRJScf9/GUbKh6W90zaqWX2z
	xfQBp5OgnM7cpVhJqFKsDyJIQorBkfaAeHm+WhtnzClY/yKzK/TdZ06JmFiD9vSKhVLO8FG/6ys
	LJGlTmYO7u5r52FjzoXZ6PxlUiCdA0leOF1lJvVh7gIFCSeIyEv4Pzej0+iv01FNAUteq0qRvOt
	eOI8DG5d8jjRWfGrMYVmD9LqSVBH7Ihyzdb8CD1jphBCmrKWI0R07mBZub//NQHhQBSK6kA==
X-Received: by 2002:a05:693c:808b:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3768646897amr1766149eec.21.1794365821641;
        Tue, 10 Nov 2026 18:57:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.56.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:01 -0800 (PST)
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
Subject: [PATCH v25 00/16] ALSA: virtio: serialize PCM recovery and preserve capture and playback progress
Date: Wed, 11 Nov 2026 11:56:39 +0900
Message-ID: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

This series updates ALSA PCM recovery and virtio-snd request ownership.
Capture receives into request-owned buffers so valid short completions
can be appended to the ALSA ring without leaving a gap.

This replaces v24 in full. Apply all sixteen patches to the base commit
below. The previous version is at:

https://lore.kernel.org/linux-sound/20261111000543.28550-1-mynameisjune111@gmail.com/T/

Changes since v24:

Capture DRAINING keeps a full buffer readable and reports progress
beyond capacity as XRUN. The read loop refreshes availability after an
unlocked copy so a tail published during that copy is included before
EOF. Playback drain completion is unchanged.

ACK checks the core buffer-access gate before entering the transfer
path. The existing PCM lock barriers in prepare, RESET, hw_params and
hw_free wait for ACKs already admitted before the gate closes. Internal
RESET pointer observation retains its separate bypass.

Playback period work checks for new progress or a latched error under
the PCM stream lock. This prevents work queued before a paused RESET
from publishing a duplicate period after resume. Prepare and RESET clear
both the cached device latency and runtime delay.

The capture allocation and copy description now lives in the ALSA
configuration guide. On MMU systems, per-period page rounding can make
additional memory exceed the ALSA ring size; the request buffers remain
allocated from hw_params until hw_free. Pause documentation now
describes STOP/RELEASE followed by PREPARE/START. The ACK
error-propagation and teardown wait patches carry Fixes tags. Patch
descriptions state their changes against the pinned base.

Validation:

The pinned v24 baseline was rebuilt with the saved KASAN and lockdep
configuration and the same builder. Fresh cumulative W=1 builds cover
stages 2, 12 and 16. Each passed with no new warning lines in the
changed audio builds. The full baseline build retains 517 warnings in
unchanged ARM64 files; other intermediate stages were not rebuilt.

Matched synthetic ALSA PCM tests compared baseline and integrated
candidate. The candidate preserved and read all 8192 frames in a full
capture buffer, returned EOF on the next read, reported 8193 unread
frames as XRUN, and returned both a 1024-frame prefix and the 512-frame
tail published during an unlocked read before reaching EOF. Playback
drain still completes. These fixtures exercise PCM core behavior, not
virtio transport or physical device DMA.

ACK probes on baseline, isolated candidate and integrated candidate
verified the baseline admitted a gated ACK and queued TX; both
candidates rejected ACK with -EBADFD and queued no TX. All three also
verified completion of a pre-gate ACK before linked prepare crossed its
lock barrier, and the internal RESET bypass. The integrated playback
probes verified stale work across PAUSED RESET/resume and clearing of a
synthetic 256-frame device delay after RESET and PREPARE. Clean
integrated RW and MMAP capture runs each lasted 70 seconds; all seven
segments totaling 7,104,000 frames matched the unchanged independent
oracle. These QEMU runs reported no KASAN or lockdep diagnostics. KCSAN
was not run.

The default RX path adds request-owned memory and an IRQ-path copy.
Packed status and RELEASE/reprepare pause are opt-in and disabled by
default. CPU and worst-case IRQ lock-hold time remain unqualified. The
playback queue cap reduces buffering tolerance, especially with two
periods. This revision has no new physical VZ or KCSAN qualification.
Uncertain control timeouts can still require device reset or reprobe.
The deterministic review fixtures are local and have not been published.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

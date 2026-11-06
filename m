Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981925;
	b=kBZtEfYHncBH58Z22rnbklmYUVVFvX1kG/aaKZP+n8dqgWNc6yV3h/lHCd16EEoq3FfI
	 Mu5ZBO583WJ9hV2ih8561qy6PMv25E8J+kg+UHk0m0nYKpJZ1LHmKvnQjE3n4NcdRw6Ol
	 bn7Hkfbi9ZFFf54fGqLY0JmY3eXGDF328QetLnF35YQulQVRgcSPGLCs0ogecg3akmtK6
	 m/k0zTUTrG3143ul9ZBnTWL4oSOjhKo62XdhHbnxeZIh2psjIdz+zG1jvjXjssh1IviJ2
	 N2QkLpwDjzyRgHJacroR//7QZWKrc8BxrJBx8BdORcLBiQkyTvztLshxdSnwhO0yvrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
	b=2G1UJ3OFs5EraWu5OYhg+vSeU4el9kUpfUU716WqGaooZl4kT1wF6bG3ZuGTZPfFfpZ/
	 BZvowRzoTyt6Ssdk6za5Zgb2GZtiCKRWK4TPEefz4jajbjADioIRGZ3YSxnQL/gJrgISX
	 UdyYYouhUG7H1EjyPIIgqp5Kw1d/6x6xzwwwKPfHMKdhF9f+zevn78B6qpaTB+AAJ7UB/
	 UKU9AGQvxUqFnFFMYPpfUsAaLcBa2Lgo2LjakxFhOcDU/o5X8DARJCwqA8Y3P+0EwjoCG
	 4tYgJw8pIfp3sF4rP28Qw3r0l4p970eFPPmunlMwQBObvOOsqIdTsbmuewzKABRUNAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ive7ZrhA;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5469606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5469606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ive7ZrhA
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso1897440c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981924; x=1794586724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
        b=ive7ZrhAjBWK7ZFfpfPxCUr9GCcskXBiex8vEbprHuYtZGY3J1jvX0EgfR/Nj5BVPT
         XbfIPrSeTCqXV/6JB+aT+7L+xoWEdTofOoqcf/5pTelGmMpqEcV1pp91fYrGUsxxLMAj
         OG0IAR4SwtMEWrzzVV2IbyLrKAGPJ1acAha22WojRJYAOWrVM8ihptmf0/9whUS9ijrP
         XXE3Pa95QQ4ZQM1q8Y0daOtOEN8coryhE+QILNrSFctNxmeHRj3RbZOVNNyu76bquiWU
         w19gBEG2jiQaD+94fDqoB5L0ZMTFbDyrBQw0ku6d9Hd3fYrTH0i4iCdyxu+/72FRz+DR
         XhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981924; x=1794586724;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
        b=2GLtbzOLkLi9Ash+wDIArtYvODUEi5mrRKmqYqYypr3w5hgSKEw18S8mhiOED5+3hs
         kcuvC2sTtduiEXYW//QpAZLP7/P2aN9QW26X/zwvYV8PXgHGTrsDJAs4uefrLj4sPJ8+
         SvcB9jjA3fc9uvXGVoRxvWNts+Xr3hG0/1KckdljgPlRRufg0uifQsUPL/V0DAAKzLUT
         5GzaKq31JjgRgfG7aWUnz83KW80s37KRTpZsxvdugQQsJShtaf3IUqE1gN+PqUMg8YTG
         0COkWyv7591jTRtduwG0k0+MzehCKh3LmRQUU1LxwY4PwktO4NE9xYUus90xGYJp1DU+
         WoQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzA2yfCPEJ1RHgJ8eZm5InTUgGZiZ0FHnueDKgMZri+Nk73IZHN/EvvjehSE8ujDPsn+gTWg3ACcWOZYp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zhaWhRlrcRn4cCLgQcWpnWtXq0kIvbcCPLyWmfhT0ZRW3w2MR
	qe/udOAgDC56SwOztU/7sDCEfMHRPgBa1Rrr28HdfS99LFBhxaP8f1IH
X-Gm-Gg: AYBFou1q/w1awQuKA4JCgAIGrGyc5+Uc19AyOzb3o+0Th2by5T/xQuZ/iTJTCICtr+x
	RZuJsiUxzVOO/RwpTrOPD5adjkLxy2qUF8tUS7Kzl53S/tmAXiEVu8k8UsxgdoFDiD02XSpnlhv
	Hymb/Z/Q+9ym9gSEbeMnnUDdc5SNbf9IVy7NhR5ImqIqBuDPquEwsCZmTqvFfm/zFGcIdRzdp5K
	NVpqzvEK1boAdeqsdL/lVqZiyM3OdRRf60Z3PYm0/Zy2dAUVNLMpVhqa9UqyNutKyKQbgo6u6zQ
	VKaPoE3AI0+D5uzzitqUbvYdkCSWPp8KOUHtj+eK0uiktz32qRDkcVSjaEnK6snc48mhhMkvHIP
	ickfZ8s17QIThdbg1VqilRAPEJVQt2S3yZWjOGHpEKzjL+RWGk9eUds0F5Vd/dW6CF9gV9F6CEC
	vkE/w3x+2r2oMj9wTxTx30rNayFZmXxHn1BT+52xrFSk0cFpW4wQpnu6yBqeRFGyFIIi/176g9u
	5LbkN6A7wm3IYsi9tXQ6pJIEpyjGLZktGGpgDmgU4iaqGEA2xtaBjn2URvwYGbztfHYWEE+C72x
	RLABtBA1kloEoRYlxB7zGaBPQ/cNFb0qL0bMJaC7okcpOAVWcMbP/YDsss1JFCWcu6eZqm0Dm+I
	vJh6PVJWEhVEoroYIK/URjoSgNl3ds7uC28tZbtP+OBQG5w==
X-Received: by 2002:a05:701b:4588:20b0:17d:7b45:f927 with SMTP id a92af1059eb24-1b25d3499d6mr3671255c88.33.1793981923536;
        Fri, 06 Nov 2026 08:18:43 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:42 -0800 (PST)
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
Subject: [PATCH v19 00/12] ALSA: virtio: fix capture accounting
Date: Sat,  7 Nov 2026 01:18:26 +0900
Message-ID: <20261106161838.94308-1-mynameisjune111@gmail.com>
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

This cumulative resend keeps the twelve-patch series on the same base,
a4311e9447bbb219044db38897f95be112f46a8a. It covers PCM stop-threshold
sampling, locked partial-progress reporting, the optional reset operation,
VirtIO ACK error propagation and recovery, PCM and control DMA ownership,
signal-safe teardown, staged capture lifecycle and work prioritization, and
capture parameter documentation.

Relative to v18, patch 7 validates ordinary indirect capture appl_ptr
accounting before calling the indirect transfer helper. It bounds ACK
consumption by completed, unread capture bytes and rejects positive
advances before RX ring seeding. Active over-budget advances follow the
existing XRUN path; invalid PAUSED advances roll back without ending
PAUSED.

Validation:

- Cumulative ARM64 stages 04–12 passed W=1 builds with KASAN, lockdep,
  and OSS PCM enabled. Stage 04 built Image and modules; stages 05–12
  rebuilt modules incrementally.
- A bounded candidate-only raw SYNC_PTR audit rejected unseeded PREPARED
  and over-budget RUNNING advances before indirect accounting. The PCM
  pointer rolled back, and prepare/start/read recovery passed. Valid
  partial ACKs also passed. No vulnerable baseline sequence was rerun.
- Candidate state runs passed valid subperiod ACKs, PAUSED rollback and
  resume, DRAINING tail consumption and over-budget rollback, and raw ACK
  before and after PAUSED RESET.
- A slow-reader QEMU run kept the unread capture slot unchanged while
  appl_ptr was held, then recycled it once after one period was consumed.
- Four final-byte no-hook QEMU runs covered ordinary and staged capture
  through RW and MMAP, including reset and reopen. The 14-sample oracle
  passed across ring wrap with no KASAN or lockdep diagnostics.
- v18 MMIO rollback, timeout-width, and PCI remove/reprobe checks are
  inherited for the unchanged transport and control-message paths.

The bounded ownership trace did not reproduce an in-flight duplicate
virtqueue add or message-length overflow; neither is claimed as reproduced.
Numeric ALSA runtime->boundary wrap, physical Virtualization.framework
devices, and KCSAN were not tested.

Previous version:
https://lore.kernel.org/r/20261106000644.20460-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355549;
	b=L94IZmsWcj/iIqKgQv9Atf/nwQ3TkJOYt6Sto041Evm6HqB+9yTdpLMliiUGozrIBRwU
	 /4fZA7YscR3o0IyBQu9W0xOZ35Wr662M9aDGT8E0e0gHKsRovA938cEkl54DdL1vP0ABZ
	 ZDrGPrRmhvjvqTvAVrOSGBfxA6oUmdyA4+Z5581hrzwvuaby+hmvyFEvHt2L/4HUWTfxX
	 JH0UdN6Er/JmPEYPt9SgwjQLymBNzu0AHPCa+jtqoOKEaEHOuP7dc/2WshRHzAnl8tYZD
	 DKcLs5F6TyPynO0RbfKG5fFczaD7sxuWGuheB73wOT799HDqLMAt7M8O9naZZxielrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
	b=MkBPRZueQx7U7eTv3NeZbtAOWOb2NSgcA6tFdehN4P8Z0Fcrjxlbpdl9aiJ8nzNYAVkK
	 xYgNp/Vw5XKFede87ku0qiC4lQftahnhkL7l//T8vZLCR5ESo/8fAUeCxUCsfJqOathDn
	 OAlfldpcNbFkF75kdjii1ujcKK2AWo7gB/pTmG2s45Um8fHiSPrwN9CdcEFBntDilRuCn
	 A1bsYsr9C1dlrRyD4UXsTvwzUE6S7aE7lJEJkp71HfzIgIy/49mC50YmXcU7nDjhk10Bl
	 kEixOjFCLZSnziC7QZHQbym44NWkATi7eubc2i8kM/JhpnA7g2YyaUW+KMo3E8rYZ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f7e8poz/";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71512606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71512606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7e8poz/
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so2046654a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355549; x=1794960349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
        b=f7e8poz/5Clox4WDRyNqP1Jp6o7MT/306TEdwMySi6LiSghlBcSVIWpUQ4K7LzBI7h
         R5xXkX2l+0WYf9XLbb8f7SBfTozr3F7Jwp4GQxpDCcBdqLhiB1vdmlBSU50ppMATBUBo
         mF3CWHd1VrkddqeilPjFFb0gD7aXtiBbtoX1PRKTtR6zsix/56FfS91XfT4OVzz+54ZM
         mMNVT/CHzCTLPBP6WALCcFLDuuFyNz5mB4GGC2lT0VL8X4ZUFpRhO01/qyEcUJkyTyPK
         Xgwg625Ed8CGDSJ0cVUoemiEVa0pkB7YbcZ/SSJmwiZECuzGV40s/P1IGzxzGOC6etHQ
         HUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355549; x=1794960349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
        b=d2/UyBQZq0PcW10Ch6O1Lq5g+UGPu6oOlmYKVeMMlszCoKSTUx35Q5jg6M69+dX7kL
         LEcMUPjLJfrmEqIPP12s6Re2D2ejhdWkm+vciziEQ0LZweFly0cGmRK4MDZiJRXgWE+a
         wmhRS2FQgc/7Q3MyBG6MQ9bAPiDloXIeTUZCZTAD5JWOIzbjDRmcuWopkYOebNcuMeBY
         N6C7RRs2N+JZKmEWRHNVb/ETH4dVXRhBaQDwOQ1+IuIwO6luvKHqCVzSIky9OF8fbcXo
         gOjqs7ouDBxVRRxnAnbJ8jfUy5orwpeJsq1HAcEuUwQneC5TGoJh6MO1Pcv1TxhoWrX/
         yRxw==
X-Forwarded-Encrypted: i=1; AL+hErEL5r9JFuvomgNcM+m4T/pzS06nlvg4gEPwT3qt+IHKBDhSjz4R7WDGkDte09H4u2r2O8VB8xyYkEUC2KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o5sCiKVr779oJVmULVbzZCenTLLZAEqirlicqCZeqoTLgMK7p
	9hr2SxEwtXO13w+tM2MT1/mTOOwuoUi92C2UOgOJnIcmHypydmBDpD5d
X-Gm-Gg: AYBFou0m99nILKiYJ35QG42F4tOA6IUA0KKN7U6gDOT/J4Te/PZQYASFikwROsDsNDt
	1H83yJdel4JFdgA2htccIFLflk1Kmgsy21G6EFv4WGSlBql4D2P4Nmaa9PBzqfUiOgXgim7eZmO
	qlGTW81/w8mCl9bzXLwjI593Ged37n9etKzBH/5fJ7Dben5/DbwpacifLbsFUIBvyFSo5ggWgmw
	BDskR07VkP6EVgXRl6zZzXJgTd9ze/7bb+utiOK1v2SDpkth4BGEk6aDFo9rej3yCyOy5bHvI5y
	n8czaPmTFAiYFrTBB0LXQd7Th7AlTM8FbAOeCYs3FYT/Bu6tRdekFknJGJdh36pqcrPRz9kiSeG
	kZMUDhczrUPkBn6peK1MU7YeGmE76bR3e3FCr7g+PfMIj26TF6u4KAyJmt7OC/RuIZwEIpSvmyU
	0Rf35gGb9iTYC24QIDj+zUnJ9BspN0qLYZPqhccgTxT8Z9re0lAyhVRRnaHYm8BgvXVCg0ZvlXB
	fGgd7/diQl3rB0YzLvH3ru944RGhoxMEJObK3KHWW3I8ywQVPFlZXB8SPF899n/SY6PepyYTJlg
	/mG4uQlH4yLSNSpnXmkfhp8+E4BgUwSKFu0RH2JalP0Fl4xcznBK10TWeCcwGeMTRFAqnzqoxVx
	XpHV9T94vWQ319WKIcp3khs6+sBj2dzTTEC/d1bJoMpN8L7c=
X-Received: by 2002:a17:90b:1c11:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b182def9e2mr675655a91.2.1794355548631;
        Tue, 10 Nov 2026 16:05:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:48 -0800 (PST)
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
Subject: [PATCH v24 00/16] ALSA: virtio: serialize PCM recovery and preserve capture and playback progress
Date: Wed, 11 Nov 2026 09:05:27 +0900
Message-ID: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
It also changes capture to request-owned RX buffers so a valid short
completion can be appended to the ALSA ring without leaving a gap.

The previous version is at:
https://lore.kernel.org/linux-sound/20261109234049.79534-1-mynameisjune111@gmail.com/T/

This replaces v23 in full. Apply all sixteen patches to the base commit
listed below; do not apply this series on top of v23.

Changes since v23:

Capture now retains frame-aligned short completions and handles empty
requests returned at STOP or PAUSE. The final tail can update capture
DRAINING. A paused RESET observes the last committed position, discards
samples through that point, and keeps subsequent data at the matching
ring offset. The earlier direct/staged capture split is removed.

The intermediate bounds patch accepts a bounded partial RX response.
Initial RX reservation, ACK validation and refill enter together with
request-owned capture. Earlier patches preserve legacy capture ACK and
completion behavior while adding bounded payload checks. This avoids a
partially converted PAUSE path between the ACK and RX conversion
patches.

Playback response validation and pause progress are separate patches. An
invalid used length or device error latches XRUN without publishing
successful progress. TX completion caches latency without dereferencing
the ALSA runtime. Resume and failed-pause recovery schedule pending
progress. Limiting the indirect queue to buffer_bytes - period_bytes
prevents an unobserved full-ring completion from looking like no
progress.

Matched pristine-base and v23 QEMU tests reproduced the capture
regression and the playback stalls. The playback missed wakeup and
modulo ambiguity also occur on the pristine base. This comparison does
not establish the first affected version within the earlier revisions of
this series.

The final candidate built with W=1 without warnings. Cumulative stages
12 through 16 were rebuilt after the DRAINING notification correction.
Unchanged stages 2 and 6 through 11 match the earlier build inputs
exactly; stages 0, 1 and 3 through 5 have no fresh build in this
preparation.

A delayed-RX comparison establishes DRAINING before returning the final
completion. The earlier local candidate left the cached pointer
unchanged for a full-period tail or a short tail crossing a period
boundary, and left an invalid response in DRAINING. These six failures
reproduce across RW and MMAP. A non-crossing partial tail succeeds in
both versions. The corrected candidate passes all eight cases, including
marker readback, XRUN delivery and reopen. Cached state is sampled with
SYNC_PTR using APPL and AVAIL_MIN flags, with HWSYNC disabled, so the
observer does not refresh the hardware pointer or invoke ACK. This
checks autonomous publication; blocked-reader wakeup timing is not
measured.

Earlier R5 tests cover partial, late, empty and overflow STOP,
PAUSE/resume, DROP, RESET and reopen, plus playback accepted/rejected
PAUSE, immediate HWSYNC, two-period queues, stop-threshold XRUN/POLLERR,
and malformed TX status/length. The R6 change is limited to capture
DRAINING dispatch; playback and running-capture notification paths are
unchanged. R6 repeats the partial STOP, PAUSE/resume and reopen checks
in RW/MMAP. Final-source RW and MMAP captures each ran for seventy
seconds with RESET/reopen checks. All seven segments, totaling 7,104,000
frames, matched the unchanged independent sample oracle. Eight
additional final-source cases with stop_threshold set to buffer_size
also pass in RW and MMAP. All completed R6 runs used ARM64 QEMU with
KASAN and lockdep without reports.

A delayed-TX test observed completion, close returning -EIO and
continued guest execution. Its buffered log does not establish
completion timing relative to close return, and its backend hook does
not read audio pages. It therefore does not establish post-close payload
DMA safety.

The default RX conversion adds request-owned memory and an IRQ-path
copy. The capture_staging, capture_allow_short and capture_allow_empty
options from v23 are removed. Existing configurations using them need
updating. Packed status and RELEASE/reprepare pause remain opt-in and
disabled by default. The new default path, removed options and cost need
maintainer review. CPU, IRQ lock-hold time and worst-case resource
overhead have not been qualified. The playback queue cap reduces
buffering tolerance, especially with two periods. This revision has no
new physical VZ or KCSAN qualification; the earlier v23 physical/KCSAN
results do not qualify this changed RX path. Uncertain control timeouts
can still require device reset or reprobe.

I would particularly appreciate feedback on using request-owned buffers
for ordinary capture and the playback queue-capacity tradeoff.
Preserving full-ring TX capacity would require a larger exact-progress
interface.

The new STOP and pause fixtures are local and have not been published.

The pause option documentation describes the STOP/START default and the
optional STOP/RELEASE followed by SET_PARAMS/PREPARE/START sequence.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

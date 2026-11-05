Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862536;
	b=eHTngYK60uUZfy3SSlpJ2slnCohc/wdaPWQvNE4FrbSgXESukklay/3Xv9eA/HyzEcyl
	 ngr6HcOA6GofmQPtcNSF/vThb6o7CS+EIjWpzo4/hKmAVvmDcH78kLW969VWwlpCM5Akw
	 2r+LC6uYuJ26qHvtdv6a6XTq11lh2Kzfh1pQes7mdOMuAJKsRQzT0fOL+BEsIMSnVMjah
	 eBhfmTfU29OkkUBm/A6jpRPKe4kZ1UsIRd8guZil8zJhYtYthJAB2XRg1hH8M/yeg0kkD
	 LbU2fIzsK2OZ/jtgKOspcfKqG6B1tI+nVSKSht4n7MYkuybOaWzBkNrZ+dnZRBknNcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
	b=1Ttqst5gouRjxrysPq1Lo0SLMPVUK7tO/LSM2u84WnrpEb+n+wi5X+ndBQkkI12S/iUB
	 s8kGw6f0LZfQz/ThVg5/tLpdCs2oBxecOB+OKj8TJXTUMNhpf228j5SXoHEhv2D6eAjC0
	 rfj6I9Ti13k8BWXDsAb8NfMilvSbjx8XmRG9NdMILnfC2rADgM3L/v2pTpUBKbKKitxDa
	 VuuVOKdB6orNn3RIV6kULCUiSISOQZLJ87x/AyrpakmPexZNB4lyLfez52vjj/T7amKRM
	 kV78hAOHurKoTsfAKrKF9pyL0bhfTcy6tXkQVyUAzSR6Fu9knO8gjCt6SH6zXn1antA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8vJaLNy;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA6E606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA6E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8vJaLNy
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36661f953e4so2138009eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862535; x=1794467335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
        b=g8vJaLNyWdK/2IwJZX87OinpbOSbz1AbzBqDx/r9PNCRj7gx/giJfw5qv+KHxpT8Ea
         m0okD5WVPkaK1r1dc9ypYrL1bcsWXabUAEnyvHgKRXf42UnDbNaEtzqN1lYChqqZmLnL
         PdynBAI/2lnw3d57FB0NLENAxt76wBUE5iyvJ8YFgwT7iEiZKCAp7g6oL7Ifo3wDLpjl
         WPu2dV5cuTIiWH8zL9C1Il0wUqCoGzu5HWGC8lXbuj853zQq9MNnztipXFpP+N/R00+i
         s2PtGX7PViqxqZtr3abHvLs6IrL4BdJ3jj9aDRpSOVJBKmKbWBG6xv1hz9AYHJ9Z1gDf
         hdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862535; x=1794467335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
        b=h+jUDKdytpJUbbOrtiTW4q8zghV+gsRFRaX4DLyi9DJoWD2DuLFLto8/n3CnsNTKus
         YYNoB86bvvAnfmdvn7J7MWa8vRf5JU82XQ7y847EXxE0wIFTG+Hizv20bx5Q2XIuvBve
         8q4Bjte2Ma4wAgtnZPVnBQSuWZ2lBery2/VaOLG0nd9N6KTwXQyn9j6kaNvxSiAHQfGP
         2q3AifTNyIx82L+py9hu5Rn/4zi7kscAtpkBlaq61TGnsk10o9E3DZnmXa970Sq5Cf03
         CoNJ3Vlj3YVlGWrDrTC75s88aBUaF1H5khNBmPdA/pCZYcDqD56UZFYpempibvB36VIn
         O4Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzC53ovbgq29Lplc9FfELW/cmA1cYBfELEgmvLoaTrD9c7IZcVFAxh/VGf8NHIiCt1Qzp07Mdum86fbPCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PBmHxNHuLD5WA4vkRE8ifBbzijcugd/s6RsYkviWICCk0puB5
	0jrEcT9id0lI2NavCMhtjwgdVmtEsoKq/2xIaUQ2indc5mzmwsyatksq
X-Gm-Gg: AYBFou0njfoLnlXkVEKHDb44BCsbwLVDg3C3yX+3BOn9YR+9zj2BcJRAh4OnDPnbZf4
	cQKVGaUvrTD9foiajoPf8TVM+NklGT4DU664G/wkoy79mUnNJ7TxH3Y1qyMeUn6OZ6wgmsI7c95
	nFOnCh/N140F4DgQTrHSUeIf7wuSaNEFpsPZ1IdyPqzumNWA+e7Wi/rwZHKjqlFmWBulK0sm9Yu
	Oaf5BP8dKP8K/jYeJAG/sKrNPJ0M///Dbj/LSv6CQUUTYiMLtW6xVw9fLgS7IjNOczIZ4KulhNm
	u4leK7xCOqe0Wn082RKFMh88K7fvHaDyC72NvqfdY9x/UmPO0rQLzFRXOT3Z75bqpHtGrYU2sPX
	t2fTm2kty1amQSvX1qj1+Kt+wrTAfMsYGYKUg9rWL7FHfHR/kw+cjCqBFj1F5lmFBkbxmYLcmS+
	a7u9sAsFATW1CnjxZTnQigjiVgN6uVTWDm9u9Q28/J48/K0s+8uenXo64wPKwav7BbuuLEGjfOy
	tzAeqLuz62Ao+BR9qMExu0SB0GbDQw96C4MJjSYKvee3bpB/ScSDIHrbGGH7uykY7nw2fxKmCPA
	5Sm/Z/oGYw2VuRe7A6idWtUfbzm1GmfMyaEZu99SqQKwYYYcOxD9KwgC3xfAAiYsws9fOOIfI6I
	XvK0BRwdJLUPQdUY3JmWWX2lMBPiKSOODUslc5TkKt95TZUA=
X-Received: by 2002:a05:7300:5988:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36a42426236mr26992906eec.41.1793862534957;
        Wed, 04 Nov 2026 23:08:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:08:54 -0800 (PST)
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
Subject: [PATCH v17 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Thu,  5 Nov 2026 16:08:33 +0900
Message-ID: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

This version addresses the v16 transport and timeout findings. Patch 6 tracks
successful virtqueue allocation so rollback does not call `del_vqs()` twice,
and so queues are released after a later event allocation failure. It also
keeps freed event-message ownership clear across freeze and restore. Patch 9
keeps jiffies timeouts and completion wait results in the kernel wait API's
return types. Patch 4 keeps ACKs rejected with `-EBADFD` during XRUN recovery
until the core publishes PREPARED, preventing a duplicate linked XRUN.

Patch 10 retains the staged capture lifecycle and DMA ownership work, and
defers linked-stream XRUN delivery while paused. The v17 follow-up arms
`stop_operating` for every member on pause, keeps a failed linked group paused
until a successful resume completes, then reports XRUN through ALSA's normal
group stop path.
Inactive `sync_stop` retires stream ownership even when the stream was not
marked stopped.

Validation:

- The complete cumulative stages 04–12 passed ARM64 `W=1` builds with KASAN,
  lockdep, and OSS PCM enabled. Candidate r5 changes one line wrap in
  `virtio_pcm_ops.c`; its stages 10–12 passed incremental rebuilds against the
  successful stage-12 build cache.
- The MMIO partial-allocation test failed queue setup after queue 0 had been
  created. Baseline reported a duplicate free-IRQ warning after transport
  rollback; the candidate completed reprobe and remove without KASAN or
  lockdep reports.
- A final-source r5 PCI test completed three remove/reprobe cycles and final
  module removal with no kernel diagnostics.
- Linked PAUSED XRUN tests covered native pause and pause-restart. Baseline
  moved the group to XRUN while paused; the candidate kept both members paused,
  accepted `PAUSE_RELEASE`, and delivered XRUN after resume. DROP, peer PREPARE,
  failed resume, blocked read, and close cases completed with clean fixtures.
- The final-source timeout pair used `msg_timeout_ms=2147483648` through
  `snd_pcm_hw_params()`: baseline returned `-ENOENT`, candidate returned
  success. A separate HZ=1000 synthetic completed-wait probe confirmed full
  width for jiffies and the wait result; it is supplemental type-width
  evidence, not a device request.
- Final-source production RW and MMAP reset/reopen capture ran for 70 seconds.
  Seven final-source segments matched the QEMU sequence oracle; fourteen
  segments were compared across baseline and candidate.

These are guest QEMU results. Physical Virtualization.framework devices,
NOMMU systems, and KCSAN were not tested.

Previous version:
https://lore.kernel.org/linux-sound/20261105023140.18373-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

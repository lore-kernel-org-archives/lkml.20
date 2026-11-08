Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182105;
	b=3+Juj9EDheerBxhmPRFjCcnjcl+2kNfFdr1O0g81TVTFnKabYULnYeGRxIMV/lDXdWUc
	 AXLlNIMn6TPe15bN3ho7P/WqKuetK5LkBulfNXZ3AKHgee/WfswkzHtCyF4DJSasZIoHb
	 E0uDhI6K6PwhFiKVkIMSV/NM0lqHUe71wl6hXsXpfX5VbSC5H96zcqw0wyWiaF7ULjcHi
	 eEB0pcmLAMCyIpIHJgItmHNcrTamWbYXXe4ksaIi8XgAy0YSON+C77lB5m9uNGoOR/zFR
	 VymW/dJ5VABUs1Q7oJ9ghU+oiPiUHd2Kug31i6m8VVDuwY8sny/Wm0/JQh85u8m8N3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
	b=eseOdCHluIVOaDFaCJgx6iiZNZzC5frKeKp35I0DzhK06YrGUiLKjYsGYzwcPtm8Y0hQ
	 iAWPSXcPpfT8H2YOFCTWC5IUJXlmz39elhi8E6DUWymNntmf1b7o571f5SEStXPHfU0g8
	 pCoYVAW2fO51X+usl1Q/dwUc6LeaB1EuOpc1XoYdXFeIbb082t9acRDKWFRKtgh6MSvu3
	 bHVB5MqRnyBYFEXD6Sx8chzNwDnAqiMt1+yZKOtHGkAAdt6YwayklwB0YDCd0STPaQnhq
	 AxpvQJmNPY4LIP0niNkDN8JTKbspNEIhkd7l3SbpMgBaNu7JAljYKJ+M5ovK0l/GHhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFHIbKjE;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9FE606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D9FE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFHIbKjE
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso1553025ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182105; x=1794786905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
        b=sFHIbKjEJRaY4JsTqNuS3RtpuMM5gvvAOlg0e4OnoEsdETN0c1AReW99EapQ7+EaF2
         wla1gubVvVOPIJdmnRBIEn9bVD4kyFrBzteyiXL5PCVr9n8ZBVbFOzh+lKsHBr4Knoca
         Kc/qM/oNlN2xFza2aMAFL3EFKKZBLgSxF9nZ+qEUq23dJOiHYl+LbpuOTPPLp05w9sGN
         rwUOhbSNKWGM4lz8pgEkF4pw+UuoPGqpnVlDopQRJsAt5keblN4eLxdLOBiiTKqD7txc
         5i+02yuWu7U9/bUp+kax41mtdr8DFaAWu+62YUK8MY7jSeETdpKh3YO6xSgRsJ/DuiPc
         yPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182105; x=1794786905;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
        b=NiCliURcxRy4a5LNCnWOoceXFHrHgDM520TpI31zGb+oAaFmScgDcX3J+dSzetHovA
         6qM3zzwwLBapa6bez16JwGh/Id2MzkNH1MjGKjxwc4VIQ5fG1ZJzZSRf4S7Yt8fC4bGl
         YsiODTAq1EUBMsf0F7xkFr8aYQiTm67PQzEWG89iD3GRpe7InYMRovSXz0Puf5DfXP3j
         BSll5NpHzXP35TdEZ5ST7SrPQfMVvC/5nUF01W+x9JubBUCFTLCJPDhNTVCIUXnRBLTo
         gP6WLH5i0Z1DCiQuQ8FqidY7XN8DPyBFvVgReaMC9JdL7+WrvKZF0aN/GLGMJWqgnn74
         yTXg==
X-Forwarded-Encrypted: i=1; AL+hErFZN1gkctQ6OaTNawMyQOWsdY8tFq59Y9d4fgpCzqijC++4lLq6SRYM2vsYN5p9ou36dbZlm0gk0jwHERg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AfH3qG3TFIijZepmIW99Pe4Zgia74CtNRCnkOffpaxu8ckJxd
	iU6xQhuCH+KuPlBIp5XMzdHklcLtX20hEk/jlDSdyVjTFBU2UVT3OyEo
X-Gm-Gg: AYBFou2zyDfLNbePD91S/xn+wexDD7O05Z8yTMCDDef9cbpj3if/pdINmUWYgIn60KP
	k+R+QRUsUpcvWgEG0dr3HnHY+RBEfLm6B5L6S/mIyRtJ3QyFVxQuDYNtBCFoyJSJs2gk6Lh3lgB
	X6aKNMgpgKsiMz1QZcwGDIBM+lam4FVhEoMoc+vINHyvVHbmLhpq82rjRkKDzY42tJSt8DjrPJ6
	lfzsLm8TDvASOq1evCSg1nNXg0CRncvieHnZynOVlIeGT9Wa6eX+Lt2bWRilT70GrhfAm7d9KLg
	JxDZX/Uq4aB57c+JyCxH1hsJpjyRVGbQZvB9I6bzfB/sPrZqbqKFz+4ZpzpxNSOZqwm+6WH2Jlm
	SgvogKa53JvxeUswdW768p4GvVvHQv1Ot2HaGN4X2oqkmj5xDqd/YsGykwnN4oyClVG7U0hVguC
	6U8cdKk3hcKpZ2jj9L87tlxf8/+B7+iK3oiA8JvZgZQrlIK31J1DrudRQcGljzLX/oyJ+QNoBc8
	gP5SSvciE9j2jdUaV7PiId9MFwLOLyJCSBqgweSR5qgjpmvN4tTkb2jozoozAPpoIOfP8sZhLGK
	hKvR2FTLsLWIwiIPhPKOM8DrFEx+PJHnUbEKsYta63oTrEXirlUTYk7Gr6UnsSvlXw+oPuJuI2M
	ts3sbjUX3xuag/mayxQ2WqmrxI/5SOPvu5y5j4ySHord75aE=
X-Received: by 2002:a17:903:3846:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2ed833c45c7mr24963405ad.8.1794182104822;
        Sun, 08 Nov 2026 15:55:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.54.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:03 -0800 (PST)
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
Subject: [PATCH v21 00/12] ALSA: virtio: fix capture accounting
Date: Mon,  9 Nov 2026 08:54:45 +0900
Message-ID: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
a4311e9447bbb219044db38897f95be112f46a8a. Relative to v20, the source delta
is in patch 10. It gates START and PAUSE_RELEASE while PCM prepare is active,
before deferred XRUN handling, and repeats the admission check in the native
queue and pause/restart helpers. It also retains the stop_operating teardown
marker for a stopped stream after pause/restart RELEASE has drained device
ownership.

Validation:

- ARM64 W=1 incremental module builds passed for cumulative stages 10–12
  with KASAN, PROVE_LOCKING, and LOCKDEP. The stage-chain build used an
  isolated copy of the frozen v20 build cache.
- A separate candidate-only hook build passed five bounded lifecycle
  assertions for prepare-time admission and paused teardown-marker retention.
- A clean no-hook QEMU capture-only run passed RW and MMAP pause/resume,
  DROP/PREPARE/restart, and close/reopen flows.
- Ordinary and staged capture passed RW and MMAP reset/reopen runs. The
  14-capture oracle matched the QEMU sample sequence.

Lifecycle attribution is static against the immutable v20 source; no
vulnerable-baseline race reproduction was performed. The combined lifecycle
and playback healthy fixture exited 1 because its playback probe failed at
raw HWSYNC with -EINVAL before attempting pause; that run is excluded from the
PASS claims. No physical-device validation or KCSAN run was performed.

Previous version:
https://lore.kernel.org/r/20261107143422.29319-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a

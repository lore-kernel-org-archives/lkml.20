Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270093;
	b=1kREJwJTn7ggLOhOFFU0WltI2BAJh5nkU2D3Q8bJFoYOQruTLHMBtYq3pjUnNAV986Sq
	 lALSNXGPD6+TFtT/UtVLN89+OzDXpbonpscAzPYquAO3kFF/vcEHKlmpenAbH8HLNg2YF
	 C1fqYYjdSSvR2ouEF4NgWQeBI6kuiKCNDDTkf61jWSNYE1Of5BI3YXfPTbJ++hcHhPtzn
	 ljy5CYN9x5C/VSsFdtO9bmj1xhYzkTUvPcu6E7/qCpEZ4FASk7c7dNLNorW/UEoDkCeeX
	 JFpZBFEE4Uweg/OK57S9U3k9Fl9OwFV3+DiU1p/Oi9BT8ymZJbw0j462XDz/NInAsEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
	b=hGrgTs45xdLPqrK8LRsddECBcNtNjnpeJaC0kvGZ+Dkni4YVqjPLoitZPNty1JEVC9WX
	 INbSvWVLdiEoM/lBf6GJ1xqJcdWqU49E16Ddz5SkPPZqoMO1+VOY1CnTu/TIIshmtsU/z
	 5SzZGEfzQ1F8K1RUyQFqQmlAlThJ6g4yNRrqo3u4cy0CmHkPTg/jOTIKGQA70j06sfDoj
	 NQFM1hAMBiqDCOtGOC1zUqs5XeIZJ3Cq3f4r7bBCeihNNgYKngUrolyHKV0naUXJv7Q+4
	 oStl8WelVy3vt71bO3qdaNI3XLocPqRh/v0BoonVVCdKKaUxcMWNxq0jIGq53a9MknQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7qWuPVm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DD6606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DD6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7qWuPVm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so15286345e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270091; x=1794874891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
        b=q7qWuPVmbQzoIrN93dX5MW7S4du33xxt/lkFUY3jVbdvhWnnSHyxrJIPDUVyc7A4RV
         tQ+N0j2vXdVRlu+gP5XAU3v5M0Exa18rZungDqVoJi2bwi3GiNQEq/OxVL3g7Bxy6G3Z
         1uSU4iyo6C8f/nvHdvqqPMQO00ItW6YPUqdfmwZ8MZkj+2sQHluz/Y33muTmXdykkpJD
         5qMm2oCjMvEztBUlHDRU2hfsu4ZveoKBd9jM4O6zo89Wlkf+78BQthSpbqN9OkvWQwQN
         btE827OSoWfaTyWngTIl6hqTuAM0tHl3eampCQOYHM5MbLIeKtwC1OM/HRknQbZSckHm
         NhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270091; x=1794874891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=accdJuryFxUi1qakKS5LSbXbrHZsB3mH/lXDrzc/Vh8=;
        b=jRD9p9ZZ41xsZnD32Qv8bQvp4F2E5Svs6oHz7nxPSWuPj0RNFKfIeHKOYAApUMKPe9
         xF/s88XjYPw/IDlanuq5uOxcfWedAjZ4hDYdCTGWOvE70PITkfUsHuXZoXIRKTpU0WWq
         3H/zeEGvOAKqFzeNwXE8PicNPAsyjqK4784TuUfv0qcNF75O3NmeoHgU+i8McAneZ3nM
         0Wasnw/w+jLqp7dzSHbYOUHUBP7mPEKRRshzbvVs6owGuLfjb2dVe7bHGizQV5iCbUkE
         gbopD20OgdlQaAWfGU3Mz+OX0FMB0TGL1AHNZyFXR8s11UuhqxsWot1p8aQ9h537oEaN
         CdMg==
X-Forwarded-Encrypted: i=1; AL+hErEVngGtOBdBfv25dxUPTp+OHKATb7yHnmEzdCvgefJrVde+8IN5iDLWJfTOgVGc+en4WKv4qFtYmhgyU+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z98xCs3QL3dpLoZx8hgTpYjEh/cu7EqFNyD9MVb7O/Dg25lmRtZ
	cQ4R66A4cogNvNp2BGcrzGWRCjSifmwBwKdea8SYOQlE8y5yRvqplEri
X-Gm-Gg: AYBFou2ihKlviazfWH8o1Qcy/wlmIaQTFxQbK+KlI+XgHAP2odrnLDLUGO+x0FhV3ok
	FnJwnD6nv7hd5qickMdMCojrhomVLLLGu7n9+GatnrluqgSomfS+VU3+CpGUsdniHX60O7+WK77
	vvw5IUz9ujmThnO7LIumneVnAwo5zAxWA/+I2afuGsPw/h/IMoEPK0UGTHATnvjucCOYZguaQkt
	ApJCW4vsvQXUcsO78fFar43Z2EPot9nPXSORkkpcQ37fq1wyC7tKdhBgfF5uwfgT4icRnYA9Tqm
	/opY8Ul+i+FZrBql2NTe0xLLuyh+YNoL1YOJ4g0+0ZXfyT3gXBADkvf1JOYXjEBtf/a3x5gzkvE
	K+yMNtDkP//DOiNzQhpAR+f2TNJFrZvebHy9ROHWhevArzLTzmAVaNCjNTnAGnDxvoiQlhBjpDk
	nLEMzMvA6RkVN+tTqllmUZKd6XNu38FnBhiJugmQ1V0jLH6FNGQsPQZCdonGX1gokN2VgvOxnNk
	0LeWeF/kh14ky+s0KbJx/ftKxcRGeE96OCWLmNQleNtYFnPSYeIJ8MRpx1spUCQmsO+rmsXSpqy
	wJHfaO1+8peEFn/oSUfVln3yttUhi1IeP1mAsev+mYJxyj8YYYeaiV4AZ5DmYsmHQY6fUc3RYRm
	ZcNnn/o7gjhcxnheXZ9vFaFt4udIInrdUpVh6F8W75clGSftAdlWcprwnAAP81v3znCpRkTDazJ
	PCVBpWcOQ+Ww/lK75sLyPtEvA=
X-Received: by 2002:a05:600c:4f86:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ba02340fefmr12950385e9.13.1794270091356;
        Mon, 09 Nov 2026 16:21:31 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:30 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 0/2] wifi: ath12k: accept what newer QCN9274 firmware requests at boot
Date: Tue, 10 Nov 2026 01:21:19 +0100
Message-ID: <20261110002121.90167-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
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

QCN9274 firmware WLAN.WBE.1.6-01243 requests two things at boot that
ath12k does not implement: a target memory segment of type 0xa (AFC)
and direct buffer rings for module IDs 2 and 3. Neither is needed for
operation. Today the first gets a wrong answer and the second aborts
the parse of the service ready ext event.

Patch 1 answers every unsupported memory type with size 0. Patch 2
skips unknown ring module IDs instead of failing the parse. Both keep
a warning, so the gap between firmware and driver stays visible.

v3:
- 1/2: clear the size in the default case, no AFC case; keep the
  warning; describe only the response change (Rameshkumar Sundaram).
- 2/2: warn for a skipped entry instead of a debug message.
- Rebased on ath-next.

v2:
- 1/2: do not allocate the region, answer with size 0 (Rameshkumar
  Sundaram); former 3/3 dropped.
- 2/2: commit message and comment reworded.

v2: https://lore.kernel.org/r/20261102200235.48973-1-gsustek@gmail.com
v1: https://lore.kernel.org/r/20261030220836.14164-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: report size 0 for unsupported target memory types
  wifi: ath12k: skip unknown direct buffer ring module IDs

 drivers/net/wireless/ath/ath12k/qmi.c |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 2 files changed, 29 insertions(+), 15 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0


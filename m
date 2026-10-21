Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617067;
	b=AehRaHihJnz1Or6D3RWHIz2XvxO0hl4iM1t5+xtt2x1Hz1Ic9GS5UDZ+iXRLc/LsUWB7
	 jlQvUOEL7TwsakHXzSdFm45SJObs2/r8a7nDppcFDwh7xWaqXKiO2i9q0Fwq52x5wK5UR
	 Y+TfqR9wSs0VfV1Nkxdj0gkiIw0aY5UsqqUP+mr6XzpO1ifE+69AWPzqyoCadDe9SQh62
	 H0CsAd4rKnNRqAZeRdNE9MRUTK21NoJwWS+BolK0vFGTrGBeOCsSTHT3LRQPnPJMe+8zV
	 WLuv2i9d1Xtr3m+56wpCgsrkwozhjEzreh8yaatNz5CKfA1oxI4O9Y99j5D9xteYskA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tJhC0Ffmn6Au+X55U+ymWoJQmHp6YtJ+SrtYAdk8xK4=;
	b=Ia+jgU21AT2UKTOz+n9CmpF9meCytHPpz4V1LcMabfsQh/e8JtNuobOfiAzdbNaPcqvt
	 aVNjdk6WvP7wt4cfqkdWDtcA4NDUjfqViRVuDdHnL5pwgURMBFeD/NAFxPDL4bEtKSrPu
	 bA2D9La9017IzX28jHf1s6j755wO3BprYF0h0l81ZsrU8c4zg+NxxA+pVGZV5UL30PkJn
	 eFJJyCqm9nwr5kXHMBIJJXhmcXTeu1C1gChDdlM5deYS5J3l4S6icmNfFKi25rJWb+YmA
	 0JNn56oVP66bA+cPzaTBWsd5CXl8iR5RzPYie67T5gPq22juZZGlkqmdnL7bMb+0OEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oTpxeRYG;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78839606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78839606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oTpxeRYG
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so10035715e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617066; x=1793221866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJhC0Ffmn6Au+X55U+ymWoJQmHp6YtJ+SrtYAdk8xK4=;
        b=oTpxeRYGwgN7QXE/HBMuXqHgL8hX7koj5gPjEj1b2AtejPZmeb6/s61E4Z2fonk/1S
         ssG9d4XfrwVfnESFv8IvWpL+Eq/iZ3A0AUO98m53mdN9+MBTWKa3SotgpKhxVo2tRAOv
         BdyA1bTpbbh+BRZR3jKbhjEhljzDKAXB7NE7NFBIAfU+dIgATetFqHT+jaURnAGNt68n
         JJkgAvlpsCL7H4cnYpBqT/FcJQEHoJBxkr98m2yeWj1yG02nStlhCBr3aP9XTTLKpQdO
         /SivsfGNkYpeQjcLeGFXYwX0h4qONNCnR8GvLaA/WNQ0cbsZIz7X2QeJJlbTQdhO/B3/
         o4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617066; x=1793221866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJhC0Ffmn6Au+X55U+ymWoJQmHp6YtJ+SrtYAdk8xK4=;
        b=1+0rM45OC8Oh2hkZnOi/cu1zFx/0lH4chX4K4L7cCp2f1pLmSTIqX/6iLIg6t1Qj+C
         Ti5BQdfg80cLObssvqpopVs+BIIAK5oVs30uW5k1MCRRQ0mbshSquKlO2tDd2Hyn3X8X
         W4knMdS2tVCWZDdwPr4piNkkCnQDyNVbFL/SoX30ZFlGp1WO48PU4tXgd82a5zF4SQM6
         S+MXDajlqmDHzHb3ANx2OojV/WnGcsYOgGTEg5BtNfsPMgxPu6egAFX8CeOo5qSEjF/0
         flTFAh9lMXX4nqHYCB0g1opz1Cm+FpyysR8UJPn3PvZgptqrDOXL48H1smHaTUMoVZFS
         eKsg==
X-Forwarded-Encrypted: i=1; AKwUvBwHVpX+S8Jn9X637q8fPNe0nmoJkfLihZZrreF6qGNFFNmAJ4yZ6qsJ44scn6hn6ugC39z1TKP1HIKdyNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUDLZpCb6ibh5745nKTX1jKWwsVl+oYNY4t438OtgShmKfxsJD
	ZcJ2NUii6e8QpwOyXMuejYHdPtkkxq2J7HSmQyyaXKWcF2E0tRNA2C2+
X-Gm-Gg: AYBFou3U0b7hZpDdsbAcmD2HPyFYIC0jHbq6HbJKKxetSceUYqNGzwTeuFwM19IDEsG
	WajRjoCjd+pZ5VA/B7lR0l07yzwZalKEdptOkjGHxjfKRQ9grTMUO1hJe8qKnyEiMDteXrChP5a
	aTijJrxVPb9XSdYgifcN+y29uLh+nwNeWxNtSC4Q+hS00/3YaRGrXFcsitjyg+xrz3tFEty3x7/
	h2d6/RTXSoddPDhR7imWvwjDfUOaerElm5gFDAqliVPa893g5Su9DDFtQ1nibsaw5apAvNWPJda
	0/mZXjyvlpx6eYUMZfXQrtpSjFmFjMGXWoGCWC8s3gAtn36hktyErEph19x3HWz0/C2t9rduAPF
	hocszYWV4Vf9T27M8DGqCcgBtSIVk1t7zb1utfmTniE4Cf5EzC7FZdkUvITJLxaCeOdtO31QGkq
	DuEtgQDpZ34RDw5Ak+T3TdkkFLngb+uUpUXqV65iOGn6DPWJc4N+L2vRFrsp3ueiIZJj4MyzaUd
	XMMzviKYczAeul6Gaq84nZgzelfplrObJ4KqF99
X-Received: by 2002:a05:600c:4fd4:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a1fdd53c8cmr68455165e9.27.1792617065604;
        Wed, 21 Oct 2026 14:11:05 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a25fb5sm22891525e9.6.2026.10.21.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:11:05 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [RFC PATCH 0/2] memblock: keep reserve_mem regions out of KHO bootmem
Date: Wed, 21 Oct 2026 23:10:44 +0200
Message-ID: <20261021211058.83483-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
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

On a KHO boot, a reserve_mem= region that can't be revived (new name,
size or alignment) can be allocated from KHO bootmem, which the next
kernel boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG preserving it
fails; without it, the next kernel's memmap ends up on top of it.

Patch 1 factors the bootmem check out of memblock_alloc_hugetlb(), and
patch 2 uses it for reserve_mem. That also drops the TODO in
reserve_mem(), which asks for the allocation to be outside KHO_NOPRSRV,
though it's bootmem it has to stay out of.

Questions:

- If kho_discover_noprsrv() fails, only bootmem is NOPRSRV, and
  reserve_mem() now fails with -ENOMEM instead of using it. Is that the
  right thing to do?

- Should reserve_mem skip mirrored memory like HugeTLB does, rather
  than keep the fallback?

No Cc: stable, since patch 2 relies on 14773e2aa4c5 ("kho: extend
scratch") for room outside bootmem.

Based on next-20261021, as it needs the KHO bootmem rename from
liveupdate-7.4 and touches code changed in memblock for-next.

Tested on x86_64 in QEMU.

Jose A. Perez de Azpillaga (2):
  memblock: factor out the KHO bootmem check from
    memblock_alloc_hugetlb()
  memblock: don't allocate reserve_mem regions from KHO bootmem

 mm/memblock.c | 100 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 36 deletions(-)


base-commit: 9a482184d910775cf648863148944945b74e2815
--
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413916;
	b=Lu5XQljIN/eISf38Vs1EXAm5B6QkvhSIIU+WTrjAo6JbFec2by73SOELY9uXuR8qnHfX
	 IHmoLJE7LcEYiB55XKOqdzocuZfY/qdRejd+WaieXysGXzmr5uBPzUzYBo7NMYuxvC+iB
	 IRXmEdD5IC3WrYDHeF7KdoVOjtrezwfD1fU5mFJ0feXhQi3sBdG/WdFAAF4Y4Tu06W8Q9
	 C2rqlgqN94gP6ErQPAn7p8el9WcfSKBy1+MsrTDEqAD7xqBvLwI/a3lw1a7HGdUh5Uybs
	 k5Lip5ViPusg0qkGuFktUQTKMOeMoOIfKJJFxvJAmqQimxarSKPbDp+kYKb5QDx1Z8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pYaVqWRfVMO0uhb95MhhUmPfOL+wJE0vw9tIEmvoQMU=;
	b=HO8KgQ+0wMrQUUueW1fEk0dCHTsesiJKI0gWvdBGoOBrrkLUlUoNIT8yIXfVlzdfsdhF
	 +HKbaAnL/jmQHJovctjBJuNAhvEbAVqaKZ0AqGM+wdT2FffUOcdxrGjIedo6aljD9MmWc
	 AlGQX6mMcGQoD/9fKMVMHLhMKIlKbjSIdlxLKIMPMCVHxKcWBl4wxNhMEys5Iu/NS/2OV
	 uQSFKtVTomXIQY5Kx9S0iO1zmGws9SMeTz8So5inWMKLL7hu6qvjFKYYy4EySX++fB1fb
	 94pHZLgnssP0q6V04/d8kGECSBhFW+T6KaAr8248alR3EkPJvC4nZ9zCjzSWTpTGiWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Rwc5Xg7p;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Rwc5Xg7p
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso21235295e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413914; x=1795018714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYaVqWRfVMO0uhb95MhhUmPfOL+wJE0vw9tIEmvoQMU=;
        b=Rwc5Xg7pOzJR7tJn91gyQ+7iHZOO1AkhGOyIbokAGQB7iwuy1rDutrIgH8HWLCj5U2
         FRxt62Agv68Xt/BwXY2JVslgR7sN+xb5xZWyiGeqbln29nva+H2xWYlFTmkDQRnvkXNh
         jRqR0ypCH5Pp8NZHKYOlVwNhj09wqJDmivf8Sa4+hfWDMGAOy4nZrGSPLhhSPsDxjCJ3
         bMiPMWUY68s13BiZngXpRlpwIs7s73+jJmVb8p8WDYUEFptoN5lm7GcD2Any49M6EL8/
         HV701N3DNqfIuERDhulzdNY29glm/i2QqkHZB4SpMB90xW0tbT+OmjiQDvNL8N8dLbRc
         y5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413914; x=1795018714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYaVqWRfVMO0uhb95MhhUmPfOL+wJE0vw9tIEmvoQMU=;
        b=fLTS8kxZG7LlI3VpUpuabGCaBlCpdf59cbOM/VlRjWKOXZQUcK57MWeHVSFlYGbjnW
         bklBKusqvbJeQzfC4XosenAKEL2dd/NpX5InlNJvDBN0zErOPDPw/aih2ERFDkb7B/4p
         LcD3poSqttgtSgmdvKpBGnhNlaqUDYnvHcutT2M7d7etOedYY/LGVUQalw2/jHEo1BZb
         L6LkmvonmjQz0nTECJo7gPIpoHOSB3OG3dfKPz0XFyIHXA+hlV8zO1DvLFhY6l3Y2U3E
         19fTQrJ/Ii+Ge2ksrCR9Xr8BuVMhDi2CU+JpjPyIOrDyeEFd7E3E8Wr43j/P5AQz8JD1
         DV3Q==
X-Forwarded-Encrypted: i=1; AL+hErFMwlCCZj/piyNgUE0F//PgwUvPBihN/RQzQ7+BQc+ruDcljb/TwSftqF+6epQfZDtJaiGFQSOpgkOGI6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U+0jqUr7QiX8fVwObJs+Pc/XN/HRO9hVvWKvj+w8lE4WusNXl
	EOiEyYSON3UMupnq89/4ix59U8WhYPgydRGBPyDXRcUh1pdFE7yKC9jl9ENB3nDruk4=
X-Gm-Gg: AYBFou1hXCUReoyk9G17Z/OXHOSVS5k65Nu84iLdNE0T62o7Bckp4YfUOvA5X2NGGMq
	kddAEqI9m1M/+4vWOBUUBTtTrA8vWgFI+VnaWZ9NGNawXzyM02N4KXKt+v7K20//X6K8zis7kuf
	4lUgGLCqWJR0BNUSFXBwMOD9IgJBGX5KaCE23m3fH0O7kni6sSELLKxJypRv8F3FKcDNSguGY6a
	9IInjLRCkvFPAJwugGr70AAZD0jA3vmxHX+lBhKCtIu4kvxujZKz3cyMBZsbBoAlYRCZ3IFiIQr
	F3Ld9pYR/XU0DTukpjk0lrMaOf8tzsAtUyQGuxM0CmroEYle/e3OoR5qhwccSVoXyXXOPX0y0ry
	afpDizYXefHAdyN+kbq++QLWr3YKfaOl+9pRbObbN2hKMs4H4hWKvUfapxh0/7RhAI2dvh4zS1y
	Rs3ViR8Zqzq9W9/AiV4l/7xGxulkps0A3V4xJiNxBp4lqvPgeqP0+rupi9WYWsnQXS4GhheZv+a
	ovdOj3pYauIjaFywOz+MqliQTS6+ya2UYmVD2XLB8vxeXzrDga5NsYFkiRLxKW1T2Y6GDXWhe/9
	ZTZz/TtMEpoRgnDGvpsj9/4dH6hFyUB0ShJZebQwZD1PZW3SWuHNhw3Q0YPVFomaPXrplGtHGb/
	YW/fWSg13DxnTsFgSYVnO85lPcEdYWg==
X-Received: by 2002:a05:600c:8b34:b0:4ba:e7:ef3d with SMTP id 5b1f17b1804b1-4ba09321cbemr52115015e9.1.1794413914216;
        Wed, 11 Nov 2026 08:18:34 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:33 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 0/9] ceph: fix mdsmap and osdmap use-after-free in unlocked readers
Date: Wed, 11 Nov 2026 17:18:21 +0100
Message-ID: <20261111161830.1336485-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
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

The MDS and OSD clients replace their maps and free the old ones
under a lock: mdsc->mutex for the mdsmap and osdc->lock for the
osdmap.  Several readers dereference these maps without that lock and
can therefore access freed memory if a new map arrives concurrently.
The worst is ceph_statfs(), which any user can reach and which loads
and dereferences a pointer from the old mdsmap.

Each patch takes the lock that protects the replacement around the
reads.  __ceph_setxattr() cannot take mdsc->mutex under i_ceph_lock,
so it uses a copy of m_max_xattr_size kept in the mds client.

The same problem in ceph_compare_options() was already fixed by
commit 19db525816db ("libceph: use RCU to protect monmap in
ceph_compare_options()").

These bugs were found by code review and have not been reproduced.

Max Kellermann (9):
  ceph: fix mdsmap use-after-free in ceph_statfs()
  ceph: fix mdsmap use-after-free in debugfs mdsmap_show()
  ceph: fix mdsmap use-after-free in __ceph_setxattr()
  ceph: fix mdsmap use-after-free in send_renew_caps() and
    renewed_caps()
  ceph: fix mdsmap use-after-free in mds_peer_reset()
  ceph: fix mdsmap use-after-free in ceph_get_tree() error path
  ceph: fix osdmap use-after-free in ceph_sync_setxattr()
  libceph: fix osdmap use-after-free in ceph_wait_for_latest_osdmap()
  rbd: fix osdmap use-after-free in pool lookups

 drivers/block/rbd.c    | 13 +++++++++++--
 fs/ceph/debugfs.c      | 12 ++++++++++--
 fs/ceph/mds_client.c   | 18 ++++++++++++++++--
 fs/ceph/mds_client.h   |  7 +++++++
 fs/ceph/super.c        | 19 ++++++++++++++-----
 fs/ceph/xattr.c        | 13 +++++++++----
 net/ceph/ceph_common.c |  8 +++++++-
 7 files changed, 74 insertions(+), 16 deletions(-)

-- 
2.53.0


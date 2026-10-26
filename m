Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036543;
	b=ZVT7n9LYjx2jqYmiJgAEB+c4lTBZhTNsTyT2BhvCEuoPAsBIsEwlONI3oJGKfCIJiTbz
	 6y4ipWdRKjdwou6RHDQn1rTGE27m/t39KtByf1CoakQdKEPT43PVg52N75fxExqcR0UyL
	 4iaefJZiY4fpCG4AKmVIvxksCPiLctSMgfAsyewJABMuuE0eX5iw0sIs2r0MGVCS63Lm8
	 ITbU46fIcAgtYsGgclHC0kK7mkk7UNaNNFyt1DSyGI1+3XRrVjsgj2xhDCL/KwOjv5uDR
	 srTjM93BiXW0hQcpfiq4/oWBOlES1vfgxgG5lynnqK+AsulQ684+XkLQ43ctV79CX+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=B4ANvDZKg/XTDKTxx6DRbKMCW8lIWCNJ9Qz1jlrn4KM=;
	b=rTZj/X79Rinc5dPGqiv6vQ19iFaIStGWPJg7PWYDw2PPrL8+IEnMCn4OMV51trk56fnW
	 jX2A8eXxk6m2dsdbth0XpcgD4d3ba73BIgZAolhIMcAH7BV3IqkRiLifr15m10i/5Yauf
	 hDwqzT/KrS15TVa++7STfBAtWp73RI0+Zv6Z8c/psIwqhppFMRAiiLa0w2m1BengdZdPj
	 sigWs0+EtUYeDI8XIUEZCKjjtw2Rt+Q6WG3iGezU/8L7m1oJ0zTRN7/T/F/yZeGVpJox7
	 QJ2vZ2tRkk06cHGUg5o/rhZrPiHGqx/KvwoFXYKxPKjrRxcvAaqEPKTuN7VBNfdDxrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ABqpX9Vq;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D319606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D319606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ABqpX9Vq
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42394d1e41so274480366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793036542; x=1793641342; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4ANvDZKg/XTDKTxx6DRbKMCW8lIWCNJ9Qz1jlrn4KM=;
        b=ABqpX9VqN6Ssux3wIpQW4nXroSCmeRodpSjYaN/gIHUFht2naaGD/beFCK2i24Cts2
         YK48+BZzpbdgyPx3L4gtpXgZZ+MAfxHqkVpvTogL5562lRcHMpebRStj27qQUzIX/Fkz
         +cEfQpiKQRIVnkGrHDGy9oLo3NUvWyCPeRk71XM1yweb+9Ddou14NgXMCDJGf5GzjYcR
         7xZVK5byIO0oykPbiEoz2L3fvApCyvux6SZ/4OELyQZuA6bowg5OIX9Rzq71nlcJkkSu
         88ZGvrQHAS+N5iLZiL8KC0x1Hzoy48O1aqcBu/VNtbJ8ZoRRFXtalqkSivEPxcsLkvXx
         SgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036542; x=1793641342;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4ANvDZKg/XTDKTxx6DRbKMCW8lIWCNJ9Qz1jlrn4KM=;
        b=DB0wUffw1Kps9fCsrRVxV5aKm+UJ0ER0utrNOnMPLcKesbDhZAX3s2C7dXQLOyimzH
         OEEf5waSnK27GjM+KnBT8uzjjV3POp+294x8RVWFGgbTUlawHiNqxe/GIcyacvjJuwl4
         lKDcji1/UbhyB+j+0+87RVpGC9hmULx3ScTL5Rijl545s0UUf+V0B58QcnVALFewrZLi
         jH5wh+K/JKSjYOH8nO04ZhNs+VZbk7MJwpsMbkR5OBEdX6p6Sj5c0FFofhpNr7GJvCCJ
         vJSkG0kfriPf0m5xvH5DweG7GZ+BLZeYTC9DUIVSsdbnHixdH+4rbG4N189ym2mBOlKj
         lRXg==
X-Gm-Message-State: AFq9FYKWhSGILi55LtokgmSv7ZqgnUxrq8tW40di6qFf3L3HSlzvKrsl
	h6789d8bj0Mo7Bcl07MfB0M6gLUdr3r6u1ZNa7ZIswnxufkXiQhH4ZPmcmx8pNUiP5d8OBvLc3S
	QSOjYrqt0ixS8chYpDA==
X-Received: from ejjj17-n1.prod.google.com ([2002:a05:6938:a091:10b0:c46:a6d4:6c2b])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:608e:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c46bddc4a4emr843314466b.20.1793036539136;
 Mon, 26 Oct 2026 10:42:19 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:42:13 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261026174217.603114-1-tarunsahu@google.com>
Subject: [RFC PATCH v3 0/4] liveupdate: Add feature header for fine-grained
 ABI compatibility
From: Tarun Sahu <tarunsahu@google.com>
To: loganodell@google.com, alex@shazbot.org, dwmw2@infradead.org, 
	seanjc@google.com, Mike Rapoport <rppt@kernel.org>, will@kernel.org, pbonzini@redhat.com, 
	jgg@nvidia.com, Pasha Tatashin <pasha.tatashin@soleen.com>, arnd@arndb.de, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, oupton@kernel.org, 
	baolu.lu@linux.intel.com, David Matlack <dmatlack@google.com>, robin.murphy@arm.com, 
	maz@kernel.org, Alexander Graf <graf@amazon.com>, joro@8bytes.org, 
	Bjorn Helgaas <bhelgaas@google.com>, kevin.tian@intel.com, 
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

Changes since RFC v2 [1]:
- Dropped the file handler compatible rename and per-FD handler
  selection patches.
- Replaced the fixed 128-byte header with an expandable struct
  luo_ser_hdr (size, nr_features, flags[]), kept separate from the
  payload structure. The header is 8 bytes with no features and 16 bytes
  for 1 to 32 features.
- Each subsystem declares its wrapper once with DECLARE_LUO_SER_WRAP(),
  passing its feature enum MAX; the macro sizes the flags entries and
  generates name##_wrap_init(), so callers never pass sizes or counts.
  The target kernel reaches the payload with luo_ser_payload().
- Feature bits describe only what each preserved object uses. The target
  kernel checks them against its own boolean supported table, and the
  header is trusted as the source of truth: validation only rejects a
  required feature the target kernel does not support. 0b10 is reserved.
- Moved the __packed removal into its own patch (1/4) and added a KUnit
  test (4/4).

Changes since RFC v1 [2]:
- Replaced the 3-mask (supp, req, active) design with a header of 2-bit
  feature states.

[1] https://lore.kernel.org/all/20261021152527.375070-1-tarunsahu@google.com/
[2] https://lore.kernel.org/all/20260903023452.721732-1-loganodell@google.com/

==========COVER LETTER==============

LUO and its file handlers rely only on coarse-grained compatibility
strings (such as luo-v5 and memfd-v2) to validate handed-over state
across kexec. Any change to a serialized structure, even an optional
additive field, requires bumping the string and breaks live update
between adjacent kernels.

This series adds a feature header (struct luo_ser_hdr) ahead of
serialized LUO structures so subsystems can evolve their serialized state
per feature. Each subsystem groups its serialized fields under feature
indices, with index 0 for the base fields. New capabilities append fields
at the end of the payload under a new feature index, and retired fields
stay in place so offsets never shift. Only a change that feature flags
cannot express needs a new handler with a bumped compatibility string.

Each feature has a 2-bit state set by the source kernel:
- LUO_FEAT_ABSENT (0b00): not in the payload; a target kernel that
  supports it can use default values.
- LUO_FEAT_OPTIONAL (0b01): in the payload; a target kernel that does not
  support it ignores the data.
- LUO_FEAT_REQUIRED (0b11): in the payload; a target kernel that does not
  support it rejects the state with -EOPNOTSUPP.
- LUO_FEAT_RESERVED (0b10): reserved, not checked by the target kernel.

The target kernel checks the header against its own boolean supported
table:

  Source hdr  Target supported[i]  Action
  ----------  -------------------  ----------------------------------
  00          0 or 1               Accept: feature absent in payload
  01          0                    Accept: ignore the feature data
  01          1                    Accept: use the feature data
  11          0                    Reject: -EOPNOTSUPP
  11          1                    Accept: use the feature data
  10          0 or 1               Reserved: not checked by target

struct luo_ser_hdr holds the total size of the serialized structure
(u32), the number of features (u32 nr_features), and 64-bit flags
entries with 32 features each. With no features the header is 8 bytes;
with 1 to 32 features it is 16 bytes.

On the source side, a subsystem declares its wrapper once with
DECLARE_LUO_SER_WRAP(name, expected_size, nr_features), passing its
feature enum MAX, then calls name##_wrap_init(), marks the features the
preserved object uses with luo_ser_set_feat(), and fills wrap->ser. On
the target side, incoming state is never cast to the wrapper, since the
source kernel may use a different number of flags entries. The target
kernel calls luo_ser_hdr_validate(), finds the payload with
luo_ser_payload(), and reads the fields of a feature only after
luo_ser_get_feat() shows it present.

Patch 1 removes __packed from the LUO and memfd ABI structures. Patch 2
adds the header and converts struct luo_ser. Patch 3 converts memfd and
bumps its compatibility string to memfd-v3. Patch 4 adds KUnit tests.

Tarun Sahu (4):
  liveupdate: Remove __packed from LUO and memfd ABI structures
  liveupdate: Add feature header for fine-grained ABI compatibility
  mm: memfd_luo: Add the feature header
  liveupdate: Add KUnit test for the feature header helpers

 MAINTAINERS                          |   1 +
 include/linux/kho/abi/luo.h          | 359 ++++++++++++++++++++++++---
 include/linux/kho/abi/memfd.h        |  43 +++-
 kernel/liveupdate/luo_core.c         |  62 +++--
 lib/Kconfig.debug                    |  16 ++
 lib/tests/Makefile                   |   1 +
 lib/tests/liveupdate_feature_kunit.c | 118 +++++++++
 mm/memfd_luo.c                       |  68 +++--
 8 files changed, 577 insertions(+), 91 deletions(-)
 create mode 100644 lib/tests/liveupdate_feature_kunit.c

-- 
2.56.0.307.g5fe7bd680c-goog


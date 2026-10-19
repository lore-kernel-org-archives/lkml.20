Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB95285CAA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373155; cv=none; b=Qxxf3weKoO4af1PFKeN/Ra/O19aywMKDs7BOj5hqsYcgYLt/BAoohu6PNZ/sjHaFdIYH2ekLv//lxWfTShOeulUvvw7Bgsk2HLPHpLZDG288dzOHGd6+vqfs7+SBMGU8uGcAGV2qZqjoapXQVK0s5/TqNvMvztBqkRQt/ZGky3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373155; c=relaxed/simple;
	bh=F9/emr7vEfrCscIQuoGwe/cp/5Bx/9AZOgGZ6xMCSCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrWAqqDS5iWNAAUTLbk0hs6fLUWhUSjKcflBbbb9uWpTSK3pXTp9fciL1W77aW8y/55/Kn+nE0izWKUNjBt9ERlCbLD5mk+GYwLiVGQ2YYPeHPxZMw3L7o3CyqM/AoJdwW8KXAgJm0YnzhFYceuZtoJ/Fy1c9dCvrmiq5woPJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/LUv0dr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/LUv0dr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89d6bd67045so597816b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792373153; x=1792977953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DSfuGuXiQE3/PgnWB5NySCEqOJab79pGf9ZzrORjUw=;
        b=E/LUv0drEhvqkHYbI7pw+HEMgSRXXZNWWQfZTdPEggyzrpYj+bJBKLMXczcQf8Gvd+
         ZpwdWfVvh8Eh/9e8eI5LAfeyXj/NgU2poFU0ejbvdi85Pf0CrsCOlbG8j4ppz+pi0ZQ6
         17G4LZoZB4xDR75TDlSVbOM+hRHWKP84xZilIlLH1/SPWnUneqMwis7uVi/w/GIxzdpq
         kHlnQ2Qns0uI8njaqGz/vAvRRw2yqmOc2mYaiIRwzxsG1jTZ6/vzrsGkVYKXcjqtTxik
         3yQ6pCzJx3PCsYRoSSzKUcURjok10+zwA8/1B2WlwAFoyWLOCUCEXTxP2PoMpLdXwYX4
         PJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792373153; x=1792977953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DSfuGuXiQE3/PgnWB5NySCEqOJab79pGf9ZzrORjUw=;
        b=jXE40eQRf23UXBujsXppXaQM8aJBx558ToZkvxjFWA0bPR2aoiM46DkQRgXJWXXb0D
         3rzv2UxXVKXObL9jx7UiWlJ+VWAWR8/PyHfFGkTTqe83tE5ZX3URuPS32nsL63FGchD2
         oTRiCD4c2FoO27QH72WFklC29ugMAmcESALovKzH92rh3k0YqOfR8ase+wNSzGhANAnP
         fdaQTgGuokjumJaiSQUqrAoJatd9dEth5RhDF4Q7twudjbIF5vJAPtRRMGr4DNRM10Ws
         BV+f3mef0raMv+dEYNr764BN9p9x0OpsCt1Di2mEtatbHEXOrR0kc1mSubY/+/x/0e28
         QBfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAxv0yfM4PDxB0q8267K9Pppou7+QlVIVSX7qGMfHEyLR/Z9gDn9ykDKK9Vs38OfqzC7u67u4SvDk8UKQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsFnRW3EGFx3MdAgk+63kAjtHo0OmxqhJvb4LyFH7OsSTsxuEc
	QBowY2oLGlNQbGGfqzRZIByCp6CM7J6DYYvzytdmYZfbuKRC4DBFCk7NuIOuZQzBd9k=
X-Gm-Gg: AYBFou2XGejcsSR7jPYeMiwBsof71//0Xz/rux9LARE+00kAJ5smiRrJ/6t1OBYf/J6
	MTNqqcc7E4k7ArsxWQX6CQEIDvHHnPpPOVTgSPTwpybmnnNyNrwOLBcgAzBhorrVlv3K8lp2Btw
	qzeXPQOo01eoZOgk2oCpnFi/RkOSiYnRryIi+EoXm7uNIo/5O2MflsE58JalkL5O7muPc3OKdya
	ROklfYrKGorXjU0fSa44gaaTi+joJoYycNKAxhYJI7ygjbDrapY9GL8EYzk68YoTgO6Xhey/JAt
	s0bbKK1vCpsvgr7JJbKgKOS8TYli71QfMj3D+lHzc2xsYrFEmSXcv5HLVRcb/WbY0/AO/jBlhdb
	fh1ngQWsvm2V6Hafm+FVDJ+3cvDZ13zf9j3JwWZRaZLul8db7FYN22kMCLKCSmzH8p1wcdjco//
	SEhCJBQ/KUO5TgzpkG1wPIS2SbJN8s16yVv8g57gFObfSlMvD9MHcVl6Jk1bn3kvXahbojWindn
	XcA2/bRTu9yBkQp88uSho5Xe/94/SSm7GAs9dGYBXPQwMXA7yIvsEltCNAlkTHHNrsPbbOqjzBz
	ZKjR9WjlLzzixRkEUw==
X-Received: by 2002:a05:6a00:2355:b0:89f:2b65:2a1 with SMTP id d2e1a72fcca58-8a04b80bd93mr3056691b3a.8.1792373153272;
        Sun, 18 Oct 2026 18:25:53 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fcd67cf30sm2731309b3a.17.2026.10.18.18.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:25:52 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v12 0/2] iio: osf: add KUnit coverage
Date: Mon, 19 Oct 2026 10:24:45 +0900
Message-ID: <cover.1792372045.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jonathan asked for the updated KUnit patches, replacing the two pending
v11 test patches. The six v11 production patches are already applied and
are not included again. This KUnit-only v12 maps patch 1/2 to v11 7/8 and
patch 2/2 to v11 8/8. The separately submitted kfifo RAW-cache fix is not
part of this series.

Allow tests in the existing OSF composite when the driver is a module,
without exporting internal symbols or creating a separate test module.
The supported configurations are OSF=y/KUNIT=y/TEST=y,
OSF=m/KUNIT=y/TEST=y and OSF=m/KUNIT=m/TEST=y. Add deferred mutex cleanup
for pending sessions, receive serialization and IIO fixtures, and require
producer/configuration handshakes before checking concurrent state.

The unchanged OSF/test sources previously passed all 16 core and 2 IIO
cases, GCC and Clang W=1 builds, KASAN, lockdep and debug mutex checks.
Actual module load/run/unload validation covered built-in and modular
KUnit. With built-in KUnit, 200 production and 200 test-module reloads
exercised 20,000 buffer toggles; modular KUnit completed 20 of each reload
and 2,000 toggles. Local assertion-abort validation checked seven cleanup
paths. These are reused results for identical sources, not new v12 runs.
Existing upstream compiler warnings are retained in the validation logs.

The immutable signed commits retain the original IIO testing snapshot:
6a27f3a7d1063aec5aa3d9370161e850fc3a85dd
Runtime unregister concurrency validation used that base plus mainline
commit 84bb0fc46ccf6a545b8fdf57cda83770186ed8dd
("iio: buffer: serialize buffer teardown with mode claims"). The fix is
a runtime prerequisite, not a patch in this series.

Current IIO testing, fetched for this preparation, is:
19c5db3507633edc21b4172d99f573c2dfbf42b1
Its rewritten OSF commits have identical patch IDs and OSF source blobs,
and it now contains 84bb0fc46ccf. Both patches apply cleanly there as well
as to the original base, with unchanged OSF/test content. The base-commit
below deliberately identifies the original signed series base; the new
testing application check is not a claim of a fresh kernel runtime run.

Previous patches, now marked superseded in Patchwork:
https://lore.kernel.org/linux-iio/20261011231340.42885-8-kimjinseob88@gmail.com/
https://lore.kernel.org/linux-iio/20261011231340.42885-9-kimjinseob88@gmail.com/

Jonathan's request for updated patches:
https://lore.kernel.org/linux-iio/20261018190454.054d3385@jic23-hlaptop/

Changes since v11:
- Send only the two replacement tests; omit the six applied driver patches.
- Allow the supported composite module configurations with a bool selector.
- Add deferred destruction for pending-session, receive and IIO mutexes.
- Strengthen producer/configuration worker entry synchronization.
- Document the IIO core unregister prerequisite and validation base split.

Jinseob Kim (2):
  iio: osf: add core KUnit tests
  iio: osf: add IIO KUnit tests

 drivers/iio/sensorhubs/osf/Kconfig         |   16 +
 drivers/iio/sensorhubs/osf/Makefile        |    1 +
 drivers/iio/sensorhubs/osf/osf_core_test.c | 1064 ++++++++++++++++++++
 drivers/iio/sensorhubs/osf/osf_iio_test.c  |  395 ++++++++
 4 files changed, 1476 insertions(+)
 create mode 100644 drivers/iio/sensorhubs/osf/osf_core_test.c
 create mode 100644 drivers/iio/sensorhubs/osf/osf_iio_test.c


base-commit: 6a27f3a7d1063aec5aa3d9370161e850fc3a85dd

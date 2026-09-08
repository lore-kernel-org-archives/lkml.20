Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3824F4FC8D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869020; cv=none; b=l538aiz+6fugeeM+hIPnxJ4dVhNMe1i7m7HPJC9q0/uLeAsyiryf+W9jqxX9cNj0SovTqS8tvCnCOZltIsjWUTigdJZ+pylPY5XOVgY0yTcvPUnsd4bHR5hgn1BIaEsXwWqwI6l+4QwObVceGQSCC5AToGihDzqcP70BTD9hLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869020; c=relaxed/simple;
	bh=+ea3yYnkWvkYggstAtARXqN3w6KyrKQX3QazvOPZjRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2CD2XS8bx/7R8LLEK5XTdCvOyL7/qC48j4kRRJKRm2tMPVqfHi3ECGviVaVk7nM2vq8Ksh2PwVOS959yh9H4AgZ2NANHBi0tyvyLB2W1ZJ3l0mBCY4UimwJi6fReK7CPTm+C8JdM5IoWkGAlubwLB+QXVQNFpOlGrmtng1oEp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NXGWoYsh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NXGWoYsh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so45734185e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788869015; x=1789473815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=487eRbWP9lyEU/S8kmCpSA9mRITwOfBc17qyoaa0o10=;
        b=NXGWoYsh+I7RR8u52Hc0QMYO0PZPvZLYmyTNkLrQu15Cyult60KzvTgXyMDtwCPNFI
         BkS+OH10pWUxW7tGFVL/dNMYVjAsB0kd/48sJz4H7GnZD46PyubPQ8oxrL3MhkyoCap4
         mLmCKpik4D0Jz9M7Q94a84HzdtTEoPgnzEOmiTJxDQ52iSZAJV0K42767BsyT1M+AEcW
         ebB7n42uoMqlUSeH7lmsY5MY4LAHZMpoToj5MvDNd2A12u92tKP2THTQfElbXKRpbeup
         MAg1wOI9D2lhB9yhsV4rjktZS+WPk/IkH13vkurml/U1e2oYxq/FQKijKzG4/P9u7T/2
         jbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869015; x=1789473815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=487eRbWP9lyEU/S8kmCpSA9mRITwOfBc17qyoaa0o10=;
        b=NFdEYvRDXghgdc0lW2Gj4ZQfUg3Nrx+1HMwXP4BxgDpwPvIqXQ5mBaCp0o1R7UCKLA
         OJHGoAa2+VveOsmRDdS2dFhvencBF0Soojbs5EbOi14qhQuy0m5V6gN8FB7MiQsGJxUE
         WdCGRGpFb3jxdAw42QKy3xXceqDsY9dRDO8pTcXuJSM0ID5R89xNmDrA6KmPiLlWuvwA
         9F7mdAEyP5kTxCD4MfSexquMjTlhQ5NxDXvw106lIj4t53/RRAlIIUy4GtztrJ68y33c
         MX0xbhftSaiZvPV0n/DsNY8PcS1xQepUdLhgdbZYrTLdOWg5DcxahnKO9NbpQPZfUaSc
         5cjw==
X-Forwarded-Encrypted: i=1; AKwUvBwjEkBCf6Bngamn3GtM/7O+0Dmu+evk/PwTOsQAXIoONzNs1JX5uGw7wNkVh11VQ0lbVuhvJqYY57kM3bw=@vger.kernel.org
X-Gm-Message-State: AFuF++mN6HUzpjVpH+LZn47CXrdY2z4rKGxZ1DPdIWV+X9OMhWlIJe4k
	C4WUvDncEvdd3RIKwQMZHqbmOmCBeqqzCWjsx5yiF6Te40CG3vWyRm+0ZQoLS3iK46s=
X-Gm-Gg: AYBFou1Gt3aKOV1ZByf657uFeUTjc1axrH61QZz5zCNRRUmoM/a1L+qb+E+OEFQvB0M
	+/SOXVO36R3iFOl0wbd75T5wgBSDcIcmRcSRYFTND99LB5YOf4VM8S+EA6dcmy8UocYuzKnUeB+
	x/PEmqIIQ9HVdrbS/GDi/XwSowgn5H9p7mgILYxyHEz5KLOLkSnz5ZCcyyMK90ndYb1/ZUunM3q
	dtbd/Pv2eda2pceUtTmsn5//P07B8aWYjd0rGX/Q8EPBgDdSW3SEOjMZpxnMTkoPsZpZ7vgW9Z/
	o/GjryxAnFsYQbeoHySSsV0j/hhI17eUst7itxNZNB8sR7JxrGuUAYCj9oVhJY/PZkKp+9dNeBS
	OrPAIWCh/nPpzFvkORvwtRJsMtmr0kx8P7RoA/C7aQceVtTbUGfWipqr4bUQBsCTHQhXDVwqUrT
	6awgeOv7zBuVD2gu1KvdAcuEQ4qfgm7WkIhBDvPQ0XUGkwgcVnZX8=
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr190553905e9.14.1788869014574;
        Tue, 08 Sep 2026 05:03:34 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm35538164f8f.14.2026.09.08.05.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:03:33 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>,
	jpoimboe@kernel.org,
	mbenes@suse.cz,
	joe.lawrence@redhat.com
Cc: jikos@kernel.org,
	live-patching@vger.kernel.org,
	shuah@kernel.org,
	song@kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 0/5] livepatch: Fail object initialization on duplicate patched function
Date: Tue,  8 Sep 2026 14:03:20 +0200
Message-ID: <20260908120325.299649-1-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v4 of the patch failing object initialization when it patches
the same underlying function twice through two aliased symbols
(functions sharing one address) in the same object.

Changes against [v3]:

  + Add selftest for livepatching aliased symbols [Song, Harry]

  + Only partially revert relocations when failing inside
    klp_apply_object_relocs() [Sashiko]

  + Cleanup changes made by klp_init_object_loaded() for failing
    patch on another failures in klp_module_coming() [Sashiko]

Changes against [v2]:

  + Clarify comments and the commit message [Miroslav]

  + Cleanup when klp_init_object_loaded() fails [Sashiko]


[v2] https://lore.kernel.org/r/20260823060734.58443-1-x90613@gmail.com
[v3] https://lore.kernel.org/r/20260830173343.52759-1-x90613@gmail.com


Harry Hsu (2):
  livepatch: Fail object initialization on duplicate patched function
  selftests/livepatch: Test rejection of aliased symbols in one object

Petr Mladek (3):
  livepatch: Move code for updating livepatch object relocations
  livepatch: Clear relocations when klp_apply_object_relocs() fails
  livepatch: Clean up klp_init_object_loaded() when fails

 kernel/livepatch/core.c                       | 137 ++++++++++++------
 tools/testing/selftests/livepatch/Makefile    |   3 +-
 .../testing/selftests/livepatch/test-alias.sh |  81 +++++++++++
 .../selftests/livepatch/test_modules/Makefile |   4 +-
 .../test_modules/test_klp_alias_patch.c       |  62 ++++++++
 .../test_modules/test_klp_alias_target.c      |  48 ++++++
 6 files changed, 285 insertions(+), 50 deletions(-)
 create mode 100755 tools/testing/selftests/livepatch/test-alias.sh
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_alias_patch.c
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_alias_target.c

-- 
2.55.0


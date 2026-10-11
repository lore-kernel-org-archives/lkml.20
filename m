Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78A35E956
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791756338; cv=none; b=J96+PC5IDhCzHlpyIYuwoHoOK8EPF0BcYqzdn27RfitgwAL1Ln+BX7YVIZFfwxQSFyClgFTzi2gt0KkyPkLERHgPK3obyEhQUbUjYBkJDTgEH1izPGyb/asDG00maLW1AycR2dKwXmSajBJAl0B0SmdlW3/akQDG6d375M3W6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791756338; c=relaxed/simple;
	bh=No2YuVut+yvKVP4Gc3VbjZiY6kYBHQiFWeVJHG5ZJ+A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fPmHxfLSIWFgbQctH3xkhC1kxPBjBqb4RVHNRG6VLptCfqqeJk2Ae5oXYBwSH38w22RGZP/48luDfKDSWlzkBcvZe12u4WzPFp02Ib7WXZToYCnVwA9r/0vVVYRx+DthBxUV5UhpTowJzTu6vvkswk8lxyzvY3w8lXHr5dU7PKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSrFTuU7; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSrFTuU7"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a707f37eso20411436d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791756336; x=1792361136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=No2YuVut+yvKVP4Gc3VbjZiY6kYBHQiFWeVJHG5ZJ+A=;
        b=kSrFTuU7lwiFje4ypqm4qzHv5q1sIZbIFofOorZI3naKRnU0x8zdXczu+Bkx3G1/7w
         TYnhEfNjJFzHrR61U5shQTuJa44qbvWEY3WapUSuzXU9c9cbgUJZeMKcRNK5E/US+Hsv
         3e/ktzBalZBrG0BMS0aq/AIBVp/2zk3/SfjF6vTkbP5Rsm2WJmV7um0kel2dHqVkLFwC
         4gCN1XwRVY96rXv0si8O5dckUrLkBYeKYPRu3l63HUoAdPCDDTe9hELExqvHCGzjAZ17
         68c61XS1Xajaf4ZWBlTA85cI5nH28HuEze27lmZ7ltseEN0IllKfIlrWtjWdeL3jeDme
         xk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791756336; x=1792361136;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=No2YuVut+yvKVP4Gc3VbjZiY6kYBHQiFWeVJHG5ZJ+A=;
        b=uD22p2O28YKILZebS6ceSAFJxl+pQ8S4rfdWOK/pB2yMJuOn0wMWSWBIWjenOFFM0K
         8aczSbNYC2mMkNK2dFHtWkNlKPeMbQlwTWRA9MRsX1RrMZgiCc8HY+A5VIUFaV9BseEB
         Sbdmdm/IFbZARPOt64YvaX0JaAiiIrTBgbX0w7eq8duBkXnB59NDKXMKnxRw3JsUsgY8
         OsW5bHkwOqFS2tSVripzN40J27iyHOfYfqshtGrvgmSpjYJNdcr89oKsd5A/RcM17ps9
         LMDaFg0pNA3cv58jpDnS4yhkZ2o3lreardYHDuVRwGmc/kvwbf64X2rQOO4piDDJ1In7
         A0uw==
X-Forwarded-Encrypted: i=1; AKwUvBycJ2IERRNxH3CE7Ucega+RJ/7cPAVZfTxWuP1k4Gt71rVNkHWhH6h2BmS+7xd796feQLXXGo3SHTbrDHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUgEaMD9Mr00QFfx9+tKmnIk/mkNJMlsos6aD+Ky5N6N2mMqkl
	Y6al/yUfWQ1uLhRTPJwoNf/CtGwxuMphygSl1KhQHzYNCy9LEFvzZzY=
X-Gm-Gg: AYBFou0BeAv3mFj/g1sAUF896/dNd4imWr3nIkNQJU99mXE7qu8GxsWAoFVNe6JnoE5
	dY1hvT2UM9L2YKC+kY97Eq58wO13DRlusKncE5KRvXUVPVw6ll3Hiy+m+oD7I0TJSLQ1s+287yO
	Jit9aUtZbYh7bKZlg0w9+IJqMfohS9yXg448VyjhYygavYtFHngiDSGOjCKfDE05KFz4ELsvQwt
	8xgssBaBuxIFA1RUd3SlnK+89ArH678930k2l/RDJZTq8pxygUuPmpx/QaWqTA6RdefEHzIygph
	3e3BmxqKHLRK4byN8jDYnU9p3cmYp0HNFvLTPpxMau6yav9x3cgOEAcEBWa04Pr+z8Lb0E0qSa6
	0T/6kt8Z5FP41EQJNxuq55+2vA424CjK7I+3pqVgWN/qNYm0ZlA+jgF5BnAu+L1DqujJZOiYvJW
	638gueHsnuiUj+paT2HTin4JGGiJ6szQ3v7tfMR3302aDq3yW/034Z8ymhTrTwG9Ty366/6r5Eb
	HIvLME1AcQj3Oiwn29wqOtGKlMFsKvW/mytxXhpf7uj1HjWFMi5PqRIGK20/VuRsug0vfC4uJlL
	VYxkJlhgGFKK6gqi/n8WEe1qk88cuYtNjzLxpWM=
X-Received: by 2002:a05:6214:5d08:b0:917:a256:c151 with SMTP id 6a1803df08f44-91b557c63f4mr151810126d6.45.1791756335963;
        Sun, 11 Oct 2026 15:05:35 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e7f6a1sm79788786d6.6.2026.10.11.15.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:05:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 0/2] HID: intel-thc-hid: quiesce interrupts before final teardown
Date: Sun, 11 Oct 2026 18:05:29 -0400
Message-ID: <20261011220531.2073892-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QuickSPI and QuickI2C can tear down HID/DMA resources while IRQ handlers
are still running. Stop new IRQ handling, wait for running handlers,
then drain recovery work and mask THC interrupts before final teardown.

This series covers remove, probe unwind and shutdown.

GCC 15.2.0 x86_64 W=1 builds, strict checkpatch and patch application
checks passed. No hardware runtime testing.

Base: 238650ef6c7c7cca08e032527329424c9fbd70e5

1. HID: intel-thc-hid: quickspi: quiesce IRQs during teardown
2. HID: intel-thc-hid: quicki2c: quiesce IRQs during teardown

Assisted-by: LLM
